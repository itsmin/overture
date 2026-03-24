# Working Contract: [Project A] <> [Project B]

**Maintained by**: [Coordinator name] (`/path/to/coordinator/`)
**Read by**: [Project A] session, [Project B] session
**Last updated**: [Date]

---

## PURPOSE

This contract documents the integration architecture between [Project A] and [Project B]. The coordination session proposes architectural recommendations here. Each project session reads approved items and implements independently.

Recommendations define the interface — what crosses the boundary between the two systems. Request/response shapes, semantic guarantees, and integration constraints are contractual. Everything behind the interface (file structure, function names, internal orchestration, error handling) belongs to the project session.

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

## HOW TO USE THIS CONTRACT

**Coordination session**: Maintains this file. Reads both codebases, proposes recommendations defining interface contracts, documents observations. Does not prescribe implementation details.

**[Project A] session**: Read APPROVED WORK and OBSERVATIONS at session start. Implement approved items however best fits your codebase — the recommendation defines the interface, you own everything behind it. Update IMPLEMENTATION STATUS when done, including any deviations from the suggested approach.

**[Project B] session**: Same as above.

**Decision authority**: Cross-cutting changes to integration surfaces require explicit user approval (PROPOSED → APPROVED). Once approved, the implementing session has full authority over how to satisfy the requirement. If you find a better approach than what Choral suggested, take it and note what you did.
