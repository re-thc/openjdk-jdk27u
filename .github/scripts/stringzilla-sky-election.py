#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Choose MIN eligible slot only after all four immutable, verified facts exist."""
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import time
import uuid
import zipfile

REPO = "re-thc/openjdk-jdk27u"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
TREES = {"fork": "9469745b97faacbfbc6c2a33279131eb4385ad3e",
         "original": "dd8fc9c14c376d51876fbe312f419cb1d2c086d1"}
IMAGE = "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
SLOTS = {"0": "ubuntu-22.04", "1": "ubuntu-24.04", "2": "ubuntu-26.04", "3": "ubuntu-26.04"}
PUBLISH = "Publish this slot's immutable eligibility fact"
FOLDER = Path(os.environ["RUNNER_TEMP"]) / "stringzilla-sky-election"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/" + REPO + "/" + path], text=True, timeout=30))


def context():
    assert os.environ["GITHUB_REPOSITORY"] == REPO
    return {"run_id": int(os.environ["GITHUB_RUN_ID"]), "head": os.environ["GITHUB_SHA"],
            "attempt": int(os.environ["GITHUB_RUN_ATTEMPT"])}


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def output(key, value):
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write(key + "=" + str(value) + "\n")


def name(slot):
    return "Missing SKY slot " + slot + " on " + SLOTS[slot]


def fact_name(ctx, slot):
    return "stringzilla-sky-fact-" + str(ctx["run_id"]) + "-" + slot + "-attempt1"


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


def live_jobs(ctx):
    payload = api("actions/runs/" + str(ctx["run_id"]) + "/jobs?per_page=100&filter=all")
    assert payload["total_count"] <= 100, "Unexpected job pagination"
    jobs = payload["jobs"]
    result = {}
    for slot in SLOTS:
        found = [job for job in jobs if job["name"] == name(slot) and job["run_attempt"] == 1]
        assert len(found) == 1
        job = found[0]
        assert job["run_id"] == ctx["run_id"] and job["head_sha"] == ctx["head"]
        result[slot] = job
    assert len({job["id"] for job in result.values()}) == 4
    return result


def probe():
    ctx = context()
    assert ctx["attempt"] == 1, "No timed automatic retries"
    slot = os.environ["SKY_SLOT"]
    assert slot in SLOTS and os.environ["SKY_HOST_LABEL"] == SLOTS[slot]
    assert os.environ["SKY_WORKER_NAME"] == name(slot)
    job = live_jobs(ctx)[slot]
    assert job["status"] == "in_progress" and SLOTS[slot] in job["labels"]
    assert job["runner_name"] == os.environ["RUNNER_NAME"]
    trees = {key: api("git/commits/" + rev)["tree"]["sha"]
             for key, rev in (("original", BASE), ("fork", SOURCE))}
    assert trees == TREES
    proof = {**ctx, "schema": "stringzilla-sky-allfour-fact-v1", "source": SOURCE, "base": BASE,
             "source_trees": trees, "backend": "avx512", "slot": slot,
             "host_runner_label": SLOTS[slot], "nonce": uuid.uuid4().hex, "job": job,
             "runner_name": os.environ["RUNNER_NAME"],
             "algorithm_sha256": sha(Path(__file__)), **host(), "timed_records": 0, "images_restored": False}
    FOLDER.mkdir()
    write(FOLDER / "eligibility.json", proof)
    output("folder", FOLDER)
    output("cpu_model", proof["fields"]["model name"])
    output("available", str(proof["available"]).lower())
    print("STRINGZILLA_SKY_FACT " + json.dumps(proof, separators=(",", ":")), flush=True)


def verify_fact(proof, slot, job, ctx):
    assert proof["schema"] == "stringzilla-sky-allfour-fact-v1"
    assert proof["run_id"] == ctx["run_id"] and proof["head"] == ctx["head"] and proof["attempt"] == 1
    assert proof["source"] == SOURCE and proof["base"] == BASE and proof["source_trees"] == TREES
    assert proof["backend"] == "avx512" and proof["slot"] == slot and proof["host_runner_label"] == SLOTS[slot]
    assert proof["container_image"] == IMAGE and proof["native_execution"] is True
    assert proof["algorithm_sha256"] == sha(Path(__file__))
    assert re.fullmatch(r"[0-9a-f]{32}", proof["nonce"])
    assert proof["timed_records"] == 0 and proof["images_restored"] is False
    assert proof["job"]["id"] == job["id"] and proof["job"]["name"] == job["name"] == name(slot)
    assert proof["job"]["runner_id"] == job["runner_id"] and job["runner_id"] > 0
    assert proof["runner_name"] == proof["job"]["runner_name"] == job["runner_name"]
    assert proof["job"]["run_id"] == job["run_id"] == ctx["run_id"]
    assert proof["job"]["head_sha"] == job["head_sha"] == ctx["head"]
    assert proof["job"]["run_attempt"] == job["run_attempt"] == 1 and SLOTS[slot] in job["labels"]
    available, missing = derive(proof["fields"], proof["machine"])
    assert type(proof["available"]) is bool and proof["available"] == available and proof["missing"] == missing
    for key in ("os_release_sha256", "libc_sha256"):
        assert re.fullmatch(r"[0-9a-f]{64}", proof[key])


def download(artifact, destination, ctx):
    assert artifact["workflow_run"]["id"] == ctx["run_id"] and artifact["workflow_run"]["head_sha"] == ctx["head"]
    assert not artifact["expired"] and re.fullmatch(r"sha256:[0-9a-f]{64}", artifact["digest"])
    with destination.open("wb") as stream:
        subprocess.run(["gh", "api", "repos/" + REPO + "/actions/artifacts/" +
                        str(artifact["id"]) + "/zip"], stdout=stream, check=True, timeout=60)
    assert "sha256:" + sha(destination) == artifact["digest"]


def collect_facts(folder, wait=False):
    ctx = context()
    assert ctx["attempt"] == 1
    deadline = time.monotonic() + (1800 if wait else 0)
    while True:
        jobs = live_jobs(ctx)
        payload = api("actions/runs/" + str(ctx["run_id"]) + "/artifacts?per_page=100")
        assert payload["total_count"] <= 100, "Unexpected artifact pagination"
        artifacts = payload["artifacts"]
        found, ready = {}, True
        for slot in SLOTS:
            matches = [item for item in artifacts if item["name"] == fact_name(ctx, slot) and not item["expired"]]
            assert len(matches) <= 1, "Duplicate slot fact: never choose a subset"
            publish = [step for step in jobs[slot]["steps"] if step["name"] == PUBLISH]
            assert len(publish) <= 1
            if publish and publish[0]["status"] == "completed":
                assert publish[0]["conclusion"] == "success", "Failed fact publication: no replacement"
            if len(matches) != 1 or not publish or publish[0]["conclusion"] != "success":
                if jobs[slot]["status"] == "completed":
                    raise AssertionError("Terminal worker has no successfully published fact")
                ready = False
            else:
                found[slot] = matches[0]
        if ready:
            assert not wait or time.monotonic() <= deadline, "Fact set arrived after the election deadline"
            break
        assert wait and time.monotonic() < deadline, "Missing facts/publish completion after 30 minutes: no election"
        time.sleep(30)
    assert set(found) == set(SLOTS)
    proofs, bindings = {}, {}
    for slot in SLOTS:
        archive = folder / ("fact-" + slot + ".zip")
        if archive.exists():
            assert "sha256:" + sha(archive) == found[slot]["digest"]
        else:
            download(found[slot], archive, ctx)
        with zipfile.ZipFile(archive) as bundle:
            assert bundle.namelist() == ["eligibility.json"]
            raw = bundle.read("eligibility.json")
        proof = json.loads(raw)
        verify_fact(proof, slot, jobs[slot], ctx)
        write(folder / ("fact-" + slot + ".json"), proof)
        proofs[slot] = proof
        bindings[slot] = {"artifact_id": found[slot]["id"], "artifact_digest": found[slot]["digest"],
            "proof_sha256": hashlib.sha256(raw).hexdigest(), "nonce": proof["nonce"],
            "job_id": jobs[slot]["id"], "job_name": name(slot), "runner_id": jobs[slot]["runner_id"],
            "host_runner_label": SLOTS[slot], "available": proof["available"]}
    assert len({proof["nonce"] for proof in proofs.values()}) == 4
    eligible = [slot for slot in SLOTS if proofs[slot]["available"]]
    assert eligible, "All four workers unsupported: zero timings"
    selected = min(eligible, key=int)
    chosen = jobs[selected]
    assert chosen["status"] == "in_progress" or (
        chosen["status"] == "completed" and chosen["conclusion"] == "success"), "Selected worker failed: no replacement"
    selection = {**ctx, "schema": "stringzilla-sky-allfour-selection-v1", "source": SOURCE, "base": BASE,
        "algorithm_sha256": sha(Path(__file__)), "facts": bindings,
        "selected_slot": selected, "selected_job_id": chosen["id"], "selected_job_name": name(selected)}
    return selection, proofs, jobs


def verify_current(proof):
    assert proof["runner_name"] == os.environ["RUNNER_NAME"]
    current = host()
    assert current["available"] is True and current["cpu"] == proof["cpu"]
    for key in ("vendor_id", "cpu family", "model", "model name"):
        assert current["fields"].get(key) == proof["fields"].get(key)
    assert set(current["fields"]["flags"].split()) == set(proof["fields"]["flags"].split())
    assert current["container_image"] == proof["container_image"]
    assert current["os_release_sha256"] == proof["os_release_sha256"]
    assert current["libc_sha256"] == proof["libc_sha256"]


def select():
    own = json.loads((FOLDER / "eligibility.json").read_text())
    slot = os.environ["SKY_SLOT"]
    selection, proofs, jobs = collect_facts(FOLDER, wait=True)
    assert own == proofs[slot], "Own published fields differ"
    assert sha(FOLDER / "eligibility.json") == selection["facts"][slot]["proof_sha256"], "Own published bytes differ"
    assert int(os.environ["FACT_ARTIFACT_ID"]) == selection["facts"][slot]["artifact_id"]
    digest = os.environ["FACT_ARTIFACT_DIGEST"].removeprefix("sha256:")
    assert "sha256:" + digest == selection["facts"][slot]["artifact_digest"]
    write(FOLDER / "selection.json", selection)
    winner = slot == selection["selected_slot"]
    if winner:
        assert jobs[slot]["status"] == "in_progress"
        verify_current(own)
    output("selected", str(winner).lower())
    output("selected_slot", selection["selected_slot"])
    output("selected_cpu", proofs[selection["selected_slot"]]["fields"]["model name"])
    print("STRINGZILLA_SKY_ALLFOUR_SELECTION " + json.dumps(selection, separators=(",", ":")), flush=True)


def verify_saved(folder, completed=False):
    saved = json.loads((folder / "selection.json").read_text())
    selection, proofs, jobs = collect_facts(folder)
    assert selection == saved, "The complete immutable fact map or selected worker changed"
    slot = selection["selected_slot"]
    assert sha(folder / "eligibility.json") == selection["facts"][slot]["proof_sha256"]
    job = jobs[slot]
    if completed:
        for candidate in SLOTS:
            assert jobs[candidate]["status"] == "completed"
            measured = [step for step in jobs[candidate]["steps"] if step["name"] ==
                "Measure only six ABC triplets then missing interpreter and C1 projections"]
            assert len(measured) == 1
            assert measured[0]["conclusion"] == ("success" if candidate == slot else "skipped")
        assert job["conclusion"] == "success"
    else:
        assert slot == os.environ["SKY_SLOT"] and job["status"] == "in_progress"
        verify_current(proofs[slot])
    return {"facts": selection["facts"], "algorithm_sha256": selection["algorithm_sha256"],
        "selected_slot": slot, "job_id": job["id"], "job_name": job["name"], "runner_id": job["runner_id"],
        "host_runner_label": SLOTS[slot], "slot": slot}


if __name__ == "__main__":
    import sys
    {"probe": probe, "select": select}[sys.argv[1]]()
