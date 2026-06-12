#!/usr/bin/env bash
set -euo pipefail

HARNESS_HOME="${AI_HARNESS_HOME:-$HOME/.ai-harness}"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

echo "AI Harness doctor"
echo "Harness home: $HARNESS_HOME"
echo "Current root: $ROOT"
echo

for f in GLOBAL_AGENT_PROTOCOL.md GLOBAL_META_HARNESS.md BOOTSTRAP_PROMPT.md; do
  if [[ -f "$HARNESS_HOME/$f" ]]; then
    echo "ok: $HARNESS_HOME/$f"
  else
    echo "missing: $HARNESS_HOME/$f"
  fi
done

echo
echo "Tools:"
for cmd in git gh claude codex agy caveman ctx; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "ok: $cmd -> $(command -v "$cmd")"
  else
    echo "missing: $cmd"
  fi
done

echo
echo "Project harness:"
for path in AGENTS.md CLAUDE.md AI_AGENT_OPERATING_SYSTEM.md .claude/rules docs/harness/README.md docs/ai-runs second-brain/00_INDEX.md; do
  if [[ -e "$ROOT/$path" ]]; then
    echo "found: $path"
  else
    echo "absent: $path"
  fi
done
