# Handoff durability, structural — design

**Date**: 2026-08-19
**Session**: #28 (renumbering note: the Autonomous Execution build formerly queued as #28 moves down; see section 4)
**Status**: Approved by Min 2026-08-19 (enforcement tier, UPCOMING classification, and release vehicle each confirmed separately)

## Problem

absOrbs #26 (2026-08-18) surfaced a framework defect: two future sessions were reserved, each with a written context document, and both pointers were placed in the operating document's NEXT field. Session-end rewrites NEXT every cycle, so the pointer to the session-after-next would have been destroyed by the ritual that exists to preserve continuity. It fails silently: nothing errors, the note is simply absent, and the record of what was lost was the thing that was lost.

A same-session near-miss shares the shape: a COMPLETE row cited an archive file that had never received the content. Trimming on the strength of the citation would have destroyed the only record. Both cases: the record and the thing it records were assumed to be in different places, and they were not.

A behavioral patch already landed (`b3fd07e`): `patterns/Handoff-Durability.md`, session-end step 7b, a session-start handoff-quality line, a CHANGELOG entry. Verified gaps in its reach:

1. Templates unsynced. `templates/session-end.md` and `templates/session-start.md` carry none of it, breaking the #26 skill/template sync convention and leaving cross-tool users unprotected.
2. The operating-doc skeleton has no durable home for reserved sessions and no lifetime signal in the layout. Every newly initialized project is born with the vulnerability.
3. Handoff-Durability.md is not in the kit table.
4. The fix is undistributed: above the v1.1.0 tag, unreleased, not mirrored to the plugin cache. Every sibling project runs the vulnerable session-end today.
5. Overture's own CLAUDE.md violates the rule: the entire Autonomous Execution design lives in UPCOMING SESSIONS, which `b3fd07e` classifies as rotating.

The patch is also purely behavioral. Its own diagnosis is "nothing in the layout says so", and it did not touch the layout.

## Decisions (Min, 2026-08-19)

1. **Enforcement tier: structural.** Field lifetimes get declared in the operating document itself. No hook backstop in this pass; the mechanical tier is deferred to the Autonomous Execution session, where hook infrastructure is already designed.
2. **UPCOMING SESSIONS is durable, not rotating.** `b3fd07e` misclassified it: in practice entries survive many cycles and are curated, not overwritten. The pattern and both skills get revised to match.
3. **Release vehicle: plugin 1.2.0 this session.** Additive skill behavior, minor bump per the 1.1.0 precedent. No hand-mirroring to the plugin cache; that process is what left today's cache gap.

## Design

### 1. Field lifetime model

Two classes, distinguished by **edit semantics** rather than lifetime, because edit semantics are what a session-end can actually verify:

- **Rotating**: rewritten wholesale every cycle. NEXT, Current status, "this session" lines. May hold only pointers and single-cycle information.
- **Durable**: edited item-wise; an item leaves only by **explicit disposition** (moved to COMPLETE, DEFERRED, PARKING LOT, an archive, or a doc), never by silent omission. Members: UPCOMING SESSIONS, Deferred Work, Parking Lot, Reserved Sessions, Critical Reminders, Pending Verifications.

Two rules ride on the model:

- **Doc rule**: any queued entry whose context exceeds roughly a paragraph gets a real file; the entry carries a pointer plus a one-line summary. Context documents for future sessions always qualify.
- **Citation rule**: before trimming or archiving anything on the strength of a citation, verify the target actually holds the content. This is the near-miss operationalized, and it lands as a check in session-end's size/archive step, not only as pattern prose.

### 2. Layout enforcement

- **Lifetime annotations in the operating document.** One italic line under the Session Progress header: rotating fields named, plus "anything that must survive more than one cycle lives in a durable structure, pointed at from here." A matching line atop WORK QUEUE stating the explicit-disposition rule.
- **RESERVED SESSIONS** joins the operating-doc skeleton (`templates/CLAUDE.md` and the init skill's `references/operating-document-template.md`) as a commented-out optional section, same treatment as the other optional sections, with the annotation baked into the comment.
- **`~/.overture/profile.md` Project Defaults** gains both: RESERVED SESSIONS in the section list, lifetime annotations in the skeleton defaults.

### 3. Skill and template revisions

- `patterns/Handoff-Durability.md`, session-end 7b, and session-start's durability check revised to the new classification: UPCOMING durable, edit-semantics criterion, doc rule, citation rule.
- Session-end's queue-reconciliation step gains the explicit-disposition requirement for UPCOMING.
- Session-end's size/archive step gains the citation-rule check.
- `templates/session-end.md` and `templates/session-start.md` synced with all of the above.

### 4. Overture's own document remediated

- The Autonomous Execution design moves out of UPCOMING into `docs/plans/2026-08-19-autonomous-execution-context.md` (new directory, matching the absOrbs `Documentation/plans/` precedent for future-session context docs). The UPCOMING entry becomes a pointer plus summary. Citation rule applied to ourselves: verify the doc holds the full design before trimming the entry.
- Lifetime annotations added to Overture's CLAUDE.md.
- Kit table gains Handoff-Durability.md and the revised skill/template versions. Session Progress gains entries for the untracked Aug 10 and Aug 18 sittings.

### 5. Release 1.2.0

CHANGELOG folds `[Unreleased]` plus this work into 1.2.0, covering: the Aug 10 date/time pre-step, handoff durability (behavioral + structural), the UPCOMING reclassification, the citation check. Then: `plugin.json` 1.2.0, `claude plugin validate`, commit, tag `v1.2.0`, push, verify the tag on the remote. Siblings pick it up via `/plugin update`. absOrbs needs no doc changes; its RESERVED SESSIONS block already conforms.

## Out of scope

- The mechanical hook backstop (PreToolUse / session-end diff of rotating fields). Deferred to the Autonomous Execution session.
- The marketplace talk-through. Unchanged as queued NEXT; 1.2.0 supersedes any 1.1.1 concern there.
- absOrbs-side changes.

## Verification

- `claude plugin validate` clean.
- Skill/template pairs grep-verified to carry the same durability language.
- The moved Autonomous Execution doc diffed against the prior UPCOMING entry before the entry is trimmed (citation rule, applied here first).
- Tag `v1.2.0` verified present on the remote after push.
- Privacy audit before every push; the repo is public.
