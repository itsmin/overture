# The Choral Pattern — Cross-Project Coordination

**Version**: 2.0 — March 2026
**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Working with Claude Code, Part 4](../Working-With-Claude-Code.md#part-4-choral--the-coordination-pattern) — conceptual foundations
**Template**: [Contract template](../templates/contract.md) — copy and fill for each project pair

> **Audience**: You — reference reading for setting up cross-project coordination. Read it when you have multiple projects that need awareness of each other.

---

## The Problem

Multiple products, each with its own Claude Code session. Each session knows its codebase and has zero awareness of its siblings. You're the only relay — carrying context between sessions in your head.

That works until the projects need to interoperate. Then you become the bottleneck, and things break silently: an API change in Project A that Project B hardcoded. A URL pattern rename. A schema migration that downstream consumers don't know about.

### When You Need This

- Two or more projects consume each other's APIs or data
- URL patterns in one project are hardcoded in another
- Deployment of one project requires sequencing with another
- Architectural decisions in one project constrain another

If none of these apply, skip this entirely.

---

## The Pattern

A coordination system with three layers of automation, centered on a shared contract that all participants read and write.

### Participants

| Participant | Does | Does Not |
|-------------|------|----------|
| **Coordinator** | Reads codebases, identifies opportunities, writes recommendations | Implement, write to sibling codebases |
| **Project sessions** | Read contract, implement approved work, make product decisions within their domain | Propose cross-project architectural changes directly |
| **You** | Set decision boundaries in contracts, approve cross-cutting changes, set priorities | Need to approve every product-scoped decision — that's delegated to project sessions |

### The Shared Blackboard

The contract is a shared blackboard — not owned by the coordinator, but written by all participants. Each actor owns their sections:

| Section | Coordinator | Project A | Project B |
|---------|-------------|-----------|-----------|
| RECOMMENDATIONS | Writes | Reads | Reads |
| OBSERVATIONS | Writes | Reads | Reads |
| OPERATIONAL STATE | Reads | Writes own row | Writes own row |
| CURRENT INTEGRATION | Reads | Writes changes | Writes changes |
| BLOCKERS | Can add | Can add/clear | Can add/clear |
| APPROVED WORK | Writes (with approval) | Reads | Reads |
| IMPLEMENTATION STATUS | Reads | Writes own entries | Writes own entries |

This eliminates the bottleneck. Project sessions update their state directly in the contract. The coordinator reads the contract to understand what changed. No human relay needed for state synchronization.

---

## Three Coordination Modes

Coordination operates at three layers. Each serves one purpose. They build on each other.

### Mode 1: Reactive — Real-Time Detection

**Automation**: Full (hooks, no human involvement)
**Detection latency**: Sub-1-second after file edit
**Purpose**: Know immediately when the other project touches the integration surface

When a session edits an integration-relevant file, a hook creates a signal file in the coordinator's `signals/` directory. The other project's hooks check for incoming signals before each edit. If a signal exists, the session sees a notification: "Integration-relevant changes detected from the other project."

```
Project A edits API route file
    → PostToolUse hook detects watched file
    → Creates signals/project-b.signal
    → Project B's PreToolUse hook sees signal at next edit
    → "⚠️ Integration changes detected. Run /choral to sync."
    → Signal consumed (deleted) after display
```

**What it does**: Reduces detection latency from "next session-start" to "next tool call."
**What it doesn't do**: Assess. It tells you something changed, not what the change means.

### Mode 2: Concurrent — Session Boundary Sync

**Automation**: Semi-automated (commands + monitoring script)
**Detection latency**: Per session-start or on-demand via `/choral` command
**Purpose**: Synchronize state at session boundaries without human coordination overhead

**At session-start**: Each project's `/session-start` command reads the contract (operational state, blockers, approved work, observations) and runs the integration monitor in quiet mode. If integration-relevant files have changed since the last coordination session, it surfaces a note.

**Mid-session** (`/choral` command): Each project has a `/choral` command that reads the full contract, surfaces pending work and blockers, checks for signals, and validates cross-project dependency references.

**At session-end / on deploy**: Project sessions update their operational state row in the contract (production version, session number, integration-relevant notes) and clear resolved blockers.

**What it does**: State synchronization — every session starts with current cross-project context. No human relay.
**What it doesn't do**: Assess implications. The monitor detects changes; it doesn't interpret them.

### Mode 3: Proactive — Architectural Assessment

**Automation**: Manual (requires human to open a coordination session)
**Purpose**: Read both codebases deeply, identify cross-project implications, propose architectural changes

This is the original Choral session. You open Claude Code in the coordinator directory when:
- Signals or monitor alerts suggest something significant happened
- Periodic architecture review is due
- A project session requests guidance on a cross-project concern

The coordinator reads both codebases, evaluates integration health, and writes recommendations (PROPOSED) or observations to the contract. You approve cross-cutting changes. Project sessions implement with full autonomy.

**What it does**: The assessment that Modes 1 and 2 can't — understanding what a change in one codebase *means* for the other.

### Escalation Path

```
Mode 1 detects file change → creates signal
    ↓
Signal surfaces in the other project
    ↓
Session runs /choral (Mode 2) for state sync
    ↓
If architectural implications → human opens coordinator session (Mode 3)
    ↓
Coordinator proposes → human approves → project sessions implement
```

Most coordination happens in Modes 1 and 2 automatically. Mode 3 activates only when assessment is needed. This is by design — the human stays in the loop for architectural decisions but is removed from the detection and synchronization path.

---

## Design Principles

### Read-only observation
The coordinator doesn't write to sibling codebases. The moment it starts touching implementation, you have too many cooks. The contract is the interface.

### Define the interface, not the implementation
Recommendations define what crosses the boundary between projects — request/response shapes, semantic guarantees, integration constraints. These are contractual. Everything behind the interface (file structure, function names, internal orchestration, error handling) belongs to the project session. A recommendation that says "the endpoint should return X" is binding on the API contract. A recommendation that says "implement this in file Y" is context, not instruction — the session may find a better approach given its current codebase state.

### Trust the sessions
If a project session deviates from a recommendation's suggested approach, that's expected — they found something better. The contract defines *what* the integration needs. *How* each project satisfies that is theirs to decide. When a session takes a different path, they note what they did in the implementation status. The coordinator learns from this for future recommendations.

### Contract as single communication channel
No back-channel, no probing between sessions. The contract is the shared artifact. Everything flows through it. Signal files are the one exception — they're ephemeral notifications, not state. State lives in the contract.

### Reference designs, not shared code
When the coordinator identifies a pattern worth reusing, it recommends following the *architecture* — not extracting a shared library. Shared code is premature until the second consumer proves the abstraction is correct. Build it twice, find the real overlap, then extract.

### Provenance matters
Different projects have different data trust models. First-person authoritative data (user provided it directly) and third-party assembled data (scraped, inferred, extracted) require fundamentally different confidence models, refresh cadences, and hallucination prevention. The coordinator must understand what kind of data it's looking at, not just where it lives.

### Decision authority lives in the contract
Cross-cutting changes to integration surfaces require your explicit approval. But once approved, the implementing session has full authority over how to satisfy the requirement. The coordinator proposes; you approve at the boundary; project sessions own everything behind it.

---

## Getting Started

Setup takes about 5 minutes. You need three things: a directory, a CLAUDE.md, and a contract.

### Quick start

```
mkdir coordinator
mkdir coordinator/contracts
```

Write a `coordinator/CLAUDE.md`:

```markdown
# [Coordinator Name]

Cross-project coordination for [Project A] <> [Project B].
Read-only. Observes both codebases, writes recommendations to a shared contract.

**Does:** Read both codebases, identify integration opportunities, write recommendations.
**Does not:** Implement, write to sibling codebases, make product decisions.

At session start: read both project CLAUDE.md files + the contract. Present findings.
```

Copy `templates/contract.md` to `coordinator/contracts/a-b.md` and fill in what's already integrated.

Add a cross-project coordination section to each project's CLAUDE.md:

```markdown
### Cross-Project Coordination
Contract: `/path/to/coordinator/contracts/a-b.md`
At session start: read the contract's APPROVED WORK and BLOCKERS.
At session end: update OPERATIONAL STATE and IMPLEMENTATION STATUS.
```

That's it. Open Claude Code in the coordinator directory and start your first coordination session. The three automation modes are additive — you don't need any of them to start.

### Adding automation (incremental)

When the basic pattern is working and you want to reduce manual overhead, add automation in layers:

**Mode 2 — Session boundary sync:**

Add `.claude/commands/` to the coordinator for session-start/session-end commands. Build an integration monitor script (`scripts/integration-monitor.sh`) that watches integration-relevant files via `git log --since`. Wire it into project session-starts in quiet mode. Add a `/choral` command to each project for mid-session sync.

```
coordinator/
    CLAUDE.md
    .claude/commands/
        session-start.md
        session-end.md
    contracts/
        a-b.md
    scripts/
        integration-monitor.sh    <-- add when ready
```

**Mode 1 — Real-time detection:**

Add hook scripts triggered by Claude Code's PostToolUse/PreToolUse events. When a watched file is edited, a signal file is created. The other project's hooks check for incoming signals. Configure in each project's `.claude/settings.local.json`:

```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Edit",
      "command": "/path/to/coordinator/scripts/on-a-edit.sh $FILE_PATH"
    }],
    "PreToolUse": [{
      "matcher": "Edit",
      "command": "/path/to/coordinator/scripts/check-signal-a.sh"
    }]
  }
}
```

```
coordinator/
    ...
    scripts/
        integration-monitor.sh
        create-signal.sh          <-- add when ready
        on-a-edit.sh
        on-b-edit.sh
        check-signal-a.sh
        check-signal-b.sh
    signals/                      <-- ephemeral signal files
```

Each layer adds value independently. Most teams will be well-served by Mode 3 (manual sessions) + Mode 2 (monitor). Mode 1 (real-time hooks) is for when you're actively developing both projects concurrently.

---

## The Recommendation Lifecycle

```
PROPOSED  ->  APPROVED  ->  IN PROGRESS  ->  COMPLETE
   |              |
   v              v
DEFERRED      REJECTED
```

**PROPOSED**: The coordinator writes a recommendation defining the interface: request/response shapes, semantic guarantees, integration constraints. Detailed enough for a project session to implement without the coordinator present. Implementation suggestions are context, not instruction.

**APPROVED**: Approved for implementation. Cross-cutting changes to integration surfaces require your explicit sign-off. Once approved, the implementing session has full authority over *how* to satisfy the requirement.

**IN PROGRESS**: A project session has started implementation. Updated in the contract's IMPLEMENTATION STATUS table with session number and notes — including any deviations from the suggested approach.

**COMPLETE**: Both (or all) affected projects have finished their parts. The recommendation moves from active to historical.

**DEFERRED/REJECTED**: Decided not now or not ever. Include rationale — it prevents the coordinator from re-proposing the same thing.

---

## Observations

Observations are distinct from recommendations. The coordinator documents findings — data inconsistencies, potential risks, integration patterns — without prescribing solutions.

```
OBS-001: [Title]
Finding: [What was observed]
Affected: [Which project(s)]
```

The observation says "here's what I found." The project session decides what (if anything) to do about it. This keeps the coordinator in its lane — it identifies problems at the integration level, but product-level responses belong to the project sessions.

Observations that grow into integration-level concerns can be promoted to recommendations. But not every finding needs a recommendation — some are just informational context for the project sessions to consider.

---

## Contract Hygiene

The contract is loaded by multiple actors across multiple sessions — context budget matters. Keep it under ~300 lines.

**What to archive** (to `contracts/archive/`):
- Completed recommendations (retain a one-line summary in the main contract)
- Resolved blockers
- Completed implementation status entries
- Resolved observations

**When to archive**: At the start of each coordination session — automatic housekeeping.

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

Each contract is structurally independent — a recommendation in `a-b.md` doesn't automatically propagate to `a-c.md`. If a change in A affects both B and C, the coordinator writes separate recommendations to each contract.

But contracts are not *strategically* independent when they share a bottleneck. If Project B is the implementing side for both `a-b.md` and `a-c.md`, the coordination work across both contracts competes for B's capacity. The coordinator needs a cross-contract view to surface this.

### Coordination Manifest

When managing multiple contracts, add a **Coordination Manifest** section to the coordinator's CLAUDE.md. This is the cross-contract view that individual contracts can't provide.

The manifest tracks three things:

**Contract health**: Which contracts are active (items in progress), dormant (approved work waiting), or complete? This helps the human decide when to open a coordination session.

**Coordination queue**: All pending items across all contracts, grouped by actionability (unblocked vs. blocked) with explicit dependency markers. Items are tagged with their source contract and assigned project. This replaces a flat numbered work queue that implies ordering without acknowledging cross-contract relationships.

**Bottleneck identification**: Which project session is the constraint? When all pending items are assigned to one project, that's worth stating explicitly — it affects sequencing decisions.

```markdown
## COORDINATION MANIFEST

### Contract Health
| Contract | Status | Pending | Bottleneck |
|----------|--------|---------|------------|
| A ↔ B    | Active | 3 items (B-side) | B |
| A ↔ C    | Dormant | 2 approved, blocked | B (prerequisite) |

### Coordination Queue

**Actionable:**
| Item | Contract | Owner | Dependencies |
| REC-X | a-b | B | Independent |
| Phase 1 | a-c | B | Blocks REC-Y, REC-Z |

**Blocked:**
| Item | Contract | Owner | Blocked By |
| REC-Y | a-c | C | Phase 1 |
```

The manifest is updated at each coordination session. The coordinator's session-start reads it and cross-references against current project state — have blocked items become actionable? Have actionable items been completed?

**What the manifest is not**: a scheduler. It surfaces actionability, dependencies, and bottlenecks. The human decides sequencing — including how coordination work ranks against each project's internal priorities.

### When to split coordinators

If the project pairs have fundamentally different integration patterns (e.g., one pair shares APIs while another shares data pipelines), separate coordinators may be clearer than one that spans all pairs. The coordination session's CLAUDE.md gets complex fast when it spans too many concerns.

---

## Known Limitations

1. **Scaling is unproven.** The pattern has coordinated lightweight integrations (API endpoints, shared URL patterns). Major architectural changes propagating across projects haven't been stress-tested. The contract model may need versioning or conflict resolution at scale.

2. **Contract drift is partially mitigated.** Mode 1 catches real-time file edits. Mode 2's monitor catches git-level changes. But semantic drift — changes to what an API *means*, not just that a file changed — is still discipline-only.

3. **No integration testing.** The coordinator reads code and reasons about compatibility. It can't run tests across projects. A breaking API change won't be caught until deployment.

4. **Detection is file-level, not semantic.** The integration monitor and hooks know a file changed, not whether the change affects the integration. A trivial refactor and a breaking schema change look the same. The human decides whether to investigate.

5. **Recommendation quality depends on codebase understanding.** The coordinator session has the same context limits as any Claude Code session. Complex integration surfaces may require multiple coordination sessions to fully understand.

---

## Quick Reference

| What | Where |
|------|-------|
| Set up coordinator | Create directory, CLAUDE.md, `.claude/commands/`, `contracts/` |
| Create a contract | Copy `templates/contract.md`, fill in current integration |
| Add to project | Cross-project coordination section in project CLAUDE.md |
| Build Mode 2 (monitor) | Shell script in `scripts/`, wire into project session-starts |
| Build Mode 1 (hooks) | Hook scripts + signal files, wire into project settings.local.json |
| Propose changes | Run coordination session (Mode 3) — reads both codebases, writes to contract |
| Approve changes | Review PROPOSED items, change status to APPROVED |
| Implement changes | Project sessions read APPROVED WORK, implement, update status |
| Mid-session sync | Project runs `/choral` command — reads contract, surfaces pending work |
| Detect drift | Mode 1 (real-time) + Mode 2 (session-start) |

---

*This pattern is project-pair-agnostic. Same structure, different projects, different contracts, different integration surfaces. Start with Mode 3 only, add automation incrementally.*
