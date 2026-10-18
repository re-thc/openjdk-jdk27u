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
import time
import zipfile

SOURCE = "916ba895e834378e3f7eac7f030fc4abff641d33"
SOURCE_TREE = "d3de6a4fcf40e5b45b58d7e0874ed2ab34fe2e01"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PRODUCER_RUN = 39164738566
PRODUCER_HEAD = "8bd517316162bc8a638b8339da47ac9c36b40d1e"
SKY_TIERS = ("interpreter", "c1", "c2")
FAILED_SKY = {"interpreter": 117802396183, "c1": 117802396014, "c2": 117802396097}
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
ALGORITHM_HASH = "d893e2184a568fa8898af972eccd0cf5e263ee71676eb11e7ad543d3aa99a5f7"

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

def configuration():
    assert os.environ["GITHUB_RUN_ATTEMPT"] == "1"
    assert os.environ["SOURCE"] == SOURCE and os.environ["SOURCE_TREE"] == SOURCE_TREE
    assert os.environ["TIER"] == "c1"
    algorithm = HERE / "stringzilla-final-sky-election.py"
    assert sha(algorithm.read_bytes()) == ALGORITHM_HASH
    # Actual Python tests import the real helper; every external API call is mocked.
    subprocess.run([sys.executable, HERE / "stringzilla-final-sky-election-test.py",
                    algorithm, ALGORITHM_HASH], check=True)
    module = load("final_driver", HERE / "stringzilla-final.py")
    assert tuple(module.RECOVERY_SKY_TIERS) == SKY_TIERS
    assert module.api("git/commits/" + SOURCE)["tree"]["sha"] == SOURCE_TREE
    module.check_sources(SOURCE)
    module.proof(SOURCE)
    jobs_payload = module.api("actions/runs/" + str(PRODUCER_RUN) + "/jobs?filter=all&per_page=100")
    assert jobs_payload["total_count"] <= 100
    jobs = jobs_payload["jobs"]
    run = module.api("actions/runs/" + str(PRODUCER_RUN))
    assert run["head_sha"] == PRODUCER_HEAD
    missing = {}
    for alias in PAIRS:
        matches = [j for j in jobs if j["name"] == alias + "_controls"]
        assert len(matches) == 1
        job = matches[0]
        assert job["run_id"] == PRODUCER_RUN and job["head_sha"] == PRODUCER_HEAD
        assert job["status"] == "completed" and job["conclusion"] == "skipped" and job["run_attempt"] == 1
        missing[alias] = {"job_id": job["id"], "conclusion": job["conclusion"], "logical_groups": 3}
    election = load("recovery_election", algorithm)
    for tier, job_id in FAILED_SKY.items():
        job = next(j for j in jobs if j["id"] == job_id)
        assert job["run_id"] == PRODUCER_RUN and job["head_sha"] == PRODUCER_HEAD and job["run_attempt"] == 1
        assert job["status"] == "completed" and job["conclusion"] == "failure"
        assert job["name"] == "avx512_controls (" + tier + ") / Final SKY " + tier + " slot 0 on ubuntu-22.04"
        measure = [s for s in job["steps"] if s["name"] == "Measure final SKY " + tier + " original enabled and disabled controls"]
        restore = [s for s in job["steps"] if s["name"] == "Restore complete pair and project the fixed manifest"]
        assert len(measure) == len(restore) == 1 and measure[0]["conclusion"] == restore[0]["conclusion"] == "skipped"
        published = [s for s in job["steps"] if s["name"] == election.PUBLISH]
        assert len(published) == 1 and published[0]["conclusion"] == "success"
        payload = module.api("actions/runs/" + str(PRODUCER_RUN) + "/artifacts?per_page=100")
        assert payload["total_count"] <= 100
        matches = [a for a in payload["artifacts"] if a["name"] ==
                   "stringzilla-final-sky-fact-" + str(PRODUCER_RUN) + "-" + tier + "-0-attempt1"]
        assert len(matches) == 1
        artifact = matches[0]
        archive = OUT / ("missing-" + tier + ".zip")
        module.download(artifact["id"], artifact["digest"], PRODUCER_RUN, PRODUCER_HEAD, archive)
        with zipfile.ZipFile(archive) as bundle:
            assert bundle.namelist() == ["eligibility.json"]
            raw = bundle.read("eligibility.json")
        fact = json.loads(raw)
        assert fact["schema"] == "stringzilla-sky-allfour-fact-v1" and fact["source"] == SOURCE and fact["base"] == BASE
        assert fact["run_id"] == PRODUCER_RUN and fact["head"] == PRODUCER_HEAD and fact["attempt"] == 1
        assert fact["tier"] == tier and fact["slot"] == "0" and fact["job"]["id"] == job_id
        assert fact["source_trees"] == {"fork": SOURCE_TREE, "original": "dd8fc9c14c376d51876fbe312f419cb1d2c086d1"}
        assert fact["container_image"] == election.IMAGE and fact["native_execution"] is True
        assert fact["job"]["run_id"] == PRODUCER_RUN and fact["job"]["head_sha"] == PRODUCER_HEAD
        assert fact["algorithm_sha256"] == "45bcc49090398e8b7cebb13402d3aba61bee3b74c3ce72bb5670cada4af54119"
        assert fact["job"]["runner_id"] == job["runner_id"] and fact["runner_name"] == job["runner_name"]
        available, absent = election.derive(fact["fields"], fact["machine"])
        assert available is True and fact["available"] is True and fact["missing"] == absent
        assert fact["timed_records"] == 0 and fact["images_restored"] is False
        missing["avx512-" + tier] = {"job_id": job_id, "conclusion": "failure",
            "failed_minimum_eligible": True, "fact_artifact_id": artifact["id"],
            "fact_artifact_digest": artifact["digest"], "fact_sha256": sha(raw), "timed_records": 0}
        archive.unlink()
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
    expected = module.expected_keys()[0] + module.expected_keys(module.periodic_rows()[0])[0] + module.expected_keys(module.utf16_probe_rows()[0])[0]
    assert len(expected) == len(set(expected)) == 1886
    selected = [k for k in expected if json.loads(k)[0] != "avx512" or json.loads(k)[1] in SKY_TIERS]
    excluded = sorted(set(expected) - set(selected))
    assert len(selected) == 1886 and len(excluded) == 0
    assert all(json.loads(k)[:2] == ["avx512", "interpreter"] for k in excluded)
    # All minimum eligible originals are terminally failed before restore, so no
    # remaining original eligibility worker can produce a timed control.
    assert SKY_TIERS == ("interpreter", "c1", "c2") and len(selected) == 1886
    assert os.environ["GITHUB_REPOSITORY"] == "re-thc/openjdk-jdk27u"
    assert int(os.environ["GITHUB_RUN_ID"]) != PRODUCER_RUN and os.environ["GITHUB_SHA"] != PRODUCER_HEAD
    assert os.environ["GITHUB_REF"] == "refs/heads/codex/stringzilla-final-recovery-916ba895"
    fresh = module.api("actions/runs/" + str(PRODUCER_RUN))
    assert fresh["head_sha"] == PRODUCER_HEAD
    fresh_jobs = module.api("actions/runs/" + str(PRODUCER_RUN) + "/jobs?filter=all&per_page=100")
    assert fresh_jobs["total_count"] <= 100
    for alias, (producer_id, pair_id, pair_digest, _, _) in PAIRS.items():
        assert next(j for j in fresh_jobs["jobs"] if j["id"] == producer_id)["conclusion"] == "success"
        assert next(j for j in fresh_jobs["jobs"] if j["name"] == alias + "_controls")["conclusion"] == "skipped"
    for tier, failed_id in FAILED_SKY.items():
        failed = next(j for j in fresh_jobs["jobs"] if j["id"] == failed_id)
        assert failed["status"] == "completed" and failed["conclusion"] == "failure"
        for name in ("Restore complete pair and project the fixed manifest",
                     "Measure final SKY " + tier + " original enabled and disabled controls"):
            assert next(s for s in failed["steps"] if s["name"] == name)["conclusion"] == "skipped"
    for job in fresh_jobs["jobs"]:
        assert not any(step["name"].startswith("Measure final SKY ") and
                       (step["status"] == "in_progress" or step["conclusion"] == "success")
                       for step in job["steps"]), "Never cancel a possible original timing"
    fresh_artifacts = module.api("actions/runs/" + str(PRODUCER_RUN) + "/artifacts?per_page=100")
    assert fresh_artifacts["total_count"] <= 100
    assert not any(a["name"].startswith("stringzilla-final-results-") for a in fresh_artifacts["artifacts"])
    for alias, (_, pair_id, pair_digest, validation_id, validation_digest) in PAIRS.items():
        for artifact_id, digest in ((pair_id, pair_digest), (validation_id, validation_digest)):
            metadata = next(a for a in fresh_artifacts["artifacts"] if a["id"] == artifact_id)
            assert metadata["digest"] == "sha256:" + digest and metadata["expired"] is False
    write("superseded-artifact-index.json", {"run_id": PRODUCER_RUN, "head": PRODUCER_HEAD,
        "artifacts": [{"id": a["id"], "name": a["name"], "digest": a["digest"], "expired": a["expired"]}
                      for a in fresh_artifacts["artifacts"]]})
    cancel = {"run_id": PRODUCER_RUN, "head": PRODUCER_HEAD, "status_before": fresh["status"],
              "all15_terminal_missing": True, "timed_records_discarded": 0}
    if fresh["status"] != "completed":
        subprocess.run(["gh", "api", "--method", "POST", "repos/re-thc/openjdk-jdk27u/actions/runs/" +
                        str(PRODUCER_RUN) + "/cancel"], check=True, timeout=30)
        cancel["requested"] = True
    else:
        cancel["requested"] = False
    write("superseded-zero-timing-cleanup.json", cancel)
    write("recovery-preparation.json", {"schema": "stringzilla-final-missing-recovery-v1",
        "source": SOURCE, "source_tree": SOURCE_TREE, "base": BASE, "original_run": PRODUCER_RUN,
        "original_head": PRODUCER_HEAD, "missing": missing, "sky_tiers": SKY_TIERS,
        "triplets": len(selected), "records": len(selected) * 3, "physical_keys": sorted(selected),
        "excluded_live_original_physical_keys": excluded, "algorithm_sha256": ALGORITHM_HASH,
        "python_auth_tests_passed": True, "timed_records": 0, "pairs": pairs})
    output("pairs", json.dumps(pairs, separators=(",", ":")))
    output("sky-tiers", json.dumps(SKY_TIERS, separators=(",", ":")))
    output("triplets", len(selected))

def barrier():
    election = load("barrier_election", HERE / "stringzilla-final-sky-election.py")
    assert sha(Path(election.__file__).read_bytes()) == ALGORITHM_HASH
    assert os.environ["SOURCE"] == SOURCE and os.environ["SOURCE_TREE"] == SOURCE_TREE
    assert election.context()["attempt"] == 1
    deadline = time.monotonic() + election.FACT_WAIT_SECONDS
    results = {}
    OUT.mkdir(exist_ok=True)
    ctx = election.context()
    expected = {"avx512_controls (" + tier + ") / Final SKY " + tier + " slot " + slot + " on " + label
                for tier in SKY_TIERS for slot, label in election.SLOTS.items()}
    while True:
        payload = election.api("actions/runs/" + str(ctx["run_id"]) + "/jobs?per_page=100&filter=all")
        assert payload["total_count"] <= 100
        jobs = [job for job in payload["jobs"] if job["name"] in expected and job["run_attempt"] == 1]
        assert len({job["name"] for job in jobs}) == len(jobs)
        if {job["name"] for job in jobs} == expected:
            break
        assert time.monotonic() < deadline, "All scoped SKY workers must exist before release"
        time.sleep(30)
    for tier in SKY_TIERS:
        election.TIER = tier
        folder = OUT / "sky-fact-barrier" / tier
        folder.mkdir(parents=True)
        selection, proofs, jobs = election.collect_facts(folder, wait=True, deadline=deadline)
        election.write(folder / "selection.json", selection)
        results[tier] = selection
    write("sky-fact-barrier.json", {"source": SOURCE, "base": BASE, "source_trees": election.TREES,
        "elections": results, "algorithm_sha256": ALGORITHM_HASH, "timing_evidence": False})
    print("STRINGZILLA_SKY_FACT_BARRIER " + json.dumps({"source": SOURCE, "facts": 4 * len(SKY_TIERS),
        "selected": {tier: value["selected_slot"] for tier, value in results.items()}, "timed_records": 0}), flush=True)

if __name__ == "__main__":
    OUT.mkdir(exist_ok=True)
    {"configuration": configuration, "barrier": barrier}[sys.argv[1]]()
