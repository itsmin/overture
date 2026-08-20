# Handoff Durability (Structural) + 1.2.0 Release — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the rotating/durable field distinction structural (declared in the operating-document layout, synced across skills and templates), remediate Overture's own CLAUDE.md, and ship plugin 1.2.0.

**Architecture:** Pure documentation/methodology changes across the plugin's skills, templates, and pattern docs, plus this repo's own operating document. No code. Verification is grep parity checks between skill/template pairs, a content-parity checklist for the moved design doc, `claude plugin validate`, and a privacy audit before the push (the repo is PUBLIC).

**Tech Stack:** Markdown, `claude plugin validate`, git tags.

**Spec:** `docs/superpowers/specs/2026-08-19-handoff-durability-structural-design.md`

## Global Constraints

- The repo is PUBLIC: no absolute machine paths (`/Users/...`), no emails, no CaliKo operational detail in anything committed. Project names as provenance (absOrbs #26) are fine and established.
- Voice rules apply to all prose (`~/.overture/voice.md`): no em-dashes except load-bearing, no banned vocabulary, sentence-case headings in new pattern prose (operating-doc ALL-CAPS section labels are exempt).
- Field lifetime language must be IDENTICAL in meaning across: pattern doc, session-end skill, session-start skill, both CC templates, both skeletons. The two class names are exactly **Rotating** and **Durable**; the criterion is edit semantics ("rewritten wholesale" vs "edited item-wise; items leave only by explicit disposition").
- UPCOMING SESSIONS is Durable everywhere. No file may still classify it as rotating when this plan completes.
- This session is **Session #28**; the Autonomous Execution build is renumbered **#29** everywhere it is referenced as future work.

---

### Task 1: Revise `patterns/Handoff-Durability.md`

**Files:**
- Modify: `patterns/Handoff-Durability.md`

The behavioral patch (`b3fd07e`) classified fields by lifetime and put UPCOMING SESSIONS in the rotating bucket. That is wrong in practice (entries persist for months, curated item-wise) and the criterion doesn't hold. Revise in public: name the old framing, replace it.

- [ ] **Step 1: Replace "The distinction" section**

Replace the existing two-column table and its surrounding paragraphs (from `## The distinction` up to but not including `## The rule`) with:

```markdown
## The distinction

Every handoff document has two kinds of field, distinguished by **how they are
edited**, not by what they contain:

| | Members | Edit semantics |
|---|---|---|
| **Rotating** | NEXT / next-up, Current status, "this session" lines | Rewritten wholesale every cycle, by design |
| **Durable** | UPCOMING SESSIONS, Deferred Work, Parking Lot, Reserved Sessions, Critical Reminders, Pending Verifications | Edited item-wise; an item leaves only by explicit disposition (moved to COMPLETE, DEFERRED, PARKING LOT, an archive, or a doc), never by silent omission |

Rotating fields are not a weaker version of durable ones. They are a different
thing: their *purpose* is to be replaced. Writing something into a rotating
field is a statement that it stops mattering after one cycle.

*Revised 2026-08-19: the first version of this pattern (same-day) classified
UPCOMING SESSIONS as rotating. In observed practice its entries survive months
of session-ends and are curated item-wise, so lifetime was the wrong criterion.
Edit semantics is the one a session-end can actually verify: a field either
gets rewritten wholesale or it doesn't.*
```

- [ ] **Step 2: Extend "The rule" section**

After the existing rule paragraph ("**Anything that must survive more than one cycle goes in a durable structure. The rotating field may only point AT it.**" and the absOrbs-fix paragraph), append:

```markdown
Two further rules ride on the model:

**The doc rule.** A queued entry whose context exceeds roughly a paragraph gets
a real file (plan, spec, or context doc); the entry carries a pointer plus a
one-line summary. Context documents for future sessions always qualify.

**The citation rule.** Before trimming or archiving anything on the strength of
a citation ("detail in ARCHIVE.md"), verify the target actually holds the
content. A citation is not a backup; trimming against a dangling citation
destroys the only record.
```

- [ ] **Step 3: Trim the "Related" section**

The citation near-miss is now a rule, not a footnote. In `## Related`, delete the sentence "**A citation is not a backup.** Verify the target exists before relying on it, and certainly before deleting anything on the strength of it." (it moved into The rule) and keep the rest of the section (the near-miss narrative, the absOrbs #25 reference, the closing "Both failures share a shape" line) intact.

- [ ] **Step 4: Verify**

Run: `grep -c 'UPCOMING' patterns/Handoff-Durability.md && grep -n 'explicit disposition' patterns/Handoff-Durability.md`
Expected: UPCOMING appears only in the Durable column and the revision note; at least one `explicit disposition` hit. Read the full file once for voice (no em-dashes beyond any already-load-bearing one, no banned vocabulary).

- [ ] **Step 5: Commit**

```bash
git add patterns/Handoff-Durability.md
git commit -m "Handoff-Durability revised: edit semantics, not lifetime; UPCOMING is durable

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 2: Revise session-end skill

**Files:**
- Modify: `skills/session-end/SKILL.md` (step 7b, step 9's UPCOMING bullet, the size-check step, the final checklist)

- [ ] **Step 1: Replace the body of `### 7b. Handoff Durability Check`**

Keep the heading. Replace everything from "**Before writing anything to NEXT" through "Full pattern: `patterns/Handoff-Durability.md`." with:

```markdown
**Before writing anything to NEXT or UPCOMING SESSIONS**, ask what in this
session's outcome has to outlive the next cycle.

Every handoff field is one of two kinds, distinguished by how it is edited:

| Rotating (rewritten wholesale every cycle) | Durable (edited item-wise; items leave only by explicit disposition) |
|---|---|
| NEXT, Current status, "this session" lines | UPCOMING SESSIONS, Deferred Work, Parking Lot, Reserved Sessions, Critical Reminders, Pending Verifications |

**Rotating fields hold pointers and single-cycle information only.** Anything
that must survive more than one cycle goes in a durable structure; the rotating
field may only POINT at it. Reserved future sessions, multi-session plans, and
context documents for later work all qualify. Step 9 rewrites NEXT, so anything
parked there is destroyed by this ritual, and it fails silently: nothing errors,
the note is simply gone, and the record of what was lost was the thing that was
lost.

**Durable fields drop items only by explicit disposition.** An entry leaves
UPCOMING SESSIONS (or any durable field) by moving somewhere named: COMPLETE,
DEFERRED WORK, PARKING LOT, an archive, or a doc. Never by silent omission
during a rewrite.

**The doc rule**: a queued entry whose context exceeds roughly a paragraph gets
a real file (plan, spec, or context doc); the entry carries the pointer plus a
one-line summary.

Note the trap: the rotating field is the most PROMINENT one — session-start
reads and displays it first — so it feels like the safest place for something
important. It is the least safe. The operating-document layout now carries this
annotation; keep it intact when editing.

Full pattern: `patterns/Handoff-Durability.md`.
```

(The em-dash in the trap paragraph is retained from `b3fd07e`; it is the document's load-bearing one.)

- [ ] **Step 2: Amend step 9's UPCOMING SESSIONS bullet**

In the "Update CLAUDE.md / Work Queue" step, find the **UPCOMING SESSIONS** bullet ("Write the full prioritized plan from Step 8...") and append to it:

```markdown
UPCOMING is DURABLE: reconcile it item-wise. Every entry present before this
session must either survive, or leave by explicit disposition (COMPLETE,
DEFERRED WORK, PARKING LOT, archive, or doc) named in this session's close.
```

- [ ] **Step 3: Add the citation rule to the size-check step**

In the size-check step, after the archiving numbered list (ends "Verify size after pruning"), add:

```markdown
**Citation rule**: before trimming any entry on the strength of a citation
("detail in ARCHIVE.md"), verify the target actually holds the content. A
citation is not a backup; trimming against a dangling citation destroys the
only record. See `patterns/Handoff-Durability.md`.
```

- [ ] **Step 4: Update the final-checklist line**

Replace the checklist line `- [ ] Anything that must outlive ONE cycle is in a durable structure, not only in NEXT/UPCOMING (see 7b)` with:

```markdown
- [ ] Anything that must outlive ONE cycle is in a durable structure, NEXT holds only pointers (see 7b)
- [ ] UPCOMING reconciled item-wise; departures have explicit dispositions (see 7b)
- [ ] Archive targets verified before any citation-based trim (citation rule)
```

- [ ] **Step 5: Verify and commit**

Run: `grep -n 'explicit disposition\|doc rule\|Citation rule' skills/session-end/SKILL.md`
Expected: hits in 7b, step 9, and the size-check step.

```bash
git add skills/session-end/SKILL.md
git commit -m "session-end: UPCOMING durable + explicit disposition + doc rule + citation rule

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 3: Revise session-start skill

**Files:**
- Modify: `skills/session-start/SKILL.md` (handoff quality check's durability bullet)

- [ ] **Step 1: Replace the durability bullet**

Replace the existing `- **Durability check**: ...` bullet (added in `b3fd07e`, currently says "NEXT and UPCOMING SESSIONS are rewritten every session-end") with:

```markdown
- **Durability check**: NEXT and Current are rewritten every session-end
  (UPCOMING SESSIONS is durable: curated item-wise, entries leave only by
  explicit disposition). If NEXT references work more than one session out,
  a durable structure (Reserved Sessions, UPCOMING SESSIONS, Deferred Work)
  must hold the substance; flag it if the pointer is the only copy. Surface
  the durable structures alongside the pointer rather than reading the pointer
  alone. See `patterns/Handoff-Durability.md`.
```

- [ ] **Step 2: Verify and commit**

Run: `grep -n 'UPCOMING' skills/session-start/SKILL.md`
Expected: no line still claims UPCOMING is rewritten/rotating.

```bash
git add skills/session-start/SKILL.md
git commit -m "session-start: durability check matches the durable-UPCOMING classification

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 4: Sync the CC template pair

**Files:**
- Modify: `templates/session-end.md`, `templates/session-start.md`

These carry NONE of the durability work, and `templates/session-start.md` also never received the 2026-08-10 date/time pre-step. Close both sync gaps.

- [ ] **Step 1: templates/session-end.md — insert step 7b**

Between `### 7. Deferred Work Check` and `### 8. Next Session Planning`, insert the full `### 7b. Handoff Durability Check` section exactly as written in Task 2 Step 1 (heading included).

- [ ] **Step 2: templates/session-end.md — step 9 UPCOMING bullet**

In `#### Work Queue`, append to the **UPCOMING SESSIONS** bullet the same three-line "UPCOMING is DURABLE..." text from Task 2 Step 2.

- [ ] **Step 3: templates/session-end.md — citation rule in Size Check**

In `#### Size Check`, after "4. Verify size after pruning", insert the same **Citation rule** paragraph from Task 2 Step 3.

- [ ] **Step 4: templates/session-end.md — checklist lines**

In the `Work Tracking:` block of the final checklist, after the line `- [✓/✗] Session Progress NEXT pointer is specific`, insert:

```markdown
- [✓/✗] Anything that must outlive ONE cycle is in a durable structure, NEXT holds only pointers (see 7b)
- [✓/✗] UPCOMING reconciled item-wise; departures have explicit dispositions (see 7b)
- [✓/✗/N/A] Archive targets verified before any citation-based trim (citation rule)
```

- [ ] **Step 5: templates/session-start.md — date/time pre-step**

After the `## Instructions` intro paragraphs (after the "Steps 0-2 are project-specific..." line), insert the date pre-step, mirroring the skill:

```markdown
### Pre-Step: Current date/time (always)

Run `date` and take the result as authoritative for the whole session.

Do this every time, before anything else. Three failure modes it prevents:
a stale sense of "today" inherited from context or training; sessions that
cross midnight and date their own commits wrong; and relative dates written
into durable docs that outlive the session. Carry the real date into every
dated artifact this session produces.
```

- [ ] **Step 6: templates/session-start.md — durability bullet**

In the **Handoff quality check** block, after the "If the handoff is vague or missing, flag it..." bullet, insert the same durability bullet from Task 3 Step 1.

- [ ] **Step 7: Verify pair parity and commit**

Run: `for f in skills/session-end/SKILL.md templates/session-end.md skills/session-start/SKILL.md templates/session-start.md; do echo "$f: $(grep -c 'explicit disposition' $f)"; done`
Expected: nonzero for all four.

```bash
git add templates/session-end.md templates/session-start.md
git commit -m "Templates synced with skills: durability (7b, dispositions, citation rule) + Aug 10 date pre-step

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 5: Field lifetime annotations + RESERVED SESSIONS in both skeletons

**Files:**
- Modify: `templates/CLAUDE.md`, `skills/overture-init/references/operating-document-template.md`

- [ ] **Step 1: Annotation under SESSION PROGRESS (both files)**

Immediately after the `## SESSION PROGRESS` heading, before the `**Current**:` line, insert:

```markdown
*Rotating fields: Current, Status, and NEXT are rewritten at every session-end.
Anything that must survive more than one cycle lives in a durable structure
(UPCOMING SESSIONS, RESERVED SESSIONS, DEFERRED WORK), pointed at from here.*
```

- [ ] **Step 2: Annotation under WORK QUEUE (both files)**

Immediately after the `## WORK QUEUE` heading, insert:

```markdown
*Durable sections: entries are curated item-wise and leave only by explicit
disposition (moved to COMPLETE, DEFERRED WORK, PARKING LOT, an archive, or a
doc), never by silent omission at session-end.*
```

- [ ] **Step 3: RESERVED SESSIONS optional section (both files)**

In `templates/CLAUDE.md`, add to the commented optional-sections block (after the CRITICAL REMINDERS comment block):

```markdown
<!-- RESERVED SESSIONS
Add under WORK QUEUE when a future session beyond the next one is reserved with
written context. This block is DURABLE — the NEXT pointer is rewritten every
session-end, so pointers to future sessions live here, not there. Context docs
get full paths from the repo root.

### RESERVED SESSIONS

| # | Session | Why | Context |
|---|---------|-----|---------|
| #NN | [name] | [one-line reasoning with the load-bearing numbers] | [full path to context doc] |
-->
```

In `operating-document-template.md`, add the same section (as `## RESERVED SESSIONS` with the same table and note) to its trailing `<!-- Optional sections -->` block, matching that file's terser comment style.

- [ ] **Step 4: Verify and commit**

Run: `grep -c 'RESERVED SESSIONS' templates/CLAUDE.md skills/overture-init/references/operating-document-template.md`
Expected: ≥2 in each (annotation mention + section).

```bash
git add templates/CLAUDE.md skills/overture-init/references/operating-document-template.md
git commit -m "Operating-doc skeletons: field lifetime annotations + RESERVED SESSIONS section

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 6: Update the personal profile (outside the repo, no commit)

**Files:**
- Modify: `~/.overture/profile.md` (Project Defaults section)

- [ ] **Step 1: Add two Project Defaults bullets**

After the bullet "Always include the COMPLETE (Recent) table in the work queue", insert:

```markdown
- Always include the field lifetime annotations (Session Progress rotating note + Work Queue durable note) — the layout must say which fields rotate
- RESERVED SESSIONS as a commented-out optional section — activated when a session beyond the next one is reserved with written context
```

- [ ] **Step 2: Verify**

Run: `grep -c 'RESERVED SESSIONS\|lifetime' ~/.overture/profile.md`
Expected: ≥2. No commit; the file lives outside the repo.

---

### Task 7: Move the Autonomous Execution design to a context doc; renumber to #29

**Files:**
- Create: `docs/plans/2026-08-19-autonomous-execution-context.md`
- Modify: `CLAUDE.md` (UPCOMING SESSIONS #1, Session Progress NEXT, "Continuing / Open Threads" heading)

- [ ] **Step 1: Write the context doc**

Create `docs/plans/2026-08-19-autonomous-execution-context.md`. Transplant the ENTIRE current UPCOMING SESSIONS entry #1 ("Session #28: Autonomous Execution Mode...") from `CLAUDE.md`, restructured as a standalone doc with these headings: title (`# Autonomous Execution Mode — session context`), a header block (Reserved: Session #29 · Written: #27 interlude, 2026-06-14; moved to a durable doc at #28, 2026-08-19 · Start with: `superpowers:brainstorming`), then the design under `## Core design finding`, `## Build scope`, `## Verdict`, `## Live inconsistency to resolve`, `## Sources and case studies`. Expand telegraphic fragments into full sentences where the entry compressed them; delete nothing.

- [ ] **Step 2: Content-parity check (citation rule, applied to ourselves first)**

Before touching CLAUDE.md, verify every one of these elements from the UPCOMING #1 entry appears in the new doc:
1. Two layers: policy (own spec→plan→implement→verify; merge-to-main + public-deploy stay gated) and mechanism (suppress permission-prompt friction)
2. Fortomino's mechanism is broken: bare tool-level `Bash` in allow + empty deny makes the two hard gates behavioral-only
3. Better implementation: broad `Bash` for flow + mechanical gating via `deny`>`ask`>`allow` precedence
4. PreToolUse hook as hard backstop; static patterns are form-leaky (`git -C x push`, `cd x && push` evade them); only a hook reading the resolved command guarantees the block
5. Principle: enforcement scales with blast radius (solo game = behavioral + static ask; PII/public product = hook-enforced)
6. Build scope, all five components: pattern doc; Settings-Hygiene reconciliation; operating-doc template block; `/overture:autonomous-on|-off` command/skill; PreToolUse hook template
7. Verdict: opt-in, NOT default, and why (conflicts with partnership/ask/privacy defaults; safe only where worst-case is cheap)
8. Live inconsistency: `~/.overture/profile.md` line 53 (2026-06-14) vs `Settings-Hygiene.md` lines 83-86; component (2) reconciles them
9. Sources: Fortomino `CLAUDE.md` §5, memory `feedback_autonomous_execution`, its `settings.local.json` (287-line allowlist, ~280 lines dead under bare Bash)
10. Jul 6 addendum: Overture's own settings cleanup (76 → 31 entries; home-directory-wide Read grant) as the second live case study, same failure class
11. session-end command/skill scopes Bash back at session-end; the manual process already failed twice in Fortomino
12. Settings-Hygiene "dangerous-by-absence" model voided by bare Bash (lines 83-86), so explicit gates are mandatory
13. The queued instruction to START with `superpowers:brainstorming`

Any element missing: fix the doc. Only then proceed.

- [ ] **Step 3: Trim UPCOMING #1 and renumber**

Replace the entire UPCOMING SESSIONS entry 1 in `CLAUDE.md` with:

```markdown
1. **Session #29: Autonomous Execution Mode — full command/skill/hook build** *(queued by the #27 interlude; renumbered from #28 when #28 became the handoff-durability build; START with `superpowers:brainstorming`)* — Capture Fortomino's autonomous build-to-playtest posture as a reusable pattern with tooling. Full design (two-layer finding, 5-component build scope, opt-in verdict, the live profile/Settings-Hygiene inconsistency, both settings case studies): `docs/plans/2026-08-19-autonomous-execution-context.md`.
```

In Session Progress, update the NEXT line's tail from "Then Session #28 — Autonomous Execution Mode (full build; START with `superpowers:brainstorming`; design intact in UPCOMING #1)" to "Then Session #29 — Autonomous Execution Mode (full build; context: `docs/plans/2026-08-19-autonomous-execution-context.md`)". Rename the heading "### Continuing / Open Threads (for Session #28)" to "(for Session #29)".

- [ ] **Step 4: Verify and commit**

Run: `grep -n 'Session #28' CLAUDE.md`
Expected: remaining #28 references (if any) describe THIS session or history, not the Autonomous Execution build as future work.

```bash
git add docs/plans/2026-08-19-autonomous-execution-context.md CLAUDE.md
git commit -m "Autonomous Execution design moved to a durable context doc; build renumbered #29

The doc rule applied to our own queue: UPCOMING #1 held ~2.5k chars of
design that was one careless session-end from deletion. Parity verified
element-by-element before the trim (citation rule).

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 8: Overture's own CLAUDE.md — annotations, kit table, sittings record

**Files:**
- Modify: `CLAUDE.md`

- [ ] **Step 1: Insert the two lifetime annotations**

Same two annotation blocks as Task 5 Steps 1-2, in this repo's `CLAUDE.md`: one after `## SESSION PROGRESS`, one after `## WORK QUEUE`.

- [ ] **Step 2: Kit table + DOCUMENTATION REFERENCE rows**

In the Methodology kit table, after the Privacy-Boundary row, add:

```markdown
| `patterns/Handoff-Durability.md` | Field lifetime model: rotating vs durable fields, doc rule, citation rule | You | **v1.1** — Session #28 (v1 Aug 18 sitting; edit-semantics revision #28) |
```

In DOCUMENTATION REFERENCE, after the Privacy Boundary row, add the matching row. Update the session-start/session-end skill rows in both tables: **v1.5 — Session #28** with note "Date/time pre-step (Aug 10); durability check + durable-UPCOMING (Aug 18 + #28)" / "Durability step 7b + explicit dispositions + citation rule (#28)". Update template rows: session-start template **v4 — Session #28** (date pre-step + durability synced), session-end template **v5 — Session #28** (7b + dispositions + citation rule).

- [ ] **Step 3: Record the untracked August sittings**

In Session Progress, after the "July 6, 2026 Hygiene Sitting" entry, add:

```markdown
### August sittings (untracked; reconciled at #28)

**Aug 10**: session-start gained the mandatory date/time pre-step (`ddb2db7`),
hand-mirrored into the plugin cache pending a release. **Aug 18**: absOrbs #26
surfaced the handoff-durability defect; the behavioral patch landed (`b3fd07e`:
pattern doc + session-end 7b + session-start check), unmirrored. Both sat
unpushed until #28 session-start (privacy-audited, then pushed); 1.2.0
supersedes the hand-mirroring.
```

- [ ] **Step 4: Size check**

Run: `wc -c CLAUDE.md`
Expected: LOWER than 29,858 (the Task 7 trim outweighs these additions) and GREEN (<30k). If ≥30k, trim the #23 session entry into the existing archive per the size protocol, applying the citation rule (verify the archive holds the content first).

- [ ] **Step 5: Commit**

```bash
git add CLAUDE.md
git commit -m "CLAUDE.md: lifetime annotations, kit rows for Handoff-Durability + v1.5 skills, August sittings recorded

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 9: Release 1.2.0

**Files:**
- Modify: `CHANGELOG.md`, `.claude-plugin/plugin.json`

- [ ] **Step 1: CHANGELOG — convert [Unreleased] to [1.2.0]**

Replace the `## [Unreleased]` heading and rewrite the entry so the final text is:

```markdown
## [1.2.0] - 2026-08-19

Handoff durability, behavioral and structural. Driven by a defect absOrbs #26
exposed in this framework: multi-session context parked in a rotating field is
destroyed, silently, by the ritual that exists to preserve continuity.

### Added
- **Session-start pre-step: read the real date/time first** (2026-08-10). A
  stale sense of "today", midnight-crossing sessions, and relative dates in
  durable docs all inherit a guessed date otherwise.
- **Handoff durability check** in session-end (step 7b) and session-start
  (handoff quality check). Rotating fields (NEXT, Current) hold pointers and
  single-cycle information only; durable structures hold anything that must
  outlive one cycle. Pattern: `patterns/Handoff-Durability.md`.
- **Citation rule** in session-end's size/archive step: verify an archive
  target actually holds the content before trimming on the strength of the
  citation.
- **Operating-doc skeletons**: field lifetime annotations in the layout plus a
  RESERVED SESSIONS optional section (CC template and the tool-agnostic
  operating-document template).
- **Templates synced with skills** (session-start and session-end pairs),
  including the date/time pre-step the templates had missed.

### Changed
- **UPCOMING SESSIONS reclassified as durable.** The classification criterion
  is edit semantics: rotating fields are rewritten wholesale each cycle;
  durable fields are edited item-wise and entries leave only by explicit
  disposition (COMPLETE, DEFERRED, PARKING LOT, archive, or doc). Session-end
  now reconciles UPCOMING item-wise instead of rewriting it.
```

- [ ] **Step 2: Bump plugin.json**

In `.claude-plugin/plugin.json`, change `"version": "1.1.0"` to `"version": "1.2.0"`.

- [ ] **Step 3: Validate**

Run: `claude plugin validate .`
Expected: clean (matches the Jul 6 precedent). Fix any finding before proceeding.

- [ ] **Step 4: Privacy audit of everything unpushed**

Run: `git diff origin/main..HEAD | grep -nEi '/Users/|@gmail|@caliko|api[_-]?key|secret|token' `
Expected: no hits other than known-benign (e.g., `TELEMETRY_READ_TOKEN` would be a miss — but nothing from absOrbs internals should be in this diff at all). Any hit: fix before pushing.

- [ ] **Step 5: Commit, tag, push, verify**

```bash
git add CHANGELOG.md .claude-plugin/plugin.json
git commit -m "Plugin 1.2.0 — handoff durability (behavioral + structural), date pre-step, durable UPCOMING

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
git tag v1.2.0
git push origin main v1.2.0
git ls-remote --tags origin | grep v1.2.0
```

Expected: tag visible on the remote. Siblings pick the release up via `/plugin update`; no hand-mirroring into the plugin cache.

---

## Not in this plan

- The mechanical hook backstop (session-end diff of rotating fields): deferred to Session #29 (Autonomous Execution), where hook infrastructure is in scope.
- Marketplace talk-through: unchanged as queued NEXT.
- absOrbs changes: its RESERVED SESSIONS block already conforms.
- Session #28's own close-out (session entry, NEXT rewrite, queue reconciliation): that is `/session-end`'s job, run normally after this plan completes.
