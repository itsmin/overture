# Overture Strategy

> **Status**: Structural skeleton (Session #21). Voiced narrative prose deferred to Session #22 voice-elevation work — sections marked _(prose: Session #22)_ are placeholders.

---

## Purpose

Overture is a portable framework for AI-assisted development patterns. It supplies the human-discipline layer — operating-document structure, session ritual, cross-project coordination, voice as design material — that the rest of the ecosystem doesn't try to be.

_(prose: Session #22)_

---

## Origins

_(prose: Session #22 — narrative of why Overture exists, the 480+ session provenance, what was missing in early 2026 that the kit was built to address, how the relationship to the ecosystem changed as Anthropic and the community shipped first-party investments.)_

---

## Distinctive Lanes

Overture owns three lanes that no first-party or community plugin currently occupies. These are the kit's defensible niches and the focus of forward investment.

### 1. Choral — cross-project coordination via human-curated working contracts

Three-mode pattern (passive / active / review). Contracts live as markdown files at the project boundary, written and maintained by humans. A coordinator session can read both project codebases and write architectural recommendations to the contract.

Closest comparator: Claude Codex's per-project `.task/` directories — but those are agent-task-shaped, not contract-shaped, and don't carry the "shared blackboard" semantics. Choral is human-mediated coordination, not agent-mediated swarm.

Reference: [`choral/Choral-Pattern.md`](choral/Choral-Pattern.md), [`templates/contract.md`](templates/contract.md), [`templates/choral.md`](templates/choral.md).

### 2. Voice as design material

Voice is treated as something to define, encode, and maintain — not as a byproduct of model output. Includes derivation methodology, encoding patterns, profile layer at `~/.overture/voice.md`.

No first-party or community equivalent.

Reference: [`voice/Voice-Framework.md`](voice/Voice-Framework.md), [`voice/Voice-Reference.md`](voice/Voice-Reference.md), [`templates/profile.md`](templates/profile.md).

### 3. Operating-doc discipline as methodology

The *why* behind operating-document structure — section ordering, size management with thresholds and compression protocol, NEXT pointer ritual, deferred-work lifecycle, COMPLETE table trimming. CLAUDE.md Management (Anthropic first-party) audits quality against generic criteria; it doesn't structure.

Reference: [`workflow/Claude-Code-Workflow-Framework.md`](workflow/Claude-Code-Workflow-Framework.md), [`patterns/Size-Management.md`](patterns/Size-Management.md), [`patterns/Section-Ordering.md`](patterns/Section-Ordering.md), [`templates/CLAUDE.md`](templates/CLAUDE.md).

---

## Coexisting Lanes

Areas where first-party or community plugins do excellent work that Overture references at point-of-use rather than reinventing. Overture's skills surface these as suggestions when relevant; they are not invoked or required.

| Lane | Owner | How Overture surfaces it |
|------|-------|--------------------------|
| Quality audit of CLAUDE.md (commands current, conciseness) | `/revise-claude-md` — Anthropic, first-party | session-end skill suggests as complement to structural sync |
| Auto-capture activity tier | `/remember` — Anthropic, first-party; `claude-mem` — community, cross-tool | session-start skill notes as a different memory layer than the operating doc |
| Pre-creative ideation / planning / debugging discipline | Superpowers (`/brainstorm`, `/writing-plans`, `/systematic-debugging`) — Anthropic marketplace | overture-init skill recommends; lane map points to specific skills at specific moments |
| Visual / frontend design quality | `frontend-design` — Anthropic, first-party | overture-init skill recommends |
| PR review automation | `code-review` — Anthropic, first-party | overture-init skill recommends |
| Hook event primitives | Claude Code's 27-32 event set | adopted as primitives where they're better than custom shell |

---

## Out of Scope

Overture explicitly does not compete in these lanes, even where the problem is interesting.

| Lane | Owners | Why out |
|------|--------|---------|
| Multi-agent orchestration / swarm coordination | BMAD-METHOD, claude-flow, Ruflo, claude-mpm | Different philosophy. Overture is human-centric; these are agent-centric. |
| Task-management dependency graphs for AI workflows | claude-task-master | Adjacent but not Overture's job. |
| Cross-tool memory bridging (auto-capture across Claude/Codex/Gemini) | claude-mem | Strong cross-tool play; Overture's cross-tool premise is for the discipline layer, not the memory layer. |
| Generic productivity skill libraries (313+, 1000+ collections) | alirezarezvani/claude-skills, VoltAgent/awesome-agent-skills | Overture is opinionated, not exhaustive. |

---

## Scan Discipline

Overture watches the ecosystem on a fixed quarterly cadence. The discipline exists because gradual encroachment is the failure mode that loses distinctive niches without anyone noticing.

**Cadence**: Quarterly — January, April, July, October. Calendar-driven.

**Scope per scan**:
- New plugins in `anthropics/claude-plugins-official` (internal + external)
- Major version moves in CLAUDE.md Management, Remember, frontend-design, code-review
- Notable additions to Superpowers, claude-mem, claude-mpm in adjacent lanes
- Hook event additions/changes
- Agent Skills standard evolution
- New Claude model releases that affect workflow assumptions

**Decision rubric** (per item):
- **Distinctive lane** (Choral / Voice / Operating-Doc Discipline) → encroachment detected? Sharpen the distinctive angle. No encroachment? Continue.
- **Overlapping lane** (session management, hooks, audit) → first-party stronger? Add references at point-of-use. Don't reinvent.
- **New lane Overture isn't in** → does it complement the human-discipline core? Either add reference or skip.

**Output**: One entry appended to [`SCAN-LOG.md`](SCAN-LOG.md). Format is structured (ecosystem state, distinctive lanes status, coexisting lanes status, out-of-scope, decisions, next scan focus). ~150-300 words per entry.

**Inaugural scan**: 2026-Q2 (Session #21). See SCAN-LOG.md.

**Next scan**: 2026-Q3 (July 2026).

---

## Anti-Atrophy Mechanisms

Overture is the kit's author's most-used product. The risk isn't lack of use — it's lack of improvement. Three mechanisms keep the kit alive without committing to community-building.

1. **Usage cadence** — every CaliKo project session exercises Overture's session skills, operating doc patterns, and (where applicable) Choral coordination. The kit is dogfooded constantly.
2. **Quarterly scan** (above) — the only calendar-driven discipline. Surfaces ecosystem moves before they become problems.
3. **First-party watch in CRITICAL REMINDERS** — Overture's own CLAUDE.md carries a standing rule: when Anthropic releases new first-party plugins or skills, evaluate against Overture's lanes within one session. Low overhead, ensures awareness.

Patterns are extracted on-demand from real product work, never pre-built from theory. Data-Authority came from pxtxt; Privacy-Boundary came from itsmin.com; Autonomous-Background came from BETA. Continue this discipline — patterns extracted from real fires stay distinctive.

---

## What Overture Is, and Isn't

_(prose: Session #22 — sharper positioning statement under voice. Provisional framing: "Overture is the human-discipline layer for AI-assisted development. It assumes you compose with first-party Anthropic plugins and community skills for the parts they own well; it provides what they don't — structured operating documents, cross-project coordination via human-curated contracts, voice as design material, session handoff ritual." Refine in Session #22.)_

---

## Marketplace Posture

Overture is intentionally available, not aggressively promoted. Specialist mode, not active growth.

- **Public repo** at `github.com/itsmin/overture` — current state.
- **Self-hosted marketplace** via `.claude-plugin/marketplace.json` — current state, two-command install.
- **Anthropic official marketplace** — targeted submission (Session #21+ Phase 3 work). Requires CHANGELOG, version-consistency, structural validation, README polish.
- **Community directories** (ClaudePluginHub, awesome-agent-skills) — opportunistic listings, free distribution.
- **No commitment to**: regular content cadence, community management, talks, paid tier.

The purpose is credibility + sharp niche + organic discoverability. Anything beyond that is a portfolio decision that displaces something else.
