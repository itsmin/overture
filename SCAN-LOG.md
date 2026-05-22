# Overture Ecosystem Scan Log

Quarterly scans of the Claude Code / Agent Skills / AI-coding ecosystem. Each entry records what was checked, what changed, and how Overture's lanes responded.

**Cadence**: Quarterly (Jan / Apr / Jul / Oct).
**Decision rubric**: see [STRATEGY.md](STRATEGY.md).
**Format**: append-only. Newest entries at the top.

---

## 2026-Q2 (inaugural scan) — May 21, 2026

**Scan period**: From Overture's inception (April 2026) through May 2026. Establishes the baseline.

### Ecosystem state

**First-party (Anthropic) plugins**:
- **CLAUDE.md Management** — `/revise-claude-md` command + `claude-md-improver` skill. Audits CLAUDE.md against quality criteria (commands, architecture, gotchas, conciseness). Writes only with explicit approval. No session hooks.
- **Remember** — `/remember` command + SessionStart/PostToolUse hooks. Auto-captures activity, Haiku-compresses into tiered logs, reloads on next session. Independent of Anthropic's built-in auto-memory.
- **Frontend Design** — auto-activating skill for visual/UI work. Establishes design framework (aesthetic direction, typography, palette) before coding.
- **Code Review** — `/code-review` command. Runs against PR branches, posts inline GitHub comments, skips closed/draft/automated PRs.
- **Design** — separate plugin (visual design tooling).

**Community plugins/skills in adjacent lanes**:
- **Superpowers** (obra) — accepted into official Anthropic marketplace 2026-01-15. 170K+ stars. Skills include `/brainstorm`, `/writing-plans`, `/systematic-debugging`, `/test-driven-development`, `/receiving-code-review`, `/dispatching-parallel-agents`, etc.
- **claude-mem** (thedotmack) — cross-tool memory (Claude Code, Codex, Gemini, Copilot, OpenCode). Aggressive auto-capture variant.
- **claude-sessions** (hex) — session manager with documentation/artifact tracking.
- **BMAD-METHOD** — 21 specialized agents, 50+ workflows, "team-shaped framework." Agile/team-of-agents orientation.
- **claude-flow** (ruvnet) / **Ruflo** — full orchestration platforms with Queen+Worker agent swarms.
- **claude-task-master** — task management for AI workflows with dependencies.
- **claude-mpm** — 47+ agents, hooks, MCP server. Heavy.
- **Workflow Orchestration** (barkain) — task decomposition, parallel agent execution.
- **Claude Codex** (Z-M-Huang) — per-project `.task/` directories + multi-project pipeline coordination.

**Standards and primitives**:
- **Agent Skills** is now a genuinely cross-tool open standard. Supported by Claude Code, Codex CLI, Cursor, Gemini CLI, GitHub Copilot agent mode, Cline, Roo Code, Goose, Antigravity IDE, plus 30+ others. SKILL.md format is the lingua franca.
- **Claude Code hook events** expanded from ~10 to 27-32 events (as of v2.1.141+). New events relevant to session-discipline patterns: `PreCompact`, `PostCompact`, `TeammateIdle`, `WorktreeCreate`, `WorktreeRemove`, `SubagentStart`, `SubagentStop`, `TaskCreated`, `TaskCompleted`, `FileChanged`, `ConfigChange`, `CwdChanged`, `PermissionRequest`, `Notification`, `Elicitation`.
- **Plugin Discover/Browse** screens now show component inventory + projected per-session token cost before install. Implication: plugin manifests should be complete and honest.
- **Anthropic-managed marketplace** at `anthropics/claude-plugins-official`. Two tiers: internal (Anthropic-built) and external (community/partners). Submission via form at `clau.de/plugin-directory-submission`. Curated, ~few days review. Required: clean plugin.json (version-matched to CHANGELOG + git tags), LICENSE, README, structural validation via `claude plugin validate`. Community marketplaces also exist: ClaudePluginHub, claudemarketplaces.com.

### Distinctive lanes (Overture continues to own)

| Lane | Status | Notes |
|------|--------|-------|
| **Choral** (cross-project coordination via human-curated contracts + shared blackboards) | No encroachment | Claude Codex's per-project `.task/` is closest but agent-task-shaped, not contract-shaped. Continue. |
| **Voice as design material** (`voice/`, profile layer at `~/.overture/`) | No encroachment | Nobody first-party or community is in this lane at all. Continue; elevate in Phase 2. |
| **Operating-doc discipline as methodology** (Size-Management, Section-Ordering, NEXT pointer ritual, the *why* behind structure) | No encroachment | First-party CLAUDE.md Management audits quality; doesn't structure. Continue. |

### Coexisting lanes (reference at point-of-use, don't reinvent)

| Lane | First-party / community owner | Overture response |
|------|-------------------------------|-------------------|
| Quality audit of CLAUDE.md (commands current, conciseness) | `/revise-claude-md` (Anthropic, first-party) | Reference in session-end skill as complement to structural sync |
| Auto-capture activity tier (tool calls, recent edits, summarized handoffs) | `/remember` (Anthropic, first-party); claude-mem (community, cross-tool) | Reference in session-start skill; note as a different memory layer than the operating doc |
| Pre-creative ideation, planning, debugging discipline | Superpowers (`/brainstorm`, `/writing-plans`, `/systematic-debugging`) — in Anthropic marketplace | Reference in init skill + lane map; recommend for users hitting those moments |
| Visual / frontend design quality | frontend-design (Anthropic, first-party) | Reference in init skill |
| PR review automation | code-review (Anthropic, first-party) | Reference in init skill |
| Hook plumbing primitives | First-party event set (27-32 events) | Adopt as primitives where they're better than custom shell; document the dependency |

### Out of scope (Overture explicitly does NOT compete)

| Lane | Owner | Why Overture stays out |
|------|-------|------------------------|
| Multi-agent orchestration / swarm coordination | BMAD-METHOD, claude-flow, Ruflo, claude-mpm | Different philosophy. Overture is human-centric; these are agent-centric. |
| Task-management dependency graphs for AI workflows | claude-task-master | Adjacent but not Overture's job. |
| Cross-tool memory bridging (auto-capture across Claude/Codex/Gemini) | claude-mem | Strong cross-tool play; Overture's cross-tool premise is for the discipline layer, not the memory layer. |

### Decisions for this scan

1. **Build first-party plugin references at point-of-use** into Overture's three skills (overture-init, session-start, session-end). Done Session #21 Phase 1.
2. **Publish [STRATEGY.md](STRATEGY.md)** to make distinctive lanes, coexisting lanes, and out-of-scope explicit. Done Session #21 Phase 1 (skeleton; voiced prose in Phase 2).
3. **Voice elevation** as Phase 2 priority — most defensible distinctive, most unique to the kit's author.
4. **Marketplace submission** queued for Phase 3 — submission-readiness checklist: CHANGELOG (missing), `claude plugin validate` pass, version consistency check, README polish. Estimated 1 session.
5. **First-party watch** added to Overture's own CRITICAL REMINDERS — evaluate any new Anthropic plugin/skill against Overture's lanes within one session of release.

### Next scan

**2026-Q3** — July 2026. Focus areas: any Anthropic moves into Choral / Voice / operating-doc-structure lanes; hook event additions; new Superpowers skills; marketplace acceptance status if Overture has submitted.

---
