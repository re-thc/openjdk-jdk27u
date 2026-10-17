"""Individual-child CPU collector draft. No command-line launcher or import side effects.

Uses regular stdout/stderr files and wait4 on exactly one owned PID. No cumulative
RUSAGE_CHILDREN subtraction, background readers or macOS container-client launch.
Actual host admission and frozen image receipts are prerequisites of a future runner.
"""

import json
import os
import platform
import re
import signal
import subprocess
import threading
import time
from pathlib import Path

from accounting_contract import resolve_leaf_candidate, verify_direct_membership
from decision import PLAN, require


def witness_child(pid, cpu, java):
    """Capture actual child provenance; a missing/incoherent view fails closed."""
    require(platform.system() == "Linux" and platform.machine() == "aarch64",
            "collector must run inside native Linux aarch64 VM")
    before = time.monotonic_ns()
    proc = Path("/proc")
    child, own = proc / str(pid), proc / str(os.getpid())
    namespaces = {}
    for name in ["pid", "cgroup", "mnt"]:
        pair = [os.readlink(p / "ns" / name) for p in [own, child]]
        require(pair[0] == pair[1], "collector/child namespace mismatch: " + name)
        namespaces[name] = pair
    require((child / "exe").resolve(strict=True) == Path(java).resolve(strict=True),
            "observed child executable differs")
    tasks = sorted(int(p.name) for p in (child / "task").iterdir())
    require(pid in tasks, "child leader not visible")
    affinities = {str(tid): sorted(os.sched_getaffinity(tid)) for tid in tasks}
    require(all(a == [cpu] for a in affinities.values()), "child TID affinity differs")
    stat = (proc / "stat").read_text()
    require(any(line.startswith(f"cpu{cpu} ") for line in stat.splitlines()),
            "selected CPU missing from visible counters")
    memberships = [(p / "cgroup").read_text() for p in [own, child]]
    require(memberships[0] == memberships[1], "collector/child cgroups differ")
    candidate = resolve_leaf_candidate(memberships[1], (child / "mountinfo").read_text())
    # Do not infer effective quota through hidden ancestors or climb out of a mount.
    require(candidate["mount_root"] == "/", "cgroup ancestor accounting visibility incomplete")
    leaf = Path(candidate["path"])
    procs = (leaf / "cgroup.procs").read_text()
    verified = verify_direct_membership(candidate, pid, procs)
    verify_direct_membership(candidate, os.getpid(), procs)
    counters = {}
    current = leaf
    while True:
        counters[str(current)] = {
            name: ((current / name).read_text() if (current / name).exists() else None)
            for name in ["cpu.max", "cpu.stat", "cpuset.cpus.effective"]}
        if current == Path(candidate["mountpoint"]):
            break
        require(Path(candidate["mountpoint"]) in current.parents, "cgroup path escaped mount")
        current = current.parent
    executable_stat = (child / "exe").stat()
    return dict(pid=pid, collector_pid=os.getpid(), cpu=cpu, executable=str(Path(java).resolve()),
                executable_stat={k: getattr(executable_stat, k)
                                 for k in ["st_dev", "st_ino", "st_size", "st_mtime_ns"]},
                namespaces=namespaces, tid_affinities=affinities, cgroup=verified,
                cgroup_ancestor_counters=counters, proc_stat=stat,
                clock_ticks_per_second=os.sysconf("SC_CLK_TCK"),
                monotonic_start_ns=before, monotonic_end_ns=time.monotonic_ns(), verified=True)


def witness_for_inputs(host_state, executable_stats, witness=witness_child):
    """Bind each observed child to admitted limits and precollection executable identity."""
    def checked(pid, cpu, java):
        evidence = witness(pid, cpu, java)
        limits = {directory: {key: (value[key].strip() if value[key] is not None else None)
                              for key in ["cpu.max", "cpuset.cpus.effective"]}
                  for directory, value in evidence["cgroup_ancestor_counters"].items()}
        require(limits == host_state["cgroup_limits"], "admitted cgroup limits changed")
        require(evidence["executable_stat"] == executable_stats[java],
                "observed executable identity changed")
        return evidence
    return checked


def collect_child(argv, cpu, deadline_ns, stdout_path, stderr_path,
                  witness=witness_child, clock=time.monotonic_ns, diagnostic_output=False):
    """Run one already-authorized child; preserve output and bound cleanup polling.

    This helper does not authorize campaigns or admit hosts. Its caller must validate
    frozen inputs and the one-shot execution gate before invoking it. Tests mock all
    process creation and host access; offline validation is not actual host admission.
    """
    require(platform.system() == "Linux", "wait4 collector requires Linux")
    require(threading.active_count() == 1, "pre-exec affinity requires single-threaded collector")
    require(type(cpu) is int and cpu >= 0 and cpu in os.sched_getaffinity(0), "frozen CPU unavailable")
    require(type(argv) is list and argv and all(type(x) is str for x in argv), "invalid argv")
    require(type(deadline_ns) is int and deadline_ns > clock(), "campaign deadline reached")
    start = clock()
    fork_deadline = min(deadline_ns, start + PLAN["maximum_fork_seconds"] * 1_000_000_000)
    process, waited, error, usage, status, evidence = None, False, None, None, None, None
    row = dict(command=argv, start_monotonic_ns=start, cpu=cpu,
               cpu_source="wait4-direct-child", diagnostic_output=diagnostic_output)
    # Exclusive creation makes accidental output overwrite a terminal failure.
    with Path(stdout_path).open("xb") as out, Path(stderr_path).open("xb") as err:
        try:
            process = subprocess.Popen(argv, stdout=out, stderr=err, close_fds=True,
                                       preexec_fn=lambda: os.sched_setaffinity(0, {cpu}))
            row["pid"] = process.pid
            Path(stdout_path).with_suffix(".launch.json").write_text(
                json.dumps(dict(pid=process.pid, command=argv, start_monotonic_ns=start)) + "\n")
            evidence = witness(process.pid, cpu, argv[0])
            require(evidence.get("verified") is True, "actual child witness failed")
            while True:
                child, status, usage = os.wait4(process.pid, os.WNOHANG)
                if child:
                    require(child == process.pid, "wait4 PID mismatch")
                    waited = True
                    row["waited_pid"] = child
                    break
                if clock() >= fork_deadline:
                    raise TimeoutError("fork/campaign deadline reached; no retry")
                time.sleep(0.005)
        except BaseException as failure:
            error = type(failure).__name__ + ": " + str(failure)
        finally:
            if process is not None and not waited:
                # PID remains owned/unreaped; it cannot be reused before this wait4.
                try:
                    os.kill(process.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                cleanup_deadline = min(deadline_ns, clock() + 2_000_000_000)
                while True:
                    child, status, usage = os.wait4(process.pid, os.WNOHANG)
                    if child:
                        require(child == process.pid, "cleanup wait4 PID mismatch")
                        row["waited_pid"] = child
                        waited = True
                        break
                    if clock() >= cleanup_deadline:
                        row.update(cleanup_pending=True, unreaped_child_pid=process.pid)
                        error = (error or "child cleanup failed") + "; bounded cleanup incomplete"
                        break
                    time.sleep(0.005)
            end = clock()
            if end > fork_deadline:
                error = error or "fork/campaign deadline reached; no retry"
            if process is not None and waited:
                process.returncode = os.waitstatus_to_exitcode(status)
                row["returncode"] = process.returncode
    row.update(end_monotonic_ns=end, wall_ns=end - start,
               host_witness_verified=bool(evidence and evidence.get("verified") is True),
               host_witness=evidence,
               process_cpu_ns=round((usage.ru_utime + usage.ru_stime) * 1e9) if usage else 0,
               stdout=Path(stdout_path).read_text(errors="replace"),
               stderr=Path(stderr_path).read_text(errors="replace"))
    if error:
        row["error"] = error
    if process is None or not waited:
        row["returncode"] = -1
    elif row["returncode"]:
        row.setdefault("error", "nonzero child exit; no retry")
    if "error" not in row:
        try:
            output = row["stdout"].strip()
            if diagnostic_output:
                lines = output.splitlines()
                require(len(lines) == 2 and re.fullmatch(
                    r"DIAGNOSTIC_WARMED uptime_ms=\d+", lines[0]) is not None,
                    "invalid untimed diagnostic marker/output")
                row["diagnostic_warm_uptime_ms"] = int(lines[0].split("=")[1])
                output = lines[1]
            row["metrics"] = json.loads(output)
        except (ValueError, TypeError) as failure:
            row["error"] = "invalid raw JSON: " + str(failure)
    # Preserve a terminal receipt before control returns to the campaign writer.
    Path(stdout_path).with_suffix(".receipt.json").write_text(json.dumps(row) + "\n")
    return row
