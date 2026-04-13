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
| `.claude-plugin/plugin.json` | Claude Code plugin manifest | Agent | **v1** — April 2026 |
| `.claude-plugin/marketplace.json` | Self-hosted marketplace manifest | Agent | **v1** — April 2026 |
| `commands/init.md` | CC plugin init command — `/overture:init` | Agent | **v1** — April 2026 |
| `skills/overture-init/SKILL.md` | Init skill (Agent Skills format) — cross-tool project setup | Agent | **v1** — April 2026 |
| `skills/overture-init/references/operating-document-template.md` | Tool-agnostic operating document template | Both | **v1** — April 2026 |
| `skills/session-start/SKILL.md` | Session-start skill — cross-tool context loading | Agent | **v1** — April 2026 |
| `skills/session-end/SKILL.md` | Session-end skill — cross-tool handoff and cleanup | Agent | **v1** — April 2026 |
| `glossary.md` | Controlled vocabulary for tool-agnostic terminology | Both | **v1** — April 2026 |

### Methodology

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `README.md` | Entry point — problem, quick start, orientation, kit overview | You | **v4** — April 9, 2026 |
| `Progression.md` | Progression guide — day-1 paths, level-by-level experience, when to evolve | You | **v2** — April 9, 2026 |
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
| `templates/profile.md` | Overture profile template — personal customizations | You | **v1** — April 2026 |
| `templates/CLAUDE.md` | CC-specific operating document skeleton | Both | v3 — April 2026 |
| `templates/init.md` | Manual init guide (superseded by plugin/skills) | Agent | v1 — March 2026 |
| `templates/session-start.md` | CC session-start command template | Agent | v2 — March 2026 |
| `templates/session-end.md` | CC session-end command template | Agent | v3 — April 2026 |
| `templates/contract.md` | Cross-project working contract template | Both | v2 — April 2026 |
| `templates/choral.md` | Choral sync command template — mid-session coordination | Agent | v1 — April 2026 |
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

*This section is the project-specific runbook the Overture session skills defer to. Steps listed here are authoritative — the skills read this section and execute these steps alongside their generic defaults.*

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

**Current**: Session #18 complete (April 13, 2026)
**Status**: Prelude collapse done. One framework remaining (Overture); Min-specific opinions live in `~/.overture/profile.md` + `voice.md`. Prelude archived to `~/Projects/_archive/prelude` at tag `archived-2026-04-13`. Cross-tool portability unblocked.
**NEXT**: Session #19 — Cross-tool portability test. Copy Overture skills to Codex CLI (or Gemini CLI) skill directory, verify they load and produce correct output on a sample project. First real test of the Agent Skills cross-tool claim. May reveal adapter-layer needs.
**Last queue hygiene**: Session #11

### Pending Verifications
- **Cross-tool portability** — skills not tested on Codex or Gemini CLI. Now unblocked; queued as Session #19.
- **Live init with profile** — profile loading verified by code-read of SKILL.md Step 0. End-to-end run on a fresh project still pending — natural discharge on next real init or during Session #19's portability test.

### Session #18 Complete (April 13, 2026)

**Prelude archive + retirement**

- Committed Prelude's uncommitted drift as honest final-state (`cde4bdb` in Prelude): plugin.json fix, marketplace.json, OBS bidirectional writing in CLAUDE.md/choral.md/contract.md, CONTRACT HYGIENE section, HARD RULE strengthening, Coordination profile in session-end. All material content already absorbed into Overture across Sessions #11-#16.
- Deleted `prelude/instances/{beta,pxtxt}.md` (`be5ba7e`). Pre-collapse alignment-tracking docs; specializations already absorbed into Overture patterns/templates.
- Tagged Prelude `archived-2026-04-13` with archive note.
- Moved `/Users/itsmin/Projects/prelude` → `/Users/itsmin/Projects/_archive/prelude`. Git intact, tag intact, working tree clean.
- Removed `~/.claude/plugins/cache/prelude` leftover (plugin already globally uninstalled — plugins are global, not per-project, so no per-project work needed).
- Updated `~/.claude/CLAUDE.md`: dropped Prelude portfolio entry, redirected privacy boundary reference from Prelude → Overture, added Prelude-collapse note to Overture entry.
- Updated `/Users/itsmin/Projects/PROJECT_MANAGEMENT.md`: redirected stale Prelude settings-patterns reference → Overture's Settings-Hygiene.md.
- Cross-tool portability test now unblocked. Sequenced as Session #19.

### Session #17 Complete (April 13, 2026)

**Profile + template consolidation — already substantially done from Session #13**

- Verified `~/.overture/profile.md` and `voice.md` already exist (created Session #13). Voice file is **byte-identical** to Prelude's voice.md. Profile already encodes impact-radius guideline, draft-first session-end, Choral coordination, 8-line entries, NEXT specificity, archive thresholds, COMPLETE-Recent ~10 entry rule.
- Verified init skill Step 0 already loads `~/.overture/profile.md` and applies preferences (read SKILL.md). Live end-to-end run still pending — discharge naturally on next real init.
- Decided fate of Prelude instance files: retire (executed in Session #18). They were pre-collapse alignment trackers; their role disappears post-collapse.
- Template refinements requested in Session #17 plan (impact radius, HARD RULE, CONTRACT HYGIENE, OBS bidirectional) all already upstreamed in Session #16's commit `429559c`. No further edits needed.

### Session #16 Complete (April 13, 2026)

**Prelude upstream audit + Session #17 work largely already in place**

- Diffed Overture's 6 patterns + 5 shared templates against Prelude's (including Prelude's 8 uncommitted refinements). 6 upstream candidates extracted, fully sanitized of CaliKo references, committed in `429559c`.
- Patterns upstreamed: Data-Authority `Staleness and Refresh` section (refresh through existing flows), Size-Management `Coordination` profile + Coordination Session Notes, Autonomous-Background `Relationship to Other Patterns` cross-reference section, Privacy-Boundary `How It Hid` (de-identified five-layer failure narrative).
- Templates upstreamed: CLAUDE.md impact-radius guideline (data/experience changes), HARD RULE clarified ("every session, not just on deploy"), NEXT pointer specificity example, CRITICAL REMINDERS framing ("hard-won rules, not aspirational").
- Skipped after diff: Settings-Hygiene (Prelude version is a CaliKo config reference, not a portable pattern — keep separate), Section-Ordering (trivial drift), session-end.md draft-first (already in Overture from earlier session), session-start/contract/choral templates (cosmetic only).
- **Session #17 already substantially done**: `~/.overture/profile.md` and `~/.overture/voice.md` already exist (created Session #13). Voice file is **identical** to Prelude's voice.md. Profile already encodes impact-radius guideline, draft-first session-end, Choral coordination, 8-line entries, NEXT specificity, archive thresholds, COMPLETE-Recent ~10 entry rule. Init skill Step 0 already loads profile. The only remaining Session #17 item is the instance files decision.
- **Instance files recommendation**: `prelude/instances/beta.md` and `pxtxt.md` are alignment-tracking docs for the pre-collapse era when Prelude was a separately-maintained framework. Post-collapse, projects use Overture templates directly and "drift from upstream" stops being a concept. Their historical specializations (BETA hooks, pxtxt data-authority discovery) are already captured in Overture patterns/templates. Recommend retiring on Session #18.
- 5 of 6 Prelude patterns now provably redundant to Overture's. Settings is the structural exception — different doc type, not a portable pattern.
- Privacy audit clean (grep across patterns/ + templates/CLAUDE.md for project names, paths, identifiers).

### Session #15 Complete (April 13, 2026)

**Portfolio housekeeping propagation + Prelude standardization decision**

- Verified Session #14 pilot: plugin skill at v1.0.1 active in cache, local `.claude/commands/session-{start,end}.md` gone from Overture, skill SESSION WORKFLOW deference working (kit health check auto-fired during this session's own `/session-start`). No duplicate command entries.
- Closed portfolio-wide privacy gap: `.claude/projects/` not gitignored in Overture (public repo), with an orphan auto-memory file sitting in the unignored path. Patched `.gitignore`, deleted orphan, folded unique content into canonical global memory. Commit `c3b2db0`.
- Propagated session-command housekeeping across 6 projects: **prelude, itsmin.com, vb, choral, pxtxt, BETA**. 4 git commits across repos (overture `c3b2db0`, prelude `0f74d1f`, itsmin.com `8d9a88a`, BETA `f5a41834`); vb / choral / pxtxt had on-disk-only changes (untracked or non-repo). For each project with project-specific content in local commands, expanded CLAUDE.md SESSION WORKFLOW section to preserve the substance (metrics validation bash, contract paths, cross-project coordination checks, HARD RULES, size budgets, documentation sync tables).
- **Architectural decision**: collapse Prelude into Overture's profile layer. Six patterns duplicated, templates nearly identical, `/prelude:init` unused. End state = one framework (Overture) with Min-specific opinions in `~/.overture/profile.md` + `voice.md`. Prelude repo archived after Session #18.
- Findings flagged: portfolio CLAUDE.md tracking is inconsistent (pxtxt and itsmin.com gitignore CLAUDE.md, so Session #15 SESSION WORKFLOW expansions in those projects are on-disk only); Prelude has pre-existing uncommitted Session #8 drift; BETA had uncommitted Choral absorption work that was folded into the BETA commit with attribution in the message.
- Session #16-18 plan captured in UPCOMING SESSIONS.

### Session #14 Complete (April 13, 2026)

**Skill framework fix + Overture local-command cleanup pilot**

- Diagnosed duplicate `/session-start` and `/session-end` entries across every project as artifacts of the pre-Session-#11 manual-copy era — Session #13's profile model shifted customization to operating doc but never cleaned up old local copies
- Closed latent gap: session skills now explicitly defer to operating doc's SESSION WORKFLOW section as authoritative for project-specific steps. Previously implicit — I demonstrated the failure mode by skipping Overture's kit health check during this session's own /session-start
- Updated `skills/session-start/SKILL.md`, `skills/session-end/SKILL.md`, `templates/CLAUDE.md`, and Overture's `CLAUDE.md` with the "SESSION WORKFLOW is authoritative" lead-in
- Overture pilot: deleted `.claude/commands/session-{start,end}.md` (already captured in CLAUDE.md SESSION WORKFLOW)
- 2 commits, pushed

### Session #13 Complete (April 9, 2026)

**Plugin distribution fix + accessibility pass + profile customization layer**

- Fixed plugin.json `commands` field (array → directory path) and marketplace.json source pattern
- Created self-hosted marketplace — two-command install: `/plugin marketplace add` + `/plugin install`
- Language simplification pass on README and Progression.md for less technical audiences
- Built Overture profile system (`~/.overture/profile.md` + `voice.md`) — customization without forking
- Updated init skill and command with Step 0 profile discovery
- Created Min's personal profile and voice file
- Also fixed Prelude's plugin.json and managed global settings registration
- 4 commits, all pushed

### Session #12 Complete (April 8, 2026)

**Choral coordination evolution from Prelude production patterns**

- Examined Prelude Sessions #2-8 for extractable process improvements
- 5 changes: CONTRACT HYGIENE in contract template, HARD RULE every-session updates, bidirectional OBS-writing, `/choral` sync command template (new), Cross-Project Coordination in CLAUDE.md template
- Choral-Pattern.md v2.0 → v2.1: shared blackboard updated, Observations section rewritten, Getting Started strengthened
- 7 files changed (1 new), committed and pushed

### Session #11 Complete (April 5, 2026)

**Plugin architecture + Agent Skills format + tool-agnostic foundation**

- Plugin manifest, 3 Agent Skills (init, session-start, session-end), CC init command, glossary
- README v3: three installation paths (plugin, skills, manual), tool-agnostic language throughout
- Structural validation passed, init simulation on test project passed
- Strategic briefing evaluated — challenged pattern-to-skill mapping, adapter layer timing, maintenance surface
- 9 files changed (7 new, 2 updated), committed and pushed

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

**P1: Cross-tool portability** *(unblocked)*
- Copy Overture skills to Codex CLI or Gemini CLI, verify they load and produce correct output on a sample project. First real test of the Agent Skills cross-tool claim. See Session #19 in UPCOMING SESSIONS.

### UPCOMING SESSIONS

1. **Session #19: Cross-tool portability test** — Copy Overture skills (`overture-init`, `session-start`, `session-end`) to Codex CLI's skill directory (or Gemini CLI's). Run `/overture:init` (or tool equivalent) on a throwaway project. Watch for: skill loading errors, glossary/terminology friction, hard-coded Claude Code paths in skill bodies, profile discovery (`~/.overture/profile.md`) working under the new tool's filesystem conventions. Capture findings — this is the first real test of the Agent Skills cross-tool claim and likely reveals what an adapter layer would actually need to do.

2. **Session #20+: Adapter layer (only if #19 reveals real needs)** — Don't pre-build from theory. Build only what the portability test proves is needed.

3. **Parallel P2 track — CLAUDE.md tracking normalization** — pxtxt and itsmin.com gitignore CLAUDE.md, so Session #15 SESSION WORKFLOW expansions in those projects are on-disk only and won't survive a fresh clone. Fix in-place during each project's own sessions: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from that project's `.gitignore` → commit. Not blocking; required for fresh-clone portability.

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Prelude archive + retirement | #18 | Drift committed, instance files retired, tagged `archived-2026-04-13`, moved to `_archive/prelude`. Global CLAUDE.md and PROJECT_MANAGEMENT.md cross-references updated. |
| Profile + template consolidation (already done from #13) | #17 | Verified profile/voice in place, voice byte-identical to Prelude's, init skill loads profile, instance retirement decision made. |
| Prelude upstream audit — 6 patterns + 5 templates diffed, 6 candidates upstreamed and sanitized | #16 | 5/6 patterns now redundant; Settings is structural exception. Commit `429559c`. |
| Portfolio housekeeping propagation + Prelude standardization decision | #15 | Pilot verified, privacy gap fixed (`.claude/projects/` gitignored), 6 projects cleaned up, 4 git commits, Prelude collapse direction set, Session #16-18 plan written. |
| Skill framework fix + Overture local-command cleanup pilot | #14 | Skills now authoritatively defer to operating doc SESSION WORKFLOW. Overture local `.claude/commands/session-{start,end}.md` deleted. 2 commits. |
| Plugin distribution + accessibility + profile layer | #13 | Marketplace, language pass, profile system, Prelude fixes. 4 commits. |
| Choral coordination evolution from Prelude | #12 | 5 improvements: CONTRACT HYGIENE, HARD RULE, bidirectional OBS, /choral template, CLAUDE.md coordination section |
| Plugin architecture + Agent Skills + tool-agnostic foundation | #11 | 7 new files, README v3, glossary, structural validation passed |
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

1. **Decay reference** — Decay and memory lifecycle templates. **Recommendation (Session #5)**: leave as documented gap. Size Management covers the actionable part. Revisit only if a generalizable pattern emerges.
2. **Methodology doc lazy refactor** — Apply glossary terms to existing docs (Working-With-Claude-Code.md, Workflow Framework, Progression, patterns) as they're touched. No dedicated refactoring pass unless needed.
3. **Adapter layer** — Build only after testing on a second tool reveals what actually needs adapting. Don't pre-build from theory.
4. **Workflow Framework doc update** — Document the "operating doc SESSION WORKFLOW is authoritative, skills are generic runners" architectural principle established in Session #14. Low priority — not blocking propagation, but the methodology doc should reflect the current architecture.

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
| Cross-tool portability test | Session #14 | Re-sequenced behind standardization (Sessions #16-18). Porting skills to a second tool while Prelude/Overture drift persists would compound the mess. Unblocks after #18. |
| CLAUDE.md tracking normalization (pxtxt, itsmin.com) | Session #15 | Both projects gitignore CLAUDE.md, so Session #15 SESSION WORKFLOW expansions are on-disk only. Fix in each project's own session: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from the project's `.gitignore` → commit. |

---

## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| README | `README.md` | Session #13 | Entry point — plugin install, profile, orientation |
| Glossary | `glossary.md` | Session #11 | Controlled vocabulary for tool-agnostic terminology |
| Plugin Manifest | `.claude-plugin/plugin.json` | Session #13 | Claude Code plugin manifest |
| Marketplace Manifest | `.claude-plugin/marketplace.json` | Session #13 | Self-hosted marketplace for plugin distribution |
| Init Command (CC) | `commands/init.md` | Session #13 | CC plugin command — `/overture:init` (profile-aware) |
| Init Skill | `skills/overture-init/` | Session #13 | Cross-tool init (Agent Skills format, profile-aware) |
| Session-Start Skill | `skills/session-start/` | Session #11 | Cross-tool session-start (Agent Skills format) |
| Session-End Skill | `skills/session-end/` | Session #11 | Cross-tool session-end (Agent Skills format) |
| Progression Guide | `Progression.md` | Session #13 | Day-1 paths, level-by-level experience, profile, when to evolve |
| Conceptual Framework | `Working-With-Claude-Code.md` | Session #6 | ICL, memory tiers, Levels 0-4, Choral, Lyrical |
| Workflow Framework | `workflow/Claude-Code-Workflow-Framework.md` | Session #6 | Methodology v2.0 — session management, CLAUDE.md anatomy, hooks |
| Choral Reference | `choral/Choral-Pattern.md` | Session #12 | Standalone coordination pattern guide |
| Choral Sync Template | `templates/choral.md` | Session #12 | Mid-session coordination command template |
| Voice Framework | `voice/Voice-Framework.md` | Session #1 | Voice methodology — defining, encoding, maintaining |
| Voice Reference | `voice/Voice-Reference.md` | Session #1 | Session structure, derivation, encoding patterns |
| Data Authority | `patterns/Data-Authority.md` | Session #6 | Architectural pattern: single source of truth for derived state |
| Autonomous Background | `patterns/Autonomous-Background.md` | Session #6 | Scheduled triggers for between-session quality work |
| Size Management | `patterns/Size-Management.md` | Session #8 | Operating document size thresholds, archiving protocol |
| Settings Hygiene | `patterns/Settings-Hygiene.md` | Session #8 | Settings accumulation, two-layer org, cleanup |
| Section Ordering | `patterns/Section-Ordering.md` | Session #8 | Canonical operating document section ordering |
| Privacy Boundary | `patterns/Privacy-Boundary.md` | Session #9 | PII filtering at public surfaces, boundary declaration, runtime verification |
| Profile Template | `templates/profile.md` | Session #13 | Personal Overture profile — customization layer |
| Hook Templates | `templates/hooks/` | Session #8 | Hook scripts, setup guide, specialization recipes |
| Init Guide (legacy) | `templates/init.md` | Session #2 | Manual init (superseded by plugin/skills) |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| *(not needed yet)* | | |
