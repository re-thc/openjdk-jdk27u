#!/usr/bin/env python3
"""Linux resource supervisor reused by the signed-guard qualification batch.

No retries, installation, network or publication. Limits
are sampled stop thresholds, except affinity and per-file/core rlimits. This is
diagnostic orchestration, never a timing harness.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import resource
import select
import shutil
import signal
import subprocess
import sys
import time


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def write_new(path, value):
    with path.open("x") as stream:
        json.dump(value, stream, indent=2)
        stream.write("\n")


def files_under(root):
    def walk_error(error):
        if not isinstance(error, FileNotFoundError):
            raise error
    for directory, dirs, names in os.walk(root, followlinks=False, onerror=walk_error):
        dirs[:] = [d for d in dirs if not (Path(directory) / d).is_symlink()]
        for name in names:
            p = Path(directory) / name
            if not p.is_symlink():
                yield p


def process_info(pid):
    raw = (Path("/proc") / str(pid) / "stat").read_text()
    fields = raw[raw.rfind(")") + 2:].split()
    return {"pid": int(pid), "state": fields[0], "group": int(fields[2]), "session": int(fields[3]),
            "birth": int(fields[19]),
            "rss": max(0, int(fields[21])) * os.sysconf("SC_PAGE_SIZE")}


def session_members(session):
    members = []
    for entry in Path("/proc").iterdir():
        if not entry.name.isdecimal():
            continue
        try:
            info = process_info(entry.name)
            if info["session"] == session and info["state"] != "Z":
                members.append(info)
        except (FileNotFoundError, ProcessLookupError):
            pass
    return members


def signal_members(session, sig):
    # Revalidate the current SID and start time of each owned process before
    # signaling it. This includes descendants that changed process groups.
    for before in session_members(session):
        try:
            now = process_info(before["pid"])
            if now["session"] == session and now["birth"] == before["birth"]:
                os.kill(now["pid"], sig)
        except (FileNotFoundError, ProcessLookupError):
            pass


def signal_groups(session, sig):
    # A process group cannot span sessions. Revalidate an owned live member
    # before signaling its group; also handle descendants that changed groups.
    sent = set()
    for before in session_members(session):
        try:
            now = process_info(before["pid"])
            if (now["session"] == session and now["birth"] == before["birth"]
                    and now["group"] == before["group"] and now["group"] not in sent):
                os.killpg(now["group"], sig)
                sent.add(now["group"])
        except (FileNotFoundError, ProcessLookupError):
            pass
    signal_members(session, sig)


def stop_session(process, deadline, grace):
    signal_groups(process.pid, signal.SIGTERM)
    time.sleep(max(0, min(grace, deadline - time.monotonic())))
    signal_groups(process.pid, signal.SIGKILL)
    process.wait(timeout=max(0.001, deadline - time.monotonic()))
    if session_members(process.pid):
        raise RuntimeError("owned session still has live descendants at cleanup deadline")


class ChildProcess:
    """Fork without Popen's pre-exec handshake delaying the deadline watcher."""
    def __init__(self, argv, cwd, env, stdout, stderr, setup):
        self.returncode = None
        release_read, self.release_write = os.pipe()
        self.pid = os.fork()
        if self.pid == 0:
            try:
                os.close(self.release_write)
                os.setsid()
                # No workload exec before the independent absolute watcher is
                # installed. EOF means preparation failed, never permission to run.
                if os.read(release_read, 1) != b"R":
                    os._exit(126)
                os.close(release_read)
                setup()
                os.dup2(stdout.fileno(), 1)
                os.dup2(stderr.fileno(), 2)
                os.chdir(cwd)
                os.execvpe(argv[0], argv, env)
            except BaseException:
                os._exit(127)
        os.close(release_read)

    def release(self):
        os.write(self.release_write, b"R")
        os.close(self.release_write)
        self.release_write = None

    def close_release(self):
        if self.release_write is not None:
            os.close(self.release_write)
            self.release_write = None

    def poll(self):
        if self.returncode is None:
            info = os.waitid(os.P_PID, self.pid, os.WEXITED | os.WNOHANG | os.WNOWAIT)
            if info is not None:
                self.returncode = info.si_status if info.si_code == os.CLD_EXITED else -info.si_status
        return self.returncode

    def wait(self, timeout):
        end = time.monotonic() + timeout
        while self.poll() is None:
            if time.monotonic() >= end:
                raise subprocess.TimeoutExpired("owned child", timeout)
            time.sleep(min(0.01, max(0, end - time.monotonic())))
        return self.returncode


    def reap(self):
        os.waitpid(self.pid, 0)


def start_watchdog(session, deadline, grace):
    # This independent process uses absolute deadlines, not time remaining at
    # a later exec. It survives a blocked main-process output scan and a timeout
    # leader that exits while descendants remain. No workload process inherits
    # the disarm pipe: it is created after the workload fork.
    read_fd, write_fd = os.pipe()
    birth = process_info(session)["birth"]
    pid = os.fork()
    if pid == 0:
        os.close(write_fd)
        os.setsid()
        for sig in (signal.SIGTERM, signal.SIGHUP, signal.SIGINT):
            signal.signal(sig, signal.SIG_IGN)
        try:
            for end, sig in ((deadline - grace, signal.SIGTERM), (deadline, signal.SIGKILL)):
                while time.monotonic() < end:
                    if read_fd is None:
                        time.sleep(max(0, end - time.monotonic()))
                        break
                    ready, _, _ = select.select([read_fd], [], [], max(0, end - time.monotonic()))
                    if ready:
                        message = os.read(read_fd, 1)
                        if message == b"D":
                            os._exit(0)
                        # A dead supervisor is not a successful disarm.
                        os.close(read_fd)
                        read_fd = None
                # Signal the reserved original group before any full /proc scan.
                # The main process keeps the leader unreaped until disarm, and
                # the birth check also covers unexpected supervisor death.
                try:
                    leader = process_info(session)
                    if leader["birth"] == birth:
                        if leader["session"] == session:
                            os.killpg(session, sig)
                        else:
                            os.kill(session, sig)
                except (FileNotFoundError, ProcessLookupError):
                    pass
                signal_groups(session, sig)
            os._exit(124)
        except BaseException:
            # Only signal a known live leader after inspection failure; never
            # target an unvalidated numeric group following supervisor death.
            try:
                leader = process_info(session)
                if leader["birth"] == birth:
                    os.kill(session, signal.SIGKILL)
                    if leader["session"] == session:
                        os.killpg(session, signal.SIGKILL)
            except (FileNotFoundError, ProcessLookupError):
                pass
            os._exit(125)
    os.close(read_fd)
    return pid, write_fd


def finish_watchdog(pid, pipe, deadline):
    try:
        os.write(pipe, b"D")
    except BrokenPipeError:
        pass
    finally:
        os.close(pipe)
    while True:
        found, status = os.waitpid(pid, os.WNOHANG)
        if found:
            return os.waitstatus_to_exitcode(status)
        if time.monotonic() >= deadline:
            os.kill(pid, signal.SIGKILL)
            os.waitpid(pid, 0)
            raise RuntimeError("deadline watcher did not acknowledge disarm")
        time.sleep(min(0.01, max(0, deadline - time.monotonic())))


def review_ready(root, checkpoint, request_hash):
    review = json.loads((root / checkpoint["record"]).read_text())
    if review.get("request_sha256") != request_hash or review.get("qualified") is not True:
        raise RuntimeError("missing qualified technical review: " + checkpoint["record"])
    evidence = review.get("evidence_files")
    if not isinstance(evidence, dict) or not evidence or review.get("reviewer") != checkpoint["reviewer"]:
        raise RuntimeError("incomplete technical review identity/evidence")
    for relative, expected in evidence.items():
        path = (root / relative).resolve()
        if not path.is_relative_to(root.resolve()) or digest(path) != expected:
            raise RuntimeError("review evidence changed: " + relative)


def run_step(request_path, step_id):
    os.umask(0o077)
    request_file = Path(request_path).resolve()
    request_hash = digest(request_file)
    plan = json.loads(request_file.read_text())
    ids = [step["id"] for step in plan["steps"]]
    if len(ids) != len(set(ids)) or any(re.fullmatch(r"[a-z0-9-]+", value) is None for value in ids):
        raise RuntimeError("step IDs must be unique and contain only lowercase letters/digits/hyphens")
    root = Path(plan["root"])
    chosen = next(i for i, step in enumerate(plan["steps"]) if step["id"] == step_id)
    step = plan["steps"][chosen]
    limits = plan["limits"]
    grace = limits["termination_grace_seconds"]
    if grace != 2 or step["seconds"] <= grace:
        raise RuntimeError("fixed two-second termination reserve is required")
    if not set(step["cpus"]) <= os.sched_getaffinity(0):
        raise RuntimeError("requested affinity unavailable; stop without substitution")
    for path, expected in plan["inputs"].items():
        if digest(path) != expected:
            raise RuntimeError("frozen input changed: " + path)
    for relative in step.get("generated_input_manifests", []):
        generated = json.loads((root / relative).read_text())
        for path, expected in generated["frozen_files"].items():
            if digest(path) != expected:
                raise RuntimeError("generated frozen input changed: " + path)
    if chosen == 0:
        if shutil.disk_usage(root.parent).free < limits["start_free_bytes"]:
            raise RuntimeError("less than fixed starting disk headroom")
        root.mkdir(mode=0o700)  # Must be a new, absent root; no resume/overwrite.
        (root / "records").mkdir()
        (root / "logs").mkdir()
        write_new(root / "execution-start.json", {
            "request_sha256": request_hash,
            "monotonic": time.monotonic(),
            "boot_id": Path("/proc/sys/kernel/random/boot_id").read_text().strip(),
            "wall_time_ns": time.time_ns(),
        })
    origin = json.loads((root / "execution-start.json").read_text())
    if origin["request_sha256"] != request_hash:
        raise RuntimeError("request changed after execution began")
    if origin["boot_id"] != Path("/proc/sys/kernel/random/boot_id").read_text().strip():
        raise RuntimeError("host rebooted; execution identity changed")
    for previous in plan["steps"][:chosen]:
        result = json.loads((root / "records" / (previous["id"] + ".result.json")).read_text())
        if not result["success"]:
            raise RuntimeError("previous step did not succeed: " + previous["id"])
    completed_ids = set(ids[:chosen])
    for checkpoint in plan.get("review_checkpoints", []):
        if checkpoint["after"] in completed_ids:
            review_ready(root, checkpoint, request_hash)
    if time.monotonic() - origin["monotonic"] >= limits["overall_seconds"]:
        raise RuntimeError("overall execution wall limit elapsed")
    record = root / "records" / step["id"]
    write_new(record.with_suffix(".started.json"), {
        "step": step, "request_sha256": request_hash, "wall_time_ns": time.time_ns(),
    })  # Exclusive creation prevents repeating even a failed command.
    env = os.environ.copy()
    for key in plan["clear_environment"]:
        env.pop(key, None)
    env.update(plan["environment"])
    for key in ("TMPDIR", "TMP", "TEMP"):
        env[key] = str(root / "tmp")
    # Do not repurpose HOME: make logs and compiler state use explicit paths.

    def child_setup():
        os.sched_setaffinity(0, step["cpus"])
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
        file_limit = step.get("per_file_bytes", limits["per_file_bytes"])
        resource.setrlimit(resource.RLIMIT_FSIZE, (file_limit, file_limit))

    started = time.monotonic()
    deadline = min(started + step["seconds"], origin["monotonic"] + limits["overall_seconds"])
    process = None
    watchdog = None
    reason = None
    max_rss = 0
    max_root = 0
    returncode = None
    def interrupted(signum, frame):
        raise RuntimeError("supervisor received signal " + str(signum))
    for sig in (signal.SIGTERM, signal.SIGHUP, signal.SIGINT):
        signal.signal(sig, interrupted)
    try:
        for directory in step.get("mkdir", []):
            p = root / directory
            p.mkdir(parents=True, exist_ok=False)
        (root / "tmp").mkdir(exist_ok=True)
        stdout_path = root / "logs" / (step["id"] + ".stdout.txt")
        stderr_path = root / "logs" / (step["id"] + ".stderr.txt")
        with stdout_path.open("xb") as stdout, stderr_path.open("xb") as stderr:
            # GNU timeout owns a process group (no --foreground). Its independent
            # TERM/KILL timer remains active even during a slow filesystem scan.
            # For a 120s cell: TERM at <=118s, group SIGKILL at <=120s. The same
            # reserve applies to the remaining 7200s overall budget.
            run_seconds = deadline - time.monotonic() - grace
            if run_seconds <= 0:
                raise RuntimeError("insufficient remaining time for termination reserve")
            actual_argv = [plan["timeout_program"], "--signal=TERM", "--kill-after=2s",
                           f"{run_seconds:.6f}s", *step["argv"]]
            write_new(record.with_suffix(".launch.json"), {
                "argv": actual_argv, "deadline_monotonic": deadline,
                "termination_grace_seconds": grace,
            })
            # The absolute watcher, rather than timeout's relative exec timer,
            # owns the ceiling including both launch delay and the grace.
            process = ChildProcess(actual_argv, step["cwd"], env, stdout, stderr, child_setup)
            watchdog = start_watchdog(process.pid, deadline, grace)
            write_new(record.with_suffix(".ownership.json"), {
                "session": process.pid, "leader_birth": process_info(process.pid)["birth"],
                "watchdog": watchdog[0], "watchdog_birth": process_info(watchdog[0])["birth"],
                "boot_id": origin["boot_id"],
            })
            process.release()
            while True:
                elapsed = time.monotonic() - started
                if elapsed >= step["seconds"]:
                    raise RuntimeError("step wall limit")
                if time.monotonic() - origin["monotonic"] >= limits["overall_seconds"]:
                    raise RuntimeError("overall wall limit")
                if os.waitid(os.P_PID, watchdog[0], os.WEXITED | os.WNOHANG | os.WNOWAIT) is not None:
                    raise RuntimeError("deadline watcher exited before verified workload drain")
                members = session_members(process.pid)
                rss = sum(member["rss"] for member in members)
                max_rss = max(max_rss, rss)
                if rss > step["rss_bytes"]:
                    raise RuntimeError("session aggregate RSS stop threshold")
                if stdout_path.stat().st_size + stderr_path.stat().st_size > limits["log_bytes"]:
                    raise RuntimeError("combined command log stop threshold")
                total = 0
                for path in files_under(root):
                    try:
                        size = path.stat().st_size
                    except FileNotFoundError:
                        continue  # Normal deletion/rename of build temporaries.
                    total += size
                    if path.suffix == ".xml" and size > limits["xml_bytes"]:
                        raise RuntimeError("individual XML stop threshold: " + str(path))
                max_root = max(max_root, total)
                if total > limits["root_bytes"]:
                    raise RuntimeError("output root apparent-size stop threshold")
                if shutil.disk_usage(root).free < limits["minimum_free_bytes"]:
                    raise RuntimeError("disk free-space stop threshold")
                returncode = process.poll()
                if returncode is not None and not members:
                    break
                time.sleep(1)
    except BaseException as error:
        reason = type(error).__name__ + ": " + str(error)
    finally:
        # Permit bounded owned-session cleanup after an outer cancellation.
        # SIGKILL cannot be caught: its outcome requires an ownership/state check.
        for sig in (signal.SIGTERM, signal.SIGHUP, signal.SIGINT):
            signal.signal(sig, signal.SIG_IGN)
        if process is not None:
            process.close_release()
            try:
                if reason is not None or process.poll() is None or session_members(process.pid):
                    stop_session(process, deadline, grace)
            except BaseException as error:
                cleanup = "cleanup " + type(error).__name__ + ": " + str(error)
                reason = cleanup if reason is None else reason + "; " + cleanup
            returncode = process.returncode
        if watchdog is not None:
            try:
                if process.poll() is None or session_members(process.pid):
                    raise RuntimeError("cannot disarm deadline watcher with live workload")
                watchdog_code = finish_watchdog(*watchdog, deadline)
                if watchdog_code != 0:
                    raise RuntimeError("deadline watcher exited " + str(watchdog_code))
            except BaseException as error:
                cleanup = "watchdog " + type(error).__name__ + ": " + str(error)
                reason = cleanup if reason is None else reason + "; " + cleanup
        try:
            if process is not None and process.poll() is not None and not session_members(process.pid):
                process.reap()
        except BaseException as error:
            cleanup = "reap " + type(error).__name__ + ": " + str(error)
            reason = cleanup if reason is None else reason + "; " + cleanup
        result = {
            "success": reason is None and returncode == 0,
            "returncode": returncode, "reason": reason,
            "owned_session": None if process is None else process.pid,
            "watchdog_pid": None if watchdog is None else watchdog[0],
            "elapsed_seconds": time.monotonic() - started,
            "observed_max_session_rss_bytes": max_rss,
            "observed_max_root_apparent_bytes": max_root,
            "sampling_note": "one second plus scan time; RSS/disk/XML/log are stop thresholds, not kernel hard limits",
        }
        write_new(record.with_suffix(".result.json"), result)
    print(json.dumps(result))
    return 0 if result["success"] else 1


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("usage: bounded_step.py REQUEST.json exact-step-id")
    sys.exit(run_step(sys.argv[1], sys.argv[2]))
