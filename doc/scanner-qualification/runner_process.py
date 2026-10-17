"""Linux-only process identities for the Scanner runner (no import-time I/O).

RSS is evidence, never a liveness test. Production custody requires positive
process-pidfd exit proof; unreadable/contradictory state and PID reuse fail closed.
"""
from dataclasses import asdict, dataclass
import json
import os
from pathlib import Path
import select
import signal
import time


class Uncertain(RuntimeError):
    pass


@dataclass(frozen=True)
class Identity:
    pid: int
    birth: int
    uid: int


@dataclass(frozen=True)
class Process:
    pid: int
    ppid: int
    pgid: int
    sid: int
    birth: int
    uid: int
    state: str
    rss: int

    @property
    def identity(self):
        return Identity(self.pid, self.birth, self.uid)


def state(process):
    if process.rss < 0:
        raise Uncertain(f"negative RSS: {process}")
    if process.state == "Z" and process.rss == 0:
        return "zombie"
    if process.state in {"R", "S", "D", "T", "t", "I", "W", "P"}:
        return "live"
    raise Uncertain(f"unrecognized/contradictory state: {process}")


def match(identity, processes):
    process = processes.get(identity.pid)
    if process is None:
        return "disappeared"
    if process.identity != identity:
        raise Uncertain(f"PID reused or UID changed: expected={identity}, observed={process}")
    return state(process)


def require_live(identity, processes):
    if match(identity, processes) != "live":
        raise Uncertain(f"required live process is terminal: {identity}")


def read_process(pid, proc=Path("/proc")):
    path = proc / str(pid)
    raw = (path / "stat").read_bytes()
    fields = raw.rsplit(b")", 1)[1].split()  # Starts at field3, state.
    uid = path.stat().st_uid
    again = (path / "stat").read_bytes().rsplit(b")", 1)[1].split()
    if fields[19] != again[19]:
        raise Uncertain(f"PID {pid} changed birth during observation")
    result = Process(pid, int(again[1]), int(again[2]), int(again[3]),
                     int(again[19]), uid, again[0].decode("ascii"),
                     int(again[21]) * os.sysconf("SC_PAGE_SIZE") // 1024)
    # One final stat buffer supplies all process fields. Even that buffer is
    # not an atomic kernel snapshot: task exit can yield X/0/0/-1/-1. Keep raw
    # observations here; only validated ownership may supply terminal evidence.
    return result


def snapshot(proc=Path("/proc")):
    result = {}
    for entry in proc.iterdir():
        if not entry.name.isdecimal():
            continue
        try:
            result[int(entry.name)] = read_process(int(entry.name), proc)
        except (FileNotFoundError, ProcessLookupError):
            pass
        # Permission, decoding, malformed data and other errors are not absence.
    return result


def pidfd_exited(fd):
    poller = select.poll()
    poller.register(fd, select.POLLIN)
    events = poller.poll(0)
    if not events:
        return False
    if any(number != fd or mask & (select.POLLERR | select.POLLNVAL)
           or not mask & (select.POLLIN | select.POLLHUP) for number, mask in events):
        raise Uncertain(f"invalid pidfd poll result: {events}")
    return True


class PidfdEvidence:
    """Retain birth-validated process pidfds; cache exit proof and release FDs."""
    def __init__(self, open_fd=None, read=None, poll=None, close=None, send=None):
        self.open_fd = open_fd or os.pidfd_open
        self.read = read or read_process
        self.poll = poll or pidfd_exited
        self.close_fd = close or os.close
        self.send_fd = send or signal.pidfd_send_signal
        self.handles, self.proofs = {}, {}
        self.pending_exit = set()

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()

    def close(self):
        errors = []
        for identity, fd in list(self.handles.items()):
            try:
                self.close_fd(fd)
            except Exception as error:
                errors.append(str(error))
            del self.handles[identity]
        if errors:
            raise Uncertain(f"pidfd close failed: {errors}")

    def bind(self, identity):
        if identity in self.handles or identity in self.proofs:
            return
        try:
            fd = self.open_fd(identity.pid, 0)  # Process/thread-group pidfd.
        except ProcessLookupError:
            self.proofs[identity] = {"source": "pidfd_open_ESRCH", "identity": asdict(identity)}
            return
        retained = False
        try:
            try:
                current = self.read(identity.pid)
            except (FileNotFoundError, ProcessLookupError):
                if not self.poll(fd):
                    raise Uncertain(f"missing proc entry without pidfd exit: {identity}")
                self.proofs[identity] = {"source": "pidfd_exit_after_open", "identity": asdict(identity)}
                return
            if current.identity != identity:
                raise Uncertain(f"pidfd admission identity changed: {identity}, {current}")
            raw = "exit-candidate" if current.state == "X" and current.rss == 0 else state(current)
            self.handles[identity] = fd
            retained = True
            if raw in ("exit-candidate", "zombie"):
                self.pending_exit.add(identity)
                if not self.poll(fd):
                    # Keep the validated handle for fault cleanup, but do not
                    # let an older live sample hide this uncertain fresh read.
                    raise Uncertain(f"terminal-looking admission without pidfd exit: {identity}, {current}")
                self.proofs[identity] = {"source": "pidfd_exit_while_binding", "identity": asdict(identity)}
                del self.handles[identity]
                self.close_fd(fd)
        finally:
            if not retained:
                self.close_fd(fd)

    def status(self, identity, process):
        if process is not None and process.identity != identity:
            raise Uncertain(f"PID reused or UID changed: expected={identity}, observed={process}")
        # Never turn an unsupported/negative/contradictory sample into a valid
        # process simply because a descriptor was readable. X0 alone is not exit.
        raw = None
        if process is not None:
            if process.state == "X" and process.rss == 0:
                raw = "exit-candidate"
            else:
                raw = state(process)
        self.bind(identity)
        if identity not in self.proofs and self.poll(self.handles[identity]):
            fd = self.handles.pop(identity)
            self.proofs[identity] = {"source": "held_pidfd_exit", "identity": asdict(identity)}
            self.close_fd(fd)
        if identity in self.proofs:
            return "disappeared" if process is None else "zombie" if raw == "zombie" else "exited"
        if process is None or raw in ("exit-candidate", "zombie") or identity in self.pending_exit:
            # A zombie group leader can still have running threads. A nonready
            # process pidfd cannot certify that the whole group has exited.
            self.pending_exit.add(identity)
            raise Uncertain(f"terminal-looking proc entry without pidfd exit: {identity}, {process}")
        return raw

    def signal(self, identity, number):
        # An admitted kernel handle, rather than a fresh numeric-PID lookup,
        # remains safe even when procfs fields are unavailable during exit.
        self.bind(identity)
        if identity in self.proofs:
            return "exited"
        fd = self.handles[identity]
        if self.poll(fd):
            self.proofs[identity] = {"source": "held_pidfd_exit", "identity": asdict(identity)}
            del self.handles[identity]
            self.close_fd(fd)
            return "exited"
        try:
            self.send_fd(fd, number, None, 0)
        except ProcessLookupError:
            # Do not fabricate a poll witness. A later observation must still
            # establish exit and actual-parent wait/ECHILD must drain custody.
            return "disappeared"
        return "signaled"


class Scope:
    """Birth ledger: ancestry establishes ownership; later adoption/setsid retains it."""
    def __init__(self, root, members=(), exits=None):
        self.root = root
        self.owned = {item.pid: item for item in (root, *members)}
        self.exits = exits

    def status(self, identity, processes):
        if self.exits is not None:
            return self.exits.status(identity, processes.get(identity.pid))
        return match(identity, processes)

    def signal(self, identity, number):
        return self.exits.signal(identity, number) if self.exits is not None else signal_owned(identity, number)

    def observe(self, processes):
        errors = []
        for identity in self.owned.values():
            try:
                self.status(identity, processes)
            except Uncertain as error:
                errors.append(str(error))
        changed = True
        while changed:
            changed = False
            for process in processes.values():
                parent = processes.get(process.ppid)
                if parent is None or self.owned.get(parent.pid) != parent.identity:
                    continue
                if process.pid in self.owned:
                    continue
                try:
                    if self.status(parent.identity, processes) != "live":
                        continue
                except Uncertain as error:
                    errors.append(str(error))
                    continue
                if process.birth < parent.birth or process.uid != self.root.uid:
                    errors.append(f"unverified descendant: {process}")
                    continue
                try:
                    state(process)
                except Uncertain as error:
                    errors.append(str(error))
                    continue
                # Poll the held parent's identity after the child snapshot.
                # A stale parent row after exit cannot establish new ownership.
                self.owned[process.pid] = process.identity
                changed = True
        if errors:
            raise Uncertain("; ".join(dict.fromkeys(errors)))
        return {pid: self.status(identity, processes) for pid, identity in self.owned.items()}

    def live(self, processes, exclude=()):
        states = self.observe(processes)
        return [self.owned[pid] for pid, status in states.items()
                if status == "live" and pid not in exclude]


def atomic_json(path, data):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(data, sort_keys=True) + "\n")
    temporary.replace(path)


def read_identity(path):
    return Identity(**json.loads(path.read_text())["identity"])


def healthy(identity, processes, heartbeat, now, maximum_age=5):
    require_live(identity, processes)
    if heartbeat["identity"] != asdict(identity):
        raise Uncertain("observer heartbeat identity mismatch")
    fresh_sample(heartbeat["monotonic"], now, maximum_age)


def fresh_sample(last_sample, now, maximum_age=5):
    if last_sample is None:
        raise Uncertain("no successful RSS sample")
    age = now - last_sample
    if not 0 <= age <= maximum_age:
        raise Uncertain(f"stale/future observer heartbeat: age={age}")


def report_fault(record, notify, arm, disarm):
    try:
        arm()
        try:
            record()
        except Exception:
            pass
    finally:
        try:
            disarm()
        finally:
            notify()
    return 125


def timeout_fault(notify, reason):
    notify()  # Before raising/unwinding potentially stalled I/O.
    raise TimeoutError(reason)


def signal_owned(identity, number, read=None, open_fd=None, send=None, close=None, poll=None):
    """Open first, revalidate birth, then signal that kernel identity exclusively."""
    read = read or read_process
    open_fd = open_fd or os.pidfd_open
    send = send or signal.pidfd_send_signal
    close = close or os.close
    poll = poll or pidfd_exited
    try:
        fd = open_fd(identity.pid, 0)
    except ProcessLookupError:
        return "disappeared"
    try:
        try:
            process = read(identity.pid)
        except (FileNotFoundError, ProcessLookupError):
            if poll(fd):
                return "disappeared"
            raise Uncertain(f"missing proc entry without pidfd exit: {identity}")
        if process.identity != identity:
            raise Uncertain(f"PID reused or UID changed: expected={identity}, observed={process}")
        status = "exit-candidate" if process.state == "X" and process.rss == 0 else state(process)
        if status in ("exit-candidate", "zombie"):
            if poll(fd):
                return "zombie" if status == "zombie" else "exited"
            raise Uncertain(f"terminal-looking proc entry without pidfd exit: {identity}, {process}")
        try:
            send(fd, number, None, 0)
        except ProcessLookupError:
            return "disappeared"
        return "signaled"
    finally:
        close(fd)


def stop_known(identities, number, send=None):
    """One uncertain identity must not prevent cleanup of other verified births."""
    errors = []
    send = send or signal_owned
    for identity in identities:
        try:
            send(identity, number)
        except Exception as error:
            errors.append(f"{identity}: {type(error).__name__}: {error}")
    return errors


def image_paths(output):
    return {label: output / label / "build/scanner/images/jdk"
            for label in ("base", "candidate")}


def check_image(image):
    for relative in ("release", "lib/modules", "lib/server/libjvm.so", "bin/java"):
        if not (image / relative).is_file():
            raise Uncertain(f"normal JDK image missing {image / relative}")
    if not os.access(image / "bin/java", os.X_OK):
        raise Uncertain(f"image java is not executable: {image / 'bin/java'}")


def checkpoint(scope, processes, requester):
    """Only the waiting campaign and its ancestor chain may remain live."""
    scope.observe(processes)
    if scope.status(requester, processes) != "live":
        raise Uncertain("checkpoint requester is no longer live")
    allowed, current = {scope.root.pid}, requester.pid
    while current != scope.root.pid:
        if current in allowed or current not in scope.owned:
            raise Uncertain("checkpoint requester is not in this stage ancestry")
        allowed.add(current)
        current = processes[current].ppid
    unexpected = scope.live(processes, allowed)
    if unexpected:
        raise Uncertain(f"measurement descendant survived: {unexpected}")


def publish_sample(identity, rss, limit, now, flush, publish):
    # Preserve the over-limit sample but never publish healthy readiness for it.
    flush()
    if rss >= limit:
        raise Uncertain(f"sampled campaign RSS {rss}KiB reached stop limit {limit}KiB")
    publish({"identity": asdict(identity), "monotonic": now})
