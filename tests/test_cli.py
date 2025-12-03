"""Tests for vr_recovery CLI commands."""

import subprocess
import unittest


class TestVrRecoveryCLI(unittest.TestCase):
    """Test vr-recovery CLI read-only commands."""

    def _run(self, *args: str) -> subprocess.CompletedProcess:
        return subprocess.run(
            ['python3', '-m', 'vr_recovery', *args],
            capture_output=True,
            text=True,
            timeout=30,
        )

    def test_cases_list(self):
        """vr-recovery cases list runs without error."""
        result = self._run('cases', 'list')
        self.assertEqual(result.returncode, 0, result.stderr)


if __name__ == '__main__':
    unittest.main()
