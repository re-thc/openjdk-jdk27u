#!/usr/bin/env python3
"""Exercise only the saved-byte transport; no compiler, JVM, or timing."""
import base64
import copy
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import random
import sys
import unittest

spec = importlib.util.spec_from_file_location("reader", Path(sys.argv.pop(1)))
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)


class Parts(unittest.TestCase):
    def payload(self, count=31):
        generator = random.Random(916)
        rows = []
        for index in range(count):
            phase = ("stock", "periodic", "utf16-probe")[index % 3]
            for control in ("original", "enabled", "disabled"):
                raw = bytes(generator.randrange(256) for _ in range(256))
                rows.append({"phase": phase, "case": "case" + str(index), "control": control,
                             "path": phase + "/case" + str(index) + "-" + control + ".json",
                             "content": base64.b64encode(raw).decode("ascii"),
                             "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()})
        return {"logical_case_id": "serial-c2", "raw_jmh": rows,
                "phases": [{"phase": phase, "triplets": sum(row["phase"] == phase for row in rows) // 3,
                            "raw_index": [{key: value for key, value in row.items() if key != "content"}
                                          for row in rows if row["phase"] == phase]}
                           for phase in ("stock", "periodic", "utf16-probe")],
                "jit": [{"timing_evidence": False, "lines": [{"line": 1, "text": "inline refusal"}]}]}

    def setUp(self):
        self.previous = reader.MAX_COMPRESSED, reader.MAX_PLAIN
        reader.MAX_COMPRESSED = 4096
        reader.MAX_PLAIN = 16384

    def tearDown(self):
        reader.MAX_COMPRESSED, reader.MAX_PLAIN = self.previous

    def test_bound_coverage_and_exact_bytes(self):
        original = self.payload()
        parts = reader.bundle_parts(original)
        self.assertGreater(len(parts), 1)
        restored = []
        for index, (value, plain, compressed) in enumerate(parts):
            self.assertLessEqual(len(compressed), reader.MAX_COMPRESSED)
            self.assertLessEqual(len(plain), reader.MAX_PLAIN)
            self.assertEqual(gzip.decompress(compressed), plain)
            self.assertEqual(json.loads(plain), value)
            self.assertEqual(value["part_index"], index)
            self.assertEqual(value["parts"], len(parts))
            self.assertEqual(value["whole_records"], 93)
            self.assertEqual(value["exported_triplets"] * 3, len(value["raw_jmh"]))
            self.assertEqual(bool(value["jit"]), index == 0)
            for phase in value["phases"]:
                rows = [row for row in value["raw_jmh"] if row["phase"] == phase["phase"]]
                self.assertEqual(phase["exported_triplets"] * 3, len(rows))
                self.assertEqual({row["path"] for row in rows}, {row["path"] for row in phase["raw_index"]})
            restored.extend(value["raw_jmh"])
        key = lambda row: row["path"]
        self.assertEqual(sorted(restored, key=key), sorted(original["raw_jmh"], key=key))
        self.assertEqual(reader.bundle_parts(original), parts)

    def test_single_part(self):
        parts = reader.bundle_parts(self.payload(1))
        self.assertEqual(len(parts), 1)
        self.assertEqual(parts[0][0]["whole_records"], 3)

    def test_refuse_partial_triplet(self):
        value = self.payload(1)
        value["raw_jmh"].pop()
        with self.assertRaises(AssertionError):
            reader.bundle_parts(value)

    def test_refuse_duplicate_control(self):
        value = self.payload(1)
        value["raw_jmh"][-1]["control"] = "enabled"
        with self.assertRaises(AssertionError):
            reader.bundle_parts(value)

    def test_refuse_one_triplet_over_limit(self):
        reader.MAX_COMPRESSED = 16
        with self.assertRaises(AssertionError):
            reader.bundle_parts(self.payload(1))

    def test_refuse_metadata_over_plain_limit(self):
        reader.MAX_PLAIN = 16
        with self.assertRaises(AssertionError):
            reader.bundle_parts(self.payload(1))


class Identity(unittest.TestCase):
    def setUp(self):
        self.previous_api = reader.api
        self.workflow = reader.SINGLE_HOST
        self.artifact = {"id": 1, "digest": "sha256:" + "a" * 64, "name": "saved",
                         "expired": False, "workflow_run": {"id": self.workflow["run_id"],
                                                           "head_sha": self.workflow["head"]}}
        self.steps = [{"number": number, "name": name, "status": "completed", "conclusion": "success"}
                      for number, name in enumerate(("Measure missing SKY interpreter controls",
                                                     "Retain completed SKY interpreter raw results"), 10)]
        self.job = {"id": 2, "run_id": self.workflow["run_id"], "head_sha": self.workflow["head"],
                    "name": "Single host missing SKY controls", "status": "completed", "conclusion": "failure",
                    "run_attempt": 1, "created_at": "created", "started_at": "started",
                    "completed_at": "completed", "steps": self.steps}
        reader.api = lambda path: self.artifact if path.startswith("actions/artifacts/") else self.job

    def tearDown(self):
        reader.api = self.previous_api

    def binding(self, kind="github-step"):
        return {"artifact_id": 1, "digest": self.artifact["digest"], "artifact_name": "saved",
                "job_id": 2, "job_name": self.job["name"], "attempt": 1,
                "execution_kind": kind, "successful_steps": copy.deepcopy(self.steps),
                "job_snapshot": copy.deepcopy(self.job)}

    def test_retains_real_failed_parent(self):
        before = copy.deepcopy(self.job)
        _, actual = reader.identity(self.binding(), self.workflow)
        self.assertEqual(actual, before)
        self.assertEqual(self.job["conclusion"], "failure")

    def test_ordinary_job_still_requires_success(self):
        with self.assertRaises(AssertionError):
            reader.identity(self.binding("github-job"), self.workflow)

    def test_ordinary_success_unchanged(self):
        self.job["conclusion"] = "success"
        _, actual = reader.identity(self.binding("github-job"), self.workflow)
        self.assertEqual(actual["conclusion"], "success")

    def test_failed_measure_step_rejected(self):
        self.job["steps"][0]["conclusion"] = "failure"
        with self.assertRaises(AssertionError):
            reader.identity(self.binding(), self.workflow)

    def test_other_workflow_cannot_use_step_exception(self):
        self.job["run_id"] = self.artifact["workflow_run"]["id"] = reader.PRODUCER["run_id"]
        self.job["head_sha"] = self.artifact["workflow_run"]["head_sha"] = reader.PRODUCER["head"]
        with self.assertRaises(AssertionError):
            reader.identity(self.binding(), reader.PRODUCER)

    def test_synthetic_success_snapshot_rejected(self):
        binding = self.binding()
        binding["job_snapshot"]["conclusion"] = "success"
        with self.assertRaises(AssertionError):
            reader.identity(binding, self.workflow)


if __name__ == "__main__":
    unittest.main()
