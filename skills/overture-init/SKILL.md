---
name: overture-init
description: Initialize a project with Overture session management. Generates an operating document, registers session commands, and sets up work tracking. Use when setting up a new project for AI-assisted development or when the user mentions Overture initialization.
compatibility: Requires filesystem access and a project directory.
metadata:
  author: Min Chang
  version: 1.0.0
  license: MIT
---

# Initialize Project with Overture

Set up a project for AI-assisted development using the Overture session management framework.

## What You're Creating

1. An **operating document** at the project root — the structured file you read at every session start
2. **Session commands** — session-start and session-end workflows copied to the project's commands directory
3. A `.gitignore` entry for local settings

## Detect the Environment

Determine which AI coding agent you're running in and set these variables:

| Variable | Claude Code | Codex CLI | Gemini CLI | Other |
|----------|-------------|-----------|------------|-------|
| Operating document filename | `CLAUDE.md` | `AGENTS.md` | `GEMINI.md` | `CLAUDE.md` (safe default) |
| Commands directory | `.claude/commands/` | `.agents/skills/` or `.codex/skills/` | `.gemini/commands/` | `.claude/commands/` |
| Local settings to gitignore | `.claude/settings.local.json` | `.codex/config.local.toml` | `.gemini/settings.local.json` | (skip) |

If you can't detect the tool, ask the user. Default to Claude Code conventions.

## Step 1: Understand the Project

Ask the user about their project. You need:

- **What it is** — name, purpose, current state (shipped, in development, prototype)
- **Stack** — language, framework, database, hosting
- **Current priorities** — what they're working on now, what's next
- **Any project-specific rules** — conventions, constraints, lessons learned

If the project already has code, read the codebase to infer what you can before asking. Don't make the user tell you things the code already shows.

## Step 2: Generate the Operating Document

Read the operating document template at `references/operating-document-template.md` (relative to this skill). Generate the operating document at the project root with:

- Product status filled in from Step 1
- Collaboration guidelines with project-specific rules
- Session workflow (use the template structure unless the project needs customization)
- Work queue with their current priorities
- Only include optional sections (metrics, critical reminders, development workflow, documentation reference, session archives) if the project has content for them

**Keep it lean.** A new project's operating document should be short — four core sections (status, guidelines, workflow, work queue). It grows as the project does.

## Step 3: Register Session Commands

Read the session-start and session-end skills (`session-start/SKILL.md` and `session-end/SKILL.md` in the Overture skills directory). Generate **standalone** command files in the project's commands directory with the session workflow instructions embedded.

Always generate standalone commands — the project's session commands should work even if the Overture plugin or skills are later removed.

Customize per project:
- **session-start**: Replace generic health checks with project-relevant ones (e.g., `npm test`, deployment status check)
- **session-end**: Replace the generic documentation sync checklist with the project's actual domains (e.g., API routes, database schema, environment variables)
- **Remove inapplicable steps**: If the project doesn't use cross-project coordination or metrics, drop those steps entirely rather than leaving "skip if not applicable" stubs

For Claude Code, the commands become `/session-start` and `/session-end` slash commands. For other tools, adapt the invocation and path to the tool's conventions.

## Step 4: Gitignore Local Settings

If the project has a `.gitignore`, add the local settings file for the detected tool. If not, suggest creating one.

## Step 5: Confirm Setup

Tell the user:
- What files were created and where
- How to invoke the session commands in their tool
- That optional operating document sections can be added as the project matures
- They can now run their session-start command to begin their first session
