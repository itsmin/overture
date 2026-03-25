# Project Initialization

> **Audience**: Claude Code — Claude reads this file during project initialization. You don't need to read or understand it; just point Claude at it with the prompt in the [README](../README.md#get-started).

Set up a new project with the Overture workflow framework.

## Instructions

You are helping the user set up their project for Claude Code using the Overture workflow framework. Follow these steps:

### 1. Understand the project
Ask the user about their project. You need:
- **What it is** — name, purpose, current state (shipped, in development, prototype)
- **Stack** — language, framework, database, hosting
- **Current priorities** — what they're working on now, what's next
- **Any project-specific rules** — conventions, constraints, lessons learned

If the project already has code, read the codebase to infer what you can before asking.

### 2. Generate CLAUDE.md
Read the CLAUDE.md template at the Overture path the user provided (`templates/CLAUDE.md`). Generate a filled-in CLAUDE.md at the project root with:
- Product status filled in from step 1
- Collaboration guidelines with project-specific rules
- Session workflow (use the template as-is unless the project needs customization)
- Work queue with their current priorities
- Only include optional sections (metrics, critical reminders, development workflow, documentation reference, session archives) if the project has content for them. Leave them as commented-out blocks for later.

### 3. Generate session commands
Read the session command templates (`templates/session-start.md` and `templates/session-end.md`). Copy them to `.claude/commands/session-start.md` and `.claude/commands/session-end.md`.

Customize:
- **session-end documentation sync check**: Replace the generic domain checklist with domains relevant to this project (e.g., a web app might check "API routes", "database schema", "environment variables" instead of "pricing or tiers")
- **Remove inapplicable steps**: If the project doesn't use cross-project coordination, those steps should already say "skip" — no changes needed

### 4. Create .gitignore entry
If the project has a `.gitignore`, add `.claude/settings.local.json` to it.
If not, suggest creating one.

### 5. Confirm setup
Tell the user:
- What files were created
- How to use `/session-start` and `/session-end`
- That optional CLAUDE.md sections can be uncommented as the project matures
- They can now run `/session-start` to begin their first session
