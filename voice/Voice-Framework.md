# Voice Framework

**Version**: 2.0 (March 2026)
**Evolved through**: Editorial content, product agent design, and professional representation across 475+ sessions
**Previous**: v1.0 (December 2025), editorial-only, Substack/LinkedIn-specific
**Part of**: [Overture](../README.md), the Claude Code working kit
**Companion**: [Voice Reference](Voice-Reference.md), detailed session structure, derivation approach, encoding patterns

> **Audience**: You. Reference reading for voice work. Read it when tone, personality, and consistency matter for your project.

---

## What this is

A methodology for establishing and maintaining voice in AI-assisted work. Not just editorial content. Voice applies anywhere tone, personality, and consistency matter: product UIs, AI agents, documentation, customer communication, professional representation.

AI tends toward generic. Left unchecked, it produces competent, interchangeable prose that sounds like every other AI output. Maintaining a distinct voice requires explicit encoding: defining what it sounds like, what it doesn't, and giving the model specific patterns to follow and avoid.

This is an optional module. Load it when voice matters for the work at hand. Not every project needs voice work.

---

## When voice matters

- **Editorial content**: Writing that carries a byline. Blog posts, newsletters, social content. The reader should recognize the author.
- **Product agents**: AI-powered features that interact with users. Representation agents, chatbots, coaching tools. The agent's voice IS the product experience.
- **Professional representation**: Content that speaks for or about a person or organization. Bios, profiles, narrative documents.
- **Documentation with personality**: Product docs, READMEs, onboarding flows where tone affects comprehension and trust.
- **Brand consistency**: Any context where multiple outputs need to sound like they come from the same source.

If the work is purely mechanical (data processing, infrastructure scripts, API plumbing), skip this module.

---

## Defining voice

Voice is defined through contrast: what it sounds like vs. what it doesn't. Abstract descriptions ("professional but approachable") are useless. They describe half the internet. Specific patterns work.

### The sounds-like / doesn't-sound-like pattern

```markdown
### Sounds like:
- Direct. Opens with statements, not buildup
- Self-aware. Undercuts without being self-deprecating
- Matter-of-fact observations, not grand insights
- Commits to the point but doesn't oversell

### Doesn't sound like:
- Thought-leader speak ("once you see this, you can't unsee it")
- Trying to be profound or philosophical
- Over-explained or defensive
- Generic enough to apply to anyone
```

The "doesn't sound like" list is often more useful than the "sounds like" list. It gives the model concrete patterns to avoid, and AI models are surprisingly good at avoidance when given specific anti-patterns.

### Anti-patterns and banned phrases

Go beyond general guidance. Name the specific phrases and patterns that break voice:

```markdown
### Banned phrases:
- "In today's [anything]"
- "It's worth noting that"
- "At the end of the day"
- "This is a game-changer"
- [Any phrase that triggers your "this doesn't sound like me" response]

### Anti-patterns:
- Opening with a question designed to hook rather than inform
- Burying the point under three paragraphs of context
- Hedging every claim with qualifiers
- Using semicolons where periods would hit harder
```

Banned phrases work because they're unambiguous. "Don't sound corporate" is interpretable. "Never use the phrase 'leverage synergies'" is not.

### Behavioral rules

For AI agents and interactive voice, define behavioral rules beyond word choice:

```markdown
### Behavioral rules:
- Short responses by default. Expand only when the topic warrants depth.
- Never volunteer information the user didn't ask about.
- When uncertain, say so directly. Don't hedge with filler.
- Match the user's energy level. Casual question → casual answer.
- [Rules specific to this agent's role and boundaries]
```

Behavioral rules govern how the voice operates in conversation, not just how individual sentences read.

---

## Defeating the AI default

When the writing partner is an LLM, voice definition has an additional job: stripping out the AI defaults that show up in any unguided output. AI writing leaves recognizable fingerprints. Readers can spot it. Encoding anti-AI-tells into your voice profile is no longer optional for serious editorial work.

### Why this matters

LLMs trained on vast formal-writing corpora gravitate toward statistically safe patterns: certain punctuation rhythms, certain vocabulary, certain structural moves that read as professional but feel generic. The same patterns appear across providers (Claude, GPT, Gemini) because the training data overlaps. When these patterns dominate an output, readers register the text as AI-generated even when no specific phrase is "wrong."

Two practical consequences:

1. **Co-authored output drifts toward AI defaults.** When a human writer drafts with AI assistance, the human's structural moves typically survive (verdict-first openings, soften-then-assert closers, specific vocabulary), but the connective tissue between them absorbs AI tendencies (heavy em-dash use, formulaic negative parallelism, listicle inflation). Voice profiles built from the fused output encode both signals, blurring what's actually the human's voice.

2. **Voice profiles that don't name AI tells fail to defeat them.** Generic guidance ("write clearly", "avoid jargon") leaves the AI defaults unchallenged because they're already clear, professional, and jargon-free. The defaults are recognized through pattern density, not through individual word choice.

### Categories of AI tells

A voice profile that defeats AI defaults should explicitly name patterns in at least these categories:

**Punctuation tells.** Em-dash density is the most-cited AI signal in 2026. AI uses 3-5 em-dashes per 500 words; humans average less than one. Other punctuation tells: smart quotes (curly), excessive boldface, emojis as section breaks.

**Vocabulary tells.** Specific words that dominate AI output: *delve, leverage, foster, garner, bolster, showcase, exemplify, underscore, streamline, navigate (metaphorically), tapestry, landscape, realm, journey, beacon, robust, seamless, scalable, comprehensive, multifaceted, pivotal, dynamic, intricate, profound, enduring, transformative, testament*. AI transitions: *Additionally, Furthermore, Moreover, In conclusion*.

**Structural tells.** Copula substitution (replacing "is" with "serves as / stands as / represents / marks"). Negative parallelism ("Not X, but Y" used formulaically). Rule-of-three lists deployed as a template. Present-participle tacks ("...contributing to the broader ecosystem"). Hedging accumulation. Outline-like conclusions ("Despite its strengths, X faces challenges..."). Perfect rectangular paragraphs with consistent sentence length.

**Markup tells.** Bullets where prose would work. Bold headers followed by colons and explanatory sentences (listicle inflation). Title-case section headers. Decorative emoji as visual structure.

These categories are not exhaustive. Specific tells evolve as models change. A voice profile should treat the categories as durable and update the specific patterns as new AI defaults emerge.

### Encoding anti-AI-tells

Practical patterns for encoding these in a voice profile:

- **List specific patterns, not categories.** "Em-dash density above one per page" is enforceable. "Avoid sounding like AI" is not.
- **Provide replacements, not just bans.** "Replace em-dashes with commas, periods, or colons depending on the structural job" gives the model somewhere to go.
- **Mark context-dependent rules.** Some patterns (rhetorical questions, "basically" as a softener, three-item rhythmic groupings) are anti-patterns in one register and signature moves in another. Note the register where each applies.
- **Distinguish formulaic use from substantive use.** "Not X, but Y" used once per document, doing real semantic work, is fine. The same construction used three times in a piece is AI rhythm. Encode the threshold, not a blanket ban.

### A note on what survives

Defeating AI defaults does not mean writing in a way no AI could produce. Most strong human voice consists of moves that are individually plausible from an LLM. What makes it human is the *specific combination*: particular structural moves clustered together, particular vocabulary used with intent, particular rhythmic preferences. The goal of an anti-AI-tell pass is to remove the defaults that signal genericness, leaving the specific moves that signal authorship.

---

## Encoding voice for AI collaboration

Voice rules need to live somewhere the model can read them. Options:

### In `~/.claude/CLAUDE.md` (personal voice)
For your own voice: the way you write, communicate, and want Claude to match when producing content on your behalf. Travels with you across projects.

### In project `CLAUDE.md` (product / agent voice)
For product voice: how a specific agent, tool, or product communicates. Lives with the project.

### In system prompts (agent voice)
For AI agents in production: voice rules embedded in the agent's system prompt. This is where sounds-like / doesn't-sound-like, banned phrases, and behavioral rules are most directly applied.

### In dedicated voice files
For complex voice definitions: a standalone file that sessions load when voice work is in scope. Referenced from CLAUDE.md, loaded on demand to avoid wasting context when voice isn't relevant.

The pattern is the same regardless of location: define what it sounds like, what it doesn't, list anti-patterns and banned phrases, add behavioral rules if interactive.

---

## Maintaining voice

### Red flags during sessions

Watch for these signals that voice is drifting:

- **Generic substitutions**: Specific language replaced with generic equivalents ("innovative solution" instead of the actual thing)
- **Tone flattening**: Personality elements (humor, self-awareness, edge) quietly dropped in favor of safe, neutral prose
- **Pattern intrusion**: AI-default patterns creeping in (list-heavy formatting, "Let's dive in," rhetorical questions as openers)
- **Hedging accumulation**: Each revision adds qualifiers until the point is buried
- **Voice homogenization**: Different contexts (editorial, agent, documentation) start sounding identical
- **AI-tell creep**: Em-dash density rising, copula-substitution returning ("serves as", "stands as"), vocabulary tells reappearing (*delve, leverage, robust, comprehensive*). Defaults absorb back in when the voice profile isn't enforced.
- **Co-authored fossilization**: Drafts where the AI's punctuation rhythms and connective-tissue habits get encoded as your voice because they survived editing. The structural skeleton remains yours; the connective tissue is the partner's. See Voice Reference for the paired-sample diff methodology that catches this.

### Feedback loops

Voice evolves through correction, not specification. You can't fully define a voice upfront. You discover it by reacting to what doesn't work.

1. **Catch it in session**: When output doesn't sound right, name what's wrong specifically. "This sounds like LinkedIn" is more useful than "this doesn't sound like me."
2. **Update the definition**: Add the correction to the banned phrases or anti-patterns list. The voice definition grows from corrections.
3. **Encode the positive too**: When something lands perfectly, note what worked. Voice definitions that only encode failures become overly cautious.
4. **Test across contexts**: Voice should be recognizable whether it's a blog post, an agent response, or a product notification. If it only works in one context, the definition is too narrow.

### Voice across contexts

The same voice principles express differently across contexts:

| Context | Expression |
|---------|-----------|
| Editorial (long-form) | Full personality. Humor, asides, stylistic choices. |
| Agent (conversational) | Same personality, compressed. Shorter sentences. Behavioral rules constrain scope. |
| Product UI (microcopy) | Same tone, minimal words. Personality in word choice, not structure. |
| Documentation | Clarity first, personality second. Voice shows in directness and what's left out, not in flourishes. |

The voice doesn't change; the density does. A direct, self-aware voice is direct and self-aware whether it's writing a 2,000-word essay or a 15-word error message.

---

## Working with voice in sessions

### When to load voice context

- **Starting editorial work**: Load voice definition before any writing begins
- **Designing agent prompts**: Load voice framework when building system prompts for interactive agents
- **Reviewing output for consistency**: Load voice definition when auditing existing content for drift
- **Onboarding a new project with voice requirements**: Load framework to establish voice patterns from the start

### The collaboration pattern

1. **Establish voice first**: Before producing content, align on voice. Share the definition, discuss what's in and out of scope.
2. **React to drafts specifically**: "This line doesn't land" is less useful than "this line sounds like it's trying to be profound. I just observe things." Specific corrections become encodable rules.
3. **Options for problem lines**: When a line doesn't work, generate 3-5 alternatives. State which you'd pick and why. This surfaces the underlying voice principle.
4. **Identify what's working**: Before suggesting changes, name what's working. Protects against over-editing toward generic.
5. **Track callbacks and threads**: In longer pieces, watch for thematic connections (repeated phrases, structural echoes). These are often deliberate. Breaking them breaks the piece.
6. **Tighten continuously**: Shorter is usually better. Every revision should consider what can be cut without losing meaning.

See the [Voice Reference](Voice-Reference.md) for the full session structure and derivation approach.

---

*This framework is a working document. Voice evolves. Update the methodology as new patterns emerge.*
