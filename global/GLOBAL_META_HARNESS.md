# Global Meta-Harness

Goal: improve agent workflows using evidence from real runs.

Do not optimize based on vibes.

## Track for required runs

- date
- project
- agent/tool
- model
- task
- task class
- risk tier
- plan used
- user approval
- files inspected
- files changed
- checks run
- result
- failure if any
- context/token notes
- harness improvement note

## Score dimensions

1. correctness
2. context efficiency
3. diff minimality
4. safety
5. verification quality
6. speed
7. user friction

## Logging rule

- If the project has `docs/ai-runs/`, log there.
- Otherwise log to `~/.ai-harness/logs/<project>.md`.
- Log every Standard, Complex, Core-risk, Research-only, and Meta-harness task.
- Write the entry after verification and before the final response.
- Include the actual result, failed checks, and remaining risks. Never record an unverified pass.
- Trivial tasks may be skipped only when they create no durable change and expose no workflow issue.

## Score log

- Keep the cumulative score log at `docs/ai-runs/harness-scores.md`, or `~/.ai-harness/logs/<project>-scores.md` when no project log directory exists.
- Add one score entry after every five required run logs.
- Add one immediately after a failed, rolled-back, security-sensitive, or high-friction run.
- Score from evidence in the sampled run logs. Empty evidence means the score is not complete.
- Treat `aih score --draft` output as incomplete until every dimension has a 1-5 score and evidence.
- Select exactly one next improvement. Do not create a broad rewrite list.

## Improvement loop

After each five-run sample:

1. Read run logs.
2. Identify repeated waste, failure, or friction.
3. Propose one small harness improvement.
4. Get approval.
5. Implement.
6. Compare future runs.

Do not rewrite the whole harness unless repeated evidence shows the structure is broken.
