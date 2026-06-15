# README Hero Rewrite — Design Spec

**Session**: #27
**Date**: 2026-06-14
**Status**: Approved, ready for implementation plan

## Problem

The README hero is the kit's highest-visibility surface. The current version fails on two fronts:

1. **Undifferentiated — including against the base tool.** The payload sentence ("so your agent remembers what you're working on, session after session") describes a capability Claude Code now ships out of the box: auto-loaded `CLAUDE.md`, persistent auto-memory, `/memory`. The hero sells the floor, and the floor moved. It does not differentiate Overture from competitors *or* from the tool it runs on top of.
2. **Too oblique.** "The setup before the performance" is an elegant musical metaphor (Overture = the prelude before the performance), but a cold reader doesn't get the payoff fast enough. Clarity is sacrificed for cleverness.

These compound: fixing "undifferentiated" demands specificity, which fights the clean obliqueness — so the rewrite has to do both at once, not trade one for the other.

## The wedge

The honest differentiation is **what you get above raw memory**. OOTB memory *accumulates* (and drifts, and bloats, with no protocol). Overture is the *managed workflow* around it — work queue, deliberate session handoffs, deferred-work tracking, size hygiene, reconciliation — plus craft the base tool has no answer for: voice (the agent writes in your register) and multi-project coordination.

"The agent remembers facts; Overture runs the workflow around them" differentiates against both competitors and the base tool, and it does so concretely enough to cure the obliqueness.

## Changes

Two edits to `README.md`, the same wedge applied to both. Coupled by design: the hero concession ("your agent already remembers") directly contradicts the current Problem section ("it remembers nothing"), so they cannot be changed independently without shipping a self-contradiction.

### Change 1 — Hero (current lines 3–5)

Replace with:

```markdown
**A memory file remembers. A workflow compounds.** Your agent already keeps a CLAUDE.md; Overture turns it into a managed operating document: a work queue, deliberate session handoffs, and hygiene that fights the drift. It also adds craft the base tool has no answer for — the agent writes in your voice, and the same system runs one project or a whole portfolio.

Works with Claude Code, Codex CLI, Gemini CLI, and any tool on the Agent Skills standard.
```

Rationale for the specific choices:
- **Opening contrast hook** ("A memory file remembers. A workflow compounds.") stages the OOTB wedge as the hook itself, fixing obliqueness and differentiation in one beat. "Compounds" converts the contrast from passive-vs-active to static-vs-growing — the most Overture-true verb, naming the session-over-session payoff.
- **Opens by conceding the floor** ("Your agent already keeps a CLAUDE.md") to disarm the OOTB objection in the base tool's own language, then vaults over it.
- **Names the craft layers** (voice, one-project-to-portfolio) as proof of a real ceiling — the lanes with zero OOTB equivalent.
- **One earned em-dash, not two connective ones.** The list after "operating document" uses a colon; the single em-dash is reserved for the rhetorical craft turn. The hero sits above the Voice-in-Practice section that *teaches* AI-tell avoidance — it must pass its own test.
- **Cross-tool line** changed from "Also works with…" to "Works with Claude Code, Codex CLI, Gemini CLI…" — foregrounds the primary tool instead of leading with the secondaries.

### Change 2 — The Problem This Solves (current lines 11–13)

Replace the first two paragraphs with:

```markdown
Your agent keeps a memory file now, so it remembers facts about your project. But a file that only grows isn't a workflow. Priorities go stale, the memory bloats, and the thing you actually need next session — what was in flight, what got deferred, what's next — was never captured as more than prose. The work still lives in your head; the agent just has better notes.

Overture fixes that. It gives your agent a managed operating document: current state, priorities, a work queue, and deliberate session handoffs, plus the hygiene to keep it from rotting as it grows. Every session starts where the last one ended, and the memory gets more useful instead of just bigger.
```

The provenance paragraph that follows ("Evolved through 480+ working sessions…") is unchanged.

Rationale: the Problem section currently rests on the pre-OOTB premise that the agent forgets ("Next time, it remembers nothing"). That premise is now false and contradicts the new hero. The reframe shifts the problem from *amnesia* to *raw memory drifts and doesn't carry the work* — the same honest wedge, one section deeper.

## Scope boundary

**In scope:**
- `README.md` hero (lines 3–5)
- `README.md` "The Problem This Solves" first two paragraphs (lines 11–13)

**Out of scope (verified, with reason):**
- `.claude-plugin/plugin.json` and `marketplace.json` — descriptions are independent ("Session management framework…"), do not echo the tagline. No sync needed.
- `Working-With-Claude-Code.md:17` — the metaphor's load-bearing home (explains the Overture / Choral / Lyrical naming). Stays. The name rationale is preserved there.
- Voice-in-Practice callback (`README.md:190`, "Overture treats voice as part of the setup") — "setup" reads fine as a generic word once the tagline is gone; not a load-bearing echo.

**Accepted trade-off:** the README no longer explains *why it's called Overture* at the top. This is the deliberate price of curing obliqueness; the name rationale still lives in `Working-With-Claude-Code.md`.

## Verification

- Render the README and confirm hero + Problem section read as one coherent argument (no residual contradiction; the concession in the hero and the Problem reframe agree).
- Grep the two edited blocks for em-dash density and AI-tells (em-dash-as-connective-tissue, "robust"/"seamless"/"Additionally", "isn't just X" pivots, participle tails). The hero is the voice flagship; it must pass the test the Voice-in-Practice section sets two scrolls below it.
- Confirm no other README section still references the pre-OOTB "agent forgets" premise.
- Update the CLAUDE.md kit table / Session Progress note for README version at session-end.
