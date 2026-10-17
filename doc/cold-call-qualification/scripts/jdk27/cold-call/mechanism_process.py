#!/usr/bin/env python3
"""Deadline and owned-process mechanics for the separate no-timing campaign.

This module imports no historical campaign and has no campaign CLI. Callers
provide the separately approved, absolute two-hour interval and host probe.
Only explicit argv vectors are executed, with shell=False and private sessions.
"""
from datetime import datetime, timedelta, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import subprocess
import time


class Failure(RuntimeError):
    pass


def _require(condition, message):
    if not condition:
        raise Failure(message)


def _seconds(value, name):
    _require(type(value) in (int, float) and math.isfinite(value) and value > 0,
             "Invalid positive seconds: " + name)
    return float(value)


def _deadline(value, name):
    _require(type(value) in (int, float) and math.isfinite(value),
             "Invalid absolute monotonic deadline: " + name)
    return float(value)


def _utc(value):
    _require(isinstance(value, str), "Approval timestamps must be UTC strings")
    try:
        result = datetime.fromisoformat(value.replace("Z", "+00:00"))
    except ValueError as error:
        raise Failure("Invalid approval UTC timestamp") from error
    _require(result.tzinfo is not None and result.utcoffset() == timedelta(0),
             "Approval timestamps must be aware UTC")
    return result


class Clock:
    """Use the smaller of immutable UTC and locally anchored monotonic limits."""
    def __init__(self, approval, utc_now=None, monotonic=None):
        self._utc_now = utc_now or (lambda: datetime.now(timezone.utc))
        self._monotonic = monotonic or time.monotonic
        _require(isinstance(approval, dict), "Approval must be an object")
        self.started_utc = _utc(approval.get("started_utc"))
        self.deadline_utc = _utc(approval.get("deadline_utc"))
        _require(self.deadline_utc - self.started_utc == timedelta(seconds=7200),
                 "Approval must retain exactly the original two-hour interval")
        now = self._now()
        _require(self.started_utc <= now < self.deadline_utc,
                 "Approval start is in the future or its deadline has expired")
        self.started_monotonic = self._monotonic()
        self.deadline_monotonic = self.started_monotonic + (self.deadline_utc - now).total_seconds()
        self.require_open()

    def _now(self):
        result = self._utc_now()
        _require(isinstance(result, datetime) and result.tzinfo is not None and
                 result.utcoffset() == timedelta(0), "Current clock must be aware UTC")
        return result

    def remaining(self, reserve=60):
        _require(type(reserve) in (int, float) and math.isfinite(reserve) and reserve >= 0,
                 "Invalid cleanup reserve")
        return min(self.deadline_monotonic - self._monotonic(),
                   (self.deadline_utc - self._now()).total_seconds()) - reserve

    def now_monotonic(self):
        return self._monotonic()

    def require_open(self):
        remaining = self.remaining()
        _require(remaining > 0, "Absolute approval deadline reached its cleanup reserve")
        return remaining

    def record(self):
        return dict(started_utc=self.started_utc.isoformat(), deadline_utc=self.deadline_utc.isoformat(),
                    observed_utc=self._now().isoformat(), deadline_monotonic=self.deadline_monotonic,
                    remaining_seconds=self.remaining(), cleanup_reserve_seconds=60)


def _identity(pid):
    """PID, process group, session and start ticks; comm may contain spaces/)."""
    data = Path("/proc", str(pid), "stat").read_text()
    head, separator, rest = data.rpartition(")")
    _require(separator and head.split(" ", 1)[0] == str(pid), "Malformed owned process identity")
    fields = rest.split()
    _require(len(fields) > 19, "Incomplete owned process identity")
    return (pid, int(fields[2]), int(fields[3]), int(fields[19]))


def _group_members(group):
    """Read-only group scan, separating live descendants from inert zombies."""
    live, zombies = [], []
    for path in Path("/proc").iterdir():
        if not path.name.isdecimal():
            continue
        try:
            fields = (path / "stat").read_text().rpartition(")")[2].split()
            if len(fields) > 3 and int(fields[2]) == group:
                (zombies if fields[0] in ("Z", "X") else live).append(int(path.name))
        except (FileNotFoundError, ProcessLookupError):
            continue
    return dict(live=sorted(live), zombies=sorted(zombies))


class _Owned:
    """Never reap the session leader until the final owned-group signal."""
    def __init__(self, process):
        self.process = process
        self.identity = None
        self.reaped = False
        self.ownership_lost = False
        self.event = None
        self.last_members = None
        self.error = None
        self.cleanup_deadline = None

    def establish(self):
        self.identity = _identity(self.process.pid)
        _require(self.identity[1:3] == (self.process.pid, self.process.pid),
                 "Child did not establish its private session/group")
        self.observe()

    def observe(self):
        try:
            _require(not self.reaped and not self.ownership_lost and self.identity is not None and
                     self.process.returncode is None and _identity(self.process.pid) == self.identity,
                     "Owned process identity/anchor changed; group signalling forbidden")
            event = os.waitid(os.P_PID, self.process.pid, os.WEXITED | os.WNOWAIT | os.WNOHANG)
            _require(event is None or event.si_pid == self.process.pid, "Owned wait identity changed")
        except (ChildProcessError, FileNotFoundError, ProcessLookupError, Failure) as error:
            self.ownership_lost = True
            self.error = str(error)
            raise Failure("Lost owned-child anchor; no group signal is permitted") from error
        self.event = event
        return event

    def send(self, sig):
        self.observe()
        try:
            os.killpg(self.process.pid, sig)
        except ProcessLookupError:
            pass

    def reap(self):
        _require(self.observe() is not None, "Owned leader is not ready for nonblocking reap")
        # Signal callbacks must not run between releasing the anchor and marking
        # its receipt. No caller may signal this group after this point.
        previous = signal.pthread_sigmask(signal.SIG_BLOCK, {signal.SIGINT, signal.SIGTERM, signal.SIGALRM})
        try:
            pid, status = os.waitpid(self.process.pid, os.WNOHANG)
            _require(pid == self.process.pid, "Owned leader nonblocking reap did not complete")
            self.reaped = True
            self.process.returncode = os.waitstatus_to_exitcode(status)
            return self.process.returncode
        except ChildProcessError as error:
            self.ownership_lost = True
            self.error = str(error)
            raise Failure("Owned leader was externally reaped") from error
        finally:
            signal.pthread_sigmask(signal.SIG_SETMASK, previous)


class Executor:
    """Serial commands, registered output, host checks and bounded owned cleanup."""
    def __init__(self, output, clock, env, host_probe):
        self.output = Path(output).resolve()
        self.clock = clock
        self.env = dict(env)
        _require(all(isinstance(k, str) and isinstance(v, str) for k, v in self.env.items()),
                 "Environment must contain string pairs")
        _require(callable(host_probe), "A read-only host probe is required")
        self.host_probe = host_probe
        self.records = []
        self._names = set()
        self._phases = set()
        self._owned = []
        self._phase = None
        self._phase_deadline = None
        self._cancelled = None
        self._launching = False
        self._cleaning = False
        self._running = False
        self._closed = False
        self._failed = False
        self._cleanup = None
        self._work_deadline = None
        self._close_deadline = None
        self._cleanup_constraint = None
        self.host_snapshots = []
        self.clock.require_open()
        self._host_check(initial=True)
        self.output.mkdir(parents=True, exist_ok=True)

    def cancel_signal(self, signum):
        """Defer cancellation through Popen handoff and cleanup critical regions."""
        self._cancelled = int(signum)
        self._failed = True
        if not self._launching and not self._cleaning:
            raise Failure("Owner cancellation signal " + str(signum))

    def _check_cancel(self):
        _require(self._cancelled is None, "Owner cancellation signal " + str(self._cancelled))

    def _host_check(self, initial=False):
        try:
            try:
                snapshot = self.host_probe()
            except BaseException as error:
                raise Failure("Host readiness probe failed (" + type(error).__name__ + "): " + str(error)) from error
            _require(isinstance(snapshot, dict), "Host readiness probe did not return an object")
            for key in ("pid1_zombies", "available_process_slots"):
                _require(type(snapshot.get(key)) is int and snapshot[key] >= 0, "Invalid host counter: " + key)
            self.host_snapshots.append(dict(snapshot))
            if initial:
                self.initial_zombies = snapshot["pid1_zombies"]
                _require(self.initial_zombies <= 32, "Unsafe initial PID 1 zombie count exceeds 32")
            _require(snapshot["pid1_zombies"] - self.initial_zombies <= 64,
                     "Unsafe PID 1 zombie growth exceeds 64")
            _require(snapshot["available_process_slots"] >= 4096,
                     "Unsafe ordinary process headroom is below 4096 slots")
            return snapshot
        except BaseException:
            self._failed = True
            raise

    def _io_check(self, deadline, cleanup=False):
        if cleanup:
            _require(self.clock.remaining(0) > 0, "Outer deadline exhausted during cleanup evidence")
            if self._cleanup_constraint is not None:
                deadline = (self._cleanup_constraint if deadline is None else
                            min(deadline, self._cleanup_constraint))
        else:
            self.clock.require_open()
        if deadline is not None:
            _require(self.clock._monotonic() < deadline,
                     "Command/phase/role cap exhausted during evidence processing" if not cleanup else
                     "Shared cleanup deadline exhausted during evidence processing")

    def _write_json(self, path, data, deadline=None, cleanup=False):
        """Bound incremental encoding/writes; never publish a partial receipt."""
        self._io_check(deadline, cleanup)
        path = Path(path)
        temporary = path.with_name(path.name + ".tmp")
        encoder = json.JSONEncoder(indent=2)
        with temporary.open("w") as handle:
            for chunk in encoder.iterencode(data):
                self._io_check(deadline, cleanup)
                handle.write(chunk)
                self._io_check(deadline, cleanup)
            handle.write("\n")
            self._io_check(deadline, cleanup)
        self._io_check(deadline, cleanup)
        temporary.replace(path)
        self._io_check(deadline, cleanup)

    def _hash_file(self, path, deadline):
        digest = hashlib.sha256()
        with Path(path).open("rb") as handle:
            while True:
                self._io_check(deadline)
                chunk = handle.read(1 << 20)
                self._io_check(deadline)
                if not chunk:
                    break
                digest.update(chunk)
                self._io_check(deadline)
        return digest.hexdigest()

    def _save(self, deadline=None, cleanup=False):
        deadline = self._work_deadline if deadline is None and not cleanup else deadline
        self._io_check(deadline, cleanup)
        data = dict(clock=self.clock.record(), records=self.records, host_snapshots=self.host_snapshots,
                    cancelled_signal=self._cancelled)
        self._write_json(self.output / "process-receipt.json", data, deadline, cleanup)

    def start_phase(self, name, cap, absolute_deadline=None):
        self._check_cancel()
        _require(not self._closed and not self._failed and not self._running,
                 "Executor is closed, failed or already running")
        self.clock.require_open()
        _require(isinstance(name, str) and re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]*", name),
                 "Invalid phase name")
        _require(name not in self._phases, "Phase cannot be repeated: " + name)
        now = self.clock._monotonic()
        deadline = now + _seconds(cap, "phase cap")
        if absolute_deadline is not None:
            deadline = min(deadline, _deadline(absolute_deadline, "phase"))
        _require(deadline > now, "Absolute phase cap exhausted before entry")
        self._phases.add(name)
        self._phase = name
        self._phase_deadline = deadline

    def _cleanup_one(self, owned, deadline):
        if owned.reaped:
            return
        # A later close() cannot grant a failed cleanup another sixty seconds.
        owned.cleanup_deadline = deadline if owned.cleanup_deadline is None else min(deadline, owned.cleanup_deadline)
        self._cleaning = True
        final_signal_sent = False
        try:
            # Even successful commands can leave background descendants. Keep
            # the WNOWAIT leader anchor until TERM/KILL and group inspection end.
            owned.send(signal.SIGTERM)
            grace = min(owned.cleanup_deadline, self.clock._monotonic() + 3.0)
            while True:
                owned.observe()
                owned.last_members = _group_members(owned.process.pid)
                if not owned.last_members["live"]:
                    break
                if self.clock._monotonic() >= min(grace, owned.cleanup_deadline) or self.clock.remaining(0) <= 0:
                    break
                time.sleep(min(0.1, max(0.0, min(grace, owned.cleanup_deadline) - self.clock._monotonic()),
                               max(0.0, self.clock.remaining(0))))
            # Finish group signalling while the WNOWAIT session leader still
            # pins the group identity, even when TERM already removed all live
            # members. Reaping is strictly after this final signal.
            owned.send(signal.SIGKILL)
            final_signal_sent = True
            while True:
                event = owned.observe()
                owned.last_members = _group_members(owned.process.pid)
                if event is not None and not owned.last_members["live"]:
                    owned.reap()
                    break
                _require(self.clock._monotonic() < owned.cleanup_deadline and self.clock.remaining(0) > 0,
                         "Owned cleanup exhausted its bounded absolute-deadline allowance")
                time.sleep(min(0.1, max(0.0, owned.cleanup_deadline - self.clock._monotonic()),
                               max(0.0, self.clock.remaining(0))))
        except BaseException as error:
            owned.error = type(error).__name__ + ": " + str(error)
            # An exception in scanning or grace waiting must not skip the final
            # signal. send() revalidates the held identity and refuses any
            # signal if an external waiter or PID reuse invalidated it.
            if not final_signal_sent and not owned.reaped:
                try:
                    owned.send(signal.SIGKILL)
                except BaseException as final_error:
                    owned.error += "; final signal: " + type(final_error).__name__ + ": " + str(final_error)
            raise Failure("Owned cleanup interrupted: " + owned.error) from error
        finally:
            self._cleaning = False

    def constrain_cleanup_deadline(self, absolute):
        """Pin first-expiry cleanup before any deferred launch handoff finishes."""
        absolute = _deadline(absolute, "shared cleanup")
        self._cleanup_constraint = (absolute if self._cleanup_constraint is None else
                                    min(absolute, self._cleanup_constraint))
        if self._close_deadline is not None:
            self._close_deadline = min(self._close_deadline, self._cleanup_constraint)
        # A watchdog can tighten the bound while a cleanup loop is running.
        # Its loops read this same field rather than an obsolete local copy.
        for owned in self._owned:
            if owned.cleanup_deadline is not None:
                owned.cleanup_deadline = min(owned.cleanup_deadline, self._cleanup_constraint)

    def _cleanup_deadline(self):
        deadline = self.clock._monotonic() + min(60.0, max(0.0, self.clock.remaining(0)))
        return min(deadline, self._cleanup_constraint) if self._cleanup_constraint is not None else deadline

    def run(self, name, argv, cwd, cap, role_remaining=None, role_deadline=None):
        try:
            return self._run(name, argv, cwd, cap, role_remaining, role_deadline)
        except BaseException as error:
            # Include prelaunch host/validation errors and exceptional receipt
            # writes: a caught failure cannot reopen this executor for work.
            self._failed = True
            if isinstance(error, Failure):
                raise
            raise Failure("Executor failed (" + type(error).__name__ + "): " + str(error)) from error

    def _run(self, name, argv, cwd, cap, role_remaining=None, role_deadline=None):
        self._check_cancel()
        _require(not self._closed and not self._failed and not self._running and self._phase is not None,
                 "An open idle executor and a phase are required")
        remaining = self.clock.require_open()
        _require(isinstance(name, str) and re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]*", name),
                 "Invalid command name")
        _require(name not in self._names, "Command cannot be repeated: " + name)
        _require(isinstance(argv, (list, tuple)) and argv and
                 all(isinstance(s, str) and s and "\0" not in s for s in argv), "Explicit argv required")
        cwd = Path(cwd).resolve(strict=True)
        _require(cwd.is_dir(), "Command working directory is not a directory")
        now = self.clock._monotonic()
        budget = min(_seconds(cap, "command cap"), remaining, self._phase_deadline - now)
        if role_remaining is not None:
            budget = min(budget, _seconds(role_remaining, "remaining role cap"))
        # Readiness and receipt writes consume this same allowance. Anchoring
        # after them would silently return their elapsed time to role/phase caps.
        deadline = now + budget
        if role_deadline is not None:
            deadline = min(deadline, _deadline(role_deadline, "role"))
        budget = deadline - now
        _require(budget > 0, "Phase, command or role budget exhausted before launch")
        self._work_deadline = deadline
        self._host_check()
        self._names.add(name)
        record = dict(name=name, phase=self._phase, argv=list(argv), cwd=str(cwd),
                      stdout_path=str(self.output / (name + ".stdout.log")),
                      stderr_path=str(self.output / (name + ".stderr.log")),
                      status="registered", exit_code=None, wall_seconds=0.0,
                      cap_seconds=budget, budget_started_monotonic=now,
                      deadline_monotonic=deadline, clock=self.clock.record())
        self.records.append(record)
        self._save()  # Both log identities and command are registered before launch.
        started = now
        self._running = True
        owned = None
        problem = None
        try:
            with Path(record["stdout_path"]).open("xb") as stdout, Path(record["stderr_path"]).open("xb") as stderr:
                self._check_cancel()
                self.clock.require_open()
                record["remaining_launch_seconds"] = deadline - self.clock._monotonic()
                _require(record["remaining_launch_seconds"] > 0,
                         "Command/phase/role cap exhausted before launch: " + name)
                self._launching = True
                try:
                    process = subprocess.Popen(list(argv), cwd=str(cwd), env=self.env, stdin=subprocess.DEVNULL,
                                               stdout=stdout, stderr=stderr, start_new_session=True, shell=False)
                    owned = _Owned(process)
                    self._owned.append(owned)  # Cancellation cannot escape before registration.
                    record.update(pid=process.pid, status="running")
                    owned.establish()
                    record["owned_identity"] = list(owned.identity)
                    self._save()
                finally:
                    self._launching = False
                self._check_cancel()  # Includes cancellation delivered during Popen handoff.
                next_probe = self.clock._monotonic()
                while True:
                    self._check_cancel()
                    self.clock.require_open()
                    _require(self.clock._monotonic() < deadline, "Command/phase/role cap exhausted: " + name)
                    if self.clock._monotonic() >= next_probe:
                        self._host_check()
                        next_probe = self.clock._monotonic() + 5.0
                    event = owned.observe()
                    if event is not None:
                        record["exit_code"] = event.si_status if event.si_code == os.CLD_EXITED else -event.si_status
                        break
                    time.sleep(min(0.1, max(0.0, deadline - self.clock._monotonic()),
                                   max(0.0, next_probe - self.clock._monotonic()),
                                   max(0.0, self.clock.remaining())))
        except BaseException as error:
            problem = error if isinstance(error, Failure) else Failure(
                "Command launch/execution failed (" + type(error).__name__ + "): " + str(error))
        finally:
            if owned is not None:
                try:
                    self._cleanup_one(owned, self._cleanup_deadline())
                    if record["exit_code"] is None:
                        record["exit_code"] = owned.process.returncode
                except BaseException as error:
                    problem = Failure("Owned cleanup incomplete: " + str(error))
                record["cleanup"] = dict(reaped=owned.reaped, ownership_lost=owned.ownership_lost,
                                          members=owned.last_members, error=owned.error,
                                          deadline_monotonic=owned.cleanup_deadline)
            self._running = False
            record["wall_seconds"] = self.clock._monotonic() - started
            evidence_error = None
            try:
                for stream in ("stdout", "stderr"):
                    path = Path(record[stream + "_path"])
                    if path.is_file():
                        record[stream + "_sha256"] = self._hash_file(path, deadline)
            except BaseException as error:
                evidence_error = type(error).__name__ + ": " + str(error)
                problem = Failure((str(problem) + "; " if problem is not None else "") +
                                  "Log evidence incomplete: " + evidence_error)
            record["wall_seconds"] = self.clock._monotonic() - started
            if problem is None and record["exit_code"] != 0:
                problem = Failure("Command failed without retry: " + name)
            if problem is None and self._cancelled is not None:
                problem = Failure("Owner cancellation signal " + str(self._cancelled))
            record["status"] = "failed" if problem is not None else "finished"
            if problem is not None:
                record["failure"] = str(problem)
                self._failed = True
            if evidence_error is None:
                try:
                    self._save()
                except BaseException as error:
                    problem = Failure((str(problem) + "; " if problem is not None else "") +
                                      "Command receipt incomplete (" + type(error).__name__ + "): " + str(error))
                    record["status"] = "failed"
                    record["failure"] = str(problem)
                    self._failed = True
        if problem is not None:
            raise problem
        return record

    def close(self):
        if self._cleanup is not None:
            return self._cleanup
        self._closed = True
        started = self.clock._monotonic()
        errors = []
        if self._close_deadline is None:
            self._close_deadline = self._cleanup_deadline()
            pending = [o.cleanup_deadline for o in self._owned
                       if not o.reaped and o.cleanup_deadline is not None]
            if pending:
                self._close_deadline = min(self._close_deadline, *pending)
        deadline = self._close_deadline
        for owned in self._owned:
            if owned.reaped or owned.ownership_lost:
                continue
            try:
                self._cleanup_one(owned, deadline)
            except BaseException as error:
                errors.append(type(error).__name__ + ": " + str(error))
        deadline = self._close_deadline  # A watchdog may have tightened it during owned cleanup.
        self._cleanup = dict(direct_children_reaped=all(o.reaped for o in self._owned),
                             direct_children_count=len(self._owned),
                             direct_children_reaped_count=sum(o.reaped for o in self._owned),
                             active_groups=[dict(pgid=o.process.pid, ownership_lost=o.ownership_lost,
                                                 members=o.last_members, error=o.error)
                                            for o in self._owned if not o.reaped],
                             errors=errors, elapsed_seconds=self.clock._monotonic() - started,
                             cancelled_signal=self._cancelled,
                             deadline_monotonic=deadline,
                             clock=self.clock.record())
        self._cleanup["failed"] = bool(errors or self._cleanup["active_groups"] or
                                        not self._cleanup["direct_children_reaped"] or
                                        self._cleanup["elapsed_seconds"] > 60 or self.clock.remaining(0) < 0)
        try:
            self._write_json(self.output / "cleanup-receipt.json", self._cleanup, deadline, cleanup=True)
            self._save(deadline=deadline, cleanup=True)
        except BaseException as error:
            self._cleanup["failed"] = True
            self._cleanup["errors"].append("Cleanup evidence incomplete (" + type(error).__name__ + "): " + str(error))
            self._failed = True
        self._cleanup["elapsed_seconds"] = self.clock._monotonic() - started
        return self._cleanup
