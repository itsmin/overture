# Overture — Claude Code Working Kit

## PROJECT STATUS

**Overture** is a portable framework for AI-assisted development patterns, not a product.

- **Stage**: Active development — interview-ready, day-1-usable
- **Audience**: Min, and eventually any team or organization where Min works
- **Goal**: Battle-tested system for Claude Code working patterns, from single projects to multi-project orchestration
- **Provenance**: Evolved through 460+ working sessions across production SaaS and professional services

---

## WHAT'S IN THE KIT

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `README.md` | Entry point — problem, quick start, orientation, kit overview | You | **v2** — March 25, 2026 |
| `Working-With-Claude-Code.md` | Conceptual framework: ICL foundations, memory architecture, Levels 0-4, Choral, Lyrical | You | Updated March 22, 2026 |
| `workflow/Claude-Code-Workflow-Framework.md` | The methodology: session management, CLAUDE.md anatomy, documentation hygiene | You | **v2.0** — March 2026 |
| `choral/Choral-Pattern.md` | Standalone Choral reference: three coordination modes, shared blackboard, setup | You | **v2.0** — March 23, 2026 |
| `voice/Voice-Framework.md` | Voice as design material: defining, encoding, maintaining voice | You | v2.0 — March 2026 |
| `voice/Voice-Reference.md` | Detailed session structure, derivation approach, encoding patterns | You | v2.0 — March 2026 |
| `templates/CLAUDE.md` | Project operating document skeleton | Both | v1 — March 2026 |
| `templates/init.md` | Initialization guide — Claude follows this to set up a new project | Claude | v1 — March 2026 |
| `templates/session-start.md` | Session-start command template — copy to `.claude/commands/` | Claude | v1.1 — March 2026 |
| `templates/session-end.md` | Session-end command template — copy to `.claude/commands/` | Claude | v1.1 — March 2026 |
| `templates/contract.md` | Cross-project working contract template | Both | v1 — March 2026 |

### Archived Files

| File | Replaced By | Archived |
|------|------------|----------|
| `archive/Claude-Code-Workflow-Framework-Personal.md` | `workflow/Claude-Code-Workflow-Framework.md` (v2.0) | Session #2 |
| `archive/editorial_collaborator_reference.md` | `voice/Voice-Reference.md` | Session #2 |
| *(editorial_collaborator_prompt.md removed — personal voice content, not kit material)* | | |

---

## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Overture-Specific Guidelines**:
1. **CaliKo-agnostic content** — CaliKo projects are provenance ("developed across 460+ sessions on production products"), not dependencies. The kit must work for any codebase at any organization.
2. **Real over polished** — The value is that these patterns are battle-tested. Honest gaps (scaling unproven, decay is lossy, contract drift) are features, not liabilities.
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

**Current**: Session #3 in progress (March 25, 2026)
**Status**: Approachability overhaul — README restructure, audience headers across all kit files, itsmin.com added as pattern source.

### Pending Verifications
*(none)*

### Session #3 In Progress (March 25, 2026)

**Approachability + Audience Clarity + itsmin.com Pattern Monitoring**

- README v2: restructured from reference layout to narrative arc (problem → get started → orientation → going deeper)
- Added "What Just Happened" bridge section — orients new users after setup
- Added "Going Deeper" signal-based table — read docs when you hit specific needs, not upfront
- Audience headers on all 10 kit files — every file now declares who reads it (Claude / You / Both)
- Kit table in CLAUDE.md and README now includes Audience column
- Levels table reframed: "Levels 1-2 cover the vast majority of projects"
- Added itsmin.com to CLAUDE.local.md as live implementation reference (simpler stack, Level 1-2 patterns)

### Session #2 Complete (March 23, 2026)

**Full Setup + Choral Evolution + GitHub Public + Privacy Workflow**

- Set up `/session-start` and `/session-end` slash commands, restructured CLAUDE.md to follow own framework
- Wrote Choral-Pattern.md: v1 (standalone reference) → v2.0 (three-mode coordination: reactive/concurrent/proactive, shared blackboard)
- Evolved design principles: interface/implementation boundary, trust the sessions, observations pattern, decision authority
- Created GitHub repo (private → public), MIT LICENSE, CONTRIBUTING.md, .gitignore
- E2E initialization test: 5 issues found and fixed, created `templates/init.md`
- Privacy audit workflow: built into session-end (step 2), CRITICAL REMINDERS added, removed sensitive archive file
- Renamed "digestive system" → "Decay" (musical naming: Overture, Choral, Lyrical, Decay)
- 8 commits pushed, all public-readiness criteria met

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

*(Session #3 work in progress — approachability overhaul)*

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Approachability overhaul — README v2, audience headers, orientation | #3 | README restructured, all 10 files have audience markers, kit table updated |
| itsmin.com added as pattern source | #3 | CLAUDE.local.md updated, simpler-stack reference for Level 1-2 patterns |
| Choral three-mode system + shared blackboard | #2 | Choral-Pattern.md v2.0, contract template updated |
| Privacy audit workflow | #2 | Built into session-end, CRITICAL REMINDERS, removed sensitive file |
| GitHub repo (private → public) | #2 | All public-readiness criteria met |
| Kit overhaul — framework v2, templates, voice, README | #1 | Major update from 460+ sessions |

### P2: FUTURE WORK

1. **Progression guide** — Dedicated 0→1→2→3→4 document with concrete signals and decision criteria
2. **Level 3 reference implementation** — Decay and idle-time automation templates (biggest portability gap — honestly may stay as a documented gap rather than a contrived template)

### PUBLIC-READINESS CRITERIA

Before flipping from private → public:
- [x] No absolute paths to local machine in committed files
- [x] No CaliKo-specific operational content (provenance references are fine)
- [x] LICENSE file present (MIT)
- [x] README initialization flow tested end-to-end at least once
- [x] All cross-references resolve
- [x] All kit files at v1+
- [x] CONTRIBUTING.md or equivalent guidance for external contributors

### PARKING LOT

| Item | Reason |
|------|--------|
| *(none)* | |

---

## CRITICAL REMINDERS

1. **ALWAYS** run a privacy audit before committing — this repo is PUBLIC. Grep for absolute paths, emails, API keys, proprietary details. See `/session-end` step 2.
2. **NEVER** commit operational paths (CaliKo project references) — those live in `.claude/CLAUDE.local.md` (gitignored).
3. **ALWAYS** keep content CaliKo-agnostic. Provenance references are fine. Internal architecture, API specs, or business logic are not.

---

## DEFERRED WORK

| Item | Originally From | Context |
|------|-----------------|---------|
| *(none)* | | |

---

## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| README | `README.md` | Session #3 | Entry point — problem, quick start, orientation, audience guide |
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
