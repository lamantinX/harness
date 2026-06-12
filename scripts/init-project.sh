#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=0
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
fi

KIT_DIR="${AI_HARNESS_KIT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
PROJECT="$(basename "$ROOT")"
TEMPLATE="$KIT_DIR/project-template"

copy_file() {
  local src="$1"
  local dest="$2"
  if [[ -e "$dest" ]]; then
    echo "skip existing: ${dest#$ROOT/}"
    return
  fi
  echo "create: ${dest#$ROOT/}"
  if [[ "$DRY_RUN" != "1" ]]; then
    mkdir -p "$(dirname "$dest")"
    sed "s/{{PROJECT_NAME}}/$PROJECT/g; s/{{STACK}}/TODO/g; s/{{TEST_COMMANDS}}/TODO/g; s/{{CRITICAL_AREAS}}/TODO/g; s/{{DEPLOY_POLICY}}/TODO/g; s/{{DEFAULT_BRANCH}}/main/g; s/{{STAGING_BRANCH}}/staging/g" "$src" > "$dest"
  fi
}

echo "Init project harness for $ROOT"
[[ "$DRY_RUN" == "1" ]] && echo "DRY RUN: no writes"

while IFS= read -r -d '' src; do
  rel="${src#$TEMPLATE/}"
  dest="$ROOT/$rel"
  dest="${dest%.tmpl}"
  copy_file "$src" "$dest"
done < <(find "$TEMPLATE" -type f -print0)

echo "Done"
