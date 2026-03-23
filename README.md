# Overture

The setup before the performance. A portable framework for AI-assisted development with Claude Code — from single projects to multi-project orchestration.

Evolved through 460+ working sessions across production SaaS (company intelligence platform) and professional services (AI-powered professional representation). These aren't theoretical patterns — they're what survived contact with real products, real users, and real deadlines.

---

## Quick Start

Open Claude Code in your project directory and say:

> "Read the Overture workflow framework at `[path/to/overture]` and the templates directory. Help me set up this project."

Claude reads the methodology, asks about your project, and generates your CLAUDE.md and session commands.

If you don't have `~/.claude/CLAUDE.md` (user-level preferences) yet, say:

> "Also help me set up my user preferences at `~/.claude/CLAUDE.md`."

---

## What's in the Kit

| File | What It Is | Start Here? |
|------|-----------|-------------|
| [`workflow/Claude-Code-Workflow-Framework.md`](workflow/Claude-Code-Workflow-Framework.md) | The methodology. Session management, documentation hygiene, context management, cross-project coordination. | Yes — this is the load-bearing document. |
| [`Working-With-Claude-Code.md`](Working-With-Claude-Code.md) | Conceptual foundations. ICL, memory architecture, Levels 0-4, the Choral pattern. | Read if you want to understand *why* the methodology works. |
| [`choral/Choral-Pattern.md`](choral/Choral-Pattern.md) | Standalone guide to the Choral pattern — cross-project coordination setup, flow, and contracts. | Read when coordinating multiple projects. |
| [`templates/`](templates/) | Copy-and-fill skeletons for project CLAUDE.md, session commands, and coordination contracts. | Use these to set up a new project. |
| [`voice/`](voice/) | Optional module. How to establish and maintain voice in AI-assisted work — editorial, agent, product. | Load when voice matters for the work at hand. |

### Templates

| Template | Purpose |
|----------|---------|
| [`templates/CLAUDE.md`](templates/CLAUDE.md) | Project operating document — status, guidelines, metrics, work queue, session progress |
| [`templates/session-start.md`](templates/session-start.md) | Session-start command — context loading, metrics validation, work queue |
| [`templates/session-end.md`](templates/session-end.md) | Session-end command — documentation sync, handoff, cleanup |
| [`templates/contract.md`](templates/contract.md) | Cross-project working contract for multi-project coordination |

---

## How It Works

Overture is a reference kit, not a dependency. It doesn't live in your project — your project gets its own files generated from Overture's templates and methodology. Overture is the score; each project is a performance.

### Levels of Investment

Not every project needs the full framework. Match the investment to the need:

| Level | What You Add | When |
|-------|-------------|------|
| **0** | Nothing. Open Claude Code, ask a question, close. | One-off tasks. |
| **1** | CLAUDE.md with guidelines + work queue. | Project persists beyond one session. |
| **2** | Session commands, sources of truth, deferred work tracking. | Losing context between sessions. Work getting dropped. |
| **3** | Digestive system, session archives, automation. | CLAUDE.md growing unwieldy. Manual maintenance burden. |
| **4** | Cross-project coordination, contracts. | Multiple projects sharing integration surfaces. |

A weekend script at Level 2 is wasted effort. A production product at Level 1 is flying blind.

---

## Provenance

This framework was developed building:
- A **company intelligence platform** (350+ Claude Code sessions, shipped December 2025, production SaaS with real users and revenue)
- A **professional representation service** (108+ sessions, AI-powered interview and representation agents)
- **Cross-project coordination** between the two (the Choral pattern — a Claude Code session that reads both codebases and writes architectural recommendations to a shared contract)

The patterns here are what survived. Approaches that didn't work were dropped. Honest gaps are documented.

---

## Voice Module

The `voice/` directory is an optional module for work where tone, personality, and consistency matter — editorial content, AI agent design, product UX copy, professional representation.

Load it when voice is relevant. Ignore it when the work is purely mechanical.

- [`Voice-Framework.md`](voice/Voice-Framework.md) — Methodology: how to define, encode, and maintain voice
- [`Voice-Reference.md`](voice/Voice-Reference.md) — Detailed session structure, derivation approach, encoding patterns

---

*Overture is a working kit. It captures patterns that work today. Update it when they don't.*
