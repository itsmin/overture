#!/bin/bash
# Session End Hook — Overture Template
#
# Customize the PROJECT CONFIG section, then register in settings.local.json.
# Output: All to stderr (visible to user). No JSON output.
#
# See templates/hooks/README.md for setup instructions.

set +e  # Don't exit on errors

# === PROJECT CONFIG ===

PROJECT_NAME="[project]"
PROJECT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"
SESSION_MARKER="$PROJECT_ROOT/.session_start"
STATS_LOG="$PROJECT_ROOT/.claude/session-stats.log"

# Size thresholds (characters) — see patterns/Size-Management.md for profiles
SIZE_GREEN=30000
SIZE_YELLOW=35000

# TypeScript check (comment out if not applicable)
# TYPECHECK_CMD="npm run typecheck"

# Documentation files to check (space-separated, relative to PROJECT_ROOT)
# DOCS_TO_CHECK="docs/ARCHITECTURE.md docs/BUSINESS.md"

# Root directory file organization check — list expected .md files in root
# Only these should exist at root level (flag strays)
# ROOT_EXPECTED_MD="CLAUDE.md README.md"

# === END CONFIG ===

WARNINGS=0

warn() {
    echo "⚠️  $1" >&2
    WARNINGS=$((WARNINGS + 1))
}

info() {
    echo "   $1" >&2
}

section() {
    echo "" >&2
    echo "── $1 ──" >&2
}

# --- Section 1: Documentation Hygiene ---

section "Documentation"

if [ -f "$CLAUDE_MD" ] && [ -f "$SESSION_MARKER" ]; then
    if [ "$CLAUDE_MD" -nt "$SESSION_MARKER" ]; then
        info "CLAUDE.md was updated this session"
    else
        warn "CLAUDE.md was NOT updated this session"
        info "Remember to update: Session Progress, Work Queue, Session History"
    fi
fi

# --- Section 2: Size Check ---

if [ -f "$CLAUDE_MD" ]; then
    CHAR_COUNT=$(wc -c < "$CLAUDE_MD" | tr -d ' ')

    if [ "$CHAR_COUNT" -gt "$SIZE_YELLOW" ]; then
        warn "CLAUDE.md is ${CHAR_COUNT} chars (RED — archive NOW before next session)"
        info "Target: under ${SIZE_GREEN} chars after pruning"
    elif [ "$CHAR_COUNT" -gt "$SIZE_GREEN" ]; then
        info "CLAUDE.md: ${CHAR_COUNT} chars (YELLOW — archive soon)"
    else
        info "CLAUDE.md: ${CHAR_COUNT} chars"
    fi
fi

# --- Section 3: Documentation File Checks (if configured) ---

if [ -n "$DOCS_TO_CHECK" ]; then
    for DOC in $DOCS_TO_CHECK; do
        DOC_PATH="$PROJECT_ROOT/$DOC"
        if [ -f "$DOC_PATH" ] && [ -f "$SESSION_MARKER" ] && [ "$DOC_PATH" -nt "$SESSION_MARKER" ]; then
            info "$(basename "$DOC") was modified — verify content is current"
        fi
    done
fi

# --- Section 3b: File Organization (if configured) ---

if [ -n "$ROOT_EXPECTED_MD" ]; then
    STRAY_MD=$(cd "$PROJECT_ROOT" && ls -1 *.md 2>/dev/null | while read f; do
        EXPECTED=0
        for E in $ROOT_EXPECTED_MD; do
            [ "$f" = "$E" ] && EXPECTED=1
        done
        [ "$EXPECTED" -eq 0 ] && echo "$f"
    done)
    if [ -n "$STRAY_MD" ]; then
        warn "Stray .md files in root — move to docs/:"
        echo "$STRAY_MD" | while read f; do info "  $f"; done
    fi
fi

# --- Section 4: Git Status ---

section "Git"

DIRTY_COUNT=$(cd "$PROJECT_ROOT" && git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
if [ "$DIRTY_COUNT" -gt 0 ]; then
    warn "$DIRTY_COUNT uncommitted changes"
    cd "$PROJECT_ROOT" && git status --porcelain 2>/dev/null | head -8 >&2
    TOTAL=$(cd "$PROJECT_ROOT" && git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    if [ "$TOTAL" -gt 8 ]; then
        info "...and $((TOTAL - 8)) more"
    fi
else
    info "Working tree clean"
fi

# Check unpushed commits
AHEAD=$(cd "$PROJECT_ROOT" && git rev-list --count @{upstream}..HEAD 2>/dev/null || echo "0")
if [ "$AHEAD" -gt 0 ]; then
    warn "$AHEAD unpushed commits — consider pushing"
fi

# --- Section 5: TypeScript / Lint Check (if configured) ---

if [ -n "$TYPECHECK_CMD" ]; then
    section "Type Check"
    TYPECHECK_OUTPUT=$(cd "$PROJECT_ROOT" && timeout 15 $TYPECHECK_CMD 2>&1)
    if [ $? -eq 0 ]; then
        info "Passing"
    else
        warn "TypeScript errors — do not deploy without fixing"
        echo "$TYPECHECK_OUTPUT" | tail -3 >&2
    fi
fi

# --- Section 6: Summary ---

section "Session End"

if [ "$WARNINGS" -eq 0 ]; then
    echo "Safe to end session" >&2
else
    echo "⚠️  $WARNINGS warnings — review before ending" >&2
fi

echo "" >&2

# --- Section 7: Session Statistics ---

if [ -n "$STATS_LOG" ]; then
    mkdir -p "$(dirname "$STATS_LOG")" 2>/dev/null
    cat >> "$STATS_LOG" 2>/dev/null <<STATS
---
Session End: $(date -u +%Y-%m-%dT%H:%M:%SZ)
Git Status: $DIRTY_COUNT changes
Warnings: $WARNINGS
---
STATS
fi

# --- Cleanup ---

rm -f "$SESSION_MARKER" 2>/dev/null

# Exit cleanly
exit 0
