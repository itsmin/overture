# STRATEGY.md Purpose + What Overture Is, and Isn't Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the two placeholder blocks in `STRATEGY.md` (`## Purpose` and `## What Overture Is, and Isn't`) with voiced prose per the approved design spec.

**Architecture:** Three-task pipeline. Task 1 produces the prose for both sections against the spec's architecture and voice constraints, with grep verification inline. Task 2 integrates both pieces into `STRATEGY.md` in place of the existing placeholder blocks and refreshes the top-of-doc status note. Task 3 commits with a focused message.

**Tech Stack:** Markdown (`STRATEGY.md`). `grep` for voice verification. `wc -w` for word count. `git` for commit. No code dependencies.

**Source spec:** `docs/superpowers/specs/2026-05-22-strategy-purpose-and-identity.md`

---

## File structure

| File | Action | Responsibility |
|------|--------|----------------|
| `STRATEGY.md` | Modify (lines 3, 7-11, 118-120 region) | Replace Purpose placeholder block; replace Is/Isn't placeholder block; refresh top-of-doc status note. All other sections preserved verbatim. |
| `docs/superpowers/plans/2026-05-22-strategy-purpose-and-identity.md` | This file | Plan |
| `docs/superpowers/specs/2026-05-22-strategy-purpose-and-identity.md` | Read-only | Source of architecture, voice constraints, success criteria |

---

## Task 1: Draft Purpose + Is/Isn't prose against the spec

**Files:**
- Read: `docs/superpowers/specs/2026-05-22-strategy-purpose-and-identity.md`
- Read: `~/.overture/voice.md` ("What's Distinctly Min's" + "AI Tells to Avoid" sections — already in session context; re-load only if not present)
- Read: `STRATEGY.md` (current placeholder blocks + Origins + Distinctive Lanes for non-redundancy check)
- Produce: prose text for both sections held inline in the session

- [ ] **Step 1: Re-read the spec sections actively used during drafting**

Re-read these spec sections before drafting:
- *Section: Purpose* (one paragraph, ~60 words, verdict-first definition + role)
- *Section: What Overture Is, and Isn't* (two paragraphs, ~130 words, Is + Isn't shape, specialist-mode at close)
- *Cross-section discipline* ("delete one — does the other still work?" test; "human-discipline layer" as the through-line)
- *Voice constraints* (the grep-verifiable table)
- *Drafting approach* (positive-patterns-first per #24 finding; read voice.md's "What's Distinctly Min's" before drafting)
- *Specificity choices* (compose-with at category level; declined claims by category; "specialist mode" once at close of Is/Isn't only)
- *Edge cases* (length drift, specialist-mode landing clunky, voice-fights-clarity)

- [ ] **Step 2: Read voice.md "What's Distinctly Min's" section actively**

Per the #24 drafting finding: writing toward positive patterns is the harder discipline. Before drafting, internalize:
- Verdict-first openings ("Overture is...", not "Overture aims to...")
- Soften-then-assert closers (descriptive setup, then a short reframing line)
- Header-payload colons (`: ` for setup → payoff)
- Compound-noun + parenthetical-unpacking (define proprietary vocabulary in-line)
- Binary naming for hard decisions ("is" / "isn't" as semantic anchors)

- [ ] **Step 3: Draft the Purpose paragraph**

Architecture from spec:
- Sentence 1: verdict-first definition. What Overture is.
- Sentence 2 (and optionally 3): expansion. Role / what it gives / what it composes with.
- ~50-70 words, target ~60.
- No lane enumeration. No specialist mode. No competitor names.

Hold "human-discipline layer" as the connecting phrase to Is/Isn't and Origins.

- [ ] **Step 4: Draft paragraph 1 of Is/Isn't ("Is")**

Architecture from spec:
- Sentence A: role naming (human-discipline layer for AI-assisted development).
- Sentence B: composition (first-party Anthropic plugins, community skills).
- Sentence C (optional): affirm the 3 lanes at high level — cross-project coordination, voice as design material, operating-document discipline. **Match Distinctive Lanes' 3-lane shape, not 4 items.** Don't enumerate sub-patterns; that's Distinctive Lanes' job.

- [ ] **Step 5: Draft paragraph 2 of Is/Isn't ("Isn't")**

Architecture from spec:
- Sentence A: name declined claims at category level — agent-orchestration / swarm coordination, exhaustive skill library, aggressive growth posture.
- Sentence B: setup for the specialist-mode landing.
- Sentence C: specialist-mode landing as soften-then-assert closer. **"Specialist mode" appears exactly once across both sections. Right here.**

Total Is/Isn't word count: ~110-150, target ~130.

- [ ] **Step 6: Run voice-check grep commands on both drafts**

Save the combined draft to a temp file for verification:

```bash
cat > /tmp/strategy-draft.md <<'EOF'
## Purpose

[drafted Purpose paragraph]

## What Overture Is, and Isn't

[drafted Is paragraph]

[drafted Isn't paragraph]
EOF
```

Run each check. Expected results in parens:

```bash
# Em-dashes across both sections (expected: 0 or 1 load-bearing only)
grep -c '—' /tmp/strategy-draft.md

# Smart quotes / curly apostrophes (expected: 0)
grep -oE $'[‘’“”]' /tmp/strategy-draft.md | wc -l

# Banned vocab (expected: 0 hits across the list)
for w in delve leverage foster ignite empower uncover unleash underscore optimize streamline garner bolster showcase exemplify demystify robust seamless scalable comprehensive multifaceted pivotal vibrant meticulous intricate profound enduring transformative revolutionary groundbreaking frictionless intuitive elegant smooth delightful powerful tapestry landscape realm beacon symphony pathway frontier Additionally Furthermore Moreover testament; do
  c=$(grep -cwi "$w" /tmp/strategy-draft.md)
  if [ "$c" -gt 0 ]; then echo "  $w: $c"; fi
done

# Copula substitution (expected: 0 hits)
for p in "serves as" "stands as" "represents " "marks " "features " "offers "; do
  c=$(grep -ci "$p" /tmp/strategy-draft.md)
  if [ "$c" -gt 0 ]; then echo "  '$p': $c"; fi
done

# "Specialist mode" appears exactly once (expected: 1)
grep -ci 'specialist mode' /tmp/strategy-draft.md

# Word count — Purpose section only (expected: 50-70)
awk '/^## Purpose$/,/^## What Overture/' /tmp/strategy-draft.md | sed '/^##/d;/^$/d' | wc -w

# Word count — Is/Isn't section only (expected: 110-150)
awk '/^## What Overture/,EOF' /tmp/strategy-draft.md | sed '/^##/d;/^$/d' | wc -w
```

- [ ] **Step 7: Fix any voice-check failures**

If any check returns a hit:
- Em-dash: replace per voice.md rule (comma for aside, period for sharpening, colon for header-payload, parens for receipts). One load-bearing em-dash is allowed across both sections, not per section.
- Banned vocab: replace with a verb/adjective from voice.md's load-bearing list (or a plain alternative).
- Copula substitution: rewrite with "is" / "are".
- Smart quotes: replace with straight quotes.
- Word count outside range: Purpose drifts long → cut the second expansion sentence; Is/Isn't drifts long → cut from the Is paragraph first; both drift long → cut Purpose first per the edge-cases rule.
- "Specialist mode" count != 1: rewrite the close of Is/Isn't.

Re-run all checks until each passes. Do not proceed to Task 2 until clean.

- [ ] **Step 8: Structural check against spec architecture**

Read both drafts once more end-to-end. Confirm:
- Purpose opens with verdict-first definition ("Overture is...").
- Is paragraph names role + composition + 3 lanes at high level (matching Distinctive Lanes' 3-lane shape, not 4 items).
- Isn't paragraph names declined claims at category level (not by competitor name).
- Isn't paragraph closes with specialist mode as soften-then-assert.
- "Specialist mode" appears once total. Right at the close of Is/Isn't.
- Both sections pass the "delete one — does the other still work?" test in both directions.
- Neither section restates Origins (which narrates *how* the kit got here; these position it *now*).

If a beat is missing or weak, revise inline and re-run voice-check from Step 6.

- [ ] **Step 9: Save the verified drafts for handoff to Task 2**

Keep the final prose accessible in the session for the Edit operations in Task 2. No commit yet — the working artifact at this stage is verified prose ready for integration.

---

## Task 2: Integrate prose into STRATEGY.md + refresh status note

**Files:**
- Modify: `STRATEGY.md` (replace Purpose placeholder block; replace Is/Isn't placeholder block; refresh top-of-doc status note)

- [ ] **Step 1: Read STRATEGY.md to capture exact placeholder text**

Read the relevant lines of `STRATEGY.md`:
- Line 3: top-of-doc status note (`> **Status**: Structural skeleton (Session #21)...`)
- Lines 7-11: `## Purpose` heading + current placeholder paragraph + `_(prose: Session #22)_` marker
- Lines 118-120: `## What Overture Is, and Isn't` heading + provisional framing placeholder marker

Confirm there are no additional `_(prose: ...)_` markers elsewhere — these should be the only two.

```bash
grep -n '_(prose:' STRATEGY.md
# Expected: 2 lines — one in Purpose, one in Is/Isn't
```

- [ ] **Step 2: Replace the Purpose section content**

Use the `Edit` tool with:
- `old_string`: the current Purpose block — from `## Purpose` through the `_(prose: Session #22)_` marker line, inclusive of the trailing blank line and the `---` separator if Edit's match-uniqueness requires it. Include enough context (heading + paragraph + marker) for uniqueness.
- `new_string`:
  ```
  ## Purpose

  [verified Purpose paragraph from Task 1]
  ```

The `_(prose: Session #22)_` marker is removed. The `---` separator that follows the section is preserved.

- [ ] **Step 3: Replace the Is/Isn't section content**

Use the `Edit` tool with:
- `old_string`: the current Is/Isn't block — from `## What Overture Is, and Isn't` through the closing `)_` of the provisional framing marker, inclusive.
- `new_string`:
  ```
  ## What Overture Is, and Isn't

  [verified Is paragraph from Task 1]

  [verified Isn't paragraph from Task 1]
  ```

The provisional framing block is removed entirely. The `---` separator that follows the section is preserved.

- [ ] **Step 4: Refresh the top-of-doc status note**

Use the `Edit` tool with:
- `old_string`: `> **Status**: Structural skeleton (Session #21). Origins prose shipped Session #24. Purpose and "What Overture Is, and Isn't" remain placeholders, deferred to future Phase 2 work.`
- `new_string`: `> **Status**: Structural skeleton (Session #21). Origins prose shipped Session #24. Purpose and "What Overture Is, and Isn't" voiced Session #25. All prose placeholders cleared.`

- [ ] **Step 5: Verify edits applied correctly**

```bash
# All placeholders gone (expected: no output)
grep -n '_(prose:' STRATEGY.md

# Status note refreshed (expected: 1)
grep -c 'voiced Session #25' STRATEGY.md

# Purpose section still present (expected: 1)
grep -c '^## Purpose$' STRATEGY.md

# Is/Isn't section still present (expected: 1)
grep -c '^## What Overture Is, and Isn'"'"'t$' STRATEGY.md

# Origins section preserved (expected: 1, unchanged from Session #24)
grep -c '^## Origins$' STRATEGY.md
```

If any check returns an unexpected count, the Edit did not land as intended — revert (`git checkout STRATEGY.md`) and re-attempt with a different `old_string` strategy.

- [ ] **Step 6: Run voice-check on STRATEGY.md's new sections only**

Extract the two new sections (Purpose + Is/Isn't) for post-integration verification. Use `awk` boundaries scoped to each section:

```bash
# Pull just the Purpose section
awk '/^## Purpose$/,/^---$/' STRATEGY.md | sed '/^---$/d' > /tmp/strategy-purpose.md

# Pull just the Is/Isn't section
awk '/^## What Overture Is, and Isn'"'"'t$/,/^---$/' STRATEGY.md | sed '/^---$/d' > /tmp/strategy-isnot.md

# Combine for cross-section checks
cat /tmp/strategy-purpose.md /tmp/strategy-isnot.md > /tmp/strategy-new.md
```

Re-run the voice-check grep commands from Task 1 Step 6 against `/tmp/strategy-new.md`. All checks should still pass post-integration.

```bash
# Em-dashes (expected: 0 or 1 load-bearing)
grep -c '—' /tmp/strategy-new.md

# Specialist mode appears exactly once across both sections (expected: 1)
grep -ci 'specialist mode' /tmp/strategy-new.md

# Word count, Purpose (expected: 50-70)
sed '/^##/d;/^$/d' /tmp/strategy-purpose.md | wc -w

# Word count, Is/Isn't (expected: 110-150)
sed '/^##/d;/^$/d' /tmp/strategy-isnot.md | wc -w
```

- [ ] **Step 7: Visual diff review**

```bash
git diff STRATEGY.md
```

Read the full diff. Confirm:
- Only the two placeholder blocks + the status note line changed.
- Origins, Distinctive Lanes, Coexisting Lanes, Out of Scope, Scan Discipline, Anti-Atrophy, Marketplace Posture all untouched.
- No accidental edits elsewhere.

- [ ] **Step 8: Clean up temp files**

```bash
rm -f /tmp/strategy-draft.md /tmp/strategy-purpose.md /tmp/strategy-isnot.md /tmp/strategy-new.md
```

---

## Task 3: Commit

**Files:**
- Stage: `STRATEGY.md`
- Commit: focused message describing the two voiced sections + status refresh.

- [ ] **Step 1: Stage STRATEGY.md**

```bash
git add STRATEGY.md
```

- [ ] **Step 2: Verify staged content**

```bash
git diff --cached --stat
# Expected: STRATEGY.md  | <N insertions, M deletions>
```

- [ ] **Step 3: Commit with focused message**

```bash
git commit -m "$(cat <<'EOF'
Session #25 — STRATEGY.md Purpose + What Overture Is, and Isn't voiced

Replaces both remaining placeholder blocks with voiced prose per the
approved spec (docs/superpowers/specs/2026-05-22-strategy-purpose-and-identity.md).
Top-of-doc status note refreshed.

Purpose (~60 words): verdict-first definition + role + composition. No
lane enumeration; no specialist mode (held back for Is/Isn't).

What Overture Is, and Isn't (~130 words, two paragraphs): "Is" paragraph
names the human-discipline-layer role, what it composes with (first-party
Anthropic plugins + community skills), and the 3 lanes at high level
matching Distinctive Lanes' shape. "Isn't" paragraph names declined claims
by category (agent-orchestration, exhaustive skill library, aggressive
growth) and lands specialist mode at the section close as soften-then-assert.

Both sections pass the "delete one — does the other still work?" test;
neither restates Origins. Drafted toward voice.md positive patterns first,
then grep-verified (em-dash budget honored, banned-vocab clean, copula
substitution clean, smart quotes clean, word counts in range).

Second substantive test of voice.md (refreshed #22) on new public-facing
prose, after Origins #24. Drafting findings (if any) noted for the
session-end log.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

- [ ] **Step 4: Verify commit landed**

```bash
git log --oneline -3
# Expected: most recent commit is the STRATEGY.md voiced-sections replacement
```

- [ ] **Step 5: Mark the implementation done**

The Purpose + Is/Isn't sections are live in `STRATEGY.md`. STRATEGY.md has no remaining prose placeholders. Subsequent Phase 2 work (README hero, README voice section with before/after, LinkedIn derivative, wider em-dash purge) is unblocked and queued for future sessions.

---

## Self-review notes

**Spec coverage check** — every section in the spec maps to a step:
- *Purpose* (the spec's purpose, i.e., what this plan is for) → Task 3 commit message
- *Scope, register, hosting* → Task 2 Steps 1-4
- *Section: Purpose architecture* → Task 1 Step 3
- *Section: Is/Isn't architecture* → Task 1 Steps 4-5
- *Cross-section discipline* → Task 1 Step 8 (structural check)
- *Voice constraints* → Task 1 Step 6 (drafting-time check) + Task 2 Step 6 (post-integration check)
- *Drafting approach (positive-patterns-first)* → Task 1 Step 2 (read voice.md actively before drafting)
- *Specificity choices* → Task 1 Steps 3-5 (encoded as drafting constraints per section)
- *Success criteria* → distributed across Task 1 (voice-clean, non-redundant, derivable), Task 2 (hosting-integrated), Task 3 (commit)
- *Edge cases* → referenced in Task 1 Step 7 (length drift, specialist-mode-landing-clunky, voice-fights-clarity)
- *Out of scope* → reaffirmed in Task 3 Step 5 (future work queued, not in this plan)

**Placeholder scan**: no TBDs, no "fill in details", no "TODO". `[drafted Purpose paragraph]` and `[verified ... paragraph from Task 1]` are explicit handoff markers between drafting (Task 1) and integration (Task 2), not unspecified work. The prose is the creative output produced during Task 1 execution; the plan provides constraints and architecture.

**Type consistency**: n/a for prose. Lane naming ("cross-project coordination" / "voice as design material" / "operating-document discipline") matches Distinctive Lanes' 3-lane shape from the spec. Term consistency ("specialist mode", "human-discipline layer") is enforced by the drafting steps.

---

## Execution handoff

Plan complete and saved to `docs/superpowers/plans/2026-05-22-strategy-purpose-and-identity.md`. Two execution options:

**1. Subagent-driven (recommended for code)** — fresh subagent per task, review between tasks. Heavier than this prose piece warrants; useful when tasks are independent and parallelizable.

**2. Inline execution (recommended for this plan)** — execute tasks in this session using `superpowers:executing-plans`, batch with checkpoints. For a 3-task prose piece with sequential dependencies (draft → integrate → commit) and human-in-the-loop voice judgment, inline execution is the right shape — same call as Origins #24.

**Recommendation: inline execution**, matching #24's precedent. Min is in the loop for voice judgment calls that need a human eye.
