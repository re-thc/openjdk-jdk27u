"""Offline tests only. Never launches Java, native builds, benchmarks or CI."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

from summarize import c2_evidence

HERE = Path(__file__).resolve().parent


class OfflineToolsTest(unittest.TestCase):
    def test_dry_run_matrices_and_default_optimizations(self):
        with tempfile.TemporaryDirectory(prefix="c2-plan-test-") as directory:
            root = Path(directory)
            artifact, gate = root / "artifact.json", root / "gate.json"
            artifact.write_text(json.dumps({"classpath": [str(root / "qualification.jar")]}))
            gate.write_text(json.dumps({"codec_target_removed": False}))
            common = ["--artifact", str(artifact), "--receipts", str(root / "receipts"),
                      "--repo", str(root / "repo"), "--audit", str(root / "audit.json"),
                      "--cpus", "0,1", "--corpus", str(root / "corpus"), "--out", str(root / "out")]
            for stage, extra, expected in [("preflight", [], 5), ("diagnostics", [], 44),
                                           ("timing", [], 252), ("timing", ["--gate", str(gate)], 132)]:
                result = json.loads(subprocess.check_output(
                    [sys.executable, str(HERE / "matrix.py"), stage, *common, *extra]))
                self.assertEqual(len(result["commands"]), expected)
                if stage == "timing":
                    for command in result["commands"]:
                        flags = command["argv"][command["argv"].index("-jvmArgs") + 1]
                        for forbidden in ("LoopMaxUnroll", "PrintIdeal", "PrintAssembly", "-TieredCompilation"):
                            self.assertNotIn(forbidden, flags)
                    for cell in {x["cell"] for x in result["timing_tasks"]}:
                        for pair in range(6):
                            sides = [x["side"] for x in result["timing_tasks"]
                                     if x["cell"] == cell and x["pair"] == pair]
                            self.assertCountEqual(sides, ["baseline", "candidate"])
                if stage == "diagnostics":
                    product = [x for x in result["commands"] if "-product-" in x["name"]]
                    self.assertEqual(len(product), 22)
                    for command in product:
                        self.assertIn("directives-product.json", " ".join(command["argv"]))
            self.assertEqual(set(root.iterdir()), {artifact, gate}, "dry run must not create outputs")

    def test_optimized_python_cannot_disable_execution_gates(self):
        for name in ("audit.py", "build_harness.py", "matrix.py", "summarize.py"):
            result = subprocess.run([sys.executable, "-O", str(HERE / name)], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("without -O", result.stderr)

    def test_c2_must_be_live_at_measurement(self):
        with tempfile.TemporaryDirectory(prefix="c2-evidence-test-") as directory:
            root = Path(directory)
            task = {"name": "case", "method": "vectorCursor"}
            (root / "case.log").write_text("qualification-iteration=6 uptime-ms=1000\n")

            def evidence(extra="", stamp="0.5", kind=""):
                (root / "case-1.xml").write_text(
                    "<nmethod compile_id='1' compiler='c2' " + kind + " stamp='" + stamp
                    + "' method='qualification.BoundsQualification vectorCursor ()I'/>\n" + extra)
                return c2_evidence(root, task)

            self.assertIsNone(evidence()["needs_review"])
            warmup = evidence("<make_not_entrant compile_id='1' stamp='0.8'/>")
            self.assertIsNotNone(warmup["needs_review"])
            self.assertTrue(warmup["normal_c2_before_measurement"][0]["invalidated_before_measurement_start"])
            measured = evidence("<make_not_entrant compile_id='1' stamp='1.5'/>")
            self.assertIsNotNone(measured["needs_review"])
            self.assertTrue(measured["normal_c2_before_measurement"][0]["invalidated_after_measurement_start"])
            self.assertIsNotNone(evidence(stamp="1.2")["needs_review"])
            self.assertIsNotNone(evidence(kind="compile_kind='osr'")["needs_review"])
            (root / "case.log").write_text("measurement clock missing\n")
            self.assertIsNotNone(evidence()["needs_review"])


if __name__ == "__main__":
    unittest.main()
