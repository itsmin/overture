# Working with Claude Code

**Created**: March 22, 2026 | **Updated**: March 2026
**Context**: These patterns emerged from 460+ working sessions across production SaaS, professional services, and multi-project coordination. The concepts are grounded in how LLMs actually work — not how they're marketed.
**Purpose**: Conceptual foundations for working with Claude Code. Why the workflow patterns work, not just how to set them up.
**Part of**: [Overture](README.md) — the Claude Code working kit
**Companion**: [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) — the practical methodology and templates

> **Audience**: You — conceptual foundations. Claude doesn't need this file to operate.

---

## The Naming

Overture, Choral, Lyrical — these aren't branding. They're a vocabulary for a system.

- **Overture**: The setup before the performance. Everything that establishes the themes, the instruments, the key — before anyone writes a line of code. This document. The kit.
- **Choral**: Multiple voices, one piece. The coordination pattern for projects that need to interoperate without coupling. Named for what it does — harmonizes independent sessions.
- **Lyrical**: The representation engine pattern. How you give an entity (a person, a company, an organization) a voice through structured data and a constrained AI agent. A reference design abstracted from a production professional representation service.

---

## Part 1: What's Actually Happening

Most people using LLMs don't understand the interaction model. That's fine for casual use. It's not fine if you're building workflows on top of it.

### You're not teaching. You're staging a desk.

When you type into Claude Code, you're doing **In-Context Learning (ICL)**. You're filling the model's working memory with information so it generates better responses *right now*. The model's actual knowledge — its weights, the "metal" — was set during training at the AI lab, long before it reached you.

**RLHF** (Reinforcement Learning from Human Feedback) is how that training works: human raters rank responses, those rankings become a mathematical reward signal, gradient descent permanently shifts billions of parameters. That changes the model for everyone. Permanently.

Your chat doesn't do any of that. You're handing a genius with amnesia the right papers before each conversation. When the session ends, the papers go in the trash.

### Why this shapes every decision

Every "memory" system built on top of an LLM is a workaround for ICL being ephemeral. CLAUDE.md files, session-start scripts, documentation — these reload context into a model that retains nothing between sessions. That's not a flaw. It's the constraint.

Once you internalize it:
- **Context windows have limits** → manage what's loaded, don't dump everything in
- **More context ≠ better reasoning** → attention degrades in the middle of long prompts; curate, don't accumulate
- **The model doesn't learn from corrections** → encode corrections as persistent artifacts that reload every session
- **"Memory" features are automated ICL** → platforms that "remember" preferences are injecting stored notes into your prompt. The metal never moved.

### "A million tokens of context"

Means the desk is bigger. Not the researcher. A cluttered desk is worse than a focused one regardless of surface area. Loading 30,000 tokens of architecture docs when 2,000 are relevant is 28,000 tokens of attention budget spent on noise.

---

## Part 2: Memory Architecture

### The problem

You need continuity between sessions. The naive approach: write everything down, load it all next time. Works until files grow, context gets noisy, and the model starts missing instructions buried in walls of stale text.

### Three tiers

**Tier 1 — Session Context (The Desk)**
The current conversation plus whatever's loaded via CLAUDE.md and session-start scripts. Dies when the session ends. Your only lever is curation.

**Tier 2 — Active Documentation (The Filing Cabinet)**
CLAUDE.md, session progress, work queues, source-of-truth docs. Persists between sessions. Session-end scripts update it; session-start scripts load it. **This is where most of the workflow engineering happens.**

**Tier 3 — Archive (Cold Storage)**
Old session logs, completed work, historical context. Not loaded unless specifically needed. Reference, not reasoning.

### Decay

Tier 2 grows. Without pruning, it becomes a wall of text the model skims past. The solution: automated pruning based on signals that approximate relevance.

**Culling parameters:**
- **Age** — How old is this information?
- **Magnitude** — How many sessions did this concept persist across? High magnitude = core truth. Don't cull.
- **Last access** — When was this last referenced?
- **Grace period** — Culled items leave a pointer to the archive before full removal. Safety net.

This is cache eviction applied to documentation. LRU with a semantic layer. The insight isn't the algorithm — it's recognizing that **context management is a caching problem.**

**The honest part:** Things get dropped. The mitigation isn't perfection — it's ensuring dropped items are old enough that the impact is low. If you don't notice something's gone within the grace period, it probably wasn't load-bearing.

That sounds hand-wavy. In practice, it works. The alternative — keeping everything — fails harder and fails silently. The model ignores your instructions because they're buried in noise, and you don't know it's happening.

---

## Part 3: The Levels

Projects don't all need the same workflow overhead. Match the investment to the need. Over-investing is real waste — a weekend script at Level 2 is ceremony for ceremony's sake.

### Level 0: One-Shot

No persistent state. Open Claude Code, ask a question, close. Most tasks start here. Many should stay here.

**Level up when:** The project will span multiple sessions.

### Level 1: Single Project, Basic Sessions

**What you set up:**
- A `CLAUDE.md` at the project root: guidelines, current state, work queue
- Discipline to update it manually at session end

**What you get:** The model knows your project context at session start. You can pick up where you left off — roughly.

**Level up when:** "Roughly" isn't good enough. You're losing context between sessions or dropping work items.

### Level 2: Single Project, Mature

**What you add:**
- `.claude/commands/session-start.md` — automated context loading, metrics validation, work queue presentation
- `.claude/commands/session-end.md` — documentation sync checks, deferred work tracking, progress capture
- Sources of truth — which file is authoritative for which data (prevents documentation drift)
- Deferred work tracking — bumped items get logged with context, not silently dropped

**What you get:** Reliable handoffs. Work doesn't disappear when priorities shift. Documentation stays honest because the session-end command forces a sync check.

**Level up when:** Documentation starts rotting between sessions despite the discipline. Manual testing becomes a burden. Context files are getting unwieldy.

### Level 3: Single Project, Automated

**What you add:**
- Decay — scripted summarization and archival based on age, magnitude, access frequency
- Idle-time automation — cron-based test harness execution, linting, health checks that run while you're away
- Self-maintaining test harnesses — updated when code changes, catch regressions proactively

**What you get:** The project maintains itself between your active sessions. Context stays lean. Tests run without being asked. Stale documentation gets pruned before it becomes noise.

**Caveat:** Level 3 is custom engineering. There's no drop-in framework. Decay and idle-time automation are scripts built for your specific workflow. The *pattern* generalizes; the *implementation* doesn't.

**Level up when:** You have multiple projects that need to be aware of each other's capabilities.

### Level 4: Multi-Project Coordination (Choral)

**What you add:**
- A coordination session with its own directory, CLAUDE.md, and mandate
- Working contracts between coordinated project pairs (shared blackboard — all participants read and write)
- Cross-project references in each project's CLAUDE.md
- Three coordination modes: reactive (hooks), concurrent (commands + monitoring), proactive (assessment sessions)

**What you get:** Projects develop awareness of each other without coupling their implementations. Integration changes are detected in real time (Mode 1), state syncs at session boundaries (Mode 2), and architectural assessment happens when needed (Mode 3). You stay in the loop for cross-cutting decisions but are removed from the detection and synchronization path.

---

## Part 4: Choral — The Coordination Pattern

### The problem it solves

Multiple products, each with its own Claude Code session. Each session knows its own codebase and has zero awareness of its siblings. You are the only relay. That works until the projects need to interoperate — then you become the bottleneck, carrying context between sessions in your head.

### What it is

A coordination system with three layers of automation, centered on a shared contract that all participants read and write:

**Reactive** (Mode 1) — Hooks detect integration-relevant file edits in real time, create signal files, notify the other project at its next tool call. Fully automated, sub-1-second detection.

**Concurrent** (Mode 2) — Session boundary sync. Each project's `/session-start` reads the contract and runs an integration monitor. A `/choral` mid-session command provides on-demand sync. Semi-automated.

**Proactive** (Mode 3) — Full coordination session. You open it when signals or monitors suggest architectural review is needed. Reads both codebases, proposes recommendations to the contract. Human-triggered.

The escalation path: detect (Mode 1) → sync (Mode 2) → assess (Mode 3). Most coordination happens automatically. Only architectural assessment requires human initiation.

See the [Choral Pattern guide](choral/Choral-Pattern.md) for the complete setup and implementation details.

### Design principles

**Read-only observation.** The coordinator doesn't write to sibling codebases. The moment it starts touching implementation, you have too many cooks. The contract is the interface.

**Define the interface, not the implementation.** Recommendations define what crosses the boundary — request/response shapes, semantic guarantees, integration constraints. Everything behind the interface belongs to the project session. "The endpoint should return X" is contractual. "Implement this in file Y" is context, not instruction.

**Trust the sessions.** If a project session deviates from the suggested approach, that's expected — they found something better. The contract defines *what*. Each project owns *how*.

**Contract as single communication channel.** No back-channel, no probing. The contract is the shared artifact. Everything flows through it. This constraint is load-bearing — remove it and you get circular logic between sessions.

**Reference designs, not shared code.** When the coordinator identifies a pattern worth reusing, it recommends following the *architecture* — not extracting a shared library. Shared code is premature until the second consumer proves the abstraction is correct. Build it twice, find the real overlap, *then* extract.

**Provenance matters.** Different projects have different data trust models. A professional's self-reported work history is first-person authoritative. A company's news-extracted intelligence is third-party assembled. A coordination layer that treats these the same will produce bad recommendations. The coordinator must understand what kind of data it's looking at, not just where it lives.

**Decision authority in the contract.** Cross-cutting changes to integration surfaces require your approval. Once approved, the implementing session has full authority over how to satisfy the requirement. The human gate stays where it matters: at the boundaries between projects.

### Making it repeatable

The pattern is project-pair-agnostic:

1. Create a directory at the same level as the projects
2. Write a `CLAUDE.md` defining the mandate, boundaries, and read access paths
3. Create `.claude/commands/` for session-start (read both projects) and session-end (update contracts)
4. Create a contract document for the pair
5. Add cross-project coordination sections to both project CLAUDE.md files referencing the contract

Same structure. Different projects. Different contracts. Different integration surfaces.

---

## Part 5: Lyrical — The Representation Pattern

A reference design for giving an entity a voice through AI.

### The core idea

An AI agent that *represents* an entity to visitors — speaks about it in the third person, grounded in structured canonical data, constrained by guardrails, tracked through engagement signals. Not a chatbot. Not a search interface. A representative.

### What makes it a pattern (not just a product)

The architecture separates entity-agnostic infrastructure from entity-specific content:

**Portable (~80%):**
- Engagement lifecycle (session management, message history, archival)
- Conversation dynamics (programmatic signal detection, no LLM overhead)
- Prompt assembly (base + overlay composition)
- Metadata extraction (topic, navigation, depth signals from tagged responses)
- Signal tracking and debrief generation
- Tenant configuration and caching

**Entity-specific (~20%):**
- Canonical data schema (what you know about the entity)
- Voice rules (how the agent speaks)
- Guardrails (what it won't discuss)
- Navigation structure (if the entity has explorable surfaces)
- Detector thresholds (tuned per entity type)

### The abstraction boundary

A Lyrical implementation for a new entity type follows the architecture but builds its own canonical schema, voice, and guardrails. It doesn't import code from the original — it follows the patterns.

The critical difference between entity types is **data provenance**. A professional's canonical data is first-person (they said it in an interview, they approved the claim). A company's canonical data is third-party (scraped from news, extracted from SEC filings, inferred by LLMs). These require fundamentally different confidence models, refresh cadences, and hallucination prevention.

---

## Part 6: Honest Gaps

These aren't future work. They're known limitations of the current system.

1. **Scaling is unproven.** Choral has coordinated lightweight integrations. A major architectural change propagating across projects hasn't been stress-tested. The contract model may need versioning, conflict resolution, or breaking-change detection at scale.

2. **Decay is lossy by design.** The bet is that old enough ≈ unimportant enough. This is a heuristic, not a guarantee. Important information with low access frequency can be culled incorrectly.

3. **Contract drift is partially mitigated.** An integration monitor can detect file-level changes to watched integration surfaces (see the [Choral Pattern guide](choral/Choral-Pattern.md#integration-monitor)). But semantic drift — changes to what an API *means*, not just that a file changed — is still discipline-only.

4. **No integration testing.** The coordinator reads code and reasons about compatibility. It can't run tests across projects. A breaking API change won't be caught until deployment.

5. **Level 3 is partially documented.** The integration monitor in the Choral pattern is a concrete example of session-start automation. Decay still has no reproducible template — the pattern generalizes but the implementation is custom per project.

---

## How to Use This Document

**New to the kit?** Start with the [README](README.md), then come here for conceptual foundations. The [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) has the practical how-to.

**Starting a new project?** Read Part 3. Pick your level. Don't over-invest. Then use the [templates](templates/) to set up.

**Scaling an existing project?** Check the "level up when" signals. If you're hitting them, add the next level's infrastructure.

**Coordinating multiple projects?** Read Part 4 for the concepts, then the [Choral Pattern guide](choral/Choral-Pattern.md) for step-by-step setup. Start with the [contract template](templates/contract.md).

**Building a representation agent?** Read Part 5. Follow the architecture, build your own canonical schema. Don't import code from an existing implementation until you've proven the abstraction.

**Voice work?** See the [Voice Framework](voice/Voice-Framework.md) — an optional module for work where tone and consistency matter.

---

*This is a working document, not a manifesto. These patterns work today. Update them when they don't.*
