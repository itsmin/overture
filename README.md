# Overture

The setup before the performance. A working framework for AI-assisted development with [Claude Code](https://claude.ai/code).

---

## The Problem This Solves

You open Claude Code, do good work, close the session. Next time, Claude remembers nothing. Context is lost between sessions. Work gets dropped. Documentation drifts. You become the sole carrier of project state.

Overture fixes that. It gives Claude a structured operating document for your project — current state, priorities, work queue, session handoffs — so every session starts where the last one ended.

Evolved through 460+ working sessions across production SaaS and professional services. These aren't theoretical patterns — they're what survived contact with real products, real users, and real deadlines.

## What You Need

- [Claude Code](https://claude.ai/code) installed and running
- A project you're using it on

That's it.

## Get Started

Open Claude Code in your project directory and say:

> "Read the Overture initialization guide at `[path/to/overture]/templates/init.md` and help me set up this project."

Claude will:
1. Ask about your project — what it is, what you're working on, any conventions
2. Generate a `CLAUDE.md` at your project root — your project's operating document
3. Set up `/session-start` and `/session-end` as slash commands

From then on: `/session-start` at the beginning of each session, `/session-end` before closing. That's the core workflow.

If you don't have user-level preferences yet, add: *"Also help me set up `~/.claude/CLAUDE.md`."*

## What Just Happened

Claude now has a structured document that loads automatically at every session start. It knows where your project stands, what's in flight, and what to check at session boundaries. You maintain one file (`CLAUDE.md`); Claude handles the continuity.

**A key thing to understand about this repo**: most of the files here are instructions for Claude, not for you. The templates, commands, and configuration files are things Claude reads and follows. You don't need to memorize them — you point Claude at the initialization guide and answer its questions.

## Going Deeper

You don't need to read anything else to use the framework. These docs are here when you want them:

| When You... | Read This |
|-------------|-----------|
| Want to understand *why* the framework works | [Working with Claude Code](Working-With-Claude-Code.md) — ICL, memory architecture, context management |
| Want the full methodology reference | [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) — CLAUDE.md anatomy, session management, documentation hygiene |
| Are coordinating multiple projects | [Choral Pattern](choral/Choral-Pattern.md) — cross-project coordination with shared contracts |
| Need voice, tone, or editorial consistency | [Voice Framework](voice/) — defining and maintaining voice in AI-assisted work |

---

## What's in the Kit

Most files in this repo are read by Claude, not by you. The **Audience** column tells you who each file is for.

| File | Purpose | Audience |
|------|---------|----------|
| [`templates/init.md`](templates/init.md) | Instructions Claude follows to set up a new project | Claude |
| [`templates/CLAUDE.md`](templates/CLAUDE.md) | Project operating document — status, guidelines, work queue | Both — Claude reads it, you maintain it |
| [`templates/session-start.md`](templates/session-start.md) | Session-start command — context loading, work queue presentation | Claude |
| [`templates/session-end.md`](templates/session-end.md) | Session-end command — documentation sync, handoff, cleanup | Claude |
| [`templates/contract.md`](templates/contract.md) | Cross-project working contract for coordination | Both |
| [`Working-With-Claude-Code.md`](Working-With-Claude-Code.md) | Conceptual foundations — ICL, memory, Levels 0-4, Choral, Lyrical | You |
| [`workflow/Claude-Code-Workflow-Framework.md`](workflow/Claude-Code-Workflow-Framework.md) | The methodology — session management, CLAUDE.md anatomy, documentation hygiene | You |
| [`choral/Choral-Pattern.md`](choral/Choral-Pattern.md) | Cross-project coordination — setup, modes, contracts | You |
| [`voice/Voice-Framework.md`](voice/Voice-Framework.md) | Voice methodology — defining, encoding, maintaining voice | You |
| [`voice/Voice-Reference.md`](voice/Voice-Reference.md) | Detailed session structure, derivation, encoding patterns | You |

## How It Works

Overture is a reference kit, not a dependency. It doesn't live in your project — your project gets its own files generated from the templates. Overture is the score; each project is a performance.

### Match the investment to the need

Not every project needs the full framework. Most don't.

| Level | What You Add | When |
|-------|-------------|------|
| **0** | Nothing. Open Claude Code, ask a question, close. | One-off tasks |
| **1** | `CLAUDE.md` with guidelines and a work queue | Project spans multiple sessions |
| **2** | Session commands, sources of truth, deferred work tracking | Losing context between sessions |
| **3** | Decay, session archives, automation | CLAUDE.md growing unwieldy |
| **4** | Cross-project coordination, contracts | Multiple projects sharing integration surfaces |

**Levels 1-2 cover the vast majority of projects.** Levels 3-4 exist for production portfolios with long-running, multi-project development. If you never need them, the framework is working correctly — you matched the investment to the need.

For the full progression framework with decision criteria, see [Levels of Sophistication](Working-With-Claude-Code.md#part-3-the-levels).

---

## Provenance

Built across 460+ sessions on a company intelligence platform (shipped December 2025, production SaaS) and a professional representation service (AI-powered interview and representation agents). The cross-project coordination between the two became the Choral pattern. Approaches that didn't work were dropped. Honest gaps are [documented](Working-With-Claude-Code.md#part-6-honest-gaps).

---

*Overture is a working kit. It captures patterns that work today. Update them when they don't.*
