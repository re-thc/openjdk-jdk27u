#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""Verify fixed sampling and failure gates without launching a benchmark."""
import json
from pathlib import Path
import re
import tempfile
import unittest

from campaign import array, plan, samples, verdict, MEASUREMENT_LIMIT
from prepare import verify_jtreg


class CampaignTests(unittest.TestCase):
    def test_review_publication_has_no_automatic_campaign_trigger(self):
        workflow = Path(__file__).resolve().parents[2] / ".github/workflows/pr39-aarch64-qualification.yml"
        text = workflow.read_text()
        events = text.split("\non:\n", 1)[1].split("\npermissions:", 1)[0]
        self.assertEqual(re.findall(r"(?m)^  ([a-z_]+):", events), ["workflow_dispatch"])
        self.assertEqual(text.count("github.event.inputs.reviewed_commit == github.sha"), 2)
        self.assertEqual(text.count("github.event_name == 'workflow_dispatch'"), 2)

    def test_plan_is_fixed_and_unique(self):
        cases = plan()
        self.assertEqual({k: len(v) for k, v in cases.items()}, {"screen": 34, "main": 98})
        rows = [json.dumps(row, sort_keys=True) for group in cases.values() for row in group]
        self.assertEqual(len(rows), len(set(rows)))
        for size in (8, 128):
            for difference in range(1, 8):
                self.assertIn(array(size, difference), cases["screen"])
        for size, difference in ((65536, 1), (65536, 7), (65536, 10),
                                 (131072, 25), (131072, 82), (131072, 1267)):
            self.assertIn(array(size, difference), cases["screen"])
        self.assertLess(MEASUREMENT_LIMIT, 30 * 60)

    def test_balanced_consistent_loss_is_a_regression(self):
        observations = [{"base": [10, 10, 10], "candidate": [12, 12, 12]}] * 2
        self.assertEqual(verdict(observations)["status"], "regression")

    def test_order_sensitive_loss_is_inconclusive(self):
        observations = [{"base": [100] * 3, "candidate": [106] * 3},
                        {"base": [100] * 3, "candidate": [104] * 3}]
        self.assertEqual(verdict(observations)["status"], "inconclusive")

    def test_noise_cannot_pass(self):
        observations = [{"base": [10, 10, 10], "candidate": [10, 10, 15]}] * 2
        self.assertEqual(verdict(observations)["status"], "inconclusive")
        drift = [{"base": [10] * 3, "candidate": [10] * 3},
                 {"base": [12] * 3, "candidate": [12] * 3}]
        self.assertEqual(verdict(drift)["status"], "inconclusive")

    def test_control_must_remain_within_five_percent(self):
        observations = [{"base": [10] * 3, "candidate": [9] * 3}] * 2
        self.assertEqual(verdict(observations, True)["status"], "inconclusive")
        self.assertEqual(verdict(observations)["status"], "pass")

    def test_incomplete_and_nonfinite_jmh_data_are_rejected(self):
        case = array(8, 7)
        result = {"benchmark": case["benchmark"], "params": case["params"],
                  "forks": 1, "threads": 1, "mode": "avgt",
                  "primaryMetric": {"scoreUnit": "ns/op", "rawData": [[10, 10, 10]]}}
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "jmh.json"
            path.write_text(json.dumps([result]))
            self.assertEqual(samples(path, case), [10, 10, 10])
            for data in ([[10, 10]], [[10, float("nan"), 10]], [[10, -1, 10]], [[10, 10, 10], [10, 10, 10]]):
                result["primaryMetric"]["rawData"] = data
                path.write_text(json.dumps([result]))
                with self.assertRaises(ValueError):
                    samples(path, case)

    def test_missing_skipped_and_failed_jtreg_results_cannot_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            test = "test/jdk/java/foreign/TestLongMismatch.java"
            with self.assertRaises(RuntimeError):
                verify_jtreg(root, [test])
            result = root / "result.jtr"
            for status in ("Not run. requires false", "Failed. wrong result", "Error. timeout"):
                result.write_text("test=java/foreign/TestLongMismatch.java\nexecStatus=" + status + "\n")
                with self.assertRaises(RuntimeError):
                    verify_jtreg(root, [test])
            result.write_text("test=java/foreign/TestLongMismatch.java\nexecStatus=Passed. Execution successful\n")
            verify_jtreg(root, [test])

    def test_required_graph_ids_cannot_be_silently_skipped(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            test = "test/hotspot/jtreg/compiler/intrinsics/NativeVectorizedMismatchTest.java"
            for name in ("ir", "ir-serial"):
                (root / (name + ".jtr")).write_text(
                    "test=compiler/intrinsics/NativeVectorizedMismatchTest.java\\#" + name +
                    "\nexecStatus=Passed. Execution successful\n")
            with self.assertRaises(RuntimeError):
                verify_jtreg(root, [test])
            (root / "ideal.jtr").write_text(
                "test=compiler/intrinsics/NativeVectorizedMismatchTest.java\\#ideal\nexecStatus=Passed. Execution successful\n")
            verify_jtreg(root, [test])


if __name__ == "__main__":
    unittest.main()
