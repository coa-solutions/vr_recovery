#!/bin/bash

# Only run on Linux
if [ "$(uname -s)" != "Linux" ]; then
  exit 0
fi

# Skip if cli_framework already exists
if [ -d "$HOME/cli_framework" ]; then
  exit 0
fi

# Load GH_TOKEN from .env
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
ENV_FILE="$REPO_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
  GH_TOKEN=$(grep -E '^GH_TOKEN=' "$ENV_FILE" | cut -d '=' -f2-)
fi

if [ -z "$GH_TOKEN" ]; then
  echo "Warning: GH_TOKEN not found in .env, cannot clone cli_framework"
  exit 0
fi

# Clone cli_framework (suppress stderr on success)
git clone "https://${GH_TOKEN}@github.com/coa-solutions/cli_framework.git" "$HOME/cli_framework" 2>/dev/null
