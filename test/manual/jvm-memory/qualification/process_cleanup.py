# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Bounded Linux child ownership. Native/process operations run only on request.

The controller must enable subreaping before it starts any child. A scope records
existing children before launch, then owns new descendants, including orphans
adopted after a launcher exits or a descendant changes its process group/session.
"""
import os
from pathlib import Path
import signal
import sys
import time

CLEANUP_SECONDS = 2.0
BUILD_DRAIN_SECONDS = 6.0  # Scanner db266200; javac stop-file polling is 5000ms.


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

    def verify_support(self):
        """Admission-only syscall check on self, before launching any children."""
        if not (hasattr(os, 'pidfd_open') and hasattr(os, 'P_PIDFD')
                and hasattr(signal, 'pidfd_send_signal')):
            raise RuntimeError('Cleanup requires pidfd_open, P_PIDFD and pidfd_send_signal; no numeric fallback')
        fd = os.pidfd_open(self.parent, 0)
        try:
            signal.pidfd_send_signal(fd, 0, None, 0)  # Permission/support check, no signal delivered.
            try:
                os.waitid(os.P_PIDFD, fd, os.WEXITED | os.WNOHANG | os.WNOWAIT)
            except ChildProcessError:
                pass  # Self is not our child; kernel accepted P_PIDFD.
            else:
                raise RuntimeError('Unexpected self-child pidfd ownership result')
        finally:
            os.close(fd)

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

    def child_handle(self, pid, start):
        """Return a held pidfd only after kernel confirmation of direct ownership.

        A /proc start value alone is insufficient (PID reuse, including same-tick
        reuse). waitid(P_PIDFD, WNOWAIT) confirms that the descriptor's task is our
        direct child. Grandchildren are deliberately not signalled until killing
        their owned parent reparents them to this subreaper. After confirmation,
        any later exit/reap/reuse still leaves the pidfd bound to the original task.
        """
        try:
            fd = os.pidfd_open(pid, 0)
        except ProcessLookupError:
            return None
        try:
            if self.read(pid)['start'] != start:
                os.close(fd)
                return None
            os.waitid(os.P_PIDFD, fd, os.WEXITED | os.WNOHANG | os.WNOWAIT)
            return fd
        except (FileNotFoundError, ProcessLookupError, ChildProcessError):
            os.close(fd)
            return None
        except BaseException:
            os.close(fd)
            raise

    def kill(self, pid, start):
        fd = self.child_handle(pid, start)
        if fd is None:
            return
        try:
            signal.pidfd_send_signal(fd, signal.SIGKILL, None, 0)
        except ProcessLookupError:
            pass  # Bound task exited; this never targets a reused numeric PID.
        finally:
            os.close(fd)

    def reap(self, pid, start):
        fd = self.child_handle(pid, start)
        if fd is None:
            return
        try:
            os.waitid(os.P_PIDFD, fd, os.WEXITED | os.WNOHANG)
        except (ChildProcessError, ProcessLookupError):
            pass
        finally:
            os.close(fd)

    def no_children(self):
        # /proc enumeration alone can race a final fork/exit/reparent. This
        # non-reaping kernel query must report ECHILD before a top-level scope
        # or final campaign audit can claim there are no descendants.
        try:
            os.waitid(os.P_ALL, 0, os.WEXITED | os.WNOHANG | os.WNOWAIT)
        except ChildProcessError:
            return True
        return False  # Includes live children and exited, not-yet-reaped children.

    def describe(self, pid, start):
        """Read commands only for a kernel-confirmed child, through pinned procfs.

        Diagnostics do not authorize signalling. A proc directory descriptor
        prevents subsequent numeric PID reuse from redirecting these reads.
        """
        directory = os.open('/proc/%d' % pid, os.O_RDONLY | os.O_DIRECTORY)
        fd = None
        try:
            fd = self.child_handle(pid, start)
            if fd is None:
                return None  # A deeper child is diagnosed after adoption.
            stat_fd = os.open('stat', os.O_RDONLY, dir_fd=directory)
            with os.fdopen(stat_fd) as stream:
                raw = stream.read()
            if int(raw[raw.rfind(')') + 2:].split()[19]) != start:
                raise RuntimeError('Child changed during command diagnostics')
            command_fd = os.open('cmdline', os.O_RDONLY, dir_fd=directory)
            with os.fdopen(command_fd, 'rb') as stream:
                command = stream.read(16385)
            return {'pid': pid, 'start': start, 'uid': os.fstat(directory).st_uid,
                    'command': command[:16384].decode('utf-8', 'replace').rstrip('\0').split('\0'),
                    'command_truncated': len(command) > 16384,
                    'executable': os.readlink('exe', dir_fd=directory)}
        finally:
            if fd is not None:
                os.close(fd)
            os.close(directory)

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

    def drain(self, proc, hard_deadline, check, seconds=BUILD_DRAIN_SECONDS):
        """Successful builds only: observe natural shutdown without signals.

        This is Scanner's six-second post-build policy adapted to the shared
        pidfd backend. Late emptiness, cancellation and observation faults cannot
        pass. The caller always retains its separate bounded cleanup afterward.
        """
        backend = self.backend
        started = backend.now()
        end = min(hard_deadline, started + seconds)
        commands = {}
        row = {'complete': False, 'started_monotonic': started,
               'deadline_monotonic': end, 'seconds': seconds, 'commands': [],
               'errors': [], 'remaining': []}
        try:
            while True:
                check()
                if proc.poll() != 0:
                    raise RuntimeError('Natural drain requires successful build exit')
                remaining = self.owned(backend.snapshot())
                for pid, item in remaining.items():
                    if item['state'] not in ('Z', 'X') and (pid, item['start']) not in commands:
                        try:
                            detail = backend.describe(pid, item['start'])
                        except (FileNotFoundError, ProcessLookupError):
                            detail = None  # Exited while observing; still audit custody.
                        if detail is not None:
                            commands[pid, item['start']] = detail
                    if pid != proc.pid:
                        backend.reap(pid, item['start'])
                empty = not self.owned(backend.snapshot()) and (bool(self.outside) or backend.no_children())
                now = backend.now()
                row['observed_monotonic'] = now
                row['remaining'] = [{'pid': p, **v} for p, v in sorted(remaining.items())]
                if now > end:
                    raise RuntimeError('Natural build drain deadline missed')
                if empty:
                    row['complete'] = True
                    row['remaining'] = []
                    break
                if now >= end:
                    raise RuntimeError('Persistent child after natural build drain')
                backend.pause(min(.05, end - now))
        except Exception as exc:
            row['errors'].append(repr(exc))
        row['commands'] = list(commands.values())
        return row

    def close(self, proc, hard_deadline, cleanup_seconds=CLEANUP_SECONDS):
        """Always called, even after exit 0. Never waits without a finite cap.

        A live leftover after the launcher has exited is inconclusive even if
        cleanup kills it. Zombies are reaped and are not credited as live work.
        If the time cap is already exhausted, make one nonblocking kill/reap
        attempt, return unresolved identities and never claim successful cleanup.
        """
        backend = self.backend
        # The independent outer owner reserves a larger fixed window for
        # successive adoption layers. Both callers retain one absolute cap.
        end = min(hard_deadline, backend.now() + cleanup_seconds)
        seen = set()
        live_leftovers = set()
        errors = []
        commands = {}
        remaining = {}
        kernel_children = False
        while True:
            try:
                code = None if proc is None else proc.poll()  # Nonblocking root reap.
                remaining = self.owned(backend.snapshot())
                kernel_children = not self.outside and not backend.no_children()
                if not remaining and not kernel_children:
                    return {'complete': True, 'seen_pids': sorted(seen),
                            'descendant_commands': list(commands.values()),
                            'live_descendants_after_launcher_exit': sorted(live_leftovers),
                            'remaining': [], 'errors': errors}
                for pid, row in remaining.items():
                    seen.add(pid)
                    if row['state'] not in ('Z', 'X'):
                        if proc is not None and code is not None and pid != proc.pid:
                            live_leftovers.add(pid)
                for pid, row in remaining.items():
                    if row['state'] not in ('Z', 'X'):
                        if (pid, row['start']) not in commands:
                            try:
                                detail = backend.describe(pid, row['start'])
                                if detail is not None:
                                    commands[pid, row['start']] = detail
                            except (FileNotFoundError, ProcessLookupError):
                                pass
                            except Exception as exc:
                                errors.append('Child command diagnostics: ' + repr(exc))
                        backend.kill(pid, row['start'])
                for pid, row in remaining.items():
                    if proc is None or pid != proc.pid:
                        backend.reap(pid, row['start'])
                if proc is not None:
                    proc.poll()
                remaining = self.owned(backend.snapshot())
                kernel_children = not self.outside and not backend.no_children()
                if not remaining and not kernel_children:
                    return {'complete': True, 'seen_pids': sorted(seen),
                            'descendant_commands': list(commands.values()),
                            'live_descendants_after_launcher_exit': sorted(live_leftovers),
                            'remaining': [], 'errors': errors}
            except Exception as exc:
                errors.append(repr(exc))
                # An unreadable ownership snapshot must never become empty.
                return {'complete': False, 'seen_pids': sorted(seen),
                        'descendant_commands': list(commands.values()),
                        'live_descendants_after_launcher_exit': sorted(live_leftovers),
                        'remaining': [{'pid': pid, **row} for pid, row in sorted(remaining.items())],
                        'errors': errors}
            left = end - backend.now()
            if left <= 0:
                return {'complete': False, 'seen_pids': sorted(seen),
                        'descendant_commands': list(commands.values()),
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
