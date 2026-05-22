# Origins Narrative Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the current Provenance paragraph in `README.md` with a voice-clean Origins narrative (~370 words) per the approved design spec.

**Architecture:** Three-task pipeline. Task 1 produces the prose against the design spec's architecture and voice constraints. Task 2 integrates the prose into `README.md` in place of the existing `## Provenance` paragraph, preserving the meta-attribution paragraph immediately after. Task 3 commits with a focused message.

**Tech Stack:** Markdown. `grep` for voice verification. `wc -w` for word count. `git` for commit. No code dependencies.

**Source spec:** `docs/superpowers/specs/2026-05-22-origins-narrative-design.md`

---

## File structure

| File | Action | Responsibility |
|------|--------|----------------|
| `README.md` | Modify (lines 188-194 region) | Replace `## Provenance` paragraph with Origins narrative. Preserve meta-attribution paragraph verbatim. |
| `docs/superpowers/plans/2026-05-22-origins-narrative.md` | This file (already committed) | Plan |
| `docs/superpowers/specs/2026-05-22-origins-narrative-design.md` | Read-only | Source of architecture, voice constraints, success criteria |

---

## Task 1: Draft Origins prose against the spec

**Files:**
- Read: `docs/superpowers/specs/2026-05-22-origins-narrative-design.md`
- Read: `/Users/itsmin/.overture/voice.md` (already in session context — re-load only if not present)
- Produce: prose text held inline in the session (no scratch file needed for a single piece)

- [ ] **Step 1: Re-read the spec sections actively used during drafting**

Re-read these spec sections before drafting:
- *Narrative architecture* (the 5-beat structure: opening / verdict-line / three fire-paragraphs / stitch / close)
- *Voice constraints* (the grep-verifiable table)
- *Specificity choices* (products descriptive; Anthropic-shipped at high level; lanes named explicitly; "specialist mode" never appears)
- *Edge cases* (what to do if drafting drifts long, if a lane-fire feels weak, if voice fights clarity)

- [ ] **Step 2: Draft the prose inline, following the 5-beat structure**

Produce one block of prose with these beats in order:
1. Opening (1-2 sentences): 480+ sessions, two production products, descriptive names.
2. Verdict-line (1 sentence): "Most of what survived wasn't designed. It was extracted." (or near-equivalent — this is the only line where the spec quoted a specific phrasing as a target; can adjust if drafting reveals a stronger phrasing.)
3. Choral fire-paragraph (50-80 words): symptom (two products needed to stay in sync without an integration layer) → fire (drift accumulated, decisions got re-litigated) → pattern (human-curated working contract at the project boundary).
4. Voice fire-paragraph (50-80 words): symptom (default AI-prose appearing in shipped editorial work) → fire (recognizable AI-tells in pieces that should sound like the author) → pattern (voice as encoded discipline, derived not declared).
5. Operating-Doc Discipline fire-paragraph (50-80 words): symptom (a CLAUDE.md hit size limits) → fire (lossy compression vs. systemic refactoring) → pattern (size thresholds, section ordering, compression protocol — structured operating documents).
6. Stitch-line (1 sentence): each lane has the same shape — a problem the rest of the ecosystem doesn't try to solve, with a pattern that survived contact with users.
7. Close (1-2 sentences): by mid-2026 Anthropic had shipped first-party plugins for most of the table-stakes; the three lanes Overture occupies are what they didn't.

- [ ] **Step 3: Run voice-check grep commands on the draft**

Save the draft to a temp file for verification:

```bash
cat > /tmp/origins-draft.md <<'EOF'
[draft prose here]
EOF
```

Run each check. Expected results in parens:

```bash
# Em-dashes (expected: 0, max 1 load-bearing)
grep -c '—' /tmp/origins-draft.md

# Smart quotes / curly apostrophes (expected: 0)
grep -oE $'[“”’]' /tmp/origins-draft.md | wc -l

# Banned vocab (expected: 0 hits across the list)
for w in delve leverage foster ignite empower uncover unleash underscore optimize streamline garner bolster showcase exemplify demystify robust seamless scalable comprehensive multifaceted pivotal vibrant meticulous intricate profound enduring transformative revolutionary groundbreaking frictionless intuitive elegant smooth delightful powerful tapestry landscape realm beacon symphony pathway frontier Additionally Furthermore Moreover testament; do
  c=$(grep -cwi "$w" /tmp/origins-draft.md)
  if [ "$c" -gt 0 ]; then echo "  $w: $c"; fi
done

# Copula substitution (expected: 0 hits)
for p in "serves as" "stands as" "represents " "marks " "features " "offers "; do
  c=$(grep -ci "$p" /tmp/origins-draft.md)
  if [ "$c" -gt 0 ]; then echo "  '$p': $c"; fi
done

# Word count (expected: 300-400, target ~370)
wc -w /tmp/origins-draft.md
```

- [ ] **Step 4: Fix any voice-check failures**

If any check returns a hit:
- Em-dash: replace per voice.md rule (comma for aside, period for sharpening, colon for header-payload, parens for receipt).
- Banned vocab: replace with a verb/adjective from voice.md's load-bearing list (or a plain alternative).
- Copula substitution: rewrite with "is" / "are".
- Smart quotes: replace with straight quotes (`"..."` and `'...'`).
- Word count outside 300-400: trim the stitch-line first (edge case from spec); then tighten redundant qualifiers.

Re-run all four checks until all pass. Do not proceed to Task 2 until each check returns zero hits (em-dash ≤ 1 load-bearing) and word count is in range.

- [ ] **Step 5: Structural check against spec architecture**

Read the draft once more end-to-end. Confirm:
- Opening introduces the provenance frame (sessions count + two products).
- Verdict-line lands at sentence 2-3, not sentence 1.
- Three fire-paragraphs appear in the order Choral → Voice → Operating-Doc Discipline (or revise the spec if a different order reads better — note in the commit).
- Each fire-paragraph follows symptom → fire → pattern.
- Stitch-line lifts the three fires into one observation.
- Close lands the ecosystem-evolution payoff without saying "specialist mode."

If a beat is missing or weak, revise inline and re-run the voice-check from Step 3.

- [ ] **Step 6: Save the verified draft for handoff to Task 2**

Keep the final prose accessible in the session for the Edit operation in Task 2. No commit yet — the working artifact at this stage is just the verified prose ready for integration.

---

## Task 2: Integrate prose into README.md

**Files:**
- Modify: `/Users/itsmin/Projects/overture/README.md` (replace the `## Provenance` paragraph; preserve the meta-attribution paragraph below)

- [ ] **Step 1: Read the current Provenance section to capture exact text**

Read `README.md` lines 188-200. Confirm the boundaries:
- The `## Provenance` heading.
- The provenance paragraph (currently: "Built across 480+ sessions on two production products...").
- The meta-attribution paragraph (currently: "This framework — including its documentation — was built collaboratively with Claude Code...").
- The trailing `---` and the closing italic line ("Overture is a working kit...").

The replacement scope is **only the provenance paragraph**. The `## Provenance` heading stays. The meta-attribution paragraph stays. The trailing structure stays.

- [ ] **Step 2: Construct the Edit operation**

Use the `Edit` tool with:
- `old_string`: the current provenance paragraph (`"Built across 480+ sessions on two production products..."` through `"Honest gaps are [documented](Working-With-Claude-Code.md#part-6-honest-gaps)."`)
- `new_string`: the verified Origins prose from Task 1
- The meta-attribution paragraph is NOT in `old_string` and is therefore preserved automatically.

Critical: include enough context in `old_string` to make the match unique. The current provenance paragraph contains "480+ sessions" which appears elsewhere in README (in the "What just happened" tagline). Include surrounding context (the line breaks and structure) to disambiguate.

- [ ] **Step 3: Apply the Edit and verify**

After applying the Edit:

```bash
# Verify meta-attribution paragraph still present (exact substring)
grep -c "built collaboratively with Claude Code" README.md
# Expected: 1
```

```bash
# Verify Origins paragraph is in place — check one distinctive phrase from the new prose
grep -c "wasn't designed" README.md
# Expected: 1 (or whatever distinctive phrase landed in the draft)
```

```bash
# Verify the section structure is intact
grep -n "^## Provenance" README.md
# Expected: 1 line (heading still there)

grep -c "Overture is a working kit" README.md
# Expected: 1 (closing line preserved)
```

If any check returns an unexpected count, the Edit did not land as intended — revert (`git checkout README.md`) and re-attempt with a different `old_string` strategy.

- [ ] **Step 4: Run voice-check on README's Provenance section**

Extract the new section and re-run voice checks to confirm voice-cleanliness survives the integration:

```bash
# Pull just the Provenance section + meta-attribution into a temp file for checking
awk '/^## Provenance/,/^---$/' README.md > /tmp/readme-provenance.md
```

Then re-run the Step 3 (Task 1) grep commands against `/tmp/readme-provenance.md`. Em-dashes should still be 0 (or 1 load-bearing) in the Origins prose region — note that the meta-attribution paragraph contains 1 em-dash ("This framework — including its documentation"), so total em-dash count for the extracted section will be 1. That's preserved-on-purpose; not a violation.

- [ ] **Step 5: Visual diff review**

```bash
git diff README.md
```

Read the full diff. Confirm:
- Only the provenance paragraph block changed.
- Meta-attribution paragraph is untouched.
- No accidental edits elsewhere.

---

## Task 3: Commit

**Files:**
- Stage: `README.md`
- Commit: focused message describing the Origins-prose replacement.

- [ ] **Step 1: Stage README.md**

```bash
git add README.md
```

- [ ] **Step 2: Commit with focused message**

```bash
git commit -m "$(cat <<'EOF'
Session #24 — Origins narrative for README

Replaces the Provenance paragraph with a 300-400 word Origins narrative
per the approved spec (docs/superpowers/specs/2026-05-22-origins-narrative-design.md).
Meta-attribution paragraph preserved verbatim.

Structure: provenance frame → verdict-line ("most of what survived wasn't
designed; it was extracted") → three fire-paragraphs (Choral, Voice,
Operating-Document Discipline, each grounded in the production fire that
created it) → stitch-line → ecosystem-evolution close.

Specialist-mode posture telegraphed without using the term. Reader walks
away knowing the three distinctive lanes and that the kit's provenance
is real production work, not theory.

Voice-clean: 0 em-dashes in the Origins prose (1 in the preserved
meta-attribution paragraph, which is intentional and load-bearing). 0
banned-vocab hits in prose, 0 copula substitution, 0 smart quotes. Word
count in 300-400 budget.

First substantive test of voice.md (refreshed #22) on new public-facing
prose. No voice.md gaps surfaced during drafting (or: gaps noted in
session log if any).

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

- [ ] **Step 3: Verify commit landed**

```bash
git log --oneline -3
# Expected: most recent commit is the Origins narrative replacement
```

- [ ] **Step 4: Mark the implementation done**

Update task tracking. The Origins narrative is live in `README.md`. Subsequent #24+ work (STRATEGY.md Origins placeholder fill, LinkedIn derivation, README hero rewrite) is unblocked and queued for future sessions.

---

## Self-review notes

**Spec coverage check** — every section in the spec maps to a step:
- *Purpose* → covered by Task 3 commit message
- *Scope, register, hosting* → Task 2 Step 1-3
- *Voice constraints* → Task 1 Step 3-4 (grep-verifiable checks) and Task 2 Step 4 (post-integration re-check)
- *Narrative architecture* → Task 1 Step 2 (drafting per 5-beat structure) and Step 5 (structural verification)
- *Specificity choices* → Task 1 Step 1 (reading the spec section actively) — choices are encoded as drafting constraints
- *Success criteria* → distributed across Task 1 (voice-clean), Task 2 (hosting-integrated), Task 3 (commit makes it official)
- *Edge cases* → referenced in Task 1 Step 4 (drafting drift, voice-conflicts-clarity, lane-fire feels weak)
- *Out of scope* → reaffirmed in Task 3 Step 4 (future work queued, not in this plan)

**Placeholder scan**: no TBDs, no "fill in details", no "TODO". The prose itself is the work-output — the plan provides constraints and architecture, not the prose text (which is creative output produced during execution).

**Type consistency**: n/a for prose; lane names (Choral, Voice, Operating-Document Discipline) and product descriptors ("company intelligence platform" / "professional representation service") are consistent with the spec.

---

## Execution handoff

Plan complete and saved to `docs/superpowers/plans/2026-05-22-origins-narrative.md`. Two execution options:

**1. Subagent-driven (recommended for code)** — fresh subagent per task, review between tasks, fast iteration. Heavier than this prose piece warrants; useful when tasks are independent and parallelizable.

**2. Inline execution (recommended for this plan)** — execute tasks in this session using `superpowers:executing-plans`, batch with checkpoints. For a 3-task prose piece with sequential dependencies (draft → integrate → commit), inline execution is the right shape.

**My recommendation**: inline execution. The work is sequential, the artifact is small, and Min is in the loop for voice judgment calls that need a human eye.
