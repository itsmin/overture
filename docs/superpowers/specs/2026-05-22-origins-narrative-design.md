# Origins Narrative — Design Spec

**Session**: #24 (brainstorm + draft); part of Phase 2 voice elevation
**Date**: 2026-05-22
**Audience**: Ecosystem evaluator reading the README
**Status**: Design approved, ready for implementation plan

---

## Purpose

Replace the current `## Provenance` paragraph in `README.md` with a 300-400 word Origins narrative that:

1. Earns the kit's credibility through 480+ session production provenance.
2. Names the three distinctive lanes (Choral, Voice, Operating-Document Discipline) by grounding each in the specific production fire that created it.
3. Lands the specialist-mode posture without using the term, by closing on the ecosystem-evolution observation.

This is the first piece of Phase 2 voice-encoded public prose. Subsequent pieces (README hero, voice section, STRATEGY voiced sections) build on it.

---

## Scope, register, hosting

- **Replaces**: Current `## Provenance` section of `README.md` (the paragraph beginning "Built across 480+ sessions on two production products").
- **Preserves**: The meta-attribution paragraph immediately following ("This framework — including its documentation — was built collaboratively with Claude Code..."). It does work the Origins doesn't and stays verbatim.
- **Length budget**: 300-400 words. Target ~370.
- **Register**: Technical-narrative, third-person clinical. No first-person shift. No contractions.

---

## Voice constraints

| Constraint | Check |
|---|---|
| Em-dashes | `grep -c '—'` ≤ 1 (load-bearing only) |
| Banned vocab in prose | 0 instances of: delve, leverage, foster, robust, seamless, comprehensive, multifaceted, profound, transformative, journey, landscape, realm, beacon, testament, Additionally, Furthermore, Moreover, In conclusion |
| Copula substitution | 0 instances of "serves as / stands as / represents / marks" — use "is" |
| Smart quotes / curly apostrophes | 0 instances |
| Verdict-first | Verdict-line lands at sentence ~3, not sentence 1 (matches Min's actual rhythm) |
| Mechanism-first postmortem per lane | Each fire-paragraph: symptom → cause → pattern that survived |
| Soften-then-assert closer | Final 1-2 sentences: setup (Anthropic shipped table-stakes) → assert (the three lanes are what they didn't) |
| Word count | Body prose 300-400 words, target ~370 |

---

## Narrative architecture

1. **Opening (1-2 sentences)** — Provenance frame. 480+ sessions, two production products described as "a company intelligence platform and a professional representation service" (current README phrasing, portable as products evolve).

2. **Verdict-line (1 short sentence)** — "Most of what survived wasn't designed. It was extracted." Sets the through-line.

3. **Three fire-paragraphs (one per distinctive lane, ~50-80 words each)**:
   - **Choral** — cross-project coordination became a pattern when the two products needed to stay in sync without an integration layer.
   - **Voice** — voice became a discipline when default AI-prose started appearing in shipped editorial work.
   - **Operating-Document Discipline** — operating-document structure became methodology when a CLAUDE.md hit size limits and the options were lossy compression or systemic refactoring.

   Each follows: symptom → fire → pattern that survived.

4. **Stitch-line (1 sentence)** — "Each lane has the same shape: a problem the rest of the ecosystem doesn't try to solve, with a pattern that survived contact with users." Lifts the three fires into a single observation.

5. **Close — ecosystem evolution + specialist mode (1-2 sentences)** — "By mid-2026, Anthropic had shipped first-party plugins for most of the table-stakes. The three lanes Overture occupies are what they didn't." Soften-then-assert; lands the positioning conclusion without naming "specialist mode."

---

## Specificity choices

- **Products named descriptively**, not by product name. Portable as the product portfolio evolves.
- **Anthropic-shipped table-stakes named at high level** ("session memory, CLAUDE.md audit, frontend design quality") rather than by plugin name. Durable as Anthropic ships more.
- **Lanes named explicitly** (Choral, Voice, Operating-Document Discipline) so readers can trace them into STRATEGY.md and the pattern docs.
- **"Specialist mode" never appears in the prose.** The reader arrives at the conclusion through the close.

---

## Success criteria

1. **Reader walkaway** — ecosystem evaluator finishes and knows:
   - Overture is grounded in real production work (480+ sessions, two shipped products).
   - The three distinctive lanes and what created them.
   - Specialist-mode posture (without that term being used).
2. **Voice-clean** — passes every check in the voice-constraints table. Verified by `grep` before commit.
3. **Hosting-integrated** — replaces current Provenance paragraph; meta-attribution paragraph preserved verbatim immediately after.
4. **Derivable** — the prose can be trimmed to ~150 words for STRATEGY.md `## Origins` placeholder; expanded with first-person shift for a LinkedIn version (separate session).
5. **Voice-test value** — first test of voice.md (refreshed #22) on substantive new prose. Any voice rule that is hard to apply, or surfaces a gap in voice.md, is captured as a finding.

---

## Edge cases

- **If a lane-fire feels weak on receipts**: fall back to abstract framing rather than fabricate detail.
- **If the specialist-mode close lands clunky**: drop the parallel structure ("what they didn't") and use a plainer assertion. Voice consistency wins over rhetorical symmetry.
- **If drafting drifts past 400 words**: cut the stitch-line first. The three fires can stand without the lift.
- **If voice constraint conflicts with clarity**: clarity wins. Note the conflict as a voice.md gap to revisit.

---

## Out of scope (for this spec)

- LinkedIn-derived version (separate session, essay-register treatment, first-person).
- STRATEGY.md `## Origins` placeholder fill (derive from README version after this lands).
- README hero rewrite, voice section with before/after example. Subsequent #24+ work.
- Wider Overture em-dash purge of README, Progression, Working-With-Claude-Code, patterns, workflow. Parallel work, not blocked by this.

---

## Implementation handoff

Next step: invoke `superpowers:writing-plans` to produce a detailed implementation plan covering: draft generation, voice verification commands, in-place README edit, verification of preserved meta-attribution paragraph, commit.
