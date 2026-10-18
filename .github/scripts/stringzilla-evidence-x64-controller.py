#!/usr/bin/env python3
"""Move only unfinished saved-artifact exports off ARM; never run a JVM."""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import time

REPO = "repos/re-thc/openjdk-jdk27u/"
TARGETS = (
    (39162042953, "0be89f6c1611cbdb32b67fab7a57050773144778",
     "codex/stringzilla-candidate-evidence", "Export exact saved StringZilla evidence",
     "stringzilla-candidate-evidence-"),
    (39163833765, "325e65425cf374d4a802e88a6c765c829f53dcfb",
     "codex/stringzilla-candidate-recovery-evidence", "Export only saved recovered SKY controls",
     "stringzilla-candidate-recovery-evidence-"),
)
RECOVERY = {"pilot-avx512-interpreter", "pilot-avx512-c2", "supplement-avx512-c2"}

def api(path):
    return json.loads(subprocess.check_output(["gh", "api", REPO + path], text=True))

def run_and_jobs(target):
    run_id, head, branch, name, _ = target
    run = api(f"actions/runs/{run_id}")
    assert (run["id"], run["head_sha"], run["head_branch"], run["name"], run["run_attempt"]) == (
        run_id, head, branch, name, 1)
    assert run["path"] == ".github/workflows/stringzilla-evidence-reader.yml"
    jobs = api(f"actions/runs/{run_id}/jobs?filter=all&per_page=100")
    assert jobs["total_count"] == len(jobs["jobs"]) and len(jobs["jobs"]) <= 100
    allowed = {"bindings"} | {"Export saved " + case["id"] for case in CASES}
    for job in jobs["jobs"]:
        assert job["run_id"] == run_id and job["head_sha"] == head and job["run_attempt"] == 1
        assert job["name"] in allowed
    return run, jobs["jobs"]

def compact(job):
    fields = ("id", "run_id", "head_sha", "name", "run_attempt", "status", "conclusion")
    return {field: job[field] for field in fields}

root = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("saved_reader", root / "stringzilla-evidence-reader.py")
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)
CASES, keys, counts = reader.pins()
assert len(CASES) == 26 and len(keys) == 626
groups = {}
for index, case in enumerate(CASES):
    groups.setdefault(case["artifact"]["artifact_id"], []).append(index)
groups = list(groups.values())
assert len(groups) == 24
group_by_first = {CASES[indices[0]]["id"]: indices for indices in groups}
before = [(target, *run_and_jobs(target)) for target in TARGETS]
for target, _, jobs in before:
    if target[0] == 39163833765:
        assert all(job["name"] == "bindings" or job["name"] == "Export saved pilot-avx512-interpreter" for job in jobs)
for target, run, _ in before:
    if run["status"] != "completed":
        assert run["status"] in ("queued", "in_progress", "waiting", "pending")
        subprocess.run(["gh", "api", "--method", "POST", REPO + f"actions/runs/{target[0]}/cancel", "--silent"], check=True)
for _ in range(12):
    after = [(target, *run_and_jobs(target)) for target in TARGETS]
    if all(run["status"] == "completed" for _, run, _ in after):
        break
    time.sleep(5)
else:
    raise AssertionError("Old read-only readers did not stop; schedule nothing")

completed = {}
snapshots = []
for target, run, jobs in after:
    run_id, head, _, _, artifact_prefix = target
    artifacts = api(f"actions/runs/{run_id}/artifacts?per_page=100")
    assert artifacts["total_count"] == len(artifacts["artifacts"])
    snapshots.append({"run_id": run_id, "head": head, "status": run["status"],
                      "conclusion": run["conclusion"], "jobs": [compact(job) for job in jobs]})
    for job in jobs:
        if job["status"] != "completed" or job["conclusion"] != "success" or job["name"] == "bindings":
            continue
        first = job["name"].removeprefix("Export saved ")
        assert first in group_by_first
        members = [CASES[i]["id"] for i in group_by_first[first]]
        if run_id == 39163833765:
            assert set(members) == RECOVERY
        expected_name = artifact_prefix + first + "-" + head
        matching = [item for item in artifacts["artifacts"] if item["name"] == expected_name]
        assert len(matching) == 1 and not matching[0]["expired"]
        artifact = matching[0]
        assert artifact["workflow_run"]["id"] == run_id and artifact["workflow_run"]["head_sha"] == head
        assert artifact["digest"].startswith("sha256:")
        assert first not in completed
        completed[first] = {"members": members, "job": compact(job), "artifact_id": artifact["id"],
                            "artifact_digest": artifact["digest"], "workflow_head": head, "run_id": run_id}

remaining = [{"index": index, "id": CASES[indices[0]]["id"]} for index, indices in enumerate(groups)
             if CASES[indices[0]]["id"] not in completed]
assert len(remaining) + len(completed) == 24
remaining_ids = {item["id"] for item in remaining}
assert not remaining_ids.intersection(completed)
assert remaining
receipt = {"schema": 1, "source": reader.SOURCE, "baseline": reader.BASE,
           "new_timing_executions": 0, "cancelled_or_completed_readers": snapshots,
           "preserved_completed_exports": completed, "remaining_archive_groups": remaining,
           "total_original_triplets": len(keys), "original_reader_sha256":
           hashlib.sha256((root / "stringzilla-evidence-reader.py").read_bytes()).hexdigest()}
Path("evidence-migration").mkdir()
Path("evidence-migration/receipt.json").write_text(json.dumps(receipt, sort_keys=True) + "\n")
with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
    stream.write("matrix=" + json.dumps({"include": remaining}, sort_keys=True) + "\n")
print("STRINGZILLA_EVIDENCE_MIGRATION " + json.dumps(receipt, sort_keys=True), flush=True)
