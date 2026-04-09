# Working Contract: [Project A] <> [Project B]

> **Audience**: Both — the coordinator session and project sessions read and write to this document. See the [Choral Pattern](../choral/Choral-Pattern.md) for how contracts work.

**Maintained by**: All participants (shared blackboard)
**Participants**: [Coordinator] session, [Project A] session, [Project B] session
**Last updated**: [Date]

---

## PURPOSE

This contract documents the integration architecture between [Project A] and [Project B]. The coordination session proposes architectural recommendations here. Each project session reads approved items and implements independently. All participants write to their own sections.

Recommendations define the interface — what crosses the boundary between the two systems. Request/response shapes, semantic guarantees, and integration constraints are contractual. Everything behind the interface (file structure, function names, internal orchestration, error handling) belongs to the project session.

---

## OPERATIONAL STATE

*Each project session updates its own row at session-end and on deploy.*

| Project | Version | Session | Integration Notes |
|---------|---------|---------|-------------------|
| [Project A] | | | |
| [Project B] | | | |

---

## CURRENT INTEGRATION (Live)

<!-- Document what's already integrated — APIs, shared URLs, data flows.
     This section is the ground truth for how the projects interact today. -->

### 1. [Integration Surface Name]

| Endpoint / Interface | Purpose | Consumer | Auth |
|---------------------|---------|----------|------|
| [endpoint or URL] | [what it does] | [which project consumes it] | [auth method] |

**Failure mode**: [How failures are handled — graceful degradation, retry, etc.]

**Risk**: [Known risks — e.g., URL pattern changes break links silently]

---

## RECOMMENDATIONS

*The coordination session proposes items here. Status lifecycle: PROPOSED > APPROVED > IN PROGRESS > COMPLETE.*

<!-- Format for each recommendation:
### [Number]. [Title] — [STATUS]
**Proposed**: [Date], Coordination Session #XX
**Interface**: [What the integration surface looks like — request/response shapes, constraints]
**Why**: [What problem this solves]
**Affected projects**: [Which projects need changes]
**Dependencies**: [What needs to happen first]

Note: the interface definition is contractual. Implementation suggestions are context — project sessions may find a better approach.
-->

*(No recommendations yet.)*

---

## OBSERVATIONS

*Findings that don't require action but inform project sessions.*

<!-- Format:
### OBS-[Number]. [Title]
**Found**: [Date], Coordination Session #XX
**Finding**: [What was observed]
**Affected**: [Which project(s)]

Observations document problems or patterns without prescribing solutions.
Project sessions decide what (if anything) to do about them.
-->

*(No observations yet.)*

---

## BLOCKERS

*Cross-project dependencies blocking work. Cleared when resolved.*

<!-- Format:
| Blocker | Blocking | Waiting On | Status |
|---------|----------|------------|--------|
| [What's blocked] | [Which project/recommendation] | [What needs to happen] | ACTIVE / RESOLVED |
-->

*(None active.)*

---

## APPROVED WORK

*Items approved for implementation. Each project session reads this section at session start.*

*(None yet.)*

---

## IMPLEMENTATION STATUS

*Project sessions report back here when implementing approved work. Include deviations from suggested approach — the coordinator learns from these.*

| Item | Project | Status | Session | Notes |
|------|---------|--------|---------|-------|
| *(none yet)* | | | | |

---

## ARCHITECTURAL CONTEXT

<!-- Document context that informs recommendations:
     - Key capabilities in each project available for integration
     - Data provenance differences (e.g., first-party vs. third-party data)
     - Trust models and guardrail differences
     - Reference architectures worth following
-->

---

## CONTRACT HYGIENE

This contract is read into context by every session-start and /choral invocation across all participants. Stale content costs context tokens and attention across the entire portfolio.

**Target**: Keep the contract under 300 lines. With N participants × multiple sessions = significant context multiplier.

**What stays (active surface)**:
- OPERATIONAL STATE (always current)
- CURRENT INTEGRATION (live integration points)
- Active RECOMMENDATIONS (PROPOSED or APPROVED, not yet COMPLETE on all sides)
- Active BLOCKERS
- Active OBSERVATIONS (not yet addressed or still relevant)
- APPROVED WORK (pending items only)
- ARCHITECTURAL CONTEXT (reference material, trim if large)
- HOW TO USE (governance)

**What archives (completed/resolved)**:
- COMPLETE recommendations → archive file (retain one-line summary in a COMPLETE table)
- Resolved BLOCKERS → remove from main contract
- IMPLEMENTATION STATUS entries for COMPLETE items → archive
- Resolved OBSERVATIONS → archive with resolution note
- APPROVED WORK rows where all sides are COMPLETE → remove

**When to archive**: At the start of each coordination session, check line count. If over 300 lines, archive completed items before doing new work. Project sessions don't archive — that's the coordinator's housekeeping role.

**Archive format**: Each archive file is append-only with timestamps. Sessions can read archives for historical context, but they're not loaded automatically.

---

## HOW TO USE THIS CONTRACT

This contract is a shared blackboard. All participants read and write to their own sections.

**Coordination session** (Mode 3): Proposes RECOMMENDATIONS and documents OBSERVATIONS. Reads both codebases to assess integration health. Does not prescribe implementation details.

**[Project A] session**: At session-start, read APPROVED WORK, BLOCKERS, and OBSERVATIONS. At session-end (**HARD RULE**), update your OPERATIONAL STATE row — every session, not just on deploy. When implementing approved items, update IMPLEMENTATION STATUS — including deviations from the suggested approach. Write OBS for cross-project issues discovered (data quality, client-side workarounds, integration surface changes). You own everything behind the interface.

**[Project B] session**: Same as above.

**Decision authority**: Cross-cutting changes to integration surfaces require explicit user approval (PROPOSED → APPROVED). Once approved, the implementing session has full authority over how to satisfy the requirement. If you find a better approach than what the coordinator suggested, take it and note what you did.
