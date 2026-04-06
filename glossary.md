# Overture Glossary

Controlled vocabulary for tool-agnostic documentation. Use these terms in methodology docs and cross-tool skills. Tool-specific terms appear only in adapter-layer files (plugin commands, hook configs, tool-specific READMEs).

## Terms

| Overture Term | Definition | Tool-Specific Variants |
|---|---|---|
| **operating document** | The structured file the agent reads at session start. Project status, guidelines, work queue, session progress. | `CLAUDE.md` (Claude Code), `AGENTS.md` (Codex), `GEMINI.md` (Gemini CLI) |
| **user-level preferences** | Global config loaded into every session across all projects. Personal working style, cross-project context. | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md` |
| **AI coding agent** | The tool that reads the operating document and follows session workflows. Use "your agent" in direct address. | Claude Code, Codex CLI, Gemini CLI, Cursor, Copilot |
| **session command** | An explicitly invoked action that triggers session-start or session-end workflows. | Slash command (Claude Code), skill invocation (Codex), `/command` (Gemini CLI) |
| **session commands directory** | Where project-local session commands are stored. | `.claude/commands/`, `.codex/skills/`, `.gemini/commands/` |
| **command** | A named, explicitly invoked action. | Slash command (Claude Code), `$skill-name` (Codex), `/command` (Gemini CLI) |
| **agent memory** | Platform-specific persistent memory between sessions. | Auto memory / `.claude/projects/` (Claude Code), context memory (Codex), `/memory` (Gemini CLI) |
| **hook** | A shell script triggered by agent events (session start/end, tool use). | `hooks.json` (Claude Code), config-based (Codex), settings-based (Gemini CLI) |
| **skill** | A portable set of agent instructions in Agent Skills format. Universal across tools. | `SKILL.md` + optional `scripts/`, `references/`, `assets/` |
| **context window** | Working memory available during a single session. | Already universal. |
| **ICL** | In-Context Learning. How agents learn from what's in the context window. | Already universal. |

## Usage Rules

1. **Methodology docs** (patterns, frameworks, guides): Overture terms only. No tool-specific filenames, paths, or invocation syntax.
2. **Skills**: Overture terms. The skill detects the tool at runtime and adapts output.
3. **Plugin/adapter files** (CC commands, hook configs, tool READMEs): Tool-specific terms freely. Parenthetical Overture terms where it aids understanding.
4. **README.md**: Overture terms for concepts. Tool-specific terms only in clearly labeled installation sections.

## Find-and-Replace Guide

When refactoring existing docs, apply these substitutions in methodology-layer files:

| Find | Replace | Notes |
|---|---|---|
| `CLAUDE.md` (as concept) | operating document | Not when referring to the literal file in a CC context |
| Claude Code (as tool category) | AI coding agent / your agent | Keep "Claude Code" when specifically about that product |
| `/session-start`, `/session-end` | session-start command, session-end command | Abstract the invocation |
| `.claude/commands/` | session commands directory | Abstract the path |
| `~/.claude/CLAUDE.md` | user-level preferences | Abstract the location |
| auto memory | agent memory | Abstract the feature |
| slash command (generic) | command | When not CC-specific |
