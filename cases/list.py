"""List all VR recovery cases."""

METHOD = 'read'

from dataclasses import dataclass, field
from typing import List


@dataclass
class CaseInfo:
    """Individual case information."""
    id: str
    status: str
    client: str


@dataclass
class CasesListResult:
    """Result model for cases list command."""
    success: bool
    count: int
    data: List[CaseInfo] = field(default_factory=list)


def respond() -> CasesListResult:
    """List all VR recovery cases."""
    cases = [
        CaseInfo(id="VR-001", status="active", client="Sample Client 1"),
        CaseInfo(id="VR-002", status="pending", client="Sample Client 2"),
    ]

    return CasesListResult(
        success=True,
        data=cases,
        count=len(cases)
    )
