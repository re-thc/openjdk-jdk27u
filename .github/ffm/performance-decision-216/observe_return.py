"""Observe the one collector's actual return and final child-cleanup evidence.

Inert on import. This is terminal bookkeeping under the existing execution
grant, not a new approval, retry, workload or JVM fork.
"""

import json
import os
import subprocess
import sys
import time
from pathlib import Path

from budget import final_budget_observation
from decision import require


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
    process = subprocess.Popen(command, cwd=root)
    returncode = process.wait()
    returned = time.monotonic_ns()  # after final collector writes/printing and actual wait
    out = root / "run"
    status = "STOPPED_EXECUTION_FAILURE"
    cleanup_complete, cleanup_error = False, None
    try:
        status = json.loads((out / "status.json").read_text())["status"]
        cleanup_complete = cleanup_observation(out)
    except Exception as failure:
        cleanup_error = type(failure).__name__ + ": " + str(failure)
    observed = time.monotonic_ns()  # after the final owned-child cleanup observation
    verdict = final_budget_observation(attempt_budget, status, returncode,
                                      returned, observed, cleanup_complete)
    verdict.update(collector_pid=process.pid, collector_command=command,
                   observer_pid=os.getpid(), boot_id=attempt_budget["boot_id"])
    if cleanup_error:
        verdict["cleanup_observation_error"] = cleanup_error
    with receipt.open("x") as stream:
        json.dump(verdict, stream, indent=2)
        stream.write("\n")
    print(json.dumps(verdict))


if __name__ == "__main__":
    main()
