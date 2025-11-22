#!/usr/bin/env python3
"""Generate vr-recovery/CLAUDE.md from CLI --help output"""

import subprocess
import json
import sys
from pathlib import Path


def run_help() -> dict:
    """Run CLI with --help and parse JSON output"""
    vr_recovery_root = Path(__file__).parent.parent

    result = subprocess.run(
        [sys.executable, '-m', 'vr_recovery', '--help'],
        capture_output=True,
        text=True,
        cwd=vr_recovery_root
    )

    # Filter out warnings/errors, get just the JSON line
    for line in result.stdout.split('\n'):
        if line.strip().startswith('{'):
            return json.loads(line)

    # If no JSON found, show error
    if result.returncode != 0:
        print("Error running: python3 -m vr_recovery --help", file=sys.stderr)
        print(result.stderr, file=sys.stderr)

    raise RuntimeError("No JSON output from: python3 -m vr_recovery --help")


def main():
    vr_recovery_root = Path(__file__).parent.parent

    print("Generating vr-recovery/CLAUDE.md from: python3 -m vr_recovery --help")
    vr_recovery_data = run_help()
    (vr_recovery_root / 'CLAUDE.md').write_text(
        json.dumps(vr_recovery_data) + '\n'
    )
    print("✓ Generated vr-recovery/CLAUDE.md")


if __name__ == '__main__':
    try:
        main()
    except ModuleNotFoundError as e:
        print(f"\nERROR: Missing Python module: {e}", file=sys.stderr)
        print("Make sure all dependencies are installed:", file=sys.stderr)
        print("  uv pip install --system -e ~/cli_framework", file=sys.stderr)
        print("  uv pip install --system -e .", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"\nERROR: Failed to generate CLAUDE.md: {e}", file=sys.stderr)
        print(f"Error type: {type(e).__name__}", file=sys.stderr)
        sys.exit(1)
