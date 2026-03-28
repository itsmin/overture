#!/bin/bash
# Session Start Hook — Overture Template
#
# Customize the PROJECT CONFIG section, then register in settings.local.json.
# Output: JSON to stdout (Claude Code context). Human-readable to stderr.
#
# See templates/hooks/README.md for setup instructions.

set +e  # Don't exit on errors — health checks can fail gracefully

# === PROJECT CONFIG ===
# Customize these for your project.

PROJECT_NAME="[project]"
PROJECT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"

# Health check URL (comment out if no deployment to check)
# HEALTH_URL="https://your-app.example.com/api/health"
# HEALTH_TIMEOUT=5

# Memory check URL (comment out if not applicable — e.g., Fly.io /api/health/memory)
# MEMORY_URL="https://your-app.example.com/api/health/memory"
# MEMORY_WARN_MB=400
# MEMORY_HIGH_MB=500

# TypeScript check (comment out if not applicable)
# TYPECHECK_CMD="npm run typecheck"
# TYPECHECK_TIMEOUT=15

# Documentation files to check for staleness (space-separated paths relative to PROJECT_ROOT)
# DOCS_TO_CHECK="docs/ARCHITECTURE.md docs/BUSINESS.md"
# DOCS_STALE_DAYS=7

# Domain-specific checks (comment out blocks you don't need)
# DB_COUNT_CMD="jq '.entities | length' data/registry.json"  # Entity/record count
# QUEUE_CMD="psql -c 'SELECT count(*) FROM pending_items'"    # Queue depth
# CI_CMD="gh run list --workflow=daily-refresh.yml -L 1"       # Last CI run

# Session marker (for session-end comparison)
SESSION_MARKER="$PROJECT_ROOT/.session_start"

# === END CONFIG ===

CONTEXT=""

add_context() {
    CONTEXT="${CONTEXT}${1}\n"
}

# --- Section 1: Git Status ---

BRANCH=$(cd "$PROJECT_ROOT" && git branch --show-current 2>/dev/null)
DIRTY_COUNT=$(cd "$PROJECT_ROOT" && git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
RECENT_COMMITS=$(cd "$PROJECT_ROOT" && git log --oneline -5 2>/dev/null)

add_context "## Git Status"
add_context "Branch: $BRANCH"
if [ "$DIRTY_COUNT" -gt 0 ]; then
    add_context "⚠️ $DIRTY_COUNT uncommitted changes"
fi
add_context ""
add_context "Recent commits:"
add_context "$RECENT_COMMITS"
add_context ""

# --- Section 2: Production Health (if configured) ---

if [ -n "$HEALTH_URL" ]; then
    HEALTH_RESPONSE=$(curl -s --max-time "${HEALTH_TIMEOUT:-5}" "$HEALTH_URL" 2>/dev/null)
    HEALTH_STATUS=$?

    add_context "## Production Health"
    if [ $HEALTH_STATUS -eq 0 ]; then
        STATUS=$(echo "$HEALTH_RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('status','unknown'))" 2>/dev/null || echo "responded")
        add_context "Status: $STATUS"
    else
        add_context "⚠️ Health check failed (unreachable or timeout)"
    fi

    # Memory check (if configured)
    if [ -n "$MEMORY_URL" ]; then
        MEM_RESPONSE=$(curl -s --max-time "${HEALTH_TIMEOUT:-5}" "$MEMORY_URL" 2>/dev/null)
        if [ $? -eq 0 ]; then
            MEM_MB=$(echo "$MEM_RESPONSE" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('rssMB', d.get('rss_mb', d.get('memory_mb', '?'))))" 2>/dev/null || echo "?")
            if [ "$MEM_MB" != "?" ]; then
                if [ "$MEM_MB" -gt "${MEMORY_HIGH_MB:-500}" ] 2>/dev/null; then
                    add_context "⚠️ Memory: ${MEM_MB}MB (HIGH — investigate)"
                elif [ "$MEM_MB" -gt "${MEMORY_WARN_MB:-400}" ] 2>/dev/null; then
                    add_context "Memory: ${MEM_MB}MB (elevated)"
                else
                    add_context "Memory: ${MEM_MB}MB"
                fi
            fi
        fi
    fi
    add_context ""
fi

# --- Section 3: TypeScript / Lint Check (if configured) ---

if [ -n "$TYPECHECK_CMD" ]; then
    add_context "## Type Check"
    TYPECHECK_OUTPUT=$(cd "$PROJECT_ROOT" && timeout "${TYPECHECK_TIMEOUT:-15}" $TYPECHECK_CMD 2>&1)
    TYPECHECK_STATUS=$?

    if [ $TYPECHECK_STATUS -eq 0 ]; then
        add_context "Passing"
    elif [ $TYPECHECK_STATUS -eq 124 ]; then
        add_context "⚠️ Timed out (${TYPECHECK_TIMEOUT:-15}s)"
    else
        ERROR_COUNT=$(echo "$TYPECHECK_OUTPUT" | grep -c "error TS" 2>/dev/null || echo "?")
        add_context "⚠️ $ERROR_COUNT errors"
        add_context "$(echo "$TYPECHECK_OUTPUT" | tail -5)"
    fi
    add_context ""
fi

# --- Section 4: Documentation Staleness (if configured) ---

if [ -n "$DOCS_TO_CHECK" ]; then
    STALE_FOUND=0
    STALE_LIST=""
    for DOC in $DOCS_TO_CHECK; do
        DOC_PATH="$PROJECT_ROOT/$DOC"
        if [ -f "$DOC_PATH" ]; then
            if [ "$(uname)" = "Darwin" ]; then
                MOD_EPOCH=$(stat -f "%m" "$DOC_PATH" 2>/dev/null)
            else
                MOD_EPOCH=$(stat -c "%Y" "$DOC_PATH" 2>/dev/null)
            fi
            NOW_EPOCH=$(date +%s)
            AGE_DAYS=$(( (NOW_EPOCH - MOD_EPOCH) / 86400 ))
            if [ "$AGE_DAYS" -gt "${DOCS_STALE_DAYS:-7}" ]; then
                STALE_FOUND=1
                STALE_LIST="${STALE_LIST}  - ${DOC} (${AGE_DAYS} days)\n"
            fi
        fi
    done

    if [ "$STALE_FOUND" -eq 1 ]; then
        add_context "## Documentation Staleness"
        add_context "$(echo -e "$STALE_LIST")"
        add_context ""
    fi
fi

# --- Section 5: Domain-Specific Checks (if configured) ---

DOMAIN_CONTEXT=""

if [ -n "$DB_COUNT_CMD" ]; then
    COUNT=$(cd "$PROJECT_ROOT" && eval "$DB_COUNT_CMD" 2>/dev/null | tr -d ' \n')
    if [ -n "$COUNT" ]; then
        DOMAIN_CONTEXT="${DOMAIN_CONTEXT}  - Records: ${COUNT}\n"
    fi
fi

if [ -n "$QUEUE_CMD" ]; then
    DEPTH=$(cd "$PROJECT_ROOT" && eval "$QUEUE_CMD" 2>/dev/null | tr -d ' \n')
    if [ -n "$DEPTH" ] && [ "$DEPTH" != "0" ]; then
        DOMAIN_CONTEXT="${DOMAIN_CONTEXT}  - Queue depth: ${DEPTH}\n"
    fi
fi

if [ -n "$CI_CMD" ]; then
    CI_STATUS=$(cd "$PROJECT_ROOT" && eval "$CI_CMD" 2>/dev/null | head -1)
    if [ -n "$CI_STATUS" ]; then
        DOMAIN_CONTEXT="${DOMAIN_CONTEXT}  - Last CI: ${CI_STATUS}\n"
    fi
fi

if [ -n "$DOMAIN_CONTEXT" ]; then
    add_context "## Domain Status"
    add_context "$(echo -e "$DOMAIN_CONTEXT")"
    add_context ""
fi

# --- Section 6: CLAUDE.md Context ---

if [ -f "$CLAUDE_MD" ]; then
    add_context "## Documentation Status"

    # Last modified
    LAST_MOD=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$CLAUDE_MD" 2>/dev/null || stat -c "%y" "$CLAUDE_MD" 2>/dev/null | cut -d. -f1)
    add_context "CLAUDE.md last modified: $LAST_MOD"

    # Character count
    CHAR_COUNT=$(wc -c < "$CLAUDE_MD" | tr -d ' ')
    if [ "$CHAR_COUNT" -gt 35000 ]; then
        add_context "⚠️ CLAUDE.md is ${CHAR_COUNT} chars (over 35k — archive needed)"
    elif [ "$CHAR_COUNT" -gt 30000 ]; then
        add_context "CLAUDE.md: ${CHAR_COUNT} chars (approaching limit)"
    fi

    # Session progress
    SESSION_INFO=$(grep -A 3 "^## SESSION PROGRESS" "$CLAUDE_MD" 2>/dev/null | head -5)
    if [ -n "$SESSION_INFO" ]; then
        add_context ""
        add_context "$SESSION_INFO"
    fi

    # NEXT pointer
    NEXT_LINE=$(grep -i "next" "$CLAUDE_MD" 2>/dev/null | grep -i "session\|priority\|:" | head -1)
    if [ -n "$NEXT_LINE" ]; then
        add_context ""
        add_context "**NEXT**: $NEXT_LINE"
    fi
fi

add_context ""

# --- Create session marker ---

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$SESSION_MARKER" 2>/dev/null

# --- Output ---

# Escape for JSON
ESCAPED_CONTEXT=$(echo -e "$CONTEXT" | python3 -c "import sys,json; print(json.dumps(sys.stdin.read()))" 2>/dev/null)

if [ -n "$ESCAPED_CONTEXT" ]; then
    echo "{\"hookSpecificOutput\":{\"hookEventName\":\"SessionStart\",\"additionalContext\":${ESCAPED_CONTEXT}}}"
else
    # Fallback: output to stderr if JSON encoding fails
    echo -e "$CONTEXT" >&2
fi
