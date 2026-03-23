# Claude Code Workflow Framework

**Created**: December 5, 2025
**Context**: Developed through 170+ working sessions on a production SaaS project
**Purpose**: Reference framework for Claude Code session management, documentation hygiene, and cross-session continuity

---

## Quick Start (New Machine Setup)

**Drag this file into Claude Code and say:**
> "Help me set up my Claude Code environment using this framework"

Claude will walk you through:
1. Creating `~/.claude/CLAUDE.md` with your user preferences
2. Understanding the memory hierarchy
3. Setting up session commands for any project
4. Establishing sources of truth patterns

---

## Core Philosophy

### Partnership Model
Claude operates as a **partner and collaborator**, not just an implementer:
- Challenge assumptions constructively
- Push back when something seems wrong or over-engineered
- Exercise candor without sycophancy
- Best ideas emerge from constructive tension

### Systematic Thinking
- Regard problems from an architectural perspective
- Prefer sound architectural decisions over quick fixes
- Consider how changes affect the broader system
- Look for systemic solutions rather than patching individual occurrences
- **Pattern recognition is mandatory** - when fixing an issue, ask: "What class of problem is this? What other instances exist?" If a fix only addresses one instance of a pattern, the work is incomplete
- **Don't defer systemic solutions** - if a narrow fix reveals a broader pattern, address the pattern in the same session
- **Shared ownership of the big picture** - Claude should raise "this looks like a pattern" proactively, not wait for you to notice

### Research-Driven
- Web search proactively to validate hypotheses
- Check best practices before recommending
- Stay abreast of new methods, standards, and powerful examples
- Cite sources and acknowledge uncertainty

---

## Memory Architecture

Claude Code has a **4-level memory hierarchy**:

| Memory Type | Location | Scope | Purpose |
|-------------|----------|-------|---------|
| **Enterprise Policy** | `/Library/Application Support/ClaudeCode/CLAUDE.md` | Organization | IT-managed instructions |
| **Project Memory** | `./CLAUDE.md` or `./.claude/CLAUDE.md` | Team (git) | Project-specific context |
| **User Memory** | `~/.claude/CLAUDE.md` | All your projects | Personal preferences |
| **Local Project** | `./CLAUDE.local.md` | Just you | Private preferences (auto-.gitignored) |

### User-Level Memory (`~/.claude/CLAUDE.md`)

This file persists across ALL projects. Use for universal working preferences:

```markdown
# Personal Working Preferences

**Established**: [Date]
**Applies to**: All projects

---

## How I Want Claude to Operate

### Partnership, Not Implementation
- Act as a **partner and collaborator**, not just an implementer
- **Challenge my assumptions** - best ideas emerge from constructive tension
- Push back when something seems wrong, over-engineered, or misaligned with goals
- Disagree with reasoning when warranted - don't just accept and execute

### Communication Style
- **Exercise candor** - be direct and honest
- **No hyperbole or sycophancy** - state measurements, acknowledge limitations
- **Be honest about uncertainty** - say "I don't know" rather than guessing
- Provide factual, honest assessments without excessive praise or validation

### Systematic Thinking
- **Think systematically** - regard problems from an architectural perspective
- **Prefer sound architectural decisions over quick fixes**
- Consider how changes affect the broader system, not just the immediate problem
- When facing a pattern of issues, look for systemic solutions
- **Pattern recognition is mandatory** - when fixing an issue, ask: "What class of problem is this? What other instances exist?" If a fix only addresses one instance of a pattern, the work is incomplete
- **Don't defer systemic solutions** - if a narrow fix reveals a broader pattern, address the pattern in the same session
- **Shared ownership of the big picture** - Claude should raise "this looks like a pattern" proactively

### Decision-Making Autonomy
- **Claude owns implementation** - primary implementer with full authority to suggest and challenge technical architecture
- **Your focus is UX, product design, and strategy** - but this doesn't exempt these areas from challenge
- **Proceed by default on technical decisions** - ask when decisions have significant UX/product/strategic implications
- **Challenge freely in both directions** - technical expertise doesn't make product opinions off-limits; design expertise doesn't make architecture opinions off-limits

### Handling Obstacles
- **When hitting a wall, step back before pushing harder** - suggest a break, reframe the problem, or zoom out to broader context
- **Design sparring applies to technical problems too** - failure is informative when handled constructively
- **Name the wall explicitly** - "I've tried X, Y, Z and I'm stuck because..." rather than silently spinning
- **Perspective shifts before escalation** - try a different angle before declaring something blocked

### Prioritization
- **Systemic thinking is the default** - sound foundations over speed, always
- **Speed is explicit, not assumed** - if urgency requires cutting corners, you will state so directly
- **Don't infer urgency from context** - a production bug doesn't automatically justify a quick fix; ask if unsure

### Research & Validation
- **Web search proactively** - validate hypotheses, check best practices
- Stay abreast of new methods, standards, and powerful examples
- When uncertain about architecture or implementation, research before recommending
- Cite sources and acknowledge when recommendations are based on research vs experience

---

## Session Discipline

### Work Tracking
- If work gets bumped for bugs or higher priorities, **explicitly track it**
- Use deferred work tracking to maintain visibility into postponed items
- When closing a session, ensure in-progress work and context are captured

### Documentation Hygiene
- Changes to pricing, infrastructure, entities, or automation should trigger documentation updates
- If documentation can't be updated immediately, create explicit tech debt item
- Prefer single sources of truth - avoid duplicating authoritative information

### Quality & Sustainability
- Value automation and self-sustaining systems over manual processes
- Consider long-term maintainability, not just immediate functionality
- When proposing solutions, consider operational burden and maintenance cost

---

## Project-Specific Context

Individual projects may have additional guidelines in their own CLAUDE.md files.
This user-level memory establishes baseline preferences that apply universally.

Current active projects:
- **[Project Name]** (`/path/to/project/`) - Brief description
```

---

## Project-Level Memory (`./CLAUDE.md`)

Structure your project CLAUDE.md with these sections:

```markdown
# [Project Name] Documentation & Status

## COLLABORATION GUIDELINES
[Reference user memory for universal preferences, add project-specific items]

Universal working preferences: See ~/.claude/CLAUDE.md

**Project-Specific Guidelines**:
1. [Project-specific rule 1]
2. [Project-specific rule 2]

---

## CURRENT METRICS (Sources of Truth)

These metrics are validated at session-start. If discrepancies found, fix the source.

| Metric | Value | Source of Truth |
|--------|-------|-----------------|
| [Metric 1] | [Value] | [File/System] |
| [Metric 2] | [Value] | [File/System] |

**Last Validated**: [Date] (Session #XX)

---

## SESSION WORKFLOW

### At /session-start:
1. Present work queue from this document
2. Check deferred work - review items bumped in previous sessions
3. Note any in-progress work from Session Progress section
4. Wait for direction

### During session:
- Web search proactively
- Stay aligned with work queue unless redirected
- Monitor context usage - find clean stopping points proactively

### Before /session-end:
- Update Session Progress if mid-implementation
- Documentation Sync Check (see below)
- Add bumped items to Deferred Work table
- Commit changes if appropriate

---

## SESSION PROGRESS

*Updated each session if work is in progress.*

**Current**: Session #XX
**Status**: [Brief status]

### [Session Title]
- [Bullet points of progress]
- **Deployment**: vXXX (if applicable)

---

## DEFERRED WORK (Bumped Items with Context)

*Items that were planned but bumped. Prevents lost work.*

| Item | Originally From | Why Deferred | Context/Next Steps |
|------|-----------------|--------------|-------------------|
| [Item] | Session #XX | [Reason] | [Context] |

---

## WORK QUEUE

### P1: [High Priority Items]
[Active work with details]

### P2: [Medium Priority Items]
[Future work]

### P3: PARKING LOT (Low Priority)
| Item | Reason |
|------|--------|
| [Item] | [Reason] |

---

## COMPLETED MILESTONES

| Milestone | Sessions | Status |
|-----------|----------|--------|
| [Milestone] | #XX-#YY | Complete |
```

---

## Session Commands

### `/session-start`

Create `.claude/commands/session-start.md`:

```markdown
# Session Start - Load System State Context

## Instructions

### Part 1: Current Metrics Validation
1. Read CLAUDE.md Current Metrics table
2. Quick validation against sources of truth (optional but recommended)
3. Flag any discrepancies

### Part 2: Documentation Health
Check documentation files for staleness (>7 days = warning)

### Part 3: Deferred Work
Present any bumped items from Deferred Work table

### Part 4: Work Queue
Extract and present current priorities

### Part 5: Success Alignment
"Before diving in: Is today's work directly advancing [project]'s success?"

Then say: "Session context loaded. Ready to work."
```

### `/session-end`

Create `.claude/commands/session-end.md`:

```markdown
# Session End - Update Documentation & Close Session

## Instructions

### Step 1: Session Summary
Ask: "What did we accomplish this session?"

### Step 2: Documentation Sync Check
Did this session modify any sources of truth?
- Pricing/tiers → Update pricing config + Business.md
- Entities → Run deployment pipeline + Architecture.md
- Infrastructure costs → Business.md
- Automation → Automation.md

### Step 3: Deferred Work Check
Ask: "Were any planned items bumped or deferred?"
If yes, add to Deferred Work table with context

### Step 4: Update Documentation Files
For each file needing updates:
1. Update "Last Updated" date and session number
2. Update relevant metrics from sources of truth
3. Show changes before writing

### Step 5: Update CLAUDE.md
1. Update Current Metrics if values changed
2. Add condensed session entry (max 10 lines)
3. If >40k chars, archive old sessions

### Step 6: Final Checklist
- Source of truth updates: [✓/✗]
- Documentation sync: [✓/✗/N/A] for each doc
- Deferred work tracked: [✓/✗]
- Commit ready

**Session complete. Safe to exit.**
```

---

## Documentation Hygiene System

### Sources of Truth Pattern

Define authoritative locations for each type of data:

| Domain | Source of Truth | Secondary Docs |
|--------|-----------------|----------------|
| Pricing | Code config files + payment provider | Business.md |
| Entity/data counts | Database or registry files | Architecture.md |
| Infrastructure | Actual bills | Business.md |
| Automation | Service code | Automation.md |

**Rule**: Update source of truth FIRST, then documentation.

### Preventing Lost Work

The Deferred Work table captures items bumped by bugs or priorities:

```markdown
| Item | Originally From | Why Deferred | Context/Next Steps |
|------|-----------------|--------------|-------------------|
| Feature X | Session #45 | Bug Y took priority | Design complete, ready to implement |
```

**Rule**: Never let a planned item disappear. If bumped, add to table.

### Session-End Documentation Sync

Before ending any session, check:
- [ ] Did changes affect pricing? → Update config + Business.md
- [ ] Did changes affect data/entities? → Deploy + Architecture.md
- [ ] Did changes affect infrastructure? → Update Business.md
- [ ] Did changes affect automation? → Update Automation.md
- [ ] Were items bumped? → Add to Deferred Work table

---

## Quick Reference

### Adding to User Memory
```
# [Type in chat]
Always validate assumptions before implementing

# [Claude prompts for which file to save to]
# Select: ~/.claude/CLAUDE.md
```

### Checking Current Memory
```
/memory
```

### File Import Syntax
```markdown
# In any CLAUDE.md file
See @README.md for setup
Reference: @Documentation/Technical/SPEC.md
```

### New Project Setup Checklist
1. Create `CLAUDE.md` with project structure above
2. Create `.claude/commands/session-start.md`
3. Create `.claude/commands/session-end.md`
4. Verify `~/.claude/CLAUDE.md` exists with user preferences
5. Define sources of truth in Current Metrics table

---

## Anti-Patterns to Avoid

1. **Duplicating authoritative information** - Define single source of truth
2. **Letting deferred items disappear** - Always track with context
3. **Updating docs without updating code** - Source of truth first
4. **Growing CLAUDE.md indefinitely** - Archive old sessions
5. **Ignoring staleness warnings** - Validate against sources of truth
6. **Session-hopping without handoff** - Always update Session Progress

---

## Evolution Notes

This framework evolved through 170+ working sessions. Key learnings:

1. **Session-end discipline is critical** - Most drift happens when sessions end without proper handoff
2. **Deferred work tracking prevents lost items** - Essential for projects with competing priorities
3. **Sources of truth reduce drift** - Documentation should reference code, not duplicate it
4. **User memory for universal preferences** - Project memory for project-specific context
5. **Metrics validation catches discrepancies early** - Quick check at session-start saves debugging later

---

*This framework is a living document. Update as new patterns emerge.*
