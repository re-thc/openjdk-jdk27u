"""Prepared one-shot Linux ARM64 supervision validation. NOT AUTHORIZED TO RUN.

Three controlled Python fixtures, no JVM/build/FFM work. The independent outer
owner permits at most five descendant processes and 25 seconds, without retries.
"""

import argparse
import ctypes
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import select
import signal
import subprocess
import sys
import time


MANIFEST = "4d0578a07aca7d7bd10738aa56ae7f76634a83f1792b33cf51b9095674e98abc"
SUPERVISOR = "b2f679ca0c9d9a1bec6366019114d049001c42dfbd95e654c83d3a7dcc349038"
WAIT_FLAGS = os.WEXITED | os.WNOHANG | os.WNOWAIT


def require(condition, message):
    if not condition:
        raise ValueError(message)


def write(path, record):
    with path.open("x") as stream:
        json.dump(record, stream, indent=2)
        stream.write("\n")


def children():
    result = {int(p) for p in Path(f"/proc/self/task/{os.getpid()}/children").read_text().split()}
    try:
        waitable = os.waitid(os.P_ALL, 0, WAIT_FLAGS)
        if waitable is not None:
            result.add(waitable.si_pid)
    except ChildProcessError:
        pass
    return result


def empty():
    try:
        os.waitid(os.P_ALL, 0, WAIT_FLAGS)
    except ChildProcessError:
        return True
    return False


def subreaper():
    libc = ctypes.CDLL(None, use_errno=True)
    libc.prctl.argtypes = [ctypes.c_int] + [ctypes.c_ulong] * 4
    libc.prctl.restype = ctypes.c_int
    if libc.prctl(36, 1, 0, 0, 0) != 0:
        raise OSError(ctypes.get_errno(), "cannot establish independent outer subreaper")


def fixture(mode, out):
    signal.signal(signal.SIGALRM, signal.SIG_DFL)
    signal.alarm(10)  # Fixture self-limit even if both supervisors fail.
    if mode == "normal":
        write(out / "normal.fixture.json", dict(pid=os.getpid(), ppid=os.getppid()))
        return 0
    signal.signal(signal.SIGTERM, signal.SIG_IGN)
    if mode == "hang":
        write(out / "hang.fixture.json", dict(pid=os.getpid(), ppid=os.getppid()))
        while True:
            signal.pause()
    read_fd, write_fd = os.pipe()
    child = os.fork()
    if child == 0:
        os.close(read_fd)
        os.setsid()  # The descendant deliberately leaves the collector's group.
        signal.alarm(10)
        write(out / "orphan.child.json", dict(pid=os.getpid(), ppid=os.getppid(),
                                             pgid=os.getpgrp(), sid=os.getsid(0)))
        os.write(write_fd, b"R")
        os.close(write_fd)
        while True:
            signal.pause()
    os.close(write_fd)
    ready = bool(select.select([read_fd], [], [], 1)[0]) and os.read(read_fd, 1) == b"R"
    os.close(read_fd)
    write(out / "orphan.fixture.json", dict(pid=os.getpid(), child=child, ready=ready))
    return 0 if ready else 2


def worker(kit, out):
    spec = importlib.util.spec_from_file_location("pinned_supervisor", kit / "collector_supervisor.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    results = []
    for mode in ("normal", "hang", "orphan"):
        command = [sys.executable, str(Path(__file__).resolve()), "--fixture", mode, "--out", str(out)]
        deadline = time.monotonic_ns() + 6_000_000_000
        result = module.supervise(command, out, deadline,
                                  lambda pid: write(out / (mode + ".launch.json"), dict(pid=pid)))
        write(out / (mode + ".supervision.json"), result)
        good = result["supervisor_cleanup_complete"] and not result["pending_owned_pids"]
        good = good and result["supervisor_cleanup_observed_monotonic_ns"] <= deadline
        identity = json.loads((out / (mode + ".fixture.json")).read_text())
        good = good and identity["pid"] == result["collector_pid"]
        if mode == "normal":
            good = good and result["process_return_code"] == 0 and not result["supervision_intervened"]
        elif mode == "hang":
            good = good and result["process_return_code"] == -signal.SIGKILL and result["supervision_intervened"]
            good = good and {r["signal"] for r in result["signals"]} == {signal.SIGTERM, signal.SIGKILL}
        else:
            orphan = json.loads((out / "orphan.child.json").read_text())
            good = good and result["process_return_code"] == 0 and result["supervision_intervened"]
            good = good and dict(pid=orphan["pid"], returncode=-signal.SIGKILL) in result["reaped_adopted_children"]
            good = good and orphan["pgid"] == orphan["sid"] == orphan["pid"]
            good = good and orphan["ppid"] == identity["pid"] and identity["child"] == orphan["pid"]
        results.append(dict(case=mode, passed=good))
        if not good:
            break  # No later case, retry or benchmark follows a failed fixture.
    passed = len(results) == 3 and all(r["passed"] for r in results)
    write(out / "cases.json", dict(validation_passed=passed, cases=results, FFM_approval=False))
    return 0 if passed else 1


def outer(kit, out, binding):
    # Every admission check is read-only and occurs before any child launch.
    host = json.loads(binding.read_text())
    boot = Path("/proc/sys/kernel/random/boot_id").read_text().strip()
    require(os.uname().sysname == "Linux" and os.uname().machine == "aarch64", "selected native Linux ARM64 host required")
    require(len(list(Path("/proc/self/task").iterdir())) == 1, "single-threaded outer owner required")
    require(signal.getsignal(signal.SIGCHLD) == signal.SIG_DFL and empty() and not children(), "exclusive child ownership required")
    require(host["boot_id"] == boot and host["machine"] == "aarch64", "actual host binding changed")
    require(host["pid1_comm"] == Path("/proc/1/comm").read_text().strip() != "tail", "retained VM reaper identity required")
    require(host["production_child_inventory_readable"] is True, "missing child inventory")
    require(hashlib.sha256((kit / "SOURCE_FILES.json").read_bytes()).hexdigest() == MANIFEST, "runner manifest changed")
    require(hashlib.sha256((kit / "collector_supervisor.py").read_bytes()).hexdigest() == SUPERVISOR, "supervisor source changed")
    out.mkdir()  # Exclusive one-attempt output. Never overwrite or resume.
    start = time.monotonic_ns()
    deadline = start + 25_000_000_000
    write(out / "intent.json", dict(owner_pid=os.getpid(), boot_id=boot, start_ns=start,
                                   deadline_ns=deadline, max_descendants=5, retries=0))
    subreaper()  # This process only; no namespace/cgroup/PID1 settings change.
    command = [sys.executable, str(Path(__file__).resolve()), "--worker", "--kit", str(kit), "--out", str(out)]
    code, intervention, errors, reaped, signals = None, False, [], [], []
    cleanup_at, owned, sent = deadline, set(), set()
    cancelled = [False]

    def cancel(signum, frame):
        cancelled[0] = True

    def stop(error=None):
        nonlocal intervention, cleanup_at
        if not intervention:
            cleanup_at = min(deadline, time.monotonic_ns() + 4_000_000_000)
        intervention = True
        if error is not None:
            errors.append(type(error).__name__ + ": " + str(error))

    handlers = {sig: signal.getsignal(sig) for sig in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP)}
    for sig in handlers:
        signal.signal(sig, cancel)
    try:
        with (out / "driver.log").open("xb") as log:
            require(not cancelled[0] and time.monotonic_ns() < deadline - 4_000_000_000, "cancelled or no launch reserve")
            process = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            owned = {process.pid}
            try:
                write(out / "driver.launch.json", dict(pid=process.pid, command=command))
            except Exception as failure:
                stop(failure)
            while True:
                try:
                    owned = children()
                except Exception as failure:
                    stop(failure)  # Retain last known PIDs; every signal still proves current ownership.
                now = time.monotonic_ns()
                if cancelled[0] or owned - {process.pid} or now >= deadline - 4_000_000_000:
                    stop()
                if intervention:
                    sig = signal.SIGKILL if now >= cleanup_at - 2_000_000_000 else signal.SIGTERM
                    for pid in sorted(owned):
                        if time.monotonic_ns() >= cleanup_at:
                            break
                        if (pid, sig) not in sent:
                            try:
                                os.waitid(os.P_PID, pid, WAIT_FLAGS)  # Exact unreaped child ownership.
                                os.kill(pid, sig)
                                signals.append(dict(pid=pid, signal=int(sig)))
                                sent.add((pid, sig))
                            except Exception as failure:
                                stop(failure)
                for pid in sorted(owned):
                    try:
                        waited, status = os.waitpid(pid, os.WNOHANG)
                        if waited:
                            rc = os.waitstatus_to_exitcode(status)
                            reaped.append(dict(pid=pid, returncode=rc))
                            sent.discard((pid, signal.SIGTERM))
                            sent.discard((pid, signal.SIGKILL))
                            owned.discard(pid)
                            if pid == process.pid:
                                code = process.returncode = rc
                    except Exception as failure:
                        stop(failure)
                try:
                    if code is not None and empty():
                        break
                except Exception as failure:
                    stop(failure)
                if time.monotonic_ns() >= cleanup_at:
                    break
                try:
                    time.sleep(min(0.02, max(0, (cleanup_at-time.monotonic_ns())/1_000_000_000)))
                except Exception as failure:
                    stop(failure)
    finally:
        for sig, handler in handlers.items():
            signal.signal(sig, handler)
    cleanup, cases = False, {}
    try:
        cleanup = empty()
        owned = children()
        cases = json.loads((out / "cases.json").read_text()) if (out / "cases.json").exists() else {}
    except Exception as failure:
        stop(failure)
    observed = time.monotonic_ns()
    passed = code == 0 and cleanup and not intervention and not errors and observed <= deadline and cases.get("validation_passed") is True
    record = dict(validation_passed=passed, driver_returncode=code, independent_outer_intervened=intervention,
                  owned_children_empty=cleanup, pending_owned_pids=sorted(owned), reaped=reaped,
                  signals=signals, errors=errors, deadline_ns=deadline, observed_ns=observed,
                  FFM_approval=False, timing_forks=0)
    write(out / "outer.json", record)
    print(json.dumps(record))
    return 0 if passed else 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--kit", type=Path)
    parser.add_argument("--host-binding", type=Path)
    parser.add_argument("--worker", action="store_true")
    parser.add_argument("--fixture", choices=["normal", "hang", "orphan"])
    args = parser.parse_args()
    args.out = args.out.resolve()
    if args.kit is not None:
        args.kit = args.kit.resolve(strict=True)
    if args.host_binding is not None:
        args.host_binding = args.host_binding.resolve(strict=True)
    if args.fixture:
        raise SystemExit(fixture(args.fixture, args.out))
    if args.worker:
        raise SystemExit(worker(args.kit, args.out))
    if args.kit is None or args.host_binding is None:
        parser.error("reviewed --kit and actual --host-binding required")
    raise SystemExit(outer(args.kit, args.out, args.host_binding))
