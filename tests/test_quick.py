"""Quick smoke tests - imports only."""
import unittest


class TestQuick(unittest.TestCase):
    def test_imports(self):
        import vr_recovery
        self.assertIsNotNone(vr_recovery)


if __name__ == '__main__':
    unittest.main()
