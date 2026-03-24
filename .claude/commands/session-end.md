# Session End

Ensure clean handoff to the next session.

## Instructions

### 1. Session Summary
Summarize what was accomplished this session. Be specific — what changed, what was decided, what documents were created or updated.

### 2. Privacy Audit (Pre-Commit)
Before committing any changes, grep all modified files for sensitive content. This repo is PUBLIC.

Run these checks on all staged/modified files:
- `/Users/` or any absolute machine paths
- Email addresses, phone numbers, physical addresses
- API keys, tokens, credentials, secrets
- Proprietary details about specific products (internal architecture, API specs, database schemas, business logic beyond provenance-level context)

If anything is found: fix it before committing. Move operational content to `.claude/CLAUDE.local.md` (gitignored).

Provenance references are fine ("developed across production SaaS"). Specific internal details are not.

### 3. Documentation Sync Check
Did this session change any documented content? Check each:
- [ ] Kit file contents → Update CLAUDE.md "WHAT'S IN THE KIT" table if files were added, removed, or changed status
- [ ] Templates → Verify templates still match the patterns described in the workflow framework
- [ ] Cross-references → Verify links between documents are accurate after any renames or restructuring
- [ ] Superseded files → Update the superseded table if files were archived or new ones deprecated

### 4. Deferred Work Check
Were any planned items bumped or deferred this session? If yes:
- Add each to the Work Queue with appropriate priority
- Include: what it was, which session it came from, and context needed to resume
- Never let a planned item disappear silently

### 5. Update CLAUDE.md

#### Session Progress
- Update the "Current" line with this session's number and brief status
- Add a condensed session entry (~10 lines max): title, key outcomes
- Add any items to Pending Verifications that need checking in future sessions

#### Work Queue
- Move completed items appropriately
- Promote next priority if current work is done

#### Size Check
- If CLAUDE.md is approaching ~40k characters, archive old session entries to a separate file
- Add a row to the Session Archives table pointing to the archive

### 6. Final Checklist
- Privacy audit: [clean / fixed items]
- Documentation sync: [done / N/A] per area
- Deferred work tracked: [done / none bumped]
- Cross-references valid: [done / not checked]
- CLAUDE.md updated: [done]

**Session complete. Safe to exit.**
