# AI Harness Kit

Portable global + project AI coding harness for multiple coding agents.

The kit has two layers:

- **Global harness**: universal startup protocol, task classification, context budget, safety defaults, agent adapters, run log schema, and meta-harness scoring.
- **Project harness overlay**: project-specific `AGENTS.md`, `CLAUDE.md`, `.claude/rules/`, verification commands, risks, deploy policy, and `docs/ai-runs/`.

Use this kit as a dispatcher and template generator. Do not copy one project's rules into every other project.

Harness-Kit-Version: 0.1.0

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
- `aih log "task"` — append a run-log entry.
- `aih version` — print kit version.
- `ai-agent <agent> "task"` — inject global + project protocol into the selected agent.

## Core principle

```text
Global = how agents should work
Project = what matters in this repository
Adapter = how each tool receives the same protocol
Meta-harness = how we learn whether the workflow is improving
```

## Safety boundary

This kit must stay generic. Keep project-specific deployment paths, credentials, customer data, private config, and runtime databases out of the kit.
