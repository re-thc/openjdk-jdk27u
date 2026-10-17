#!/usr/bin/env python3
"""Source-prepared Stage A RSS observer; uses only installed Python/procfs."""
import csv
from contextlib import ExitStack
from dataclasses import asdict
import json
import os
from pathlib import Path
import signal
import sys
import time

from runner_process import (PidfdEvidence, Scope, Uncertain, atomic_json, fresh_sample,
                            publish_sample, read_identity, read_process, report_fault,
                            require_live, snapshot, timeout_fault)

LIMIT_KIB = 12 * 1024 * 1024
INTERVAL_SECONDS = 1.0
SAMPLE_DEADLINE_SECONDS = 5


def main():
    with ExitStack() as cleanup:
        exits = cleanup.enter_context(PidfdEvidence())
        return observe(exits, cleanup)


def observe(exits, cleanup):
    # Readiness setup itself must not block indefinitely before the normal
    # sample/fault handlers and retained owner pidfd have been established.
    def startup_timeout(*_):
        raise TimeoutError("RSS observer startup exceeded 5s")

    signal.signal(signal.SIGALRM, startup_timeout)
    signal.alarm(SAMPLE_DEADLINE_SECONDS)
    owner = read_identity(Path(sys.argv[1]))
    output = Path(sys.argv[2])
    owner_initial = read_process(owner.pid)
    require_live(owner, {owner.pid: owner_initial})
    if os.getppid() != owner.pid:
        raise Uncertain("observer is not a direct child of its recorded controller")
    # Retain a pidfd before work: fault notification performs no procfs/report I/O
    # and cannot accidentally signal a reused numeric owner PID.
    owner_fd = os.pidfd_open(owner.pid, 0)
    cleanup.callback(os.close, owner_fd)
    require_live(owner, snapshot())
    outer_initial = read_process(owner_initial.ppid)
    observer = read_process(os.getpid()).identity
    scope = Scope(owner, exits=exits)
    atomic_json(output / "observer.json", {"identity": asdict(observer), "owner": asdict(owner)})
    last_sample = None

    def notify_owner():
        try:
            signal.pidfd_send_signal(owner_fd, signal.SIGUSR1, None, 0)
        except ProcessLookupError:
            pass

    def record_timeout(*_):
        timeout_fault(notify_owner, "RSS fault recording exceeded 5s")

    def fault(reason):
        def arm():
            signal.signal(signal.SIGALRM, record_timeout)
            signal.alarm(SAMPLE_DEADLINE_SECONDS)

        def record():
            with (output / "resource-stop.txt").open("a") as report:
                report.write(f"INCOMPLETE: {reason}; owner={owner}; limit_kib={LIMIT_KIB}\n")
                report.flush()

        def disarm():
            signal.alarm(0)
            signal.signal(signal.SIGALRM, sample_timeout)

        return report_fault(record, notify_owner, arm, disarm)

    # Graceful controller cleanup closes the two CSV files without raising a fault.
    def terminate(*_):
        signal.alarm(0)
        try:
            fresh_sample(last_sample, time.monotonic(), SAMPLE_DEADLINE_SECONDS)
        except Uncertain:
            sys.exit(fault("RSS observation was stale at controller cleanup"))
        sys.exit(0)

    def sample_timeout(*_):
        # Notify before raising: unwinding a stalled CSV writer may itself block.
        timeout_fault(notify_owner, "RSS sample exceeded 5s")

    signal.signal(signal.SIGUSR2, terminate)
    signal.signal(signal.SIGTERM, lambda *_: sys.exit(fault("unexpected RSS observer SIGTERM")))
    signal.signal(signal.SIGALRM, sample_timeout)
    try:
        allowed = os.sched_getaffinity(0)
        measurement_cpu = int(os.environ["PERF_CPU"])
        if measurement_cpu not in allowed:
            raise ValueError("measurement CPU is outside the allowed CPU set")
        observer_cpu = min(allowed - {measurement_cpu} or allowed)
        os.sched_setaffinity(0, {observer_cpu})
        (output / "memory-placement.txt").write_text(
            f"measurement_cpu={measurement_cpu}\nobserver_cpu={observer_cpu}\n"
            f"colocated={observer_cpu == measurement_cpu}\ninitial_allowed_cpus={sorted(allowed)}\n")
        with (output / "memory.csv").open("x", newline="") as totals, \
                (output / "memory-members.csv").open("x", newline="") as members, \
                (output / "memory-exits.jsonl").open("x") as exit_log:
            total_writer = csv.writer(totals)
            member_writer = csv.writer(members)
            total_writer.writerow(["monotonic_ns", "rss_kib", "observed_peak_kib", "processes", "active_stage"])
            member_writer.writerow(["monotonic_ns", "pid", "birth", "uid", "ppid", "pgid", "sid", "state", "classification", "rss_kib"])
            peak = 0
            previous = None
            logged_exits = set()
            while True:
                started = time.monotonic()
                if previous is not None and started - previous > SAMPLE_DEADLINE_SECONDS:
                    raise TimeoutError("RSS sample gap exceeded 5s")
                previous = started
                signal.alarm(SAMPLE_DEADLINE_SECONDS)
                stamp = time.monotonic_ns()
                active = (output / "active-stage").read_text().strip()
                processes = snapshot()
                require_live(owner, processes)
                states = scope.observe(processes)
                if states[owner.pid] != "live":
                    raise Uncertain("RSS owner has exited")
                selected = {pid for pid, status in states.items() if status != "disappeared"}
                # Stage subreaping keeps escaped/orphan workers in controller
                # ancestry; its retained birth ledger covers later metadata changes.
                # Include the outer timeout without selecting unrelated siblings.
                outer_state = exits.status(outer_initial.identity, processes.get(outer_initial.pid))
                if outer_state != "disappeared":
                    selected.add(outer_initial.pid)
                rss = 0
                for pid in sorted(selected):
                    item = processes[pid]
                    classification = states.get(pid, outer_state)
                    # Exit after the proc read must not erase an observed peak.
                    rss += item.rss
                    member_writer.writerow([stamp, pid, item.birth, item.uid, item.ppid, item.pgid,
                                            item.sid, item.state, classification, item.rss])
                for identity, proof in exits.proofs.items():
                    if identity not in logged_exits:
                        exit_log.write(json.dumps({"monotonic_ns": stamp, **proof}) + "\n")
                        logged_exits.add(identity)
                peak = max(peak, rss)
                total_writer.writerow([stamp, rss, peak, len(selected), active])
                def flush():
                    members.flush()
                    totals.flush()
                    exit_log.flush()

                publish_sample(observer, rss, LIMIT_KIB, time.monotonic(), flush,
                               lambda data: atomic_json(output / "memory-ready", data))
                last_sample = time.monotonic()
                signal.alarm(0)
                time.sleep(max(0, INTERVAL_SECONDS - (time.monotonic() - started)))
    except Exception as error:
        return fault(f"RSS observation failed: {type(error).__name__}: {error}")


if __name__ == "__main__":
    sys.exit(main())
