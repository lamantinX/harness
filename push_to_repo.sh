#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-git@github.com:lamantinX/harness.git}"
BRANCH="${2:-main}"

git init
git add .
git commit -m "feat: bootstrap portable AI harness kit"
git branch -M "$BRANCH"
git remote add origin "$REPO"
git push -u origin "$BRANCH"
