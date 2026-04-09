# Overture

The setup before the performance. A working framework for AI-assisted development with AI coding agents — [Claude Code](https://claude.ai/code), [Codex CLI](https://openai.com/index/codex-cli), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and any tool supporting the [Agent Skills](https://agentskills.io) standard.

---

## The Problem This Solves

You open your AI coding agent, do good work, close the session. Next time, it remembers nothing. Context lost between sessions. Work gets dropped. Documentation drifts. You become the sole carrier of project state.

Overture fixes that. It gives your agent a structured operating document — current state, priorities, work queue, session handoffs — so every session starts where the last one ended.

Evolved through 480+ working sessions across production SaaS and professional services. Not theoretical patterns. What survived contact with real products, real users, real deadlines.

## What You Need

- An AI coding agent ([Claude Code](https://claude.ai/code), [Codex CLI](https://openai.com/index/codex-cli), [Gemini CLI](https://github.com/google-gemini/gemini-cli), or any [Agent Skills](https://agentskills.io)-compatible tool)
- A project you're using it on

That's it.

## Get Started

### Option A: Plugin Install (Claude Code)

```
/plugin install overture
```

Then in your project directory:

```
/overture:init
```

The init command asks about your project, generates your `CLAUDE.md` (operating document), and sets up `/session-start` and `/session-end` as slash commands.

### Option B: Agent Skills (Any Tool)

Copy the `skills/` directory into your project's skills location:

| Tool | Skills Location |
|------|----------------|
| Claude Code | `.claude/skills/` |
| Codex CLI | `.codex/skills/` or `.agents/skills/` |
| Gemini CLI | `.gemini/skills/` |
| Cursor / Copilot | Workspace skills directory |

Then tell your agent: *"Run the overture-init skill to set up this project."*

### Option C: Manual Setup

Open your AI coding agent in your project directory and say:

> "Read the Overture initialization guide at `[path/to/overture]/templates/init.md` and help me set up this project."

Your agent will:
1. Ask about your project — what it is, what you're working on, any conventions
2. Generate an operating document at your project root (e.g., `CLAUDE.md` for Claude Code)
3. Set up session-start and session-end commands

### After Setup

From then on: run your session-start command at the beginning of each session, session-end before closing. That's the core workflow.

If you don't have user-level preferences yet, ask your agent to also set up your global config (e.g., `~/.claude/CLAUDE.md` for Claude Code).

## What Just Happened

Your agent now has a structured document that loads automatically every session. It knows where the project stands, what's in flight, what to check at session boundaries. You maintain one file (the operating document); the agent handles the continuity.

**A key thing about this repo**: most files here are instructions for your agent, not for you. Skills, templates, commands — the agent reads and follows them. You don't need to memorize anything. Run the init, answer its questions.

## Going Deeper

You don't need to read anything else to use the framework. These are here when you want them:

| When You... | Read This |
|-------------|-----------|
| Want to know what to do next as your project grows | [Progression Guide](Progression.md) — what each level feels like, when to evolve |
| Want to understand *why* the framework works | [Foundations](Working-With-Claude-Code.md) — ICL, memory architecture, context management |
| Want the full methodology reference | [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) — operating document anatomy, session management, hooks, documentation hygiene |
| Are coordinating multiple projects | [Choral Pattern](choral/Choral-Pattern.md) — cross-project coordination with shared contracts |
| Need voice, tone, or editorial consistency | [Voice Framework](voice/) — defining and maintaining voice in AI-assisted work |
| Hit "data is correct but display is wrong" bugs | [Data Authority](patterns/Data-Authority.md) — single source of truth for derived state |
| Want your agent doing quality work between sessions | [Autonomous Background](patterns/Autonomous-Background.md) — scheduled triggers, phased rollout |
| Need to manage operating document growth | [Size Management](patterns/Size-Management.md) — thresholds, archiving, project profiles |
| Setting up a new project's permissions | [Settings Hygiene](patterns/Settings-Hygiene.md) — two-layer settings, credential cleanup |
| Standardizing operating document structure across projects | [Section Ordering](patterns/Section-Ordering.md) — canonical section order |
| Ready to automate session checks | [Hook Templates](templates/hooks/) — scripts, setup, specialization recipes |

---

## What's in the Kit

Most files in this repo are read by your agent, not by you. The **Audience** column tells you who each file is for.

### Plugin & Skills (cross-tool)

| File | Purpose | Audience |
|------|---------|----------|
| [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json) | Claude Code plugin manifest — enables `/plugin install overture` | Agent |
| [`commands/init.md`](commands/init.md) | Plugin init command — `/overture:init` for Claude Code | Agent |
| [`skills/overture-init/`](skills/overture-init/) | Init skill (Agent Skills format) — cross-tool project setup | Agent |
| [`skills/session-start/`](skills/session-start/) | Session-start skill — cross-tool context loading | Agent |
| [`skills/session-end/`](skills/session-end/) | Session-end skill — cross-tool handoff and cleanup | Agent |
| [`glossary.md`](glossary.md) | Controlled vocabulary for tool-agnostic terminology | Both |

### Methodology

| File | Purpose | Audience |
|------|---------|----------|
| [`Progression.md`](Progression.md) | Progression guide — what each level feels like, when to evolve | You |
| [`Working-With-Claude-Code.md`](Working-With-Claude-Code.md) | Conceptual foundations — ICL, memory, Levels 0-4, Choral, Lyrical | You |
| [`workflow/Claude-Code-Workflow-Framework.md`](workflow/Claude-Code-Workflow-Framework.md) | The methodology — session management, operating document anatomy, documentation hygiene | You |
| [`choral/Choral-Pattern.md`](choral/Choral-Pattern.md) | Cross-project coordination — setup, modes, contracts | You |
| [`voice/Voice-Framework.md`](voice/Voice-Framework.md) | Voice methodology — defining, encoding, maintaining voice | You |
| [`voice/Voice-Reference.md`](voice/Voice-Reference.md) | Detailed session structure, derivation, encoding patterns | You |
| [`patterns/Data-Authority.md`](patterns/Data-Authority.md) | Architectural pattern — single source of truth for derived state | You |
| [`patterns/Autonomous-Background.md`](patterns/Autonomous-Background.md) | Scheduled triggers for between-session quality work | You |
| [`patterns/Size-Management.md`](patterns/Size-Management.md) | Operating document size thresholds, archiving protocol, project profiles | You |
| [`patterns/Settings-Hygiene.md`](patterns/Settings-Hygiene.md) | Settings accumulation, two-layer organization, cleanup protocol | You |
| [`patterns/Section-Ordering.md`](patterns/Section-Ordering.md) | Canonical operating document section ordering across projects | You |
| [`patterns/Privacy-Boundary.md`](patterns/Privacy-Boundary.md) | PII filtering at public surfaces — boundary declaration, runtime verification | You |

### Templates & Hooks (manual setup / backwards compatible)

| File | Purpose | Audience |
|------|---------|----------|
| [`templates/init.md`](templates/init.md) | Manual init instructions (use plugin or skills instead) | Agent |
| [`templates/CLAUDE.md`](templates/CLAUDE.md) | Operating document template (Claude Code specific) | Both |
| [`templates/session-start.md`](templates/session-start.md) | Session-start command template | Agent |
| [`templates/session-end.md`](templates/session-end.md) | Session-end command template | Agent |
| [`templates/contract.md`](templates/contract.md) | Cross-project working contract template | Both |
| [`templates/choral.md`](templates/choral.md) | Choral sync command template — mid-session coordination | Agent |
| [`templates/hooks/README.md`](templates/hooks/README.md) | Hook setup, testing, specialization recipes | You |
| [`templates/hooks/session-start.sh`](templates/hooks/session-start.sh) | Automated session-start hook script | Agent (via hook) |
| [`templates/hooks/session-end.sh`](templates/hooks/session-end.sh) | Automated session-end hook script | Agent (via hook) |

## How It Works

Overture is a reference kit and an installable plugin. As a plugin, it's the fastest path to setup. As a repo, it's the methodology documentation and the patterns behind the plugin. Overture is the score; each project is a performance.

### Match the investment to the need

Not every project needs the full framework. Most don't.

| Level | What You Add | When |
|-------|-------------|------|
| **0** | Nothing. Open your agent, ask a question, close. | One-off tasks |
| **1** | Operating document with guidelines and a work queue | Project spans multiple sessions |
| **2** | Session commands, sources of truth, deferred work tracking | Losing context between sessions |
| **3** | Decay, session archives, automation | Operating document growing unwieldy |
| **4** | Cross-project coordination, contracts | Multiple projects sharing integration surfaces |

**Levels 1-2 cover the vast majority of projects.** Levels 3-4 exist for production portfolios with long-running, multi-project development. If you never need them, the framework is working — you matched the investment to the need.

For the full progression framework with decision criteria, see the [Progression Guide](Progression.md).

---

## Provenance

Built across 480+ sessions on a company intelligence platform (shipped December 2025, production SaaS) and a professional representation service (AI-powered interview and representation agents). Cross-project coordination between the two became the Choral pattern. Approaches that didn't work were dropped. Honest gaps are [documented](Working-With-Claude-Code.md#part-6-honest-gaps).

This framework — including its documentation — was built collaboratively with Claude Code, using the patterns described in the kit. The system architecture, workflow design, and judgment calls are the author's; Claude is a collaborator on implementation and documentation. A framework for AI-assisted development should probably be built that way.

---

*Overture is a working kit. It captures patterns that work today, across whichever tools you use tomorrow. Update them when they don't.*
