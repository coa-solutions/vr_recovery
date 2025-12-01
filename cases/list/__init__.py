"""
VR Recovery Cases List Command

List all VR recovery cases with their status and details.
"""

from cli_framework import CommandMetadata

# CLI metadata for command discovery
CLI_METADATA = CommandMetadata(
    path=['cases', 'list'],
    command='list',
    handler='main',
    method=['read'],
    description='List all VR recovery cases'
)

from .core import main

__all__ = ['main', 'CLI_METADATA']
