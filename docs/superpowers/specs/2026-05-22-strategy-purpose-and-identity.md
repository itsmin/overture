# STRATEGY.md Purpose + What Overture Is, and Isn't — Design Spec

**Session**: #25 (brainstorm + draft); Phase 2 voice elevation, continuation of #24 Origins work
**Date**: 2026-05-22
**Audience**: Ecosystem evaluator reading `STRATEGY.md`
**Status**: Design approved, ready for implementation plan

---

## Purpose

Replace the two remaining placeholder blocks in `STRATEGY.md` with voiced prose:

1. **`## Purpose`** — currently a 2-sentence Claude-default paragraph (em-dash list, "doesn't try to be" framing) marked `_(prose: Session #22)_`.
2. **`## What Overture Is, and Isn't`** — currently a paragraph-length provisional framing marked `_(prose: Session #22 — sharper positioning statement under voice...)_` that duplicates much of the Purpose content.

The two sections are voiced as a paired unit with distinct, non-overlapping jobs. Origins (shipped #24) is closed; this is the next piece of Phase 2 public prose. Subsequent pieces (README hero, README voice section with before/after, LinkedIn derivative) are out of scope for this spec.

---

## Scope, register, hosting

- **Replaces**: The placeholder blocks in `STRATEGY.md` for `## Purpose` and `## What Overture Is, and Isn't`. No other sections touched in this spec.
- **Preserves**: All other STRATEGY.md sections (Origins, Distinctive Lanes, Coexisting Lanes, Out of Scope, Scan Discipline, Anti-Atrophy, Marketplace Posture) stay verbatim.
- **Length budgets**:
  - Purpose: ~50-70 words, target ~60. One paragraph, 2-3 sentences.
  - Is/Isn't: ~110-150 words, target ~130. Two paragraphs.
- **Register**: Technical-narrative, third-person clinical. No first-person shift. No contractions. Matches the Origins #24 register.

---

## Section: Purpose

### Job
Define what Overture is and what it gives the reader. Nothing more.

### Architecture
- **Sentence 1**: Verdict-first definition. What Overture is.
- **Sentence 2** (and optionally 3): Expansion. What role it plays, what it gives the reader, what it composes with.
- No lane enumeration (Distinctive Lanes handles that).
- No ecosystem critique (Origins close handles that).
- No specialist-mode naming (Is/Isn't handles that).

### Holds back
Specialist mode. Named competitors. Lane-by-lane detail. Ecosystem evolution narrative.

---

## Section: What Overture Is, and Isn't

### Job
Position Overture against the ecosystem. Name what it explicitly declines. Land specialist mode at the close.

### Architecture
- **Paragraph 1 — "Is"** (2-3 sentences):
  - Names the role Overture plays: human-discipline layer for AI-assisted development.
  - Specifies what it composes with: first-party Anthropic plugins and community skills.
  - Affirms the three lanes it owns at high level (cross-project coordination, voice as design material, operating-document discipline) — matching the Distinctive Lanes section's 3-lane shape, not enumerating sub-patterns. Distinctive Lanes carries the detail.
- **Paragraph 2 — "Isn't"** (2-3 sentences):
  - Names declined claims at category level: agent-orchestration / swarm coordination, exhaustive skill library, aggressive growth posture.
  - Closes with specialist-mode landing as soften-then-assert (final clause).

### Holds back
Specific competitor names — those live in the existing Out of Scope table downstream. Lane-by-lane detail.

---

## Cross-section discipline

- **No restatement of Origins.** Origins narrates *how* the kit got here. Purpose + Is/Isn't position it *now*. Origins is closed; this is open.
- **No restatement between Purpose and Is/Isn't.** The current placeholders fail this test. The two new sections must pass: "delete one — does the other still work?" in both directions.
- **"Human-discipline layer"** kept as the connecting phrase across both sections and Origins. Reinforces, not repeats.

---

## Voice constraints

Reuses the Origins #24 table, scoped to both new sections combined.

| Constraint | Check |
|---|---|
| Em-dashes total across both sections | `grep -c '—'` ≤ 1 (load-bearing only); current placeholders contain 2 |
| Banned vocab in prose | 0 instances of: delve, leverage, foster, robust, seamless, comprehensive, multifaceted, profound, transformative, journey, landscape, realm, beacon, testament, Additionally, Furthermore, Moreover, In conclusion |
| Copula substitution | 0 instances of "serves as / stands as / represents / marks / features" — use "is" |
| Smart quotes / curly apostrophes | 0 instances |
| Verdict-first | Each section opens with the definition or positioning statement, not a hedge |
| Soften-then-assert | Is/Isn't section closes with specialist-mode landing as final clause |
| Negative parallelism ("Not X, but Y") | At most 1 instance across both sections, substantive only (per voice.md rule) |
| Word count | Purpose 50-70 words; Is/Isn't 110-150 words |

---

## Drafting approach (positive-patterns-first)

Per the #24 Origins finding: v1 passed every grep check but read as competent-AI-prose. v2 required drafting *toward* voice.md positive patterns, not *away from* anti-patterns. Apply the lesson:

1. **Read voice.md "What's Distinctly Min's" section before drafting.** Specifically internalize: verdict-first openings, soften-then-assert closers, header-payload colons, compound-noun + parenthetical-unpacking, binary naming for hard decisions, plan-revision-in-public.
2. **Draft toward those positive patterns first.** Do not draft generic prose and clean it later.
3. **Grep-verify against the voice-constraints table** as the last gate before commit, not the first.

---

## Specificity choices

- **Compose-with phrasing**: "first-party Anthropic plugins" and "community skills" at category level. Durable as specific plugins ship and rename.
- **Declined claims**: named by category (agent-orchestration / swarm coordination, exhaustive skill library, aggressive growth posture), not by competitor name. STRATEGY's existing Out of Scope table is where competitor names live.
- **"Specialist mode"** named exactly once, at the close of Is/Isn't. Don't repeat. Already used in Marketplace Posture; this is its narrative-anchored introduction.
- **"Human-discipline layer"** preserved as the connecting phrase across both sections and Origins.

---

## Success criteria

1. **Reader walkaway** — ecosystem evaluator finishes the two sections and knows:
   - What Overture is (Purpose).
   - Where it sits in the ecosystem and what it composes with (Is paragraph).
   - What it explicitly isn't (Isn't paragraph).
   - Why that posture is called specialist mode (Is/Isn't close).
2. **Voice-clean** — passes every check in the voice-constraints table. Verified by `grep` before commit.
3. **Non-redundant with Origins** — both sections add information Origins doesn't carry. Origins narrates; this positions.
4. **Non-redundant with each other** — passes the "delete one — does the other still work?" test in both directions.
5. **Derivable** — Purpose paragraph can stand as a 1-paragraph elevator pitch; Is/Isn't can be lifted into a LinkedIn post in essay register (separate session).
6. **Voice-test value** — second test of voice.md (refreshed #22) on substantive new prose. Any voice rule that is hard to apply, or surfaces a gap in voice.md, is captured as a finding (continuation of #24 drafting note).

---

## Edge cases

- **If Purpose and Is/Isn't start restating each other**: cut content from Purpose first. Is/Isn't carries the heavier positioning weight; Purpose can be brief.
- **If specialist mode doesn't land cleanly at section close**: pull it earlier in the paragraph and end on a plainer assertion. Voice consistency wins over rhetorical symmetry (same rule as Origins #24).
- **If voice constraint conflicts with clarity**: clarity wins. Note the conflict as a voice.md gap to revisit.
- **If Is/Isn't drifts past 150 words**: cut from the "is" paragraph first; the "isn't" paragraph carries the soften-then-assert payoff.
- **If Purpose drifts past 70 words**: cut the second expansion sentence. A definition + one role statement is enough.

---

## Out of scope (for this spec)

- README hero rewrite (separate session).
- README voice section with before/after example (separate session).
- LinkedIn derivative of Origins or Is/Isn't (separate session, essay register).
- Wider em-dash purge of remaining STRATEGY sections (21 em-dashes outside Origins) — parallel work, unblocked by this.
- Status note refresh at the top of STRATEGY.md is handled in implementation, not a design call.

---

## Implementation handoff

Next step: invoke `superpowers:writing-plans` to produce a detailed implementation plan covering:

1. Read voice.md "What's Distinctly Min's" section as the drafting prime.
2. Draft Purpose per the architecture above.
3. Draft Is/Isn't paragraphs 1 and 2 per the architecture above.
4. Voice verification commands (`grep` against the constraints table).
5. In-place STRATEGY.md edit replacing both placeholder blocks.
6. Status note refresh at the top of STRATEGY.md.
7. Commit.
