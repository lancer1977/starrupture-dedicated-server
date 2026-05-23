import unittest
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(ROOT)

from config_contracts import (  # noqa: E402
    has_service_port_line,
    missing_required_env_keys_from_readme,
    read_readme,
)


class ConfigContractTests(unittest.TestCase):
    def setUp(self) -> None:
        self.readme_lines = read_readme("README.md")

    def test_env_example_contains_required_keys(self):
        missing = missing_required_env_keys_from_readme("README.md")
        self.assertFalse(missing, f"Missing env keys: {sorted(missing)}")

    def test_readme_has_starrupture_service_context(self):
        joined = "\n".join(self.readme_lines)
        self.assertIn("starrupture", joined)

    def test_readme_exposes_udp_port_7777(self):
        self.assertTrue(has_service_port_line(self.readme_lines, "7777"))

    def test_readme_documents_environment_variable(self):
        joined = "\n".join(self.readme_lines)
        self.assertIn("SERVER_PORT", joined)


if __name__ == "__main__":
    unittest.main()
