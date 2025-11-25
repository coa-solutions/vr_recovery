#!/bin/bash

# Only run on Linux
if [ "$(uname -s)" != "Linux" ]; then
  exit 0
fi

# Determine the target directory for cli_framework
# Use /home/user/cli_framework to match pyproject.toml's ../cli_framework reference
CLI_FRAMEWORK_DIR="/home/user/cli_framework"

# Skip if cli_framework already exists
if [ -d "$CLI_FRAMEWORK_DIR" ]; then
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

# Clone cli_framework to the expected location (suppress stderr on success)
git clone "https://${GH_TOKEN}@github.com/coa-solutions/cli_framework.git" "$CLI_FRAMEWORK_DIR" 2>/dev/null

# Install cli_framework and the vr-recovery CLI
pip3 install -e "$CLI_FRAMEWORK_DIR" -q 2>/dev/null
pip3 install -e "$REPO_ROOT" -q 2>/dev/null
