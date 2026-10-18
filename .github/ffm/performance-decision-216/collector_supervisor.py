"""Linux collector ownership and bounded cleanup; inert on import.

Only this single-threaded observer's children are waited/signalled. The collector
is a session leader. Keep it unreaped as the process-group identity anchor during
group cleanup; subreaping also covers descendants leaving that group. After reap,
only individually owned children may be signalled. ECHILD proves final emptiness.
"""

import os
from pathlib import Path
import signal
import subprocess
import sys
import time


TERM_RESERVE_NS = 2_000_000_000
KILL_RESERVE_NS = 1_000_000_000
POLL_SECONDS = 0.02


class LinuxOwner:
    def __init__(self):
        import ctypes
        if sys.platform != "linux" or len(list(Path("/proc/self/task").iterdir())) != 1:
            raise ValueError("single-threaded Linux observer required")
        if signal.getsignal(signal.SIGCHLD) != signal.SIG_DFL or self.children():
            raise ValueError("default SIGCHLD and no preexisting observer children required")
        libc = ctypes.CDLL(None, use_errno=True)
        libc.prctl.argtypes = [ctypes.c_int] + [ctypes.c_ulong] * 4
        libc.prctl.restype = ctypes.c_int
        if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER, on this observer only
            raise OSError(ctypes.get_errno(), "cannot establish observer subreaper ownership")
        self.cancelled = False
        self.process = None
        self.leader_reaped = False
        self.handlers = {sig: signal.getsignal(sig) for sig in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP)}
        for sig in self.handlers:
            signal.signal(sig, self.cancel)

    def cancel(self, signum, frame):
        self.cancelled = True  # no asynchronous exception interrupting cleanup/receipts

    def close(self):
        for sig, handler in self.handlers.items():
            signal.signal(sig, handler)

    def children(self):
        children = {int(pid) for pid in Path(f"/proc/self/task/{os.getpid()}/children").read_text().split()}
        try:
            waitable = os.waitid(os.P_ALL, 0, os.WEXITED | os.WNOHANG | os.WNOWAIT)
            if waitable is not None:
                children.add(waitable.si_pid)
        except ChildProcessError:
            pass
        return children

    def start(self, command, cwd):
        self.process = subprocess.Popen(command, cwd=cwd, start_new_session=True)
        return self.process.pid

    def exited(self, pid):
        return os.waitid(os.P_PID, pid, os.WEXITED | os.WNOHANG | os.WNOWAIT) is not None

    def empty(self):
        try:
            os.waitid(os.P_ALL, 0, os.WEXITED | os.WNOHANG | os.WNOWAIT)
        except ChildProcessError:
            return True
        return False  # None also means there is an owned live child, not emptiness

    def signal_group(self, pid, sig):
        if self.leader_reaped or pid != self.process.pid:
            raise ValueError("cannot signal a process group after releasing its owned leader")
        if os.getpgid(pid) != pid or os.getsid(pid) != pid:
            raise ValueError("collector is not its owned session/group leader")
        os.killpg(pid, sig)

    def signal_child(self, pid, sig):
        # Success (including None for a live child) proves exact current child
        # ownership. No other thread/handler may reap and permit PID reuse.
        os.waitid(os.P_PID, pid, os.WEXITED | os.WNOHANG | os.WNOWAIT)
        os.kill(pid, sig)

    def reap(self, pid):
        waited, status = os.waitpid(pid, os.WNOHANG)
        if waited == 0:
            return None
        if waited != pid:
            raise ValueError("wait returned a different owned PID")
        code = os.waitstatus_to_exitcode(status)
        if pid == self.process.pid:
            self.process.returncode = code  # Popen must not later wait/reap this PID again
            self.leader_reaped = True
        return code


def supervise(command, cwd, deadline_ns, on_launch, *, deadline_update=None, owner=None,
              clock=time.monotonic_ns, pause=time.sleep):
    """One launch; TERM/KILL/nonblocking reaps all use the original deadline.

    Backend/clock injection is solely for offline tests. OS or filesystem stalls
    cannot be made a hard userspace guarantee; unresolved ownership stays pending.
    """
    if type(deadline_ns) is not int or clock() >= deadline_ns - TERM_RESERVE_NS:
        raise ValueError("original overall deadline leaves no collector cleanup reserve")
    owner = LinuxOwner() if owner is None else owner
    pid = None
    returned = returncode = None
    reason = None
    errors, signals, reaped = [], [], []
    pending, inventory_complete, empty = set(), False, False
    group_signalled, child_signalled = set(), set()
    cleanup_started = None
    cleanup_deadline = deadline_ns
    try:
        if owner.cancelled or clock() >= deadline_ns - TERM_RESERVE_NS:
            raise ValueError("cancelled or original cleanup reserve reached before collector launch")
        pid = owner.start(command, cwd)
        try:
            on_launch(pid)
        except Exception as failure:
            reason = "launch_receipt_failure"
            errors.append(type(failure).__name__ + ": " + str(failure))
        while True:
            if deadline_update is not None and reason is None:
                try:
                    updated = deadline_update(pid)
                    if updated is not None:
                        if type(updated) is not int or updated > deadline_ns:
                            raise ValueError("campaign observation must not extend supervision")
                        deadline_ns = updated
                        cleanup_deadline = min(cleanup_deadline, deadline_ns)
                except Exception as failure:
                    reason = "campaign_budget_observation_failure"
                    errors.append(type(failure).__name__ + ": " + str(failure))
            now = clock()
            if now > deadline_ns and reason is None:
                reason = "supervision_deadline_elapsed"
            try:
                pending = owner.children()
                inventory_complete = True
                exited = returncode is None and owner.exited(pid)
                if exited:
                    # Adoption may have happened after the preceding inventory.
                    pending = owner.children()
                descendants = pending - {pid}
                if owner.cancelled and reason is None:
                    reason = "observer_cancelled"
                if exited and not descendants:
                    returncode = owner.reap(pid)
                    if returncode is None:
                        raise ValueError("observed exited collector was not reaped")
                    returned = clock()
                    pending = owner.children()
                if returncode is not None:
                    empty = owner.empty()
                    if empty:
                        break
                    reason = reason or "remaining_owned_children"
                if descendants and reason is None:
                    reason = "adopted_descendants"
            except Exception as failure:
                inventory_complete = False
                reason = reason or "ownership_observation_failure"
                errors.append(type(failure).__name__ + ": " + str(failure))
            if reason is None:
                if owner.cancelled:
                    reason = "observer_cancelled"
                elif now >= deadline_ns - TERM_RESERVE_NS:
                    reason = "overall_deadline_reserve"
            if reason is not None:
                cleanup_started = now if cleanup_started is None else cleanup_started
                cleanup_deadline = min(deadline_ns, cleanup_started + TERM_RESERVE_NS)
                kill_at = cleanup_deadline - KILL_RESERVE_NS
                sig = signal.SIGKILL if now >= kill_at else signal.SIGTERM
                if returncode is None and sig not in group_signalled and clock() < cleanup_deadline:
                    try:
                        owner.signal_group(pid, sig)
                        signals.append(dict(target="owned_group", pid=pid, signal=int(sig)))
                    except Exception as failure:
                        errors.append(type(failure).__name__ + ": " + str(failure))
                    group_signalled.add(sig)
                if inventory_complete:
                    for child in sorted(pending - {pid}):
                        if clock() >= cleanup_deadline:
                            break
                        try:
                            code = owner.reap(child)
                            if code is not None:
                                reaped.append(dict(pid=child, returncode=code))
                                child_signalled.discard((child, signal.SIGTERM))
                                child_signalled.discard((child, signal.SIGKILL))
                                continue
                            if (child, sig) not in child_signalled:
                                if clock() >= cleanup_deadline:
                                    break
                                owner.signal_child(child, sig)
                                signals.append(dict(target="owned_child", pid=child, signal=int(sig)))
                                child_signalled.add((child, sig))
                        except Exception as failure:
                            errors.append(type(failure).__name__ + ": " + str(failure))
            if clock() >= cleanup_deadline:
                # Last nonblocking reap; no group signals are allowed after this.
                try:
                    if returncode is None:
                        returncode = owner.reap(pid)
                        if returncode is not None:
                            returned = clock()
                    pending = owner.children()
                    empty = owner.empty()
                    inventory_complete = True
                except Exception as failure:
                    inventory_complete = False
                    errors.append(type(failure).__name__ + ": " + str(failure))
                break
            boundary = cleanup_deadline if reason else deadline_ns - TERM_RESERVE_NS
            try:
                pause(max(0, min(POLL_SECONDS, (boundary - clock()) / 1_000_000_000)))
            except Exception as failure:
                reason = reason or "supervisor_poll_failure"
                errors.append(type(failure).__name__ + ": " + str(failure))
        observed = clock()
        if observed > deadline_ns:
            reason = reason or "supervision_deadline_elapsed"
        return dict(collector_pid=pid, process_return_code=returncode,
                    process_return_monotonic_ns=returned,
                    supervisor_cleanup_observed_monotonic_ns=observed,
                    supervisor_cleanup_complete=inventory_complete and empty and returncode is not None,
                    supervision_intervened=reason is not None, supervision_reason=reason,
                    supervision_deadline_ns=deadline_ns,
                    cleanup_deadline_ns=cleanup_deadline,
                    pending_owned_pids=sorted(pending), ownership_inventory_complete=inventory_complete,
                    owned_children_empty=empty,
                    signals=signals, reaped_adopted_children=reaped, supervision_errors=errors)
    finally:
        owner.close()
