#!/usr/bin/env python3
"""One normal checkout/build/qualification flow; one 95-minute clock. Dry run by default."""
import argparse
import json
import os
from pathlib import Path
import signal
import sys
import time
from build_harness import CODEC
from deadline import Budget
from process_control import Cancelled, CANCEL_SIGNALS, run

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; execution preconditions are required")


def wait_for_gate(path, budget):
    while not path.is_file():
        time.sleep(min(0.1, budget.remaining()))
    budget.remaining()  # graph review never pauses or resets the campaign clock


def campaign(a, budget):
    here, out = Path(__file__).resolve().parent, a.out.resolve()
    state = out / "deadline.json"
    codec = out / "codec"
    artifact = out / "harness/artifact.json"
    corpus = out / "corpus"
    gate = out / "gate.json"
    prefix = ["taskset", "--cpu-list", a.cpus]
    env = {k: v for k, v in os.environ.items() if k not in
           ("_JAVA_OPTIONS", "JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "CLASSPATH", "PYTHONOPTIMIZE")}
    checkout = [["git", "init", str(codec)],
                ["git", "-C", str(codec), "remote", "add", "origin", "https://github.com/re-thc/jzstd.git"],
                ["git", "-C", str(codec), "fetch", "--depth=1", "origin", CODEC],
                ["git", "-C", str(codec), "checkout", "--detach", "FETCH_HEAD"]]
    build = [sys.executable, str(here / "build_harness.py"), "--codec", str(codec),
             "--jdk", str(a.receipts.resolve() / "baseline-release-jdk"), "--deps", str(a.deps.resolve()),
             "--out", str(out / "harness"), "--campaign", str(state), "--audit", str(a.audit.resolve()), "--execute"]
    common = ["--artifact", str(artifact), "--receipts", str(a.receipts.resolve()),
              "--audit", str(a.audit.resolve()), "--repo", str(a.repo.resolve()), "--cpus", a.cpus,
              "--corpus", str(corpus), "--campaign", str(state), "--execute"]
    steps = [("build", build, 600)]
    for stage, cap in (("preflight", 300), ("diagnostics", 1200), ("timing", 3300)):
        command = [sys.executable, str(here / "matrix.py"), stage, *common, "--out", str(out / stage)]
        if stage == "timing":
            command += ["--gate", str(gate)]
        steps.append((stage, command, cap))
    steps.append(("summary", [sys.executable, str(here / "summarize.py"), str(out / "timing"),
                               "--out", str(out / "summary.json"), "--campaign", str(state)], 180))
    if not a.execute:
        return {"checkout": checkout, "steps": [{"name": n, "argv": prefix + c, "cap_seconds": s}
                                                 for n, c, s in steps],
                "review_gate": str(gate), "total_seconds": 5700, "cleanup_inside_total_seconds": 5,
                "review_clock_pauses": False}
    out.mkdir(parents=True, exist_ok=False)
    budget.save(state)
    outcome = {"status": "incomplete", "completed": [], "deadline": budget.state}
    try:
        end_checkout = time.monotonic() + 120
        for i, command in enumerate(checkout):
            run(prefix + command, out / f"checkout-{i}.log",
                budget.remaining(max(0, end_checkout - time.monotonic())), env)
        outcome["completed"].append("checkout")
        for name, command, cap in steps:
            if name == "timing":
                print(f"Review diagnostics and write {gate}; campaign clock remains active", flush=True)
                wait_for_gate(gate, budget)
                outcome["completed"].append("graph-review")
            run(prefix + command, out / f"stage-{name}.log", budget.remaining(cap), env)
            budget.remaining()
            outcome["completed"].append(name)
        outcome["status"] = "complete"
    except BaseException as error:
        outcome["error"] = repr(error)
        raise
    finally:
        outcome["elapsed_seconds"] = time.monotonic() - budget.state["start_monotonic"]
        (out / "outcome.json").write_text(json.dumps(outcome, indent=2) + "\n")
    return outcome


def main():
    started = time.monotonic()  # before checkout, validation, hashing, and all review/analysis
    p = argparse.ArgumentParser(description=__doc__)
    for name in ("repo", "receipts", "audit", "deps", "out"):
        p.add_argument("--" + name, type=Path, required=True)
    p.add_argument("--cpus", required=True)
    p.add_argument("--execute", action="store_true")
    a = p.parse_args()
    budget = Budget.start(started)
    handlers = {}

    def expired(sig, frame):
        raise TimeoutError("whole-campaign work deadline reached; cleanup reserve active")

    def cancelled(sig, frame):
        raise Cancelled(f"campaign cancelled by signal {sig}")

    if a.execute:
        for sig in CANCEL_SIGNALS:
            handlers[sig] = signal.signal(sig, cancelled)
        handlers[signal.SIGALRM] = signal.signal(signal.SIGALRM, expired)
        signal.setitimer(signal.ITIMER_REAL, budget.remaining())
    try:
        print(json.dumps(campaign(a, budget), indent=2))
    finally:
        if a.execute:
            signal.setitimer(signal.ITIMER_REAL, 0)
            for sig, handler in handlers.items():
                signal.signal(sig, handler)


if __name__ == "__main__":
    main()
