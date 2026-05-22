# Overture — Claude Code Working Kit

## PROJECT STATUS

**Overture** is a portable framework for AI-assisted development patterns, not a product.

- **Stage**: Active development — interview-ready, day-1-usable
- **Audience**: Min, and eventually any team or organization where Min works
- **Goal**: Battle-tested system for AI-assisted development patterns, from single projects to multi-project orchestration. Tool-agnostic via Agent Skills standard; Claude Code plugin as primary distribution.
- **Provenance**: Evolved through 480+ working sessions across production SaaS and professional services

---

## WHAT'S IN THE KIT

### Product Strategy (NEW — Session #21)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `STRATEGY.md` | Distinctive lanes, coexisting lanes, out-of-scope, scan discipline, marketplace posture | You | **v1** — Session #21 (skeleton; voiced prose Session #22) |
| `SCAN-LOG.md` | Quarterly ecosystem scans — Anthropic first-party, community plugins, hook/standard changes | You | **v1** — Session #21 (inaugural Q2 entry) |

### Plugin & Skills (NEW — Session #11)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `.claude-plugin/plugin.json` | Claude Code plugin manifest | Agent | **v1** — April 2026 |
| `.claude-plugin/marketplace.json` | Self-hosted marketplace manifest | Agent | **v1** — April 2026 |
| `commands/init.md` | CC plugin init command — `/overture:init` | Agent | **v1** — April 2026 |
| `skills/overture-init/SKILL.md` | Init skill (Agent Skills format) — cross-tool project setup. Step 6 ecosystem surfacing added #21. | Agent | **v1.2** — Session #21 |
| `skills/overture-init/references/operating-document-template.md` | Tool-agnostic operating document template | Both | **v1.1** — Session #20 |
| `skills/session-start/SKILL.md` | Session-start skill — cross-tool context loading. Companion Capabilities section added #21. | Agent | **v1.2** — Session #21 |
| `skills/session-end/SKILL.md` | Session-end skill — cross-tool handoff and cleanup. `/revise-claude-md` reference + Companion Capabilities + size-check strengthening added #21. | Agent | **v1.2** — Session #21 |
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
| `patterns/Data-Authority.md` | Architectural pattern: single source of truth for derived state | You | v1.1 — April 2026 |
| `patterns/Autonomous-Background.md` | Scheduled triggers for between-session quality work | You | v1.1 — April 2026 |
| `patterns/Size-Management.md` | Operating document size thresholds, archiving protocol, project profiles | You | v1.1 — April 2026 |
| `patterns/Settings-Hygiene.md` | Settings accumulation, two-layer organization, cleanup protocol | You | v1 — March 2026 |
| `patterns/Section-Ordering.md` | Canonical operating document section ordering across projects | You | v1 — March 2026 |
| `patterns/Privacy-Boundary.md` | PII filtering at public surfaces — boundary declaration, runtime verification | You | v1.1 — April 2026 |

### Templates & Hooks (manual setup / backwards compatible)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `templates/profile.md` | Overture profile template — personal customizations | You | **v1** — April 2026 |
| `templates/CLAUDE.md` | CC-specific operating document skeleton | Both | v3.1 — April 2026 |
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

**Current**: Session #21 complete (May 21, 2026)
**Status**: Strategic reframe — specialist mode + ecosystem-teaching positioning. Phase 1 shipped: `STRATEGY.md` skeleton, inaugural `SCAN-LOG.md`, first-party plugin references in all 3 skills. Session-end size-check rule strengthened (compression now mandatory at YELLOW/RED, never deferrable). CLAUDE.md compressed this session per the new rule.
**NEXT**: Session #22 — Phase 2 voice elevation. Run voice derivation pass on sibling project corpus (BETA / pxtxt / itsmin.com / catenate / absOrbs CLAUDE.md session entries + commit messages + decision narratives). Refresh `~/.overture/voice.md`. Then invoke `/brainstorm` for voice-encoded README hero, voice section, before/after example, STRATEGY.md voiced prose, and origins narrative.
**Last queue hygiene**: Session #21 (queue reorganized per strategic reframe; Phase 4b/4c demoted to P2; #11-#16 compressed to one-liners)

### Pending Verifications
- **Phase 4a fixes** (Session #20) — verbatim-copy Step 3, hardened Step 2 against step-dropping, optional-section rule against placeholder un-commenting. Applied per reasoned audit; not empirically re-tested. Demoted to P2 per Session #21 strategic reframe — empirical Gemini retest still valuable but no longer top priority.

### Session #21 Complete (May 21, 2026)

**Strategic reframe + Phase 1 execution — Overture as the human-discipline layer that teaches the ecosystem**

- Reaffirmed specialist mode (no community-building, no active promotion). Overture has become Min's most-used product. Three distinctive lanes (Choral, Voice, Operating-Doc Discipline) own forward investment; coexisting lanes (audit, auto-memory, hooks) get referenced at point-of-use, not reinvented.
- Phase 1 shipped: `SCAN-LOG.md` (inaugural Q2 entry, quarterly cadence Apr/Jul/Oct/Jan), `STRATEGY.md` skeleton (voiced prose deferred to #22), first-party plugin references added to all 3 skills via new "Companion Capabilities" sections + Step 6 ecosystem surfacing in overture-init.
- Earlier in session: strengthened session-end size-check rule (`d389d1b`) — YELLOW/RED compression now mandatory this session, never deferrable. Followed the rule today: CLAUDE.md compressed (Sessions #11-#16 → one-liners, COMPLETE Recent trimmed, kit table reorganized).
- Ecosystem context (from web research): Anthropic ships `/revise-claude-md` and `/remember` first-party plugins overlapping session management; Superpowers (`/brainstorm`, `/writing-plans`) in official marketplace; Agent Skills cross-tool across 30+ tools; hook events expanded to 27-32 (PreCompact, PostCompact, TeammateIdle, etc.).
- Distinctive positioning: Choral (no encroachment), Voice as design material (no encroachment, most defensible niche), Operating-Doc discipline (no encroachment). Quality audit / auto-memory / orchestration explicitly ceded to first-party + community.
- Phase 4b/4c (Gemini retest, cross-tool consolidation) demoted to P2 per reframe — still valuable, no longer top of queue.
- Sibling project audit via 4 parallel agents surfaced patterns to consider (privacy verification at session-end, hook upgrades from BETA/pxtxt, documentation sync matrix). Bundled as Phase 2-3 candidates.

### Session #20 Complete (April 18, 2026)

**First cross-tool validation of Overture skills + output-quality audit**

- Confirmed Anthropic SKILL.md is genuine cross-tool standard (Codex, Gemini, Cursor, GitHub Copilot adopt). `~/.agents/skills/` is shared user-level convention.
- Installed Gemini CLI 0.38.2; symlinked Overture's 3 skills to `~/.agents/skills/`. Discovery worked pre-auth via `gemini skills list`.
- **Phase 2 PASS**: Gemini executed `overture-init` end-to-end. Generated `GEMINI.md`, `.gemini/skills/session-{start,end}/SKILL.md`, `.gitignore` correctly. Profile applied per Step 0.
- **Phase 1 fixes**: spec-clean frontmatter (3 skills, drop metadata/compatibility); detection table corrected; explicit sibling paths; hook caveats for non-CC tools; Step 3 expanded with per-tool format table.
- **Phase 4a fixes** (from output audit — Gemini summarized 154→65 lines, dropped session-end steps 10/12, un-commented section to put `*(none yet)*` placeholder): SESSION WORKFLOW template concrete labels; Step 2 verbatim-from-template + hardened optional-section rule; Step 3 restructured to verbatim-copy + appended patches with within-10%-length self-check.
- **Phase 4b BLOCKED**: Gemini free-tier quota exhausted on retest + Gemini TUI rendering crash (their bug). Phase 4a fixes applied but not empirically re-validated. Path A's hard-stop fired as planned. Deferred to #21.
- Decided: Overture stays at `github.com/itsmin/overture` (memory `project_overture_ownership.md`). Plus 2 unpushed commits from #19.

### Session #19 Complete (April 13, 2026)

**Housekeeping & hygiene pass**

- CLAUDE.md compressed: Sessions #1-#10 collapsed to one-liner entries, COMPLETE (Recent) trimmed from 19 rows to 10, resolved deferred work pruned. **34,501 → 28,171 chars** (YELLOW 716-from-RED → solidly GREEN, ~6.8k headroom).
- Kit table verified: all 29 files present, no broken references.
- Queue hygiene refreshed (last performed #11 → #19).
- Session #18 had planned #19 as "housekeeping + cross-tool portability test." User stopped after housekeeping for a break; portability test slipped to Session #20 with no scope loss.
- 1 commit (`99a3126`), unpushed.

### Session #18 Complete (April 13, 2026)

**Prelude archive + retirement**

- Committed Prelude's uncommitted drift as honest final-state (`cde4bdb` in Prelude): plugin.json fix, marketplace.json, OBS bidirectional writing in CLAUDE.md/choral.md/contract.md, CONTRACT HYGIENE section, HARD RULE strengthening, Coordination profile in session-end. All material content already absorbed into Overture across Sessions #11-#16.
- Deleted `prelude/instances/{beta,pxtxt}.md` (`be5ba7e`). Pre-collapse alignment-tracking docs; specializations already absorbed into Overture patterns/templates.
- Tagged Prelude `archived-2026-04-13` with archive note.
- Moved Prelude repo to local `_archive/` sibling. Git intact, tag intact, working tree clean.
- Removed `~/.claude/plugins/cache/prelude` leftover (plugin already globally uninstalled — plugins are global, not per-project, so no per-project work needed).
- Updated `~/.claude/CLAUDE.md`: dropped Prelude portfolio entry, redirected privacy boundary reference from Prelude → Overture, added Prelude-collapse note to Overture entry.
- Updated the cross-project coordination file (sibling project tree): redirected stale Prelude settings-patterns reference → Overture's Settings-Hygiene.md.
- Cross-tool portability test now unblocked. Sequenced as Session #19.

### Session #17 Complete (April 13, 2026)

**Profile + template consolidation verification** — confirmed `~/.overture/profile.md` and `voice.md` exist from #13, voice byte-identical to Prelude's, init skill Step 0 loads profile, instance retirement decided (executed #18). All Session #17 template refinements already upstreamed in #16's `429559c`. No new edits needed.

### Sessions #11-#16 (compressed)

- **#11** (Apr 5) — Plugin architecture + 3 Agent Skills (init, session-start, session-end) + glossary + CC init command. README v3 with three install paths. Tool-agnostic foundation.
- **#12** (Apr 8) — Choral coordination evolution from Prelude production patterns: CONTRACT HYGIENE, HARD RULE every-session updates, bidirectional OBS-writing, `/choral` template. Choral-Pattern.md v2.1.
- **#13** (Apr 9) — Plugin distribution fix (plugin.json/marketplace.json) + self-hosted marketplace + accessibility/language pass + profile customization layer at `~/.overture/profile.md` + `voice.md` (init skill Step 0 loads profile).
- **#14** (Apr 13) — Skill framework fix: skills now authoritatively defer to operating doc's SESSION WORKFLOW. Overture local `.claude/commands/session-{start,end}.md` deleted as cleanup pilot.
- **#15** (Apr 13) — Portfolio housekeeping: 6 projects cleaned up (4 git commits), `.claude/projects/` privacy gap fixed (`c3b2db0`), Prelude-collapse architectural decision made.
- **#16** (Apr 13) — Prelude upstream audit: 6 candidates upstreamed (`429559c`) — Data-Authority Staleness/Refresh, Size-Management Coordination profile, Autonomous-Background interconnection, Privacy-Boundary How-It-Hid, CLAUDE.md template refinements. 5/6 Prelude patterns now redundant.

### Sessions #1-#10 (compressed)

- **#1** (Mar 22) — Kit overhaul: Workflow Framework v2, 4 templates, voice-as-design-material, README, single-framework architecture.
- **#2** (Mar 23) — Full setup: `/session-start`+`/session-end` commands, Choral-Pattern v2 (three-mode, shared blackboard), GitHub public, privacy audit workflow, "Decay" rename.
- **#3** (Mar 25) — Approachability: README v2 narrative arc, audience headers on all kit files, Levels 1-2 framing, itsmin.com added as pattern source.
- **#4** (Mar 25) — Progression Guide v1 (day-1 paths, level experience), voice pass on entry points, collaborative attribution, archive removed from public repo, **Prelude v1 built**.
- **#5** (Mar 25) — Voice review pass (4 files, light cuts); P2 assessment: Decay stays as documented gap, idle-time extraction deferred pending BETA battle-testing.
- **#6** (Mar 26) — Pattern extraction: `Data-Authority.md` (from Prelude), `Autonomous-Background.md` (from BETA); Workflow Framework hooks section; Level 3 now documented.
- **#7** (Mar 26) — GitHub sync: pushed 5 unpushed commits from #5-6 after privacy audit. Verification only.
- **#8** (Mar 27) — Pattern extraction from Prelude: hook templates, Size-Management, Settings-Hygiene, Section-Ordering. P2 #2 resolved.
- **#9** (Mar 28) — `Privacy-Boundary.md` extracted: PII filtering, five invariants, runtime verification. Template + section-ordering + session-end updated.
- **#10** (Mar 28) — Session template v2 from pxtxt patterns: session-start (Step 0, queue hygiene, NEXT), session-end (draft-first, verification), CLAUDE.md template (NEXT pointer, UPCOMING SESSIONS).

---

## WORK QUEUE

### CURRENT PRIORITIES

**P1: Phase 2 — Voice elevation** *(per Session #21 strategic reframe; voice is Overture's most defensible distinctive)*
- Voice derivation pass on sibling project corpus: scan BETA / pxtxt / itsmin.com / catenate / absOrbs CLAUDE.md session entries + commit messages + decision narratives. Apply Voice-Reference.md methodology. Identify signature moves, vocabulary, structural preferences that have evolved since the original derivation.
- Refresh `~/.overture/voice.md` based on derived patterns.
- Invoke `/brainstorm` (Superpowers) for voice-encoded prose: README hero rewrite, voice section, before/after working example (same task, generic vs. voice-encoded output), STRATEGY.md voiced sections (Purpose / Origins / "What Overture Is, and Isn't"), strategy doc opening prose.
- Promote `voice/` to top-level prominence in repo structure.
- Pattern docs get "Related capabilities" footers cross-referencing ecosystem-map (structural, no brainstorm needed).

**P2: Phase 3 — Marketplace submission + community distribution** *(sequenced after Phase 2; ~1-2 sessions)*
- Submission hygiene: CHANGELOG.md (missing), `claude plugin validate` pass, version-consistency check (plugin.json / CHANGELOG / git tags), README polish post-Phase 2.
- Submit to Anthropic-curated marketplace via form at `clau.de/plugin-directory-submission`. Curated review ~few days.
- Opportunistic: ClaudePluginHub auto-indexing, awesome-agent-skills PR (~30 min), claudemarketplaces.com listing.
- Optional capstone: Medium/Substack post on voice-as-design-material (indexed artifact, not community-building).

### UPCOMING SESSIONS

1. **Session #22: Phase 2 — voice elevation** — Run the voice derivation pass on the sibling corpus first (Voice-Reference.md methodology applied to BETA / pxtxt / itsmin.com / catenate / absOrbs session entries). Refresh `~/.overture/voice.md`. Then invoke `/brainstorm` for the creative prose work (README hero, voice section, before/after example, STRATEGY.md voiced sections, origins narrative). Promote `voice/` to top-level. Pattern doc cross-reference footers as bonus structural item.

2. **Session #23+: Phase 3 — marketplace submission + community directory PRs** — Hygiene pass (CHANGELOG, validate, version consistency), submit Overture to Anthropic-curated marketplace, opportunistic PRs to community indexes. Optional Medium post on voice-as-material.

3. **Parallel P2 track — Phase 4b: Gemini retest of Phase 4a fixes** *(demoted from #20's plan)* — still empirically valuable; no longer top priority. Quota constraint dissolved by time (Apr 18 → quota long since reset). Run when convenient; rolls into Phase 4c (cross-tool consolidation in framework docs).

4. **Parallel P2 track — CLAUDE.md tracking normalization** — pxtxt and itsmin.com gitignore CLAUDE.md (Session #15 SESSION WORKFLOW expansions on-disk only). Fix in each project's own session: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from gitignore → commit. Not blocking; required for fresh-clone portability.

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Strategic reframe + Phase 1 execution | #21 | Specialist mode reaffirmed. `STRATEGY.md` skeleton + inaugural `SCAN-LOG.md` shipped. First-party plugin references added to all 3 skills (Companion Capabilities sections, Step 6 in overture-init). Session-end size-check rule strengthened (`d389d1b`). CLAUDE.md compressed (#11-#16 to one-liners). Phase 2 voice elevation queued for #22. |
| First cross-tool validation + skills audit & fixes | #20 | Gemini CLI 0.38.2 executed `overture-init` end-to-end (Phase 2 PASS). Phase 1 audit found portability gaps; fixed. Phase 4a fixes from output audit. Phase 4b retest blocked on Gemini quota; demoted to P2 in #21. |
| Housekeeping & hygiene pass | #19 | CLAUDE.md 34.5k → 28.2k (YELLOW → GREEN), #1-#10 compressed, COMPLETE table trimmed, kit table verified. Commit `99a3126`. |
| Prelude archive + retirement | #18 | Drift committed, instance files retired, tagged `archived-2026-04-13`, moved to `_archive/prelude`. |
| Profile + template consolidation (already done from #13) | #17 | Verified profile/voice in place, init skill loads profile, instance retirement decision made. |
| Prelude upstream audit — 6 patterns + 5 templates diffed, 6 candidates upstreamed | #16 | 5/6 patterns now redundant; Settings is structural exception. Commit `429559c`. |
| Portfolio housekeeping propagation + Prelude standardization decision | #15 | Privacy gap fixed (`.claude/projects/` gitignored), 6 projects cleaned up, 4 commits, Prelude collapse direction set. |
| Skill framework fix + Overture local-command cleanup pilot | #14 | Skills now defer to operating doc SESSION WORKFLOW. Overture local commands deleted. |
| Plugin distribution + accessibility + profile layer | #13 | Marketplace, language pass, profile system. |
| Choral coordination evolution from Prelude | #12 | 5 improvements: CONTRACT HYGIENE, HARD RULE, bidirectional OBS, /choral template. |
| *...and earlier foundational work (#1-#11)* | #1-11 | See compressed Session Progress entries above. |

### P2: FUTURE WORK

1. **Decay reference** — Decay and memory lifecycle templates. **Recommendation (Session #5)**: leave as documented gap. Size Management covers the actionable part. Revisit only if a generalizable pattern emerges.
2. **Methodology doc lazy refactor** — Apply glossary terms to existing docs (Working-With-Claude-Code.md, Workflow Framework, Progression, patterns) as they're touched. No dedicated refactoring pass unless needed.
3. **Adapter layer** — Build only after testing on a second tool reveals what actually needs adapting. Don't pre-build from theory.
4. **Workflow Framework doc update** — Document the "operating doc SESSION WORKFLOW is authoritative, skills are generic runners" architectural principle established in Session #14. Low priority — not blocking propagation, but the methodology doc should reflect the current architecture.

### PARKING LOT

| Item | Reason |
|------|--------|
| *(none)* | |

---

## CRITICAL REMINDERS

1. **ALWAYS** run a privacy audit before committing — this repo is PUBLIC. Grep for absolute paths, emails, API keys, proprietary details. See `/session-end` step 2.
2. **NEVER** commit operational paths (CaliKo project references) — those live in `.claude/CLAUDE.local.md` (gitignored).
3. **ALWAYS** keep content CaliKo-agnostic. Provenance references are fine. Internal architecture, API specs, or business logic are not.
4. **WATCH first-party plugins on a quarterly cadence** — when Anthropic releases new plugins or skills (e.g., CLAUDE.md Management evolutions, new Remember capabilities), evaluate against Overture's distinctive lanes (Choral, Voice, Operating-Doc Discipline) within one session. Document the assessment in `SCAN-LOG.md`. Encroachment requires sharpening the distinctive angle; overlap in coexisting lanes requires updating point-of-use references.

---

## DEFERRED WORK

| Item | Originally From | Context |
|------|-----------------|---------|
| Phase 4b: re-validate fixes on Gemini | Session #20 (demoted P2 in #21) | Quota constraint dissolved by time. Skills already symlinked at `~/.agents/skills/`; Phase 4a fixes already in source files. Run when convenient; valuable but no longer top of queue per strategic reframe. |
| Phase 4c: framework doc consolidation | Session #20 (demoted P2 in #21) | Sequential after 4b passes. Update README install path with verified Gemini steps; update Working-With-Claude-Code.md cross-tool claim premise → validated. |
| CLAUDE.md tracking normalization (pxtxt, itsmin.com) | Session #15 | Both projects gitignore CLAUDE.md, so Session #15 SESSION WORKFLOW expansions are on-disk only. Fix in each project's own session: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from gitignore → commit. |
| Workflow Framework doc update | Session #14 | Document the "operating doc SESSION WORKFLOW is authoritative, skills are generic runners" architectural principle. Methodology doc should reflect current architecture. Low priority. |

---

## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| Strategy | `STRATEGY.md` | Session #21 | Distinctive lanes, coexisting lanes, scan discipline, marketplace posture. Voiced prose Session #22. |
| Scan Log | `SCAN-LOG.md` | Session #21 | Quarterly ecosystem scans. Inaugural Q2 2026 entry. Next: Jul 2026. |
| README | `README.md` | Session #13 | Entry point — plugin install, profile, orientation |
| Glossary | `glossary.md` | Session #11 | Controlled vocabulary for tool-agnostic terminology |
| Plugin Manifest | `.claude-plugin/plugin.json` | Session #13 | Claude Code plugin manifest |
| Marketplace Manifest | `.claude-plugin/marketplace.json` | Session #13 | Self-hosted marketplace for plugin distribution |
| Init Command (CC) | `commands/init.md` | Session #13 | CC plugin command — `/overture:init` (profile-aware) |
| Init Skill | `skills/overture-init/` | Session #21 | Cross-tool init (Agent Skills format, profile-aware). Step 6 ecosystem surfacing added #21. |
| Session-Start Skill | `skills/session-start/` | Session #21 | Cross-tool session-start. Companion Capabilities section added #21. |
| Session-End Skill | `skills/session-end/` | Session #21 | Cross-tool session-end. `/revise-claude-md` reference + size-check strengthening + Companion Capabilities added #21. |
| Progression Guide | `Progression.md` | Session #13 | Day-1 paths, level-by-level experience, profile, when to evolve |
| Conceptual Framework | `Working-With-Claude-Code.md` | Session #6 | ICL, memory tiers, Levels 0-4, Choral, Lyrical |
| Workflow Framework | `workflow/Claude-Code-Workflow-Framework.md` | Session #6 | Methodology v2.0 — session management, CLAUDE.md anatomy, hooks |
| Choral Reference | `choral/Choral-Pattern.md` | Session #12 | Standalone coordination pattern guide |
| Choral Sync Template | `templates/choral.md` | Session #12 | Mid-session coordination command template |
| Voice Framework | `voice/Voice-Framework.md` | Session #1 | Voice methodology — defining, encoding, maintaining |
| Voice Reference | `voice/Voice-Reference.md` | Session #1 | Session structure, derivation, encoding patterns |
| Data Authority | `patterns/Data-Authority.md` | Session #16 | Architectural pattern: single source of truth for derived state. Staleness/Refresh added #16. |
| Autonomous Background | `patterns/Autonomous-Background.md` | Session #16 | Scheduled triggers for between-session quality work. Pattern interconnection added #16. |
| Size Management | `patterns/Size-Management.md` | Session #16 | Operating document size thresholds, archiving protocol. Coordination profile added #16. |
| Settings Hygiene | `patterns/Settings-Hygiene.md` | Session #8 | Settings accumulation, two-layer org, cleanup |
| Section Ordering | `patterns/Section-Ordering.md` | Session #8 | Canonical operating document section ordering |
| Privacy Boundary | `patterns/Privacy-Boundary.md` | Session #16 | PII filtering at public surfaces, boundary declaration, runtime verification. How-It-Hid narrative added #16. |
| Profile Template | `templates/profile.md` | Session #13 | Personal Overture profile — customization layer |
| Hook Templates | `templates/hooks/` | Session #8 | Hook scripts, setup guide, specialization recipes |
| Init Guide (legacy) | `templates/init.md` | Session #2 | Manual init (superseded by plugin/skills) |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| *(not needed yet)* | | |
