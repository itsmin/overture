# Privacy Boundary — PII Filtering at Public Surfaces

**Part of**: [Overture](../README.md) — the Claude Code working kit
**Companion**: [Data Authority](Data-Authority.md) — single source of truth for derived state

> **Audience**: You — reference this when building features that expose internal data to public surfaces.

Derived from a production incident (March 2026). A chat feature consuming schema data surfaced third-party names to public visitors. The PII wasn't in the code — it was in the data, rendered visible by an LLM intermediary with no filtering instructions.

---

## The Problem

Systems that consume personal data internally often expose public-facing surfaces — chat features, profile pages, APIs, search results. When the data contains PII (names, employers, collaborators, contact info), and a public surface consumes that data without filtering, the PII reaches visitors.

This is hard to catch because:

1. **The PII isn't in the code.** It's in the data the code consumes. No amount of grepping the commit catches it.
2. **LLM intermediaries generate output dynamically.** You can't predict what an LLM will say from its source data. It might mention a name once in fifty responses.
3. **Each layer works correctly in isolation.** The data is accurate. The LLM responds helpfully. The UI renders faithfully. The privacy violation lives in the seam between data and public output.
4. **It looks like a feature working well.** A chat that names real collaborators feels knowledgeable and specific. The quality signal masks the privacy signal.

---

## The Invariants

### 1. Declare Privacy Boundaries

Every project that handles PII and has public-facing surfaces must declare where data crosses from private to public. In the project's CLAUDE.md:

```markdown
## PRIVACY BOUNDARIES

| Data Source | Contains | Public Surface | Filtering |
|-------------|----------|----------------|-----------|
| user profiles | Third-party names, employers | Chat feature (/api/chat) | System prompt redaction |
| contact records | Email, phone | Public profile page | Server-side field filtering |
```

If a project handles personal data and has no declared boundaries, that's a gap — flag it.

### 2. Filter at the Boundary, Not After

PII filtering happens where data enters a public-facing context — not downstream in rendering, not upstream in storage. The boundary is the control point.

For LLM-powered features, the boundary is the system prompt and/or the data payload sent to the model. If the model receives unfiltered PII, it will eventually surface it. Prompt instructions ("don't mention names") are a mitigation, not a guarantee — prefer data-level redaction (strip names before they reach the model) over instruction-level filtering.

**Defense in depth**: Both layers when possible. Redact PII from the data payload AND instruct the model to use role-based references ("a former colleague") instead of names. Either alone is insufficient — models ignore instructions occasionally, and data redaction can miss edge cases.

### 3. LLM Output Is a Public Surface

If an LLM consumes PII-containing data and responds to unauthenticated users, its output is a public surface. This is true even if:
- The LLM is "just summarizing" internal data
- The feature is behind a UI that feels private
- The data was "already public" in some other context (social profiles, LinkedIn, etc.)

The test: can someone who isn't the data subject see the output? If yes, the output is a public surface. Third-party PII requires filtering regardless of the data's original provenance.

### 4. Pre-Deployment Verification for Boundary-Adjacent Changes

When committing or deploying changes that touch a declared privacy boundary — the data source, the public surface, or the code connecting them — verify PII filtering before the change goes external:

- **Data schema changes**: Does the new field contain PII? Does it flow to a public surface?
- **Prompt/system instruction changes**: Does the change weaken PII filtering?
- **New public surface**: Does it consume data that contains PII?
- **New data source**: Does it feed into an existing public surface?

### 5. Runtime Verification

Code-level review is necessary but not sufficient. PII exposure through LLMs is a runtime behavior — you need to test it:

- Query the feature with prompts designed to elicit PII ("who did X work with?", "name the people involved in Y")
- Verify the responses use generic references, not real names
- Test after prompt changes, data schema changes, and model updates

---

## When to Apply

- Any project where internal data contains third-party PII (names, contact info, employment history)
- Any project with LLM-powered features that consume personal data
- Any project with public APIs that serve data derived from personal records
- Any project where "the feature works great" might mask "the feature leaks PII"

## When NOT to Apply

- Projects with no public-facing surfaces (internal tools, CLI utilities)
- Projects that handle only the user's own data (no third-party PII)
- Projects where all data is already public by design (open datasets, public records)

---

## Relationship to Other Patterns

**Data Authority** (`Data-Authority.md`): Data authority governs where derived state is computed. Privacy boundary governs where PII is filtered. Both address seam-level failures — problems invisible to single-layer verification. Data authority asks "who owns this computation?" Privacy boundary asks "who owns this filtering?"

**End-to-end verification** (`~/.claude/CLAUDE.md` > Prioritization): The verification principle says trace source -> transformation -> API -> render. Privacy boundary adds a specific check to that trace: at each crossing, ask "does PII survive this boundary, and should it?"

**Session-end Privacy Audit** (`../templates/session-end.md` > Step 2): The existing audit catches hardcoded secrets in code (paths, keys, tokens). Privacy boundary catches PII exposure through data flows — a runtime concern that code-level scanning misses. Both are necessary; they cover different threat surfaces.
