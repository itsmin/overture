# Session End

> **Audience**: Claude Code — this is a slash command Claude runs when you type `/session-end`. You invoke it; Claude follows the instructions.

Ensure clean handoff to the next session.

**Operating mode**: Draft-first, review-second. You were present for the entire session — don't ask the user to recount what happened. Draft everything you can from session context (summary, queue reconciliation, verification assessment, deferred work, docs sync). Present the complete draft for review. Only ask questions for information you genuinely don't have (unspoken decisions, external testing, open threads the user hasn't mentioned).

**Progress ledger.** Session-end is a multi-step ritual; the user should never wonder where the close-out stands. Before Step 1, present a roster: every step numbered, marked run or skip, each skip with its reason ("no metrics table", "repo is private with no public surfaces", "no working contract"). Then open each step with a `[N/M] Step name` line and close it with a one-line outcome: done (what changed), skipped (reason), or flagged (what needs attention). A skip without a reason is a bug; silent skipping is how steps get lost. Mirror the roster in Claude Code's task list and update statuses as steps complete; the text ledger still runs alongside it.

## Instructions

### 1. Session Summary

Draft a summary of what was accomplished. Be specific — what changed, what was deployed, what was decided. 1-3 bullet points.

Present the draft. The user corrects or approves.

### 2. Work Queue Reconciliation

**CRITICAL**: Prevents completed work from being lost between sessions.

Read CURRENT PRIORITIES from CLAUDE.md. For EACH priority, determine status from what you observed this session:
- ✅ **Completed** — Move to COMPLETE (Recent), promote next
- ⏳ **Partial** — Update Session Progress with what's done vs. remaining
- ➖ **Not touched** — Stays as-is

Match work to priorities by code changes achieved, not just descriptions. A priority might be addressed by a commit that doesn't mention it by name.

Draft the reconciliation. Present for confirmation before proceeding.

*The NEXT pointer and full next-session plan are determined in Step 8 (Next Session Planning), after all information-gathering steps are complete.*

### 3. Feature Verification Check

**CRITICAL**: Before documenting work as complete, verify it actually works.

Assess from session context: did this session implement data flow changes, new fields, or features that touch multiple code paths?

If YES:

**Identify the code paths** — what data types were touched, and what's the flow?

| Data Type | Code Paths to Verify |
|-----------|---------------------|
| [Type] | [Source → processing → storage → display] |

**Evidence requirement**: For each feature, you should be able to say:
- "I tested this with [specific data] and saw [specific result]"
- NOT just "I added the code and it looks correct"

**Impact radius**: If this session added or modified a data pipeline, transformer, or user-facing display:
- **Existing state**: Does this change affect only new data, or does existing data need retroactive processing? If yes, is there a catch-up mechanism (cron, migration, batch job) — or is it trigger-only? Trigger-only pipelines create a split where early users get a degraded experience.
- **Silent failure**: What happens if this pipeline fails or times out? Is there detection and recovery, or does data silently fall through?
- **Growth consistency**: As more users join, will this change apply to all of them consistently? Or will users who signed up before this feature miss out?

Flag any change that only applies to new data/users without a documented plan for existing state.

If verification was incomplete:
1. Do the verification now before ending session, OR
2. Add to Pending Verifications with note: "Needs end-to-end verification"

### 4. Privacy Audit
*Skip if the repo is private AND the project has no public-facing surfaces.*

**Code-level** (secrets in source):
Before committing, grep modified files for: absolute machine paths (`/Users/`), email addresses, API keys/tokens, proprietary details. Fix before committing.

**Data-level** (PII at public surfaces):
If the project has a PRIVACY BOUNDARIES table in CLAUDE.md, check whether this session's changes touch any declared boundary (data source, public surface, or connecting code). If yes:
- Verify PII filtering is intact for affected rows
- If prompt/system instructions changed: confirm PII redaction instructions survived
- If data schema changed: confirm new fields don't flow unfiltered to public surfaces
- If a new public surface was added: confirm it has a row in the table

If the project handles third-party PII and has NO declared boundaries, flag the gap.

See `patterns/Privacy-Boundary.md` for the full pattern.

### 5. Documentation Sync Check

Assess from session context: did this session change any documented domain? Draft the list of affected docs:

- [ ] Configuration or pricing → Update config (source of truth) + docs
- [ ] Data, entities, or schemas → Update architecture docs
- [ ] Infrastructure or costs → Update cost/infra docs
- [ ] Automation or background services → Update automation docs
- [ ] API routes or integration surfaces → Update relevant docs + working contract

*Customize this checklist to the project's actual domains.*

**Source of truth hierarchy**: Code/config files first, then documentation, then CLAUDE.md metrics. Update upstream before downstream.

### 6. Open Discussions Check

Ask: "Were there any discussions or decisions that didn't get captured? Topics to continue next session?"

*(This is a genuine question — you can't know about unspoken decisions or context the user hasn't shared.)*

If yes:
- Add to Session Progress under a "### Continuing" or "### Open Threads" heading
- This ensures continuity — open threads get lost without explicit tracking

### 7. Deferred Work Check

Assess from session context: were any planned items bumped? Draft the deferred items list.
- Add each to the Deferred Work table in CLAUDE.md
- Include: what it was, which session, context needed to resume
- Never let a planned item disappear silently

### 8. Next Session Planning

**CRITICAL**: This is the primary handoff to the next session. What you write here is what the next session-start reads. If it's vague, the next session starts blind.

Based on the reconciliation (Step 2), carry-forward items, deferred work, and open threads, synthesize what comes next.

**Draft a prioritized plan** (not just titles) with:
- Each candidate numbered by priority
- Cross-reference to the P1/P2 item it advances (if applicable)
- One sentence of reasoning — why this order, what it unblocks
- Any conditional logic ("if X happens, that takes priority over these")

**Ask the user**: "Here's my read on next priorities. Does this match your thinking?"

Get confirmation before proceeding to Step 9. This plan is written verbatim to CLAUDE.md — it must survive intact.

### 9. Update CLAUDE.md

#### Session Progress
- Update the "Current" line with session number and focus
- Set status to "Complete"
- Update NEXT pointer — the #1 priority from Step 8, stated specifically (e.g., "Auth middleware + tenant config", not "Continue P1 work")
- Add items to Pending Verifications if needed

#### Work Queue
- Completed items → COMPLETE (Recent)
- Promote next priority if current work is done
- Remove "blocked by" tags from newly unblocked items
- **UPCOMING SESSIONS**: Write the full prioritized plan from Step 8. Each candidate gets its own sub-bullet with reasoning and P1/P2 cross-reference. Do NOT compress to a one-liner — the next session-start reads this verbatim and needs the detail to present actionable priorities.

#### Metrics
*Skip if no metrics table.*
Update values and "Last Validated" date if sources of truth changed.

#### Queue Hygiene Tracking
If queue hygiene was performed this session (backlog pruned, priorities re-evaluated, parking lot reviewed), update `Last queue hygiene` in Session Progress to the current session number.

#### Size Check
Check CLAUDE.md character count:
```bash
wc -c CLAUDE.md
```

Use the project's size profile (see `patterns/Size-Management.md`):
- **Standard** (most projects): GREEN <30k, YELLOW 30k-35k, RED >35k
- **Large** (complex products with domain sections, multi-contract coordination): GREEN <34k, YELLOW 34k-37k, RED >37k

If YELLOW or RED, run archiving:
1. Create archive file if needed
2. Compress old session entries (keep last 5-10 inline)
3. Trim COMPLETE (Recent) to last ~10 entries
4. Verify size after pruning

#### Session Entry
Add condensed entry (~8 lines max):
```
### Session #XX Complete ([Date])
[Brief title]
- [1-3 bullets of what changed]
- **Deployment**: vXXX (if applicable)
```

### 10. Cross-Project Coordination
*Skip if not applicable.*

**HARD RULE**: Update your OPERATIONAL STATE row in the contract — every session, not just on deploy. Include current version, session number, and integration notes (or "No integration changes").

- Update IMPLEMENTATION STATUS for approved items completed
- Note integration surface changes in the contract's CURRENT INTEGRATION section
- Write OBS for cross-project issues discovered during this session:
  - Data quality issues in what the other project provides
  - Client-side workarounds for the other project's API behavior
  - Changes to how you consume integration data that the other project should know about
  - Integration surface changes that could break the other project silently
  - Format: `### OBS-NNN: [title] ([project] #session)` — check the last OBS number in the contract and increment

### 11. Settings Hygiene Check

Quick size check on `settings.local.json`:
```bash
python3 -c "import json; d=json.load(open('.claude/settings.local.json')); n=len(d.get('permissions',{}).get('allow',[])); print(f'{n} permission entries')"
```

If >50 entries, flag for review:
- Scan for inline credentials (API tokens, admin keys, account IDs in Bash commands)
- Look for clusters of specific commands replaceable by a broad pattern
- Remove one-off commands that will never run again (specific commit messages, specific payloads)

See `patterns/Settings-Hygiene.md` for the full protocol. Don't block session-end on this — just flag it.

### 12. Final Checklist

Assemble this checklist from the ledger outcomes above. It is a receipt of what ran, not a fresh recitation; every line should trace to a `[N/M]` outcome.

```
## Session End Checklist

Work Tracking:
- [✓/✗] Each CURRENT PRIORITY reconciled (✅/⏳/➖)
- [✓/✗] Completed items moved to COMPLETE
- [✓/✗] Session Progress NEXT pointer is specific
- [✓/✗] UPCOMING SESSIONS has full prioritized plan (not just titles)
- [✓/✗] Deferred items tracked (if any bumped)
- [✓/✗] Open discussions captured (if any)

Verification:
- [✓/✗/N/A] Code paths tested (not just implemented)
- [✓/✗/N/A] Evidence of testing documented
- [✓/✗/N/A] Impact radius assessed (existing data, silent failure, growth consistency)

Documentation:
- [✓] CLAUDE.md updated (progress, queue, metrics)
- [✓/N/A] Other docs flagged for update
- [✓/N/A] Privacy audit (public repos only)

Hygiene:
- [✓/N/A] Settings hygiene (if >50 entries)
- [✓/N/A] Working contract updated
- [✓/N/A] Size check (GREEN/YELLOW/RED)

Ready to close:
1. Review CLAUDE.md changes
2. Commit if appropriate

**Session complete. Safe to exit.**
```

**Session-close commit convention (advisory)**: when committing the close, carry the state in the message: session number, CLAUDE.md size transition (e.g. `YELLOW 33.6k → GREEN 29.9k`), and the NEXT pointer. The git log becomes a session-by-session health record, readable at a glance without opening CLAUDE.md.

## Important Notes

- **Never commit CLAUDE.md to git** unless the project explicitly tracks it in version control
- **Verification first** — don't mark complete without testing evidence
- **Deferred work visibility** — always update status of touched items
- **Capture discussions** — open threads get lost without explicit tracking
- **Size discipline** — keep CLAUDE.md under 35k characters (standard profile)
- **Automation option**: Hygiene checks (git status, size, documentation staleness) can be automated with `.claude/hooks/session-end.sh`. See `templates/hooks/` for the pattern.
