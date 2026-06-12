# Session #26 plan: README voice section + session-skill progress ledger

**Spec**: `docs/superpowers/specs/2026-06-12-readme-voice-section-and-progress-ledger.md`
**Execution**: inline, single session. Tasks in order; A and B are independent but A ships first (it is the planned P1 work).

---

## Task 1: README voice section

- [ ] Re-read the voice profile's positive patterns (Drafting note discipline: draft toward them first).
- [ ] Draft "## Voice in Practice" (~250w): framing paragraph, before block (unguided AI draft of a bug-fix session summary, authentic documented tells), after block (voiced draft: verdict-first, mechanism-then-fix, parenthetical receipts, short landing), naming paragraph, pointer sentence to `voice/` and the profile mechanism.
- [ ] Insert between "How It Works" and "Provenance" in README.md.
- [ ] Grep gate: em-dash count (the before block's em-dashes are exhibits and don't count against the budget; surrounding prose target is 0), banned vocab outside the before block, copula substitution, smart quotes.
- [ ] Read-back test: does the after block sound like a person, does the surrounding prose pass its own standard?
- [ ] Commit.

## Task 2: Progress ledger in session-end skill

- [ ] Add "Progress ledger" instruction block to `skills/session-end/SKILL.md` after the voice-context paragraph: roster at entry (numbered steps, applicable/skip + reasons), `[N/M]` opener per step, one-line outcome per step (done / skipped (reason) / flagged), no silent skips, native task-list adapter note.
- [ ] Step 12: note the checklist is assembled from ledger outcomes (a receipt, not a recitation).
- [ ] "Ready to close": add session-end commit convention (session number, size transition, NEXT pointer). Advisory.
- [ ] New text: no em-dashes, no banned vocab.

## Task 3: Progress ledger in session-start skill

- [ ] Add lighter ledger block to `skills/session-start/SKILL.md`: step lines + outcomes; roster optional (session-start is fast; the ledger matters most when health checks stall).
- [ ] Same constraints on new text.

## Task 4: Template sync

- [ ] Mirror Task 2 block into `templates/session-end.md` (adjusted: CLAUDE.md wording, CC command framing).
- [ ] Mirror Task 3 block into `templates/session-start.md`.
- [ ] Commit Tasks 2-4 together (one logical change: progress ledger across session surfaces).

## Task 5: Ledger + queue capture

- [ ] CLAUDE.md: kit table version bumps (session skills v1.4; templates v4/v3), Documentation Reference rows, Session Progress entry, NEXT pointer, P1(e) status, queue capture of recon findings as P2 candidates (verification ladder, compute-only hooks, size-check hook, severity-graded privacy gate, contract template upgrade) with provenance.
- [ ] Privacy audit on everything committed (public repo: no absolute paths, no emails, no operational details).
- [ ] Commit close.
