# Session Hooks — Setup & Patterns

Level 3 of the Overture framework. Automates the health checks and hygiene reminders that session-start and session-end commands do manually.

Hooks don't replace the slash commands — they complement them. Commands handle the interactive parts (alignment, reconciliation, decisions). Hooks handle the mechanical parts (health checks, size warnings, git status).

> **Audience**: You — read this when your project is ready for automated session checks. Claude doesn't read this file directly.

---

## What Hooks Do

### session-start.sh
Runs automatically when Claude Code starts or resumes. Injects context:
- Git status and recent commits
- Production service health (if applicable)
- Key metrics snapshot (entity counts, deployment version, etc.)
- Documentation staleness warnings
- Current session progress and NEXT pointer from CLAUDE.md

### session-end.sh
Runs automatically when Claude Code session ends. Checks hygiene:
- Was CLAUDE.md updated this session?
- CLAUDE.md size check (character budget)
- Uncommitted changes warning
- Unpushed commits warning
- File organization check
- TypeScript/lint check (if applicable)
- Session statistics logging

---

## Setup

### 1. Copy and customize hook scripts

```bash
mkdir -p .claude/hooks
cp path/to/overture/templates/hooks/session-start.sh .claude/hooks/
cp path/to/overture/templates/hooks/session-end.sh .claude/hooks/
chmod +x .claude/hooks/session-start.sh .claude/hooks/session-end.sh
```

Customize the `# === PROJECT CONFIG ===` section at the top of each script.

### 2. Register hooks in settings.local.json

Add to `.claude/settings.local.json`:
```json
{
  "hooks": {
    "SessionStart": [
      {
        "type": "command",
        "command": "bash .claude/hooks/session-start.sh",
        "timeout": 30000
      }
    ],
    "SessionEnd": [
      {
        "type": "command",
        "command": "bash .claude/hooks/session-end.sh",
        "timeout": 30000
      }
    ]
  }
}
```

### 3. Add .session_start to .gitignore

The session-start hook creates a marker file for session-end to compare against:
```
.session_start
```

---

## Testing

```bash
# Test session-start hook
bash .claude/hooks/session-start.sh

# Test session-end hook
echo '{"terminationReason":"clear"}' | bash .claude/hooks/session-end.sh
```

---

## Specialization

The templates are starting points. Production projects specialize heavily — that's expected, not drift.

A mature SaaS product might have a 400+ line session-start hook checking deployment health, pipeline stages, source coverage, CI status, and document staleness with version extraction. A services product might check session directories, worker health, and type errors.

**The principle**: If you're checking something manually every session start, automate it into the hook.

**Output format matters**: session-start.sh uses JSON stdout (Claude Code context injection). session-end.sh uses stderr-only (visible to user, simpler). Both approaches work. JSON gives Claude the context directly; stderr requires Claude to read it from the terminal. Choose based on what your checks produce.

---

## Specialization Recipes

The template's config variables (`DB_COUNT_CMD`, `CI_CMD`, etc.) handle simple single-value checks. Production projects need more. These recipes show patterns extracted from real hooks — adapt, don't copy.

### Multi-Stage Pipeline Validation

When data flows through stages (raw → processed → deployed), checking one count isn't enough. Check counts at each stage and flag gaps.

```bash
# Example: entity pipeline (raw sources → compiled entities → deployed entities)
MASTER_COUNT=$(jq '.entities | length' data/registry.json 2>/dev/null || echo "0")
GENERATED_COUNT=$(ls data/generated/*.json 2>/dev/null | wc -l | tr -d ' ')
DEPLOYED_COUNT=$(curl -s "$HEALTH_URL/api/stats" | jq '.entityCount' 2>/dev/null || echo "?")

add_context "## Pipeline Status"
add_context "  Master: $MASTER_COUNT → Generated: $GENERATED_COUNT → Deployed: $DEPLOYED_COUNT"

# Gap detection
if [ "$MASTER_COUNT" != "$GENERATED_COUNT" ] 2>/dev/null; then
    add_context "⚠️ Generation gap: $((MASTER_COUNT - GENERATED_COUNT)) entities not generated"
fi
if [ "$DEPLOYED_COUNT" != "?" ] && [ "$GENERATED_COUNT" != "$DEPLOYED_COUNT" ] 2>/dev/null; then
    add_context "⚠️ Deployment gap: $((GENERATED_COUNT - DEPLOYED_COUNT)) entities not deployed"
fi
```

**When to use**: Any project with a data pipeline where "count at each stage" reveals health. Stops you from discovering stale deployments mid-session.

### Metadata-Based Review Tracking

File modification time tells you when a file was touched, not when its content was deliberately reviewed. For config files that need periodic human review, embed review dates in the file itself.

```bash
# Example: check lastReviewed field in a JSON config
if [ -f "config/sources.json" ]; then
    LAST_REVIEWED=$(jq -r '.metadata.lastReviewed // "never"' config/sources.json 2>/dev/null)
    if [ "$LAST_REVIEWED" != "never" ]; then
        REVIEW_EPOCH=$(date -j -f "%Y-%m-%d" "$LAST_REVIEWED" "+%s" 2>/dev/null)
        NOW_EPOCH=$(date +%s)
        DAYS_SINCE=$(( (NOW_EPOCH - REVIEW_EPOCH) / 86400 ))
        if [ "$DAYS_SINCE" -gt 14 ]; then
            add_context "⚠️ sources.json last reviewed ${DAYS_SINCE} days ago (review recommended)"
        fi
    fi
fi
```

**When to use**: Config files with curated content (RSS sources, feature flags, allowlists) that should be reviewed periodically regardless of code changes.

### Structured Document Extraction

Beyond checking if docs are stale — pull key metrics from structured documentation so the session starts with actual numbers, not "go read the docs."

```bash
# Example: extract version and key counts from Architecture.md
if [ -f "docs/ARCHITECTURE.md" ]; then
    ARCH_VERSION=$(grep -m1 "^## v" docs/ARCHITECTURE.md | sed 's/## //')
    ENDPOINT_COUNT=$(grep -c "^### \(GET\|POST\|PUT\|DELETE\)" docs/ARCHITECTURE.md 2>/dev/null || echo "?")
    add_context "Architecture: $ARCH_VERSION ($ENDPOINT_COUNT endpoints)"
fi

# Example: extract cost from Business.md
if [ -f "docs/BUSINESS.md" ]; then
    MONTHLY_COST=$(grep -i "monthly.*cost\|total.*cost" docs/BUSINESS.md | head -1 | grep -oE '\$[0-9.]+')
    if [ -n "$MONTHLY_COST" ]; then
        add_context "Monthly cost: $MONTHLY_COST"
    fi
fi
```

**When to use**: Projects with authoritative documentation files where key metrics are embedded in prose. Saves the first 5 minutes of every session.

### CI/Automation Status

The template's `CI_CMD` checks one workflow. Production projects have multiple automated workflows that can fail independently.

```bash
# Example: check multiple GitHub Actions workflows
for WORKFLOW in "daily-refresh" "deploy-production" "validation"; do
    LAST_RUN=$(gh run list --workflow="${WORKFLOW}.yml" -L 1 --json status,conclusion,createdAt \
        --jq '.[0] | "\(.conclusion // .status) (\(.createdAt | split("T")[0]))"' 2>/dev/null)
    if [ -n "$LAST_RUN" ]; then
        if echo "$LAST_RUN" | grep -q "failure"; then
            add_context "⚠️ ${WORKFLOW}: $LAST_RUN"
        else
            add_context "  ${WORKFLOW}: $LAST_RUN"
        fi
    fi
done
```

**When to use**: Projects with automated pipelines (daily refreshes, scheduled deploys, validation runs) where a silent failure can compound over days.

---

## What Stays Manual

Hooks automate mechanical checks. These still require the slash commands:
- Work queue reconciliation (interactive)
- Feature verification (judgment)
- Deferred work audit (interactive)
- Cross-project coordination decisions
- CLAUDE.md content updates
- Alignment check

---

## Notes

- Hooks output JSON to stdout for Claude Code context injection. Human-readable output goes to stderr.
- session-start.sh creates a marker file (`.session_start`) for session-end to compare against.
- session-end.sh logs statistics to `.claude/session-stats.log` for audit trail.
- All checks are non-blocking — warnings, not errors. A failed health check doesn't prevent the session.
- Timeouts: 30 seconds for session hooks, 5 seconds for edit hooks.
