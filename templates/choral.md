# Choral Sync — Integration Contracts

> **Audience**: Claude Code — this is a slash command Claude runs when you type `/choral`. You invoke it; Claude follows the instructions. Copy to your project's `.claude/commands/choral.md` and customize the contract path.

Read the working contracts and surface any work relevant to this project.

## Instructions

### 1. Read the Contracts

Read each contract this project participates in. If a file doesn't exist, skip it.

For each contract, focus on:
- **BLOCKERS** -- items where this project is blocked or blocking
- **OBSERVATIONS** -- findings that affect this project (informational, not prescriptive)
- **APPROVED WORK** -- items owned by this project
- **IMPLEMENTATION STATUS** -- what's already been shipped
- **OPERATIONAL STATE** -- is the other project's state what you expect?

### 2. Identify Pending Work

Cross-reference APPROVED WORK against IMPLEMENTATION STATUS. An item is pending if:
- It appears in APPROVED WORK with Owner = this project
- It has no COMPLETE entry in IMPLEMENTATION STATUS (or is missing entirely)

### 3. Present

If there are blockers:
```
## Choral -- [project] is blocked

| Blocker | Blocking Project | Since | Notes |
|---------|-----------------|-------|-------|

[Items from BLOCKERS table. These are cross-project dependencies this project is waiting on.]
```

If there's pending work:
```
## Choral -- Pending for [project]

| Item | Priority | Notes |
|------|----------|-------|

These are approved recommendations from the coordination session. You have full authority
to push back on the integration approach, adjust how it fits into your architecture, or
satisfy the intent differently. The coordinator reads both codebases but doesn't live in either.

If you deviate from the spec, note what changed in IMPLEMENTATION STATUS.
```

If no blockers and nothing pending:
```
## Choral -- [project] is current

No pending approved work or blockers.
```

### 4. Context

For each pending item, read the full recommendation in the contract. Provide a 2-3 sentence summary of what the coordinator proposed and why. Point to the contract for details.

Check IMPLEMENTATION STATUS and OPERATIONAL STATE for dependencies -- if the other project hasn't shipped their side yet, flag it.

### 5. Cross-reference Check

Scan your CLAUDE.md for references to cross-project dependencies (e.g., "blocked on [project]", "waiting on [project] deploy"). Verify each against the contract's BLOCKERS and OPERATIONAL STATE.

If a dependency has been resolved, flag it: "Stale reference in CLAUDE.md: [quote] -- contract shows this is resolved."

### 6. Operational State Sync

If your OPERATIONAL STATE row in the contract is stale (wrong deploy info, old session number), update it now.

### 7. Write Observations (if applicable)

If this session discovered cross-project issues, write an OBS to the contract:
- Data quality issues in what the other project provides
- Client-side workarounds for the other project's API behavior
- Changes to how you consume integration data that the other project should know about
- Integration surface changes that could break the other project silently

Format: `### OBS-NNN: [title] ([project] #session)` with Found date, Status, Affects, description, and recommendation. Check the last OBS number in the contract and increment.

*Customize this trigger list for your project's role in the integration -- what you produce vs. what you consume will differ by project.*

### 8. Clear Signals

Delete signal files for this project if they exist (e.g., `[coordinator]/signals/[project].signal`) -- you've synced.

## Important
- This is orientation, not a work order. Present information and let the user decide priority.
- Don't start implementing -- just surface what's there.
- If a contract file doesn't exist or is unreadable, say so and move on.
- Recommendations are architectural guidance with full autonomy on implementation approach.
- OBS-writing makes projects first-class participants in the coordination loop -- not just readers of the coordinator's findings.
