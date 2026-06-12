# Run-Log Discipline

This directory is the evidence trail for changes to the harness itself.

## Required Runs

Log every Standard, Complex, Core-risk, Research-only, and Meta-harness task after verification and before the final response.

Each entry must include:

- task class and risk;
- files inspected and changed;
- checks actually run;
- result;
- failure or remaining risk;
- one harness note.

Do not mark a run as passing when a required check did not run.

An `aih score --draft` entry is not a completed score and does not satisfy the score trigger.

## Score Trigger

Update `harness-scores.md`:

- after every five required run logs;
- immediately after a failed, rolled-back, security-sensitive, or high-friction run.

Every score requires evidence and exactly one next improvement.
