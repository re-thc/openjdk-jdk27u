#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""One physical SKY worker; no election, replacement, or automatic retry."""
import contextlib
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import uuid
import zipfile
import platform
import traceback

SOURCE = "916ba895e834378e3f7eac7f030fc4abff641d33"
SOURCE_TREE = "d3de6a4fcf40e5b45b58d7e0874ed2ab34fe2e01"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
IMAGE = "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
MISSING_RUN = 39174300598
MISSING_HEAD = "99609a52cd38d5eb3ef093e7c13f30c7215d96d1"
# Only the two authenticated terminal-zero scopes are admitted.
MISSING_TIERS = ("interpreter", "c1")
MISSING_PROOF_HASH = "03185f6624eadfe76f6bcad584d5f3a79d594370005ae9042b99c504b687a94c"
OLD_ALGORITHM_HASH = "d893e2184a568fa8898af972eccd0cf5e263ee71676eb11e7ad543d3aa99a5f7"
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MANIFEST_HASH = "d94afb1b86132ff7fb5ec6bdfa81f033076b9c1057a6aa0c8fe815b7e4ea760d"
PAIR_RUN = 39164738566
PAIR_HEAD = "8bd517316162bc8a638b8339da47ac9c36b40d1e"
PAIR_JOB = 117789053163
PAIR_ID = 12151804060
PAIR_DIGEST = "sha256:6aa4e64d7515f97403162bde6c85ead38dfd2f4981818b04656f4ee6cefe401f"
VALIDATION_ID = 12152835042
VALIDATION_DIGEST = "sha256:29ae506c6ccb65a087f78e30fcf3a74adfce710e8201e274326655ade01bef56"
PRIOR_ZERO_RUN = 39187437768
PRIOR_ZERO_HEAD = "4176f25bfc42a553d9192328d726b233c23b552f"
PRIOR_ZERO_SHA256 = "7f44243c287516b68d63770e70c8847c53504e19b4c0f08e6a3201231c249040"
SUPERSEDED_QUEUED_RUN = 39196718293
SUPERSEDED_QUEUED_HEAD = "63f17c05909ef7f3cba6d428ef57ff5ae79960c3"
SUPERSEDED_QUEUED_JOB = 117880968412
RETRY_REF = "refs/heads/codex/stringzilla-single-sky-missing-916ba895-retry1"
WORKER = "Single host missing SKY controls"
HERE = Path(__file__).resolve().parent
ROOT = Path.cwd()
FOLDER = Path(os.environ["RUNNER_TEMP"]) / "stringzilla-single-sky"
COUNTS = {"interpreter": 136, "c1": 126, "c2": 124}
GUARD_TEST_HASH = "f7e6d24a283c9be1c752c88a76ebf8d41ed70635a5a191e4871340e81d69e6fe"
MODEL_HASH = "02f3e3d64d5f19e036e98959b4ec576cc20fb614aa3967af801c421af603f7f5"
COLLECTOR_TEST_HASH = "a0ee651404f0f9b44dccc5e117fddff86657f4a6fa6fcdcb5bd958470e1b90ae"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def raw_sha(data):
    return hashlib.sha256(data).hexdigest()


def canonical_artifact_digest(value):
    assert isinstance(value, str) and re.fullmatch(r"(?:sha256:)?[a-f0-9]{64}", value), "Malformed artifact SHA-256"
    return value if value.startswith("sha256:") else "sha256:" + value


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def output(name, value):
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write(name + "=" + str(value) + "\n")


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/" + path],
                                              text=True, timeout=30))


def context():
    assert os.environ["GITHUB_REPOSITORY"] == "re-thc/openjdk-jdk27u"
    ctx = {"run_id": int(os.environ["GITHUB_RUN_ID"]), "head": os.environ["GITHUB_SHA"],
           "attempt": int(os.environ["GITHUB_RUN_ATTEMPT"])}
    assert ctx["attempt"] == 1
    return ctx


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def checked_download(artifact, destination, ctx):
    assert artifact["workflow_run"]["id"] == ctx["run_id"]
    assert artifact["workflow_run"]["head_sha"] == ctx["head"] and not artifact["expired"]
    assert re.fullmatch(r"sha256:[a-f0-9]{64}", artifact["digest"])
    if not destination.exists():
        with destination.open("wb") as stream:
            subprocess.run(["gh", "api", "repos/re-thc/openjdk-jdk27u/actions/artifacts/" +
                            str(artifact["id"]) + "/zip"], stdout=stream, check=True, timeout=120)
    assert "sha256:" + sha(destination) == artifact["digest"]


def read_json_artifact(artifact, filename, destination, ctx):
    checked_download(artifact, destination, ctx)
    with zipfile.ZipFile(destination) as bundle:
        assert bundle.namelist().count(filename) == 1
        data = bundle.read(filename)
    return json.loads(data), raw_sha(data)


def selected_tiers():
    assert MISSING_TIERS and len(set(MISSING_TIERS)) == len(MISSING_TIERS) <= 3
    assert tuple(tier for tier in COUNTS if tier in MISSING_TIERS) == tuple(MISSING_TIERS)
    assert re.fullmatch(r"[a-f0-9]{64}", MISSING_PROOF_HASH), "Actual per-tier terminal-zero proof is not pinned"
    return tuple(MISSING_TIERS)


def old_election(tier):
    os.environ["SOURCE"], os.environ["SOURCE_TREE"], os.environ["TIER"] = SOURCE, SOURCE_TREE, tier
    path = HERE / "stringzilla-final-sky-election.py"
    assert sha(path) == OLD_ALGORITHM_HASH
    module = load("single_old_election_" + tier, path)
    return module


def verify_all_unavailable(folder, proof):
    tiers = tuple(proof["missing_tiers"])
    assert tiers == ("interpreter",)
    assert proof["schema"] == "stringzilla-final-sky-missing-v1"
    assert proof["source"] == SOURCE and proof["source_tree"] == SOURCE_TREE and proof["base"] == BASE
    assert proof["run_id"] == MISSING_RUN and proof["head"] == MISSING_HEAD and proof["attempt"] == 1
    assert proof["backend"] == "avx512" and tuple(proof["missing_tiers"]) == tiers
    assert proof["zero_shape"] == "all-four-authenticated-unavailable"
    assert proof["algorithm_sha256"] == OLD_ALGORITHM_HASH and proof["timed_records"] == 0
    assert proof["images_restored"] is False and proof["triplets"] == sum(COUNTS[tier] for tier in tiers)
    assert proof["records"] == proof["triplets"] * 3 and proof["logical_groups"] == len(tiers)
    jobs_payload = api("actions/runs/" + str(MISSING_RUN) + "/jobs?filter=all&per_page=100")
    artifacts_payload = api("actions/runs/" + str(MISSING_RUN) + "/artifacts?per_page=100")
    assert jobs_payload["total_count"] <= 100 and artifacts_payload["total_count"] <= 100
    records = proof["facts"]
    assert len(records) == 4 * len(tiers)
    for tier in tiers:
        election = old_election(tier)
        tier_records = [r for r in records if r.get("tier", proof["missing_tiers"][0]) == tier]
        assert {r["slot"] for r in tier_records} == set(election.SLOTS) and len(tier_records) == 4
        nonces = set()
        for record in tier_records:
            slot = record["slot"]
            matches = [j for j in jobs_payload["jobs"] if j["id"] == record["job_id"]]
            assert len(matches) == 1
            job = matches[0]
            assert job["status"] == "completed" and job["conclusion"] == "success"
            for name in (election.PUBLISH, "Restore complete pair and project the fixed manifest",
                         "Measure final SKY " + tier + " original enabled and disabled controls"):
                steps = [s for s in job["steps"] if s["name"] == name]
                assert len(steps) == 1 and steps[0]["status"] == "completed"
                assert steps[0]["conclusion"] == ("success" if name == election.PUBLISH else "skipped")
            matches = [a for a in artifacts_payload["artifacts"] if a["name"] == election.fact_name(
                {"run_id": MISSING_RUN}, slot)]
            assert len(matches) == 1 and matches[0]["id"] == record["artifact"]["id"]
            artifact = matches[0]
            assert artifact["digest"] == record["artifact"]["digest"]
            facts = folder / ("original-zero-" + tier)
            facts.mkdir(exist_ok=True)
            fact, binding = election.read_fact(facts, slot, artifact, job,
                {"run_id": MISSING_RUN, "head": MISSING_HEAD, "attempt": 1})
            assert fact["available"] is False and binding["proof_sha256"] == record["fact_json_sha256"]
            nonces.add(fact["nonce"])
        assert len(nonces) == 4
        assert not any(a["name"].startswith("stringzilla-final-results-avx512-" + tier + "-")
                       for a in artifacts_payload["artifacts"])
    return proof


def verify_failed_minimum_before_images(folder, proof):
    """Authenticate the failed C1 minimum and all four actual terminal zero workers."""
    assert proof["schema"] == "stringzilla-final-sky-missing-v1"
    assert proof["source"] == SOURCE and proof["source_tree"] == SOURCE_TREE and proof["base"] == BASE
    assert proof["run_id"] == MISSING_RUN and proof["head"] == MISSING_HEAD and proof["attempt"] == 1
    assert proof["backend"] == "avx512" and proof["missing_tiers"] == ["c1"]
    assert proof["zero_shape"] == "failed-minimum-eligible-before-images"
    assert proof["minimum_slot"] == "2" and proof["algorithm_sha256"] == OLD_ALGORITHM_HASH
    assert proof["timed_records"] == 0 and proof["images_restored"] is False
    assert proof["triplets"] == COUNTS["c1"] and proof["records"] == COUNTS["c1"] * 3
    assert proof["logical_groups"] == 1
    election = old_election("c1")
    jobs_payload = api("actions/runs/" + str(MISSING_RUN) + "/jobs?filter=all&per_page=100")
    artifacts_payload = api("actions/runs/" + str(MISSING_RUN) + "/artifacts?per_page=100")
    assert jobs_payload["total_count"] <= 100 and artifacts_payload["total_count"] <= 100
    jobs = {}
    for slot in election.SLOTS:
        matches = [job for job in jobs_payload["jobs"] if job["name"] == election.name(slot)]
        assert len(matches) == 1
        job = matches[0]
        assert job["run_id"] == MISSING_RUN and job["head_sha"] == MISSING_HEAD and job["run_attempt"] == 1
        jobs[slot] = job
    prefix, higher = proof["facts"], proof["late_higher_jobs"]
    assert len(prefix) == 3 and {record["slot"] for record in prefix} == {"0", "1", "2"}
    assert len(higher) == 1 and higher[0]["slot"] == "3"
    records = prefix + higher
    assert proof["minimum_job_id"] == jobs["2"]["id"]
    facts, nonces = {}, set()
    ctx = {"run_id": MISSING_RUN, "head": MISSING_HEAD, "attempt": 1}
    for record in records:
        slot, job = record["slot"], jobs[record["slot"]]
        assert job["id"] == record["job_id"] and job["name"] == record["job_name"]
        assert job["status"] == "completed"
        assert job["conclusion"] == ("failure" if slot == "2" else "success")
        for name in (election.PUBLISH, "Restore complete pair and project the fixed manifest",
                     "Measure final SKY c1 original enabled and disabled controls"):
            steps = [step for step in job["steps"] if step["name"] == name]
            assert len(steps) == 1 and steps[0]["status"] == "completed"
            assert steps[0]["conclusion"] == ("success" if name == election.PUBLISH else "skipped")
        matches = [artifact for artifact in artifacts_payload["artifacts"]
                   if artifact["name"] == election.fact_name(ctx, slot)]
        assert len(matches) == 1 and matches[0]["id"] == record["artifact"]["id"]
        assert matches[0]["digest"] == record["artifact"]["digest"]
        saved = folder / "failed-minimum-c1"
        saved.mkdir(exist_ok=True)
        fact, binding = election.read_fact(saved, slot, matches[0], job, ctx)
        assert fact["available"] is (slot == "2") and record["available"] is fact["available"]
        assert binding["proof_sha256"] == record["fact_json_sha256"]
        facts[slot] = fact
        nonces.add(fact["nonce"])
    assert len(nonces) == 4
    failed = [step for step in jobs["2"]["steps"]
              if step["name"].startswith("Verify ALLFOUR facts then choose MIN eligible slot on ")]
    assert len(failed) == 1 and failed[0]["status"] == "completed" and failed[0]["conclusion"] == "failure"
    assert election.known_loss("3", facts) == {"reason": "own-unavailable"}
    assert not any(artifact["name"].startswith("stringzilla-final-results-avx512-c1-")
                   for artifact in artifacts_payload["artifacts"])
    return proof


def verify_missing(folder):
    tiers = selected_tiers()
    path = HERE / "stringzilla-single-sky-missing-proof.json"
    assert sha(path) == MISSING_PROOF_HASH
    proof = json.loads(path.read_text())
    assert proof["schema"] == "stringzilla-single-sky-missing-tuple-v1"
    assert proof["source"] == SOURCE and proof["source_tree"] == SOURCE_TREE and proof["base"] == BASE
    assert proof["run_id"] == MISSING_RUN and proof["head"] == MISSING_HEAD and proof["attempt"] == 1
    assert proof["backend"] == "avx512" and tuple(proof["missing_tiers"]) == tiers
    assert proof["triplets"] == sum(COUNTS[tier] for tier in tiers)
    assert proof["records"] == proof["triplets"] * 3 and proof["logical_groups"] == len(tiers)
    assert proof["timed_records"] == 0 and proof["images_restored"] is False
    assert proof["algorithm_sha256"] == OLD_ALGORITHM_HASH
    assert set(proof["proofs"]) == set(tiers)
    saved_tier = os.environ.get("TIER")
    checked = {}
    try:
        for tier in tiers:
            entry = proof["proofs"][tier]
            filename = "stringzilla-single-sky-" + tier + "-zero.json"
            assert entry["path"] == filename and re.fullmatch(r"[a-f0-9]{64}", entry["sha256"])
            path = HERE / filename
            assert sha(path) == entry["sha256"]
            child = json.loads(path.read_text())
            assert child["missing_tiers"] == [tier] and child["zero_shape"] == entry["zero_shape"]
            if tier == "interpreter" and entry["zero_shape"] == "all-four-authenticated-unavailable":
                checked[tier] = verify_all_unavailable(folder, child)
            else:
                assert tier == "c1" and entry["zero_shape"] == "failed-minimum-eligible-before-images"
                checked[tier] = verify_failed_minimum_before_images(folder, child)
    finally:
        if saved_tier is None:
            os.environ.pop("TIER", None)
        else:
            os.environ["TIER"] = saved_tier
    # Image identity comes from the authenticated existing interpreter zero proof.
    assert "interpreter" in checked
    assert all(child["image_pair"] == checked["interpreter"]["image_pair"] for child in checked.values())
    return {**proof, "image_pair": checked["interpreter"]["image_pair"]}


def current_job(ctx):
    payload = api("actions/runs/" + str(ctx["run_id"]) + "/jobs?filter=all&per_page=100")
    assert payload["total_count"] <= 100
    jobs = [j for j in payload["jobs"] if j["name"] == WORKER]
    assert len(jobs) == 1
    job = jobs[0]
    assert job["run_id"] == ctx["run_id"] and job["head_sha"] == ctx["head"] and job["run_attempt"] == 1
    assert job["runner_id"] > 0 and job["runner_name"]
    return job


def derive(fields, machine):
    flags = set(fields.get("flags", "").split())
    required = {"avx", "avx2", "bmi1", "bmi2", "f16c", "fma", "movbe", "popcnt",
                "sse4_1", "sse4_2", "ssse3", "cx16", "avx512f", "avx512bw", "avx512vl"}
    missing = sorted(required - flags)
    if not flags.intersection({"abm", "lzcnt"}):
        missing.append("lzcnt/abm")
    return machine.lower() in ("amd64", "x86_64") and not missing, missing

def host():
    cpu = min(os.sched_getaffinity(0))
    fields = next({key.strip(): value.strip() for key, value in
        (line.split(":", 1) for line in block.splitlines() if ":" in line)}
        for block in Path("/proc/cpuinfo").read_text().strip().split("\n\n")
        if re.search(r"(?m)^processor\s*:\s*" + str(cpu) + r"\s*$", block))
    release = Path("/etc/os-release").read_text()
    assert 'VERSION_ID="26.04"' in release and os.environ["EXPECTED_CONTAINER_IMAGE"] == IMAGE
    machine = platform.machine()
    available, missing = derive(fields, machine)
    return {"cpu": cpu, "fields": fields, "machine": machine, "available": available, "missing": missing,
            "container_image": IMAGE, "native_execution": True,
            "os_release_sha256": sha(Path("/etc/os-release")),
            "libc_sha256": sha(Path("/usr/lib/x86_64-linux-gnu/libc.so.6")),
            "affinity": sorted(os.sched_getaffinity(0))}

def verify_host(proof):
    assert proof["runner_name"] == os.environ["RUNNER_NAME"]
    current = host()
    assert current["available"] is True and current["cpu"] == proof["cpu"]
    for key in ("vendor_id", "cpu family", "model", "model name"):
        assert current["fields"].get(key) == proof["fields"].get(key)
    assert set(current["fields"]["flags"].split()) == set(proof["fields"]["flags"].split())
    assert current["container_image"] == proof["container_image"]
    assert current["os_release_sha256"] == proof["os_release_sha256"]
    assert current["libc_sha256"] == proof["libc_sha256"]


def verify_superseded_queued_attempt():
    assert context()["run_id"] != SUPERSEDED_QUEUED_RUN
    run = api("actions/runs/" + str(SUPERSEDED_QUEUED_RUN))
    assert run["id"] == SUPERSEDED_QUEUED_RUN and run["head_sha"] == SUPERSEDED_QUEUED_HEAD
    assert run["run_attempt"] == 1 and run["head_branch"] == RETRY_REF.removeprefix("refs/heads/")
    assert run["status"] == "completed" and run["conclusion"] == "cancelled"
    payload = api("actions/runs/" + str(SUPERSEDED_QUEUED_RUN) + "/jobs?filter=all&per_page=100")
    assert payload["total_count"] == len(payload["jobs"]) == 1
    job = payload["jobs"][0]
    assert job["id"] == SUPERSEDED_QUEUED_JOB and job["name"] == "Authenticate exact missing-only scope and original complete pair"
    assert job["run_id"] == SUPERSEDED_QUEUED_RUN and job["head_sha"] == SUPERSEDED_QUEUED_HEAD and job["run_attempt"] == 1
    assert job["status"] == "completed" and job["conclusion"] in ("cancelled", "skipped")
    steps = [{key: step[key] for key in ("name", "number", "status", "conclusion")} for step in job["steps"]]
    assert all(step["status"] == "completed" and step["conclusion"] in ("cancelled", "skipped") for step in steps)
    payload = api("actions/runs/" + str(SUPERSEDED_QUEUED_RUN) + "/artifacts?per_page=100")
    assert payload["total_count"] == len(payload["artifacts"]) == 0
    return {"schema": "stringzilla-single-sky-queued-zero-v1", "source": SOURCE, "base": BASE,
        "run_id": SUPERSEDED_QUEUED_RUN, "head": SUPERSEDED_QUEUED_HEAD, "attempt": 1,
        "head_branch": RETRY_REF.removeprefix("refs/heads/"), "status": "completed", "conclusion": "cancelled",
        "configuration": {"id": job["id"], "name": job["name"], "status": job["status"],
            "conclusion": job["conclusion"], "steps": steps},
        "worker_jobs": 0, "artifacts": [], "timed_records": 0, "images_restored": False,
        "missing_tiers": ["interpreter", "c1"], "triplets": 262, "records": 786}


def verify_inputs(value, ctx):
    assert value["run_id"] == ctx["run_id"] and value["head"] == ctx["head"] and value["attempt"] == 1
    assert value["schema"] == "stringzilla-single-sky-preparation-v1"
    assert value["source"] == SOURCE and value["source_tree"] == SOURCE_TREE and value["base"] == BASE
    assert value["module_sha256"] == sha(Path(__file__))
    assert tuple(value["tiers"]) == selected_tiers() and value["missing_proof_sha256"] == MISSING_PROOF_HASH
    assert value["helper_sha256"] == HELPER_HASH and value["manifest_sha256"] == MANIFEST_HASH
    assert value["python_auth_tests_passed"] is True
    assert value["producer_run"] == PAIR_RUN and value["producer_head"] == PAIR_HEAD
    assert value["pair_artifact_id"] == PAIR_ID and value["pair_artifact_digest"] == PAIR_DIGEST
    assert re.fullmatch(r"[a-f0-9]{64}", value["driver_sha256"])
    assert value["independent_scope_model_passed"] is True
    assert value["superseded_queued_zero_sha256"] == raw_sha((json.dumps(value["superseded_queued_zero"], indent=2) + "\n").encode())
    queued = value["superseded_queued_zero"]
    assert queued["schema"] == "stringzilla-single-sky-queued-zero-v1"
    assert queued["source"] == SOURCE and queued["base"] == BASE
    assert queued["run_id"] == SUPERSEDED_QUEUED_RUN and queued["head"] == SUPERSEDED_QUEUED_HEAD and queued["attempt"] == 1
    assert queued["status"] == "completed" and queued["conclusion"] == "cancelled"
    assert queued["worker_jobs"] == queued["timed_records"] == 0 and queued["artifacts"] == []
    assert queued["images_restored"] is False
    assert value["prior_attempt_zero_sha256"] == PRIOR_ZERO_SHA256
    assert raw_sha((json.dumps(value["prior_attempt_zero"], indent=2) + "\n").encode()) == PRIOR_ZERO_SHA256
    assert set(value["image_hashes"]) == {"original", "fork"}
    assert all(re.fullmatch(r"[a-f0-9]{64}", v) for v in value["image_hashes"].values())
    assert value["image_hashes"]["original"] != value["image_hashes"]["fork"]


def verify_prior_attempt_zero(proof):
    assert raw_sha((json.dumps(proof, indent=2) + "\n").encode()) == PRIOR_ZERO_SHA256
    assert proof["schema"] == "stringzilla-single-sky-infrastructure-zero-v1"
    assert proof["source"] == SOURCE and proof["baseline"] == BASE
    assert proof["run_id"] == PRIOR_ZERO_RUN and proof["head"] == PRIOR_ZERO_HEAD and proof["attempt"] == 1
    assert tuple(proof["missing_tiers"]) == selected_tiers() and proof["triplets"] == 262 and proof["records"] == 786
    assert proof["timed_records"] == 0 and all(count == 0 for count in proof["marker_counts"].values())
    assert context()["run_id"] != PRIOR_ZERO_RUN
    run = api("actions/runs/" + str(PRIOR_ZERO_RUN))
    assert run["id"] == PRIOR_ZERO_RUN and run["head_sha"] == PRIOR_ZERO_HEAD and run["run_attempt"] == 1
    assert run["status"] == "completed" and run["conclusion"] == "failure"
    payload = api("actions/runs/" + str(PRIOR_ZERO_RUN) + "/jobs?filter=all&per_page=100")
    assert payload["total_count"] == len(payload["jobs"]) == 3
    names = {"Authenticate exact missing-only scope and original complete pair",
             WORKER, "Qualify exact completed missing SKY controls and preserve failed parent status"}
    assert {job["name"] for job in payload["jobs"]} == names
    for job in payload["jobs"]:
        assert job["run_id"] == PRIOR_ZERO_RUN and job["head_sha"] == PRIOR_ZERO_HEAD and job["run_attempt"] == 1
        assert job["status"] == "completed"
        if job["name"] == WORKER:
            assert job["id"] == proof["worker"]["id"] == 117856984856 and job["conclusion"] == "failure"
            actual = [{key: step[key] for key in ("name", "number", "status", "conclusion")} for step in job["steps"]]
            assert actual == proof["worker"]["steps"]
        elif job["name"] == "Authenticate exact missing-only scope and original complete pair":
            assert job["conclusion"] == "success"
        else:
            assert job["id"] == proof["collector"]["id"] == 117871808510 and job["conclusion"] == "skipped"
    payload = api("actions/runs/" + str(PRIOR_ZERO_RUN) + "/artifacts?per_page=100")
    assert payload["total_count"] == len(payload["artifacts"]) == 1
    artifact = payload["artifacts"][0]
    expected = proof["artifacts"][0]
    assert all(artifact[key] == expected[key] for key in ("id", "name", "digest", "expired"))
    assert artifact["size_in_bytes"] == expected["size"]
    assert artifact["workflow_run"]["id"] == PRIOR_ZERO_RUN and artifact["workflow_run"]["head_sha"] == PRIOR_ZERO_HEAD
    return proof


def preparation(folder):
    ctx = context()
    artifact = api("actions/artifacts/" + os.environ["PREPARATION_ID"])
    assert artifact["id"] == int(os.environ["PREPARATION_ID"])
    assert artifact["digest"] == canonical_artifact_digest(os.environ["PREPARATION_DIGEST"])
    assert artifact["name"] == "stringzilla-single-sky-preparation-" + ctx["head"]
    value, proof_sha = read_json_artifact(artifact, "preparation.json", folder / "preparation.zip", ctx)
    verify_inputs(value, ctx)
    return value, {"artifact_id": artifact["id"], "artifact_digest": artifact["digest"], "proof_sha256": proof_sha}


def probe():
    ctx = context()
    assert os.environ["SOURCE"] == SOURCE and os.environ["SOURCE_TREE"] == SOURCE_TREE
    FOLDER.mkdir()
    prep, binding = preparation(FOLDER)
    verify_prior_attempt_zero(prep["prior_attempt_zero"])
    assert verify_superseded_queued_attempt() == prep["superseded_queued_zero"]
    job = current_job(ctx)
    assert job["status"] == "in_progress" and job["runner_name"] == os.environ["RUNNER_NAME"]
    proof = {**ctx, "schema": "stringzilla-single-host-fact-v1", "mode": "single-host-v1",
             "source": SOURCE, "source_tree": SOURCE_TREE, "base": BASE, "tiers": list(selected_tiers()),
             "job_id": job["id"], "job_name": job["name"], "runner_id": job["runner_id"],
             "runner_name": job["runner_name"], "nonce": uuid.uuid4().hex,
             "module_sha256": sha(Path(__file__)), "preparation": binding,
             "inputs": prep, "timed_records": 0, "images_restored": False, **host()}
    write(FOLDER / "lease.json", proof)
    output("available", str(proof["available"]).lower())
    output("folder", FOLDER)
    print("STRINGZILLA_SINGLE_HOST_FACT " + json.dumps(proof, separators=(",", ":")), flush=True)
    if not proof["available"]:
        write(FOLDER / "zero.json", {"schema": "stringzilla-single-host-zero-v1", **ctx,
            "source": SOURCE, "tiers": list(selected_tiers()), "zero_kind": "physical-unavailable",
            "fact_sha256": sha(FOLDER / "lease.json"), "timed_records": 0, "images_restored": False})


def verify_fact(proof, job, ctx):
    assert proof["schema"] == "stringzilla-single-host-fact-v1" and proof["mode"] == "single-host-v1"
    assert proof["run_id"] == ctx["run_id"] and proof["head"] == ctx["head"] and proof["attempt"] == 1
    assert proof["source"] == SOURCE and proof["source_tree"] == SOURCE_TREE and proof["base"] == BASE
    assert tuple(proof["tiers"]) == selected_tiers() and proof["module_sha256"] == sha(Path(__file__))
    assert job["id"] == proof["job_id"] and job["name"] == proof["job_name"] == WORKER
    assert job["run_id"] == ctx["run_id"] and job["head_sha"] == ctx["head"] and job["run_attempt"] == 1
    assert job["runner_id"] == proof["runner_id"] > 0 and job["runner_name"] == proof["runner_name"]
    assert proof["job_id"] > 0 and proof["cpu"] >= 0 and type(proof["cpu"]) is int
    assert proof["source_tree"] == SOURCE_TREE
    assert re.fullmatch(r"[a-f0-9]{32}", proof["nonce"])
    assert proof["container_image"] == IMAGE and proof["native_execution"] is True
    assert proof["timed_records"] == 0 and proof["images_restored"] is False
    available, missing = derive(proof["fields"], proof["machine"])
    assert type(proof["available"]) is bool and proof["available"] == available and proof["missing"] == missing
    for key in ("os_release_sha256", "libc_sha256"):
        assert re.fullmatch(r"[a-f0-9]{64}", proof[key])


def own_fact():
    ctx = context()
    job = current_job(ctx)
    proof = json.loads((FOLDER / "lease.json").read_text())
    artifact = api("actions/artifacts/" + os.environ["FACT_ARTIFACT_ID"])
    assert artifact["id"] == int(os.environ["FACT_ARTIFACT_ID"])
    assert artifact["digest"] == canonical_artifact_digest(os.environ["FACT_ARTIFACT_DIGEST"])
    assert artifact["name"] == "stringzilla-single-sky-fact-" + ctx["head"]
    published, published_sha = read_json_artifact(artifact, "lease.json", FOLDER / "published-fact.zip", ctx)
    assert published == proof and published_sha == sha(FOLDER / "lease.json")
    verify_fact(proof, job, ctx)
    assert job["status"] == "in_progress" and job["runner_name"] == os.environ["RUNNER_NAME"]
    assert proof["available"] is True
    steps = [step for step in job["steps"] if step["name"] == "Publish immutable single-host CPU fact"]
    assert len(steps) == 1 and steps[0]["status"] == "completed" and steps[0]["conclusion"] == "success"
    verify_host(proof)
    return proof, {"artifact_id": artifact["id"], "artifact_digest": artifact["digest"],
                   "proof_sha256": published_sha}, job


def validate_ready_data(ready, proof, tier, read):
    assert ready["schema"] == "stringzilla-single-host-ready-v1" and ready["tier"] == tier
    assert ready["nonce"] == proof["nonce"] and ready["job_id"] == proof["job_id"]
    for name, filename in (("runtime", "runtime-attestation.json"), ("native", "native-validation.json"),
                           ("native_log", "native-validation/run.log")):
        assert ready[name + "_sha256"] == raw_sha(read(filename))
    runtime = json.loads(read("runtime-attestation.json"))
    assert runtime["available"] is True and runtime["backend"] == "avx512" and runtime["tier"] == tier
    assert runtime["source"] == SOURCE and runtime["timed_records"] == 0
    expected = {"original": "3", "enabled": "3:2:true", "disabled": "3:2:false"}
    assert set(runtime["observations"]) == set(expected)
    for control, value in runtime["observations"].items():
        assert value["returncode"] == 0 and value["actual"] == value["expected"] == expected[control]
    assert json.loads(read("native-validation.json")) == {"passed": True}
    assert "requested=2 selected=2 executable=1" in read("native-validation/run.log").decode()



def validate_ready(ready, proof, tier, folder):
    validate_ready_data(ready, proof, tier, lambda name: (folder / name).read_bytes())


def verify_saved(tier, phase, folder):
    assert tier in selected_tiers() and phase in ("restore", "measure", "periodic", "utf16-probe")
    assert os.environ.get("STRINGZILLA_SKY_AUTHORIZATION") == "single-host-v1"
    folder = Path(folder)
    assert folder.resolve() == (Path.cwd() / "perf-output").resolve()
    proof, binding, job = own_fact()
    verify_missing(FOLDER)
    assert proof["inputs"]["driver_sha256"] == sha(Path.cwd() / "driver/.github/scripts/stringzilla-final.py")
    if phase != "restore":
        ready = json.loads((FOLDER / (tier + "-ready.json")).read_text())
        validate_ready(ready, proof, tier, folder)
        receipt = json.loads((folder / "pair-receipt.json").read_text())
        assert receipt["sources"] == {"original": BASE, "fork": SOURCE} and receipt["backend"] == "avx2"
        assert receipt["producer_run"] == str(PAIR_RUN) and receipt["producer_head"] == PAIR_HEAD
        assert {key: value["tree_sha256"] for key, value in receipt["image_hashes"].items()} == proof["inputs"]["image_hashes"]
    event = {"tier": tier, "phase": phase, "job_id": job["id"], "runner_id": job["runner_id"],
             "nonce": proof["nonce"], "cpu": proof["cpu"], "fact": binding}
    path = FOLDER / (tier + "-authorizations.json")
    events = json.loads(path.read_text()) if path.exists() else []
    assert len(events) == ("restore", "measure", "periodic", "utf16-probe").index(phase)
    events.append(event)
    write(path, events)
    print("STRINGZILLA_SINGLE_HOST_PHASE_AUTH " + json.dumps(event, separators=(",", ":")), flush=True)
    return event



def prepare():
    assert os.environ["SOURCE"] == SOURCE and os.environ["SOURCE_TREE"] == SOURCE_TREE
    assert os.environ["GITHUB_REF"] == RETRY_REF
    ctx = context()
    assert ctx["run_id"] not in (PAIR_RUN, MISSING_RUN)
    tests = HERE / "stringzilla-single-sky-test.py"
    assert sha(tests) == GUARD_TEST_HASH
    subprocess.run([sys.executable, tests, Path(__file__)], check=True)
    subprocess.run([sys.executable, HERE / "stringzilla-final-sky-election-test.py",
                    HERE / "stringzilla-final-sky-election.py", OLD_ALGORITHM_HASH], check=True)
    folder = Path("perf-output")
    folder.mkdir(exist_ok=True)
    prior_raw = (HERE / "stringzilla-single-sky-prior-attempt-zero.json").read_bytes()
    assert raw_sha(prior_raw) == PRIOR_ZERO_SHA256
    prior = verify_prior_attempt_zero(json.loads(prior_raw))
    queued_zero = verify_superseded_queued_attempt()
    write(folder / "superseded-queued-attempt-zero.json", queued_zero)
    proof = verify_missing(folder)
    model = HERE / "stringzilla-single-sky-model.js"
    collector_test = HERE / "stringzilla-single-sky-collector-test.js"
    assert sha(model) == MODEL_HASH and sha(collector_test) == COLLECTOR_TEST_HASH
    subprocess.run(["node", model, HERE / "stringzilla-final-cases.tsv",
        HERE / "stringzilla-periodic-cases.tsv", HERE / "stringzilla-utf16-probe-cases.tsv",
        HERE / "stringzilla-single-sky-missing-proof.json"], check=True)
    subprocess.run(["node", collector_test, HERE / "stringzilla-single-sky-collector.js"], check=True)
    driver = load("single_prepare_driver", HERE / "stringzilla-final.py")
    driver.check_sources(SOURCE)
    assert driver.command(["git", "rev-parse", "HEAD^{tree}"]) == SOURCE_TREE
    all_keys = driver.expected_keys()[0] + driver.expected_keys(driver.periodic_rows()[0])[0]
    selected = sorted(k for k in all_keys if json.loads(k)[0] == "avx512" and json.loads(k)[1] in selected_tiers())
    assert len(selected) == sum(COUNTS[tier] for tier in selected_tiers()) == len(set(selected))
    assert proof["scope_sha256"] == raw_sha((json.dumps(selected, separators=(",", ":")) + "\n").encode())
    payload = driver.api("actions/runs/" + str(PAIR_RUN) + "/jobs?filter=all&per_page=100")
    assert payload["total_count"] <= 100
    jobs = [job for job in payload["jobs"] if job["id"] == PAIR_JOB]
    assert len(jobs) == 1
    job = jobs[0]
    assert job["run_id"] == PAIR_RUN and job["head_sha"] == PAIR_HEAD and job["run_attempt"] == 1
    assert job["name"].endswith("/ avx2 validated pair") and job["status"] == "completed" and job["conclusion"] == "success"
    for name in ("Verify and archive matched complete pair", "Publish complete images before tests",
                 "Run profiles, jtreg and native contract checks"):
        assert next(step for step in job["steps"] if step["name"] == name)["conclusion"] == "success"
    pair = driver.api("actions/artifacts/" + str(PAIR_ID))
    assert pair["id"] == PAIR_ID and pair["digest"] == PAIR_DIGEST and pair["expired"] is False
    assert pair["name"] == "stringzilla-final-pair-avx2-" + PAIR_HEAD
    assert pair["workflow_run"]["id"] == PAIR_RUN and pair["workflow_run"]["head_sha"] == PAIR_HEAD
    archive = folder / "validated-pair.zip"
    validation = driver.download(VALIDATION_ID, VALIDATION_DIGEST, PAIR_RUN, PAIR_HEAD, archive)
    assert validation["name"] == "stringzilla-final-build-avx2-" + PAIR_HEAD
    with zipfile.ZipFile(archive) as bundle:
        raw = bundle.read("pair-receipt.json")
    receipt = json.loads(raw)
    assert receipt["sources"] == {"original": BASE, "fork": SOURCE} and receipt["backend"] == "avx2"
    assert receipt["producer_run"] == str(PAIR_RUN) and receipt["producer_head"] == PAIR_HEAD
    assert receipt["source_trees"] == driver.check_sources(SOURCE)
    assert receipt["helper_sha256"] == HELPER_HASH and receipt["parent_manifest_sha256"] == MANIFEST_HASH
    spec = receipt["spec"]
    assert spec["DEBUG_LEVEL"] == "release" and spec["SOURCE_DATE"] == "1792195200"
    assert spec["VERSION_OPT"] == "stringzilla-benchmark"
    assert re.match(r"16\.", spec["CC_VERSION_NUMBER"]) and re.match(r"16\.", spec["CXX_VERSION_NUMBER"])
    images = {control: receipt["image_hashes"][control]["tree_sha256"] for control in ("original", "fork")}
    assert all(re.fullmatch(r"[a-f0-9]{64}", value) for value in images.values()) and images["original"] != images["fork"]
    assert images == proof["image_pair"]["image_tree_sha256"]
    value = {"schema": "stringzilla-single-sky-preparation-v1", "source": SOURCE, "source_tree": SOURCE_TREE,
        "base": BASE, "tiers": list(selected_tiers()), "missing_proof_sha256": MISSING_PROOF_HASH,
        "module_sha256": sha(Path(__file__)), "driver_sha256": sha(HERE / "stringzilla-final.py"),
        "helper_sha256": HELPER_HASH, "manifest_sha256": MANIFEST_HASH, "producer_run": PAIR_RUN,
        "producer_head": PAIR_HEAD, "producer_job_id": PAIR_JOB,
        "pair_artifact_id": PAIR_ID, "pair_artifact_digest": PAIR_DIGEST,
        "validation_artifact_id": VALIDATION_ID, "validation_artifact_digest": VALIDATION_DIGEST,
        "validation_receipt_sha256": raw_sha(raw), "image_hashes": images, "physical_keys": selected,
        "triplets": len(selected), "records": len(selected) * 3, "python_auth_tests_passed": True,
        "independent_scope_model_passed": True, "prior_attempt_zero_sha256": PRIOR_ZERO_SHA256,
        "prior_attempt_zero": prior, "superseded_queued_zero": queued_zero,
        "superseded_queued_zero_sha256": raw_sha((json.dumps(queued_zero, indent=2) + "\n").encode()), **ctx}
    verify_missing(folder)
    write(folder / "preparation.json", value)
    archive.unlink()
    driver.proof(SOURCE)
    output("tiers", json.dumps(list(selected_tiers()), separators=(",", ":")))
    output("original-hash", images["original"])
    output("fork-hash", images["fork"])


def run_cli(mode, tier, prep, console):
    args = [sys.executable, "driver/.github/scripts/stringzilla-final.py", mode,
            "--source", SOURCE, "--backend", "avx512", "--tier", tier]
    if mode == "restore":
        args += ["--artifact-id", str(PAIR_ID), "--artifact-digest", PAIR_DIGEST,
                 "--parent-manifest-hash", MANIFEST_HASH]
    if mode in ("restore", "measure", "periodic", "utf16-probe"):
        args += ["--original-hash", prep["image_hashes"]["original"],
                 "--fork-hash", prep["image_hashes"]["fork"]]
    if mode in ("restore", "measure"):
        args += ["--helper-hash", HELPER_HASH]
    child = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, bufsize=1)
    for line in child.stdout:
        console.write(line)
        console.flush()
        print(line, end="", flush=True)
    assert child.wait() == 0, "Infrastructure/partial phase failure: retain raw, no automatic retry"


def run_tier(tier):
    assert tier in selected_tiers() and not (FOLDER / "stop.json").exists()
    assert os.environ.get("STRINGZILLA_SKY_AUTHORIZATION") == "single-host-v1"
    folder = Path("perf-output")
    assert not folder.exists(), "Previous tier scratch has not been durably retained"
    folder.mkdir()
    proof, binding, job = own_fact()
    prep = proof["inputs"]
    with (folder / "tier-console.log").open("w") as console:
        for name, value in (("ORIGINAL_HASH", prep["image_hashes"]["original"]),
                            ("FORK_HASH", prep["image_hashes"]["fork"])):
            line = name + ": " + value + "\n"
            console.write(line)
            print(line, end="", flush=True)
        run_cli("restore", tier, prep, console)
        run_cli("runtime", tier, prep, console)
        runtime = json.loads((folder / "runtime-attestation.json").read_text())
        if not runtime["available"]:
            # Execution/compilation failures are infrastructure errors, never unsupported receipts.
            for control, observation in runtime["observations"].items():
                pattern = r"\d+" if control == "original" else r"\d+:[0-7]:" + str(control == "enabled").lower()
                assert observation["returncode"] == 0 and re.fullmatch(pattern, observation["actual"])
            assert not (folder / "experiment.log").exists()
            zero = {"schema": "stringzilla-single-host-zero-v1", **context(), "source": SOURCE,
                    "tier": tier, "zero_kind": "runtime-unavailable", "timed_records": 0,
                    "images_restored": True, "fact": binding, "runtime_sha256": sha(folder / "runtime-attestation.json")}
            write(folder / "single-host-zero.json", zero)
            write(FOLDER / "stop.json", zero)
            output("unsupported", "true")
            with open(os.environ["GITHUB_ENV"], "a") as stream:
                stream.write("SINGLE_STOP=true\n")
            return
        run_cli("native", tier, prep, console)
        ready = {"schema": "stringzilla-single-host-ready-v1", "tier": tier, "nonce": proof["nonce"],
                 "job_id": job["id"], "runtime_sha256": sha(folder / "runtime-attestation.json"),
                 "native_sha256": sha(folder / "native-validation.json"),
                 "native_log_sha256": sha(folder / "native-validation/run.log")}
        validate_ready(ready, proof, tier, folder)
        write(FOLDER / (tier + "-ready.json"), ready)
        auth = {"schema": "stringzilla-single-host-attestation-v1", "tier": tier, "fact": proof,
                "fact_binding": binding, "ready": ready}
        line = "STRINGZILLA_SINGLE_HOST_ATTESTATION " + json.dumps(auth, separators=(",", ":")) + "\n"
        console.write(line)
        print(line, end="", flush=True)
        for mode in ("measure", "periodic", "utf16-probe"):
            run_cli(mode, tier, prep, console)
    events = json.loads((FOLDER / (tier + "-authorizations.json")).read_text())
    assert [event["phase"] for event in events] == ["restore", "measure", "periodic", "utf16-probe"]
    result = {"schema": "stringzilla-single-host-tier-v1", **context(), "source": SOURCE, "base": BASE,
              "tier": tier, "complete": True, "triplets": COUNTS[tier], "fact": proof, "fact_binding": binding,
              "ready": ready, "authorizations": events, "console_sha256": sha(folder / "tier-console.log")}
    write(folder / "single-host-binding.json", result)
    shutil.copy2(FOLDER / "lease.json", folder / "single-host-fact.json")
    shutil.copy2(FOLDER / "preparation.zip", folder / "single-host-preparation.zip")
    shutil.copy2(FOLDER / "published-fact.zip", folder / "single-host-fact.zip")
    output("complete", "true")


def retained(tier):
    assert tier in selected_tiers()
    ctx = context()
    artifact = api("actions/artifacts/" + os.environ["RESULT_ARTIFACT_ID"])
    assert artifact["id"] == int(os.environ["RESULT_ARTIFACT_ID"])
    assert artifact["digest"] == canonical_artifact_digest(os.environ["RESULT_ARTIFACT_DIGEST"])
    assert artifact["name"] == "stringzilla-final-results-avx512-" + tier + "-" + ctx["head"] + "-attempt1"
    assert artifact["workflow_run"]["id"] == ctx["run_id"] and artifact["workflow_run"]["head_sha"] == ctx["head"]
    assert not artifact["expired"] and re.fullmatch(r"sha256:[a-f0-9]{64}", artifact["digest"])
    root = Path.cwd()
    folder = root / "perf-output"
    binding = json.loads((folder / "single-host-binding.json").read_text())
    assert binding["tier"] == tier and binding["complete"] is True
    destination = root / "perf-retained" / tier
    destination.parent.mkdir(exist_ok=True)
    assert not destination.exists()
    folder.rename(destination)
    write(FOLDER / (tier + "-retained.json"), {"artifact_id": artifact["id"],
          "artifact_digest": artifact["digest"], "binding_sha256": sha(destination / "single-host-binding.json")})
    for name in ("perf-images", "perf-image-archives"):
        path = root / name
        assert path.is_dir() and not path.is_symlink()
        shutil.rmtree(path)



def verify_tier_artifact(bundle, tier, job):
    ctx = context()
    assert tier in selected_tiers() and job["status"] == "completed"
    record = json.loads(bundle.read("single-host-binding.json"))
    assert record["schema"] == "stringzilla-single-host-tier-v1"
    assert record["run_id"] == ctx["run_id"] and record["head"] == ctx["head"] and record["attempt"] == 1
    assert record["source"] == SOURCE and record["base"] == BASE and record["tier"] == tier
    assert record["complete"] is True and record["triplets"] == COUNTS[tier]
    assert raw_sha(bundle.read("tier-console.log")) == record["console_sha256"]
    assert len(bundle.namelist()) == len(set(bundle.namelist())), "Duplicate ZIP entry"
    proof, binding = record["fact"], record["fact_binding"]
    verify_fact(proof, job, ctx)
    assert proof["available"] is True
    assert bundle.read("single-host-fact.json") == json.dumps(proof, indent=2).encode() + b"\n"
    for name in ("Measure missing SKY " + tier + " controls", "Retain completed SKY " + tier + " raw results"):
        steps = [step for step in job["steps"] if step["name"] == name]
        assert len(steps) == 1 and steps[0]["status"] == "completed" and steps[0]["conclusion"] == "success"
    artifact = api("actions/artifacts/" + str(binding["artifact_id"]))
    assert artifact["id"] == binding["artifact_id"] and artifact["digest"] == binding["artifact_digest"] and artifact["expired"] is False
    assert artifact["name"] == "stringzilla-single-sky-fact-" + ctx["head"]
    assert artifact["workflow_run"]["id"] == ctx["run_id"] and artifact["workflow_run"]["head_sha"] == ctx["head"]
    fact_zip = bundle.read("single-host-fact.zip")
    assert "sha256:" + raw_sha(fact_zip) == binding["artifact_digest"]
    import io
    with zipfile.ZipFile(io.BytesIO(fact_zip)) as archive:
        assert archive.namelist() == ["lease.json"]
        raw = archive.read("lease.json")
    assert raw_sha(raw) == binding["proof_sha256"] and json.loads(raw) == proof
    prep_artifact = api("actions/artifacts/" + str(proof["preparation"]["artifact_id"]))
    assert prep_artifact["id"] == proof["preparation"]["artifact_id"]
    assert prep_artifact["digest"] == proof["preparation"]["artifact_digest"] and not prep_artifact["expired"]
    assert prep_artifact["name"] == "stringzilla-single-sky-preparation-" + ctx["head"]
    assert prep_artifact["workflow_run"]["id"] == ctx["run_id"] and prep_artifact["workflow_run"]["head_sha"] == ctx["head"]
    prep_zip = bundle.read("single-host-preparation.zip")
    assert "sha256:" + raw_sha(prep_zip) == proof["preparation"]["artifact_digest"]
    with zipfile.ZipFile(io.BytesIO(prep_zip)) as archive:
        assert archive.namelist().count("preparation.json") == 1
        raw = archive.read("preparation.json")
    assert raw_sha(raw) == proof["preparation"]["proof_sha256"] and json.loads(raw) == proof["inputs"]
    inputs = proof["inputs"]
    verify_inputs(inputs, ctx)
    assert inputs["driver_sha256"] == sha(HERE / "stringzilla-final.py")
    validate_ready_data(record["ready"], proof, tier, bundle.read)
    events = record["authorizations"]
    assert [event["phase"] for event in events] == ["restore", "measure", "periodic", "utf16-probe"]
    for event in events:
        assert event["tier"] == tier and event["job_id"] == proof["job_id"] and event["runner_id"] == proof["runner_id"]
        assert event["nonce"] == proof["nonce"] and event["cpu"] == proof["cpu"] and event["fact"] == binding
    return record


if __name__ == "__main__":
    mode = sys.argv[1]
    if mode == "prepare":
        prepare()
    elif mode == "probe":
        probe()
    elif mode == "run-tier":
        assert len(sys.argv) == 3
        try:
            run_tier(sys.argv[2])
        except BaseException:
            # Preserve infrastructure and partially timed failures without calling them unsupported.
            folder = Path("perf-output")
            if folder.is_dir():
                (folder / "worker-failure.txt").write_text(traceback.format_exc())
                write(folder / "worker-failure.json", {"schema": "stringzilla-single-host-failure-v1",
                    **context(), "source": SOURCE, "tier": sys.argv[2],
                    "kind": "infrastructure-or-partial", "automatic_retry": False,
                    "has_experiment_log": (folder / "experiment.log").exists()})
            raise
    elif mode == "retained":
        assert len(sys.argv) == 3
        retained(sys.argv[2])
    else:
        raise AssertionError("Unknown single-host operation")
