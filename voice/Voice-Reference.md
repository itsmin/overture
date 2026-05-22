# Voice Reference

**Companion to**: [Voice Framework](Voice-Framework.md)
**Purpose**: Detailed session structure, derivation approach, and encoding patterns for voice work
**Part of**: [Overture](../README.md), the Claude Code working kit

> **Audience**: You. Detailed reference for voice derivation sessions. Companion to the [Voice Framework](Voice-Framework.md).

---

## Session structure for voice work

### Typical flow

1. **Share intent**: What you're writing, what it's for, where it lives, who reads it
2. **Probing questions**: Clarifying prompts that narrow scattered thoughts into composable structure
3. **Raw writing**: Stream of consciousness, messy draft, wall of text. Don't self-edit yet.
4. **First pass**: Either an outline extracting from raw text, or a draft filling gaps. Specify which you want.
5. **Workshop areas**: Identify sections, lines, or ideas that don't land yet
6. **Iterate in conversation**: Options for lines that don't work, tightening, checking for voice consistency
7. **Working file**: Maintained throughout, updated as you go, portable across sessions
8. **Observe and recommend**: Ideas worth developing further, ideas to cut, work plan for what remains

This is the full flow. Enter at any step. Sometimes you arrive with a finished draft that needs voice review. Sometimes you start with a vague idea. The flow adapts.

### On the working file

- Created early, updated as the session progresses
- Carries context from session to session. Memory, not version history.
- If context is running low, update the file with current state, add a "Session Handoff" section (what's done, what's in progress, what's next), start a new session with the file.

### On recommendations

- Candor without hyperbole. If something should be cut, say so and explain why.
- If an idea deserves its own piece, flag it. Don't force it into the current structure.
- Work plan should be concrete: "These 3 sections are solid, this 1 needs workshopping, this idea might be a separate piece."

---

## Derivation approach

Voice definitions aren't written from scratch. They're derived from iterative correction. The process:

### 1. Produce content
Write or generate output in the target voice. Don't over-specify upfront. Let the model attempt its interpretation.

### 2. React to failures
When output doesn't sound right, identify specifically what's wrong:
- "This sounds like LinkedIn thought leadership" → add to anti-patterns
- "We lost the punch in that revision" → note what the earlier version had
- "I'd never use a semicolon there" → add structural preference
- "Too polished. The edge is gone." → note that rawness is a feature

### 3. Identify successes
When output nails it, note what worked:
- "That callback to the opening, keep that structural pattern"
- "The dry humor landing at the end of the thought, that's the rhythm"
- "The parenthetical aside, that's how I'd actually write this"

### 4. Encode both

Failures become anti-patterns and banned phrases. Successes become sounds-like patterns and structural preferences. The voice definition grows from both directions.

### 5. Test and refine

Apply the definition to new content. If the model still drifts, the definition has gaps. Add specificity. If the model becomes overly constrained (safe, careful, stripped of personality), the anti-patterns are too aggressive. Add positive patterns to balance.

---

## Derivation by paired-sample diff

When a writer regularly drafts with AI assistance, their working corpus is fused. Sessions notes, commit bodies, design docs, even marketing copy carry both the writer's structural moves and the AI's default rhythms. A voice profile built from this corpus encodes the fusion, not the writer.

The paired-sample diff is the methodology for separating signal from fusion.

### The method

1. **Identify a piece written entirely by the human.** Personal essay, journal entry, an email composed without AI assistance, a piece explicitly produced AI-free. The longer the better, the more recent the better. This is the ground truth.

2. **Identify a piece on the same or adjacent topic that was AI-assisted.** A co-authored launch post, a blog draft polished by AI, a system summary the AI drafted that the human edited. Same writer, same time period, same general subject matter where possible.

3. **Diff them across a structured set of features**:
   - Em-dash count per 500 words
   - Rhetorical questions (count, role)
   - "Not X, but Y" constructions (count, formulaic vs. substantive)
   - Three-item lists (closure vs. lead-to-fourth)
   - Sentence-length distribution
   - Header-payload colons
   - Verdict-first openings
   - Soften-then-assert closers
   - Calibrated softeners (*basically, kinda, ironically, if I'm being honest*)
   - First-person depth (surface ownership vs. vulnerable rumination)
   - Listicle inflation
   - Copula substitution rate
   - Aesthetic adjectives in descriptive contexts

4. **Categorize each feature as one of**:
   - **Survives both**: present in human-alone and co-authored. This is structural skeleton, distinctly the writer's.
   - **Inflated in co-authored**: present in both but at much higher density in the AI-influenced sample. This is AI absorbing into the connective tissue.
   - **Stripped in co-authored**: present in human-alone but missing from AI-influenced. This is voice signal the AI smooths away.
   - **Foreign in co-authored**: present in AI-influenced but absent from human-alone. This is pure AI default.

5. **Encode each category in the voice profile.**
   - Survives both → positive patterns (sounds-like).
   - Inflated in co-authored → density caps ("em-dashes once per page, not three per paragraph").
   - Stripped in co-authored → patterns to actively encode (rhetorical questions when structural, vulnerable first-person, calibrated softeners).
   - Foreign in co-authored → anti-patterns (banned phrases, AI tells to avoid).

### What the diff catches that intuition misses

The fusion is hard to see without comparison. A writer reading their own co-authored output recognizes the structural moves as theirs and doesn't notice the punctuation rhythms underneath. A writer reading their own solo output finds it satisfying but can't articulate why. The diff makes both visible at once: same writer, same topic, two voices. The delta is the AI signal.

The methodology also catches register-shifts that single-sample analysis misses. A writer's solo prose may use rhetorical questions structurally, calibrated softeners freely, and aesthetic adjectives in descriptive contexts. Moves the AI-influenced output strips because they read as "too casual" or "too vulnerable" to the model. Encoding the stripped-out patterns is as important as banning the AI-defaults.

### When this is and isn't worth doing

Worth doing when:
- The writer regularly co-authors with AI and is shaping a voice profile that will guide future AI-assisted work.
- The voice is for editorial work where readers will pattern-match against AI-generic.
- The voice is for an AI agent that speaks on the human's behalf (representation, customer-facing).
- The corpus has visible AI-tells (em-dash density, vocabulary tells) that the writer didn't put there intentionally.

Not worth doing when:
- The writing is purely mechanical (logs, scripts, data processing) where voice isn't a design concern.
- The corpus is small enough that intuition can separate signal from fusion.
- The writer doesn't use AI assistance in the relevant work.

### Maintaining the diff

A voice profile derived this way needs periodic refresh. AI defaults evolve with model versions. A profile derived against GPT-4 defaults in 2024 may not catch the GPT-5 defaults in 2026. The paired-sample diff is repeatable. Run it again when the model partner changes substantially or when output begins to feel generic in ways the current profile doesn't catch.

---

## Encoding patterns

### For editorial voice

The voice definition lives in a file the session loads. Structure:

```markdown
## Voice

### Sounds like:
- [Specific patterns: rhythm, sentence structure, personality markers]

### Doesn't sound like:
- [Specific anti-patterns with examples]

## Banned Phrases
- [Exact phrases to never use]

## Structural Preferences
- **Opens**: [How pieces begin, e.g., "Direct statement, no buildup"]
- **Flow**: [Sentence rhythm, e.g., "Commas over colons. Split for punch."]
- **Endings**: [How pieces close, e.g., "Memorable over informative"]
- **CTAs**: [Tone for calls to action, e.g., "Clear but self-aware"]

## Red Flags
- [Things to catch during review]
```

### For agent / product voice

Voice rules embed in the agent's system prompt. Structure:

```markdown
## VOICE AND TONE

### Response Style
- [Length defaults, when to expand]
- [Formality level, personality markers]
- [Energy matching: how to adapt to user's tone]

### Behavioral Rules
- [What the agent volunteers vs. waits to be asked]
- [How uncertainty is communicated]
- [Boundaries: what the agent doesn't do or discuss]

### Guardrails
- [Hard content rules: fabrication, privacy, disclosure]
- [Banned phrases in this context]
- [Anti-patterns specific to this agent's role]

### Examples
#### Good response:
[Example that nails the voice]

#### Bad response:
[Same content, wrong voice. Shows the contrast.]
```

### For documentation voice

Lighter touch. Voice shows in what's included and excluded, not in flourishes:

```markdown
## Documentation Voice
- Direct. Lead with what the reader needs.
- Skip preamble. No "In this section, we will..."
- Use "you" not "the user" or "one"
- Code examples over prose explanations where possible
- Acknowledge gaps honestly. "This is unproven" over silence.
```

---

## Voice across projects

When maintaining voice consistency across multiple projects or contexts, the challenge is keeping the underlying voice recognizable while adapting to different formats and audiences.

### What stays constant
- Core personality markers (directness, humor style, self-awareness level)
- Banned phrases (if you'd never say it in conversation, don't say it in a product)
- Honesty patterns (how uncertainty is handled, how gaps are acknowledged)

### What adapts
- Length and density (essay vs. microcopy vs. agent response)
- Structural conventions (long-form has more room for asides; agents need brevity)
- Formality band (editorial might use casual language that's wrong for enterprise product UI)
- Guardrails (an editorial voice can be opinionated; a product agent has role-specific boundaries)

### The test

Read the output without context. Can you tell it came from the same source? If an editorial post, an agent response, and a product notification all sound like they were written by the same person (or organization), the voice is consistent. If any one of them could have been written by anyone, voice has been lost in that context.

---

## Common failure modes

### Over-specification
The voice definition is so detailed that the model writes cautiously, constantly checking itself. Output is technically compliant but lifeless. **Fix**: Add more positive patterns. Balance constraints with permissions.

### Under-specification
The voice definition is abstract ("be professional but friendly"). The model defaults to generic AI prose. **Fix**: Add specific examples, banned phrases, and structural preferences.

### Correction-only derivation
Voice definition consists entirely of "don't do X" rules from past failures. The model knows what to avoid but not what to aim for. Output is safe but flat. **Fix**: Encode successes too. When something lands, add it to the sounds-like list.

### Context collapse
The same voice definition is used verbatim across all contexts: editorial, agent, product UI. The result is long-form editorial personality in a 15-word error message. **Fix**: Create context-specific variations that share core voice principles but adapt expression.

### Fossilized voice
The voice definition was written months ago and hasn't been updated. The actual voice has evolved through hundreds of sessions, but the definition reflects the state at definition-time. **Fix**: Treat the voice definition like any other living document. Update it when corrections reveal that the original definition no longer matches.

### Co-authored fossilization
The voice definition was derived from a corpus of AI-assisted output. The writer's structural moves got encoded, but so did the AI's punctuation rhythms and connective-tissue habits, treated as if they were the writer's. Future writing matches the encoded definition, which means it matches both the writer and the AI. **Fix**: Run the paired-sample diff (see *Derivation by paired-sample diff* above) against a piece written entirely without AI assistance. Strip the AI-only features from the definition. Re-encode the features that show up in solo work but were absent from the co-authored corpus.

### AI-default absorption
Voice definition was solid when written, but recent output has acquired AI tells the definition doesn't catch. Em-dash density has crept up, copula substitution returned, AI vocabulary slid back in. The definition didn't go stale; the model defaults are pulling harder than the definition can hold. **Fix**: Strengthen the anti-AI-tell anchors with specific patterns and density caps. Provide explicit replacements, not just bans. If output is still drifting, the model partner may have changed (version bump, new defaults); refresh the AI-tells inventory.

---

*Voice is a design material. It evolves through use, not through specification. Update this reference as patterns emerge.*
