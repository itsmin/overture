# CLAUDE.md Section Ordering

**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Workflow Framework](../workflow/Claude-Code-Workflow-Framework.md) — CLAUDE.md Anatomy

> **Audience**: You — reference this when creating or reorganizing a CLAUDE.md. Claude doesn't read this file directly.

---

## Why This Matters

When projects evolve independently, they develop the same section types in different orders. Consistency matters for:
- Context-switching between projects
- Cross-project coordination reading multiple CLAUDE.md files at session start
- New sessions inheriting predictable structure

---

## Target Ordering

### Core Sections (every project, in order)

1. **PROJECT STATUS** — What is this, what stage, who uses it
2. **COLLABORATION GUIDELINES** — Project-specific rules, cross-project coordination
2b. **PRIVACY BOUNDARIES** *(optional)* — PII sources, public surfaces, filtering. Only for projects handling third-party PII with public-facing surfaces. See `patterns/Privacy-Boundary.md`.
3. **CURRENT METRICS** — Sources of truth, last validated
4. **SESSION WORKFLOW** — How sessions work in this project
5. **SESSION PROGRESS** — Current session, pending verifications
6. **WORK QUEUE** — Current priorities, complete, P2, parking lot
7. **DEFERRED WORK** — In-scope but bumped items

### Domain Sections (project-specific, after core)

These vary by project. Examples: signal architecture, strategic direction, pricing, business model, infrastructure.

Keep whatever serves the project. Don't force sections that don't apply.

### Reference Sections (bottom)

8. **SESSION ARCHIVES / SESSION HISTORY**
9. **DEVELOPMENT / DEPLOYMENT**
10. **CRITICAL REMINDERS**
11. **DOCUMENTATION REFERENCE**

---

## Verification

After reordering, scan top-to-bottom. This is the mental model:

1. What is this project?
2. How do we work together?
2b. What data is sensitive, and where does it go? *(if applicable)*
3. What are the numbers?
4. How do sessions work?
5. What's in progress?
6. What's the work queue?
7. What got bumped?
8. Domain-specific reference
9. Dev/deploy/reminders/docs

---

## What NOT to Do

- Don't rename sections to match each other
- Don't add sections you don't have
- Don't remove project-specific sections that work
- Don't force archival alignment across projects
- If something doesn't work for your project, keep what works and note why

This is a reorder, not a rewrite. Move sections to target ordering. Don't change content.

Apply at session start, not mid-implementation.
