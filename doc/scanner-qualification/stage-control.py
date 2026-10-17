#!/usr/bin/env python3
"""Scanner Linux runner custody, health checks and bounded cleanup.

Each stage is a subreaper before it launches a payload. Completion requires
drained kernel children, not disappearance of a numeric process group. A dead
supervisor without its clean-completion record is uncertain, even if its known
ledger is empty. Bash, not this helper, waits Bash's own children.
"""
import ctypes
from dataclasses import asdict
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

from runner_process import (Identity, Scope, Uncertain, atomic_json, check_image,
                            checkpoint, healthy, image_paths, match, read_identity,
                            read_process, require_live, signal_owned, snapshot, stop_known)


class ControlDeadline(BaseException):
    """A hard control bound must bypass best-effort per-target error handling."""


def io_deadline(*_):
    raise ControlDeadline("Scanner runner control I/O deadline")


def target_state(identity):
    try:
        process = read_process(identity.pid)
    except (FileNotFoundError, ProcessLookupError):
        return "disappeared"
    return match(identity, {process.pid: process})


def record(path, scope, processes, seen):
    states = scope.observe(processes)
    with path.open("a") as output:
        for pid, status in sorted(states.items()):
            row = {"identity": asdict(scope.owned[pid]), "status": status}
            if pid in processes:
                row["observed"] = asdict(processes[pid])
            if seen.get(pid) != row:
                output.write(json.dumps(row, sort_keys=True) + "\n")
                seen[pid] = row
        output.flush()
    return states


def reap_children(directory, root, scope, child):
    """Peek without reaping so Z0 identity/evidence precedes the actual wait."""
    while True:
        try:
            pending = os.waitid(os.P_ALL, 0, os.WEXITED | os.WNOHANG | os.WNOWAIT)
        except ChildProcessError:
            return True
        if pending is None:
            return False
        process = read_process(pending.si_pid)
        if process.ppid != root.pid or process.birth < root.birth or process.uid != root.uid:
            raise Uncertain(f"unverified kernel child at reap: {process}")
        previous = scope.owned.get(process.pid, process.identity)
        if match(previous, {process.pid: process}) != "zombie":
            raise Uncertain(f"waitable child without observed Z0: {process}")
        scope.owned[process.pid] = previous
        with (directory / "processes.jsonl").open("a") as output:
            output.write(json.dumps({"identity": asdict(previous), "status": "zombie",
                                     "observed": asdict(process), "before_reap": True}, sort_keys=True) + "\n")
            output.flush()
        pid, status = os.waitpid(process.pid, 0)
        if child is not None and pid == child.pid:
            child.returncode = os.waitstatus_to_exitcode(status)


def serve_checkpoint(directory, scope):
    request = directory / "checkpoint.request"
    if not request.exists():
        return
    nonce, pid, birth, uid = request.read_text().split()
    requester = Identity(int(pid), int(birth), int(uid))
    # A pre-request snapshot can still show the requester's exited child live.
    checkpoint(scope, snapshot(), requester)
    request.unlink()
    atomic_json(directory / "checkpoint.reply", {"nonce": nonce, "ok": True})


def stage(directory, owner_path, duration, command):
    owner = read_identity(owner_path)
    root = read_process(os.getpid())
    observer_output = owner_path.parent
    observer = read_identity(observer_output / "observer.json")
    processes = snapshot()
    require_live(owner, processes)
    healthy(observer, processes, json.loads((observer_output / "memory-ready").read_text()), time.monotonic())
    if root.ppid != owner.pid or root.sid != root.pid:
        raise Uncertain("stage is not an isolated direct child of its recorded owner")
    libc = ctypes.CDLL(None, use_errno=True)
    if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER, this process only.
        raise OSError(ctypes.get_errno(), "cannot establish stage subreaper custody")
    stopping = False

    def stop(*_):
        nonlocal stopping
        stopping = True

    signal.signal(signal.SIGTERM, stop)
    signal.signal(signal.SIGINT, stop)
    scope, seen = Scope(root.identity), {}
    atomic_json(directory / "identity.json", {"identity": asdict(root.identity), "owner": asdict(owner)})
    deadline = time.monotonic() + 5
    while not (directory / "go").exists():
        require_live(owner, snapshot())
        if stopping or time.monotonic() >= deadline:
            raise Uncertain("stage launch handshake did not complete")
        time.sleep(.05)
    healthy(observer, snapshot(), json.loads((observer_output / "memory-ready").read_text()), time.monotonic())
    environment = dict(os.environ, SCANNER_STAGE_CONTROL=str(directory))
    cleanup_at = None
    sent = set()
    failure = None
    survivors = False
    child = None
    try:
        child = subprocess.Popen(["timeout", "--signal=TERM", "--kill-after=12s", duration, *command], env=environment)
        direct = read_process(child.pid)
        if direct.ppid != root.pid or direct.uid != root.uid:
            raise Uncertain("payload identity is not an owned direct child")
        scope.owned[direct.pid] = direct.identity
        atomic_json(directory / "payload.json", {"identity": asdict(direct.identity)})
        while True:
            signal.alarm(5)
            now = time.monotonic()
            processes = snapshot()
            record(directory / "processes.jsonl", scope, processes, seen)
            require_live(owner, processes)
            healthy(observer, processes, json.loads((observer_output / "memory-ready").read_text()), time.monotonic())
            no_children = reap_children(directory, root, scope, child)
            if no_children and child.returncode is None:
                raise Uncertain("payload wait status lost")
            # A child may have exited since the evidence snapshot. Reaping is
            # authoritative for status, but use fresh state for signal decisions.
            processes = snapshot()
            scope.observe(processes)
            if cleanup_at is None:
                serve_checkpoint(directory, scope)
            if stopping or child.returncode is not None:
                if cleanup_at is None:
                    cleanup_at = now
                live = scope.live(processes, {root.pid})
                survivors |= child.returncode is not None and bool(live)
                if not live and no_children:
                    break
                number = signal.SIGTERM if now - cleanup_at < 10 else signal.SIGKILL
                for identity in live:
                    if (identity, number) not in sent:
                        signal_owned(identity, number)
                        sent.add((identity, number))
                if now - cleanup_at >= 12:
                    raise Uncertain(f"stage descendants still live/undrained: {live}")
            signal.alarm(0)
            time.sleep(.1)
    except BaseException as error:
        failure = error
        # Fail closed and make a bounded best effort on identities already owned.
        # No clean footer is written on observation, I/O or custody failure.
        until = time.monotonic() + 12
        signal.alarm(12)
        while time.monotonic() < until:
            try:
                try:
                    scope.observe(snapshot())
                except Exception as admission_error:
                    print(f"uncertain fault observation: {admission_error}", file=sys.stderr)
                errors = stop_known([identity for identity in scope.owned.values()
                                     if identity != root.identity], signal.SIGKILL,
                                    send=signal_owned)
                for detail in errors:
                    print(f"uncertain fault target: {detail}", file=sys.stderr)
                if reap_children(directory, root, scope, child):
                    break
            except TimeoutError:
                break
            except Exception as cleanup_error:
                print(f"uncertain fault cleanup: {cleanup_error}", file=sys.stderr)
            time.sleep(.1)
        signal.alarm(0)
        raise
    finally:
        if failure is not None:
            print(f"stage custody incomplete: {failure}", file=sys.stderr)
    signal.alarm(5)
    atomic_json(directory / "complete.json", {
        "identity": asdict(root.identity), "owner": asdict(owner), "clean": True,
        "members": [asdict(identity) for identity in scope.owned.values()],
        "command_status": child.returncode, "stopped": stopping, "survivors": survivors})
    return 125 if stopping or survivors else child.returncode


def failed_custody(directory, root):
    # The supervisor died without proving it drained adoption. Stop independently
    # verified recorded births, but never promote this incomplete ledger to proof
    # of emptiness: an escaped unrecorded descendant may still exist.
    identities = {root.pid: root}
    errors = []
    payload = directory / "payload.json"
    try:
        if payload.exists():
            identity = read_identity(payload)
            identities[identity.pid] = identity
    except Exception as error:
        errors.append(f"payload evidence: {error}")
    ledger = directory / "processes.jsonl"
    try:
        if ledger.exists():
            for line in ledger.read_text().splitlines():
                try:
                    identity = Identity(**json.loads(line)["identity"])
                    if identities.get(identity.pid, identity) != identity:
                        continue  # Conflicting evidence stays uncertain; retain earlier birth.
                    identities[identity.pid] = identity
                except (ValueError, KeyError, TypeError):
                    continue  # Partial rows stay intact; outcome remains uncertain.
    except Exception as error:
        errors.append(f"ledger evidence: {error}")
    errors += stop_known([item for item in identities.values() if item != root],
                         signal.SIGKILL, send=signal_owned)
    raise Uncertain(f"supervisor missing clean completion; adoption uncertain; targets={list(identities.values())}; errors={errors}")


def observer_health(output, pid):
    identity = read_identity(output / "observer.json")
    if identity.pid != pid:
        raise Uncertain("observer token does not match the shell's child")
    healthy(identity, snapshot(), json.loads((output / "memory-ready").read_text()), time.monotonic())
    return identity


def await_ready(output, pid, stage_ready=False):
    deadline = time.monotonic() + 5
    while True:
        path = output / ("identity.json" if stage_ready else "memory-ready")
        if path.exists():
            if stage_ready:
                identity = read_identity(path)
                if identity.pid != pid:
                    raise Uncertain("stage token PID mismatch")
                require_live(identity, snapshot())
            else:
                observer_health(output, pid)
            return 0
        if time.monotonic() >= deadline:
            raise Uncertain("readiness deadline; no validated ready record")
        time.sleep(.05)


def stop_stage(directory, pid):
    identity = read_identity(directory / "identity.json")
    if identity.pid != pid:
        raise Uncertain("stage token PID mismatch")
    deadline = time.monotonic() + 12.5
    try:
        initial = target_state(identity)
        if initial == "live":
            signal_owned(identity, signal.SIGTERM)
    except Exception:
        failed_custody(directory, identity)
    try:
        while target_state(identity) == "live":
            if time.monotonic() >= deadline:
                # Retain custody while attempting known-target cleanup. The outer
                # timeout is the final bound; no uncertain path can report clean.
                raise Uncertain(f"supervisor drain deadline: {identity}")
            time.sleep(.05)
    except Exception:
        failed_custody(directory, identity)
    try:
        complete = json.loads((directory / "complete.json").read_text())
        if complete["identity"] != asdict(identity) or complete.get("clean") is not True:
            raise Uncertain("stage disappeared without validated clean custody completion")
        token = json.loads((directory / "identity.json").read_text())
        if complete["owner"] != token["owner"]:
            raise Uncertain("stage completion owner differs from registered owner")
        scope = Scope(identity, tuple(Identity(**item) for item in complete["members"]))
        processes = snapshot()
        # Retain Z0/disappearance classification after the supervisor itself exits.
        record(directory / "processes.jsonl", scope, processes, {})
        if scope.live(processes):
            raise Uncertain("live owned workers after stage completion")
    except Exception:
        failed_custody(directory, identity)
    return 0


def stop_observer(output, pid):
    identity = read_identity(output / "observer.json")
    if identity.pid != pid:
        raise Uncertain("observer token PID mismatch")
    if target_state(identity) != "live":
        raise Uncertain(f"observer was already terminal before planned shutdown: {identity}")
    health_error = None
    try:
        observer_health(output, pid)
    except Exception as error:
        health_error = str(error)  # Health fault does not prevent owned cleanup.
    signal_owned(identity, signal.SIGUSR2)
    deadline = time.monotonic() + 2
    while target_state(identity) == "live":
        if time.monotonic() >= deadline:
            signal_owned(identity, signal.SIGKILL)
            verification = time.monotonic() + .1
            while target_state(identity) == "live" and time.monotonic() < verification:
                time.sleep(.01)
            raise Uncertain(f"observer {identity} required SIGKILL; observation incomplete")
        time.sleep(.05)
    if health_error is not None:
        raise Uncertain(f"observer stopped, but observation was incomplete: {health_error}")
    return 0


def main(args):
    action = args[0]
    if action == "owner":
        owner = read_process(int(args[1]))
        require_live(owner.identity, {owner.pid: owner})
        atomic_json(Path(args[2]), {"identity": asdict(owner.identity)})
        return 0
    if action == "stage":
        return stage(Path(args[1]), Path(args[2]), args[3], args[4:])
    if action == "ready-stage":
        return await_ready(Path(args[1]), int(args[2]), True)
    if action == "ready-observer":
        return await_ready(Path(args[1]), int(args[2]))
    if action == "health":
        observer_health(Path(args[1]), int(args[2]))
        return 0
    if action == "stop-stage":
        return stop_stage(Path(args[1]), int(args[2]))
    if action == "stop-observer":
        return stop_observer(Path(args[1]), int(args[2]))
    if action == "terminal-observer":
        identity = read_identity(Path(args[1]) / "observer.json")
        if identity.pid != int(args[2]) or target_state(identity) == "live":
            raise Uncertain("observer termination not verified")
        return 0
    if action == "terminal-stage":
        identity = read_identity(Path(args[1]) / "identity.json")
        if identity.pid != int(args[2]) or target_state(identity) == "live":
            raise Uncertain("stage supervisor termination not verified")
        return 0
    if action == "images":
        print("\n".join(str(path) for path in image_paths(Path(args[1])).values()))
        return 0
    if action == "check-image":
        check_image(Path(args[1]))
        return 0
    raise ValueError(f"unknown action {action}")


if __name__ == "__main__":
    try:
        signal.signal(signal.SIGALRM, io_deadline)
        # Helpers do no payload work. Their blocking I/O is bounded as well as
        # their poll loops. Bash waits interruptibly on them during owner faults.
        limits = {"stop-stage": 13, "stop-observer": 3, "stage": 5}
        signal.alarm(limits.get(sys.argv[1], 5))
        sys.exit(main(sys.argv[1:]))
    except (Exception, ControlDeadline) as error:
        print(f"INCOMPLETE: {type(error).__name__}: {error}", file=sys.stderr)
        sys.exit(125)
