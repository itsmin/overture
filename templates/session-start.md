# Session Start

> **Audience**: Claude Code — this is a slash command Claude runs when you type `/session-start`. You invoke it; Claude follows the instructions.

Load project context and present current state.

## Instructions

Read this project's CLAUDE.md, then work through each applicable step below.
Skip steps that reference sections your CLAUDE.md doesn't have yet — not all projects use all sections.

### 1. Metrics Validation
*Skip if no Current Metrics table exists.*
Quick-check metric values against their listed sources of truth. Flag discrepancies — don't silently accept stale numbers.

### 2. Documentation Health
*Skip if no Documentation Reference table exists.*
Check for staleness. Files not updated in >7 days get a warning. This is a signal, not a blocker — note it and move on.

### 3. Deferred Work
Present any bumped items from the Deferred Work section. Items deferred for many sessions should be flagged for re-evaluation — park them explicitly or promote them.

### 4. Pending Verifications
Surface any pending verification items from Session Progress. Check anything that can be verified now.

### 5. Cross-Project Coordination
*Skip if this project doesn't participate in coordination.*
Read the working contract. Check APPROVED WORK and IMPLEMENTATION STATUS for items requiring this project's implementation.

### 6. Work Queue
Present current priorities from the Work Queue section.

### 7. Alignment
Ask: "Before diving in — does today's work advance the project's current goals, or is there something more pressing?"

Then: **"Session context loaded. Ready to work."**
