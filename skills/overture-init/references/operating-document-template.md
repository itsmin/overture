# [Project Name]

## PRODUCT STATUS

**[Project Name]** is [shipped / in development / prototype].

- **Stage**: [MVP / Soft Launch / Production / Prototype]
- **Users**: [Who uses this, how many, what stage of adoption]
- **Stack**: [Key technologies — language, framework, database, hosting]
- **Infrastructure**: [Where it runs, approximate monthly cost]

---

## COLLABORATION GUIDELINES

Universal working preferences in user-level preferences file.

**Project-Specific Guidelines**:
1. [Rule specific to this project]
2. [Another project-specific rule]
3. [Guidelines that encode lessons learned from past sessions]

---

## SESSION WORKFLOW

*This section is the project-specific runbook the session skills defer to. The default 8-step session-start and 12-step session-end workflows live in the skills themselves; this section adds, modifies, or removes steps when the project has specific needs. If empty, the generic skill workflow runs as-is.*

### At session-start:
0. Clean state — commit/push/deploy anything left from last session
1. Metrics validation (skip if no metrics table exists)
2. Project health (project-specific checks, e.g., build/typecheck/deploy)
3. Present deferred work
4. Check pending verifications
5. Cross-project coordination (if applicable)
6. Present work queue — NEXT pointer first, then full priorities
7. Alignment check

### During session:
- Stay aligned with work queue unless redirected
- Monitor context usage — find clean stopping points proactively
- Web search to validate approaches when uncertain

### Before session-end:
- Update Session Progress if mid-implementation
- Verify features end-to-end (not just "code looks correct")
- Documentation Sync Check
- Add bumped items to Deferred Work
- Plan next session with prioritized reasoning
- Commit changes if appropriate

---

## SESSION PROGRESS

*Rotating fields: Current, Status, and NEXT are rewritten at every session-end.
Anything that must survive more than one cycle lives in a durable structure
(UPCOMING SESSIONS, RESERVED SESSIONS, DEFERRED WORK), pointed at from here.*

**Current**: Session #1 pending
**Status**: Initial setup
**NEXT**: [Set by session-end — the #1 priority for the next session, stated specifically]
**Last queue hygiene**: Session #1

### Pending Verifications

---

## WORK QUEUE

*Durable sections: entries are curated item-wise and leave only by explicit
disposition (moved to COMPLETE, DEFERRED WORK, PARKING LOT, an archive, or a
doc), never by silent omission at session-end.*

### CURRENT PRIORITIES

**P1: [First Priority]**
- [Details, context, approach]

### UPCOMING SESSIONS

[Set by session-end — prioritized candidates with reasoning, not just titles. Each candidate gets a sub-bullet explaining why this order and what it unblocks.]

### COMPLETE (Recent)

| Feature | Session | Notes |
|---------|---------|-------|
| Initial setup | #1 | Operating document created |

### P2: FUTURE WORK

[Planned work that isn't the current priority]

### PARKING LOT

| Item | Reason |
|------|--------|
| *(none)* | |

---

## DEFERRED WORK

| Item | Originally From | Context |
|------|-----------------|---------|
| *(none yet)* | | |

---

<!-- Optional sections — uncomment as the project needs them:

## CURRENT METRICS
| Metric | Value | Source of Truth | Last Validated |
|--------|-------|-----------------|----------------|

## CRITICAL REMINDERS
1. [Hard rules that don't change]

## RESERVED SESSIONS
Add under WORK QUEUE when a future session beyond the next one is reserved with
written context. This block is DURABLE — the NEXT pointer is rewritten every
session-end, so pointers to future sessions live here, not there. Context docs
get full paths from the repo root.
| # | Session | Why | Context |
|---|---------|-----|---------|

## PRIVACY BOUNDARIES
| Data Source | Contains PII | Public Surface | Filtering |
|-------------|-------------|----------------|-----------|

## DEVELOPMENT WORKFLOW
[Build, test, deploy commands and conventions]

## DOCUMENTATION REFERENCE
| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|

## SESSION ARCHIVES
| Archive | Sessions | Period |
|---------|----------|--------|
-->
