# Changelog

Notable changes to the Overture plugin. Skill and command behavior only; methodology docs and patterns evolve continuously in the repo and are not versioned here.

## [Unreleased]

### Added
- **Handoff durability check** in session-end (step 7b) and session-start
  (handoff quality check). Found in absOrbs #26: two reserved sessions had their
  pointers written to NEXT, which session-end overwrites every cycle — so the
  pointer to the session-after-next would have been destroyed by the ritual that
  exists to preserve continuity, silently. Rotating fields (NEXT, Current,
  UPCOMING SESSIONS) now explicitly distinguished from durable ones (Deferred
  Work, Parking Lot, Reserved Sessions, Critical Reminders, Pending
  Verifications). Pattern: `patterns/Handoff-Durability.md`.

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
