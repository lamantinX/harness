# Global Agent Protocol

Harness-Kit-Version: 0.2.0

This protocol is the universal startup contract for AI coding agents.

## Startup

Before non-trivial work:

1. Detect the project root.
2. Look for project harness files:
   - `AGENTS.md`
   - `CLAUDE.md`
   - `AI_AGENT_OPERATING_SYSTEM.md`
   - `.claude/rules/`
   - `.claude/skills/`
   - `.claude/agents/`
   - `docs/harness/README.md`
   - `docs/ai-runs/`
   - `second-brain/00_INDEX.md`
3. Prefer project `AGENTS.md` as the cross-agent project contract when present.
4. Do not load the whole repository by default.
5. Do not load the whole long-term knowledge base by default.
6. Classify the task before selecting tools and context.

## Task classes

- **Trivial**: typo, tiny docs edit, comment, one-line non-behavioral config.
- **Standard**: normal bugfix, small feature, small UI/backend change, focused test.
- **Complex**: multi-file feature, unclear bug, product flow change, architecture-sensitive refactor.
- **Core-risk**: auth, billing, payments, admin, security, database migration, production/deploy logic.
- **Research-only**: no edits, investigation, report findings.
- **Meta-harness improvement**: inspect logs, propose one small workflow improvement, compare evidence.

## Pareto rule

80% of tasks should be lightweight:

- small context;
- small diff;
- targeted verification;
- concise run log.

20% of risky tasks require:

- plan first;
- user approval;
- stricter verification;
- safety/security/evaluator checks where available.

## Context budget

Start small and escalate only with evidence.

- **Tiny**: up to 5 relevant files.
- **Medium**: up to 15 relevant files.
- **Large**: only for Complex/Core tasks, after plan/approval.
- **Core**: strictest mode, evidence required.

Never scan the entire repository or knowledge base by default.

## Complex/Core flow

If the project defines `improve plan` / `improve execute` or an equivalent planning/execution gate:

1. Start with plan only.
2. Ask for user approval.
3. Execute only the approved plan.
4. Stop before major scope expansion.

## Safety defaults

Do not touch high-risk files, credentials, production data, deployment, destructive commands, or payment/auth configuration unless the project harness allows it and the user explicitly confirms.

## Completion output

For every completed non-trivial task, report:

- task class;
- files inspected;
- files changed;
- checks run;
- result;
- remaining risks;
- where the run log was recorded.

## Completion gate

Before the final response:

1. Run the required verification.
2. Write the required run log.
3. Confirm the log includes result and remaining risk or failure.
4. Add a harness score when the scoring trigger is met.

A required run is incomplete if its log was omitted.
