# README Hero Rewrite Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the README hero and reconcile "The Problem This Solves" so both rest on an OOTB-aware wedge (the agent already remembers; Overture is the managed workflow above raw memory) instead of the obsolete pre-auto-memory premise.

**Architecture:** Two exact-string edits to `README.md` — hero (lines 3–5) and the first two paragraphs of "The Problem This Solves" (lines 11–13). No code, no manifests. Verification is a voice/AI-tells grep gate plus a manual contradiction-check across the two edited blocks.

**Tech Stack:** Markdown. `grep` for the voice gate. Git for commits.

**Reference:** Spec at `docs/superpowers/specs/2026-06-14-readme-hero-rewrite-design.md`.

---

### Task 1: Rewrite the hero (README lines 3–5)

**Files:**
- Modify: `README.md:3-5`

- [ ] **Step 1: Confirm the current hero text**

Run: `sed -n '3,5p' README.md`
Expected output (the exact block to be replaced):
```
The setup before the performance. A working framework for getting more out of AI coding tools like [Claude Code](https://claude.ai/code) — so your agent remembers what you're working on, session after session.

Also works with [Codex CLI](https://openai.com/index/codex-cli), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and any tool supporting the [Agent Skills](https://agentskills.io) standard.
```

- [ ] **Step 2: Replace the hero**

Use Edit to replace exactly those two paragraphs (lines 3 and 5; line 4 is blank) with:

```markdown
**A memory file remembers. A workflow compounds.** Your agent already keeps a CLAUDE.md; Overture turns it into a managed operating document: a work queue, deliberate session handoffs, and hygiene that fights the drift. It also adds craft the base tool has no answer for — the agent writes in your voice, and the same system runs one project or a whole portfolio.

Works with [Claude Code](https://claude.ai/code), [Codex CLI](https://openai.com/index/codex-cli), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and any tool on the [Agent Skills](https://agentskills.io) standard.
```

Notes:
- Preserve the three existing markdown links (Claude Code, Codex CLI, Gemini CLI, Agent Skills) with their exact URLs. The Claude Code link moves from the old first paragraph into the cross-tool line.
- One em-dash only (the craft turn). The list after "operating document" uses a colon.

- [ ] **Step 3: Verify the edit rendered as intended**

Run: `sed -n '3,5p' README.md`
Expected: the new two-paragraph block above, with all four links intact.

- [ ] **Step 4: Do not commit yet** — Task 2 edits the same file and they ship together (the hero concession and the Problem reframe must land in one commit to avoid an intermediate self-contradicting state).

---

### Task 2: Reconcile "The Problem This Solves" (README lines 11–13)

**Files:**
- Modify: `README.md:11-13`

- [ ] **Step 1: Confirm the current Problem text**

Run: `sed -n '9,15p' README.md`
Expected output (section heading + the two paragraphs to replace + the provenance paragraph that stays):
```
## The Problem This Solves

You open Claude Code, do good work, close the session. Next time, it remembers nothing. You re-explain your project, re-state your priorities, re-describe what you were working on. Context lost. Work gets dropped. You become the sole carrier of project state.

Overture fixes that. It gives your agent a structured file — your project's current state, priorities, work queue, and session handoffs — so every session starts where the last one ended.

Evolved through 480+ working sessions across real products with real users and real deadlines. Not theoretical patterns. What survived contact with production work.
```

- [ ] **Step 2: Replace the two paragraphs**

Use Edit to replace exactly the two paragraphs beginning "You open Claude Code…" and "Overture fixes that. It gives your agent a structured file…" with:

```markdown
Your agent keeps a memory file now, so it remembers facts about your project. But a file that only grows isn't a workflow. Priorities go stale, the memory bloats, and the thing you actually need next session — what was in flight, what got deferred, what's next — was never captured as more than prose. The work still lives in your head; the agent just has better notes.

Overture fixes that. It gives your agent a managed operating document: current state, priorities, a work queue, and deliberate session handoffs, plus the hygiene to keep it from rotting as it grows. Every session starts where the last one ended, and the memory gets more useful instead of just bigger.
```

Notes:
- Do NOT touch the `## The Problem This Solves` heading or the "Evolved through 480+ working sessions…" provenance paragraph. Only the two middle paragraphs change.

- [ ] **Step 3: Verify the edit**

Run: `sed -n '9,15p' README.md`
Expected: heading unchanged, the two new paragraphs in place, provenance paragraph unchanged.

---

### Task 3: Voice gate + coherence check (verification)

**Files:**
- Read-only check against `README.md`

- [ ] **Step 1: Grep the edited blocks for AI-tells**

Run: `sed -n '3,13p' README.md | grep -nE '—|isn'\''t just|robust|seamless|Additionally|leverage|moreover|furthermore'`
Expected: at most ONE match — the single em-dash in the hero craft turn ("answer for — the agent writes"). The Problem section uses one em-dash pair (the appositive "next session — what was in flight … what's next —"), which is acceptable as a matched parenthetical, not connective tissue. If grep surfaces "robust", "seamless", "Additionally", or an "isn't just X" pivot, rewrite to remove it before proceeding.

Decision rule: em-dashes that set off an appositive (matched pair) or land a single rhetorical turn are allowed. Em-dashes substituting for a period/colon between independent clauses are not. Count the latter — target is zero.

- [ ] **Step 2: Manual contradiction check**

Read README lines 3–15 top to bottom. Confirm:
- The hero concedes "your agent already keeps a CLAUDE.md."
- The Problem section agrees ("Your agent keeps a memory file now…").
- No sentence in lines 9–15 still claims the agent forgets / "remembers nothing."

Expected: hero and Problem section read as one continuous argument, no residual contradiction.

- [ ] **Step 3: Confirm no other section references the old "agent forgets" premise**

Run: `grep -nE 'remembers nothing|re-explain|forgets|starts from scratch|blank slate' README.md`
Expected: no matches. If any surface outside the edited region, flag them (they may be additional pre-OOTB framing) and confirm with the user whether to fold them into this change or defer.

- [ ] **Step 4: Commit both edits together**

```bash
git add README.md
git commit -m "Session #27 — README hero rewrite + Problem reconciliation (OOTB-aware wedge)

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
```

---

### Task 4: Update the operating document

**Files:**
- Modify: `CLAUDE.md` (kit table README row + DOCUMENTATION REFERENCE README row + Session Progress)

- [ ] **Step 1: Bump README status in the kit table**

In `CLAUDE.md`, find the README row in the "Methodology" kit table (currently `**v5** — Session #26`, note "Voice in Practice section… added #26"). Update to `**v6** — Session #27` and append a note: hero + Problem section reframed onto the OOTB-aware wedge.

- [ ] **Step 2: Update the DOCUMENTATION REFERENCE README row**

Find the README row in the DOCUMENTATION REFERENCE table (`Session #26`). Update "Last Updated" to Session #27 and add: "Hero rewritten #27 (OOTB-aware wedge, 'A memory file remembers. A workflow compounds.'); Problem section reconciled to match."

- [ ] **Step 3: Leave Session Progress for /session-end**

The Session Progress block, COMPLETE table, and P1 (e) remaining-items line are updated at `/session-end`, not here. This task only syncs the two doc-reference tables so they don't drift mid-session.

- [ ] **Step 4: Commit the doc sync**

```bash
git add CLAUDE.md
git commit -m "Session #27 — sync kit table for README hero rewrite (v6)

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
```

---

## Self-Review

**Spec coverage:**
- Hero rewrite (spec Change 1) → Task 1. ✓
- Problem reconciliation (spec Change 2) → Task 2. ✓
- Coupled single commit (spec: "cannot be changed independently") → Task 1 Step 4 defers commit; Task 3 Step 4 commits both. ✓
- Voice/AI-tells grep gate (spec Verification) → Task 3 Step 1. ✓
- Contradiction + no-residual-premise checks (spec Verification) → Task 3 Steps 2–3. ✓
- Kit table / version note update (spec Verification last bullet) → Task 4. ✓
- Out-of-scope items (manifests, Working-With-Claude-Code.md, line 190 callback) → untouched by all tasks. ✓

**Placeholder scan:** No TBD/TODO. All replacement prose is literal and complete. Grep patterns and expected outputs are concrete.

**Type consistency:** N/A (prose change). String-level consistency verified: the hero text in Task 1 matches the spec verbatim; the Problem text in Task 2 matches the spec verbatim.

**One judgment call flagged for the executor:** Task 3 Step 1's em-dash rule requires distinguishing appositive/rhetorical em-dashes (allowed) from connective ones (not). The expected counts are stated so the executor isn't left to taste alone.
