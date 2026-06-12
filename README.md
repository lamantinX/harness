# AI Harness Kit

Portable global + project AI coding harness for multiple coding agents.

The kit has two layers:

- **Global harness**: universal startup protocol, task classification, context budget, safety defaults, agent adapters, run log schema, and meta-harness scoring.
- **Project harness overlay**: project-specific `AGENTS.md`, `CLAUDE.md`, `.claude/rules/`, verification commands, risks, deploy policy, and `docs/ai-runs/`.

Use this kit as a dispatcher and template generator. Do not copy one project's rules into every other project.

Harness-Kit-Version: 0.2.0

## Quick start

```bash
git clone <this-repo> ~/.ai-harness-kit
cd ~/.ai-harness-kit
bash scripts/install.sh
~/.ai-harness/bin/aih doctor
```

Add this to your shell profile if needed:

```bash
export PATH="$HOME/.ai-harness/bin:$PATH"
```

Initialize a project dry-run:

```bash
cd /path/to/project
aih init-project --dry-run
```

Run an agent through the bootstrap protocol:

```bash
ai-agent --dry-run codex "fix a standard bug"
ai-agent --dry-run claude "plan a complex refactor"
```

## Commands

- `aih doctor` — check global install, local tools, and current project harness.
- `aih install` — install/sync kit files into `~/.ai-harness`.
- `aih init-project [--dry-run]` — create a generic project harness overlay.
- `aih sync-project [--dry-run]` — compare current project overlay with the kit template.
- `aih log "task"` — append a required run-log entry.
- `aih score "sample"` — append a completed harness score entry.
- `aih score --draft "sample"` — append an explicitly incomplete score draft.
- `aih version` — print kit version.
- `ai-agent <agent> "task"` — inject global + project protocol into the selected agent.

## Run-log discipline

Log every Standard, Complex, Core-risk, Research-only, and Meta-harness task before the final response. Trivial tasks may be skipped only when they produce no durable change and reveal no workflow problem.

Every required entry records task class, risk, inspected and changed file counts, checks, result, failure or remaining risk, and one harness note. A run is not complete until its log exists.

`aih log` defaults to `unverified` and refuses a `pass` result when checks are not supplied through `AIH_CHECKS`.

Append a score entry after every five required run logs and immediately after any failed, rolled-back, security-sensitive, or high-friction run.

## Core principle

```text
Global = how agents should work
Project = what matters in this repository
Adapter = how each tool receives the same protocol
Meta-harness = how we learn whether the workflow is improving
```

## Safety boundary

This kit must stay generic. Keep project-specific deployment paths, credentials, customer data, private config, and runtime databases out of the kit.
