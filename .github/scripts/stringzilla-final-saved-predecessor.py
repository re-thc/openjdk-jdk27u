#!/usr/bin/env python3
"""Replace only the pinned obsolete read-only exporter; never a benchmark job."""
import hashlib
import json
from pathlib import Path
import subprocess
import time

REPO = "re-thc/openjdk-jdk27u"
RUN = 39190688730
HEAD = "6cfb4744c892d8195255898a8df64ad66abb73f7"


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/" + REPO + "/" + path], text=True))


def jobs():
    value = api("actions/runs/" + str(RUN) + "/jobs?filter=all&per_page=100")
    assert value["total_count"] <= 100
    names = {"bindings", "Preserve original avx512-c2 JSON files"}
    assert value["jobs"] and all(job["run_id"] == RUN and job["head_sha"] == HEAD and
                                job["run_attempt"] == 1 and job["name"] in names for job in value["jobs"])
    return value["jobs"]


run = api("actions/runs/" + str(RUN))
assert run["id"] == RUN and run["head_sha"] == HEAD and run["run_attempt"] == 1
assert run["head_branch"] == "codex/stringzilla-final-saved-files"
assert run["path"] == ".github/workflows/stringzilla-final-saved-files.yml"
assert run["name"] == "Preserve exact final StringZilla benchmark files" and run["event"] == "push"
before = jobs()
assert not any(job["name"] != "bindings" and job["conclusion"] == "success" for job in before), "Preserve completed exports"
requested = run["status"] != "completed"
if requested:
    subprocess.run(["gh", "api", "--method", "POST", "repos/" + REPO + "/actions/runs/" + str(RUN) + "/cancel"], check=True)
deadline = time.monotonic() + 60
while True:
    after_run = api("actions/runs/" + str(RUN))
    after = jobs()
    if after_run["status"] == "completed" and all(job["status"] == "completed" for job in after):
        break
    assert time.monotonic() < deadline, "Old reader must stop before its replacement copies anything"
    time.sleep(2)
assert not any(job["name"] != "bindings" and job["conclusion"] == "success" for job in after)
logs = []
for job in after:
    if job["name"] == "bindings" or not any(step["name"] == "Authenticate and copy existing saved files" and
                                           step["status"] == "completed" and step["conclusion"] != "skipped"
                                           for step in job.get("steps", [])):
        continue
    raw = subprocess.check_output(["gh", "api", "repos/" + REPO + "/actions/jobs/" + str(job["id"]) + "/logs"])
    assert not any(marker in raw for marker in (b"STRINGZILLA_EVIDENCE_RECEIPT ", b"STRINGZILLA_EVIDENCE_CHUNK ",
                                                b"STRINGZILLA_EVIDENCE_COMPLETE ")), "Preserve any existing saved-file parts"
    logs.append({"job_id": job["id"], "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()})
receipt = {"schema": 1, "run_id": RUN, "head": HEAD, "status_before": run["status"],
           "cancel_requested": requested, "status_after": after_run["status"],
           "conclusion_after": after_run["conclusion"],
           "jobs": [{key: job[key] for key in ("id", "name", "status", "conclusion")} for job in after],
           "checked_export_logs": logs, "completed_saved_file_parts": 0, "new_jvm_executions": 0,
           "new_timing_executions": 0, "scope": "Only the obsolete saved-file reader; all source/runtime/CI jobs excluded."}
Path("saved-predecessor.json").write_text(json.dumps(receipt, sort_keys=True) + "\n")
print("STRINGZILLA_SAVED_PREDECESSOR " + json.dumps(receipt, sort_keys=True), flush=True)
