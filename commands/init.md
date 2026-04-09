# Initialize Project with Overture

> **Claude Code command** — this runs as `/overture:init` when the Overture plugin is installed.

Set up this project for AI-assisted development with the Overture session management framework.

## Instructions

### 0. Check for an Overture Profile

Check if the user has a personal Overture profile at `~/.overture/profile.md`.

**If found**: Read it. This contains the user's preferences for what to generate — default sections, session workflow customizations, voice reference, conventions. Apply these preferences throughout the remaining steps.

If the profile references additional files (like `~/.overture/voice.md`), read those too.

**If not found**: Continue with defaults. Mention that they can create one later to carry preferences into future projects.

### 1. Understand the Project

Ask the user about their project. You need:
- **What it is** — name, purpose, current state (shipped, in development, prototype)
- **Stack** — language, framework, database, hosting
- **Current priorities** — what they're working on now, what's next
- **Any project-specific rules** — conventions, constraints, lessons learned

If the project already has code, read the codebase to infer what you can before asking.

### 2. Generate CLAUDE.md

Read the operating document template from this plugin's skills directory (`skills/overture-init/references/operating-document-template.md`). Generate a `CLAUDE.md` at the project root with:

- Product status filled in from Step 1
- Collaboration guidelines with project-specific rules
- Session workflow (use the template structure unless the project needs customization)
- Work queue with their current priorities
- Only include optional sections (metrics, critical reminders, development workflow, documentation reference, session archives) if the project has content for them. Leave them as commented-out blocks for later.

### 3. Generate Session Commands

Read the session command skills (`skills/session-start/SKILL.md` and `skills/session-end/SKILL.md`). Generate **standalone** command files at `.claude/commands/session-start.md` and `.claude/commands/session-end.md`. These become `/session-start` and `/session-end` slash commands.

The commands should be self-contained — they work even if the Overture plugin is later removed.

Customize per project:
- **session-start**: Replace generic health checks with project-relevant ones (e.g., `npm test`, deployment status)
- **session-end**: Replace the generic documentation sync checklist with this project's domains (e.g., API routes, database schema, environment variables)
- **Remove inapplicable steps**: If the project doesn't use cross-project coordination or metrics, drop those steps entirely

### 4. Create .gitignore Entry

If the project has a `.gitignore`, add `.claude/settings.local.json` to it.
If not, suggest creating one.

### 5. Confirm Setup

Tell the user:
- What files were created
- If a profile was applied, which preferences were used
- How to use `/session-start` and `/session-end`
- That optional CLAUDE.md sections can be uncommented as the project matures
- If no profile exists: mention they can create one at `~/.overture/profile.md` to carry preferences into future projects
- They can now run `/session-start` to begin their first session
