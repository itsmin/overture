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
| `STRATEGY.md` | Distinctive lanes, coexisting lanes, out-of-scope, scan discipline, marketplace posture | You | **v1.2** — Session #25 (Origins #24 + Purpose/Is-Isn't voiced #25; em-dash purge #25, voice-clean end-to-end) |
| `SCAN-LOG.md` | Quarterly ecosystem scans — Anthropic first-party, community plugins, hook/standard changes | You | **v1** — Session #21 (inaugural Q2 entry) |

### Plugin & Skills (NEW — Session #11)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `.claude-plugin/plugin.json` | Claude Code plugin manifest | Agent | **v1.1.0** — July 2026 |
| `.claude-plugin/marketplace.json` | Self-hosted marketplace manifest | Agent | **v1.1** — July 2026 (metadata description) |
| `CHANGELOG.md` | Plugin version history (1.0.0 → 1.1.0) | Both | **v1** — July 2026 |
| `commands/init.md` | CC plugin init command — `/overture:init` | Agent | **v1** — April 2026 |
| `skills/overture-init/SKILL.md` | Init skill (Agent Skills format) — cross-tool project setup. Step 6 ecosystem surfacing added #21. | Agent | **v1.2** — Session #21 |
| `skills/overture-init/references/operating-document-template.md` | Tool-agnostic operating document template | Both | **v1.1** — Session #20 |
| `skills/session-start/SKILL.md` | Session-start skill — cross-tool context loading. Companion Capabilities #21; profile auto-load pre-step #22. Progress ledger added #26 ([N/M] step lines + outcome lines). Date/time pre-step (Aug 10); durability check + durable-UPCOMING (Aug 18 + #28). | Agent | **v1.5** — Session #28 |
| `skills/session-end/SKILL.md` | Session-end skill — cross-tool handoff and cleanup. Companion Capabilities + size-check strengthening #21; voice-context load #22. Progress ledger + receipt checklist + session-close commit convention added #26. Durability step 7b + explicit dispositions + citation rule (#28). | Agent | **v1.5** — Session #28 |
| `glossary.md` | Controlled vocabulary for tool-agnostic terminology | Both | **v1** — April 2026 |

### Methodology

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `README.md` | Entry point — problem, quick start, orientation, kit overview. Voice in Practice section added #26. Hero + Problem section rewritten onto the OOTB-aware wedge #27. | You | **v6** — Session #27 |
| `Progression.md` | Progression guide — day-1 paths, level-by-level experience, when to evolve | You | **v2** — April 9, 2026 |
| `Working-With-Claude-Code.md` | Conceptual framework: ICL foundations, memory architecture, Levels 0-4, Choral, Lyrical | You | Updated March 22, 2026 |
| `workflow/Claude-Code-Workflow-Framework.md` | The methodology: session management, CLAUDE.md anatomy, documentation hygiene | You | **v2.0** — March 2026 |
| `choral/Choral-Pattern.md` | Standalone Choral reference: three coordination modes, shared blackboard, setup | You | **v2.0** — March 23, 2026 |
| `voice/Voice-Framework.md` | Voice as design material: defining, encoding, maintaining voice. "Defeating the AI Default" section added #22 (AI-tells methodology + anti-pattern categories). | You | **v2.1** — Session #22 |
| `voice/Voice-Reference.md` | Detailed session structure, derivation approach, encoding patterns. Paired-Sample Diff #22; **Drafting note (positive patterns first) #25**. | You | **v2.2** — Session #25 |
| `patterns/Data-Authority.md` | Architectural pattern: single source of truth for derived state | You | v1.1 — April 2026 |
| `patterns/Autonomous-Background.md` | Scheduled triggers for between-session quality work | You | v1.1 — April 2026 |
| `patterns/Size-Management.md` | Operating document size thresholds, archiving protocol, project profiles | You | v1.1 — April 2026 |
| `patterns/Settings-Hygiene.md` | Settings accumulation, two-layer organization, cleanup protocol | You | v1 — March 2026 |
| `patterns/Section-Ordering.md` | Canonical operating document section ordering across projects | You | v1 — March 2026 |
| `patterns/Privacy-Boundary.md` | PII filtering at public surfaces — boundary declaration, runtime verification | You | v1.1 — April 2026 |
| `patterns/Handoff-Durability.md` | Field lifetime model: rotating vs durable fields, doc rule, citation rule | You | **v1.1** — Session #28 (v1 Aug 18 sitting; edit-semantics revision #28) |

### Templates & Hooks (manual setup / backwards compatible)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `templates/profile.md` | Overture profile template — personal customizations | You | **v1** — April 2026 |
| `templates/CLAUDE.md` | CC-specific operating document skeleton | Both | v3.1 — April 2026 |
| `templates/init.md` | Manual init guide (superseded by plugin/skills) | Agent | v1 — March 2026 |
| `templates/session-start.md` | CC session-start command template. Progress ledger #26 (synced with skill). Date/time pre-step + durability synced (#28). | Agent | v4 — Session #28 |
| `templates/session-end.md` | CC session-end command template. Progress ledger + commit convention #26 (synced with skill). 7b + dispositions + citation rule (#28). | Agent | v5 — Session #28 |
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

*Rotating fields: Current, Status, and NEXT are rewritten at every session-end.
Anything that must survive more than one cycle lives in a durable structure
(UPCOMING SESSIONS, RESERVED SESSIONS, DEFERRED WORK), pointed at from here.*

**Current**: Session #27 complete (June 15, 2026); July 6 hygiene sitting — plugin 1.1.0 published per coordinator contract
**Status**: Publish gap closed (coordinator contract `choral/contracts/portfolio-overture.md`, Jul 6). #27 shipped Jun 15 without `/session-end`; close-out reconciled retroactively in the Jul 6 sitting. Plugin bumped 1.0.1 → 1.1.0 with CHANGELOG.md + validate + tag v1.1.0; all pushed. Siblings pick up #20-#26 skill changes via `/plugin update`.
**NEXT**: Marketplace submission talk-through — decide what Overture submits and why BEFORE submitting anything (Min's call, Jul 6). Ground in STRATEGY.md marketplace posture + UPCOMING #6; 1.1.0 is tagged and validate-clean, so the mechanical part is unblocked once the decision lands. Then Session #29 — Autonomous Execution Mode (full build; context: `docs/plans/2026-08-19-autonomous-execution-context.md`).
**Last queue hygiene**: July 6 sitting (#27 UPCOMING entry cleared + renumbered; #27 close entry written; #24/#25 entries merged)

### Pending Verifications
*(Phase 4a fix verification → Deferred Work, Phase 4b row.)*

### Continuing / Open Threads (for Session #29)
- **Wider em-dash + AI-tells purge** — see UPCOMING #2 (README leftovers incl. heading-case question, Progression, Working-With-Claude-Code, workflow/, patterns/ ~95, choral/). Mechanical; foldable into any session.

### July 6, 2026 Hygiene Sitting (coordinator contract)

Executed `choral/contracts/portfolio-overture.md` (publish gap: #27 README + plugin bump sitting unpushed; the public repo showed the pre-#27 README). Privacy audit of pending commits PASS → CHANGELOG.md authored (actual 1.0.1→1.1.0 delta spans #20-#26, wider than the contract's "#22+#26") → plugin.json 1.1.0 + marketplace metadata description (`claude plugin validate` clean) → tag v1.1.0 → push. #27 close-out reconciled retroactively; STATUS written back to the contract. Same-day follow-up: Voice in Practice callback rewired to the new hero ("part of what compounds"); settings.local.json cleaned per Settings-Hygiene protocol (76 → 31 entries; credential scan clean; home-dir-wide Read narrowed to Projects + tool dirs; backup in session scratchpad).

### August sittings (untracked; reconciled at #28)

**Aug 10**: session-start gained the mandatory date/time pre-step (`ddb2db7`),
hand-mirrored into the plugin cache pending a release. **Aug 18**: absOrbs #26
surfaced the handoff-durability defect; the behavioral patch landed (`b3fd07e`:
pattern doc + session-end 7b + session-start check), unmirrored. Both sat
unpushed until #28 session-start (privacy-audited, then pushed); 1.2.0
supersedes the hand-mirroring.

### Session #27 Complete (June 15, 2026, reconciled July 6)

README hero rewritten onto the OOTB-aware wedge: "A memory file remembers. A workflow compounds." Problem section reconciled to match. Spec `93a2455`, plan `f4be9af`, ship `896f191`, kit table `7e48f1f`. Session ended without `/session-end`; closed retroactively in the Jul 6 sitting. Voice in Practice "setup" callback checked: reads fine standalone, tagline echo gone (open thread).

### Session #27 Planning Interlude (June 14, 2026, compressed)

Fortomino autonomous-execution audit: bare tool-level `Bash` in allow makes the merge/deploy hard gates behavioral-only, voiding Settings-Hygiene's dangerous-by-absence model; contradiction live in the kit (profile.md line 53 vs Settings-Hygiene 83-86). Decision (user-confirmed): full opt-in pattern + tooling build queued as Session #29 (renumbered); design in `docs/plans/2026-08-19-autonomous-execution-context.md`. No code.

### Session #26 Complete (June 12, 2026, compressed)

README "Voice in Practice" H2 shipped (`57d2946`, 284w before/after; positive-patterns-first, grep-gated). Progress ledger added to both session skills + CC templates (`e7b07e2`): entry roster + [N/M] step lines + outcomes + receipt checklist + session-close commit convention (session-start gets lighter variant). Extracted from Fortomino/itsmin.com recon; five further recon candidates captured to P2 #5. Spec `dbae4fe`, plan `365ff5e`.

### Sessions #24-#25 Complete (May 22, 2026, compressed)

Origins narrative shipped (README 328w `9ae1573` + STRATEGY 122w `753ef63`); STRATEGY Purpose + Is/Isn't voiced + em-dash purge 20→1 (`9247fc0`, `f997e11`); Drafting note H2 codified in `voice/Voice-Reference.md` (`6fec5b5`): draft toward voice.md positive patterns first, grep-verify second (v1 passed grep but read as competent-AI-prose). Detail in COMPLETE table + archives.

### Session #23 Complete (May 22, 2026, compressed)

Voice purge of voice docs: `Voice-Framework.md` 47 em-dashes → 0, `Voice-Reference.md` 36 → 0, sentence-case headings, header-payload colons. 7 project `.claude/voice.md` copies deleted (byte-identical #22 snapshots); single source of truth restored at `~/.overture/voice.md`, project-local override still functional. Commit `d829a9f`. The docs that teach AI-tells avoidance now demonstrate it.

### Sessions #17-#22 (archived)

See [`docs/sessions/SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md) for the compressed entries.

### Sessions #1-#16 (archived)

See [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) for the compressed entries.

---

## WORK QUEUE

*Durable sections: entries are curated item-wise and leave only by explicit
disposition (moved to COMPLETE, DEFERRED WORK, PARKING LOT, an archive, or a
doc), never by silent omission at session-end.*

### CURRENT PRIORITIES

**P1: Phase 2 — Voice elevation** *(per Session #21 strategic reframe; voice is Overture's most defensible distinctive)*
- (a)-(d) **DONE #22-#23**: voice derivation pass (`~/.overture/voice.md` refreshed, 4-register + AI-tells), methodology baked into Voice-Framework/Reference, skills auto-load voice.md, voice-doc em-dash purge (47+36 → 0) + project copies deleted.
- (e) **PARTIAL — Origins SHIPPED #24** (README 328w + STRATEGY 122w); **Purpose + Is/Isn't SHIPPED #25** (STRATEGY 53w + 119w); **README voice section SHIPPED #26** (Voice in Practice, 284w before/after); **README hero SHIPPED #27** (OOTB-aware wedge). Remaining: LinkedIn derivative (parallel P2).
- (f) Pattern docs "Related capabilities" footers cross-referencing ecosystem-map (structural, no brainstorm needed). Can fold into (e).
- (g) **DONE #25**: Drafting note codified in `voice/Voice-Reference.md` (positive-patterns-first lesson from #24+#25 production drafting).

**P2: Phase 3 — Marketplace submission + community distribution** *(sequenced after Phase 2; ~1-2 sessions)*
- Submission hygiene **DONE Jul 6 sitting** (CHANGELOG.md authored, plugin.json 1.1.0 + tag v1.1.0, marketplace metadata description, validate clean). Remaining: README polish post-Phase 2 (optional).
- Submit to Anthropic-curated marketplace via form at `clau.de/plugin-directory-submission`. Curated review ~few days.
- Opportunistic: ClaudePluginHub auto-indexing, awesome-agent-skills PR (~30 min), claudemarketplaces.com listing.
- Optional capstone: Medium/Substack post on voice-as-design-material (indexed artifact, not community-building).

### UPCOMING SESSIONS

1. **Session #29: Autonomous Execution Mode — full command/skill/hook build** *(queued by the #27 interlude; renumbered from #28 when #28 became the handoff-durability build; START with `superpowers:brainstorming`)* — Capture Fortomino's autonomous build-to-playtest posture as a reusable pattern with tooling. Full design (two-layer finding, 5-component build scope, opt-in verdict, the live profile/Settings-Hygiene inconsistency, both settings case studies): `docs/plans/2026-08-19-autonomous-execution-context.md`.

2. **Session #29+: Wider em-dash + AI-tells purge** — STRATEGY done #25. Remaining: README outside Origins/Provenance/Voice-in-Practice (incl. heading-case question), Progression, Working-With-Claude-Code, workflow/, patterns/ (heaviest at ~95), choral/. Mechanical, low-risk. Could be a dedicated session or folded into any session already editing README.

3. **Parallel P2: LinkedIn derivative of Origins** — Essay-register first test (voice.md beyond technical-narrative). Different register; will surface voice.md gaps. Origins is shipped + STRATEGY positioning final, so timing is open.

4. **Parallel P2 — Phase 4b Gemini retest** *(demoted from #20's plan)* — empirically valuable; quota constraint dissolved by time. Run when convenient; rolls into Phase 4c (framework doc consolidation). Note: #26 skill edits widen the retest surface (progress ledger is new cross-tool behavior).

5. **Parallel P2 — CLAUDE.md tracking normalization** (pxtxt, itsmin.com) — Each project's own session: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from gitignore → commit. Not blocking; required for fresh-clone portability.

6. **Sessions #29+: Phase 3 — marketplace submission + community directory PRs** — Hygiene pass **DONE Jul 6** (CHANGELOG.md, 1.1.0 bump + tag v1.1.0, validate clean). **Decision gate first (Min, Jul 6): talk through what Overture submits and why before submitting** — revisit STRATEGY.md marketplace posture, what a curated listing commits the project to (support expectations, scan cadence, versioning discipline), and whether directories beyond the curated one earn their listing. Then, if it survives: submit via `clau.de/plugin-directory-submission`, opportunistic PRs (ClaudePluginHub, awesome-agent-skills, claudemarketplaces.com).

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Plugin 1.1.0: CHANGELOG + bump + tag + push | Jul 6 sitting | Coordinator contract executed; CHANGELOG covers the actual #20-#26 delta; marketplace metadata description added; validate clean; publish gap closed. |
| README hero rewrite + Problem reconciliation | #27 | "A memory file remembers. A workflow compounds." (OOTB-aware wedge). Spec `93a2455`, plan `f4be9af`, ship `896f191`, kit table `7e48f1f`. Closed retroactively Jul 6. |
| Voice in Practice README section | #26 | New H2 between How It Works and Provenance: same bug-fix summary drafted twice (unguided vs voice profile), naming paragraph, pointer to `voice/` + profile mechanism. 284w, drafted positive-patterns-first per #25 Drafting note, grep-gated after. Spec `dbae4fe`, plan `365ff5e`, ship `57d2946`. |
| Progress ledger in session skills + templates | #26 | Session-end: entry roster + [N/M] step lines + one-line outcomes (skips always carry reasons) + receipt checklist + session-close commit convention (size transition + NEXT in message). Session-start: lighter variant. Skill/template pairs synced; skills v1.4, templates v4/v3. Extracted from Fortomino/itsmin.com recon. Ship `e7b07e2`. |
| STRATEGY voiced + em-dash purge + Drafting note | #25 | Purpose 53w + Is/Isn't 119w (`9247fc0`); em-dash 20→1 (`f997e11`); Drafting note H2 in Voice-Reference (`6fec5b5`). Spec `e8c26cb`, plan `4f2de9b`. |
| Origins narrative shipped to README + STRATEGY | #24 | 328w README (`9ae1573`) + 122w STRATEGY (`753ef63`). Spec/plan `e8a723c`/`1d1ac48`. |
| *...and earlier work (#1-#23: cross-tool validation, strategic reframe, voice derivation + purge)* | #1-#23 | See [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) + [`SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md) + the #23 session entry above. |

### P2: FUTURE WORK

1. **Active ecosystem prompting** *(Session #21 idea)* — extend #21's passive Companion Capabilities references with in-flow prompting: surface the right companion skill at the moment of use. Options: (a) reference card / `references/ecosystem-trigger-map.md`, (b) session-start suggesting companions from queued priorities, (c) UserPromptSubmit hook on signal phrases. Reference card is lightest. Decide after Phase 2 lands.
2. **Decay reference** — Decay/memory lifecycle templates. Leave as documented gap (#5); Size Management covers the actionable part. Revisit only if a generalizable pattern emerges.
3. **Methodology doc lazy refactor** — Apply glossary terms to existing docs (Working-With-Claude-Code.md, Workflow Framework, Progression, patterns) as they're touched. No dedicated refactoring pass unless needed.
4. **Adapter layer** — Build only after testing on a second tool reveals what actually needs adapting. Don't pre-build from theory.
5. **Sibling-project pattern harvest** *(Session #26 recon, Fortomino + itsmin.com)* — five candidates, each its own small upstream: (a) **verification ladder** — typed verification stages (unit → E2E → probe → live) strengthening session-end Step 3; (b) **compute-only hook principle** — hooks compute live state, never duplicate source-of-truth content; encode in `templates/hooks/README.md` + scripts; (c) **size-check hook enforcement** — WARN/FAIL thresholds in the session-end hook script (operationalizes Size-Management); (d) **severity-graded privacy gate** — block/warn severities at compile/deploy time for `patterns/Privacy-Boundary.md`; (e) **working-contract upgrade** — PHASES / numbered RECOMMENDATIONS / OWNERSHIP BOUNDARY / live STATUS sections for `templates/contract.md` + Choral-Pattern. Progress-ledger + commit-convention candidates already shipped #26.

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
| Strategy | `STRATEGY.md` | Session #25 | Distinctive lanes, coexisting lanes, scan discipline, marketplace posture. **All prose complete #25** (Origins #24, Purpose + Is/Isn't #25). Voice-clean end-to-end after em-dash purge #25 (20 → 1 load-bearing). |
| Scan Log | `SCAN-LOG.md` | Session #21 | Quarterly ecosystem scans. Inaugural Q2 2026 entry. Next: Jul 2026. |
| README | `README.md` | Session #27 | Entry point — plugin install, profile, orientation. Origins narrative #24 (328w). Voice in Practice section #26. **Hero rewritten #27** (OOTB-aware wedge, "A memory file remembers. A workflow compounds."); Problem section reconciled to match. |
| Glossary | `glossary.md` | Session #11 | Controlled vocabulary for tool-agnostic terminology |
| Plugin Manifest | `.claude-plugin/plugin.json` | Jul 6, 2026 | Claude Code plugin manifest — **v1.1.0** |
| Marketplace Manifest | `.claude-plugin/marketplace.json` | Jul 6, 2026 | Self-hosted marketplace; metadata description added |
| Changelog | `CHANGELOG.md` | Jul 6, 2026 | Plugin version history, 1.0.0 → 1.1.0 |
| Init Command (CC) | `commands/init.md` | Session #13 | CC plugin command — `/overture:init` (profile-aware) |
| Init Skill | `skills/overture-init/` | Session #21 | Cross-tool init (Agent Skills format, profile-aware). Step 6 ecosystem surfacing added #21. |
| Session-Start Skill | `skills/session-start/` | Session #28 | Cross-tool session-start. Companion Capabilities #21; profile auto-load pre-step #22. Progress ledger added #26. **Date/time pre-step (Aug 10); durability check + durable-UPCOMING (Aug 18 + #28).** |
| Session-End Skill | `skills/session-end/` | Session #28 | Cross-tool session-end. Companion Capabilities + size-check strengthening #21; voice-context reload #22. Progress ledger + receipt checklist + session-close commit convention added #26. **Durability step 7b + explicit dispositions + citation rule (#28).** |
| Progression Guide | `Progression.md` | Session #13 | Day-1 paths, level-by-level experience, profile, when to evolve |
| Conceptual Framework | `Working-With-Claude-Code.md` | Session #6 | ICL, memory tiers, Levels 0-4, Choral, Lyrical |
| Workflow Framework | `workflow/Claude-Code-Workflow-Framework.md` | Session #6 | Methodology v2.0 — session management, CLAUDE.md anatomy, hooks |
| Choral Reference | `choral/Choral-Pattern.md` | Session #12 | Standalone coordination pattern guide |
| Choral Sync Template | `templates/choral.md` | Session #12 | Mid-session coordination command template |
| Voice Framework | `voice/Voice-Framework.md` | Session #23 | Voice methodology — defining, encoding, maintaining. "Defeating the AI Default" section added #22. **Voice-purged #23** (47 em-dashes → 0; sentence-case headings; walks the talk). |
| Voice Reference | `voice/Voice-Reference.md` | Session #25 | Session structure, derivation, encoding patterns. Paired-Sample Diff #22; voice-purged #23; Drafting note #25. |
| Data Authority | `patterns/Data-Authority.md` | Session #16 | Architectural pattern: single source of truth for derived state. Staleness/Refresh added #16. |
| Autonomous Background | `patterns/Autonomous-Background.md` | Session #16 | Scheduled triggers for between-session quality work. Pattern interconnection added #16. |
| Size Management | `patterns/Size-Management.md` | Session #16 | Operating document size thresholds, archiving protocol. Coordination profile added #16. |
| Settings Hygiene | `patterns/Settings-Hygiene.md` | Session #8 | Settings accumulation, two-layer org, cleanup |
| Section Ordering | `patterns/Section-Ordering.md` | Session #8 | Canonical operating document section ordering |
| Privacy Boundary | `patterns/Privacy-Boundary.md` | Session #16 | PII filtering at public surfaces, boundary declaration, runtime verification. How-It-Hid narrative added #16. |
| Handoff Durability | `patterns/Handoff-Durability.md` | Session #28 | Field lifetime model: rotating vs durable fields, doc rule, citation rule. v1 Aug 18 sitting; edit-semantics revision #28. |
| Profile Template | `templates/profile.md` | Session #13 | Personal Overture profile — customization layer |
| Hook Templates | `templates/hooks/` | Session #8 | Hook scripts, setup guide, specialization recipes |
| Init Guide (legacy) | `templates/init.md` | Session #2 | Manual init (superseded by plugin/skills) |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| [`docs/sessions/SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md) | #17-#22 | Apr 13 – May 22, 2026 |
| [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) | #1-#16 | Mar 22 – Apr 13, 2026 |
