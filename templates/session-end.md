# Session End

> **Audience**: Claude Code — this is a slash command Claude runs when you type `/session-end`. You invoke it; Claude follows the instructions.

Ensure clean handoff to the next session.

## Instructions

### 1. Session Summary
Summarize what was accomplished this session. Be specific — what changed, what was deployed, what was decided.

### 2. Privacy Audit (if public repo)
*Skip if the repo is private.*
Before committing, grep modified files for: absolute machine paths, email addresses, API keys/tokens, proprietary details that shouldn't be public. Fix before committing.

### 3. Documentation Sync Check
Did this session change any documented domain? Check each that applies to your project:
- [ ] Configuration or pricing → Update config (source of truth) + docs
- [ ] Data, entities, or schemas → Update architecture docs
- [ ] Infrastructure or costs → Update cost/infra docs
- [ ] Automation or background services → Update automation docs

*Customize this checklist to your project's actual domains. The point isn't the specific items — it's the habit of asking "did this session change anything that's documented elsewhere?"*

### 4. Deferred Work Check
Were any planned items bumped or deferred this session? If yes:
- Add each to the Deferred Work table in CLAUDE.md
- Include: what it was, which session it came from, and context needed to resume
- Never let a planned item disappear silently

### 5. Update CLAUDE.md

#### Session Progress
- Update the "Current" line with this session's number and brief status
- Add a condensed session entry (~10 lines max): title, key outcomes, deployment info
- Add any items to Pending Verifications that need checking in future sessions

#### Work Queue
- Move completed items from CURRENT PRIORITIES to COMPLETE (Recent)
- Promote next priority if current work is done

#### Metrics
*Skip if no Current Metrics table exists.*
- Update values if any changed this session
- Update "Last Validated" date

#### Size Check
- If CLAUDE.md is approaching ~40k characters, archive old session entries to a separate file

### 6. Cross-Project Coordination
*Skip if this project doesn't participate in coordination.*
If you implemented any approved items from the working contract, update IMPLEMENTATION STATUS with session number and notes.
If you changed any integration surface (APIs, URL patterns, data models), note the change in the contract's CURRENT INTEGRATION section.

### 7. Final Checklist
- Privacy audit: [clean / N/A (private repo)]
- Documentation sync: [done / N/A]
- Deferred work tracked: [done / none bumped]
- Commit ready: [yes / no — reason]

**Session complete. Safe to exit.**
