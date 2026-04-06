# Overture — Claude Code Working Kit

## PROJECT STATUS

**Overture** is a portable framework for AI-assisted development patterns, not a product.

- **Stage**: Active development — interview-ready, day-1-usable
- **Audience**: Min, and eventually any team or organization where Min works
- **Goal**: Battle-tested system for AI-assisted development patterns, from single projects to multi-project orchestration. Tool-agnostic via Agent Skills standard; Claude Code plugin as primary distribution.
- **Provenance**: Evolved through 480+ working sessions across production SaaS and professional services

---

## WHAT'S IN THE KIT

### Plugin & Skills (NEW — Session #11)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `.claude-plugin/plugin.json` | Claude Code plugin manifest — `/plugin install overture` | Agent | **v1** — April 2026 |
| `commands/init.md` | CC plugin init command — `/overture:init` | Agent | **v1** — April 2026 |
| `skills/overture-init/SKILL.md` | Init skill (Agent Skills format) — cross-tool project setup | Agent | **v1** — April 2026 |
| `skills/overture-init/references/operating-document-template.md` | Tool-agnostic operating document template | Both | **v1** — April 2026 |
| `skills/session-start/SKILL.md` | Session-start skill — cross-tool context loading | Agent | **v1** — April 2026 |
| `skills/session-end/SKILL.md` | Session-end skill — cross-tool handoff and cleanup | Agent | **v1** — April 2026 |
| `glossary.md` | Controlled vocabulary for tool-agnostic terminology | Both | **v1** — April 2026 |

### Methodology

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `README.md` | Entry point — problem, quick start, orientation, kit overview | You | **v3** — April 5, 2026 |
| `Progression.md` | Progression guide — day-1 paths, level-by-level experience, when to evolve | You | **v1** — March 25, 2026 |
| `Working-With-Claude-Code.md` | Conceptual framework: ICL foundations, memory architecture, Levels 0-4, Choral, Lyrical | You | Updated March 22, 2026 |
| `workflow/Claude-Code-Workflow-Framework.md` | The methodology: session management, CLAUDE.md anatomy, documentation hygiene | You | **v2.0** — March 2026 |
| `choral/Choral-Pattern.md` | Standalone Choral reference: three coordination modes, shared blackboard, setup | You | **v2.0** — March 23, 2026 |
| `voice/Voice-Framework.md` | Voice as design material: defining, encoding, maintaining voice | You | v2.0 — March 2026 |
| `voice/Voice-Reference.md` | Detailed session structure, derivation approach, encoding patterns | You | v2.0 — March 2026 |
| `patterns/Data-Authority.md` | Architectural pattern: single source of truth for derived state | You | v1 — March 2026 |
| `patterns/Autonomous-Background.md` | Scheduled triggers for between-session quality work | You | v1 — March 2026 |
| `patterns/Size-Management.md` | Operating document size thresholds, archiving protocol, project profiles | You | v1 — March 2026 |
| `patterns/Settings-Hygiene.md` | Settings accumulation, two-layer organization, cleanup protocol | You | v1 — March 2026 |
| `patterns/Section-Ordering.md` | Canonical operating document section ordering across projects | You | v1 — March 2026 |
| `patterns/Privacy-Boundary.md` | PII filtering at public surfaces — boundary declaration, runtime verification | You | v1 — March 2026 |

### Templates & Hooks (manual setup / backwards compatible)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `templates/CLAUDE.md` | CC-specific operating document skeleton | Both | v2 — March 2026 |
| `templates/init.md` | Manual init guide (superseded by plugin/skills) | Agent | v1 — March 2026 |
| `templates/session-start.md` | CC session-start command template | Agent | v2 — March 2026 |
| `templates/session-end.md` | CC session-end command template | Agent | v2 — March 2026 |
| `templates/contract.md` | Cross-project working contract template | Both | v1 — March 2026 |
| `templates/hooks/README.md` | Hook setup, testing, specialization recipes | You | v1 — March 2026 |
| `templates/hooks/session-start.sh` | Automated session-start hook script | Agent (via hook) | v1 — March 2026 |
| `templates/hooks/session-end.sh` | Automated session-end hook script | Agent (via hook) | v1 — March 2026 |

### Archived Files

Archive directory removed from the public repo in Session #4. Superseded files are available in git history.

---

## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Overture-Specific Guidelines**:
1. **CaliKo-agnostic content** — CaliKo projects are provenance ("developed across 460+ sessions on production products"), not dependencies. The kit must work for any codebase at any organization.
2. **Real over polished** — The value is that these patterns are battle-tested. Honest gaps (scaling unproven, decay is lossy, contract drift) are features, not liabilities.
3. **Practitioner voice** — Direct, no thought-leadership inflection, no academic framing where it doesn't serve the reader. These docs are for someone who will use them tomorrow, not study them.
4. **Don't duplicate, reference** — Live implementations of these patterns exist in production projects. Read them for current practice (paths in `.claude/CLAUDE.local.md`). Don't copy their content into Overture — extract the patterns.
5. **Tool-agnostic by default** — Skills and methodology docs use the glossary (`glossary.md`). Tool-specific terms only in adapter-layer files (plugin commands, hook configs). When in doubt, use the Overture term.

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

**Current**: Session #10 complete (March 28, 2026)
**Status**: Pushed to GitHub.

### Pending Verifications
*(none)*

### Session #10 Complete (March 28, 2026)

**Session template evolution from pxtxt production patterns**

- Session-start v2: Step 0 (clean state), queue hygiene signal, project health, richer work queue with NEXT pointer and handoff quality check
- Session-end v2: draft-first mode, work queue reconciliation, feature verification with code path tables, open discussions, next-session planning, settings hygiene
- CLAUDE.md template v2: NEXT pointer, queue hygiene tracking, UPCOMING SESSIONS section
- 4 files changed, committed and pushed

### Session #9 Complete (March 28, 2026)

**Privacy Boundary Pattern Extraction from Prelude**

- Created `patterns/Privacy-Boundary.md` — PII filtering at public surfaces, five invariants, runtime verification
- Updated section-ordering (position 2b), CLAUDE.md template (commented-out section), session-end (code-level + data-level audit)
- All CaliKo references stripped; pattern is fully org-agnostic
- 5 files changed, committed and pushed

### Session #8 Complete (March 27, 2026)

**Pattern Extraction from Prelude — Four New Patterns**

- Hook script templates, Size Management, Settings Hygiene, Section Ordering extracted from Prelude
- 7 new files, 3 updated files, all cross-references and kit tables updated
- P2 #2 (hook templates) resolved; P2 #1 (decay) narrowed to memory lifecycle only

### Session #7 Complete (March 26, 2026)

**GitHub Sync**

- Pushed 5 unpushed commits (Sessions #5-6) to GitHub after privacy audit
- No content changes — verification and sync only

### Session #6 Complete (March 26, 2026)

**Pattern Extraction + Level 3 Documentation**

- Data Authority pattern (`patterns/Data-Authority.md`) extracted from Prelude — single source of truth for derived state, five invariants, CaliKo-agnostic
- Autonomous Background pattern (`patterns/Autonomous-Background.md`) extracted from BETA — two-trigger model (daily operational + weekly strategic), phased rollout, anti-patterns
- Session Hooks section added to Workflow Framework — setup, specialization principle, four production recipes
- Level 3 updated across Working-With-Claude-Code.md and Progression.md — now references hooks, triggers, and data authority
- Honest Gaps #5 updated — Level 3 partially → substantially documented
- P2 #1 (idle-time automation) resolved; new P2 #2 (hook script templates) queued
- Session counts 460+ → 475+ across all doc headers; pxtxt status updated in global CLAUDE.md

### Session #5 Complete (March 25, 2026)

**Voice Review Pass + P2 Assessment**

- Voice pass on Working-With-Claude-Code.md, Workflow Framework, Choral-Pattern.md, Voice-Reference.md against Prelude voice reference
- 5 targeted cuts across 4 files; Voice Framework unchanged — docs already strong from Session #1
- Prelude voice.md validated against full kit
- P2 #1 (idle-time): BETA shipped autonomous triggers today (daily quality patrol + weekly alignment audit). Not yet battle-tested — extract after 5-10 sessions of real use
- P2 #2 (Decay): Recommend leaving as documented gap. Level 3 is custom by design; a template that doesn't generalize isn't a template

### Session #4 Complete (March 25, 2026)

**Progression Guide + Voice + Attribution + Prelude**

- Progression Guide v1 (`Progression.md`): day-1 paths (new project, existing codebase, team adoption), level-by-level experience and judgment calls, anti-patterns per level, "most projects stay at Level 2" framing
- Voice pass on README.md and Progression.md against Min's voice reference
- Attribution added to README provenance — collaborative process, stated plainly
- Archive directory removed from public repo (still in git history)
- README updated with Progression Guide in "Going Deeper" table and kit table
- Checked BETA for idle-time autonomous agent patterns — infrastructure automation shipped, Claude-as-autonomous-agent not yet. Extraction deferred.
- Checked Choral Session #4 — Coordination Manifest already in Choral-Pattern.md. No update needed.
- **Prelude v1 built**: Personal Overture instance with documentation voice reference, personalized templates, Choral pre-wired, drift check in session-end. Private repo initialized.
- `~/.claude/CLAUDE.md` updated with Prelude in portfolio
- Voice review pass on remaining Overture docs queued as P2 #1

### Session #3 Complete (March 25, 2026)

**Approachability Overhaul + Audience Clarity + itsmin.com Pattern Monitoring**

- README v2: narrative arc (problem → get started → orientation → going deeper), replaces reference-style layout
- "What Just Happened" bridge section orients new users; "Going Deeper" links docs to signals not upfront reading
- Audience headers on all 10 kit files (Claude / You / Both) — resolves feedback that it's unclear what's for Claude vs. the user
- Kit table in CLAUDE.md and README now includes Audience column
- Levels reframed: "Levels 1-2 cover the vast majority of projects"
- itsmin.com added to CLAUDE.local.md as live implementation reference (simpler stack, Level 1-2 patterns)
- Committed and pushed to GitHub

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

*(No active P1 — all items complete through Session #9)*

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Session template evolution — v2 from pxtxt patterns | #10 | session-start, session-end, CLAUDE.md template all upgraded |
| Privacy boundary pattern extraction | #9 | New pattern doc, section-ordering, template, session-end updated. |
| Pattern extraction — Data Authority + Autonomous Background | #6 | Two new docs in patterns/. Workflow Framework updated with hooks section. Level 3 now documented. |
| Hooks section in Workflow Framework | #6 | Setup, specialization principle, 4 recipes from production. |
| Voice review pass — remaining docs | #5 | 4 files touched, Voice Framework unchanged. Light pass — docs already strong. |
| Progression Guide, voice pass, attribution, Prelude v1 | #4 | Progression.md, voice pass on entry points, collaborative attribution, archive removed, Prelude built |
| Approachability overhaul — README v2, audience headers, orientation | #3 | README restructured, all 10 files have audience markers, kit table updated |
| itsmin.com added as pattern source | #3 | CLAUDE.local.md updated, simpler-stack reference for Level 1-2 patterns |
| Choral three-mode system + shared blackboard | #2 | Choral-Pattern.md v2.0, contract template updated |
| Privacy audit workflow | #2 | Built into session-end, CRITICAL REMINDERS, removed sensitive file |
| GitHub repo (private → public) | #2 | All public-readiness criteria met |
| Kit overhaul — framework v2, templates, voice, README | #1 | Major update from 460+ sessions |

### P2: FUTURE WORK

1. **Decay reference** — Decay and memory lifecycle templates. **Recommendation (Session #5)**: leave as documented gap. Level 3 is explicitly custom engineering with no drop-in template. Size Management pattern (`patterns/Size-Management.md`) now covers the actionable part (thresholds, archiving protocol). What remains is memory lifecycle — revisit only if a generalizable pattern emerges.

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
| README | `README.md` | Session #11 | Entry point — plugin install, multi-tool, orientation |
| Glossary | `glossary.md` | Session #11 | Controlled vocabulary for tool-agnostic terminology |
| Plugin Manifest | `.claude-plugin/plugin.json` | Session #11 | Claude Code plugin — `/plugin install overture` |
| Init Command (CC) | `commands/init.md` | Session #11 | CC plugin command — `/overture:init` |
| Init Skill | `skills/overture-init/` | Session #11 | Cross-tool init (Agent Skills format) |
| Session-Start Skill | `skills/session-start/` | Session #11 | Cross-tool session-start (Agent Skills format) |
| Session-End Skill | `skills/session-end/` | Session #11 | Cross-tool session-end (Agent Skills format) |
| Progression Guide | `Progression.md` | Session #4 | Day-1 paths, level-by-level experience, when to evolve |
| Conceptual Framework | `Working-With-Claude-Code.md` | Session #6 | ICL, memory tiers, Levels 0-4, Choral, Lyrical |
| Workflow Framework | `workflow/Claude-Code-Workflow-Framework.md` | Session #6 | Methodology v2.0 — session management, CLAUDE.md anatomy, hooks |
| Choral Reference | `choral/Choral-Pattern.md` | Session #2 | Standalone coordination pattern guide |
| Voice Framework | `voice/Voice-Framework.md` | Session #1 | Voice methodology — defining, encoding, maintaining |
| Voice Reference | `voice/Voice-Reference.md` | Session #1 | Session structure, derivation, encoding patterns |
| Data Authority | `patterns/Data-Authority.md` | Session #6 | Architectural pattern: single source of truth for derived state |
| Autonomous Background | `patterns/Autonomous-Background.md` | Session #6 | Scheduled triggers for between-session quality work |
| Size Management | `patterns/Size-Management.md` | Session #8 | Operating document size thresholds, archiving protocol |
| Settings Hygiene | `patterns/Settings-Hygiene.md` | Session #8 | Settings accumulation, two-layer org, cleanup |
| Section Ordering | `patterns/Section-Ordering.md` | Session #8 | Canonical operating document section ordering |
| Privacy Boundary | `patterns/Privacy-Boundary.md` | Session #9 | PII filtering at public surfaces, boundary declaration, runtime verification |
| Hook Templates | `templates/hooks/` | Session #8 | Hook scripts, setup guide, specialization recipes |
| Init Guide (legacy) | `templates/init.md` | Session #2 | Manual init (superseded by plugin/skills) |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| *(not needed yet)* | | |
