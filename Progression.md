# Progression Guide — From Zero to Effective

**Part of**: [Overture](README.md) — the Claude Code working kit
**Companion**: [Working with Claude Code, Part 3](Working-With-Claude-Code.md#part-3-the-levels) — why each level works
**Companion**: [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) — the full methodology reference

> **Audience**: You — read this when you want to know what to do next. The conceptual framework explains *why*. This tells you *when* and *how much*.

---

## How to Use This Guide

Each level: what it feels like, what you do, what over-investment looks like, and what tells you to move on. Most projects should stay at 1 or 2. Moving up when you don't need to is just ceremony.

Start from your situation, not from Level 0.

---

## Day-1 Paths

### New project you're starting

Start at **Level 1**. Open Claude Code, point it at the [initialization guide](templates/init.md), answer its questions. Working `CLAUDE.md` and session commands in about 5 minutes. Don't fill in sections you don't have answers for yet — they develop as the project does.

### Existing codebase you're joining

Start at **Level 1**. Same initialization, but Claude reads the codebase first — conventions, structure, patterns. Your `CLAUDE.md` reflects what exists, not what you wish existed. Review what Claude generates. It builds the picture from code, not assumptions.

### Introducing it to a team

Shared `CLAUDE.md` in the repo. Everyone at **Level 1**. Individuals add `~/.claude/CLAUDE.md` for their own preferences. Don't prescribe Level 2 — let the team find the pain points themselves. When someone says "I keep losing track of what I was doing last session," that's when session commands earn their place.

---

## Level 0: Just Claude Code

Open Claude Code, work, close. No persistent state. No setup.

**This is correct for**: one-off tasks, quick questions, scripts you won't revisit, exploring unfamiliar code. No reason to set up infrastructure for work that fits in a single session.

**What it feels like**: Every session starts fresh. Claude has no memory of yesterday. You provide context through conversation.

**Stay here when**: The project won't outlast the session.

**Signal to move on**: You open a second session and spend the first few minutes re-explaining what the project is, what you're working on, what you decided last time. That's waste. Write it down once instead.

---

## Level 1: Project Memory

**What you do**: Create a `CLAUDE.md` at your project root. What the project is, how you work, what's in flight. Claude loads it automatically every session.

**What changes**: Claude knows your project. You stop repeating yourself. First message of each session is about work, not context.

**A good Level 1 CLAUDE.md**:
- Project status — what this is, stage, stack, key constraints
- Collaboration guidelines — how you want Claude to work on this project
- Work queue — what's in progress, what's next
- Critical reminders — hard rules that don't change

Four sections. That's it. Don't add session progress tracking, deferred work tables, metrics validation, or documentation references on day one. Those solve Level 2 problems. At Level 1, you update the work queue manually at the end of each session. Enough.

**First few sessions**: Claude makes fewer wrong assumptions. Respects conventions you wrote down. The work queue means you don't start each session figuring out what to work on. Directed instead of exploratory.

**Over-investment**: A 500-line CLAUDE.md for a project with 3 sessions of history. Session-start/end commands before you've felt the pain of losing context. Tracking metrics that don't exist yet. If you're spending more time on the workflow than the work, you've over-invested.

**Signal to move on**: You finish a session, update the work queue, and realize you forgot something important from three sessions ago. Or you bump a work item and two sessions later can't remember what you bumped or why. Context leaking between sessions despite the CLAUDE.md. The document captures *current state* but not *transitions* — what moved, what got deferred, what needs checking next time.

---

## Level 2: Session Discipline

**What you add**:
- `/session-start` and `/session-end` commands (copy from [templates](templates/))
- Session progress in CLAUDE.md — what happened each session, condensed
- Deferred work tracking — bumped items, with context for resumption
- Sources of truth — which file is authoritative for which data

**What changes**: Sessions have structure. `/session-start` loads context, presents the work queue, surfaces deferred items, asks for alignment before doing anything. `/session-end` forces a sync check — did this session change anything documented elsewhere? Was anything bumped? Clean handoff?

**The rhythm**: `/session-start` at the beginning. `/session-end` before closing. Work normally in between. Thirty seconds each. Checklist, not ceremony.

**First week**: You catch things you used to miss. A deferred item from three sessions ago surfaces and you realize it's still relevant. A sync check catches that you updated pricing in code but not in the business doc. Small overhead. Real saves.

**Over-investment**: Session entries that are 30 lines long (aim for 10). Deferred work tables with 40 items (triage — park or drop). Sync checklists with 15 domains (keep the ones that actually catch drift). Lightweight forcing function, not documentation for its own sake.

**Most projects stay here.** Level 2 handles multi-month projects, hundreds of sessions. The signal to move on is specific and uncommon — don't go looking for it.

**Signal to move on**: CLAUDE.md past 40k characters and growing. Session entries accumulating faster than you archive them. Automation needs — scheduled quality checks, health monitoring, background maintenance — that don't need a human in the loop. Or: multiple projects sharing APIs, data models, or deployment dependencies, and changes in one silently breaking the other.

---

## Level 3: Automation

**What you add**:
- Decay — automated pruning and archival based on age, access frequency, relevance
- Session hooks — shell scripts triggered by Claude Code events (session start/end, tool use)
- Background automation — scheduled quality checks, health monitoring, continuous integration

**When you actually need it**: The project is mature enough that manual maintenance is a real burden. Not a minor inconvenience — a burden. CLAUDE.md is genuinely unwieldy. You have automated processes that benefit from proactive monitoring.

**The honest part**: Level 3 is custom work. No drop-in template. Archiving rules, automated checks, scheduled tasks — built for your project's specific needs. The *pattern* generalizes. The *implementation* doesn't.

**What Overture provides here**: The conceptual framework ([decay](Working-With-Claude-Code.md#decay), [how Claude's memory works](Working-With-Claude-Code.md#part-2-memory-architecture)), documented patterns for [automated session checks](workflow/Claude-Code-Workflow-Framework.md#session-hooks) and [scheduled background tasks](patterns/Autonomous-Background.md), and a [pattern](patterns/Data-Authority.md) for preventing a common class of "data is right but display is wrong" bugs. Not a turnkey solution — but more than just principles. If you're at Level 3, you're experienced enough to adapt these patterns to your project.

**Over-investment**: Automating everything before you know what's worth automating. Build the manual version first. Notice what's repetitive and error-prone. Automate that. Automation built from theory breaks. Automation built from observed repetition works.

---

## Level 4: Cross-Project Coordination

**What you add**:
- A coordination directory with its own CLAUDE.md and mandate
- Working contracts between project pairs — shared blackboards all participants read and write
- Integration monitoring — scripts that detect when one project touches the integration surface
- Real-time hooks — signals between concurrent sessions (optional, for active parallel development)

**When you need it**: Two or more projects that talk to each other — shared APIs, shared data, or deployment dependencies. Not "two projects by the same person" — specifically projects that *interoperate*. Independent projects? Coordinate in your head. Projects that depend on each other? You need a contract.

**What Overture provides**: The full [Choral pattern](choral/Choral-Pattern.md) — setup guide, three coordination modes, contract template, design principles, scaling guidance. Most complete part of the kit at this level because it's been tested across production integrations.

**Start simple**: A directory, a CLAUDE.md, and a contract. Open a coordination session when you need architectural assessment. That's Mode 3 — manual, human-triggered, high-value. Add Modes 2 and 1 incrementally as the overhead justifies them.

---

## Your Overture Profile

This isn't a level — it's something that happens naturally alongside any level. After a few projects, you'll notice you keep making the same choices during init: the same sections, the same session checks, the same conventions. That's when you create a profile.

Your profile lives at `~/.overture/profile.md`. It tells Overture's init what you prefer, so new projects start with your refinements already in place. You can also add a voice reference (`~/.overture/voice.md`) if you've developed one.

**Signal to create one**: You set up a second or third project and find yourself wishing it already had the structure you built in the first one. The profile carries that forward.

**What it replaces**: Without a profile, you either reconfigure each project manually or maintain a personal fork of Overture. The profile is the middle path — your customizations, layered on top of the standard framework, without the maintenance burden of a fork.

See the [profile template](templates/profile.md) to get started.

---

## The Judgment Call

The hard part isn't setting up any level. It's knowing when to stay where you are.

Every level adds overhead. Worth it when it prevents problems you're actually having. Waste when it prevents problems you might have someday.

**When in doubt, stay.** Wait for the signal. It's always some form of losing something — context, work items, cross-project awareness. When you feel that loss, the next level earns its place immediately. You already know the problem it solves.

The goal isn't Level 4. It's the minimum investment that keeps your work from leaking between sessions. For most projects, that's a CLAUDE.md and two slash commands.

---

*Evolved through 475+ working sessions across production products. Levels 1-2 are thoroughly proven. Level 3 is project-specific by nature. Level 4 (Choral) is documented but tested at small scale. [Honest gaps](Working-With-Claude-Code.md#part-6-honest-gaps) are documented.*
