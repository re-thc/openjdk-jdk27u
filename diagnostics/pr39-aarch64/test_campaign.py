#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""Verify fixed sampling and failure gates without launching a benchmark."""
import json
from pathlib import Path
import re
import shutil
import tempfile
import unittest
from unittest import mock

import campaign
import prepare
from campaign import array, memory, plan, samples, verdict, MEASUREMENT_LIMIT, Deadline, ProfilingUnavailable
from prepare import verify_jtreg


class CampaignTests(unittest.TestCase):
    def test_review_publication_has_no_automatic_campaign_trigger(self):
        workflow = Path(__file__).resolve().parents[2] / ".github/workflows/pr39-aarch64-qualification.yml"
        text = workflow.read_text()
        events = text.split("\non:\n", 1)[1].split("\npermissions:", 1)[0]
        self.assertEqual(re.findall(r"(?m)^  ([a-z_]+):", events), ["workflow_dispatch"])
        self.assertEqual(text.count("github.event.inputs.reviewed_commit == github.sha"), 2)
        self.assertEqual(text.count("github.event_name == 'workflow_dispatch'"), 2)
        job_header = text.split("  qualification:\n", 1)[1].split("    steps:\n", 1)[0]
        self.assertNotRegex(job_header, r"\$\{\{\s*runner\.")
        caps = [int(x) for x in re.findall(r"(?m)^        timeout-minutes: (\d+)$", text.split("  qualification:\n", 1)[1])]
        self.assertEqual(sum(caps), 204)
        self.assertLessEqual(sum(caps), 210 - 6)
        self.assertRegex(text, r"Retain raw results[^\n]*\n        if: always\(\)\n        timeout-minutes: 8")

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
        for storage in ("HEAP", "HEAP_NATIVE", "NATIVE_HEAP"):
            for size in (64, 128):
                for difference in ("MATCH", "FIRST_WORD"):
                    self.assertIn(memory(size, storage, difference, mode="c1"), cases["main"])

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
                  "primaryMetric": {"scoreUnit": "ns/op", "rawData": [[10, 10, 10]]},
                  "secondaryMetrics": self.gc_metrics()}
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "jmh.json"
            path.write_text(json.dumps([result]))
            self.assertEqual(samples(path, case), [10, 10, 10])
            for data in ([[10, 10]], [[10, float("nan"), 10]], [[10, -1, 10]], [[10, 10, 10], [10, 10, 10]]):
                result["primaryMetric"]["rawData"] = data
                path.write_text(json.dumps([result]))
                with self.assertRaises(ValueError):
                    samples(path, case)

    @staticmethod
    def gc_metrics():
        return {"gc.alloc.rate": {"score": 0, "scoreUnit": "MB/sec", "rawData": [[0, 0, 0]]},
                "gc.count": {"score": 0, "scoreUnit": "counts", "rawData": [[0, 0, 0]]}}

    def test_gc_profiling_distinguishes_zero_from_unavailable(self):
        campaign.validate_gc(self.gc_metrics(), "zero-without-optional-metrics")
        changed = self.gc_metrics()
        changed["gc.count"].update(score=1, rawData=[[0, 1, 0]])
        campaign.validate_gc(changed, "collection-without-time-change")
        for label in ("gc.alloc.rate", "gc.count"):
            changed = self.gc_metrics()
            del changed[label]
            with self.assertRaises(ProfilingUnavailable):
                campaign.validate_gc(changed, "unsupported")
            for invalid in (float("nan"), float("inf"), -1):
                changed = self.gc_metrics()
                changed[label]["rawData"][0][1] = invalid
                with self.assertRaises(ProfilingUnavailable):
                    campaign.validate_gc(changed, "invalid")
        changed = self.gc_metrics()
        changed["gc.count"]["rawData"][0][1] = 0.5
        with self.assertRaises(ProfilingUnavailable):
            campaign.validate_gc(changed, "fractional-count")
        changed = self.gc_metrics()
        changed["gc.alloc.rate"].update(score=1, rawData=[[0, 1, 2]])
        with self.assertRaises(ProfilingUnavailable):
            campaign.validate_gc(changed, "missing-positive-normalization")
        changed["gc.alloc.rate.norm"] = {"score": 2, "scoreUnit": "B/op", "rawData": [[2, 2]]}
        changed["gc.time"] = {"score": 1, "scoreUnit": "ms", "rawData": [[1]]}
        campaign.validate_gc(changed, "valid-optional-partial-observations")

    def test_expired_correctness_admits_zero_work_and_no_receipt(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            times = iter([0, prepare.CORRECTNESS_LIMIT + 1])
            with mock.patch("campaign.time.monotonic", side_effect=lambda: next(times, prepare.CORRECTNESS_LIMIT + 1)), \
                 mock.patch("prepare.run") as execute:
                with self.assertRaises(TimeoutError):
                    prepare.correctness(root, root)
                execute.assert_not_called()
            self.assertFalse((root / "correctness-pass.json").exists())

    def test_correctness_stops_after_group_or_probe_overruns(self):
        for expire_call in (1, 5, 112):
            with self.subTest(expire_call=expire_call), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                clock, calls = [0], []
                def execute(*args, **kwargs):
                    calls.append(args)
                    if len(calls) == expire_call:
                        clock[0] = prepare.CORRECTNESS_LIMIT + 1
                with mock.patch("campaign.time.monotonic", side_effect=lambda: clock[0]), \
                     mock.patch("prepare.run", side_effect=execute), mock.patch("prepare.verify_jtreg"):
                    with self.assertRaises(TimeoutError):
                        prepare.correctness(root, root)
                self.assertEqual(len(calls), expire_call)
                self.assertFalse((root / "correctness-pass.json").exists())

    def test_pass_receipt_is_removed_if_serialization_expires(self):
        for name in ("correctness-pass.json", "performance-pass.json"):
            with self.subTest(name=name), tempfile.TemporaryDirectory() as directory:
                clock = [0]
                original_save = campaign.save
                def late_save(path, value):
                    original_save(path, value)
                    clock[0] = 2
                with mock.patch("campaign.time.monotonic", side_effect=lambda: clock[0]):
                    deadline = Deadline(1, "fixture")
                    with mock.patch("campaign.save", side_effect=late_save), self.assertRaises(TimeoutError):
                        deadline.publish(Path(directory) / name, {"status": "pass"})
                self.assertEqual(list(Path(directory).iterdir()), [])

    def test_pass_receipt_is_removed_if_deadline_crosses_during_rename(self):
        with tempfile.TemporaryDirectory() as directory, \
             mock.patch("campaign.time.monotonic", side_effect=[0, 0, 0, 2]):
            deadline = Deadline(1, "fixture")
            with self.assertRaises(TimeoutError):
                deadline.publish(Path(directory) / "correctness-pass.json", {"status": "pass"})
            self.assertEqual(list(Path(directory).iterdir()), [])

    def test_installed_tier_is_read_from_nmethods_not_requested_flags(self):
        with tempfile.TemporaryDirectory() as directory:
            prefix = Path(directory) / "fork"
            log = Path(directory) / "fork-compilation-123.xml"
            log.write_text("<hotspot_log><nmethod compiler='c1' level='1' stamp='0.4' "
                           "method='org.openjdk.bench.java.util.ArraysMismatchEarlyExit mismatch ()I'/></hotspot_log>")
            with self.assertRaises(ValueError):
                campaign.installed_tier(prefix, array(8, 7))
            campaign.installed_tier(prefix, array(8, 7, mode="c1"))
            evidence = json.loads((Path(directory) / "fork-installed-code.json").read_text())
            self.assertEqual(evidence["installed_nmethods"][0]["compiler"], "c1")
            log.write_text("<hotspot_log/>")
            campaign.installed_tier(prefix, array(8, 7, mode="int"))
            with self.assertRaises(ValueError):
                campaign.installed_tier(prefix, array(8, 7))

    def test_disk_admission_and_pruning_preserve_images(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            usage = shutil._ntuple_diskusage(100, 60, 40)
            with mock.patch("prepare.shutil.disk_usage", return_value=usage), self.assertRaises(RuntimeError):
                prepare.capacity(root, root, "fixture", 41)
            self.assertFalse(json.loads((root / "disk-fixture.json").read_text())["admitted"])
            for name in ("hotspot/object.o", "support/native/lib.o", "support/test/helper.jar", "images/jdk/bin/java", "images/test/native.so", "spec.gmk"):
                path = root / "output" / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text("fixture")
            prepare.prune_build(root / "output", baseline=False)
            self.assertFalse((root / "output/hotspot").exists())
            self.assertFalse((root / "output/support/native").exists())
            self.assertTrue((root / "output/support/test/helper.jar").exists())
            self.assertTrue((root / "output/images/test/native.so").exists())
            prepare.prune_build(root / "output", baseline=True)
            self.assertEqual([p.name for p in (root / "output").iterdir()], ["images"])

    def test_pruning_rejects_an_image_link_to_build_objects(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            (output / "hotspot").mkdir()
            library = output / "hotspot/libfixture.so"
            library.write_text("owned object")
            (output / "images/jdk").mkdir(parents=True)
            (output / "images/jdk/libfixture.so").symlink_to(library)
            with self.assertRaises(RuntimeError):
                prepare.prune_build(output, baseline=False)
            self.assertTrue(library.exists())

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
