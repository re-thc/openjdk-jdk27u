#!/usr/bin/env python3
"""Check diagnostic extraction without running a JVM."""
import hashlib
import importlib.util
from pathlib import Path
import sys
import tempfile
import unittest

spec = importlib.util.spec_from_file_location("sky_jit", Path(sys.argv.pop(1)))
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)

class Code(unittest.TestCase):
    def sample(self, payload="4883 ec20 | 4883 c420 | c3"):
        return """Compiled method (c2) 100 10 java.lang.StringUTF16::indexOfChar0 (100 bytes)
 main code [0x0000000000001000, 0x0000000000001009] = 9
[MachCode]
  0x0000000000001000: """ + payload + """
                      ; - java.lang.StringUTF16::indexOfChar0@7 (line 1143)
[/MachCode]
"""

    def test_complete_bytes_and_layout(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "original.log"
            rows = reader.summarize_code(self.sample(), path)
            self.assertEqual(len(rows), 1)
            row = rows[0]
            self.assertEqual(row["main_code_bytes"], 9)
            self.assertEqual(row["entry_mod64"], 0)
            self.assertEqual(row["entry_mod4096"], 0)
            self.assertEqual(row["main_code_sha256"], hashlib.sha256(bytes.fromhex("4883ec204883c420c3")).hexdigest())
            self.assertEqual(row["stack_subtract_bytes"], [32])
            self.assertEqual(row["calls"], 0)
            self.assertEqual(row["selected_callframes"], [{"method": "java.lang.StringUTF16::indexOfChar0", "bci": 7}])
            self.assertFalse(row["timing_evidence"])
            self.assertNotIn("0x0000000000001000", str(row))

    def test_incomplete_hex_is_explicit(self):
        with tempfile.TemporaryDirectory() as temp:
            rows = reader.summarize_code(self.sample("90"), Path(temp) / "enabled.log")
            self.assertEqual(len(rows), 1)
            self.assertIn("machine_bytes_scope", rows[0])
            self.assertNotIn("main_code_sha256", rows[0])
            self.assertFalse(list(Path(temp).glob("*.bin")))

    def test_unrelated_or_unprinted_is_not_caller_evidence(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "disabled.log"
            self.assertEqual(reader.summarize_code("Compiled method (c2) 1 2 Other::work (1 bytes)\n", path), [])
            self.assertEqual(reader.summarize_code("Compiled method (c2) 1 2 java.lang.String::indexOf (33 bytes)\n", path), [])

if __name__ == "__main__":
    unittest.main()
