#!/usr/bin/env python3
"""
VR Recovery CLI - Main Entry Point

VR Recovery case management CLI configuration using CLI_METADATA pattern.
All logic is in cli_framework - this is just configuration.
"""

from pathlib import Path
from cli_framework.config import CLIAppConfig

# CLI_METADATA: Configuration (not code!)
CLI_METADATA = CLIAppConfig(
    name='vr-recovery',
    description='VR Recovery case management interface',
    aliases={},
    env_requirements={}
)

# Use framework to handle all routing/help/arg parsing
from cli_framework.runtime.app import run_cli


def main():
    """Entry point for setuptools console_scripts."""
    run_cli(CLI_METADATA, repo_root=Path(__file__).parent)


if __name__ == '__main__':
    main()
