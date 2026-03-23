# Contributing to Overture

Overture is a methodology kit, not a software project. Contributing here looks different from contributing to a codebase.

## What belongs here

**Pattern improvements** — If you've used these patterns and found something that works better, that's a contribution. "Session-end should also check X" based on real experience is valuable.

**Template fixes** — If a template has a gap, a confusing placeholder, or produces bad output when Claude follows it, fix it. The initialization flow (`templates/init.md`) is the most testable surface.

**Gap documentation** — The [Honest Gaps](Working-With-Claude-Code.md#part-6-honest-gaps) section exists for a reason. If you find a new limitation, document it. Honest gaps are more valuable than untested claims.

**Cross-reference accuracy** — Links between docs break when things move. If you find a broken reference, fix it.

## What doesn't belong here

**Organization-specific content** — Overture is portable. Patterns are extracted from real projects, but the implementations stay in those projects. Don't add content that only works for one team or org.

**Untested patterns** — Everything here survived real use. If you're proposing a new pattern, it should come from actual sessions, not theory. "I think this would work" isn't enough — "I used this for 20 sessions and here's what happened" is.

**Aspirational features** — The kit describes what exists, including its limitations. Don't add sections describing things that should exist but don't yet. Add them when they do.

## How to test changes

The most important test: **does the initialization flow still work?**

1. Create a fresh directory
2. Open Claude Code in it
3. Run the initialization prompt from the README, pointing to your modified Overture
4. Verify: CLAUDE.md is generated, session commands work, `/session-start` produces useful output

For template changes, also verify:
- Placeholders are either filled or clearly marked as "skip if not applicable"
- No organization-specific paths or references leaked in
- Cross-references between docs still resolve

## Style

- **Practitioner voice** — Direct, no thought-leadership inflection. Write for someone who will use this tomorrow.
- **Real over polished** — Battle-tested patterns, honest about limitations.
- **Don't duplicate** — If something is already documented in one place, reference it instead of repeating it.

## Process

1. Fork the repo
2. Make your changes
3. Test the initialization flow
4. Open a PR with what you changed and why — "why" matters more than "what" for a methodology kit

For questions or discussion, open an issue.
