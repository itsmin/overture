# Autonomous Background Patterns

**Part of**: [Overture](../README.md) — the Claude Code working kit
**Level**: 3+ (see [Working with Claude Code, Part 3](../Working-With-Claude-Code.md#part-3-the-levels))
**Extracted from**: Production SaaS platform — three-phase quality harness built across 356-358 sessions
**Related**: [Workflow Framework](../workflow/Claude-Code-Workflow-Framework.md) — session hooks handle in-session automation; this covers between-session work

> **Audience**: You — a capability pattern. Read this when manual session-start checks aren't enough and you want Claude doing quality work while you're away.

---

## What This Is

Claude Code remote triggers — scheduled agents that run autonomously on a cron schedule. They execute quality checks, validate metrics, review recent changes, and surface issues without a human initiating a session.

This is Level 3 infrastructure. Don't build it until you have stable session commands, sources of truth, and enough project history that manual quality checks are becoming a burden.

---

## When You Need It

- Manual session-start checks are catching issues that should have been caught earlier
- Data pipelines or automation run between sessions and can fail silently
- Documentation drifts between sessions and nobody notices until three sessions later
- Quality regressions only surface when someone happens to look
- You want a forcing function for standards that are hard to maintain manually

---

## The Two-Trigger Pattern

Production use converged on two scheduled triggers with distinct cadences and scopes:

### Daily Operational Check

Runs every day. Focuses on things that can break overnight or between sessions.

**What it checks:**
- **CI/test suite** — Are tests passing? Did a dependency update break something?
- **Recent commits** — Do changes since last check meet quality standards?
- **Data quality** — Entity counts, pipeline health, record hygiene
- **Automation health** — Are scheduled jobs running? Are feeds/sources responsive?

**Cadence**: Daily, during off-hours (e.g., 10:00 UTC)

**Scope**: Operational. "Is the system healthy right now?" These are checks you'd do at the start of every session — the trigger does them whether or not a session happens.

### Weekly Strategic Audit

Runs once a week. Focuses on drift and alignment — things that degrade slowly.

**What it checks:**
- **Metrics validation** — Do documented metrics (entity counts, source counts, cost figures) match the actual sources of truth?
- **Documentation sync** — Does CLAUDE.md reflect the current implementation? Are architecture docs current?
- **Cross-project coordination** — Are contracts up to date? Any stale approved work items?
- **Work queue** — Are priorities current? Are blockers tracked? Has anything been deferred too long?

**Cadence**: Weekly (e.g., Sundays at 14:00 UTC)

**Scope**: Strategic. "Is the project's self-description still accurate?" These catch the slow rot that accumulates between active development sessions.

---

## Supporting Infrastructure

Autonomous triggers are the visible output. They depend on infrastructure that makes the checks meaningful:

### Test Suite

The trigger needs something to run. A CI test suite (unit + integration) is the foundation. Without it, the daily check has nothing mechanical to verify.

### Health Endpoints

If the project has a deployed service, a health or stats endpoint gives the trigger something to query. Entity counts, uptime, error rates — whatever the trigger needs to compare against documented metrics.

### Telemetry Tables

Write-only telemetry (source performance, error rates, response times) gives the trigger historical data to reason against. "This source failed 5 times consecutively" is more useful than "this source failed now." Telemetry enables pattern-based decisions, not just point-in-time checks.

### Contract Tests

If the project exposes APIs consumed by other projects, contract tests verify the API surface. The daily trigger runs these. A breaking change gets caught before the consuming project discovers it in their next session.

---

## What Triggers Produce

Each trigger run should produce a clear output:

- **Green**: Everything checks out. No action needed. (Most runs should be this.)
- **Warning**: Something is drifting but not broken. Flag for next session.
- **Action taken**: The trigger fixed something autonomously (e.g., suspended a failing data source after N consecutive failures). Log what happened and why.
- **Escalation**: Something is broken and requires human attention. Surface it prominently at next session start.

The principle: triggers should be safe to ignore when green. When they're not green, the signal should be unambiguous.

---

## Autonomous Decision-Making

Some checks warrant automated remediation, not just reporting:

**Safe to automate:**
- Suspending a data source after N consecutive failures (with auto-retry after a cooldown)
- Flagging stale documentation (but not rewriting it)
- Creating issues or work items for discovered problems
- Updating metrics that can be verified mechanically

**Not safe to automate:**
- Code changes or refactoring
- Architectural decisions
- Anything that affects the user-facing experience
- Anything that requires understanding context the trigger doesn't have

The line: if the decision can be made from mechanical signals alone (5 failures = suspend), automate it. If it requires judgment about intent, flag it for a human session.

---

## Setup

### 1. Build the check scripts first

Write the checks as standalone scripts that can run in any Claude Code session. Test them manually in a regular session. Don't wire them to triggers until they're reliable.

### 2. Verify CI/CD is green

Your trigger will run tests. Those tests need to pass reliably before the trigger is live. Flaky tests produce noisy triggers that get ignored.

### 3. Create remote triggers

Use Claude Code's remote trigger feature to schedule the agents:

```
Daily:   cron "0 10 * * *" — operational check
Weekly:  cron "0 14 * * 0" — strategic audit
```

Each trigger gets a prompt that tells the agent what to check, what thresholds matter, and what actions (if any) it can take autonomously.

### 4. Monitor the first week

Watch the trigger outputs. Tune thresholds. Expect false positives in the first few runs — that's calibration, not failure.

---

## Anti-Patterns

**Trigger without tests.** An autonomous agent that can't run a test suite is just reading files and guessing. Build the test infrastructure first.

**Too many triggers.** Two triggers (daily + weekly) cover most needs. Adding more fragments attention and creates conflicting signals. If your daily check needs to be more thorough, expand it — don't add a third trigger.

**Triggers that modify code.** Autonomous agents should report, flag, and make safe operational decisions. They should not write code, refactor, or make changes that require review. That's a session task.

**Ignoring green runs.** If you stop reading trigger output because it's always green, that's success — but verify periodically that the checks are still meaningful. A trigger that passes because it's checking stale thresholds isn't catching anything.

**Building triggers before Level 2 is stable.** Session commands, sources of truth, and documentation hygiene need to be working before automation makes sense. Automating checks against a CLAUDE.md that isn't maintained just automates noise.

---

## Phased Rollout

The production approach that worked:

**Phase 1 — CI and contract tests.** Get your test suite running in GitHub Actions (or equivalent). Add API contract tests if the project has consumers. This is foundation — the triggers need something to run.

**Phase 2 — Health digest.** A daily health check that reports status but takes no action. Calibrate: what's worth checking? What thresholds matter? Let this run for a few days before adding decision-making.

**Phase 3 — Autonomous triggers.** Wire up the daily operational check and weekly strategic audit as remote triggers. Add autonomous decision-making (source suspension, metric flagging) once the checks are calibrated.

Each phase should be stable before starting the next. Rushing to Phase 3 without calibrated checks produces triggers that cry wolf.

---

## Relationship to Other Patterns

- **Hook templates** (`../templates/hooks/`): Hooks run during sessions. Triggers run between sessions. Hooks are Level 3; triggers are Level 3+. Build hooks first.
- **Data Authority** (`Data-Authority.md`): Triggers validate that sources of truth haven't drifted. The data authority pattern tells you which values to check.
- **Privacy Boundary** (`Privacy-Boundary.md`): Weekly strategic audits should verify privacy boundary filtering is intact — adversarial queries against public surfaces.
- **Size Management** (`Size-Management.md`): Weekly audits can flag CLAUDE.md approaching size thresholds before a session has to deal with it.

---

*Autonomous background work is the maintenance layer of a mature project. Build it when manual checks become a burden. Not before.*
