---
name: overture-init
description: Initialize a project with Overture session management. Generates an operating document, registers session commands, and sets up work tracking. Use when setting up a new project for AI-assisted development or when the user mentions Overture initialization.
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
| Project session-commands directory | `.claude/commands/` (slash commands) | `.agents/skills/` (Agent Skills format) | `.gemini/skills/` (Agent Skills format; `.agents/skills/` also works) | `.claude/commands/` |
| Local settings file (to gitignore) | `.claude/settings.local.json` | Confirm with user — Codex local config conventions vary | Confirm with user — Gemini local settings vary | (skip) |

If you can't detect the tool, ask the user. Default to Claude Code conventions.

Note: the directory format differs by tool — Claude Code uses bare markdown files in `.claude/commands/`, while Codex and Gemini expect Agent Skills format (a directory per skill containing `SKILL.md` with required frontmatter). Step 3 below handles this.

## Step 0: Check for an Overture Profile

Check if the user has a personal Overture profile at `~/.overture/profile.md`.

**If found**: Read it. This contains the user's preferences for what to generate — default sections, session workflow customizations, voice reference, conventions. Apply these preferences throughout the remaining steps. Where the profile specifies a preference, follow it. Where it's silent, use sensible defaults.

If the profile references additional files (like `~/.overture/voice.md`), read those too.

**If not found**: Continue with defaults. Don't ask the user to create one — that's a later step in their journey with the framework.

Mention what you found: "I found your Overture profile and will apply your preferences" or "No Overture profile found — using defaults. You can create one later to carry your preferences into future projects."

## Step 1: Understand the Project

Ask the user about their project. You need:

- **What it is** — name, purpose, current state (shipped, in development, prototype)
- **Stack** — language, framework, database, hosting
- **Current priorities** — what they're working on now, what's next
- **Any project-specific rules** — conventions, constraints, lessons learned

If the project already has code, read the codebase to infer what you can before asking. Don't make the user tell you things the code already shows.

## Step 2: Generate the Operating Document

Read the operating document template at `references/operating-document-template.md` (relative to this skill). Generate the operating document at the project root.

**Required sections** (always include, fill in from Step 1):
- PRODUCT STATUS
- COLLABORATION GUIDELINES — with project-specific rules from Step 1
- SESSION WORKFLOW — **copy from the template verbatim**. Do not drop, reorder, or condense steps. If Step 1 surfaced project-specific health checks, sync items, or extra steps, ADD them to the existing structure (e.g., add a sub-bullet to step 2, or insert a new step). Never delete a generic step unless the user explicitly says it doesn't apply.
- SESSION PROGRESS
- WORK QUEUE — with current priorities from Step 1
- DEFERRED WORK

**Optional sections** (CURRENT METRICS, CRITICAL REMINDERS, PRIVACY BOUNDARIES, DEVELOPMENT WORKFLOW, DOCUMENTATION REFERENCE, SESSION ARCHIVES):
- These live in the commented-out HTML block at the bottom of the template.
- Include a section in the active document body **only if the project has actual content for it.**
- Do NOT un-comment a section header just to put a placeholder like `*(none)*`, `*(none yet)*`, or `TBD` in it. An empty section header is noise — leave it commented out until there's real content.

**If a profile exists**: Include any additional sections or conventions the profile requests. The profile may request optional sections beyond the core set — include them if the profile says to (and only then with placeholder content if the profile explicitly asks for the section regardless of content).

**If no profile**: Keep it lean. A new project's operating document is the required sections only. It grows as the project does.

## Step 3: Register Session Commands

Generate **standalone** session command files in the project's session-commands directory. Standalone means the project's session commands work even if the Overture skills are later removed — the full workflow is embedded in the project's own files.

**Source files** — read these as siblings to this skill in the Overture skill bundle:
- `../session-start/SKILL.md`
- `../session-end/SKILL.md`

### Generation method: verbatim copy, then append patches

**1. Copy the source SKILL.md body verbatim into the project's session command file.** Do not summarize, condense, restructure, drop steps, or shorten descriptions. Every step, sub-step, and CRITICAL label exists because past sessions discovered it mattered. Compressing the embedded version breaks the architectural principle that the project's session commands must be self-contained and complete without Overture present.

A correctly-generated session-start file should be roughly the same length as the source SKILL.md (within 10%). If your output is significantly shorter, you summarized — re-do it.

**2. Replace the source frontmatter with project-local frontmatter** (Agent Skills tools only):

For Codex CLI and Gemini CLI, replace the source SKILL.md's frontmatter with:

```yaml
---
name: session-start
description: Load project context at the start of a working session. Reads the operating document, checks health, surfaces deferred work, and presents the work queue.
---
```

(Adjust `name` and `description` for session-end. Use the same descriptions as the source skills unless project context suggests a more specific one.)

For Claude Code, drop the YAML frontmatter entirely — slash commands read the file directly without it.

**3. Append project-specific patches at the end** under a `## Project-Specific Customizations` heading. Patches are *additions*, not modifications to the source content. Examples of valid patches:

- Project-specific health checks (`npm test`, deployment endpoint URL, schema migration check)
- Project-specific documentation sync items (API route docs, schema docs, pricing config)
- Project-specific privacy/security reminders
- Notes on which generic steps don't apply to this project (e.g., "Step 5 Cross-Project Coordination: this project doesn't participate")

If there are no project specifics from Step 1 to add, omit the `## Project-Specific Customizations` section entirely.

**If a profile exists**: Apply the profile's session workflow customizations as additions to the patches section, merged with project specifics. Profile patches and project patches share the same heading.

### Generation paths and formats by tool

| Tool | Path per command | Format | Invocation |
|------|------------------|--------|-----------|
| Claude Code | `.claude/commands/session-start.md`, `.claude/commands/session-end.md` | Bare markdown. No frontmatter required. Body = source skill content (verbatim) + appended patches. | `/session-start`, `/session-end` |
| Codex CLI | `.agents/skills/session-start/SKILL.md`, `.agents/skills/session-end/SKILL.md` | Directory per skill. SKILL.md inside, with project-local frontmatter. Body = source skill content (verbatim) + appended patches. | `$session-start` or auto-trigger by description |
| Gemini CLI | `.gemini/skills/session-start/SKILL.md`, `.gemini/skills/session-end/SKILL.md` (or `.agents/skills/...`) | Same Agent Skills format as Codex. | Auto-trigger by description, or `/skills enable session-start` |

## Step 4: Gitignore Local Settings

If the project has a `.gitignore`, add the local settings file for the detected tool. If not, suggest creating one.

## Step 5: Confirm Setup

Tell the user:
- What files were created and where
- If a profile was applied, which preferences were used
- How to invoke the session commands in their tool
- That optional operating document sections can be added as the project matures
- If no profile exists: mention they can create one at `~/.overture/profile.md` to carry preferences into future projects (see the profile template in Overture's `templates/profile.md`)
- They can now run their session-start command to begin their first session
