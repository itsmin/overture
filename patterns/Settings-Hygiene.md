# Settings Hygiene

**Part of**: [Overture](../README.md) — the Claude Code working kit

> **Audience**: You — read this when setting up a new project or when your settings file is growing. Claude doesn't read this file directly.

---

## Two Layers

Claude Code settings operate at two levels:

### User-Level (`~/.claude/settings.json`)
Portfolio-wide permissions that every project needs. These cover cross-project coordination — the operations that happen in every session-start and session-end across all projects.

Example structure:
```json
{
  "permissions": {
    "allow": [
      "Read(/path/to/projects/*)",
      "Bash(git -C:*)",
      "Bash(some-cross-project-script.sh:*)"
    ]
  }
}
```

### Project-Level (`.claude/settings.local.json`)
Project-specific tools, deployment commands, and domain-scoped web access. These stay per-project because they reflect each project's unique stack.

```json
{
  "permissions": {
    "allow": [
      "Bash(git:*)",
      "Bash(npm:*)",
      "WebSearch"
    ]
  },
  "hooks": {
    "SessionStart": [...],
    "SessionEnd": [...]
  }
}
```

---

## Permission Organization

Group by capability for readability:

### Core Development
```json
"Bash(git:*)",
"Bash(npm:*)",
"Bash(npx tsc:*)",
"Bash(node:*)"
```

### Deployment
```json
"Bash(npx wrangler deploy:*)",
"Bash(fly deploy:*)"
```

### Database
```json
"Bash(npx wrangler d1 execute:*)",
"Bash(psql:*)"
```

### External APIs
```json
"WebSearch",
"WebFetch(github.com:*)",
"WebFetch(docs.example.com:*)"
```

### Patterns

- **Scope narrowly**: Allow specific commands, not `Bash(*)`. Wildcards within a command family (e.g., `Bash(git:*)`) are fine.
- **Domain-scope WebFetch**: Allow specific domains, not all URLs.
- **Environment variables for secrets**: Use `$API_TOKEN` in commands, not literal tokens. If a command with a literal token gets approved, the token is now in your settings file permanently.
- **Dangerous operations by absence**: Don't allow `git reset --hard`, `rm -rf`, or `git push --force` — their absence from the allow list is intentional.

---

## The Accumulation Problem

Over many sessions, `settings.local.json` accumulates one-off command approvals. A single "yes, allow this" persists the *entire command* — including any inline credentials, specific file paths, or session-specific arguments. After 100+ sessions, the file can have hundreds of entries, many containing:

- **Inline credentials** — API tokens, admin keys, account IDs baked into Bash commands
- **One-off commands** — Specific commit messages, specific curl payloads that will never run again
- **Redundant patterns** — 50 specific `curl` commands when `Bash(curl:*)` covers all of them

### Prevention

- **Environment variables for secrets**: Use `$API_TOKEN` in commands, not literal tokens.
- **Prefer broad patterns**: `Bash(curl:*)` over specific curl commands. `Bash(wrangler:*)` over per-subcommand entries.
- **Review before approving**: When Claude Code asks "allow this command?", consider whether the broad pattern is more useful than the specific command.

### Periodic Cleanup Protocol

**When to clean**: When `settings.local.json` exceeds ~50 permission entries, or during a natural session-end when touching settings.

**How to clean**:
1. **Credential scan** — Search for patterns that look like tokens, keys, or secrets. Replace commands containing inline credentials with environment-variable equivalents, or remove them entirely.
2. **Pattern consolidation** — Replace clusters of specific commands with broader patterns (e.g., 20 specific `wrangler d1 execute` commands → `Bash(wrangler d1 execute:*)`).
3. **Dead entry removal** — Remove commands that reference old paths, old API endpoints, or old project structures.
4. **One-off purge** — Remove specific commit messages, specific file paths from past sessions that will never repeat.

### Session-End Gate

The session-end hook template includes a lightweight size check. When `settings.local.json` exceeds 50 entries, it flags the file for review — not every session, just when it's growing.

---

## Notes

- `settings.local.json` is gitignored — it contains machine-specific paths and tokens.
- User-level settings cover cross-project coordination. Project-level settings cover project-specific tools.
- Start minimal. Add permissions as you need them, not preemptively.
