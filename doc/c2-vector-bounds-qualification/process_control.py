"""Linux-only command supervision with an unreaped process-group owner.

The anchor remains alive after the command exits. Its PID/PGID cannot be reused
until final signalling and reap. No poll/wait/communicate on that anchor is
permitted before cleanup. Descendants must remain in the created process group;
deliberately daemonizing/setsid workloads require external cgroup supervision.
"""
import contextlib
import json
import os
from pathlib import Path
import resource
import selectors
import signal
import subprocess
import sys
import time

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; execution preconditions are required")

GRACE_SECONDS = 0.25
CLEANUP_SECONDS = 1.0
CANCEL_SIGNALS = {signal.SIGINT, signal.SIGTERM, signal.SIGHUP}
PROTECTED_SIGNALS = CANCEL_SIGNALS | {signal.SIGALRM}


class Cancelled(BaseException):
    pass


def limits():
    resource.setrlimit(resource.RLIMIT_FSIZE, (256 << 20, 256 << 20))
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))


def proc_identity(pid):
    try:
        fields = Path(f"/proc/{pid}/stat").read_text().rsplit(")", 1)[1].split()
        return {"state": fields[0], "parent": int(fields[1]), "group": int(fields[2]),
                "session": int(fields[3]), "start_ticks": int(fields[19])}
    except (FileNotFoundError, ProcessLookupError, PermissionError):
        return None


def signal_owned_group(pid, start_ticks, sig):
    identity = proc_identity(pid)
    # A dead unreaped anchor still reserves its PID. Never mistake zombie state
    # or pidfd readiness for permission to reap it before signalling the group.
    if (identity is None or identity["start_ticks"] != start_ticks
            or identity["group"] != pid or identity["session"] != pid):
        raise RuntimeError("anchor identity lost; refusing to signal a possibly reused group")
    try:
        os.killpg(pid, sig)
    except ProcessLookupError:
        pass


def live_group_members(group, deadline):
    result = []
    with os.scandir("/proc") as entries:
        for entry in entries:
            if time.monotonic() >= deadline:
                return result, False
            if entry.name.isdecimal():
                identity = proc_identity(int(entry.name))
                if identity and identity["group"] == group and int(entry.name) != group and identity["state"] != "Z":
                    result.append(int(entry.name))
    return result, True


def cleanup_anchor(anchor, start_ticks):
    deadline = time.monotonic() + CLEANUP_SECONDS
    signal_owned_group(anchor.pid, start_ticks, signal.SIGTERM)
    grace_end = min(deadline, time.monotonic() + GRACE_SECONDS)
    survivors = []
    try:
        survivors, complete = live_group_members(anchor.pid, grace_end)
        while complete and survivors and time.monotonic() < grace_end:
            time.sleep(min(0.02, max(0, grace_end - time.monotonic())))
            observed, complete = live_group_members(anchor.pid, grace_end)
            if complete:
                survivors = observed  # keep last known survivors if the final grace scan expires
    finally:
        # Unconditional: command/leader exit or an incomplete scan cannot skip KILL.
        signal_owned_group(anchor.pid, start_ticks, signal.SIGKILL)
        anchor.wait(timeout=max(0.001, deadline - time.monotonic()))  # final reap, after both group signals
    remaining, complete = live_group_members(anchor.pid, deadline)
    while complete and remaining and time.monotonic() < deadline:
        time.sleep(0.01)
        remaining, complete = live_group_members(anchor.pid, deadline)
    if remaining or not complete:
        raise RuntimeError("bounded cleanup verification incomplete or descendants still live; stop")
    return {"term_resistant_descendants": len(survivors), "anchor_reaped": True}


def _anchor(status_fd, life_fd, command):
    limits()  # trusted helper runs this before any workload; no parent preexec_fn
    # These dispositions protect the stable group owner, not the workload.
    for sig in CANCEL_SIGNALS:
        signal.signal(sig, signal.SIG_IGN)
    signal.pthread_sigmask(signal.SIG_UNBLOCK, PROTECTED_SIGNALS)

    def workload_setup():
        for sig in CANCEL_SIGNALS:
            signal.signal(sig, signal.SIG_DFL)  # SIG_IGN would otherwise survive exec
        signal.pthread_sigmask(signal.SIG_UNBLOCK, PROTECTED_SIGNALS)  # masks also survive exec
        limits()

    def send(value):
        os.write(status_fd, (json.dumps(value) + "\n").encode())

    selector = selectors.DefaultSelector()
    selector.register(life_fd, selectors.EVENT_READ)
    child = None
    try:
        send({"type": "ready"})
        try:
            child = subprocess.Popen(command, close_fds=True, preexec_fn=workload_setup)
        except BaseException as error:
            send({"type": "error", "error": repr(error)})
        reported = child is None
        while True:
            if selector.select(0.02) and not os.read(life_fd, 1):
                break  # parent death/startup failure: independent cleanup below
            if child is not None and not reported:
                status = child.poll()  # command PID can be reaped; anchor PID must remain reserved
                if status is not None:
                    send({"type": "exit", "status": status})
                    reported = True
    except (BrokenPipeError, OSError):
        pass
    finally:
        selector.close()
        # We are the live session/group owner here, so our own PGID is never a
        # reused unrelated group, even when the parent disappeared abruptly.
        os.killpg(os.getpid(), signal.SIGTERM)
        end = time.monotonic() + GRACE_SECONDS
        try:
            while time.monotonic() < end:
                members, complete = live_group_members(os.getpid(), end)
                if not complete or not members:
                    break
                time.sleep(0.01)
        finally:
            os.killpg(os.getpid(), signal.SIGKILL)


def run(command, log, timeout, env=None):
    """Run a command; clean its owned group on every exit, including cancellation."""
    if timeout <= 0:
        raise TimeoutError("no command time remains")
    if signal.getsignal(signal.SIGCHLD) != signal.SIG_DFL:
        raise RuntimeError("anchor ownership requires default SIGCHLD handling and no external child reaper")
    began, anchor, start_ticks, primary = time.monotonic(), None, None, None
    fds, handlers, old_mask = [], {}, None
    result = {"command": list(map(str, command))}

    def cancel(sig, frame):
        raise Cancelled(f"cancelled by signal {sig}")

    try:
        for sig in CANCEL_SIGNALS:
            handlers[sig] = signal.signal(sig, cancel)
        old_mask = signal.pthread_sigmask(signal.SIG_BLOCK, PROTECTED_SIGNALS)
        status_read, status_write = os.pipe()
        life_read, life_write = os.pipe()
        fds = [status_read, status_write, life_read, life_write]
        clean_env = dict(os.environ if env is None else env)
        clean_env.pop("PYTHONOPTIMIZE", None)
        with Path(log).open("w") as stream:
            anchor = subprocess.Popen([sys.executable, "-u", str(Path(__file__).resolve()),
                                       "--anchor", str(status_write), str(life_read), *map(str, command)],
                                      stdout=stream, stderr=subprocess.STDOUT, env=clean_env,
                                      start_new_session=True, pass_fds=(status_write, life_read))
            start_ticks = proc_identity(anchor.pid)["start_ticks"]
            for fd in (status_write, life_read):
                os.close(fd)
                fds.remove(fd)
            signal.pthread_sigmask(signal.SIG_SETMASK, old_mask)
            old_mask = None
            deadline, buffer, ready = began + timeout, b"", False
            with selectors.DefaultSelector() as selector:
                selector.register(status_read, selectors.EVENT_READ)
                while True:
                    remaining = deadline - time.monotonic()
                    if remaining <= 0:
                        raise subprocess.TimeoutExpired(command, timeout)
                    if not selector.select(min(0.1, remaining)):
                        continue
                    chunk = os.read(status_read, 4096)
                    if not chunk:
                        raise RuntimeError("anchor status pipe closed without command completion")
                    buffer += chunk
                    while b"\n" in buffer:
                        line, buffer = buffer.split(b"\n", 1)
                        message = json.loads(line)
                        if message == {"type": "ready"} and not ready:
                            ready = True
                        elif ready and message.get("type") == "exit" and type(message.get("status")) is int:
                            result["status"] = message["status"]
                            if message["status"]:
                                raise RuntimeError(f"Exit {message['status']}; preserve {log}; no retry")
                            return result
                        else:
                            raise RuntimeError(f"anchor protocol/startup failure: {message}")
    except BaseException as error:
        primary = error
        result["error"] = repr(error)
        raise
    finally:
        blocked = signal.pthread_sigmask(signal.SIG_BLOCK, PROTECTED_SIGNALS)
        try:
            if anchor is not None:
                try:
                    result["cleanup"] = cleanup_anchor(anchor, start_ticks)
                except BaseException as error:
                    result["cleanup_error"] = repr(error)
                    if primary is not None:
                        raise BaseExceptionGroup("command and cleanup failed", [primary, error])
                    raise
        finally:
            for fd in fds:
                with contextlib.suppress(OSError):
                    os.close(fd)
            for sig, handler in handlers.items():
                signal.signal(sig, handler)
            result["wall_seconds_including_cleanup"] = time.monotonic() - began
            Path(str(log) + ".process.json").write_text(json.dumps(result, indent=2) + "\n")
            signal.pthread_sigmask(signal.SIG_SETMASK, old_mask if old_mask is not None else blocked)


if __name__ == "__main__":
    if len(sys.argv) > 4 and sys.argv[1] == "--anchor":
        _anchor(int(sys.argv[2]), int(sys.argv[3]), sys.argv[4:])
    else:
        raise SystemExit("internal anchor entry point only")
