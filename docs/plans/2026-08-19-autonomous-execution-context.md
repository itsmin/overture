# Autonomous Execution Mode — session context

**Reserved**: Session #29 · **Written**: #27 interlude, 2026-06-14; moved to a durable doc at #28, 2026-08-19 · **Start with**: `superpowers:brainstorming`

Capture Fortomino's autonomous build-to-playtest posture as a reusable Overture pattern with tooling. The design below came out of the #27 planning interlude, which audited a live autonomous setup and found its mechanism broken. Nothing here is built yet. Start the session with `superpowers:brainstorming`, as queued.

---

## Core design finding

The mode has two layers, and separating them is the finding.

**Policy.** The session owns spec → plan → implement → verify with no approval gates. Two actions stay gated regardless: merge to main, and public deploy.

**Mechanism.** Suppress permission-prompt friction so the policy can actually run.

Fortomino's mechanism is broken. A bare tool-level `Bash` entry in `allow`, with an empty `deny`, makes both hard gates behavioral only. `git push` and `git merge` auto-approve. The gate survives only if the model remembers the rule.

Better implementation: separate the concerns. Grant broad `Bash` for flow, then gate the irreversible operations mechanically through `deny` > `ask` > `allow` precedence. For high-blast-radius projects, add a PreToolUse hook as the hard backstop. Static `ask` and `deny` patterns are as form-leaky as the allowlist, since `git -C x push` and `cd x && push` both evade them. Only a hook reading the resolved command guarantees the block.

The principle: **enforcement scales with blast radius**. A solo game is fine on behavioral policy plus a static `ask`. A project handling PII or shipping to a public surface needs hook enforcement.

## Build scope

Five components.

1. **`patterns/Autonomous-Execution.md`.** Tool-agnostic pattern doc: the posture, the finding that an allowlist cannot work, the broad-allow plus mechanical-gate design, and blast-radius tiering.
2. **Reconcile `patterns/Settings-Hygiene.md`.** Add the autonomous-mode exception. Broad `Bash` voids the "dangerous-by-absence" model that lines 83-86 depend on, so explicit gates become mandatory whenever the mode is on.
3. **Operating-document template block.** A declarable "Autonomous Execution Mode" section carrying a per-project gate list.
4. **Command and skill: `/overture:autonomous-on` and `/overture:autonomous-off`.** On writes a clean profile with the gates in place. Off scopes `Bash` back at session-end. This has to be tooling rather than a documented habit, because the manual process already failed twice in Fortomino.
5. **PreToolUse hook template** in `templates/hooks/`.

## Verdict

Opt-in, not default. The mode conflicts with the partnership, ask-first, and privacy defaults in `~/.claude/CLAUDE.md`. It is safe only where the worst case is cheap.

## Live inconsistency to resolve

Two opposed instructions ship in the kit today.

- `~/.overture/profile.md` line 53 (added 2026-06-14) says grant bare `Bash` upfront.
- `patterns/Settings-Hygiene.md` lines 83-86 say never do that.

Component (2) of the build scope has to reconcile them. This is not incidental cleanup. It is the reason the pattern doc needs to exist.

## Sources and case studies

**Fortomino.** Its `CLAUDE.md` §5, the memory entry `feedback_autonomous_execution`, and its `settings.local.json`. That settings file carries a 287-line allowlist, of which roughly 280 lines are dead under bare `Bash`. It is a Settings-Hygiene cruft case study on its own.

**Overture, Jul 6 addendum.** Overture's own settings cleanup (76 entries down to 31) is the second live case study, same failure class. A home-directory-wide `Read` grant had been approved for flow, and it quietly voided the scope-narrowing everywhere else in the file.
