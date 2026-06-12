# Codex CLI Adapter

Purpose: adapt the global harness protocol to this agent.

## Rules

- Load or inject the global protocol.
- Prefer project `AGENTS.md` as the project contract.
- Do not assume another tool's hooks or memory protect this agent.
- Classify the task before reading broad context.
- Complex/Core tasks require plan first and approval before execution.
- Log meaningful runs.

## Notes

Use a wrapper prompt that includes the global protocol and instructs Codex to read project `AGENTS.md` first. Close stdin when running non-interactively.
