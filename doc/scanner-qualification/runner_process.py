"""Linux-only process identities for the Scanner runner (no import-time I/O).

RSS is evidence, never a liveness test. Only an observed Z with zero RSS is
terminal; unreadable/contradictory state and PID reuse fail closed.
"""
from dataclasses import asdict, dataclass
import json
import os
from pathlib import Path
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
    state(result)
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


class Scope:
    """Birth ledger: ancestry establishes ownership; later adoption/setsid retains it."""
    def __init__(self, root, members=()):
        self.root = root
        self.owned = {item.pid: item for item in (root, *members)}

    def observe(self, processes):
        errors = []
        for identity in self.owned.values():
            try:
                match(identity, processes)
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
                if process.birth < parent.birth or process.uid != self.root.uid:
                    errors.append(f"unverified descendant: {process}")
                    continue
                try:
                    state(process)
                except Uncertain as error:
                    errors.append(str(error))
                    continue
                self.owned[process.pid] = process.identity
                changed = True
        if errors:
            raise Uncertain("; ".join(dict.fromkeys(errors)))
        return {pid: match(identity, processes) for pid, identity in self.owned.items()}

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


def signal_owned(identity, number, read=None, open_fd=None, send=None, close=None):
    """Open first, revalidate birth, then signal that kernel identity exclusively."""
    read = read or read_process
    open_fd = open_fd or os.pidfd_open
    send = send or signal.pidfd_send_signal
    close = close or os.close
    try:
        fd = open_fd(identity.pid, 0)
    except ProcessLookupError:
        return "disappeared"
    try:
        try:
            process = read(identity.pid)
        except (FileNotFoundError, ProcessLookupError):
            return "disappeared"
        status = match(identity, {process.pid: process})
        if status != "live":
            return status
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
    require_live(requester, processes)
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
