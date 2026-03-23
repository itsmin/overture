# Session End

Ensure clean handoff to the next session.

## Instructions

### 1. Session Summary
Summarize what was accomplished this session. Be specific — what changed, what was deployed, what was decided.

### 2. Documentation Sync Check
Did this session change any documented domain? Check each:
- [ ] Pricing or tiers → Update pricing config (source of truth) + business docs
- [ ] Data, entities, or schemas → Run pipelines + update architecture docs
- [ ] Infrastructure or costs → Update cost docs
- [ ] Automation or background services → Update automation docs
<!-- Customize these domains to your project. -->

### 3. Deferred Work Check
Were any planned items bumped or deferred this session? If yes:
- Add each to the Deferred Work table in CLAUDE.md
- Include: what it was, which session it came from, and context needed to resume
- Never let a planned item disappear silently

### 4. Update CLAUDE.md

#### Session Progress
- Update the "Current" line with this session's number and brief status
- Add a condensed session entry (~10 lines max): title, key outcomes, deployment info
- Add any items to Pending Verifications that need checking in future sessions

#### Work Queue
- Move completed items from CURRENT PRIORITIES → COMPLETE (Recent)
- Promote next priority if current work is done
- Update NEXT SESSION pointer if applicable

#### Metrics
- Update Current Metrics if any values changed this session
- Update "Last Validated" date

#### Size Check
- If CLAUDE.md is approaching ~40k characters, archive old session entries to a separate file
- Add a row to the Session Archives table pointing to the archive

### 5. Cross-Project Coordination
<!-- Remove this section if the project doesn't participate in coordination. -->
If you implemented any approved items from the working contract, update IMPLEMENTATION STATUS with session number and notes.
If you changed any integration surface (APIs, URL patterns, data models), note the change in the contract's CURRENT INTEGRATION section.

### 6. Final Checklist
- Source of truth updates: [done / not needed]
- Documentation sync: [done / N/A] per doc
- Deferred work tracked: [done / none bumped]
- Commit ready: [yes / no — reason]

**Session complete. Safe to exit.**
