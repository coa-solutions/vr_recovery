#!/bin/bash
# Install pre-commit hook for vr-recovery repo

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
HOOK_DST="$REPO_ROOT/.git/hooks/pre-commit"

# Write hook directly to .git/hooks/pre-commit
cat > "$HOOK_DST" << 'EOF'
#!/bin/bash
# Pre-commit hook for vr-recovery repo: regenerate CLAUDE.md

set -e

# Get repo root (parent of .git directory)
REPO_ROOT="$(git rev-parse --show-toplevel)"

# Use pyenv Python if available (read from repo's .python-version)
if [ -n "$HOME" ] && [ -f "$REPO_ROOT/.python-version" ]; then
  PYENV_VERSION=$(cat "$REPO_ROOT/.python-version" | tr -d '[:space:]')
  if [ -n "$PYENV_VERSION" ]; then
    PYTHON_CANDIDATE="$HOME/.pyenv/versions/$PYENV_VERSION/bin/python3"
    if [ -x "$PYTHON_CANDIDATE" ]; then
      PYTHON="$PYTHON_CANDIDATE"
    fi
  fi
fi

# Fall back to pyenv shims if direct path didn't work
if [ -z "$PYTHON" ] && [ -x "$HOME/.pyenv/shims/python3" ]; then
  PYTHON="$HOME/.pyenv/shims/python3"
fi

# Final fallback to system python
if [ -z "$PYTHON" ]; then
  PYTHON="python3"
fi

echo "🔄 Regenerating vr-recovery/CLAUDE.md from --help output..."

# Run generator script
"$PYTHON" "$REPO_ROOT/.claude/auto-generate-docs/generate_claude_md.py"

# Stage updated CLAUDE.md
git add CLAUDE.md

echo "✓ CLAUDE.md updated and staged"
EOF

chmod +x "$HOOK_DST"

echo "✓ Pre-commit hook installed for vr-recovery repo"
echo "  Location: $HOOK_DST"
echo ""
echo "To test: python3 .claude/auto-generate-docs/generate_claude_md.py"
