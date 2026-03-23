# [Project Name] — Documentation & Status

## PRODUCT STATUS

**[Project Name]** is [shipped / in development / prototype].

- **Stage**: [MVP / Soft Launch / Production / Prototype]
- **Users**: [Who uses this, how many, what stage of adoption]
- **Stack**: [Key technologies — language, framework, database, hosting]
- **Infrastructure**: [Where it runs, approximate monthly cost]

---

## COLLABORATION GUIDELINES

Universal working preferences in `~/.claude/CLAUDE.md`.

**Project-Specific Guidelines**:
1. [Rule specific to this project]
2. [Another project-specific rule]
3. [Guidelines that encode lessons learned from past sessions]

<!-- Add a Cross-Project Coordination subsection here if this project
     participates in multi-project coordination. See the Overture workflow
     framework for the pattern. -->

---

## CURRENT METRICS (Sources of Truth)

| Metric | Value | Source of Truth |
|--------|-------|-----------------|
| [Metric 1] | [Value] | [Authoritative file or system] |
| [Metric 2] | [Value] | [Authoritative file or system] |

**Last Validated**: [Date] (Session #XX)

---

## SESSION WORKFLOW

### At `/session-start`:
1. Present work queue from this document
2. Check deferred work — review items bumped in previous sessions
3. Note any in-progress work from Session Progress
4. Wait for direction

### During session:
- Stay aligned with work queue unless redirected
- Monitor context usage — find clean stopping points proactively
- Web search to validate approaches when uncertain

### Before `/session-end`:
- Update Session Progress if mid-implementation
- Documentation Sync Check (see session-end command)
- Add bumped items to Deferred Work
- Commit changes if appropriate

---

## SESSION PROGRESS

*Updated each session if work is in progress. Cleared when complete.*

**Current**: Session #1 pending
**Status**: Initial setup

### Pending Verifications

<!-- Items that need checking in future sessions — things that require
     a deploy cycle, user test, or time delay to verify. -->

---

## WORK QUEUE

### CURRENT PRIORITIES

**P1: [First Priority]**
- [Details, context, approach]

### COMPLETE (Recent)

| Feature | Session | Notes |
|---------|---------|-------|
| Initial setup | #1 | Project CLAUDE.md created |

### P2: [FUTURE WORK]

[Planned work that isn't the current priority]

### PARKING LOT

| Item | Reason |
|------|--------|
| [Item] | [Why it's parked — not just "later"] |

---

## DEFERRED WORK

<!-- Categorize by domain as the project matures.
     Example categories: UX/Product, Infrastructure, Data Quality, Security -->

| Item | Originally From | Context |
|------|-----------------|---------|
| *(none yet)* | | |

---

## CRITICAL REMINDERS

<!-- Hard rules. NEVER/ALWAYS invariants. Short, absolute, rarely updated.
     Add these as lessons are learned. -->

1. **NEVER** [dangerous thing to avoid]
2. **ALWAYS** [essential thing to maintain]

---

## DEVELOPMENT WORKFLOW

### Deployment

```bash
# [Deployment commands]
```

### Environment

<!-- Environment variables, tools, account management notes -->

---

## DOCUMENTATION REFERENCE

| Document | Path | Last Updated | Content |
|----------|------|-------------|---------|
| [Doc name] | `path/to/doc.md` | [Date/Session] | [Brief description] |

---

## SESSION ARCHIVES

<!-- When CLAUDE.md grows past ~40k characters, archive old session entries here.
     Archive session history, not work queue or metrics — those stay as living sections. -->

| Archive | Sessions | Period |
|---------|----------|--------|
| *(none yet)* | | |

---

**Last Updated**: [Date]
