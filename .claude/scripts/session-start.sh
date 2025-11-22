#!/usr/bin/env bash
# VR Recovery CLI session start
set -e

echo "=== VR Recovery Session Start ==="

# Fix pip cache permissions if running as root
if [ "$(id -u)" = "0" ] && [ -d "$HOME/.cache" ]; then
  chown -R root:root "$HOME/.cache" 2>/dev/null || true
  chown root:root "$HOME" 2>/dev/null || true
fi

# Install uv if not present (10-100x faster than pip)
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
  # Verify uv is now available
  if ! command -v uv >/dev/null 2>&1; then
    echo "ERROR: uv installation failed"
    exit 1
  fi
fi

# Check multiple locations for cli_framework
if [ -d "$HOME/cli_framework" ]; then
  FRAMEWORK_DIR="$HOME/cli_framework"
  echo "✓ Using global cli_framework"
elif [ -d "../cli_framework" ]; then
  FRAMEWORK_DIR="../cli_framework"
  echo "✓ Using shared cli_framework"
else
  FRAMEWORK_DIR="../cli_framework"
  git clone --depth 1 --quiet https://x-access-token:${GH_TOKEN}@github.com/coa-solutions/cli_framework.git "$FRAMEWORK_DIR"
  if [ ! -d "$FRAMEWORK_DIR" ]; then
    echo "ERROR: Failed to clone cli_framework"
    exit 1
  fi
  echo "✓ cli_framework cloned to parent directory"
fi

# Install CLI (no venv, install to system Python for speed)
# Install cli_framework first to get shared dependencies
uv pip install --system --break-system-packages -q -e "$FRAMEWORK_DIR" -e .
echo "✓ vr-recovery installed"

echo "✓ Session start complete"
