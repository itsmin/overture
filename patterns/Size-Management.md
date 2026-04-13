# CLAUDE.md Size Management

**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Workflow Framework](../workflow/Claude-Code-Workflow-Framework.md) — Decay section

> **Audience**: You — read this when your CLAUDE.md starts feeling heavy. Claude doesn't read this file directly.

---

CLAUDE.md is the session state machine. It grows every session. Without pruning, it bloats past what's useful as context.

---

## Thresholds

Thresholds vary by project complexity. Larger projects with more domain sections, metrics tables, and integration surfaces need more room. Smaller projects should stay tighter.

| Profile | GREEN | YELLOW | RED | Suited for |
|---------|-------|--------|-----|------------|
| **Standard** | <30k | 30k-35k | >35k | Most projects. Content sites, tools, services. |
| **Large** | <34k | 34k-37k | >37k | Complex products with domain sections, extensive metrics, multi-contract coordination. |
| **Coordination** | <30k | 30k-35k | >35k | Coordination sessions (e.g., Choral). No code, contract-heavy, cross-project narrative. |

Pick the profile that fits. New projects start with Standard and graduate if needed. Coordination sessions use the Coordination profile from day one — they accumulate differently than code projects.

The principle: CLAUDE.md must stay useful as context, not become a liability. If you're spending more time archiving than working, your thresholds are too tight. If session-start feels sluggish reading the file, they're too loose.

---

## Coordination Session Notes

Coordination sessions (Choral profile) accumulate differently than code projects — cross-project narrative, recommendation specs, and observation histories instead of code changes. Key differences:

**Multi-file archives**: Instead of a single archive file, organize by content type:
- `contracts/archive/sessions.md` — verbatim session entries
- `contracts/archive/recommendations.md` — completed recommendation specs
- `contracts/archive/observations.md` — resolved observations

**Contract hygiene**: The shared contract is read by every participating session. Keep it under a target line count (e.g., 300 lines). Archive completed recommendations, resolved blockers, and finished implementation status entries. Retain one-line summaries in a COMPLETE table for reference.

**Entry discipline is critical**: Coordination sessions tend toward longer entries because they describe recommendations and cross-project interactions. The 8-line max per session entry matters more here — each entry is loaded into 3+ actors' context windows.

---

## What to Archive

### Session entries
Most of the growth. Keep last 5-10 sessions inline with full detail. Compress older sessions:
- Sessions 11-20: One-line key outcomes (under 120 chars each)
- Sessions 21+: Collapse into a single summary row or archive file

### COMPLETE (Recent) table
Keep last ~10 entries. Replace older with: `- *...and N earlier sessions (#X-#Y)*`

### Resolved items
- DEFERRED items with Status = DONE — remove (they're complete, not deferred)
- Resolved blockers — remove
- Completed implementation status — archive one-line summary

---

## Session Entry Format

Max 8 lines per entry:
```
### Session #XX Complete ([Date])
[Brief title — what was the focus]
- [1-3 bullet points of what changed]
- **Deployment**: vXXX (if applicable)
```

Conciseness is not optional. Future sessions need the pattern, not the details.

---

## Archiving Protocol

1. Create archive file: `docs/sessions/SESSIONS_{first}_{last}_ARCHIVE.md`
2. Move old inline entries to archive (copy verbatim)
3. Replace inline blocks with reference: `**Sessions #XXW-#YYW**: See \`SESSIONS_{first}_{last}_ARCHIVE.md\``
4. Keep last 5-10 sessions inline
5. Trim COMPLETE (Recent) to last ~10
6. Verify final size under 30k characters (leaves ~5k buffer for next sessions)

---

## When to Check

- Session-end hook checks automatically (if hooks are set up — see `templates/hooks/`)
- Session-end command checks manually
- If you're adding a large session entry and the file feels heavy, check: `wc -c CLAUDE.md`

---

## Why This Matters

CLAUDE.md is loaded into every session's context. At 40k+ characters, it:
- Crowds out actual working context
- Makes session-start slower to process
- Contains mostly historical data that doesn't inform current work

Keep it lean. The archive exists for a reason.
