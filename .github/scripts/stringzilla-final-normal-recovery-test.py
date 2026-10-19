#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Offline normal-only launch-guard tests. No API, JVM, compiler or timings.
Run: python3 TEST CONFIG
"""
import copy
import importlib.util
import sys
import unittest

path = sys.argv.pop(1)
spec = importlib.util.spec_from_file_location("actual_normal_guard", path)
c = importlib.util.module_from_spec(spec)
spec.loader.exec_module(c)


class NormalGuardTests(unittest.TestCase):
    def setUp(self):
        self.proof = {
            "schema": "stringzilla-final-normal-missing-v1", "source": c.SOURCE, "base": c.BASE,
            "run_id": c.MISSING_RUN, "head": c.MISSING_HEAD, "attempt": 1, "scope_sha256": c.SCOPE_HASH,
            "logical_groups": 12, "triplets": 1500, "timed_records": 0, "normal_result_artifacts": 0,
            "barrier_job_id": c.MISSING_BARRIER_JOB,
            "api_shape": "four-unexpanded-parents",
            "normal_job_names": {alias: alias + "_controls" for alias in c.PAIRS},
            "normal_job_ids": {alias: 201 + i for i, alias in enumerate(c.PAIRS)}}
        self.run = {"id": c.MISSING_RUN, "head_sha": c.MISSING_HEAD, "run_attempt": 1,
                    "status": "in_progress"}
        jobs = [{"id": c.MISSING_BARRIER_JOB, "name": "sky_fact_barrier", "run_id": c.MISSING_RUN,
                 "head_sha": c.MISSING_HEAD, "run_attempt": 1, "status": "completed",
                 "conclusion": "failure", "steps": []}]
        for alias, job_id in self.proof["normal_job_ids"].items():
            jobs.append({"id": job_id, "name": alias + "_controls", "run_id": c.MISSING_RUN,
                         "head_sha": c.MISSING_HEAD, "run_attempt": 1, "status": "completed",
                         "conclusion": "skipped", "steps": []})
        # Live and successful SKY measurements do not belong to the normal zero scope.
        jobs.append({"id": 999, "name": "avx512_controls (c1) / Final SKY c1 slot 2 on ubuntu-26.04",
                     "run_id": c.MISSING_RUN, "head_sha": c.MISSING_HEAD, "run_attempt": 1,
                     "status": "in_progress", "conclusion": None,
                     "steps": [{"name": "Measure final SKY c1 original enabled and disabled controls",
                                "status": "in_progress", "conclusion": None}]})
        self.jobs = {"total_count": len(jobs), "jobs": jobs}
        self.artifacts = {"total_count": 1, "artifacts": [
            {"name": "stringzilla-final-results-avx512-c2-" + c.MISSING_HEAD + "-attempt1"}]}

    def valid(self):
        return c.verify_missing(self.proof, self.run, self.jobs, self.artifacts)

    def reject(self):
        with self.assertRaises((AssertionError, KeyError)):
            self.valid()

    def test_live_and_completed_sky_do_not_block_zero_normal_scope(self):
        result = self.valid()
        self.assertEqual(result["triplets"], 1500)
        self.assertEqual(result["logical_groups"], 12)
        self.jobs["jobs"][-1].update(status="completed", conclusion="success")
        self.jobs["jobs"][-1]["steps"][0].update(status="completed", conclusion="success")
        self.valid()

    def test_exact_twelve_expanded_skips_are_supported(self):
        self.proof["api_shape"] = "twelve-expanded-controls"
        self.proof["normal_job_ids"], self.proof["normal_job_names"] = {}, {}
        normal = []
        for i, (alias, tier) in enumerate((a, t) for a in c.PAIRS for t in ("interpreter", "c1", "c2")):
            key = alias + "/" + tier
            name = alias + "_controls (" + tier + ") / " + alias + "-" + tier + " controls"
            job = {"id": 301 + i, "name": name, "run_id": c.MISSING_RUN, "head_sha": c.MISSING_HEAD,
                   "run_attempt": 1, "status": "completed", "conclusion": "skipped", "steps": []}
            normal.append(job)
            self.proof["normal_job_ids"][key], self.proof["normal_job_names"][key] = job["id"], name
        self.jobs["jobs"] = [self.jobs["jobs"][0], *normal, self.jobs["jobs"][-1]]
        self.jobs["total_count"] = len(self.jobs["jobs"])
        result = self.valid()
        self.assertEqual(len(result["normal_job_ids"]), 12)
        self.assertEqual(result["logical_groups"], 12)
        self.jobs["jobs"][1]["status"] = "in_progress"
        self.reject()

    def test_mixed_or_ambiguous_api_shapes_fail_closed(self):
        self.proof["api_shape"] = "twelve-expanded-controls"
        self.reject()
        self.proof["api_shape"] = "unknown"
        self.reject()
        self.proof["api_shape"] = "four-unexpanded-parents"
        self.proof["normal_job_names"]["serial"] = "avx512_controls (c1) / Final SKY c1 slot 0 on ubuntu-22.04"
        self.reject()

    def test_proof_context_scope_and_zero_counts_are_pinned(self):
        changes = [
            ("schema", "other"), ("source", "0" * 40), ("base", "0" * 40),
            ("run_id", c.MISSING_RUN + 1), ("head", "0" * 40), ("attempt", 2),
            ("scope_sha256", "0" * 64), ("logical_groups", 11), ("triplets", 1499),
            ("timed_records", 1), ("normal_result_artifacts", 1), ("barrier_job_id", 1),
        ]
        original = copy.deepcopy(self.proof)
        for key, value in changes:
            with self.subTest(field=key):
                self.proof = copy.deepcopy(original)
                self.proof[key] = value
                self.reject()

    def test_exact_independently_pinned_normal_ids_required(self):
        original = copy.deepcopy(self.proof)
        for ids in ({}, {"serial": 201}, {**original["normal_job_ids"], "avx512": 999},
                    {alias: 201 for alias in c.PAIRS},
                    {**original["normal_job_ids"], "serial": -1},
                    {**original["normal_job_ids"], "serial": True},
                    {**original["normal_job_ids"], "serial": 999}):
            with self.subTest(ids=ids):
                self.proof = copy.deepcopy(original)
                self.proof["normal_job_ids"] = ids
                self.reject()

    def test_current_run_head_attempt_are_not_producer_context(self):
        original = copy.deepcopy(self.run)
        for key, value in (("id", c.PRODUCER_RUN), ("head_sha", c.PRODUCER_HEAD), ("run_attempt", 2)):
            with self.subTest(field=key):
                self.run = copy.deepcopy(original)
                self.run[key] = value
                self.reject()

    def test_live_or_successful_barrier_cannot_launch_missing_only(self):
        original = copy.deepcopy(self.jobs)
        for key, value in (("id", 1), ("name", "other"), ("run_id", c.PRODUCER_RUN),
                           ("head_sha", c.PRODUCER_HEAD), ("run_attempt", 2),
                           ("status", "in_progress"), ("conclusion", "success")):
            with self.subTest(field=key):
                self.jobs = copy.deepcopy(original)
                self.jobs["jobs"][0][key] = value
                self.reject()

    def test_each_normal_must_be_terminal_skipped_with_same_identity(self):
        original = copy.deepcopy(self.jobs)
        for index in range(1, 5):
            for key, value in (("id", 900 + index), ("name", "other"), ("run_id", c.PRODUCER_RUN),
                               ("head_sha", c.PRODUCER_HEAD), ("run_attempt", 2),
                               ("status", "queued"), ("status", "in_progress"),
                               ("conclusion", "success"), ("conclusion", "failure")):
                with self.subTest(index=index, field=key, value=value):
                    self.jobs = copy.deepcopy(original)
                    self.jobs["jobs"][index][key] = value
                    self.reject()

    def test_no_normal_measurement_or_expanded_leaf_can_be_ignored(self):
        original = copy.deepcopy(self.jobs)
        for state, conclusion in (("in_progress", None), ("completed", "success")):
            self.jobs = copy.deepcopy(original)
            self.jobs["jobs"][1]["steps"] = [
                {"name": "Measure original enabled and disabled controls", "status": state, "conclusion": conclusion}]
            self.reject()
        for name in ("serial_controls (interpreter) / serial-interpreter controls",
                     "other / neon-c1 controls", "avx2_controls (c2) / avx2-c2 controls"):
            self.jobs = copy.deepcopy(original)
            extra = copy.deepcopy(self.jobs["jobs"][1])
            extra.update(id=900, name=name, status="completed", conclusion="skipped")
            self.jobs["jobs"].append(extra)
            self.jobs["total_count"] += 1
            self.reject()

    def test_normal_artifact_blocks_even_when_sky_artifact_is_valid(self):
        for alias in c.PAIRS:
            with self.subTest(alias=alias):
                self.artifacts = {"total_count": 2, "artifacts": [
                    {"name": "stringzilla-final-results-avx512-c2-" + c.MISSING_HEAD + "-attempt1"},
                    {"name": "stringzilla-final-results-" + alias + "-c2-" + c.MISSING_HEAD + "-attempt1"}]}
                self.reject()

    def test_missing_duplicate_or_paginated_metadata_fails_closed(self):
        original = copy.deepcopy(self.jobs)
        self.jobs["jobs"].pop(1)
        self.reject()
        self.jobs = copy.deepcopy(original)
        self.jobs["jobs"].append(copy.deepcopy(self.jobs["jobs"][1]))
        self.jobs["total_count"] += 1
        self.reject()
        self.jobs = copy.deepcopy(original)
        self.jobs["total_count"] = 101
        self.reject()
        self.jobs = copy.deepcopy(original)
        self.artifacts["total_count"] = 101
        self.reject()

    def test_fresh_guard_calls_only_read_apis_for_current_missing_run(self):
        class Fixture:
            def __init__(self, outer):
                self.outer, self.paths = outer, []
            def api(self, path):
                self.paths.append(path)
                if path == "actions/runs/" + str(c.MISSING_RUN):
                    return self.outer.run
                if path == "actions/runs/" + str(c.MISSING_RUN) + "/jobs?filter=all&per_page=100":
                    return self.outer.jobs
                if path == "actions/runs/" + str(c.MISSING_RUN) + "/artifacts?per_page=100":
                    return self.outer.artifacts
                raise AssertionError("Unexpected API: " + path)
        fixture = Fixture(self)
        result = c.fresh_missing(fixture, self.proof)
        self.assertEqual(len(fixture.paths), 3)
        self.assertEqual(result["normal_job_ids"], self.proof["normal_job_ids"])


if __name__ == "__main__":
    unittest.main()
