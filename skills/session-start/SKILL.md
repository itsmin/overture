---
name: session-start
description: Load project context and present current state at the beginning of a working session. Reads the operating document, checks health, surfaces deferred work, and presents the work queue. Use at the start of every session.
metadata:
  author: Min Chang
  version: 1.0.0
  license: MIT
---

# Session Start

Load project context and present current state.

## Instructions

Read this project's operating document, then work through each applicable step.
Skip steps that reference sections your operating document doesn't have yet — not all projects use all sections.

Steps 0-2 are project-specific (customize or skip freely). Steps 3-7 are the structural backbone shared across projects.

**Project-specific customizations are authoritative.** Before executing the flow below, locate the operating document's `SESSION WORKFLOW` section (the `At /session-start:` subsection or equivalent). Any steps listed there are MANDATORY — they encode project-specific checks the generic framework can't know about (kit tables, schema docs, deployment endpoints, domain health). Merge them into the flow: when a project step and a generic step overlap, the project step wins; when the skill has something the operating doc doesn't, keep it. Don't skip project customizations because they're not in this skill — they exist because someone learned the hard way that the generic flow missed something.

### 0. Clean State

Before loading context, ensure the workspace is ready.

1. **Uncommitted work**: Run `git status`. If there are uncommitted changes from a prior session, commit them now.
2. **Unpushed/undeployed**: Check for commits that haven't been pushed or deployed. Handle as appropriate for the project.
3. **Clean working state**: Verify the project builds/runs if quick to check. Don't block on this — flag and move on.

*This is mechanical, not judgment work. If something needs a decision, note it and handle during the session.*

**Queue hygiene signal**: Check `Last queue hygiene` in Session Progress. If it's been 3+ sessions, surface a reminder:
> "Queue hygiene last performed Session #N (X sessions ago). Consider reviewing priorities before diving into work."

*Don't force it — just surface the signal. The user decides whether to act on it.*

### 1. Metrics Validation
*Skip if no Current Metrics table exists.*

Quick-check values against their listed sources of truth. Flag discrepancies — don't silently accept stale numbers.

**What to check depends on the project**:
- Web app: entity counts, deployment version, database row counts
- Content site: page counts, asset counts, cache version
- Platform: user counts, API usage, error rates
- Service: health endpoint, memory, uptime

If checks aren't practical (no DB access, service down), note it and move on. Don't block session start.

### 2. Project Health
*Skip if the project has no health signals worth checking.*

**First, execute any project-specific health checks listed in the operating document's SESSION WORKFLOW section.** Those are authoritative. The examples below are defaults for projects that haven't customized — not a replacement for the project's own list.

Domain-specific health checks. Examples:

- **Git status**: Branch, clean/dirty state, unpushed commits
- **Type checking / lint**: Quick check (timeout after 15 seconds)
- **Deployment health**: Hit a health endpoint, check status
- **Documentation staleness**: Files not updated in >7 days get a warning
- **Active sessions/queues**: Check for in-progress work from external systems

Present results. If any check fails, flag it but don't block.

### 3. Deferred Work

Present bumped items from the Deferred Work section.

```
## Deferred Work

| Item | Session | Status | Context |
|------|---------|--------|---------|
| [items from table] |

Items deferred in previous sessions. Consider if any should be prioritized today.
Items deferred for many sessions should be flagged for re-evaluation — park explicitly or promote.
```

If no deferred items, skip this section.

### 4. Pending Verifications

Surface pending verification items from Session Progress. These are deployed changes awaiting live validation.

Check anything that can be verified now. Flag items that have been pending for multiple sessions — they may need to be dropped or re-queued.

### 5. Cross-Project Coordination
*Skip if this project doesn't participate in coordination.*

Read the working contract. For each contract this project participates in:

1. Check OPERATIONAL STATE — is the other project's state what you expect?
2. Scan BLOCKERS for items blocking this project.
3. Scan APPROVED WORK for items owned by this project. Cross-reference against IMPLEMENTATION STATUS — filter out COMPLETE items.
4. Check for integration drift signals.

If blockers, pending items, or stale references exist, display them. Otherwise skip silently.

### 6. Work Queue

**CRITICAL**: The previous session may have completed work without updating the queue. Cross-reference:

1. Read Session Progress — what does the NEXT pointer say?
2. Read CURRENT PRIORITIES from the operating document.
3. Run `git log --oneline -10` — do recent commits suggest a priority was addressed?
4. Flag mismatches between the queue and what git shows.

Present all items organized by priority:

```
## Work Queue

### NEXT (from Session Progress)
- **[Item]** — [brief context]

These were explicitly queued at the end of the last session.
The NEXT pointer is the most important item — display it first, separately.

### Upcoming Sessions (from UPCOMING SESSIONS)
[Full prioritized plan with reasoning — present as-is, don't compress]

### Current Priorities
**P1**: [items with status]

### Backlog
**P2**: [items]

### Parking Lot
[Low priority items — brief list]
```

Display ALL work queue items — do not summarize or truncate.

**Handoff quality check**: After assembling the queue, assess the handoff from the last session:
- Does UPCOMING SESSIONS exist and contain prioritized candidates with reasoning? Or is it a flat list of titles / a compressed one-liner?
- Is the NEXT pointer specific (e.g., "Auth middleware + tenant config") or vague (e.g., "Continue P1 work")?
- If the handoff is vague or missing, flag it: *"Last session's planning detail may not have survived into the operating document. Consider reviewing recent session history or git log for context before choosing direction."*

### 7. Alignment

Ask: "Before diving in — does today's work advance the project's current goals, or is there something more pressing?"

Then: **"Session context loaded. Ready to work."**

## Notes

- This is context loading for session continuity — keep it concise
- Display ALL work queue items, do not truncate
- Health checks should be fast (timeout after 15 seconds)
- Flag discrepancies, don't silently accept them
- Deferred work visibility prevents lost work
- **Automation option**: Steps 0-2 can be automated with session hooks. See the Overture hook templates for the pattern.
