# Overture Profile

Your Overture profile customizes what gets generated when you set up a new project. This is different from your global CLAUDE.md (or equivalent), which tells your agent how to behave. Your profile tells Overture what to build.

Save this file as `~/.overture/profile.md`. Overture's init checks for it automatically.

---

## Project Defaults

Sections and structure to include in every new project's operating document:

- (Example: Always include a CRITICAL REMINDERS section)
- (Example: Always include cross-project coordination — I work across multiple products)
- (Example: Work queue structure should use P1 / P2 / Parking Lot)
- (Example: Session entries should be 8 lines max, condensed format)
- (Example: Always include a privacy boundary section)

## Session Workflow

Customizations to session-start and session-end commands:

- (Example: Session-start should include a deployment health check)
- (Example: Session-end should always include a privacy audit step)
- (Example: Session-end should include a documentation sync checklist for API routes and database schema)

## Voice

If you have a voice reference file, place it at `~/.overture/voice.md` and describe it here:

- (Example: I have a voice reference. See voice.md in this directory. When setting up a new project, include a note in the operating document about maintaining this voice.)

## Conventions

Patterns and preferences that should carry into every project:

- (Example: Prefer single bundled PRs for refactors over many small ones)
- (Example: Track session counts in the operating document)
- (Example: NEXT pointer in Session Progress should always be specific, not vague)
- (Example: When building features, verify end-to-end across data/computation/display layers)

## About Me

Context about you that helps init make better decisions:

- (Example: I'm a designer who uses Claude Code for prototyping and building production frontends)
- (Example: I manage a portfolio of three products with shared infrastructure)
- (Example: I work solo — no team coordination needed)

---

*Delete the examples and fill in your own. Anything you don't have preferences about, remove the section entirely. Init works fine with a partial profile — it fills gaps with sensible defaults.*
