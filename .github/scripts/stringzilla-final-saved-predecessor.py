#!/usr/bin/env python3
"""Move only two authenticated read-only exports to an available x64 runner."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time

REPO = "re-thc/openjdk-jdk27u"
PREDECESSORS = ((39190688730, "6cfb4744c892d8195255898a8df64ad66abb73f7"),
                (39192036169, "0ccd1b18496bcbb8f5a6c338a052c821ca18e5d9"))


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/" + REPO + "/" + path], text=True))


def jobs(run_id, head):
    value = api("actions/runs/" + str(run_id) + "/jobs?filter=all&per_page=100")
    assert value["total_count"] <= 100
    names = {"bindings", "Preserve original avx512-c2 JSON files"}
    assert value["jobs"] and all(job["run_id"] == run_id and job["head_sha"] == head and
                                job["run_attempt"] == 1 and job["name"] in names for job in value["jobs"])
    return value["jobs"]


def exported(values):
    return [job for job in values if job["name"] != "bindings" and
            job["status"] == "completed" and job["conclusion"] == "success"]


receipts, completed = [], []
for run_id, head in PREDECESSORS:
    run = api("actions/runs/" + str(run_id))
    assert run["id"] == run_id and run["head_sha"] == head and run["run_attempt"] == 1
    assert run["head_branch"] == "codex/stringzilla-final-saved-files"
    assert run["path"] == ".github/workflows/stringzilla-final-saved-files.yml"
    assert run["name"] == "Preserve exact final StringZilla benchmark files" and run["event"] == "push"
    before = jobs(run_id, head)
    requested = run["status"] != "completed" and not exported(before)
    if requested:
        subprocess.run(["gh", "api", "--method", "POST", "repos/" + REPO + "/actions/runs/" + str(run_id) + "/cancel"], check=True)
    deadline = time.monotonic() + 60
    while True:
        after_run = api("actions/runs/" + str(run_id))
        after = jobs(run_id, head)
        if after_run["status"] == "completed" and all(job["status"] == "completed" for job in after):
            break
        assert time.monotonic() < deadline, "Pinned reader must stop before copying"
        time.sleep(2)
    finished = exported(after)
    logs = []
    if finished:
        completed.extend({"run_id": run_id, "head": head, "job_id": job["id"]} for job in finished)
    else:
        for job in after:
            if job["name"] == "bindings" or not any(step["name"] == "Authenticate and copy existing saved files" and
                                                   step["status"] == "completed" and step["conclusion"] != "skipped"
                                                   for step in job.get("steps", [])):
                continue
            raw = subprocess.check_output(["gh", "api", "repos/" + REPO + "/actions/jobs/" + str(job["id"]) + "/logs"])
            assert not raw.startswith(b"PK"), "Expect the individual job's plain-text log"
            assert not any(marker in raw for marker in (b"STRINGZILLA_EVIDENCE_RECEIPT ", b"STRINGZILLA_EVIDENCE_CHUNK ",
                                                        b"STRINGZILLA_EVIDENCE_COMPLETE ")), "Preserve partial saved-file output"
            logs.append({"job_id": job["id"], "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()})
    receipts.append({"run_id": run_id, "head": head, "status_before": run["status"],
                     "cancel_requested": requested, "status_after": after_run["status"],
                     "conclusion_after": after_run["conclusion"],
                     "jobs": [{key: job[key] for key in ("id", "name", "status", "conclusion")} for job in after],
                     "checked_export_logs": logs})
assert len(completed) <= 1, "Never repeat an already completed export"
receipt = {"schema": 2, "predecessors": receipts, "preserved_completed_exports": completed,
           "copy_needed": not completed, "new_jvm_executions": 0, "new_timing_executions": 0,
           "scope": "Only two saved-file readers; no benchmark, producer or CI runs."}
Path("saved-predecessor.json").write_text(json.dumps(receipt, sort_keys=True) + "\n")
with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
    stream.write("copy_needed=" + str(not completed).lower() + "\n")
print("STRINGZILLA_SAVED_PREDECESSOR " + json.dumps(receipt, sort_keys=True), flush=True)
