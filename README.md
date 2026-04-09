# Overture

The setup before the performance. A working framework for getting more out of AI coding tools like [Claude Code](https://claude.ai/code) — so your agent remembers what you're working on, session after session.

Also works with [Codex CLI](https://openai.com/index/codex-cli), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and any tool supporting the [Agent Skills](https://agentskills.io) standard.

---

## The Problem This Solves

You open Claude Code, do good work, close the session. Next time, it remembers nothing. You re-explain your project, re-state your priorities, re-describe what you were working on. Context lost. Work gets dropped. You become the sole carrier of project state.

Overture fixes that. It gives your agent a structured file — your project's current state, priorities, work queue, and session handoffs — so every session starts where the last one ended.

Evolved through 480+ working sessions across real products with real users and real deadlines. Not theoretical patterns. What survived contact with production work.

## What You Need

- [Claude Code](https://claude.ai/code) (or another AI coding tool — see [other tools](#option-b-agent-skills-any-tool))
- A project you're using it on

That's it.

## Get Started

### Option A: Plugin Install (Claude Code)

In any Claude Code session, run these two commands:

```
/plugin marketplace add itsmin/overture
/plugin install overture@overture
```

Then open Claude Code in your project folder and run:

```
/overture:init
```

This walks you through setup — it asks about your project and generates everything for you, including a `CLAUDE.md` file (the file Claude reads every session to know your project) and `/session-start` and `/session-end` commands.

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

From then on: run `/session-start` at the beginning of each session, `/session-end` before closing. That's the core workflow.

If you haven't set up personal preferences that apply across all your projects, ask Claude to help you create a `~/.claude/CLAUDE.md` — this tells Claude how you like to work, regardless of which project you're in.

## What Just Happened

Claude now has a file it reads at the start of every session. It knows where your project stands, what you're working on, and what to check before diving in. You maintain one file; Claude handles the continuity.

**A key thing about this repo**: most files here are instructions for Claude, not for you. You don't need to memorize anything. Run the init, answer its questions, and you're set.

## Going Deeper

You don't need to read anything else to use the framework. These are here when you want them:

| When You... | Read This |
|-------------|-----------|
| Want to know what to do next as your project grows | [Progression Guide](Progression.md) — what each level feels like, when to add more |
| Want to understand *why* the framework works | [Foundations](Working-With-Claude-Code.md) — how Claude's memory works, why structure helps |
| Want the full methodology reference | [Workflow Framework](workflow/Claude-Code-Workflow-Framework.md) — how to structure your CLAUDE.md, session management, keeping docs current |
| Are coordinating multiple projects | [Choral Pattern](choral/Choral-Pattern.md) — keeping projects in sync when they depend on each other |
| Need voice, tone, or editorial consistency | [Voice Framework](voice/) — defining and maintaining a consistent voice in AI-assisted work |
| Hit "data is correct but display is wrong" bugs | [Data Authority](patterns/Data-Authority.md) — making sure there's one source of truth for each piece of data |
| Want Claude doing quality work between sessions | [Autonomous Background](patterns/Autonomous-Background.md) — scheduled checks that run without you |
| Your CLAUDE.md is getting too long | [Size Management](patterns/Size-Management.md) — when and how to archive old content |
| Setting up permissions for a new project | [Settings Hygiene](patterns/Settings-Hygiene.md) — organizing settings, cleaning up credentials |
| Want consistent CLAUDE.md structure across projects | [Section Ordering](patterns/Section-Ordering.md) — standard section order |
| Ready to automate session start/end checks | [Hook Templates](templates/hooks/) — scripts that run automatically at session boundaries |

---

## What's in the Kit

Most files in this repo are read by your agent, not by you. The **Audience** column tells you who each file is for.

### Plugin & Skills

| File | Purpose | Audience |
|------|---------|----------|
| [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json) | Plugin configuration — makes Overture installable | Agent |
| [`commands/init.md`](commands/init.md) | The `/overture:init` setup command | Agent |
| [`skills/overture-init/`](skills/overture-init/) | Project setup instructions (works across different AI tools) | Agent |
| [`skills/session-start/`](skills/session-start/) | What to do at the start of each session | Agent |
| [`skills/session-end/`](skills/session-end/) | What to do at the end of each session | Agent |
| [`glossary.md`](glossary.md) | Shared terminology across tools | Both |

### Methodology

| File | Purpose | Audience |
|------|---------|----------|
| [`Progression.md`](Progression.md) | When to add more structure, and when to stop | You |
| [`Working-With-Claude-Code.md`](Working-With-Claude-Code.md) | Why the framework works — how Claude's memory and context function | You |
| [`workflow/Claude-Code-Workflow-Framework.md`](workflow/Claude-Code-Workflow-Framework.md) | Full reference — session management, CLAUDE.md structure, keeping docs current | You |
| [`choral/Choral-Pattern.md`](choral/Choral-Pattern.md) | Coordinating work across multiple projects | You |
| [`voice/Voice-Framework.md`](voice/Voice-Framework.md) | Defining and maintaining a consistent voice | You |
| [`voice/Voice-Reference.md`](voice/Voice-Reference.md) | Detailed voice session structure and encoding patterns | You |
| [`patterns/Data-Authority.md`](patterns/Data-Authority.md) | Ensuring one source of truth for each piece of data | You |
| [`patterns/Autonomous-Background.md`](patterns/Autonomous-Background.md) | Scheduled checks that run between sessions | You |
| [`patterns/Size-Management.md`](patterns/Size-Management.md) | When and how to archive old CLAUDE.md content | You |
| [`patterns/Settings-Hygiene.md`](patterns/Settings-Hygiene.md) | Organizing settings, cleaning up over time | You |
| [`patterns/Section-Ordering.md`](patterns/Section-Ordering.md) | Standard CLAUDE.md section order across projects | You |
| [`patterns/Privacy-Boundary.md`](patterns/Privacy-Boundary.md) | Keeping personal data out of public-facing surfaces | You |

### Templates & Hooks (manual setup)

| File | Purpose | Audience |
|------|---------|----------|
| [`templates/init.md`](templates/init.md) | Manual setup instructions (use the plugin instead if you can) | Agent |
| [`templates/CLAUDE.md`](templates/CLAUDE.md) | CLAUDE.md template | Both |
| [`templates/session-start.md`](templates/session-start.md) | Session-start command template | Agent |
| [`templates/session-end.md`](templates/session-end.md) | Session-end command template | Agent |
| [`templates/contract.md`](templates/contract.md) | Cross-project coordination contract template | Both |
| [`templates/choral.md`](templates/choral.md) | Mid-session coordination command template | Agent |
| [`templates/hooks/README.md`](templates/hooks/README.md) | Automation setup — scripts that run at session boundaries | You |
| [`templates/hooks/session-start.sh`](templates/hooks/session-start.sh) | Automated session-start script | Agent (via hook) |
| [`templates/hooks/session-end.sh`](templates/hooks/session-end.sh) | Automated session-end script | Agent (via hook) |

## How It Works

Overture is a reference kit and an installable plugin. As a plugin, it's the fastest path to setup. As a repo, it's the methodology documentation and the patterns behind the plugin.

### Match the investment to the need

Not every project needs the full framework. Most don't.

| Level | What You Add | When |
|-------|-------------|------|
| **0** | Nothing. Open Claude Code, ask a question, close. | One-off tasks |
| **1** | A CLAUDE.md with project info and a work queue | Project spans multiple sessions |
| **2** | Session start/end commands, deferred work tracking | Losing context between sessions |
| **3** | Archiving, automation, scheduled checks | CLAUDE.md getting too long to manage |
| **4** | Cross-project coordination | Multiple projects that depend on each other |

**Levels 1-2 cover the vast majority of projects.** Levels 3-4 exist for long-running projects or portfolios with multiple interconnected products. If you never need them, the framework is working — you matched the investment to the need.

For the full guide with "when to move up" signals, see the [Progression Guide](Progression.md).

---

## Provenance

Built across 480+ sessions on two production products — a company intelligence platform and a professional representation service. Cross-project coordination between the two became the Choral pattern. Approaches that didn't work were dropped. Honest gaps are [documented](Working-With-Claude-Code.md#part-6-honest-gaps).

This framework — including its documentation — was built collaboratively with Claude Code, using the patterns described in the kit. The system architecture, workflow design, and judgment calls are the author's; Claude is a collaborator on implementation and documentation. A framework for AI-assisted development should probably be built that way.

---

*Overture is a working kit. It captures patterns that work today, across whichever tools you use tomorrow. Update them when they don't.*
