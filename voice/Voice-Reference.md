# Voice Reference

**Companion to**: [Voice Framework](Voice-Framework.md)
**Purpose**: Detailed session structure, derivation approach, and encoding patterns for voice work
**Part of**: [Overture](../README.md) — the Claude Code working kit

> **Audience**: You — detailed reference for voice derivation sessions. Companion to the [Voice Framework](Voice-Framework.md).

---

## Session Structure for Voice Work

### Typical Flow

1. **Share intent** — What you're writing, what it's for, where it lives, who reads it
2. **Probing questions** — Clarifying prompts that narrow scattered thoughts into composable structure
3. **Raw writing** — Stream of consciousness, messy draft, wall of text. Don't self-edit yet.
4. **First pass** — Either an outline extracting from raw text, or a draft filling gaps. Specify which you want.
5. **Workshop areas** — Identify sections, lines, or ideas that don't land yet
6. **Iterate in conversation** — Options for lines that don't work, tightening, checking for voice consistency
7. **Working file** — Maintained throughout, updated as you go, portable across sessions
8. **Observe and recommend** — Ideas worth developing further, ideas to cut, work plan for what remains

This is the full flow. Enter at any step. Sometimes you arrive with a finished draft that needs voice review. Sometimes you start with a vague idea. The flow adapts.

### On the Working File

- Created early, updated as the session progresses
- Carries context from session to session — not version history. Optimize for memory, not record-keeping.
- If context is running low, update the file with current state, add a "Session Handoff" section (what's done, what's in progress, what's next), start a new session with the file.

### On Recommendations

- Candor without hyperbole. If something should be cut, say so and explain why.
- If an idea deserves its own piece, flag it — don't force it into the current structure.
- Work plan should be concrete: "These 3 sections are solid, this 1 needs workshopping, this idea might be a separate piece."

---

## Derivation Approach

Voice definitions aren't written from scratch — they're derived from iterative correction. The process:

### 1. Produce Content
Write or generate output in the target voice. Don't over-specify upfront. Let the model attempt its interpretation.

### 2. React to Failures
When output doesn't sound right, identify specifically what's wrong:
- "This sounds like LinkedIn thought leadership" → add to anti-patterns
- "We lost the punch in that revision" → note what the earlier version had
- "I'd never use a semicolon there" → add structural preference
- "Too polished — the edge is gone" → note that rawness is a feature

### 3. Identify Successes
When output nails it, note what worked:
- "That callback to the opening — keep that structural pattern"
- "The dry humor landing at the end of the thought — that's the rhythm"
- "The parenthetical aside — that's how I'd actually write this"

### 4. Encode Both

Failures become anti-patterns and banned phrases. Successes become sounds-like patterns and structural preferences. The voice definition grows from both directions.

### 5. Test and Refine

Apply the definition to new content. If the model still drifts, the definition has gaps — add specificity. If the model becomes overly constrained (safe, careful, stripped of personality), the anti-patterns are too aggressive — add positive patterns to balance.

---

## Encoding Patterns

### For Editorial Voice

The voice definition lives in a file the session loads. Structure:

```markdown
## Voice

### Sounds like:
- [Specific patterns — rhythm, sentence structure, personality markers]

### Doesn't sound like:
- [Specific anti-patterns with examples]

## Banned Phrases
- [Exact phrases to never use]

## Structural Preferences
- **Opens**: [How pieces begin — e.g., "Direct statement, no buildup"]
- **Flow**: [Sentence rhythm — e.g., "Commas over colons. Split for punch."]
- **Endings**: [How pieces close — e.g., "Memorable over informative"]
- **CTAs**: [Tone for calls to action — e.g., "Clear but self-aware"]

## Red Flags
- [Things to catch during review]
```

### For Agent / Product Voice

Voice rules embed in the agent's system prompt. Structure:

```markdown
## VOICE AND TONE

### Response Style
- [Length defaults, when to expand]
- [Formality level, personality markers]
- [Energy matching — how to adapt to user's tone]

### Behavioral Rules
- [What the agent volunteers vs. waits to be asked]
- [How uncertainty is communicated]
- [Boundaries — what the agent doesn't do or discuss]

### Guardrails
- [Hard content rules — fabrication, privacy, disclosure]
- [Banned phrases in this context]
- [Anti-patterns specific to this agent's role]

### Examples
#### Good response:
[Example that nails the voice]

#### Bad response:
[Same content, wrong voice — shows the contrast]
```

### For Documentation Voice

Lighter touch. Voice shows in what's included and excluded, not in flourishes:

```markdown
## Documentation Voice
- Direct. Lead with what the reader needs.
- Skip preamble. No "In this section, we will..."
- Use "you" not "the user" or "one"
- Code examples over prose explanations where possible
- Acknowledge gaps honestly — "This is unproven" over silence
```

---

## Voice Across Projects

When maintaining voice consistency across multiple projects or contexts, the challenge is keeping the underlying voice recognizable while adapting to different formats and audiences.

### What Stays Constant
- Core personality markers (directness, humor style, self-awareness level)
- Banned phrases (if you'd never say it in conversation, don't say it in a product)
- Honesty patterns (how uncertainty is handled, how gaps are acknowledged)

### What Adapts
- Length and density (essay vs. microcopy vs. agent response)
- Structural conventions (long-form has more room for asides; agents need brevity)
- Formality band (editorial might use casual language that's wrong for enterprise product UI)
- Guardrails (an editorial voice can be opinionated; a product agent has role-specific boundaries)

### The Test

Read the output without context. Can you tell it came from the same source? If an editorial post, an agent response, and a product notification all sound like they were written by the same person (or organization), the voice is consistent. If any one of them could have been written by anyone, voice has been lost in that context.

---

## Common Failure Modes

### Over-Specification
The voice definition is so detailed that the model writes cautiously, constantly checking itself. Output is technically compliant but lifeless. **Fix**: Add more positive patterns. Balance constraints with permissions.

### Under-Specification
The voice definition is abstract ("be professional but friendly"). The model defaults to generic AI prose. **Fix**: Add specific examples, banned phrases, and structural preferences.

### Correction-Only Derivation
Voice definition consists entirely of "don't do X" rules from past failures. The model knows what to avoid but not what to aim for. Output is safe but flat. **Fix**: Encode successes too. When something lands, add it to the sounds-like list.

### Context Collapse
The same voice definition is used verbatim across all contexts — editorial, agent, product UI. The result is long-form editorial personality in a 15-word error message. **Fix**: Create context-specific variations that share core voice principles but adapt expression.

### Fossilized Voice
The voice definition was written months ago and hasn't been updated. The actual voice has evolved through hundreds of sessions, but the definition reflects the state at definition-time. **Fix**: Treat the voice definition like any other living document. Update it when corrections reveal that the original definition no longer matches.

---

*Voice is a design material. It evolves through use, not through specification. Update this reference as patterns emerge.*
