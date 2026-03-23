# The Choral Pattern — Cross-Project Coordination

**Version**: 1.0 — March 2026
**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Working with Claude Code, Part 4](../Working-With-Claude-Code.md#part-4-choral--the-coordination-pattern) — conceptual foundations
**Template**: [Contract template](../templates/contract.md) — copy and fill for each project pair

---

## The Problem

Multiple products, each with its own Claude Code session. Each session knows its codebase and has zero awareness of its siblings. You're the only relay — carrying context between sessions in your head.

That works until the projects need to interoperate. Then you become the bottleneck, and things break silently: an API change in Project A that Project B hardcoded. A URL pattern rename. A schema migration that downstream consumers don't know about.

### When You Need This

- Two or more projects consume each other's APIs or data
- URL patterns in one project are hardcoded in another
- Deployment of one project requires sequencing with another
- Architectural decisions in one project constrain another

If none of these apply, you don't need Choral. Skip it.

---

## The Pattern

A Claude Code session dedicated to reading multiple project codebases and writing architectural recommendations to a shared contract. It observes. It proposes. It does not implement.

```
Coordination session reads Project A and Project B codebases
    |
Identifies integration opportunities, risks, shared patterns
    |
Writes recommendations to the working contract
    |
You approve, reject, or defer
    |
Project A session reads the contract -> implements approved items
Project B session reads the contract -> implements approved items
    |
Project sessions update the contract with implementation status
```

Three participants, distinct roles:

| Participant | Does | Does Not |
|-------------|------|----------|
| **Coordinator** | Reads codebases, identifies opportunities, writes recommendations | Implement, write to sibling codebases |
| **Project sessions** | Read contract, implement approved work, make product decisions within their domain | Propose cross-project architectural changes directly |
| **You** | Set decision boundaries in contracts, approve cross-cutting changes, set priorities | Need to approve every product-scoped decision — that's delegated to project sessions |

---

## Design Principles

### Read-only observation
The coordinator doesn't write to sibling codebases. The moment it starts touching implementation, you have too many cooks. The contract is the interface.

### Contract as single communication channel
No back-channel, no probing between sessions. The contract is the shared artifact. Everything flows through it. This constraint is load-bearing — remove it and you get circular logic between sessions.

### Reference designs, not shared code
When the coordinator identifies a pattern worth reusing, it recommends following the *architecture* — not extracting a shared library. Shared code is premature until the second consumer proves the abstraction is correct. Build it twice, find the real overlap, then extract.

### Provenance matters
Different projects have different data trust models. First-person authoritative data (user provided it directly) and third-party assembled data (scraped, inferred, extracted) require fundamentally different confidence models, refresh cadences, and hallucination prevention. The coordinator must understand what kind of data it's looking at, not just where it lives.

### Decision authority lives in the contract
The contract encodes what each project session can decide independently vs. what requires human approval. Product-scoped decisions — choices that affect only one project's product behavior — are delegated to project sessions. They own their product. Cross-cutting architectural decisions that affect integration surfaces or multiple projects still require your explicit approval. This prevents the coordination layer from becoming a bottleneck while maintaining the gate where it matters — at the boundaries between projects.

---

## Setting Up

### 1. Create the coordinator directory

Create a directory at the same level as the projects it coordinates:

```
/Projects/
    project-a/
    project-b/
    coordinator/          <-- new
        CLAUDE.md
        .claude/
            commands/
                session-start.md
                session-end.md
        contracts/
            a-b.md        <-- one per project pair
```

### 2. Write the coordinator CLAUDE.md

The coordinator's CLAUDE.md defines its mandate and boundaries:

```markdown
# [Coordinator Name]

## WHAT THIS IS

Cross-project coordination session for [Project A] <> [Project B].
Read-only. Observes both codebases, writes recommendations to contracts.
Does not implement.

## MANDATE

**Does:**
- Read both project codebases and their CLAUDE.md files
- Identify integration opportunities, risks, and shared patterns
- Write architectural recommendations to the working contract
- Track implementation status across both projects

**Does not:**
- Implement changes in either project
- Write to sibling codebases
- Make product decisions — those belong to project sessions within their domain
- Create shared libraries (recommend architecture, not code extraction)

## PROJECT CONTEXT

### [Project A]
- Path: `/path/to/project-a/`
- [Brief description, stack, current state]

### [Project B]
- Path: `/path/to/project-b/`
- [Brief description, stack, current state]

## SESSION WORKFLOW

### At session start:
1. Read both project CLAUDE.md files
2. Read the working contract
3. Check implementation status of approved items
4. Scan both codebases for changes to integration surfaces
5. Present findings and recommendations

### During session:
- Propose new recommendations when opportunities are identified
- Update existing recommendations based on implementation progress
- Flag integration risks (API changes, schema drift, URL renames)

### At session end:
- Update contract with new recommendations (PROPOSED status)
- Update implementation status from project sessions
- Note any integration surfaces that changed
```

### 3. Create the working contract

Copy `templates/contract.md` to `contracts/a-b.md` and fill in:

- **Current Integration**: Document what's already integrated — live APIs, shared URLs, data flows. This is the ground truth.
- **Recommendations**: Start empty. The coordination session populates this.
- **Architectural Context**: Data provenance differences, trust models, capabilities available for integration.

See the [contract template](../templates/contract.md) for the full structure.

### 4. Add coordination to each project's CLAUDE.md

Each coordinated project adds a section to its collaboration guidelines:

```markdown
### Cross-Project Coordination

**[Coordinator]** (`/path/to/coordinator/`): Coordinates [Project A] <> [Project B].
Contract: `/path/to/coordinator/contracts/a-b.md`

**Decision authority**: This project session owns product decisions within [Project X]'s domain.
Cross-cutting changes that affect integration surfaces require human approval.

**At session start**: Read the contract's APPROVED WORK and RECOMMENDATIONS sections.
**During session**: Note changes to any integration surface in the contract.
**At session end**: Update IMPLEMENTATION STATUS for approved items completed.

**Key integration points**:
- [Specific APIs, URLs, schemas shared between projects]
```

### 5. Set up coordinator session commands

The coordinator needs its own `/session-start` and `/session-end` in `.claude/commands/`:

**session-start** should:
1. Read both project CLAUDE.md files (for current state, not full codebase)
2. Read the working contract
3. Check implementation status of approved items — any project sessions report progress?
4. Scan for changes to integration surfaces (API routes, schemas, URL patterns)
5. Present: current integration state, pending recommendations, implementation progress

**session-end** should:
1. Write any new recommendations to the contract (PROPOSED status)
2. Update implementation status based on what was observed
3. Flag integration risks discovered this session
4. Update the coordinator's own CLAUDE.md with session progress

---

## The Recommendation Lifecycle

```
PROPOSED  ->  APPROVED  ->  IN PROGRESS  ->  COMPLETE
   |              |
   v              v
DEFERRED      REJECTED
```

**PROPOSED**: The coordinator writes a recommendation with: what, why, which projects are affected, dependencies, and a specification detailed enough for a project session to implement without the coordinator present.

**APPROVED**: Approved for implementation. For cross-cutting recommendations, this requires your explicit sign-off. For product-scoped recommendations that fall within a project session's decision authority, the project session can approve directly — the contract defines these boundaries.

**IN PROGRESS**: A project session has started implementation. Updated in the contract's IMPLEMENTATION STATUS table with session number and notes.

**COMPLETE**: Both (or all) affected projects have finished their parts. The recommendation moves from active to historical.

**DEFERRED/REJECTED**: Decided not now or not ever. Include rationale — it prevents the coordinator from re-proposing the same thing.

---

## Coordination Workflows

### Starting a coordination session

Open Claude Code in the coordinator directory:

> "Read both project CLAUDE.md files and the working contract. What's the current integration state? Are there new opportunities or risks?"

The coordinator reads both codebases, identifies integration surfaces, and presents findings. You discuss, it proposes, you approve or defer.

### Project sessions consuming the contract

At each project session start, the session reads the contract's APPROVED WORK section. If there are items requiring that project's implementation:

1. The session reads the recommendation specification
2. Implements according to the spec
3. Updates IMPLEMENTATION STATUS in the contract with session number and notes
4. Notes any integration surface changes in CURRENT INTEGRATION

### Handling integration surface changes

When a project session changes something that other projects depend on (API routes, response schemas, URL patterns):

1. The project session notes the change in the contract's CURRENT INTEGRATION section
2. Next coordination session picks up the change and evaluates impact
3. If the change breaks something, the coordinator proposes a remediation recommendation

This is discipline-only — no automated check catches a project session that forgets to update the contract. That's a known limitation.

---

## Scaling

### Multiple project pairs

One coordinator can manage multiple project pairs, each with its own contract:

```
coordinator/
    contracts/
        a-b.md
        a-c.md
        b-c.md
```

Each contract is independent. A recommendation in `a-b.md` doesn't automatically propagate to `a-c.md`. If a change in A affects both B and C, the coordinator writes separate recommendations to each contract.

### When to split coordinators

If the project pairs have fundamentally different integration patterns (e.g., one pair shares APIs while another shares data pipelines), separate coordinators may be clearer than one that spans all pairs. The coordination session's CLAUDE.md gets complex fast when it spans too many concerns.

---

## Known Limitations

1. **Scaling is unproven.** The pattern has coordinated lightweight integrations (API endpoints, shared URL patterns). Major architectural changes propagating across projects haven't been stress-tested. The contract model may need versioning or conflict resolution at scale.

2. **Contract drift is a discipline problem.** If a project session changes an integration surface without updating the contract, the coordinator reasons against stale state. No automated check catches this.

3. **No integration testing.** The coordinator reads code and reasons about compatibility. It can't run tests across projects. A breaking API change won't be caught until deployment.

4. **The coordinator can't observe in real time.** It reads codebases at session start. Changes made between coordination sessions are invisible until the next one.

5. **Recommendation quality depends on codebase understanding.** The coordinator session has the same context limits as any Claude Code session. Complex integration surfaces may require multiple coordination sessions to fully understand.

---

## Quick Reference

| What | Where |
|------|-------|
| Set up coordinator | Create directory, CLAUDE.md, `.claude/commands/`, `contracts/` |
| Create a contract | Copy `templates/contract.md`, fill in current integration |
| Add to project | Cross-project coordination section in project CLAUDE.md |
| Propose changes | Run coordination session — it reads both codebases and writes to contract |
| Approve changes | Review PROPOSED items, change status to APPROVED |
| Implement changes | Project sessions read APPROVED WORK, implement, update status |
| Track progress | IMPLEMENTATION STATUS table in the contract |

---

*This pattern is project-pair-agnostic. Same structure, different projects, different contracts, different integration surfaces.*
