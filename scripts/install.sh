#!/usr/bin/env bash
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_DIR="${AI_HARNESS_HOME:-$HOME/.ai-harness}"

mkdir -p "$INSTALL_DIR/bin" "$INSTALL_DIR/adapters" "$INSTALL_DIR/templates" "$INSTALL_DIR/logs"

cp "$KIT_DIR/global/"*.md "$INSTALL_DIR/"
cp "$KIT_DIR/adapters/"*.md "$INSTALL_DIR/adapters/"
cp "$KIT_DIR/templates/"*.md "$INSTALL_DIR/templates/"
cp "$KIT_DIR/bin/"* "$INSTALL_DIR/bin/"
chmod +x "$INSTALL_DIR/bin/"*

if [[ ! -f "$INSTALL_DIR/tools.local.yaml" && -f "$KIT_DIR/machine/tools.local.yaml.example" ]]; then
  cp "$KIT_DIR/machine/tools.local.yaml.example" "$INSTALL_DIR/tools.local.yaml"
fi

echo "Installed AI Harness Kit to $INSTALL_DIR"
echo "Add to PATH if needed:"
echo "  export PATH=\"$INSTALL_DIR/bin:\$PATH\""
"$INSTALL_DIR/bin/aih" doctor || true
