# Session #26 spec: README voice section + session-skill progress ledger

**Date**: June 12, 2026
**Status**: Approved (user pre-approved proceeding with planned work; decisions documented here for post-hoc review)

Two deliverables. Part A is the planned Session #26 work (P1(e): README voice section with before/after example). Part B extracts a learning from sibling-project recon: progress visibility during session-end and session-start.

---

## Part A: README voice section

### What it is

A new H2 in README.md demonstrating what voice encoding does: the same task drafted twice, once by a model with no voice context, once against a voice profile. A methodology demonstration for the ecosystem-evaluator audience. Show, don't tell.

### Decisions

1. **Placement**: between "How It Works" and "Provenance". Reader flow becomes problem, setup, levels, demonstration, provenance. The Origins paragraph about the voice fire then lands with a concrete example fresh in mind.
2. **Title**: "Voice in Practice". Title case matches the README's sibling headers. The sentence-case question for README headings belongs to the wider purge (queued #28), not this section.
3. **Example task**: a session summary of a bug fix. It is the prose Overture's workflow actually produces, and the register where AI tells are most recognizable to the target reader.
4. **Before block** (~70w): an honest unguided draft. Authentic tells only, each one documented in the voice docs: em-dash density, banned vocabulary (robust, seamless, critical), "Additionally", negative parallelism, participle tails. Framed as "something like", not presented as a quote of any specific model.
5. **After block** (~65w): drafted toward positive patterns. Verdict-first opening, mechanism-then-fix, receipts in parentheses, sibling-bug systemic check, short landing sentence.
6. **Connective prose**: one framing paragraph before the blocks, one short paragraph after naming what changed, one pointer sentence to `voice/` and the `~/.overture/voice.md` profile mechanism. No annotation listicle.
7. **Budget**: ~250 words total. Comparable to Origins (328w), smaller.

### Constraint that governs everything else

This section will be read adversarially. Prose about avoiding AI tells that exhibits AI tells is dead on arrival. Drafting follows the Voice-Reference Drafting note: positive patterns first, grep-verify second (em-dash count, banned vocab, copula substitution, smart quotes).

### Success criteria

- The before block reads as recognizable default-AI prose, not a strawman.
- The after block reads as the same fix reported by a person.
- The surrounding prose passes the same checks it describes.
- No new files; Going Deeper table and kit table unchanged.

---

## Part B: Progress ledger for session skills

### Problem

Session-end is a 12-step ritual. From the user's seat it is a long stretch of agent activity: drafts appear, steps run, and there is no visibility into where the close-out stands, what remains, or whether a step was silently skipped. Session-start has the same shape, lighter (8 steps).

### What sibling projects taught

Recon across two production projects found progress *records*, not progress *indicators*: session-end commits that carry state transitions (size status, NEXT pointer), reconciliation metadata ("what moved where"), and typed verification results. The records work. The gap is in-flight visibility, and the records themselves are worth standardizing.

### Design

1. **Step ledger** (tool-agnostic, the core). At entry, present a roster: each step numbered, with applicable/skip determination and skip reasons ("no metrics table", "no working contract"). During the run, each step opens with a `[N/M] Step name` line and closes with a one-line outcome: done, skipped (reason), or flagged (what). No silent skipping; a skip without a reason is a bug.
2. **Native task list** (adapter note). If the tool has a native task/progress list, mirror the roster there and update statuses as steps complete. The text ledger still runs; the task list is reinforcement, not replacement.
3. **Session-end commit convention** (extracted record). When committing the session close, carry the state in the message: session number, operating-doc size transition (e.g. `YELLOW 33.6k -> GREEN 29.9k`), and the NEXT pointer. The git log becomes a session-by-session health record. Advisory, not mandatory.
4. **Final checklist becomes a receipt.** Session-end Step 12's checklist is assembled from ledger outcomes rather than recited fresh.

### Files

| File | Change | Version |
|------|--------|---------|
| `skills/session-end/SKILL.md` | Progress ledger block + commit convention + Step 12 receipt note | v1.3 -> v1.4 |
| `skills/session-start/SKILL.md` | Progress ledger block (lighter: roster optional, step lines yes) | v1.3 -> v1.4 |
| `templates/session-end.md` | Same ledger block, kept in sync with skill | v3 -> v4 |
| `templates/session-start.md` | Same ledger block, kept in sync with skill | v2 -> v3 |

### Out of scope (captured to queue instead)

Recon surfaced more than this session should carry: typed verification ladders, compute-only hook principle, size-check hook enforcement, severity-graded privacy gates, working-contract section upgrades. Each goes to the work queue as a P2 candidate with provenance noted. Implementing them here would triple the session's surface area.

### Success criteria

- A session-end run opens with a step roster and emits one ledger line per step.
- Skips always carry reasons.
- Skill and template pairs do not drift (same ledger text, adjusted for context).
- New skill text contains no em-dashes and no banned vocabulary.
