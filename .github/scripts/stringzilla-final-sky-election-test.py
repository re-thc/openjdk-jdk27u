#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Offline election tests: python3 this_file.py path/to/election.py EXPECTED_SHA256.

Imports and exercises the actual election authentication functions. No API, image,
JVM, compiler or timing command is executed. The mocked gh call writes fixture ZIPs.
"""
import copy
import hashlib
import importlib.util
import io
import itertools
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock
import warnings
import zipfile

MODULE_PATH = Path(sys.argv.pop(1)).resolve()
EXPECTED_SHA = sys.argv.pop(1)
assert hashlib.sha256(MODULE_PATH.read_bytes()).hexdigest() == EXPECTED_SHA
ROOT = tempfile.TemporaryDirectory()
os.environ.update(SOURCE="9" * 40, SOURCE_TREE="a" * 40, TIER="interpreter",
                  RUNNER_TEMP=ROOT.name, GITHUB_REPOSITORY="re-thc/openjdk-jdk27u",
                  GITHUB_RUN_ID="17", GITHUB_SHA="b" * 40, GITHUB_RUN_ATTEMPT="1",
                  GITHUB_OUTPUT=str(Path(ROOT.name) / "outputs"), SKY_SLOT="0",
                  RUNNER_NAME="runner-0")
spec = importlib.util.spec_from_file_location("actual_election", MODULE_PATH)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
ORIGINAL_LIVE_JOBS = m.live_jobs
FLAGS = ("avx avx2 bmi1 bmi2 f16c fma movbe popcnt sse4_1 sse4_2 ssse3 cx16 "
         "avx512f avx512bw avx512vl abm")


class ElectionTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT.name)
        self.addCleanup(self.temp.cleanup)
        self.folder = Path(self.temp.name)
        self.ctx = m.context()
        self.jobs, self.proofs, self.artifacts, self.bytes = {}, {}, {}, {}
        self.patches = []
        for i in m.SLOTS:
            job = {"id": 100 + int(i), "name": m.name(i), "runner_id": 200 + int(i),
                   "runner_name": "runner-" + i, "run_id": 17, "head_sha": "b" * 40,
                   "run_attempt": 1, "labels": [m.SLOTS[i]], "status": "in_progress",
                   "conclusion": None,
                   "steps": [{"name": m.PUBLISH, "status": "completed", "conclusion": "success"}]}
            proof = {**self.ctx, "schema": "stringzilla-sky-allfour-fact-v1",
                     "source": m.SOURCE, "base": m.BASE, "source_trees": m.TREES,
                     "tier": m.TIER, "backend": "avx512", "slot": i,
                     "host_runner_label": m.SLOTS[i], "container_image": m.IMAGE,
                     "native_execution": True, "algorithm_sha256": EXPECTED_SHA,
                     "nonce": ("%032x" % (int(i) + 1)), "job": copy.deepcopy(job),
                     "runner_name": job["runner_name"], "timed_records": 0, "images_restored": False,
                     "fields": {"flags": FLAGS, "model name": "fixture CPU"},
                     "machine": "x86_64", "available": True, "missing": [],
                     "os_release_sha256": "c" * 64, "libc_sha256": "d" * 64,
                     "cpu": 0}
            self.jobs[i], self.proofs[i] = job, proof
            self.pack(i)
        self.patch(m, "live_jobs", return_value=self.jobs)
        self.patch(m, "api", side_effect=self.fixture_api)
        self.patch(m.subprocess, "run", side_effect=self.fixture_gh)
        self.own("0")

    def patch(self, target, name, **kwargs):
        p = mock.patch.object(target, name, **kwargs)
        obj = p.start()
        self.addCleanup(p.stop)
        return obj

    def pack(self, slot, names=None, raw=None):
        if raw is None:
            raw = (json.dumps(self.proofs[slot], indent=2) + "\n").encode()
        stream = io.BytesIO()
        with warnings.catch_warnings():
            warnings.simplefilter("ignore", UserWarning)
            with zipfile.ZipFile(stream, "w") as z:
                for name in (names if names is not None else ["eligibility.json"]):
                    z.writestr(name, raw)
        data = stream.getvalue()
        artifact = {"id": 300 + int(slot), "name": m.fact_name(self.ctx, slot),
                    "expired": False, "digest": "sha256:" + hashlib.sha256(data).hexdigest(),
                    "workflow_run": {"id": 17, "head_sha": "b" * 40}}
        self.bytes[artifact["id"]], self.artifacts[slot] = data, artifact
        cached = self.folder / ("fact-" + slot + ".zip")
        if cached.exists():
            cached.unlink()

    def fixture_api(self, path):
        assert path.endswith("/artifacts?per_page=100"), path
        return {"total_count": len(self.artifacts), "artifacts": list(self.artifacts.values())}

    def fixture_gh(self, args, stdout, check, timeout):
        assert args[:2] == ["gh", "api"] and check and timeout == 60
        artifact_id = int(args[2].split("/")[-2])
        stdout.write(self.bytes[artifact_id])
        return None

    def own(self, slot):
        os.environ.update(SKY_SLOT=slot, RUNNER_NAME="runner-" + slot,
                          FACT_ARTIFACT_ID=str(self.artifacts[slot]["id"]),
                          FACT_ARTIFACT_DIGEST=self.artifacts[slot]["digest"])
        m.write(self.folder / "eligibility.json", self.proofs[slot])

    def reject(self, function, *args):
        with self.assertRaises(AssertionError):
            function(*args)

    def test_verify_fact_rejects_context_and_cpu_mutations(self):
        m.verify_fact(self.proofs["0"], "0", self.jobs["0"], self.ctx)
        changes = [
            ("schema", "wrong"), ("run_id", 18), ("head", "e" * 40), ("attempt", 2),
            ("source", "e" * 40), ("base", "e" * 40), ("source_trees", {}),
            ("tier", "c1"), ("backend", "avx2"), ("slot", "1"),
            ("host_runner_label", "ubuntu-24.04"), ("container_image", "wrong"),
            ("native_execution", False), ("algorithm_sha256", "e" * 64),
            ("nonce", "x"), ("timed_records", 1), ("images_restored", True),
            ("runner_name", "other"), ("available", False), ("available", 1),
            ("missing", ["avx2"]), ("os_release_sha256", "x"), ("libc_sha256", "x"),
            ("machine", "aarch64"), ("fields", {"flags": FLAGS.replace("avx512bw", "")}),
        ]
        for key, value in changes:
            with self.subTest(field=key):
                p = copy.deepcopy(self.proofs["0"])
                p[key] = value
                self.reject(m.verify_fact, p, "0", self.jobs["0"], self.ctx)
        for key, value in [("id", 999), ("name", "other"), ("runner_id", 0),
                           ("runner_name", "other"), ("run_id", 18),
                           ("head_sha", "e" * 40), ("run_attempt", 2)]:
            with self.subTest(job_field=key):
                p = copy.deepcopy(self.proofs["0"])
                p["job"][key] = value
                self.reject(m.verify_fact, p, "0", self.jobs["0"], self.ctx)
        job = copy.deepcopy(self.jobs["0"])
        job["labels"] = []
        self.reject(m.verify_fact, self.proofs["0"], "0", job, self.ctx)

    def test_actual_download_metadata_and_zip_digest(self):
        good = self.artifacts["0"]
        m.download(good, self.folder / "good.zip", self.ctx)
        for key, value in [("expired", True), ("digest", "invalid"),
                           ("digest", "sha256:" + "0" * 64),
                           ("workflow_run", {"id": 18, "head_sha": "b" * 40}),
                           ("workflow_run", {"id": 17, "head_sha": "e" * 40})]:
            with self.subTest(field=key, value=value):
                artifact = copy.deepcopy(good)
                artifact[key] = value
                self.reject(m.download, artifact, self.folder / "bad.zip", self.ctx)

    def test_actual_read_fact_zip_shape_context_and_cache(self):
        proof, binding = m.read_fact(self.folder, "0", self.artifacts["0"], self.jobs["0"], self.ctx)
        self.assertEqual(proof, self.proofs["0"])
        self.assertEqual(binding["artifact_id"], self.artifacts["0"]["id"])
        artifact = copy.deepcopy(self.artifacts["0"])
        artifact["digest"] = "sha256:" + "0" * 64
        self.reject(m.read_fact, self.folder, "0", artifact, self.jobs["0"], self.ctx)
        for names in ([], ["eligibility.json", "extra"], ["../eligibility.json"],
                      ["eligibility.json", "eligibility.json"]):
            with self.subTest(names=names):
                self.pack("0", names=names)
                self.reject(m.read_fact, self.folder, "0", self.artifacts["0"], self.jobs["0"], self.ctx)
        self.proofs["0"]["head"] = "e" * 40
        self.pack("0")
        self.reject(m.read_fact, self.folder, "0", self.artifacts["0"], self.jobs["0"], self.ctx)

    def test_published_facts_waits_and_rejects_ambiguous_or_failed_publication(self):
        self.assertEqual(set(m.published_facts(self.ctx, self.jobs)), set(m.SLOTS))
        saved = self.artifacts.pop("0")
        self.assertEqual(set(m.published_facts(self.ctx, self.jobs)), {"1", "2", "3"})
        self.jobs["0"]["status"] = "completed"
        self.reject(m.published_facts, self.ctx, self.jobs)
        self.jobs["0"]["status"] = "in_progress"
        self.artifacts["0"] = saved
        self.jobs["0"]["steps"][0].update(status="in_progress", conclusion=None)
        self.assertNotIn("0", m.published_facts(self.ctx, self.jobs))
        self.jobs["0"]["steps"][0].update(status="completed", conclusion="failure")
        self.reject(m.published_facts, self.ctx, self.jobs)
        self.jobs["0"]["steps"][0]["conclusion"] = "success"
        self.jobs["0"]["steps"].append(copy.deepcopy(self.jobs["0"]["steps"][0]))
        self.reject(m.published_facts, self.ctx, self.jobs)
        self.jobs["0"]["steps"].pop()
        with mock.patch.object(m, "api", return_value={
                "total_count": 5, "artifacts": list(self.artifacts.values()) + [saved]}):
            self.reject(m.published_facts, self.ctx, self.jobs)
        with mock.patch.object(m, "api", return_value={"total_count": 101, "artifacts": []}):
            self.reject(m.published_facts, self.ctx, self.jobs)

    def test_own_fact_requires_raw_upload_binding(self):
        proof, binding = m.read_fact(self.folder, "0", self.artifacts["0"], self.jobs["0"], self.ctx)
        m.verify_own_fact(self.folder, self.proofs["0"], proof, binding)
        own = copy.deepcopy(self.proofs["0"])
        own["cpu"] = 9
        self.reject(m.verify_own_fact, self.folder, own, proof, binding)
        for env, value in [("FACT_ARTIFACT_ID", "999"), ("FACT_ARTIFACT_DIGEST", "sha256:" + "e" * 64)]:
            with mock.patch.dict(os.environ, {env: value}):
                self.reject(m.verify_own_fact, self.folder, proof, proof, binding)
        (self.folder / "eligibility.json").write_text(json.dumps(proof))
        self.reject(m.verify_own_fact, self.folder, proof, proof, binding)

    def test_all_eligibilities_and_all_arrival_orders_using_actual_known_loss(self):
        schedules = 0
        for flags in itertools.product((False, True), repeat=4):
            minimum = next((i for i, flag in enumerate(flags) if flag), None)
            for order in itertools.permutations(range(4)):
                visible, exited = {}, set()
                for arrived in order:
                    visible[str(arrived)] = {"available": flags[arrived]}
                    for i in range(4):
                        slot = str(i)
                        if slot in visible and m.known_loss(slot, visible) is not None:
                            exited.add(i)
                    remaining = [i for i in range(4) if str(i) in visible and i not in exited]
                    self.assertLessEqual(len(remaining), 1)
                    if minimum is not None and str(minimum) in visible:
                        self.assertNotIn(minimum, exited)
                self.assertEqual([i for i in range(4) if i not in exited],
                                 [] if minimum is None else [minimum])
                schedules += 1
        self.assertEqual(schedules, 384)

    def test_actual_wait_releases_lower_eligible_without_slot_zero(self):
        self.own("3")
        clock = [0]
        def ready(ctx, jobs):
            return {i: self.artifacts[i] for i in (["3"] if clock[0] == 0 else ["1", "3"])}
        with mock.patch.object(m, "published_facts", side_effect=ready), \
             mock.patch.object(m.time, "monotonic", side_effect=lambda: clock[0]), \
             mock.patch.object(m.time, "sleep", side_effect=lambda n: clock.__setitem__(0, clock[0] + n)):
            loss = m.wait_for_full_set_or_loss(self.folder, self.proofs["3"], "3", 90)
        self.assertEqual(loss["reason"], "lower-eligible")
        self.assertEqual(loss["lower_slot"], "1")
        self.assertEqual(set(loss["facts"]), {"1", "3"})
        self.assertNotIn("selected_slot", loss)
        self.assertFalse(loss["images_restored"])
        self.assertEqual(loss["timed_records"], 0)

    def test_actual_wait_releases_unavailable_own_fact(self):
        self.proofs["3"]["fields"]["flags"] = ""
        self.proofs["3"]["available"], self.proofs["3"]["missing"] = m.derive({}, "x86_64")
        self.pack("3")
        self.own("3")
        with mock.patch.object(m, "published_facts", return_value={"3": self.artifacts["3"]}):
            loss = m.wait_for_full_set_or_loss(self.folder, self.proofs["3"], "3", float("inf"))
        self.assertEqual(loss["reason"], "own-unavailable")
        self.assertEqual(set(loss["facts"]), {"3"})

    def test_slot_zero_cannot_release_runtime_with_missing_higher_fact(self):
        with mock.patch.object(m, "published_facts", return_value={"0": self.artifacts["0"]}), \
             mock.patch.object(m.time, "monotonic", return_value=10):
            self.reject(m.wait_for_full_set_or_loss, self.folder, self.proofs["0"], "0", 9)
        self.artifacts.pop("3")
        self.reject(m.collect_facts, self.folder)

    def test_complete_set_and_no_replacement_after_selected_failure(self):
        selection, _, _ = m.collect_facts(self.folder)
        self.assertEqual(selection["selected_slot"], "0")
        self.assertEqual(set(selection["facts"]), set(m.SLOTS))
        self.jobs["0"].update(status="completed", conclusion="failure")
        self.reject(m.collect_facts, self.folder)

    def test_complete_set_rejects_duplicate_nonces_and_all_unavailable(self):
        self.proofs["1"]["nonce"] = self.proofs["0"]["nonce"]
        self.pack("1")
        self.reject(m.collect_facts, self.folder)
        for slot in m.SLOTS:
            self.proofs[slot]["nonce"] = "%032x" % (int(slot) + 1)
            self.proofs[slot]["fields"]["flags"] = ""
            self.proofs[slot]["available"], self.proofs[slot]["missing"] = m.derive({}, "x86_64")
            self.pack(slot)
        self.reject(m.collect_facts, self.folder)

    def test_select_early_exit_has_no_full_selection_or_winner_host_call(self):
        loss = {"schema": "stringzilla-sky-early-exit-v1", "reason": "lower-eligible"}
        outputs = []
        with mock.patch.object(m, "FOLDER", self.folder), \
             mock.patch.object(m, "wait_for_full_set_or_loss", return_value=loss), \
             mock.patch.object(m, "collect_facts", side_effect=AssertionError("unexpected full election")), \
             mock.patch.object(m, "verify_current", side_effect=AssertionError("unexpected winner host check")), \
             mock.patch.object(m, "output", side_effect=lambda k, v: outputs.append((k, v))):
            m.select()
        self.assertEqual(outputs, [("selected", "false")])
        self.assertEqual(json.loads((self.folder / "early-exit.json").read_text()), loss)
        self.assertFalse((self.folder / "selection.json").exists())

    def test_select_complete_winner_preserves_own_host_and_full_map(self):
        outputs = []
        with mock.patch.object(m, "FOLDER", self.folder), \
             mock.patch.object(m, "verify_current") as host, \
             mock.patch.object(m, "output", side_effect=lambda k, v: outputs.append((k, v))):
            m.select()
        host.assert_called_once_with(self.proofs["0"])
        self.assertIn(("selected", "true"), outputs)
        self.assertEqual(set(json.loads((self.folder / "selection.json").read_text())["facts"]), set(m.SLOTS))

    def test_actual_live_jobs_rejects_missing_duplicate_or_wrong_context(self):
        with mock.patch.object(m, "api", return_value={"total_count": 4, "jobs": list(self.jobs.values())}):
            self.assertEqual(set(ORIGINAL_LIVE_JOBS(self.ctx)), set(m.SLOTS))
        for payload in (
            {"total_count": 3, "jobs": list(self.jobs.values())[1:]},
            {"total_count": 5, "jobs": list(self.jobs.values()) + [self.jobs["0"]]},
            {"total_count": 101, "jobs": []},
        ):
            with mock.patch.object(m, "api", return_value=payload):
                self.reject(ORIGINAL_LIVE_JOBS, self.ctx)
        for key, value in (("head_sha", "e" * 40), ("run_id", 18), ("run_attempt", 2)):
            jobs = copy.deepcopy(self.jobs)
            jobs["0"][key] = value
            with mock.patch.object(m, "api", return_value={"total_count": 4, "jobs": list(jobs.values())}):
                self.reject(ORIGINAL_LIVE_JOBS, self.ctx)

    def test_actual_same_host_reattestation_rejects_changed_worker(self):
        proof = self.proofs["0"]
        with mock.patch.object(m, "host", return_value=copy.deepcopy(proof)):
            m.verify_current(proof)
        for key, value in (("available", False), ("cpu", 9), ("container_image", "other"),
                           ("os_release_sha256", "e" * 64), ("libc_sha256", "e" * 64),
                           ("fields", {"flags": FLAGS + " extra", "model name": "fixture CPU"})):
            current = copy.deepcopy(proof)
            current[key] = value
            with mock.patch.object(m, "host", return_value=current):
                self.reject(m.verify_current, proof)
        with mock.patch.dict(os.environ, RUNNER_NAME="other"):
            self.reject(m.verify_current, proof)

    def test_final_receipt_still_requires_one_success_and_three_skips(self):
        selection, _, _ = m.collect_facts(self.folder)
        m.write(self.folder / "selection.json", selection)
        for slot, job in self.jobs.items():
            job.update(status="completed", conclusion="success")
            job["steps"].append({"name": "Measure final SKY " + m.TIER +
                " original enabled and disabled controls", "status": "completed",
                "conclusion": "success" if slot == "0" else "skipped"})
        result = m.verify_saved(self.folder, completed=True)
        self.assertEqual(result["selected_slot"], "0")
        self.jobs["1"]["steps"][-1]["conclusion"] = "success"
        with self.assertRaises(AssertionError):
            m.verify_saved(self.folder, completed=True)
        self.jobs["1"]["steps"][-1]["conclusion"] = "skipped"
        self.jobs["2"]["status"] = "in_progress"
        with self.assertRaises(AssertionError):
            m.verify_saved(self.folder, completed=True)

    def test_barrier_passes_one_shared_deadline_across_all_tiers(self):
        jobs = []
        saved_tier = m.TIER
        for tier in ("interpreter", "c1", "c2"):
            m.TIER = tier
            jobs += [{"name": m.name(slot), "run_attempt": 1} for slot in m.SLOTS]
        m.TIER = saved_tier
        seen = []
        def collect(folder, wait=False, deadline=None):
            self.assertTrue(wait)
            seen.append(deadline)
            return {"selected_slot": "0"}, {}, {}
        cwd = os.getcwd()
        try:
            os.chdir(self.folder)
            with mock.patch.object(m, "api", return_value={"total_count": 12, "jobs": jobs}), \
                 mock.patch.object(m.time, "monotonic", return_value=100), \
                 mock.patch.object(m, "collect_facts", side_effect=collect):
                m.barrier()
        finally:
            os.chdir(cwd)
            m.TIER = saved_tier
        self.assertEqual(seen, [100 + 90 * 60] * 3)


if __name__ == "__main__":
    unittest.main()
