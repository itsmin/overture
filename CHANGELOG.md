# Changelog

Notable changes to the Overture plugin. Skill and command behavior only; methodology docs and patterns evolve continuously in the repo and are not versioned here.

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

## [1.1.0] - 2026-07-06

Additive skill behavior from Sessions #20 through #26. No breaking changes.

### Added
- Progress ledger in session-start and session-end skills: step roster at entry, `[N/M]` step lines with one-line outcomes, skips always carry a reason (Session #26)
- Receipt checklist and session-close commit convention in session-end: session number, operating-document size transition, and NEXT pointer in the close commit message (Session #26)
- Voice context auto-load: session skills load the voice profile (`~/.overture/voice.md`, project-local override respected) so drafted prose follows the derived voice rather than the AI default (Session #22)
- Profile auto-load pre-step in session-start (Session #22)
- Companion capabilities references in all three skills, pointing to first-party plugins where they cover adjacent ground (Session #21)
- Ecosystem surfacing step in overture-init (Session #21)

### Changed
- Size check and compression at session-end are mandatory rather than advisory (Session #21)
- Cross-tool portability fixes from the first Gemini CLI end-to-end validation (Session #20)

## [1.0.1] - 2026-04-13

### Changed
- Session skills defer to the operating document's SESSION WORKFLOW section as authoritative; skill steps are the generic fallback

## [1.0.0] - 2026-04-09

### Added
- Initial plugin release: `/overture:init` command; overture-init, session-start, and session-end skills in Agent Skills format; self-hosted marketplace manifest
