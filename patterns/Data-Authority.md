# Data Authority — Single Source of Truth for Derived State

**Part of**: [Overture](../README.md) — the Claude Code working kit
**Extracted from**: Production professional services platform — 119 sessions of active development before the pattern was identified
**Related**: [Workflow Framework](../workflow/Claude-Code-Workflow-Framework.md) — encode these invariants in your CLAUDE.md

> **Audience**: You — an architectural pattern. Claude doesn't read this file, but the invariants belong in your project's CLAUDE.md and collaboration guidelines.

---

## The Problem

Systems with multiple layers — data store, computation, display — tend to derive the same state independently in each layer. A backend compiles raw data into entities. A frontend receives raw data and re-compiles it into the same entities using parallel logic. Both paths produce the same result — until they don't.

When the backend evolves (new grouping logic, new merge rules, new entity types), the frontend's parallel derivation doesn't automatically follow. The result: silent display bugs, chimera entities, lost provenance. Each layer passes its own tests. The system fails at the seams.

This class of bug is invisible to layer-scoped verification. The compiler output is correct. The frontend renders what it receives correctly. The gap is between them.

---

## The Invariants

### 1. Single Authority

Every derived data state has exactly one authoritative computation. Document which module owns it. All consumers use its output — no consumer re-derives the same state from raw inputs.

**Test**: Search the codebase for the same grouping/aggregation/compilation logic. If it exists in two places, one must go. If a frontend component groups raw records by a key that the backend also groups by, the frontend is re-deriving.

### 2. No Re-Derivation by Consumers

Display surfaces consume compiled results. They never re-group, re-merge, or re-compile from raw data. If a consumer needs a different view (grouped by confidence instead of by entity), request a new compiled output — don't build local compilation.

**When this feels wrong**: "But the frontend only needs a subset — why send the full compiled output?" Because a subset computed locally is a re-derivation. Send the full compiled output and let the consumer filter, not re-compile.

### 3. Provenance Preservation at API Boundaries

When data crosses a boundary (backend to frontend, service to service), metadata that enables tracing back to the source must survive the crossing. Which session created this? What's the confidence? What's the trust tier? When was it created?

Stripping provenance at API boundaries (for payload size, for simplicity) breaks downstream consumers that need it for editing, verification, correction, and display differentiation. If provenance was needed to produce the data, it's needed to consume it.

### 4. Consumer Documentation

When a module computes derived state, document what reads from it — in the module itself, not in external docs:

```
CONSUMERS — update this list when adding new consumers:

compileEntities() → CompiledEntity[]:
  - Dashboard (src/pages/Dashboard.tsx)
  - API endpoint (src/routes/entities.ts)
  - Export pipeline (src/export/csv.ts)
```

This makes impact visible. When you change the compiler, the consumer list tells you what to verify.

### 5. End-to-End Verification

When modifying a data transformer, verify the change reaches the user's display surface. "The compiler output is correct" is not verification if no display surface renders the compiler output directly.

Trace: source → transformation → API → render.

Systems with data/computation/experience layers must be verified across all three — layer-scoped testing misses cross-layer failures that compound invisibly.

---

## How Bugs Hide

The production case: 119 sessions of active development. Each hardening session verified the compiler output. The compiler was correct. But the frontend had its own grouping function that re-derived entity grouping from raw records. When the compiler evolved (session-isolated name-keyed merging), the frontend didn't follow. Result: chimera entities (two companies merged into one display card), lost provenance (no session IDs on records), silent data misrepresentation.

Why it survived: every investigation verified one layer. "Are the records correct in the database?" Yes. "Does the compiler group them correctly?" Yes. "Does the frontend render what it receives?" Yes. Nobody traced the full path: database → compiler → API response → frontend re-derivation → render. The re-derivation was the gap, and it existed in the space between layers, invisible to any single-layer investigation.

---

## When to Apply

- Any system where backend computes derived state AND frontend also derives state from raw data
- Any system with a compilation/aggregation pipeline that feeds multiple consumers
- Any API that serves raw data which consumers then group, sort, or aggregate locally
- Any system where "the data is correct but the display is wrong" keeps recurring

## When NOT to Apply

- Simple CRUD where there's no derived state — display reflects storage directly
- Frontend-only applications where there's no backend derivation to duplicate
- Intentional denormalization for performance (but document it as an exception)

---

## Encoding in CLAUDE.md

These invariants belong in your project's Collaboration Guidelines or Critical Reminders:

```markdown
**Data Authority**:
- Backend compiler is single source of truth for [domain]. Frontend never re-derives.
- CONSUMERS list in [compiler module] must stay current.
- Changes to compilation logic require end-to-end verification: DB → compiler → API → render.
```

The consumer documentation invariant pairs with the general practice of checking for pattern instances when fixing bugs. When you fix a compiler bug, the consumer list tells you whether the fix is complete or only addresses one instance.

---

*This pattern is the architectural complement to end-to-end verification discipline. That discipline tells you how to verify. This pattern tells you how to structure systems so verification is possible and meaningful.*
