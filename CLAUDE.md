# Overture — Claude Code Working Kit

## PROJECT STATUS

**Overture** is a portable framework for AI-assisted development patterns, not a product.

- **Stage**: Active development — interview-ready, day-1-usable
- **Audience**: Min, and eventually any team or organization where Min works
- **Goal**: Battle-tested system for Claude Code working patterns, from single projects to multi-project orchestration
- **Provenance**: Evolved through 460+ working sessions across production SaaS and professional services

---

## WHAT'S IN THE KIT

| File | Purpose | Status |
|------|---------|--------|
| `README.md` | Entry point — what this is, how to use it, initialization prompt | v1 — March 22, 2026 |
| `Working-With-Claude-Code.md` | Conceptual framework: ICL foundations, memory architecture, Levels 0-4, Choral, Lyrical | Updated March 22, 2026. Ready. |
| `workflow/Claude-Code-Workflow-Framework.md` | The methodology: session management, CLAUDE.md anatomy, documentation hygiene, context management | **v2.0** — March 2026 |
| `choral/Choral-Pattern.md` | Standalone Choral reference: setup, coordination flow, contract mechanics | **v1 — March 23, 2026** |
| `voice/Voice-Framework.md` | Voice as design material: defining, encoding, maintaining voice in AI-assisted work | v2.0 — March 2026 |
| `voice/Voice-Reference.md` | Detailed session structure, derivation approach, encoding patterns for voice work | v2.0 — March 2026 |
| `templates/CLAUDE.md` | Project CLAUDE.md skeleton — copy and fill | v1 — March 2026 |
| `templates/init.md` | Initialization guide — Claude follows this to set up a new project | v1 — March 2026 |
| `templates/session-start.md` | Session-start command template — copy to `.claude/commands/` | v1.1 — March 2026 |
| `templates/session-end.md` | Session-end command template — copy to `.claude/commands/` | v1.1 — March 2026 |
| `templates/contract.md` | Cross-project working contract template | v1 — March 2026 |

### Archived Files

| File | Replaced By | Archived |
|------|------------|----------|
| `archive/Claude-Code-Workflow-Framework-Personal.md` | `workflow/Claude-Code-Workflow-Framework.md` (v2.0) | Session #2 |
| `archive/editorial_collaborator_prompt.md` | `voice/Voice-Framework.md` | Session #2 |
| `archive/editorial_collaborator_reference.md` | `voice/Voice-Reference.md` | Session #2 |

---

## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Overture-Specific Guidelines**:
1. **CaliKo-agnostic content** — CaliKo projects are provenance ("developed across 460+ sessions on production products"), not dependencies. The kit must work for any codebase at any organization.
2. **Real over polished** — The value is that these patterns are battle-tested. Honest gaps (scaling unproven, digestive system is lossy, contract drift) are features, not liabilities.
3. **Practitioner voice** — Direct, no thought-leadership inflection, no academic framing where it doesn't serve the reader. These docs are for someone who will use them tomorrow, not study them.
4. **Don't duplicate, reference** — Live implementations of these patterns exist in production projects. Read them for current practice (paths in `.claude/CLAUDE.local.md`). Don't copy their content into Overture — extract the patterns.

---

## SESSION WORKFLOW

### At `/session-start`:
1. Read this CLAUDE.md (automatic)
2. Check documentation health — kit table accuracy, cross-references, archived file status
3. Present deferred work and pending verifications
4. Present work queue
5. Alignment check

### During session:
- Load kit docs on demand as needed for the task (don't pre-load everything)
- When updating framework docs: read live implementations for current practice (paths in `.claude/CLAUDE.local.md`)
- Compare documented patterns against live implementations to find drift
- Build templates from real examples, not theory
- Keep content org-agnostic

### Before `/session-end`:
- Update Session Progress
- Documentation sync — kit table, cross-references, template accuracy
- Capture any deferred work
- Update work queue

---

## SESSION PROGRESS

**Current**: Session #2 complete (March 23, 2026)
**Status**: Workflow dogfooding, P1 items, Choral evolution, GitHub repo setup

### Pending Verifications
- **#2**: End-to-end initialization test — does the README prompt actually produce a working project setup?

### Session #2 Complete (March 23, 2026)

**Workflow Dogfooding + P1 Cleanup + GitHub Setup**

- Set up `/session-start` and `/session-end` slash commands in `.claude/commands/`
- Archived 3 superseded files to `archive/`
- Restructured CLAUDE.md to follow the kit's own framework anatomy
- Wrote standalone Choral reference (`choral/Choral-Pattern.md`)
- Updated Choral pattern across all docs: decision authority model (project sessions own product-scoped decisions, human gate at project boundaries)
- Fixed 3 broken anchor links, verified all cross-references
- Separated operational paths (`.claude/CLAUDE.local.md`, gitignored) from portable CLAUDE.md
- Added MIT LICENSE, .gitignore, defined public-readiness criteria
- Created private GitHub repo, initial commit pushed

### Session #1 Complete (March 22, 2026)

**Kit Overhaul — Framework v2 + Templates + Voice Evolution + README**

- Wrote Workflow Framework v2.0 — single version, 460+ session patterns
- Built 4 template files — CLAUDE.md, session-start, session-end, contract
- Evolved voice docs from editorial-only to general voice-as-design-material module
- Wrote README.md — entry point, initialization prompt, kit structure
- Updated Working-With-Claude-Code.md — generalized refs, updated cross-links
- Architecture decision: single framework, personal preferences in `~/.claude/CLAUDE.md`

---

## WORK QUEUE

### CURRENT PRIORITIES

**P1: End-to-end initialization test**
- Create a throwaway project, follow README instructions from scratch
- Validates the kit's usability claim — does the initialization prompt actually work?
- Find gaps before anyone else does

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| GitHub private repo setup | #2 | `itsmin/overture`, private, initial commit pushed |
| Separate operational paths from portable CLAUDE.md | #2 | Absolute paths → `.claude/CLAUDE.local.md` (gitignored) |
| Extract Choral pattern as standalone reference | #2 | `choral/Choral-Pattern.md` v1 |
| Review and refine all docs | #2 | Fixed 3 broken anchors, updated cross-refs, verified CaliKo scoping |
| Archive superseded files | #2 | Moved 3 files to `archive/` |
| Set up `/session-start` and `/session-end` commands | #2 | `.claude/commands/` — Overture dogfooding its own workflow |
| Restructure CLAUDE.md to follow framework | #2 | Dogfooding the anatomy pattern |
| Kit overhaul — framework v2, templates, voice, README | #1 | Major update from 460+ sessions |

### P2: FUTURE WORK

1. **Progression guide** — Dedicated 0→1→2→3→4 document with concrete signals and decision criteria
2. **Level 3 reference implementation** — Digestive system and idle-time automation templates (biggest portability gap — honestly may stay as a documented gap rather than a contrived template)

### PUBLIC-READINESS CRITERIA

Before flipping from private → public:
- [ ] No absolute paths to local machine in committed files
- [ ] No CaliKo-specific operational content (provenance references are fine)
- [ ] LICENSE file present (MIT)
- [ ] README initialization flow tested end-to-end at least once
- [ ] All cross-references resolve
- [ ] All kit files at v1+
- [ ] CONTRIBUTING.md or equivalent guidance for external contributors

### PARKING LOT

| Item | Reason |
|------|--------|
| *(none)* | |

---

## DEFERRED WORK

| Item | Originally From | Context |
|------|-----------------|---------|
| *(none)* | | |

---

## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| README | `README.md` | Session #1 | Entry point, kit structure, initialization prompt |
| Conceptual Framework | `Working-With-Claude-Code.md` | Session #1 | ICL, memory tiers, Levels 0-4, Choral, Lyrical |
| Workflow Framework | `workflow/Claude-Code-Workflow-Framework.md` | Session #1 | Methodology v2.0 — session management, CLAUDE.md anatomy |
| Choral Reference | `choral/Choral-Pattern.md` | Session #2 | Standalone coordination pattern guide |
| Voice Framework | `voice/Voice-Framework.md` | Session #1 | Voice methodology — defining, encoding, maintaining |
| Voice Reference | `voice/Voice-Reference.md` | Session #1 | Session structure, derivation, encoding patterns |
| Init Guide | `templates/init.md` | Session #2 | Initialization instructions for Claude to follow |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| *(not needed yet)* | | |
