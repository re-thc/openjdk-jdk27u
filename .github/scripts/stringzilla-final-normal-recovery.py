#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Recover only proven missing measurements using already validated complete images."""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import zipfile

SOURCE = "916ba895e834378e3f7eac7f030fc4abff641d33"
SOURCE_TREE = "d3de6a4fcf40e5b45b58d7e0874ed2ab34fe2e01"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PRODUCER_RUN = 39164738566
PRODUCER_HEAD = "8bd517316162bc8a638b8339da47ac9c36b40d1e"
PAIRS = {
 "serial": (117789053116, 12151758260, "4eb4aec81c2905af9ff8fe867d431b65c9b6cbf24821cbfbe4cf2aaefb334e36", 12152326660, "d60cb49009db517b2306897d002130b110bfcb790c10c9b70197360e5866be9c"),
 "neon": (117789053159, 12151936751, "674d6a986ee2856c3975dab979546c0237ef595740e46cd43ea45669108b55f2", 12152650113, "b28e9d1baa392ab865163bd788832b7e5f93994ca5a33de3d1fb9464a18da21d"),
 "msvc": (117789053344, 12151927587, "570a8456f7b230d49f8e2769b839c687f244bba756f129dc65f9840e39afe29a", 12151219729, "e6040cc6a244f91e1bc8d6dd9f619903787327bd8d0a40f6ede5416c030da948"),
 "avx2": (117789053163, 12151804060, "6aa4e64d7515f97403162bde6c85ead38dfd2f4981818b04656f4ee6cefe401f", 12152835042, "29ae506c6ccb65a087f78e30fcf3a74adfce710e8201e274326655ade01bef56")
}
HERE = Path(__file__).resolve().parent
OUT = Path("perf-output")
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MANIFEST_HASH = "d94afb1b86132ff7fb5ec6bdfa81f033076b9c1057a6aa0c8fe815b7e4ea760d"
DRIVER_HASH = "aaf3e5d6b86ab5582fd4abdc225453a3a2606f6d3bd7f636449f98f158aff0d8"
SCOPE_HASH = "c98c6f722e1d2533191f3f03bc12bf2b2b63f5b3dd5d41a3442fa93d3b4f2abb"
MISSING_RUN = 39174300598
MISSING_HEAD = "99609a52cd38d5eb3ef093e7c13f30c7215d96d1"
MISSING_BARRIER_JOB = 117820226709
# Pin only after actual terminal normal skips are independently retained.
MISSING_PROOF_HASH = "e4a7e69fe17abbe1a9fda6e5c3d3cee342fbf79fb1631635a3e4d638f15819b4"
GUARD_TEST_HASH = "affb6dd638a379ba69d796c068d58187cd5e196b29588abee4e23229f2b89c53"

def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def output(name, value):
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write(name + "=" + str(value) + "\n")

def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + "\n")

def verify_missing(proof, run, jobs_payload, artifacts_payload):
    assert proof["schema"] == "stringzilla-final-normal-missing-v1"
    assert proof["source"] == SOURCE and proof["base"] == BASE
    assert proof["run_id"] == MISSING_RUN and proof["head"] == MISSING_HEAD and proof["attempt"] == 1
    assert proof["scope_sha256"] == SCOPE_HASH
    assert proof["logical_groups"] == 12 and proof["triplets"] == 1500 and proof["timed_records"] == 0
    assert proof["normal_result_artifacts"] == 0 and proof["barrier_job_id"] == MISSING_BARRIER_JOB
    identifiers, names = proof["normal_job_ids"], proof["normal_job_names"]
    if proof["api_shape"] == "four-unexpanded-parents":
        assert names == {alias: alias + "_controls" for alias in PAIRS}
    else:
        assert proof["api_shape"] == "twelve-expanded-controls"
        assert set(names) == {alias + "/" + tier for alias in PAIRS for tier in ("interpreter", "c1", "c2")}
        for key, name in names.items():
            alias, tier = key.split("/")
            assert name in (alias + "_controls (" + tier + ")",
                            alias + "_controls (" + tier + ") / " + alias + "-" + tier + " controls")
    assert set(identifiers) == set(names)
    assert all(type(value) is int and value > 0 for value in identifiers.values())
    assert len(set(identifiers.values())) == len(names)
    assert run["id"] == MISSING_RUN and run["head_sha"] == MISSING_HEAD and run["run_attempt"] == 1
    assert jobs_payload["total_count"] <= 100 and artifacts_payload["total_count"] <= 100
    jobs = jobs_payload["jobs"]
    barrier = [job for job in jobs if job["id"] == MISSING_BARRIER_JOB]
    assert len(barrier) == 1 and barrier[0]["name"] == "sky_fact_barrier"
    assert barrier[0]["run_id"] == MISSING_RUN and barrier[0]["head_sha"] == MISSING_HEAD
    assert barrier[0]["run_attempt"] == 1 and barrier[0]["status"] == "completed"
    assert barrier[0]["conclusion"] == "failure"
    normal = [job for job in jobs if any(
        job["name"] == alias + "_controls" or job["name"].startswith(alias + "_controls (") or
        re.search(r"/ " + alias + r"-(?:interpreter|c1|c2) controls$", job["name"])
        for alias in PAIRS)]
    assert len(normal) == len(names) and {job["id"] for job in normal} == set(identifiers.values())
    for key, job_id in identifiers.items():
        matches = [job for job in normal if job["id"] == job_id]
        assert len(matches) == 1
        job = matches[0]
        assert job["name"] == names[key]
        assert job["run_id"] == MISSING_RUN and job["head_sha"] == MISSING_HEAD and job["run_attempt"] == 1
        assert job["status"] == "completed" and job["conclusion"] == "skipped"
        assert not any(step["name"].startswith("Measure ") and
                       (step["status"] == "in_progress" or step["conclusion"] == "success")
                       for step in job.get("steps", []))
    # SKY artifacts and live SKY jobs are intentionally outside this zero proof.
    assert not any(any(artifact["name"].startswith("stringzilla-final-results-" + alias + "-")
                       for alias in PAIRS) for artifact in artifacts_payload["artifacts"])
    return {"run_id": MISSING_RUN, "head": MISSING_HEAD, "attempt": 1,
            "barrier_job_id": MISSING_BARRIER_JOB, "api_shape": proof["api_shape"],
            "normal_job_ids": identifiers, "normal_job_names": names,
            "logical_groups": 12, "triplets": 1500, "timed_records": 0, "normal_result_artifacts": 0}


def fresh_missing(module, proof):
    run = module.api("actions/runs/" + str(MISSING_RUN))
    jobs = module.api("actions/runs/" + str(MISSING_RUN) + "/jobs?filter=all&per_page=100")
    artifacts = module.api("actions/runs/" + str(MISSING_RUN) + "/artifacts?per_page=100")
    return verify_missing(proof, run, jobs, artifacts)


def configuration():
    assert os.environ["GITHUB_RUN_ATTEMPT"] == "1"
    assert os.environ["GITHUB_REPOSITORY"] == "re-thc/openjdk-jdk27u"
    assert os.environ["GITHUB_REF"] == "refs/heads/codex/stringzilla-final-normal-recovery-916ba895"
    assert int(os.environ["GITHUB_RUN_ID"]) != MISSING_RUN and os.environ["GITHUB_SHA"] != MISSING_HEAD
    assert os.environ["SOURCE"] == SOURCE and os.environ["SOURCE_TREE"] == SOURCE_TREE
    tests = HERE / "stringzilla-final-normal-recovery-test.py"
    assert sha(tests.read_bytes()) == GUARD_TEST_HASH
    subprocess.run([sys.executable, tests, Path(__file__)], check=True)
    assert re.fullmatch(r"[a-f0-9]{64}", MISSING_PROOF_HASH), "Actual terminal normal-zero proof is not pinned"
    proof_raw = (HERE / "stringzilla-final-normal-missing-proof.json").read_bytes()
    assert sha(proof_raw) == MISSING_PROOF_HASH
    missing = json.loads(proof_raw)
    assert sha((HERE / "stringzilla-final.py").read_bytes()) == DRIVER_HASH
    module = load("normal_final_driver", HERE / "stringzilla-final.py")
    assert tuple(module.RECOVERY_SKY_TIERS) == ()
    verified_missing = fresh_missing(module, missing)
    assert module.api("git/commits/" + SOURCE)["tree"]["sha"] == SOURCE_TREE
    source_trees = module.check_sources(SOURCE)
    scope_raw = (HERE / "stringzilla-final-normal-scope.json").read_bytes()
    assert sha(scope_raw) == SCOPE_HASH
    scope = json.loads(scope_raw)
    assert scope["schema"] == "stringzilla-final-normal-scope-v1"
    assert scope["source"] == SOURCE and scope["base"] == BASE and scope["parent_manifest_sha256"] == MANIFEST_HASH
    expected = module.expected_keys()[0] + module.expected_keys(module.periodic_rows()[0])[0] + module.expected_keys(module.utf16_probe_rows()[0])[0]
    assert len(expected) == len(set(expected)) == 1886
    selected = sorted(key for key in expected if json.loads(key)[0] != "avx512")
    excluded = sorted(set(expected) - set(selected))
    assert selected == scope["physical_keys"] and excluded == scope["excluded_sky_physical_keys"]
    assert len(selected) == 1500 and len(excluded) == 386
    assert {tuple(json.loads(key)[:2]) for key in selected} == {
        (alias, tier) for alias in PAIRS for tier in ("interpreter", "c1", "c2")}
    jobs_payload = module.api("actions/runs/" + str(PRODUCER_RUN) + "/jobs?filter=all&per_page=100")
    assert jobs_payload["total_count"] <= 100
    jobs = jobs_payload["jobs"]
    run = module.api("actions/runs/" + str(PRODUCER_RUN))
    assert run["head_sha"] == PRODUCER_HEAD
    pairs = {}
    source_trees = module.check_sources(SOURCE)
    for alias, (job_id, pair_id, pair_digest, validation_id, validation_digest) in PAIRS.items():
        job = next(j for j in jobs if j["id"] == job_id)
        assert job["run_id"] == PRODUCER_RUN and job["head_sha"] == PRODUCER_HEAD
        assert job["status"] == "completed" and job["conclusion"] == "success" and job["run_attempt"] == 1
        assert job["name"].endswith("/ " + alias + " validated pair")
        for name in ("Verify and archive matched complete pair", "Publish complete images before tests",
                     "Run profiles, jtreg and native contract checks"):
            assert next(s for s in job["steps"] if s["name"] == name)["conclusion"] == "success"
        pair = module.api("actions/artifacts/" + str(pair_id))
        assert pair["digest"] == "sha256:" + pair_digest and pair["expired"] is False
        assert pair["workflow_run"]["id"] == PRODUCER_RUN and pair["workflow_run"]["head_sha"] == PRODUCER_HEAD
        assert pair["name"] == "stringzilla-final-pair-" + alias + "-" + PRODUCER_HEAD
        archive = OUT / (alias + "-validation.zip")
        metadata = module.download(validation_id, validation_digest, PRODUCER_RUN, PRODUCER_HEAD, archive)
        assert metadata["name"] == "stringzilla-final-build-" + alias + "-" + PRODUCER_HEAD
        with zipfile.ZipFile(archive) as bundle:
            raw = bundle.read("pair-receipt.json")
        receipt = json.loads(raw)
        assert receipt["sources"] == {"original": BASE, "fork": SOURCE} and receipt["backend"] == alias
        assert receipt["producer_run"] == str(PRODUCER_RUN) and receipt["producer_head"] == PRODUCER_HEAD
        assert receipt["source_trees"] == source_trees
        assert receipt["helper_sha256"] == HELPER_HASH and receipt["parent_manifest_sha256"] == MANIFEST_HASH
        spec = receipt["spec"]
        assert spec["DEBUG_LEVEL"] == "release" and spec["SOURCE_DATE"] == "1792195200"
        assert spec["VERSION_OPT"] == "stringzilla-benchmark"
        for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
            assert re.match(r"19\.44\." if alias == "msvc" else r"16\.", spec[key])
        hashes = {c: receipt["image_hashes"][c]["tree_sha256"] for c in ("original", "fork")}
        assert all(re.fullmatch(r"[a-f0-9]{64}", h) for h in hashes.values()) and hashes["original"] != hashes["fork"]
        pairs[alias] = {"artifact-id": str(pair_id), "artifact-digest": "sha256:" + pair_digest,
            "original-image-hash": hashes["original"], "fork-image-hash": hashes["fork"]}
        write(alias + "-validated-pair-binding.json", {"producer_job_id": job_id, "producer_run": PRODUCER_RUN,
            "producer_head": PRODUCER_HEAD, "pair_artifact_id": pair_id, "pair_artifact_digest": pair["digest"],
            "validation_artifact_id": validation_id, "validation_artifact_digest": metadata["digest"],
            "pair_receipt_sha256": sha(raw), "sources": receipt["sources"], "source_trees": source_trees,
            "image_tree_sha256": hashes, "spec": spec})
        archive.unlink()
    verified_missing = fresh_missing(module, missing)
    write("normal-recovery-preparation.json", {
        "schema": "stringzilla-final-normal-recovery-v1", "source": SOURCE, "source_tree": SOURCE_TREE,
        "base": BASE, "missing_run": MISSING_RUN, "missing_head": MISSING_HEAD,
        "missing_proof_sha256": MISSING_PROOF_HASH, "verified_normal_missing": verified_missing,
        "producer_run": PRODUCER_RUN, "producer_head": PRODUCER_HEAD, "pairs": pairs,
        "scope_sha256": SCOPE_HASH, "triplets": 1500, "records": 4500, "logical_groups": 12,
        "physical_keys": selected, "excluded_sky_physical_keys": excluded,
        "guard_tests_passed": True, "timed_records": 0, "sky_cancelled_or_replayed": False})
    module.proof(SOURCE)
    output("pairs", json.dumps(pairs, separators=(",", ":")))
    output("triplets", 1500)


if __name__ == "__main__":
    OUT.mkdir(exist_ok=True)
    assert sys.argv[1:] == ["configuration"]
    configuration()
