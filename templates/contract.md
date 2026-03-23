# Working Contract: [Project A] <> [Project B]

**Maintained by**: [Coordinator name] (`/path/to/coordinator/`)
**Read by**: [Project A] session, [Project B] session
**Last updated**: [Date]

---

## PURPOSE

This contract documents the integration architecture between [Project A] and [Project B]. The coordination session proposes architectural recommendations here. You approve them. Each project session reads approved items and implements independently.

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
**Description**: [What and why]
**Affected projects**: [Which projects need changes]
**Dependencies**: [What needs to happen first]
-->

*(No recommendations yet.)*

---

## APPROVED WORK

*Items you have approved for implementation. Each project session reads this section at session start.*

*(None yet.)*

---

## IMPLEMENTATION STATUS

*Project sessions report back here when implementing approved work.*

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

**Coordination session**: Maintains this file. Reads both codebases, proposes recommendations, tracks implementation status.

**[Project A] session**: Read APPROVED WORK and RECOMMENDATIONS at session start. Owns product decisions within [Project A]'s domain. Update IMPLEMENTATION STATUS when completing approved items. Note changes to integration surfaces in CURRENT INTEGRATION.

**[Project B] session**: Same as above, for [Project B]'s domain.

**Decision authority**: Project sessions own product-scoped decisions within their domain. Cross-cutting changes — those affecting integration surfaces, shared schemas, or multiple projects — require your explicit approval before implementation.
