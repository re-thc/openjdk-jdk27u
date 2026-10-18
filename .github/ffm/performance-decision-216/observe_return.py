"""Observe the one collector's actual return and final child-cleanup evidence.

Inert on import. This is terminal bookkeeping under the existing execution
grant, not a new approval, retry, workload or JVM fork.
"""

import json
import os
import sys
import time
from pathlib import Path

from budget import campaign_deadline, collector_supervision_deadline, final_budget_observation
from collector_supervisor import supervise
from decision import require


FINAL_COLLECTOR_STATUSES = {
    "STOPPED_CONTROL_FAILURE", "HELD_CANDIDATE_SLOWDOWN", "INCONCLUSIVE_REVIEW_REQUIRED",
    "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED", "STOPPED_INVALID_FORK",
    "STOPPED_EXECUTION_FAILURE", "STOPPED_CAMPAIGN_DEADLINE", "HELD_INPUT_MUTATION",
    "STOPPED_OVERALL_BUDGET",
}


def campaign_endpoint(root, attempt_budget, pid, now=None):
    path = root / "run/campaign-budget.json"
    if not path.exists():
        require(now is None or now < attempt_budget["preparation_deadline_ns"],
                "preparation deadline reached without an actual campaign clock")
        return None
    record = json.loads(path.read_text())
    require(record.get("collector_pid") == pid, "campaign clock belongs to another collector")
    endpoint = collector_supervision_deadline(attempt_budget, record.get("start_monotonic_ns"))
    require(record.get("campaign_deadline_ns") == endpoint - 300_000_000_000,
            "campaign clock differs from existing fixed window")
    return endpoint


def cleanup_observation(out):
    """Require complete launch/terminal evidence that every owned child was reaped."""
    intents = {p.stem.removesuffix(".intent") for p in out.glob("fork-*.intent.json")}
    launches = {p.stem.removesuffix(".launch") for p in out.glob("fork-*.launch.json")}
    terminals = {p.stem.removesuffix(".receipt") for p in out.glob("fork-*.receipt.json")}
    if not intents or intents != launches or launches != terminals:
        return False
    for stem in sorted(launches):
        launch = json.loads((out / (stem + ".launch.json")).read_text())
        terminal = json.loads((out / (stem + ".receipt.json")).read_text())
        pid = launch.get("pid")
        if (type(pid) is not int or pid <= 0 or terminal.get("pid") != pid
                or terminal.get("waited_pid") != pid or terminal.get("cleanup_pending") is True
                or type(terminal.get("returncode")) is not int):
            return False
    return True


def main():
    from inputs import get_budget
    root = Path(__file__).resolve().parent
    require(not (root / "run").exists(), "preserve previous attempt; no retry or resume")
    bindings = json.loads((root / "EXECUTION_BINDINGS.json").read_text())
    attempt_budget = get_budget(root, bindings)
    local = root / "local"
    local.mkdir(exist_ok=True)
    receipt = local / "process-return.json"
    require(not receipt.exists(), "preserve previous terminal observation")
    command = [sys.executable, str(root / "measure_once.py")]
    campaign_deadline(attempt_budget, time.monotonic_ns())  # existing preparation admission
    supervision_deadline = attempt_budget["overall_deadline_ns"]
    intent = dict(observer_pid=os.getpid(), collector_command=command,
                  boot_id=attempt_budget["boot_id"],
                  overall_deadline_ns=attempt_budget["overall_deadline_ns"],
                  supervision_deadline_ns=supervision_deadline)
    with (local / "observer-intent.json").open("x") as stream:
        json.dump(intent, stream, indent=2)
        stream.write("\n")

    def launched(pid):
        with (local / "collector-launch.json").open("x") as stream:
            json.dump(dict(intent, collector_pid=pid, collector_process_group=pid,
                           observer_is_subreaper=True), stream, indent=2)
            stream.write("\n")

    endpoint = None

    def update_deadline(pid):
        nonlocal endpoint
        if endpoint is None:
            endpoint = campaign_endpoint(root, attempt_budget, pid, time.monotonic_ns())
        return endpoint

    supervision = supervise(command, root, supervision_deadline, launched,
                            deadline_update=update_deadline)
    out = root / "run"
    status = "STOPPED_EXECUTION_FAILURE"
    cleanup_complete, cleanup_error = False, None
    measured_endpoint = None
    try:
        status = json.loads((out / "status.json").read_text())["status"]
        require(status in FINAL_COLLECTOR_STATUSES, "missing or unknown final collector status")
        measured_endpoint = campaign_endpoint(root, attempt_budget, supervision["collector_pid"])
        require(measured_endpoint is not None, "missing actual campaign clock")
        cleanup_complete = cleanup_observation(out)
    except Exception as failure:
        cleanup_error = type(failure).__name__ + ": " + str(failure)
    observed = time.monotonic_ns()  # after the final owned-child cleanup observation
    if measured_endpoint is not None and observed > measured_endpoint:
        supervision["supervision_intervened"] = True
        supervision["supervision_reason"] = supervision.get("supervision_reason") or "supervision_deadline_elapsed"
    cleanup_complete = cleanup_complete and supervision["supervisor_cleanup_complete"]
    verdict = final_budget_observation(attempt_budget, status, supervision["process_return_code"],
                                      supervision["process_return_monotonic_ns"], observed,
                                      cleanup_complete, supervision["supervision_intervened"])
    verdict.update(collector_pid=supervision["collector_pid"], collector_command=command,
                   observer_pid=os.getpid(), boot_id=attempt_budget["boot_id"])
    verdict["supervision"] = supervision
    if cleanup_error:
        verdict["cleanup_observation_error"] = cleanup_error
    with receipt.open("x") as stream:
        json.dump(verdict, stream, indent=2)
        stream.write("\n")
    print(json.dumps(verdict))


if __name__ == "__main__":
    main()
