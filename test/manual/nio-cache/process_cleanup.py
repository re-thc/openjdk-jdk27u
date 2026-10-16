# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Bounded Linux child ownership. Native/process operations run only on request.

The controller must enable subreaping before it starts any child. A scope records
existing children before launch, then owns new descendants, including orphans
adopted after a launcher exits or a descendant changes its process group/session.
"""
import errno
import os
from pathlib import Path
import signal
import sys
import time

CLEANUP_SECONDS = 2.0


def enable_subreaper():
    if sys.platform != 'linux':
        raise RuntimeError('This saved qualification environment requires Linux subreaping')
    import ctypes
    libc = ctypes.CDLL(None, use_errno=True)
    if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER
        raise OSError(ctypes.get_errno(), 'PR_SET_CHILD_SUBREAPER failed')
    enabled = ctypes.c_int()
    if libc.prctl(37, ctypes.byref(enabled), 0, 0, 0) != 0 or enabled.value != 1:
        raise RuntimeError('Cannot verify child-subreaper ownership')


def descendants(table, parent):
    found = set()
    pending = [parent]
    while pending:
        owner = pending.pop()
        for pid, row in table.items():
            if row['ppid'] == owner and pid not in found:
                found.add(pid)
                pending.append(pid)
    return found


class LinuxProcesses:
    def __init__(self):
        self.parent = os.getpid()

    def read(self, pid):
        raw = (Path('/proc') / str(pid) / 'stat').read_text()
        tail = raw[raw.rfind(')') + 2:].split()
        return {'ppid': int(tail[1]), 'start': int(tail[19]), 'state': tail[0],
                'pgrp': int(tail[2]), 'session': int(tail[3])}

    def snapshot(self):
        # Enumerate the root once. Path.glob('[0-9]*/stat') also scans each
        # process directory, which dominates cost on process-dense hosts.
        table = {}
        with os.scandir('/proc') as entries:
            for entry in entries:
                if not entry.name.isascii() or not entry.name.isdecimal():
                    continue
                pid = int(entry.name)
                try:
                    table[pid] = self.read(pid)
                except (FileNotFoundError, ProcessLookupError):
                    continue
        return table

    def kill(self, pid, start):
        # Revalidate only this owned identity immediately before signaling.
        try:
            current = self.read(pid)
            if current['start'] == start:
                os.kill(pid, signal.SIGKILL)
        except (FileNotFoundError, ProcessLookupError):
            pass

    def kill_group(self, group, owned):
        # Popen(start_new_session=True) isolates the coordinator and descendants.
        # A stable live owned member binds the original group even if its
        # leader has exited. Escaped descendants are still killed individually.
        for pid, row in owned.items():
            if row.get('pgrp') != group or row.get('session') != group:
                continue
            try:
                current = self.read(pid)
                if (current['start'] == row['start'] and current['pgrp'] == group
                        and current['session'] == group and current['state'] not in ('Z', 'X')):
                    os.killpg(group, signal.SIGKILL)
                    return True
            except (FileNotFoundError, ProcessLookupError):
                continue
        return False

    def reap(self, pid):
        try:
            os.waitpid(pid, os.WNOHANG)
        except ChildProcessError:
            pass  # Not yet reparented; a later scan either finds it or is empty.
        except OSError as exc:
            if exc.errno != errno.ESRCH:
                raise

    def no_children(self):
        # /proc enumeration alone can race a final fork/exit/reparent. This
        # non-reaping kernel query must report ECHILD before a top-level scope
        # or final campaign audit can claim there are no descendants.
        try:
            os.waitid(os.P_ALL, 0, os.WEXITED | os.WNOHANG | os.WNOWAIT)
        except ChildProcessError:
            return True
        return False  # Includes live children and exited, not-yet-reaped children.

    def now(self):
        return time.monotonic()

    def pause(self, seconds):
        time.sleep(seconds)


class ChildScope:
    def __init__(self, backend=None, protect_existing=True):
        self.backend = backend if backend is not None else LinuxProcesses()
        table = self.backend.snapshot()
        self.outside = ({(pid, table[pid]['start'])
                         for pid in descendants(table, self.backend.parent)}
                        if protect_existing else set())

    def owned(self, table):
        protected = {pid for pid, row in table.items() if (pid, row['start']) in self.outside}
        for pid in list(protected):
            protected.update(descendants(table, pid))
        return {pid: table[pid] for pid in descendants(table, self.backend.parent)
                if pid not in protected}

    def close(self, proc, hard_deadline):
        """Always called, even after exit 0. Never waits without a finite cap.

        A live leftover after the launcher has exited is inconclusive even if
        cleanup kills it. Zombies are reaped and are not credited as live work.
        If the time cap is already exhausted, make one nonblocking kill/reap
        attempt, return unresolved identities and never claim successful cleanup.
        """
        backend = self.backend
        end = min(hard_deadline, backend.now() + CLEANUP_SECONDS)
        seen = set()
        live_leftovers = set()
        errors = []
        remaining = {}
        kernel_children = False
        while True:
            try:
                code = None if proc is None else proc.poll()  # Nonblocking root reap.
                remaining = self.owned(backend.snapshot())
                kernel_children = not self.outside and not backend.no_children()
                if not remaining and not kernel_children:
                    return {'complete': True, 'seen_pids': sorted(seen),
                            'live_descendants_after_launcher_exit': sorted(live_leftovers),
                            'remaining': [], 'errors': errors}
                for pid, row in remaining.items():
                    seen.add(pid)
                    if row['state'] not in ('Z', 'X'):
                        if proc is not None and code is not None and pid != proc.pid:
                            live_leftovers.add(pid)
                if proc is not None:
                    backend.kill_group(proc.pid, remaining)
                for pid, row in remaining.items():
                    if row['state'] not in ('Z', 'X'):
                        backend.kill(pid, row['start'])
                for pid, row in remaining.items():
                    if proc is None or pid != proc.pid:
                        backend.reap(pid)
                if proc is not None:
                    proc.poll()
                remaining = self.owned(backend.snapshot())
                kernel_children = not self.outside and not backend.no_children()
                if not remaining and not kernel_children:
                    return {'complete': True, 'seen_pids': sorted(seen),
                            'live_descendants_after_launcher_exit': sorted(live_leftovers),
                            'remaining': [], 'errors': errors}
            except Exception as exc:
                errors.append(repr(exc))
                # An unreadable ownership snapshot must never become empty.
                return {'complete': False, 'seen_pids': sorted(seen),
                        'live_descendants_after_launcher_exit': sorted(live_leftovers),
                        'remaining': [{'pid': pid, **row} for pid, row in sorted(remaining.items())],
                        'errors': errors}
            left = end - backend.now()
            if left <= 0:
                return {'complete': False, 'seen_pids': sorted(seen),
                        'live_descendants_after_launcher_exit': sorted(live_leftovers),
                        'remaining': [{'pid': pid, **row} for pid, row in sorted(remaining.items())],
                        'errors': errors + ['Bounded cleanup deadline reached']
                                  + (['Kernel still reports owned children despite empty/partial process table']
                                     if kernel_children else [])}
            backend.pause(min(.01, left))


def require_no_children(backend=None):
    backend = backend if backend is not None else LinuxProcesses()
    remaining = descendants(backend.snapshot(), backend.parent)
    if remaining or not backend.no_children():
        raise RuntimeError('Controller child audit is not empty/known; enumerated PIDs: ' + repr(sorted(remaining)))


def cleanup_errors(receipt):
    errors = list(receipt['errors'])
    if not receipt['complete']:
        errors.append('Descendant cleanup incomplete; remaining identities recorded')
    if receipt['live_descendants_after_launcher_exit']:
        errors.append('Launcher exited with live descendants; cleaned result remains inconclusive')
    return errors
