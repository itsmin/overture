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

### Personalizing Overture

As you use the framework across projects, you'll develop preferences — sections you always want, session checks you rely on, conventions that work for you. Instead of reconfiguring each project, you can create a personal profile:

```
~/.overture/profile.md
```

When you run init on a new project, Overture checks for this file and applies your preferences automatically. Your profile might include things like:

- Sections to always include (privacy checks, cross-project coordination)
- Session workflow additions (deployment health checks, documentation sync for specific domains)
- A voice reference for consistent tone (`~/.overture/voice.md`)
- Conventions you've settled on (PR style, session entry length, work queue structure)

The profile is natural language, not config syntax — describe what you want and init makes it happen.

There's a template to start from at [`templates/profile.md`](templates/profile.md). Copy it to `~/.overture/profile.md` and make it yours.

You don't need a profile to use Overture. Most people start without one and create it after a few projects, once they know what they want to carry forward.

## What Just Happened

Claude now has a file it reads at the start of every session. It knows where your project stands, what you're working on, and what to check before diving in. You maintain one file; Claude handles the continuity.

**A key thing about this repo**: most files here are instructions for Claude, not for you. You don't need to memorize anything. Run the init, answer its questions, and you're set.

## Going Deeper

You don't need to read anything else to use the framework. These are here when you want them:

| When You... | Read This |
|-------------|-----------|
| Want to know what to do next as your project grows | [Progression Guide](Progression.md) — what each level feels like, when to add more |
| Want your preferences to carry into every new project | [Profile Template](templates/profile.md) — your personal Overture customizations |
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
| [`templates/profile.md`](templates/profile.md) | Profile template — personalize what init generates | You |
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

## Voice in Practice

A long-running project accumulates AI-drafted prose: session summaries, commit messages, postmortems, eventually the docs themselves. Unguided, all of it sounds like the model, and readers notice. Overture treats voice as part of the setup. Here is the same bug-fix summary drafted twice.

**No voice context.** A model left to its defaults produces something like:

> Fixed a critical bug in the export pipeline — duplicate rows were appearing in the CSV output. The root cause was a race condition in the cache layer, which has now been comprehensively addressed. Additionally, we refactored the retry logic to be more robust, ensuring seamless recovery from transient failures. This isn't just a bug fix — it's a meaningful reliability improvement, allowing users to trust their exports again.

**Drafted against a voice profile:**

> The export pipeline was duplicating rows. Root cause: the cache layer let two refresh jobs run concurrently, and both wrote the same page (`export-cache.ts:141`). Fixed with a per-key lock and a regression test that trips if a second writer lands. The retry path had the sibling bug; it got the same lock. Two sessions of intermittent reports, one mechanism.

Both drafts report the same fix. The first carries the tells: em-dashes as connective tissue, "robust" and "seamless", "Additionally", an "isn't just X" pivot, a participle tail. No single tell is damning; the density is what reads as machine output. The second was drafted toward a profile: verdict first, mechanism before fix, receipts in parentheses, a closer that lands.

The profile is a file (`~/.overture/voice.md`). The session skills load it whenever the agent writes on your behalf, and [voice/Voice-Framework.md](voice/Voice-Framework.md) covers deriving one from your own writing. Same fix, different author.

---

## Provenance

Overture started in late 2025 as a single CLAUDE.md. The goal: make Claude remember between sessions. 480+ working sessions later, across two production products (a company intelligence platform and a professional representation service), it had become a working framework. Most of what survived wasn't designed. It was extracted from real fires.

Two products had to stay in sync without an integration layer. Without coordination, decisions made for one would drift in the other; what was settled at the boundary in week 4 got re-litigated in week 6. Choral fell out as a working contract. Markdown, written by humans, kept at the project boundary. Not a graph, not a dependency tree. A shared blackboard both sessions read and write.

Editorial drafts started reading as AI-tinted. The structural moves were the author's; the connective tissue had drifted toward AI defaults. Readers spot pattern density, not single words. The fix: encode voice as a discipline. Paired-sample diff against AI-free writing. Profile what survived solo work; ban what didn't. The profile travels with the work. Sessions load it when voice matters.

A CLAUDE.md tripped its size limit. Two options: lossy compression (delete history, lose signal) or systemic refactoring (move content to sibling files, break cross-session continuity). Both worked for a session. Neither worked across months. What landed: size thresholds with explicit compression protocols, canonical section ordering across projects, a NEXT pointer that carries the most-important-next-thing between sessions, deferred-work tracking with a half-life. The operating document is the kit's load-bearing primitive.

Three patterns with the same shape: a problem the ecosystem didn't fix, a fix that survived contact with users. All three are human-mediated. Humans write the contract. Humans encode the voice. Humans maintain the operating doc. The ecosystem mostly tries to automate around the human.

By mid-2026 Anthropic had shipped first-party plugins for most of the table-stakes: session memory, CLAUDE.md audit, frontend design quality, code review automation. Overture is the human-discipline layer the ecosystem doesn't try to be.

Honest gaps are [documented](Working-With-Claude-Code.md#part-6-honest-gaps).

This framework — including its documentation — was built collaboratively with Claude Code, using the patterns described in the kit. The system architecture, workflow design, and judgment calls are the author's; Claude is a collaborator on implementation and documentation. A framework for AI-assisted development should probably be built that way.

---

*Overture is a working kit. It captures patterns that work today, across whichever tools you use tomorrow. Update them when they don't.*
