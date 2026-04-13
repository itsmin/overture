# [Project Name] — Documentation & Status

> **Audience**: Both — Claude reads this file automatically at every session start. You maintain it as your project evolves. This is the skeleton; the [Workflow Framework](../workflow/Claude-Code-Workflow-Framework.md) explains each section.

## PRODUCT STATUS

**[Project Name]** is [shipped / in development / prototype].

- **Stage**: [MVP / Soft Launch / Production / Prototype]
- **Users**: [Who uses this, how many, what stage of adoption]
- **Stack**: [Key technologies — language, framework, database, hosting]
- **Infrastructure**: [Where it runs, approximate monthly cost]

---

## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Project-Specific Guidelines**:
1. [Rule specific to this project]
2. [Another project-specific rule]
3. [Guidelines that encode lessons learned from past sessions]
4. **Impact radius on data/experience changes** (if applicable) — When modifying pipelines, transformers, or user-facing surfaces: check existing data impact, run end-to-end through to render, don't trust layer-scoped verification. See `patterns/Data-Authority.md`.

<!-- CROSS-PROJECT COORDINATION
Activate this section if the project participates in Choral coordination.
See choral/Choral-Pattern.md for the full pattern.

### Cross-Project Coordination
Contract: [path to working contract]

1. At session start: Read contract's APPROVED WORK, BLOCKERS, and OBSERVATIONS
2. During session: Note changes to integration surfaces in the contract
3. At session end (**HARD RULE**): Update OPERATIONAL STATE row (version, session number, integration notes or "No integration changes") **every session, not just on deploy** — update IMPLEMENTATION STATUS for completed items, write OBS for discovered cross-project issues
-->

---

## SESSION WORKFLOW

*This section is the project-specific runbook the Overture session skills defer to. Steps listed here are authoritative — the skills read this section and execute these steps alongside their generic defaults. Be explicit about what's project-specific; don't assume the skill will catch it.*

### At `/session-start`:
0. Clean state — commit/push/deploy anything left from last session
1. [Project-specific: metrics validation, health checks — customize or skip]
2. [Project-specific: domain health checks — customize or skip]
3. Present deferred work
4. Check pending verifications
5. Cross-project coordination (if applicable)
6. Present work queue — NEXT pointer first, then full priorities
7. Alignment check

### During session:
- Stay aligned with work queue unless redirected
- Monitor context usage — find clean stopping points proactively
- Web search to validate approaches when uncertain

### Before `/session-end`:
- Update Session Progress if mid-implementation
- Verify features end-to-end (not just "code looks correct")
- Documentation Sync Check
- Add bumped items to Deferred Work
- Plan next session with prioritized reasoning
- Commit changes if appropriate

---

## SESSION PROGRESS

**Current**: Session #1 pending
**Status**: Initial setup
**NEXT**: [Set by session-end — the #1 priority for the next session, stated specifically. Be precise: "Auth middleware + tenant config", not "Continue P1 work"]
**Last queue hygiene**: Session #1

### Pending Verifications

---

## WORK QUEUE

### CURRENT PRIORITIES

**P1: [First Priority]**
- [Details, context, approach]

### UPCOMING SESSIONS

[Set by session-end — prioritized candidates with reasoning, not just titles. Each candidate gets a sub-bullet explaining why this order and what it unblocks.]

### COMPLETE (Recent)

| Feature | Session | Notes |
|---------|---------|-------|
| Initial setup | #1 | Project CLAUDE.md created |

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

<!--
============================================================
SECTIONS BELOW ARE OPTIONAL — add as the project matures.
Start without them. Add when you need them.
============================================================
-->

<!-- CURRENT METRICS (Sources of Truth)
Add when you have values worth tracking across sessions.

| Metric | Value | Source of Truth |
|--------|-------|-----------------|

**Last Validated**: [Date] (Session #XX)
-->

<!-- CRITICAL REMINDERS
Add as lessons are learned — NEVER/ALWAYS invariants only. These are hard-won rules, not aspirational guidelines. If a rule hasn't earned its place through a real incident or near-miss, leave it out.

1. **NEVER** [dangerous thing to avoid]
2. **ALWAYS** [essential thing to maintain]
-->

<!-- DEVELOPMENT WORKFLOW
Add when deployment or environment setup needs a quick reference.

### Deployment
```bash
# commands
```
-->

<!-- DOCUMENTATION REFERENCE
Add when supporting docs exist that need staleness tracking.

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
-->

<!-- PRIVACY BOUNDARIES

Activate this section if the project handles third-party PII and has public-facing surfaces.
See patterns/Privacy-Boundary.md for the full pattern.

## PRIVACY BOUNDARIES

*Remove this section if the project handles no third-party PII or has no public surfaces.*

| Data Source | Contains | Public Surface | Filtering |
|-------------|----------|----------------|-----------|
| [source] | [what PII] | [what surface, path] | [how filtered — data redaction, prompt instructions, field filtering] |

**Rules**:
1. Changes to any column in this table require PII verification before deploying
2. New data sources feeding public surfaces get a row before the feature ships
3. New public surfaces consuming PII-containing data get a row before the feature ships
4. LLM-powered features consuming PII need both data-level redaction AND prompt-level instructions

**Last verified**: [Date] (Session #XX) — tested with adversarial queries designed to surface PII
-->

<!-- SESSION ARCHIVES
Add when CLAUDE.md grows past ~40k characters.

| Archive | Sessions | Period |
|---------|----------|--------|
-->
