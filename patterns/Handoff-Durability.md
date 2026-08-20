# Handoff Durability

**Rotating fields cannot hold multi-session context.**

Found in absOrbs Session #26, 2026-08-18, and it is a defect in this framework
rather than in that project.

## The failure

Two sessions were reserved — one for the session immediately next, one for the
session after it — each with a written context document. The pointers to both
were placed in the operating document's **NEXT** field.

`NEXT` is rewritten at every session-end. By this framework's own instructions:
*"Update NEXT pointer — the #1 priority from Step 8."* So the pointer to the
session-after-next would have been destroyed by the next session-end — by the
very ritual that exists to preserve continuity.

**And it fails silently.** Nothing errors. No test breaks. The note is simply not
there the following month, and nobody knows what was lost, because the record of
it was the thing that was lost.

## The distinction

Every handoff document has two kinds of field, distinguished by **how they are
edited**, not by what they contain:

| | Members | Edit semantics |
|---|---|---|
| **Rotating** | NEXT / next-up, Current status, "this session" lines | Rewritten wholesale every cycle, by design |
| **Durable** | UPCOMING SESSIONS, Deferred Work, Parking Lot, Reserved Sessions, Critical Reminders, Pending Verifications | Edited item-wise; an item leaves only by explicit disposition (moved to COMPLETE, DEFERRED, PARKING LOT, an archive, or a doc), never by silent omission |

Rotating fields are not a weaker version of durable ones. They are a different
thing: their *purpose* is to be replaced. Writing something into a rotating
field is a statement that it stops mattering after one cycle.

*Revised 2026-08-19: the first version of this pattern (same-day) classified
UPCOMING SESSIONS as rotating. In observed practice its entries survive months
of session-ends and are curated item-wise, so lifetime was the wrong criterion.
Edit semantics is the one a session-end can actually verify: a field either
gets rewritten wholesale or it doesn't.*

## The rule

**Anything that must survive more than one cycle goes in a durable structure.
The rotating field may only point AT it.**

In the absOrbs case the fix was a `RESERVED SESSIONS` block in the work queue,
carrying the reasoning and the full paths, with `NEXT` reduced to a pointer at
that block. Rewriting `NEXT` now cannot lose anything.

Two further rules ride on the model:

**The doc rule.** A queued entry whose context exceeds roughly a paragraph gets
a real file (plan, spec, or context doc); the entry carries a pointer plus a
one-line summary. Context documents for future sessions always qualify.

**The citation rule.** Before trimming or archiving anything on the strength of
a citation ("detail in ARCHIVE.md"), verify the target actually holds the
content. A citation is not a backup; trimming against a dangling citation
destroys the only record.

## Why this is easy to get wrong

The rotating field is the most *prominent* one — it is what session-start reads
first and displays first. So it feels like the safest place to put something
important. It is the least safe.

The prominence and the durability are inversely related, and nothing in the
document's layout signals that.

## Checks

**At session-end, before rewriting the rotating fields:** does anything being
written there need to outlive this cycle? If yes, it goes to a durable structure
and the rotating field points at it. Reserved future sessions, multi-session
plans, and context documents for later work all qualify.

**At session-start:** surface the durable structures, not only the rotating
pointer. If NEXT references work more than one session out and no durable
structure holds it, flag it — that context is one session-end from deletion.

## Related

A near-miss in the same session, same family: a COMPLETE row cited an archive
file for its detail, and that session had never been archived there. Trimming
the row on the strength of the citation would have destroyed the only record.

See also absOrbs #25, where documentation cited tool-scratch ledgers in a
directory that ignored itself.

Both failures share a shape: **the record and the thing it records were assumed
to be in different places, and they were not.**
