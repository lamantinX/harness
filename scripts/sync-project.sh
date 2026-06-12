#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=0
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
fi

KIT_DIR="${AI_HARNESS_KIT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TEMPLATE="$KIT_DIR/project-template"

echo "Sync project harness for $ROOT"
[[ "$DRY_RUN" == "1" ]] && echo "DRY RUN: no writes"

while IFS= read -r -d '' src; do
  rel="${src#$TEMPLATE/}"
  dest="$ROOT/${rel%.tmpl}"
  if [[ -e "$dest" ]]; then
    echo "exists: ${dest#$ROOT/}"
  else
    echo "missing, would create: ${dest#$ROOT/}"
    if [[ "$DRY_RUN" != "1" ]]; then
      mkdir -p "$(dirname "$dest")"
      cp "$src" "$dest"
    fi
  fi
done < <(find "$TEMPLATE" -type f -print0)

echo "Sync check complete"
