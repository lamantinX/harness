# Global Meta-Harness

Goal: improve agent workflows using evidence from real runs.

Do not optimize based on vibes.

## Track for meaningful runs

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

Do not log noisy trivial tasks unless they reveal a workflow problem.

## Improvement loop

After 5–10 meaningful runs:

1. Read run logs.
2. Identify repeated waste, failure, or friction.
3. Propose one small harness improvement.
4. Get approval.
5. Implement.
6. Compare future runs.

Do not rewrite the whole harness unless repeated evidence shows the structure is broken.
