# Claude Code Workflow Framework

**Version**: 2.0 — March 2026
**Evolved through**: 460+ working sessions across production SaaS and professional services products
**Previous**: v1.0 (December 2025, ~170 sessions)
**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Working with Claude Code](../Working-With-Claude-Code.md) — conceptual foundations (ICL, memory tiers, Levels 0-4)

> **Audience**: You — this is the methodology reference. Read it to understand how to structure your CLAUDE.md, manage sessions, and maintain documentation. Claude uses the patterns described here but doesn't read this file directly.

---

## What This Is

A methodology for using Claude Code effectively on real projects. Not a Claude Code tutorial — this assumes you know what Claude Code is and have it running.

This framework shows you how to build working patterns that survive across hundreds of sessions: continuity, documentation hygiene, context management, and cross-project coordination that go beyond what the tool provides out of the box.

### What Claude Code Gives You (Primitives)

| Feature | What It Does |
|---------|-------------|
| `CLAUDE.md` hierarchy | User, project, enterprise, and local instruction files — auto-loaded every session |
| Custom commands | `.claude/commands/*.md` — slash commands for repeatable workflows |
| Auto memory | Persistent typed memories (user, feedback, project, reference) in `.claude/projects/` |
| Hooks | Shell commands triggered by tool calls and session events |
| Tasks & Plans | Within-conversation work tracking and implementation planning |

### What This Framework Adds

Primitives don't tell you how to use them well. This framework is the methodology layer:

- **Structured CLAUDE.md as operating document** — not just instructions, but current state, work queues, session progress, sources of truth, deferred work tracking
- **Cross-session continuity** — session-start and session-end disciplines that prevent context loss between conversations
- **Documentation hygiene** — sources of truth, domain-specific sync checks, staleness monitoring
- **Decay** — pruning and archival patterns that keep project context lean and relevant as it grows
- **Cross-project coordination** — contracts and coordination sessions for multi-project work

Auto memory stores discrete facts ("user prefers X"). Your CLAUDE.md is a curated operating document ("here's where the project stands, what's in flight, and what's next"). Use both — they serve different purposes.

---

## Setting Up

### User Preferences (`~/.claude/CLAUDE.md`)

This file loads into every Claude Code session on your machine, across all projects. Use it for:

- **How you want Claude to work** — partnership style, communication preferences, decision-making autonomy, obstacle-handling approach
- **Universal rules** — documentation standards, quality expectations, research habits, prioritization defaults
- **Project portfolio** — active projects with paths and brief descriptions
- **Cross-project coordination** — pointers to coordination mechanisms, if applicable

This is personal. It travels with you to any project, any employer. Don't put project-specific content here.

### Project Setup

Copy `templates/CLAUDE.md` into your project root and fill in the sections. Then copy `templates/session-start.md` and `templates/session-end.md` into `.claude/commands/`.

Not all sections are needed from day one. Start with product status, collaboration guidelines, and a work queue. Add metrics tracking, deferred work, session archives, and cross-project coordination as the project matures. (See the [Progression Guide](../Progression.md) for when to add what.)

### Initialization

If starting from scratch, open Claude Code in your project directory:

> "Read the Overture initialization guide at `[path/to/overture]/templates/init.md` and the other templates in that directory. Help me set up this project."

Claude follows the initialization guide: asks about your project, generates your CLAUDE.md and session commands, and confirms the setup. The init guide (`templates/init.md`) has the step-by-step instructions Claude follows.

---

## CLAUDE.md Anatomy

A mature project CLAUDE.md has these sections. This is the full anatomy — your project grows into it over time.

### Product/Project Status

Lead with what this is and where it stands. This grounds every session:

```markdown
## PRODUCT STATUS

**[Name]** is [shipped/in development/prototype].

- **Stage**: [MVP / Soft Launch / Production]
- **Users**: [Who uses this, how many]
- **Stack**: [Key technologies]
- **Infrastructure**: [Where it runs, rough cost]
```

This section changes rarely. It prevents Claude from making wrong assumptions about the project's maturity, audience, or constraints.

### Collaboration Guidelines

Reference your user preferences, add project-specific rules, and define coordination hooks if the project participates in multi-project work:

```markdown
## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Project-Specific Guidelines**:
1. [Rule specific to this project — e.g., "Mobile-first, not mobile-only"]
2. [Another rule — e.g., "LLM prompt changes require full audit across all prompts"]

### Cross-Project Coordination
[If applicable — see Cross-Project Coordination section below]
```

Project-specific guidelines should encode lessons learned. If session #234 discovered that a bug existed in all 8 LLM prompts because only one was fixed, the guideline "LLM prompt changes require full audit" prevents the same class of failure.

### Current Metrics (Sources of Truth)

Track key metrics with explicit source references:

```markdown
## CURRENT METRICS (Sources of Truth)

| Metric | Value | Source of Truth |
|--------|-------|-----------------|
| [Metric] | [Value] | [Authoritative file or system] |

**Last Validated**: [Date] (Session #XX)
```

**Why source references matter**: Without them, metrics drift. Someone updates CLAUDE.md without updating the code (or vice versa), and now the session is reasoning against stale data. The source reference makes verification possible.

Validate these at session start. Not exhaustively — a quick check. Flag discrepancies for resolution.

### Session Workflow

Define what happens at session boundaries:

```markdown
## SESSION WORKFLOW

### At `/session-start`:
1. Present work queue from this document
2. Check deferred work — review items bumped in previous sessions
3. Note any in-progress work from Session Progress
4. [Project-specific checks]
5. Wait for direction

### During session:
- Stay aligned with work queue unless redirected
- Monitor context usage — find clean stopping points proactively
- Web search to validate approaches when uncertain

### Before `/session-end`:
- Update Session Progress if mid-implementation
- Documentation Sync Check
- Add bumped items to Deferred Work
- Commit changes if appropriate
```

The specifics vary by project. A product with a database might check an admin queue at session start. A project with cross-project coordination reads the contract. Customize to what your project actually needs.

### Session Progress

What's in flight, what's next, and what needs verification across sessions:

```markdown
## SESSION PROGRESS

**Current**: Session #XX complete. [Brief description.]
**Status**: [Deployment state, branch state, etc.]

### Pending Verifications
- **#XX**: [Thing that needs checking in a future session]

### Session #XX Complete ([Date])
**[Session Title]**
- [Key outcome 1]
- [Key outcome 2]
- **Deployment**: vXXX (if applicable)
```

**Pending verifications** track items you can't confirm in the current session — things that need a deploy cycle, a user test, a time delay, or a specific trigger to observe. Without explicit tracking, these get forgotten.

**Session entries** should be condensed (~10 lines max). Write for the next session, not for posterity.

### Work Queue

Structure work by priority. Items move between states:

```markdown
## WORK QUEUE

### CURRENT PRIORITIES
**P1: [Feature/Fix Name]**
- [Details, context, approach]

### COMPLETE (Recent)
| Feature | Session | Notes |
|---------|---------|-------|
| [Feature] | #XX | [Brief] |

### P2: [POST-MILESTONE or FUTURE]
[Planned work]

### PARKING LOT
| Item | Reason |
|------|--------|
| [Item] | [Why it's parked] |
```

**COMPLETE (Recent)** keeps the last ~10 completed items visible — enough context to see momentum and recent decisions. Older completions move to session archives.

**PARKING LOT** is for ideas worth keeping but not worth pursuing now. Items here should have a reason (not just "later") so you can evaluate whether to revive them.

### Deferred Work

Items that were planned but bumped. This is the anti-lost-work mechanism:

```markdown
## DEFERRED WORK

### [Category — e.g., UX/Product, Infrastructure, Data Quality]
| Item | Originally From | Context |
|------|-----------------|---------|
| [Item] | Session #XX | [What's needed to resume] |
```

**Categorize by domain** rather than listing everything flat. This makes the table scannable and reveals patterns — if you keep deferring infrastructure work, that's a signal.

### Critical Reminders

Hard rules that don't change. Invariants for the project:

```markdown
## CRITICAL REMINDERS

1. **NEVER** [do this dangerous thing]
2. **ALWAYS** [do this essential thing]
3. **NEVER** commit [sensitive files or directories]
```

These are guardrails, not suggestions. Short, absolute, rarely updated. Things like "NEVER modify working cache logic" or "ALWAYS run the full deployment pipeline" — rules that exist because someone broke something once.

### Development Workflow

Quick reference for common operations:

```markdown
## DEVELOPMENT WORKFLOW

### Deployment
[Deployment commands and steps]

### Environment Setup
[Environment variables, tools, account management]
```

Keep this as a reference card, not documentation. If your deployment is complex, point to a dedicated doc.

### Documentation Reference

Index of supporting documents:

```markdown
## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| [Doc] | `path/to/doc.md` | Session #XX | [Brief description] |
```

This index lets session-start check for staleness and lets Claude find relevant context without loading everything upfront.

### Session Archives

When CLAUDE.md grows past ~40k characters, archive old session entries:

```markdown
## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| `docs/SESSIONS_001_050.md` | #1-#50 | [Date range] |
```

Archive the session history, not the work queue or metrics. Those stay in CLAUDE.md as living sections. The archives become cold storage — available if you need to investigate history, not loaded by default.

---

## Session Commands

Create these in `.claude/commands/`. Full templates are in `templates/session-start.md` and `templates/session-end.md`.

### session-start

The session-start command loads context and presents current state:

1. **Metrics validation** — Quick check of CLAUDE.md metrics against sources of truth. Flag discrepancies.
2. **Documentation health** — Check documentation reference table for staleness (>7 days since update = warning).
3. **Deferred work** — Present bumped items from the deferred work table.
4. **Pending verifications** — Surface items from previous sessions that need checking.
5. **Cross-project contracts** — If applicable, check for approved work items requiring this project's implementation.
6. **Work queue** — Present current priorities.
7. **Alignment** — "Before diving in: does today's work advance the project's current goals?"

Then: "Session context loaded. Ready to work."

### session-end

The session-end command ensures clean handoff to the next session:

1. **Session summary** — What was accomplished this session.
2. **Documentation sync check** — Domain-specific questions:
   - Did changes affect pricing/tiers? → Update pricing config + business docs
   - Did changes affect data/entities? → Run pipelines + update architecture docs
   - Did changes affect infrastructure? → Update cost docs
   - Did changes affect automation? → Update automation docs
   - Customize these domains to your project.
3. **Deferred work capture** — Were any planned items bumped? Add to the table with context.
4. **CLAUDE.md update**:
   - Update metrics if values changed
   - Add condensed session entry (~10 lines max)
   - If approaching ~40k characters, archive old sessions
5. **Cross-project contracts** — Update implementation status if applicable.
6. **Final checklist**:
   - Source of truth updates: done / not needed
   - Documentation sync: done / N/A per doc
   - Deferred work tracked: done / none bumped
   - Commit ready

**Session complete. Safe to exit.**

---

## Documentation Hygiene

### Sources of Truth

Every tracked metric or configuration value has one authoritative location. Define these explicitly:

| Domain | Source of Truth | Updated By | Secondary Docs |
|--------|---------------|------------|----------------|
| Pricing | Config files + payment provider | Code changes | Business docs |
| Data counts | Database / registry files | Pipeline runs | Architecture docs |
| Infrastructure costs | Provider dashboards | Monthly review | Business docs |

**Rule**: Update the source of truth FIRST, then documentation. Never the reverse. If you update CLAUDE.md without updating the code, you've created drift that the next session will trust.

### Documentation Sync

The session-end sync check is a forcing function. Without it, documentation drift accumulates silently — one session forgets to update the architecture doc after changing the entity pipeline, then the next session reasons against stale architecture.

Customize the sync checklist to your project's actual domains. The point isn't the specific questions — it's the habit of asking "did this session change anything that's documented elsewhere?"

### Decay

CLAUDE.md grows. Session entries accumulate. Deferred work tables expand. Without pruning, the document becomes a wall of text the model skims past — and your critical instructions on line 400 get ignored.

**Pruning parameters:**
- **Age** — How old is this information? Session entries older than ~15-20 sessions are archival candidates.
- **Magnitude** — How many sessions did this concept persist across? High-magnitude items are core truths. Don't prune them.
- **Last access** — When was this information last referenced in a session? Unreferenced items are candidates.
- **Grace period** — Archived items leave a pointer (the session archives table) before full removal. Safety net for the transition.

This is cache eviction for documentation. The mechanism is session archives — batch old session entries to separate files, keep an index in CLAUDE.md.

**The honest part**: Things get dropped. The bet is that old enough approximates unimportant enough. If you don't notice something's gone within the grace period, it probably wasn't load-bearing. Keeping everything fails harder — the model ignores your instructions because they're buried in noise, and you don't know it's happening.

### Preventing Lost Work

The deferred work table is the mechanism. Rules:

1. **Never let a planned item disappear silently.** If an item is bumped, it goes in the table with: what it was, where it came from, and what's needed to resume.
2. **Review at session start.** Items deferred for many sessions need to be explicitly parked (moved to parking lot with rationale) or reconsidered.
3. **Categorize by domain.** A flat list of 20 deferred items is unreadable. Group them so patterns surface.

---

## Cross-Project Coordination

When projects share integration surfaces — APIs, data models, URL patterns, deployment dependencies — changes in one can break the other silently. Coordination prevents this.

### When You Need It

- Two or more projects consume each other's APIs or data
- URL patterns in one project are hardcoded in another
- Deployment of one project requires sequencing with another
- Architectural decisions in one project constrain another

If none of these apply, skip this section entirely.

### How It Works

See the [Choral Pattern](../Working-With-Claude-Code.md#part-4-choral--the-coordination-pattern) for the full coordination model. The short version:

1. A **coordination session** reads multiple project codebases (read-only — it does not implement)
2. It identifies integration opportunities and writes recommendations to a **working contract**
3. The contract encodes decision authority — project sessions own product-scoped decisions within their domain; cross-cutting architectural changes require your approval
4. Each project session reads the contract at session start and implements approved items
5. Project sessions update the contract with implementation status

### Coordination in CLAUDE.md

Each coordinated project adds a coordination section to its collaboration guidelines:

```markdown
### Cross-Project Coordination

**[Coordinator]** (`/path/to/coordinator/`): Coordinates [Project A] <> [Project B].
Contract: `/path/to/coordinator/contracts/a-b.md`

**At session start**: Read the contract's APPROVED WORK section.
**During session**: Note changes to any integration surface in the contract.
**At session end**: Update IMPLEMENTATION STATUS for approved items completed.

**Key integration points**:
- [Specific APIs, URLs, schemas shared between projects]
```

The contract template is available at `templates/contract.md`.

---

## Context Management

Every session starts with a finite context window. What you load into it determines the quality of reasoning for the entire session.

### Load Deliberately

- **Always loaded**: CLAUDE.md (automatic), user preferences (automatic)
- **On invocation**: Session commands (when you run them)
- **On demand**: Source files, documentation, external context — loaded as needed for the task at hand

### Don't Pre-Load Everything

Loading 30,000 tokens of architecture docs when only 2,000 are relevant wastes context budget and degrades attention quality. The documentation reference table in CLAUDE.md exists specifically so you can point Claude at relevant docs on demand rather than loading them all at session start.

### Monitor During Session

Watch for signs of context pressure:
- Claude starts missing instructions that are in CLAUDE.md
- Responses become less specific or lose project context
- Long conversations with many file reads

Find clean stopping points proactively. A well-closed session (with session-end) followed by a fresh session beats pushing through with degraded context every time.

---

## Anti-Patterns

1. **Skipping session-end** — The #1 source of drift. Most context loss happens when sessions end without proper handoff. Session Progress is how the next session picks up where you left off. Skip it, and the next session starts cold.

2. **Letting deferred items vanish** — If an item is bumped, track it. Silent disappearance is lost work. "We'll get to it" without a deferred work entry means you won't.

3. **Duplicating authoritative information** — Define one source of truth per domain. Documentation references it, doesn't repeat it. When two sources disagree, which one is right? If you can't answer instantly, you have a drift problem.

4. **Growing CLAUDE.md indefinitely** — Context windows are finite. Attention degrades in long documents. Archive old sessions. Prune stale content. Decay is not optional past ~20 sessions.

5. **Loading everything into context** — A cluttered desk is worse than a focused one, regardless of surface area. Load what's relevant to today's work.

6. **Patching instances instead of patterns** — When you find a bug, ask: "What class of problem is this? What other instances exist?" A fix that addresses one instance of a systemic pattern is incomplete. If a prompt has a bug, check all prompts.

7. **Deferring systemic solutions** — If a narrow fix reveals a broader pattern, address the pattern now. "Next session" is where deferred patterns go to die.

8. **Updating docs without updating code** — Source of truth first, always. Updating CLAUDE.md metrics without updating the actual config is worse than not updating at all — it creates confident incorrectness.

9. **Inferring urgency from context** — A production bug doesn't automatically justify a quick fix. Sound architecture over speed unless urgency is explicitly stated. Ask if unsure.

10. **Session-hopping without handoff** — Always update Session Progress before ending. The next session's Claude has zero memory of what happened. Zero. Everything you don't write down is lost.

---

## Getting Started

### New Project Checklist

1. Verify `~/.claude/CLAUDE.md` exists with your working preferences
2. Copy `templates/CLAUDE.md` to your project root, fill in the sections
3. Copy `templates/session-start.md` to `.claude/commands/session-start.md`
4. Copy `templates/session-end.md` to `.claude/commands/session-end.md`
5. Define sources of truth in Current Metrics
6. Run your first `/session-start`

### When to Level Up

Start with what you need. Add infrastructure as the project demands it:

| Signal | What to Add | Level |
|--------|------------|-------|
| Project persists beyond one session | CLAUDE.md with guidelines + work queue | 1 |
| Losing context between sessions | Session commands, sources of truth, deferred work tracking | 2 |
| CLAUDE.md grows unwieldy, maintenance is manual burden | Decay, session archives, automation | 3 |
| Multiple projects share integration surfaces | Cross-project coordination, contracts | 4 |

A weekend script at Level 2 is wasted effort. A production product portfolio at Level 1 is flying blind. Match the investment to the need.

See the [Progression Guide](../Progression.md) for the full progression framework with day-1 paths and decision criteria.

---

*This framework is a working document. It captures patterns that work today. Update it when they don't.*
