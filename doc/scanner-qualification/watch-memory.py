#!/usr/bin/env python3
"""Source-prepared Stage A RSS observer; uses only installed Python/procfs."""
import csv
import os
from pathlib import Path
import signal
import sys
import time

LIMIT_KIB = 12 * 1024 * 1024
INTERVAL_SECONDS = 1.0
SAMPLE_DEADLINE_SECONDS = 5


def process(pid):
    # Fields after the final ')' start with field3 (state); RSS is field24.
    fields = Path(f"/proc/{pid}/stat").read_bytes().rsplit(b")", 1)[1].split()
    return (int(fields[1]), int(fields[2]), int(fields[19]),
            int(fields[21]) * os.sysconf("SC_PAGE_SIZE") // 1024)


def snapshot():
    result = {}
    for entry in Path("/proc").iterdir():
        if not entry.name.isdecimal():
            continue
        try:
            result[int(entry.name)] = process(int(entry.name))
        except (FileNotFoundError, ProcessLookupError):
            pass  # A process exited during the sample; other observation errors abort.
    return result


def main():
    owner = int(sys.argv[1])
    output = Path(sys.argv[2])
    owner_initial = process(owner)
    outer = owner_initial[0]
    outer_initial = process(outer)
    last_sample = None

    def notify_owner():
        # The observer is a direct child; this avoids blocking procfs reads or PID-reuse signals.
        if os.getppid() == owner:
            try:
                os.kill(owner, signal.SIGUSR1)
            except ProcessLookupError:
                pass

    def record_timeout(*_):
        notify_owner()
        raise TimeoutError("RSS fault recording exceeded 5s")

    def fault(reason):
        try:
            signal.signal(signal.SIGALRM, record_timeout)
            signal.alarm(SAMPLE_DEADLINE_SECONDS)
            try:
                with (output / "resource-stop.txt").open("a") as report:
                    report.write(f"INCOMPLETE: {reason}; owner_pid={owner}; limit_kib={LIMIT_KIB}\n")
                    report.flush()
            except Exception:
                pass  # Recording failure must not suppress termination.
        finally:
            try:
                signal.alarm(0)
                signal.signal(signal.SIGALRM, sample_timeout)
            finally:
                notify_owner()
        return 125

    # Graceful controller cleanup closes the two CSV files without raising a fault.
    def terminate(*_):
        signal.alarm(0)
        if last_sample is None or time.monotonic() - last_sample > SAMPLE_DEADLINE_SECONDS:
            sys.exit(fault("RSS observation was stale at controller cleanup"))
        sys.exit(0)

    def sample_timeout(*_):
        # Notify before raising: unwinding a stalled CSV writer may itself block.
        notify_owner()
        raise TimeoutError("RSS sample exceeded 5s")

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
                (output / "memory-members.csv").open("x", newline="") as members:
            total_writer = csv.writer(totals)
            member_writer = csv.writer(members)
            total_writer.writerow(["monotonic_ns", "rss_kib", "observed_peak_kib", "processes", "active_pgid"])
            member_writer.writerow(["monotonic_ns", "pid", "ppid", "pgid", "rss_kib"])
            peak = 0
            previous = None
            ready = False
            while True:
                started = time.monotonic()
                if previous is not None and started - previous > SAMPLE_DEADLINE_SECONDS:
                    raise TimeoutError("RSS sample gap exceeded 5s")
                previous = started
                signal.alarm(SAMPLE_DEADLINE_SECONDS)
                stamp = time.monotonic_ns()
                active = int((output / "active-pgid").read_text())
                processes = snapshot()
                if owner not in processes or processes[owner][2] != owner_initial[2]:
                    return fault("controller disappeared or changed identity")
                selected = {owner}
                changed = True
                while changed:
                    before = len(selected)
                    selected.update(pid for pid, (parent, group, _, _) in processes.items()
                                    if parent in selected or (active > 0 and group == active))
                    changed = len(selected) != before
                # Include the outer timeout's RSS without selecting unrelated siblings.
                if outer in processes and processes[outer][2] == outer_initial[2]:
                    selected.add(outer)
                rss = 0
                for pid in sorted(selected):
                    parent, group, _, resident = processes[pid]
                    if resident < 0:
                        raise ValueError(f"negative RSS for pid {pid}")
                    rss += resident
                    member_writer.writerow([stamp, pid, parent, group, resident])
                peak = max(peak, rss)
                total_writer.writerow([stamp, rss, peak, len(selected), active])
                members.flush()
                totals.flush()
                if not ready:
                    (output / "memory-ready").touch()
                    ready = True
                last_sample = time.monotonic()
                signal.alarm(0)
                if rss >= LIMIT_KIB:
                    return fault(f"sampled campaign RSS {rss}KiB reached stop limit; active_pgid={active}")
                time.sleep(max(0, INTERVAL_SECONDS - (time.monotonic() - started)))
    except Exception as error:
        return fault(f"RSS observation failed: {type(error).__name__}: {error}")


if __name__ == "__main__":
    sys.exit(main())
