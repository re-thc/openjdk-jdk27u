#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Offline tests of the actual single-host guards. No API, images, JVM or timings."""
import copy
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock
import zipfile

MODULE_PATH = Path(sys.argv.pop(1)).resolve()
ROOT = tempfile.TemporaryDirectory()
os.environ.update(RUNNER_TEMP=ROOT.name, GITHUB_REPOSITORY="re-thc/openjdk-jdk27u",
    GITHUB_RUN_ID="17", GITHUB_SHA="b" * 40, GITHUB_RUN_ATTEMPT="1",
    GITHUB_OUTPUT=str(Path(ROOT.name) / "outputs"), GITHUB_ENV=str(Path(ROOT.name) / "env"),
    RUNNER_NAME="fixture-runner", STRINGZILLA_SKY_AUTHORIZATION="single-host-v1")
spec = importlib.util.spec_from_file_location("actual_single_sky", MODULE_PATH)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
FLAGS = ("avx avx2 bmi1 bmi2 f16c fma movbe popcnt sse4_1 sse4_2 ssse3 cx16 "
         "avx512f avx512bw avx512vl abm")


def raw(value):
    return (json.dumps(value, indent=2) + "\n").encode()


def pack(files):
    stream = io.BytesIO()
    with zipfile.ZipFile(stream, "w") as archive:
        for name, data in files.items():
            archive.writestr(name, data)
    return stream.getvalue()


class SingleHostTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT.name)
        self.addCleanup(self.temp.cleanup)
        self.folder = Path(self.temp.name)
        previous_cwd = Path.cwd()
        workspace = self.folder / "cwd"
        workspace.mkdir()
        os.chdir(workspace)
        self.addCleanup(lambda: os.chdir(previous_cwd))
        self.ctx = m.context()
        self.api_objects, self.archives = {}, {}
        self.patch(m, "api", side_effect=lambda path: self.api_objects[path])
        self.patch(m.subprocess, "run", side_effect=self.gh)
        self.patch(m, "FOLDER", new=self.folder)
        self.patch(m, "HERE", new=self.folder)
        self.patch(m, "MISSING_TIERS", new=("interpreter",))
        self.patch(m, "MISSING_PROOF_HASH", new="e" * 64)
        self.driver = self.folder / "stringzilla-final.py"
        self.driver.write_text("# synthetic input identity only\n")
        self.job = {"id": 100, "name": m.WORKER, "run_id": 17, "head_sha": "b" * 40,
            "run_attempt": 1, "runner_id": 200, "runner_name": "fixture-runner",
            "status": "completed", "conclusion": "failure",
            "steps": [{"name": name, "number": number, "status": "completed", "conclusion": "success"}
                for number, name in enumerate(("Publish immutable single-host CPU fact",
                    "Measure missing SKY interpreter controls",
                    "Retain completed SKY interpreter raw results"), 1)]}
        self.prior = json.loads((MODULE_PATH.parent / "stringzilla-single-sky-prior-attempt-zero.json").read_text())
        self.queued_zero = self.queued_fixture()
        self.inputs = {"schema": "stringzilla-single-sky-preparation-v1", **self.ctx,
            "source": m.SOURCE, "source_tree": m.SOURCE_TREE, "base": m.BASE,
            "module_sha256": m.sha(MODULE_PATH), "tiers": ["interpreter"],
            "missing_proof_sha256": m.MISSING_PROOF_HASH, "helper_sha256": m.HELPER_HASH,
            "manifest_sha256": m.MANIFEST_HASH, "python_auth_tests_passed": True,
            "independent_scope_model_passed": True, "prior_attempt_zero_sha256": m.PRIOR_ZERO_SHA256,
            "prior_attempt_zero": self.prior, "superseded_queued_zero": self.queued_zero,
            "superseded_queued_zero_sha256": m.raw_sha(raw(self.queued_zero)), "producer_run": m.PAIR_RUN,
            "producer_head": m.PAIR_HEAD, "pair_artifact_id": m.PAIR_ID,
            "pair_artifact_digest": m.PAIR_DIGEST, "driver_sha256": m.sha(self.driver),
            "image_hashes": {"original": "1" * 64, "fork": "2" * 64}}
        prep = self.artifact(301, "stringzilla-single-sky-preparation-" + self.ctx["head"],
                             {"preparation.json": raw(self.inputs)})
        self.fact = {**self.ctx, "schema": "stringzilla-single-host-fact-v1", "mode": "single-host-v1",
            "source": m.SOURCE, "source_tree": m.SOURCE_TREE, "base": m.BASE, "tiers": ["interpreter"],
            "module_sha256": m.sha(MODULE_PATH), "job_id": 100, "job_name": m.WORKER,
            "runner_id": 200, "runner_name": "fixture-runner", "nonce": "c" * 32,
            "container_image": m.IMAGE, "native_execution": True, "available": True, "missing": [],
            "timed_records": 0, "images_restored": False, "cpu": 0, "machine": "x86_64",
            "fields": {"flags": FLAGS, "model name": "fixture CPU"},
            "os_release_sha256": "3" * 64, "libc_sha256": "4" * 64,
            "inputs": self.inputs, "preparation": {"artifact_id": prep["id"], "artifact_digest": prep["digest"],
                "proof_sha256": m.raw_sha(raw(self.inputs))}}
        art = self.artifact(300, "stringzilla-single-sky-fact-" + self.ctx["head"],
                            {"lease.json": raw(self.fact)})
        self.binding = {"artifact_id": art["id"], "artifact_digest": art["digest"],
                        "proof_sha256": m.raw_sha(raw(self.fact))}
        self.runtime = {"available": True, "source": m.SOURCE, "backend": "avx512", "tier": "interpreter",
            "timed_records": 0, "observations": {control: {"returncode": 0, "actual": value, "expected": value}
                for control, value in {"original": "3", "enabled": "3:2:true", "disabled": "3:2:false"}.items()}}
        self.files = {"runtime-attestation.json": raw(self.runtime),
            "native-validation.json": raw({"passed": True}),
            "native-validation/run.log": b"requested=2 selected=2 executable=1\n"}
        self.ready = {"schema": "stringzilla-single-host-ready-v1", "tier": "interpreter",
            "nonce": self.fact["nonce"], "job_id": self.job["id"],
            **{key + "_sha256": m.raw_sha(self.files[path]) for key, path in (
                ("runtime", "runtime-attestation.json"), ("native", "native-validation.json"),
                ("native_log", "native-validation/run.log"))}}
        self.events = [{"tier": "interpreter", "phase": phase, "job_id": 100, "runner_id": 200,
            "nonce": self.fact["nonce"], "cpu": 0, "fact": self.binding}
            for phase in ("restore", "measure", "periodic", "utf16-probe")]
        self.files["tier-console.log"] = b"synthetic protocol binding only\n"
        self.record = {"schema": "stringzilla-single-host-tier-v1", **self.ctx,
            "source": m.SOURCE, "base": m.BASE, "tier": "interpreter", "complete": True,
            "triplets": 136, "fact": self.fact, "fact_binding": self.binding, "ready": self.ready,
            "authorizations": self.events, "console_sha256": m.raw_sha(self.files["tier-console.log"])}
        self.files.update({"single-host-fact.json": raw(self.fact),
            "single-host-fact.zip": self.archives[300], "single-host-preparation.zip": self.archives[301]})

    def patch(self, target, name, **kwargs):
        p = mock.patch.object(target, name, **kwargs)
        value = p.start()
        self.addCleanup(p.stop)
        return value

    def artifact(self, ident, name, files):
        data = pack(files)
        value = {"id": ident, "name": name, "expired": False,
            "digest": "sha256:" + m.raw_sha(data), "workflow_run": {"id": 17, "head_sha": "b" * 40}}
        self.api_objects["actions/artifacts/" + str(ident)] = value
        self.archives[ident] = data
        return value

    def gh(self, args, stdout, check, timeout):
        assert args[:2] == ["gh", "api"] and check and timeout in (60, 120)
        stdout.write(self.archives[int(args[2].split("/")[-2])])

    def reject(self, function, *args):
        with self.assertRaises((AssertionError, KeyError, FileNotFoundError)):
            function(*args)

    def tier(self, record=None, job=None):
        files = {**self.files, "single-host-binding.json": raw(self.record if record is None else record)}
        with zipfile.ZipFile(io.BytesIO(pack(files))) as bundle:
            return m.verify_tier_artifact(bundle, "interpreter", self.job if job is None else job)

    def test_previous_attempt_requires_fresh_terminal_zero_api_and_pinned_proof(self):
        self.patch(m, "MISSING_TIERS", new=("interpreter", "c1"))
        path = "actions/runs/" + str(m.PRIOR_ZERO_RUN)
        configuration = {"id": 999, "name": "Authenticate exact missing-only scope and original complete pair",
            "status": "completed", "conclusion": "success"}
        worker = {**copy.deepcopy(self.prior["worker"])}
        collector = {**self.prior["collector"],
            "name": "Qualify exact completed missing SKY controls and preserve failed parent status"}
        jobs = [configuration, worker, collector]
        for job in jobs:
            job.update(run_id=m.PRIOR_ZERO_RUN, head_sha=m.PRIOR_ZERO_HEAD, run_attempt=1)
        expected = self.prior["artifacts"][0]
        artifact = {**{key: expected[key] for key in ("id", "name", "digest", "expired")},
            "size_in_bytes": expected["size"],
            "workflow_run": {"id": m.PRIOR_ZERO_RUN, "head_sha": m.PRIOR_ZERO_HEAD}}
        run = {"id": m.PRIOR_ZERO_RUN, "head_sha": m.PRIOR_ZERO_HEAD,
               "run_attempt": 1, "status": "completed", "conclusion": "failure"}
        self.api_objects.update({path: run, path + "/jobs?filter=all&per_page=100":
            {"total_count": 3, "jobs": jobs}, path + "/artifacts?per_page=100":
            {"total_count": 1, "artifacts": [artifact]}})
        self.assertEqual(m.verify_prior_attempt_zero(self.prior), self.prior)
        for obj, field, value in ((run, "status", "in_progress"), (run, "run_attempt", 2),
                (run, "head_sha", "e" * 40), (worker, "conclusion", "success"),
                (worker, "status", "queued"), (worker, "run_attempt", 2),
                (worker, "id", 1), (collector, "conclusion", "success"),
                (collector, "status", "in_progress"), (configuration, "conclusion", "failure"),
                (artifact, "digest", "sha256:" + "0" * 64), (artifact, "expired", True),
                (artifact, "size_in_bytes", 0), (artifact["workflow_run"], "head_sha", "e" * 40)):
            previous = obj[field]
            obj[field] = value
            self.reject(m.verify_prior_attempt_zero, self.prior)
            obj[field] = previous
        step = next(step for step in worker["steps"] if step["name"] == "Measure missing SKY c1 controls")
        step["conclusion"] = "success"
        self.reject(m.verify_prior_attempt_zero, self.prior)
        step["conclusion"] = "skipped"
        jobs.append({**collector})
        self.reject(m.verify_prior_attempt_zero, self.prior)
        jobs.pop()
        self.api_objects[path + "/artifacts?per_page=100"]["artifacts"].append(
            {"name": "stringzilla-final-results-avx512-c1-unexpected"})
        self.reject(m.verify_prior_attempt_zero, self.prior)
        changed = {**self.prior, "timed_records": 1}
        self.reject(m.verify_prior_attempt_zero, changed)
        changed_inputs = {**self.inputs, "tiers": ["interpreter", "c1"], "prior_attempt_zero_sha256": "0" * 64}
        self.reject(m.verify_inputs, changed_inputs)

    def test_probe_rechecks_previous_zero_before_current_worker_or_cpu(self):
        with mock.patch.dict(os.environ, SOURCE=m.SOURCE, SOURCE_TREE=m.SOURCE_TREE), \
             mock.patch.object(m, "FOLDER", self.folder / "new-probe"), \
             mock.patch.object(m, "preparation", return_value=(self.inputs, {})), \
             mock.patch.object(m, "verify_prior_attempt_zero", side_effect=AssertionError("not zero")), \
             mock.patch.object(m, "current_job") as job, mock.patch.object(m, "host") as host:
            self.reject(m.probe)
            job.assert_not_called()
            host.assert_not_called()

    def test_upload_digest_formats_are_exact_and_fail_closed(self):
        digest = "a" * 64
        self.assertEqual(m.canonical_artifact_digest(digest), "sha256:" + digest)
        self.assertEqual(m.canonical_artifact_digest("sha256:" + digest), "sha256:" + digest)
        for value in ("", "a" * 63, "a" * 65, "A" * 64, "sha256:" + "A" * 64,
                "SHA256:" + digest, "sha512:" + digest, "sha256:sha256:" + digest,
                " " + digest, digest + "\n", None, 0, True, [], {}):
            with self.subTest(value=value):
                self.reject(m.canonical_artifact_digest, value)

    def test_actual_preparation_and_fact_accept_bare_and_prefixed_upload_digests(self):
        prep = self.api_objects["actions/artifacts/301"]
        artifact = self.api_objects["actions/artifacts/300"]
        m.write(self.folder / "lease.json", self.fact)
        live = {**self.job, "status": "in_progress", "conclusion": None}
        with mock.patch.object(m, "current_job", return_value=live), \
             mock.patch.object(m, "verify_host"):
            for bare in (False, True):
                with self.subTest(bare=bare), mock.patch.dict(os.environ,
                        PREPARATION_ID="301", PREPARATION_DIGEST=prep["digest"][7:] if bare else prep["digest"],
                        FACT_ARTIFACT_ID="300", FACT_ARTIFACT_DIGEST=artifact["digest"][7:] if bare else artifact["digest"]):
                    inputs, preparation = m.preparation(self.folder)
                    self.assertEqual(inputs, self.inputs)
                    self.assertEqual(preparation["artifact_digest"], prep["digest"])
                    fact, binding, job = m.own_fact()
                    self.assertEqual(fact, self.fact)
                    self.assertEqual(binding, self.binding)
                    self.assertEqual(job, live)
            for supplied in ("0" * 64, "sha256:" + "0" * 64, "bad", "a" * 63, "a" * 65):
                with self.subTest(invalid=supplied), mock.patch.dict(os.environ,
                        PREPARATION_ID="301", PREPARATION_DIGEST=supplied,
                        FACT_ARTIFACT_ID="300", FACT_ARTIFACT_DIGEST=supplied):
                    self.reject(m.preparation, self.folder)
                    self.reject(m.own_fact)

    def test_actual_retention_accepts_upload_formats_and_keeps_api_digest(self):
        artifact = self.artifact(302, "stringzilla-final-results-avx512-interpreter-" + self.ctx["head"] + "-attempt1", {})
        for bare in (False, True):
            with self.subTest(bare=bare), tempfile.TemporaryDirectory(dir=self.folder) as temporary:
                previous = Path.cwd()
                os.chdir(temporary)
                try:
                    out = Path("perf-output")
                    out.mkdir()
                    m.write(out / "single-host-binding.json", self.record)
                    for name in ("perf-images", "perf-image-archives"):
                        Path(name).mkdir()
                    with mock.patch.dict(os.environ, RESULT_ARTIFACT_ID="302",
                            RESULT_ARTIFACT_DIGEST=artifact["digest"][7:] if bare else artifact["digest"]):
                        m.retained("interpreter")
                    receipt = json.loads((self.folder / "interpreter-retained.json").read_text())
                    self.assertEqual(receipt["artifact_digest"], artifact["digest"])
                    self.assertTrue(Path("perf-retained/interpreter/single-host-binding.json").is_file())
                    self.assertFalse(Path("perf-output").exists())
                finally:
                    os.chdir(previous)
        for supplied in ("0" * 64, "sha256:" + "0" * 64, "bad", "a" * 63, "a" * 65):
            with self.subTest(invalid=supplied), mock.patch.dict(os.environ,
                    RESULT_ARTIFACT_ID="302", RESULT_ARTIFACT_DIGEST=supplied), \
                 mock.patch.object(m.shutil, "rmtree") as remove:
                self.reject(m.retained, "interpreter")
                remove.assert_not_called()

    def test_actual_fact_rejects_identity_cpu_and_context_mutations(self):
        m.verify_fact(self.fact, self.job, self.ctx)
        for key, value in (("run_id", 18), ("head", "e" * 40), ("attempt", 2),
                ("source", "e" * 40), ("source_tree", "e" * 40), ("base", "e" * 40),
                ("mode", "allfour-v1"), ("tiers", ["c1"]), ("job_id", 101), ("runner_id", 0),
                ("runner_name", "other"), ("nonce", "bad"), ("available", False), ("available", 1),
                ("missing", ["avx512f"]), ("fields", {"flags": FLAGS.replace("avx512f", "")}),
                ("container_image", "other"), ("native_execution", False), ("cpu", -1),
                ("images_restored", True), ("timed_records", 1), ("module_sha256", "0" * 64)):
            with self.subTest(field=key):
                value_fact = copy.deepcopy(self.fact)
                value_fact[key] = value
                self.reject(m.verify_fact, value_fact, self.job, self.ctx)
        for key, value in (("id", 101), ("name", "other"), ("runner_name", "other"),
                ("runner_id", 0), ("head_sha", "e" * 40), ("run_id", 18), ("run_attempt", 2)):
            job = {**self.job, key: value}
            self.reject(m.verify_fact, self.fact, job, self.ctx)

    def test_actual_input_pins_and_blank_missing_scope(self):
        m.verify_inputs(self.inputs, self.ctx)
        for key, value in (("source", "e" * 40), ("source_tree", "e" * 40), ("tiers", ["c1"]),
                ("missing_proof_sha256", "0" * 64), ("producer_run", 19),
                ("producer_head", "e" * 40), ("pair_artifact_id", 999), ("pair_artifact_digest", "bad"),
                ("helper_sha256", "0" * 64), ("manifest_sha256", "0" * 64),
                ("python_auth_tests_passed", False), ("independent_scope_model_passed", False)):
            value_inputs = copy.deepcopy(self.inputs)
            value_inputs[key] = value
            self.reject(m.verify_inputs, value_inputs, self.ctx)
        for tiers in ((), ("c1", "interpreter"), ("interpreter", "interpreter")):
            with mock.patch.object(m, "MISSING_TIERS", tiers):
                self.reject(m.selected_tiers)
        with mock.patch.object(m, "MISSING_PROOF_HASH", ""):
            self.reject(m.selected_tiers)

    def test_checked_download_checks_cached_bytes_and_artifact_origin(self):
        value = self.api_objects["actions/artifacts/300"]
        m.checked_download(value, self.folder / "test.zip", self.ctx)
        for key, change in (("expired", True), ("digest", "bad"),
                ("digest", "sha256:" + "0" * 64),
                ("workflow_run", {"id": 18, "head_sha": "b" * 40})):
            self.reject(m.checked_download, {**value, key: change}, self.folder / "test.zip", self.ctx)

    def test_actual_ready_requires_runtime_backend_two_and_native_contract(self):
        m.validate_ready_data(self.ready, self.fact, "interpreter", self.files.__getitem__)
        for path, data in (("runtime-attestation.json", raw({**self.runtime, "available": False})),
                ("native-validation.json", raw({"passed": False})),
                ("native-validation/run.log", b"requested=2 selected=1 executable=1\n")):
            files = {**self.files, path: data}
            ready = copy.deepcopy(self.ready)
            hash_key = {"runtime-attestation.json": "runtime", "native-validation.json": "native",
                        "native-validation/run.log": "native_log"}[path] + "_sha256"
            ready[hash_key] = m.raw_sha(data)
            self.reject(m.validate_ready_data, ready, self.fact, "interpreter", files.__getitem__)
        ready = {**self.ready, "nonce": "0" * 32}
        self.reject(m.validate_ready_data, ready, self.fact, "interpreter", self.files.__getitem__)

    def test_completed_tier_uses_real_successful_steps_even_if_parent_later_failed(self):
        result = self.tier()
        self.assertEqual(result, self.record)
        self.assertEqual(self.job["conclusion"], "failure")
        good = {**self.job, "conclusion": "success"}
        self.assertEqual(self.tier(job=good), self.record)

    def test_failed_missing_duplicate_wrong_or_cross_parent_step_is_rejected(self):
        for index in (1, 2):
            for field, value in (("conclusion", "failure"), ("status", "in_progress"), ("name", "wrong")):
                job = copy.deepcopy(self.job)
                job["steps"][index][field] = value
                self.reject(self.tier, None, job)
            job = copy.deepcopy(self.job)
            job["steps"].append(copy.deepcopy(job["steps"][index]))
            self.reject(self.tier, None, job)
        for field, value in (("id", 999), ("head_sha", "e" * 40), ("runner_id", 999)):
            self.reject(self.tier, None, {**self.job, field: value})

    def test_raw_zip_input_ready_events_and_completion_are_bound(self):
        for field, value in (("complete", False), ("tier", "c1"), ("triplets", 135),
                ("source", "e" * 40), ("head", "e" * 40), ("console_sha256", "0" * 64)):
            self.reject(self.tier, {**self.record, field: value})
        changed = copy.deepcopy(self.record)
        changed["authorizations"][1]["nonce"] = "0" * 32
        self.reject(self.tier, changed)
        changed = copy.deepcopy(self.record)
        changed["authorizations"][1]["cpu"] = 2
        self.reject(self.tier, changed)
        for field, value in (("digest", "sha256:" + "0" * 64), ("expired", True),
                ("workflow_run", {"id": 18, "head_sha": "b" * 40})):
            old = self.api_objects["actions/artifacts/300"]
            self.api_objects["actions/artifacts/300"] = {**old, field: value}
            self.reject(self.tier)
            self.api_objects["actions/artifacts/300"] = old

    def test_actual_phase_guard_orders_and_rechecks_same_host_before_every_call(self):
        out = Path.cwd() / "perf-output"
        with mock.patch.object(m, "own_fact", return_value=(self.fact, self.binding, self.job)) as own, \
             mock.patch.object(m, "verify_missing", return_value={}) as missing, \
             mock.patch.object(m, "sha", return_value=self.inputs["driver_sha256"]), \
             mock.patch.object(m, "validate_ready"):
            self.reject(m.verify_saved, "interpreter", "periodic", out)
            m.verify_saved("interpreter", "restore", out)
            self.reject(m.verify_saved, "interpreter", "restore", out)
            m.write(self.folder / "interpreter-ready.json", self.ready)
            out.mkdir(exist_ok=True)
            self.addCleanup(lambda: __import__("shutil").rmtree(out))
            m.write(out / "pair-receipt.json", {"sources": {"original": m.BASE, "fork": m.SOURCE},
                "backend": "avx2", "producer_run": str(m.PAIR_RUN), "producer_head": m.PAIR_HEAD,
                "image_hashes": {k: {"tree_sha256": v} for k, v in self.inputs["image_hashes"].items()}})
            for phase in ("measure", "periodic", "utf16-probe"):
                m.verify_saved("interpreter", phase, out)
            self.assertGreaterEqual(own.call_count, 6)
            self.assertEqual(own.call_count, missing.call_count)

    def test_no_cleanup_until_matching_completed_artifact_is_retained(self):
        out = Path.cwd() / "perf-output"
        out.mkdir()
        self.addCleanup(lambda: __import__("shutil").rmtree(out, ignore_errors=True))
        m.write(out / "single-host-binding.json", self.record)
        artifact = self.artifact(399, "wrong", {})
        with mock.patch.dict(os.environ, RESULT_ARTIFACT_ID="399", RESULT_ARTIFACT_DIGEST=artifact["digest"]), \
             mock.patch.object(m.shutil, "rmtree") as remove:
            self.reject(m.retained, "interpreter")
            remove.assert_not_called()


    def test_runtime_unavailable_stops_before_native_and_timings_but_errors_are_not_unsupported(self):
        old_cwd = Path.cwd()
        work = self.folder / "work"
        work.mkdir()
        os.chdir(work)
        self.addCleanup(lambda: os.chdir(old_cwd))
        self.patch(m, "own_fact", return_value=(self.fact, self.binding, self.job))
        calls = []
        runtime = copy.deepcopy(self.runtime)
        runtime["available"] = False
        runtime["observations"]["enabled"]["actual"] = "2:1:true"
        def child(mode, tier, prep, console):
            calls.append(mode)
            if mode == "runtime":
                m.write(Path("perf-output/runtime-attestation.json"), runtime)
        self.patch(m, "run_cli", side_effect=child)
        m.run_tier("interpreter")
        self.assertEqual(calls, ["restore", "runtime"])
        zero = json.loads(Path("perf-output/single-host-zero.json").read_text())
        self.assertEqual(zero["zero_kind"], "runtime-unavailable")
        self.assertEqual(zero["timed_records"], 0)
        self.assertFalse(Path("perf-output/experiment.log").exists())
        __import__("shutil").rmtree("perf-output")
        (self.folder / "stop.json").unlink()
        calls.clear()
        runtime["observations"]["enabled"]["returncode"] = 1
        self.reject(m.run_tier, "interpreter")
        self.assertEqual(calls, ["restore", "runtime"])
        self.assertFalse(Path("perf-output/single-host-zero.json").exists())
        self.assertFalse((self.folder / "stop.json").exists())

    def old_fixture(self, tier):
        # Exercise the unchanged old read_fact/verify_fact/download, not a mock
        # of its authentication decision.
        helper = MODULE_PATH.parent / "stringzilla-final-sky-election.py"
        (self.folder / helper.name).write_bytes(helper.read_bytes())
        old = m.old_election(tier)
        ctx = {"run_id": m.MISSING_RUN, "head": m.MISSING_HEAD, "attempt": 1}
        jobs, artifacts, records, facts = [], [], [], {}
        for slot, label in old.SLOTS.items():
            job = {"id": 500 + int(slot), "name": old.name(slot), "runner_id": 600 + int(slot),
                "runner_name": "old-" + slot, "run_id": m.MISSING_RUN, "head_sha": m.MISSING_HEAD,
                "run_attempt": 1, "labels": [label], "status": "completed", "conclusion": "success",
                "steps": [{"name": name, "status": "completed", "conclusion": conclusion}
                    for name, conclusion in ((old.PUBLISH, "success"),
                        ("Restore complete pair and project the fixed manifest", "skipped"),
                        ("Measure final SKY " + tier + " original enabled and disabled controls", "skipped"))]}
            available, missing = old.derive({"flags": "avx avx2"}, "x86_64")
            fact = {**ctx, "schema": "stringzilla-sky-allfour-fact-v1", "source": m.SOURCE,
                "base": m.BASE, "source_trees": old.TREES, "tier": tier, "backend": "avx512",
                "slot": slot, "host_runner_label": label, "container_image": m.IMAGE,
                "native_execution": True, "algorithm_sha256": m.OLD_ALGORITHM_HASH,
                "nonce": "%032x" % (int(slot) + 1), "job": copy.deepcopy(job),
                "runner_name": job["runner_name"], "timed_records": 0, "images_restored": False,
                "fields": {"flags": "avx avx2"}, "machine": "x86_64", "available": available,
                "missing": missing, "os_release_sha256": "c" * 64, "libc_sha256": "d" * 64, "cpu": 0}
            ident = 700 + int(slot)
            data = pack({"eligibility.json": raw(fact)})
            artifact = {"id": ident, "name": old.fact_name(ctx, slot), "expired": False,
                "digest": "sha256:" + m.raw_sha(data),
                "workflow_run": {"id": m.MISSING_RUN, "head_sha": m.MISSING_HEAD}}
            self.archives[ident] = data
            jobs.append(job)
            artifacts.append(artifact)
            facts[slot] = fact
            records.append({"slot": slot, "job_id": job["id"], "job_name": job["name"], "artifact": artifact,
                            "fact_json_sha256": m.raw_sha(raw(fact)), "available": available})
        count = m.COUNTS[tier]
        proof = {"schema": "stringzilla-final-sky-missing-v1", "source": m.SOURCE,
            "source_tree": m.SOURCE_TREE, "base": m.BASE, **ctx, "backend": "avx512",
            "missing_tiers": [tier], "zero_shape": "all-four-authenticated-unavailable",
            "algorithm_sha256": m.OLD_ALGORITHM_HASH, "timed_records": 0, "images_restored": False,
            "triplets": count, "records": count * 3, "logical_groups": 1, "facts": records}
        self.api_objects["actions/runs/" + str(m.MISSING_RUN) + "/jobs?filter=all&per_page=100"] = {
            "total_count": 4, "jobs": jobs}
        payload = {"total_count": 4, "artifacts": artifacts}
        self.api_objects["actions/runs/" + str(m.MISSING_RUN) + "/artifacts?per_page=100"] = payload
        return old, proof, jobs, artifacts, facts

    def test_all_four_old_unavailable_facts_are_verified_by_original_authenticator(self):
        old, proof, jobs, artifacts, facts = self.old_fixture("interpreter")
        self.assertEqual(m.verify_all_unavailable(self.folder, proof), proof)
        jobs[0]["steps"][1]["conclusion"] = "success"
        self.reject(m.verify_all_unavailable, self.folder, proof)
        jobs[0]["steps"][1]["conclusion"] = "skipped"
        artifacts[0]["digest"] = "sha256:" + "0" * 64
        self.reject(m.verify_all_unavailable, self.folder, proof)

    def test_actual_failed_minimum_requires_four_terminal_authenticated_facts(self):
        old, proof, jobs, artifacts, facts = self.old_fixture("c1")
        jobs[2]["conclusion"] = "failure"
        jobs[2]["steps"].append({"name": "Verify ALLFOUR facts then choose MIN eligible slot on fixture",
            "status": "completed", "conclusion": "failure"})
        facts["2"]["fields"]["flags"] = FLAGS
        facts["2"]["available"], facts["2"]["missing"] = old.derive(facts["2"]["fields"], "x86_64")
        data = pack({"eligibility.json": raw(facts["2"])})
        self.archives[702] = data
        artifacts[2]["digest"] = "sha256:" + m.raw_sha(data)
        proof["facts"][2].update(fact_json_sha256=m.raw_sha(raw(facts["2"])), available=True)
        higher = proof["facts"][3]
        proof["facts"] = proof["facts"][:3]
        proof.update(zero_shape="failed-minimum-eligible-before-images", minimum_slot="2",
                     minimum_job_id=jobs[2]["id"], late_higher_jobs=[higher])
        self.assertEqual(m.verify_failed_minimum_before_images(self.folder, proof), proof)
        self.assertEqual(old.known_loss("3", facts), {"reason": "own-unavailable"})
        for slot in (2, 3):
            for field, value in (("conclusion", "success" if slot == 2 else "failure"),
                                 ("status", "queued"), ("status", "in_progress")):
                previous = jobs[slot][field]
                jobs[slot][field] = value
                self.reject(m.verify_failed_minimum_before_images, self.folder, proof)
                jobs[slot][field] = previous
            jobs[slot]["steps"][1]["conclusion"] = "success"
            self.reject(m.verify_failed_minimum_before_images, self.folder, proof)
            jobs[slot]["steps"][1]["conclusion"] = "skipped"
        previous = higher["fact_json_sha256"]
        higher["fact_json_sha256"] = "0" * 64
        self.reject(m.verify_failed_minimum_before_images, self.folder, proof)
        higher["fact_json_sha256"] = previous
        artifact = artifacts.pop()
        self.reject(m.verify_failed_minimum_before_images, self.folder, proof)
        artifacts.append(artifact)
        # C2 results remain disjoint and permitted; a C1 result is rejected.
        artifacts.append({"name": "stringzilla-final-results-avx512-c2-existing"})
        self.assertEqual(m.verify_failed_minimum_before_images(self.folder, proof), proof)
        artifacts[-1]["name"] = "stringzilla-final-results-avx512-c1-existing"
        self.reject(m.verify_failed_minimum_before_images, self.folder, proof)

    def test_missing_tuple_hash_dispatch_and_tier_environment_are_bound(self):
        self.patch(m, "MISSING_TIERS", new=("interpreter", "c1"))
        proof = {"schema": "stringzilla-single-sky-missing-tuple-v1", "source": m.SOURCE,
            "source_tree": m.SOURCE_TREE, "base": m.BASE, "run_id": m.MISSING_RUN,
            "head": m.MISSING_HEAD, "attempt": 1, "backend": "avx512",
            "missing_tiers": ["interpreter", "c1"], "triplets": 262, "records": 786,
            "logical_groups": 2, "timed_records": 0, "images_restored": False,
            "algorithm_sha256": m.OLD_ALGORITHM_HASH, "proofs": {}}
        children = {}
        for tier, shape in (("interpreter", "all-four-authenticated-unavailable"),
                            ("c1", "failed-minimum-eligible-before-images")):
            child = {"missing_tiers": [tier], "zero_shape": shape, "image_pair": {"synthetic": True}}
            path = self.folder / ("stringzilla-single-sky-" + tier + "-zero.json")
            m.write(path, child)
            children[tier] = child
            proof["proofs"][tier] = {"path": path.name, "sha256": m.sha(path), "zero_shape": shape}
        path = self.folder / "stringzilla-single-sky-missing-proof.json"
        m.write(path, proof)
        self.patch(m, "MISSING_PROOF_HASH", new=m.sha(path))
        with mock.patch.object(m, "verify_all_unavailable", return_value=children["interpreter"]) as first, \
             mock.patch.object(m, "verify_failed_minimum_before_images", return_value=children["c1"]) as second, \
             mock.patch.dict(os.environ, TIER="caller-tier"):
            self.assertEqual(m.verify_missing(self.folder)["image_pair"], {"synthetic": True})
            self.assertEqual(os.environ["TIER"], "caller-tier")
            first.assert_called_once()
            second.assert_called_once()
            (self.folder / proof["proofs"]["c1"]["path"]).write_text("{}\n")
            self.reject(m.verify_missing, self.folder)


    def test_exact_retry_ref_reaches_first_offline_test_before_any_api(self):
        class FirstOfflineTestReached(BaseException):
            pass
        with mock.patch.dict(os.environ, SOURCE=m.SOURCE, SOURCE_TREE=m.SOURCE_TREE, GITHUB_REF=m.RETRY_REF), \
             mock.patch.object(m, "HERE", new=MODULE_PATH.parent), \
             mock.patch.object(m.subprocess, "run", side_effect=FirstOfflineTestReached) as child, \
             mock.patch.object(m, "api") as api:
            with self.assertRaises(FirstOfflineTestReached):
                m.prepare()
            self.assertEqual(child.call_count, 1)
            self.assertEqual(Path(child.call_args.args[0][1]).name, "stringzilla-single-sky-test.py")
            api.assert_not_called()
            child.reset_mock()
            for wrong in ("refs/heads/codex/stringzilla-single-sky-missing-916ba895",
                          m.RETRY_REF + "-other", "refs/tags/retry1", ""):
                with mock.patch.dict(os.environ, GITHUB_REF=wrong):
                    with self.assertRaises(AssertionError):
                        m.prepare()
                child.assert_not_called()
                api.assert_not_called()

    def queued_fixture(self, install=False):
        names = ("Authenticate exact missing-only scope and original complete pair", m.WORKER,
                 "Qualify exact completed missing SKY controls and preserve failed parent status")
        attempts = []
        for run_id, head, config_id in m.SUPERSEDED_QUEUED_ATTEMPTS:
            run = {"id": run_id, "head_sha": head, "run_attempt": 1,
                "head_branch": m.RETRY_REF.removeprefix("refs/heads/"), "status": "completed", "conclusion": "cancelled"}
            jobs = [{"id": config_id + index * 1000, "name": name, "run_id": run_id, "head_sha": head,
                     "run_attempt": 1, "status": "completed", "conclusion": "cancelled", "steps": []}
                    for index, name in enumerate(names)]
            root = "actions/runs/" + str(run_id)
            if install:
                self.api_objects.update({root: run, root + "/jobs?filter=all&per_page=100":
                    {"total_count": 3, "jobs": jobs},
                    root + "/artifacts?per_page=100": {"total_count": 0, "artifacts": []}})
            attempts.append({"run_id": run_id, "head": head, "attempt": 1,
                "head_branch": m.RETRY_REF.removeprefix("refs/heads/"), "status": "completed", "conclusion": "cancelled",
                "configuration_job_id": config_id,
                "jobs": [{key: job[key] for key in ("id", "name", "status", "conclusion", "steps")}
                         for job in sorted(jobs, key=lambda item: item["name"])],
                "artifacts": [], "materialized_worker_jobs": 1, "executed_worker_jobs": 0,
                "timed_records": 0, "images_restored": False})
        return {"schema": "stringzilla-single-sky-queued-zero-chain-v1", "source": m.SOURCE, "base": m.BASE,
                "attempts": attempts, "executed_worker_jobs": 0, "timed_records": 0, "images_restored": False}

    def test_superseded_queued_attempt_requires_cancelled_exact_zero(self):
        expected = self.queued_fixture(install=True)
        self.assertEqual(m.verify_superseded_queued_attempt(), expected)
        for run_id, head, config_id in m.SUPERSEDED_QUEUED_ATTEMPTS:
            root = "actions/runs/" + str(run_id)
            run, jobs, artifacts = (self.api_objects[path] for path in
                (root, root + "/jobs?filter=all&per_page=100", root + "/artifacts?per_page=100"))
            job = jobs["jobs"][0]
            for target, field, value in ((run, "head_sha", "0" * 40), (run, "status", "queued"),
                    (run, "conclusion", "success"), (run, "run_attempt", 2),
                    (job, "id", 999), (job, "status", "in_progress"), (job, "conclusion", "success"),
                    (job, "name", "Unlisted job"), (jobs, "total_count", 4), (artifacts, "total_count", 1)):
                previous = target[field]
                target[field] = value
                self.reject(m.verify_superseded_queued_attempt)
                target[field] = previous
            for child in jobs["jobs"]:
                child["steps"] = [{"name": "Executed work", "number": 1, "status": "completed", "conclusion": "success"}]
                self.reject(m.verify_superseded_queued_attempt)
                child["steps"] = []
            jobs["jobs"].append(copy.deepcopy(job))
            jobs["total_count"] = 4
            self.reject(m.verify_superseded_queued_attempt)
            jobs["jobs"].pop()
            jobs["total_count"] = 3
            artifacts["artifacts"] = [{"id": 123, "name": "unexpected"}]
            self.reject(m.verify_superseded_queued_attempt)
            artifacts["artifacts"] = []
        bad = copy.deepcopy(self.inputs)
        bad["superseded_queued_zero"]["attempts"][0]["conclusion"] = "success"
        bad["superseded_queued_zero_sha256"] = m.raw_sha(raw(bad["superseded_queued_zero"]))
        self.reject(m.verify_inputs, bad, self.ctx)

    def test_probe_rechecks_superseded_cancelled_zero_before_worker_or_cpu(self):
        class SupersededChecked(BaseException):
            pass
        target = self.folder / "new-probe"
        with mock.patch.object(m, "FOLDER", new=target), \
             mock.patch.dict(os.environ, SOURCE=m.SOURCE, SOURCE_TREE=m.SOURCE_TREE), \
             mock.patch.object(m, "preparation", return_value=(self.inputs, {})), \
             mock.patch.object(m, "verify_prior_attempt_zero", return_value=self.prior) as prior, \
             mock.patch.object(m, "verify_superseded_queued_attempt", side_effect=SupersededChecked) as queued, \
             mock.patch.object(m, "current_job") as current, mock.patch.object(m, "host") as host:
            with self.assertRaises(SupersededChecked):
                m.probe()
            prior.assert_called_once_with(self.prior)
            queued.assert_called_once_with()
            current.assert_not_called()
            host.assert_not_called()


if __name__ == "__main__":
    unittest.main()
