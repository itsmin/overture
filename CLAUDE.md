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
| `.claude-plugin/plugin.json` | Claude Code plugin manifest | Agent | **v1** — April 2026 |
| `.claude-plugin/marketplace.json` | Self-hosted marketplace manifest | Agent | **v1** — April 2026 |
| `commands/init.md` | CC plugin init command — `/overture:init` | Agent | **v1** — April 2026 |
| `skills/overture-init/SKILL.md` | Init skill (Agent Skills format) — cross-tool project setup. Step 6 ecosystem surfacing added #21. | Agent | **v1.2** — Session #21 |
| `skills/overture-init/references/operating-document-template.md` | Tool-agnostic operating document template | Both | **v1.1** — Session #20 |
| `skills/session-start/SKILL.md` | Session-start skill — cross-tool context loading. Companion Capabilities #21; profile auto-load pre-step #22. Progress ledger added #26 ([N/M] step lines + outcome lines). | Agent | **v1.4** — Session #26 |
| `skills/session-end/SKILL.md` | Session-end skill — cross-tool handoff and cleanup. Companion Capabilities + size-check strengthening #21; voice-context load #22. Progress ledger + receipt checklist + session-close commit convention added #26. | Agent | **v1.4** — Session #26 |
| `glossary.md` | Controlled vocabulary for tool-agnostic terminology | Both | **v1** — April 2026 |

### Methodology

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `README.md` | Entry point — problem, quick start, orientation, kit overview. Voice in Practice section (before/after demonstration) added #26. | You | **v5** — Session #26 |
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

### Templates & Hooks (manual setup / backwards compatible)

| File | Purpose | Audience | Status |
|------|---------|----------|--------|
| `templates/profile.md` | Overture profile template — personal customizations | You | **v1** — April 2026 |
| `templates/CLAUDE.md` | CC-specific operating document skeleton | Both | v3.1 — April 2026 |
| `templates/init.md` | Manual init guide (superseded by plugin/skills) | Agent | v1 — March 2026 |
| `templates/session-start.md` | CC session-start command template. Progress ledger #26 (synced with skill). | Agent | v3 — Session #26 |
| `templates/session-end.md` | CC session-end command template. Progress ledger + commit convention #26 (synced with skill). | Agent | v4 — Session #26 |
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

**Current**: Session #26 complete (June 12, 2026)
**Status**: Phase 2 substantive delivery + sibling-project pattern harvest. README "Voice in Practice" section shipped (`57d2946`, 284w before/after demonstration, drafted positive-patterns-first per the #25 Drafting note). Progress ledger added to both session skills + both CC templates (`e7b07e2`): step roster at session-end entry, [N/M] step lines with one-line outcomes, skips always carry reasons, session-close commit convention (size transition + NEXT in the message). Ledger design extracted from Fortomino/itsmin.com recon; five further recon candidates captured to P2.
**NEXT**: Session #27 — README hero rewrite. Biggest visibility surface; STRATEGY framing settled, Voice in Practice now live raises the bar on the hero. Current tagline is doing real work; replacing it requires earning the change. Dedicated brainstorm.
**Last queue hygiene**: Session #26 (P1 (e) advanced via Voice in Practice ship; UPCOMING renumbered; recon findings captured as P2 #6; COMPLETE trimmed to ~10 rows)

### Pending Verifications
*(Phase 4a fix verification absorbed into Deferred Work — see Phase 4b row.)*

### Continuing / Open Threads (for Session #27)
- **Wider Overture em-dash + AI-tells purge** — STRATEGY done #25 (20→1 load-bearing). Remaining surfaces: README outside Origins/Provenance/Voice-in-Practice (incl. heading-case question deferred from #26), Progression, Working-With-Claude-Code, workflow/, patterns/ (heaviest at ~95), choral/. Dedicated session or folded into #27 where the editor is in README anyway.
- **Phase 2 brainstorm work remaining** — Origins #24; STRATEGY Purpose + Is/Isn't #25; README voice section #26. Remaining: README hero rewrite (#27), LinkedIn derivative (parallel P2).
- **Plugin version bump pending** — #26 skill changes live in repo source, not in the installed 1.0.1 plugin cache. Fold the version bump into Phase 3 hygiene (CHANGELOG + version consistency already queued there).

### Session #26 Complete (June 12, 2026)

**README Voice in Practice + progress ledger in session skills**

- Brainstorm run self-directed (user pre-approved); spec `dbae4fe`, plan `365ff5e`, decisions documented for post-hoc review.
- **Voice in Practice** (`57d2946`): new README H2 between How It Works and Provenance. Same bug-fix summary drafted twice (unguided model vs voice profile), naming paragraph, pointer to `voice/` + profile mechanism. 284w. Drafted toward positive patterns first, grep-gated after (0 em-dashes outside exhibits, 0 banned vocab, 0 curly quotes).
- **Progress ledger** (`e7b07e2`): session-end gets entry roster + [N/M] step lines + one-line outcomes + receipt checklist + session-close commit convention; session-start gets the lighter variant. Skill/template pairs synced. Extracted from Fortomino (state-transition commits, reconciliation metadata) + itsmin.com (automated boundary checks) recon.
- Five recon candidates captured to P2 (verification ladder, compute-only hooks, size-check hook, severity-graded privacy gate, contract template upgrade).

### Session #25 Complete (May 22, 2026)

**STRATEGY.md voiced sections + em-dash purge + Drafting note codified**

- Brainstorm via `superpowers:brainstorming` → spec (`e8c26cb`) → plan (`4f2de9b`) → inline execution. 3 calls locked: distinct jobs for Purpose vs Is/Isn't; two-paragraph contrast for Is/Isn't; specialist mode lands at the close.
- **Purpose + Is/Isn't voiced** (`9247fc0`): Purpose 53w (verdict-first definition; "the discipline is the product" closer). Is/Isn't 119w two paragraphs (Is = composition + 3 lanes; Isn't = declined claims + specialist mode soften-then-assert). Status note refreshed.
- **STRATEGY.md em-dash purge** (`f997e11`): 20 → 1 load-bearing across Distinctive Lanes, Coexisting Lanes, Scan Discipline, Anti-Atrophy, Marketplace Posture. Header-payload em-dashes → colons; receipts → parens; clause-splits → periods.
- **Drafting note codified** (`6fec5b5`): new H2 in `voice/Voice-Reference.md` encoding the #24+#25 finding (grep necessary but not sufficient; draft toward voice.md positive patterns first, grep-verify second; "When grep alone is enough" sub-section distinguishes purge work from new prose). Walks the talk (0 em-dashes, verdict-first, soften-then-assert).
- STRATEGY.md is voice-clean end-to-end. All prose placeholders cleared.

### Session #24 Complete (May 22, 2026, compressed)

Origins narrative shipped to README (`9ae1573`, 328w) + STRATEGY.md (`753ef63`, 122w). Brainstormed D+B hybrid spine (ecosystem-evolution earned via 480+ session provenance), fire-by-fire structure, third-person clinical register. Spec `e8a723c`, plan `1d1ac48`. Sessions #1-#16 archived to `docs/sessions/SESSIONS_01_16_ARCHIVE.md`. Drafting finding surfaced: v1 passed all grep-checks but read as competent-AI-prose; v2 required writing toward voice.md positive patterns. Finding encoded in Voice-Reference.md as "Drafting note" H2 in #25.

### Session #23 Complete (May 22, 2026, compressed)

Voice purge of voice docs: `Voice-Framework.md` 47 em-dashes → 0, `Voice-Reference.md` 36 → 0, sentence-case headings, header-payload colons. 7 project `.claude/voice.md` copies deleted (byte-identical #22 snapshots); single source of truth restored at `~/.overture/voice.md`, project-local override still functional. Commit `d829a9f`. The docs that teach AI-tells avoidance now demonstrate it.

### Sessions #17-#22 (archived)

See [`docs/sessions/SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md) for the compressed entries.

### Sessions #1-#16 (archived)

See [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) for the compressed entries.

---

## WORK QUEUE

### CURRENT PRIORITIES

**P1: Phase 2 — Voice elevation** *(per Session #21 strategic reframe; voice is Overture's most defensible distinctive)*
- (a)-(d) **DONE #22-#23**: voice derivation pass (`~/.overture/voice.md` refreshed, 4-register + AI-tells), methodology baked into Voice-Framework/Reference, skills auto-load voice.md, voice-doc em-dash purge (47+36 → 0) + project copies deleted.
- (e) **PARTIAL — Origins SHIPPED #24** (README 328w + STRATEGY 122w); **Purpose + Is/Isn't SHIPPED #25** (STRATEGY 53w + 119w); **README voice section SHIPPED #26** (Voice in Practice, 284w before/after). Remaining: README hero rewrite (#27), LinkedIn derivative (parallel P2).
- (f) Pattern docs "Related capabilities" footers cross-referencing ecosystem-map (structural, no brainstorm needed). Can fold into (e).
- (g) **DONE #25**: Drafting note codified in `voice/Voice-Reference.md` (positive-patterns-first lesson from #24+#25 production drafting).

**P2: Phase 3 — Marketplace submission + community distribution** *(sequenced after Phase 2; ~1-2 sessions)*
- Submission hygiene: CHANGELOG.md (missing), `claude plugin validate` pass, version-consistency check (plugin.json / CHANGELOG / git tags), README polish post-Phase 2.
- Submit to Anthropic-curated marketplace via form at `clau.de/plugin-directory-submission`. Curated review ~few days.
- Opportunistic: ClaudePluginHub auto-indexing, awesome-agent-skills PR (~30 min), claudemarketplaces.com listing.
- Optional capstone: Medium/Substack post on voice-as-design-material (indexed artifact, not community-building).

### UPCOMING SESSIONS

1. **Session #27: README hero rewrite** — Biggest visibility surface, biggest stakes. STRATEGY framing fully settled; Voice in Practice (#26) now live raises the bar on the hero. Current tagline ("The setup before the performance...") is doing real work; replacing it requires earning the change. Dedicated brainstorm. Note: Voice in Practice cites the "setup" tagline framing ("voice as part of the setup") — if the hero changes, check that callback.

2. **Session #28+: Wider em-dash + AI-tells purge** — STRATEGY done #25. Remaining: README outside Origins/Provenance/Voice-in-Practice (incl. heading-case question), Progression, Working-With-Claude-Code, workflow/, patterns/ (heaviest at ~95), choral/. Mechanical, low-risk. Could be dedicated session or folded into #27 where the editor is in README anyway.

3. **Parallel P2: LinkedIn derivative of Origins** — Essay-register first test (voice.md beyond technical-narrative). Different register; will surface voice.md gaps. Origins is shipped + STRATEGY positioning final, so timing is open.

4. **Parallel P2 — Phase 4b Gemini retest** *(demoted from #20's plan)* — empirically valuable; quota constraint dissolved by time. Run when convenient; rolls into Phase 4c (framework doc consolidation). Note: #26 skill edits widen the retest surface (progress ledger is new cross-tool behavior).

5. **Parallel P2 — CLAUDE.md tracking normalization** (pxtxt, itsmin.com) — Each project's own session: privacy audit → move sensitive bits to `.claude/CLAUDE.local.md` → remove `CLAUDE.md` from gitignore → commit. Not blocking; required for fresh-clone portability.

6. **Sessions #29+: Phase 3 — marketplace submission + community directory PRs** — Hygiene pass (CHANGELOG, validate, version consistency, **plugin version bump so installed plugin picks up #26 skill changes**), submit to Anthropic-curated marketplace, opportunistic PRs. Sequenced after Phase 2 prose work fully lands.

### COMPLETE (Recent)

| Item | Session | Notes |
|---------|---------|-------|
| Voice in Practice README section | #26 | New H2 between How It Works and Provenance: same bug-fix summary drafted twice (unguided vs voice profile), naming paragraph, pointer to `voice/` + profile mechanism. 284w, drafted positive-patterns-first per #25 Drafting note, grep-gated after. Spec `dbae4fe`, plan `365ff5e`, ship `57d2946`. |
| Progress ledger in session skills + templates | #26 | Session-end: entry roster + [N/M] step lines + one-line outcomes (skips always carry reasons) + receipt checklist + session-close commit convention (size transition + NEXT in message). Session-start: lighter variant. Skill/template pairs synced; skills v1.4, templates v4/v3. Extracted from Fortomino/itsmin.com recon. Ship `e7b07e2`. |
| Drafting note codified in Voice-Reference.md | #25 | New H2 section between Encoding patterns and Voice across projects. Encodes #24+#25 finding: grep checks necessary but not sufficient; draft toward voice.md positive patterns first, grep-verify second. "When grep alone is enough" sub-section distinguishes purge work from new prose. Walks the talk (0 em-dashes, verdict-first opening, soften-then-assert close). Commit `6fec5b5`. |
| STRATEGY.md em-dash purge (5 remaining sections) | #25 | 20 → 1 load-bearing across Distinctive Lanes, Coexisting Lanes, Scan Discipline, Anti-Atrophy, Marketplace Posture. Header-payload em-dashes → colons; receipts → parens; clause-splits → periods. STRATEGY is voice-clean end-to-end. Commit `f997e11`. |
| STRATEGY.md Purpose + What Overture Is, and Isn't voiced | #25 | Two placeholder blocks replaced with voiced prose per approved spec. Purpose 53w (verdict-first definition + role + "discipline is the product" closer). Is/Isn't 119w two-paragraph contrast (Is = composition + 3 lanes; Isn't = declined claims + specialist mode soften-then-assert at section close). 1 load-bearing em-dash; 0 banned vocab; 0 copula substitution. Spec `e8c26cb`, plan `4f2de9b`, ship `9247fc0`. |
| Origins narrative shipped to README + STRATEGY | #24 | 328w README integration replacing Provenance paragraph (commit `9ae1573`); 122w STRATEGY derivation (`753ef63`). Spec + plan committed (`e8a723c`, `1d1ac48`). Drafting finding: v1 passed all grep-checks but read as competent-AI-prose; v2 was rewritten toward voice.md positive patterns. |
| Voice purge of voice docs + project-copies decision | #23 | `voice/Voice-Framework.md` + `voice/Voice-Reference.md` cleaned (47+36 em-dashes → 0; sentence-case headings). 7 project copies deleted; single source at `~/.overture/voice.md`. Commit `d829a9f`. |
| Voice derivation + AI-tells discovery + skill-wire | #22 | `~/.overture/voice.md` refreshed (4-register, AI-tells, paired-sample diff). `Voice-Framework.md` + `Voice-Reference.md` absorbed AI-tells methodology. Skills auto-load voice.md. Voice.md propagated to ~/Desktop + 7 projects. |
| Strategic reframe + Phase 1 execution | #21 | Specialist mode reaffirmed. `STRATEGY.md` skeleton + inaugural `SCAN-LOG.md` shipped. First-party plugin references added to all 3 skills. Session-end size-check rule strengthened (`d389d1b`). CLAUDE.md compressed. |
| First cross-tool validation + skills audit & fixes | #20 | Gemini CLI 0.38.2 executed `overture-init` end-to-end (Phase 2 PASS). Phase 1 audit found portability gaps; fixed. Phase 4a fixes from output audit. Phase 4b retest demoted to P2 in #21. |
| *...and earlier foundational work (#1-#19)* | #1-#19 | See [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) + [`SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md). |

### P2: FUTURE WORK

1. **Active ecosystem prompting** *(Session #21 idea)* — extend #21's passive Companion Capabilities references with in-flow prompting: surface the right companion skill at the moment of use. Options: (a) reference card / `references/ecosystem-trigger-map.md`, (b) session-start suggesting companions from queued priorities, (c) UserPromptSubmit hook on signal phrases. Reference card is lightest. Decide after Phase 2 lands.
2. **Decay reference** — Decay and memory lifecycle templates. **Recommendation (Session #5)**: leave as documented gap. Size Management covers the actionable part. Revisit only if a generalizable pattern emerges.
3. **Methodology doc lazy refactor** — Apply glossary terms to existing docs (Working-With-Claude-Code.md, Workflow Framework, Progression, patterns) as they're touched. No dedicated refactoring pass unless needed.
4. **Adapter layer** — Build only after testing on a second tool reveals what actually needs adapting. Don't pre-build from theory.
5. **Settings hygiene review** *(Session #21 flag, drift confirmed #25)* — 61 permission entries in `.claude/settings.local.json` (was 51 at #21). Quick scan for clusters replaceable by broader patterns, stale one-offs, anything that looks like a stale credential. ~5-10 minutes.
6. **Sibling-project pattern harvest** *(Session #26 recon, Fortomino + itsmin.com)* — five candidates, each its own small upstream: (a) **verification ladder** — typed verification stages (unit → E2E → probe → live) strengthening session-end Step 3; (b) **compute-only hook principle** — hooks compute live state, never duplicate source-of-truth content; encode in `templates/hooks/README.md` + scripts; (c) **size-check hook enforcement** — WARN/FAIL thresholds in the session-end hook script (operationalizes Size-Management); (d) **severity-graded privacy gate** — block/warn severities at compile/deploy time for `patterns/Privacy-Boundary.md`; (e) **working-contract upgrade** — PHASES / numbered RECOMMENDATIONS / OWNERSHIP BOUNDARY / live STATUS sections for `templates/contract.md` + Choral-Pattern. Progress-ledger + commit-convention candidates already shipped #26.

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
| README | `README.md` | Session #26 | Entry point — plugin install, profile, orientation. Origins narrative #24 (328w). **Voice in Practice section #26** (before/after demonstration between How It Works and Provenance). |
| Glossary | `glossary.md` | Session #11 | Controlled vocabulary for tool-agnostic terminology |
| Plugin Manifest | `.claude-plugin/plugin.json` | Session #13 | Claude Code plugin manifest |
| Marketplace Manifest | `.claude-plugin/marketplace.json` | Session #13 | Self-hosted marketplace for plugin distribution |
| Init Command (CC) | `commands/init.md` | Session #13 | CC plugin command — `/overture:init` (profile-aware) |
| Init Skill | `skills/overture-init/` | Session #21 | Cross-tool init (Agent Skills format, profile-aware). Step 6 ecosystem surfacing added #21. |
| Session-Start Skill | `skills/session-start/` | Session #26 | Cross-tool session-start. Companion Capabilities #21; profile auto-load pre-step #22. **Progress ledger added #26.** |
| Session-End Skill | `skills/session-end/` | Session #26 | Cross-tool session-end. Companion Capabilities + size-check strengthening #21; voice-context reload #22. **Progress ledger + receipt checklist + session-close commit convention added #26.** |
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
| Profile Template | `templates/profile.md` | Session #13 | Personal Overture profile — customization layer |
| Hook Templates | `templates/hooks/` | Session #8 | Hook scripts, setup guide, specialization recipes |
| Init Guide (legacy) | `templates/init.md` | Session #2 | Manual init (superseded by plugin/skills) |

---

## SESSION ARCHIVES

| Archive | Sessions | Period |
|---------|----------|--------|
| [`docs/sessions/SESSIONS_17_22_ARCHIVE.md`](docs/sessions/SESSIONS_17_22_ARCHIVE.md) | #17-#22 | Apr 13 – May 22, 2026 |
| [`docs/sessions/SESSIONS_01_16_ARCHIVE.md`](docs/sessions/SESSIONS_01_16_ARCHIVE.md) | #1-#16 | Mar 22 – Apr 13, 2026 |
