#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Independent unprivileged Linux owner for exactly one qualification attempt.

No campaign starts without --execute. The separate supervisor covers inner
controller death while it survives; its own uncatchable death is not contained.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import signal
import sys

from cancellation import Cancellation
from process_cleanup import (ChildScope, LinuxProcesses, cleanup_errors,
                             enable_subreaper, require_no_children)

HERE = Path(__file__).resolve().parent
MAX_SECONDS = 36000
CLEANUP_SECONDS = 30
REPORT_SECONDS = 5
POLL_SECONDS = .05


class ForkChild:
    """One directly owned fork child; monitor/reap only through its held pidfd."""
    def __init__(self, pid, backend):
        self.pid = pid
        self.returncode = None
        self.fd = backend.child_handle(pid, backend.read(pid)['start'])
        if self.fd is None:
            raise RuntimeError('Cannot bind the controller child pidfd')

    def poll(self):
        if self.returncode is None:
            info = os.waitid(os.P_PIDFD, self.fd, os.WEXITED | os.WNOHANG)
            if info is not None:
                if info.si_code == os.CLD_EXITED:
                    self.returncode = info.si_status
                elif info.si_code in (os.CLD_KILLED, os.CLD_DUMPED):
                    self.returncode = -info.si_status
                else:
                    raise RuntimeError('Unexpected controller wait status')
        return self.returncode

    def close(self):
        os.close(self.fd)


def fork_controller(argv, backend, stdout_fd, stderr_fd):
    """No parent-side exec/error-pipe handshake can stall the deadline loop.

    The owner is single-threaded. Even a partial launch/bind failure is cleaned
    by its pre-existing ChildScope, without requiring a returned root object.
    """
    pid = os.fork()
    if pid == 0:
        try:
            os.setsid()
            with open(os.devnull, 'rb') as null:
                os.dup2(null.fileno(), 0)
            os.dup2(stdout_fd, 1)
            os.dup2(stderr_fd, 2)
            os.execv(argv[0], argv)
        except BaseException:
            # Fixed small diagnostic: no inherited handlers or Python teardown.
            try:
                os.write(2, b'Qualification controller exec failed\n')
            finally:
                os._exit(127)
    return ForkChild(pid, backend)


class Supervisor:
    """Lifecycle policy; injectable native boundary for deterministic offline tests."""
    def __init__(self, backend, cancellation, launch, record,
                 seconds=MAX_SECONDS, cleanup_seconds=CLEANUP_SECONDS,
                 report_seconds=REPORT_SECONDS):
        if not (0 < cleanup_seconds and 0 < report_seconds
                and cleanup_seconds + report_seconds < seconds <= MAX_SECONDS):
            raise ValueError('Invalid supervisor deadline/reserves')
        self.backend = backend
        self.cancel = cancellation
        self.launch = launch
        self.record = record
        self.seconds = seconds
        self.cleanup_seconds = cleanup_seconds
        self.report_seconds = report_seconds

    def run(self, argv):
        backend = self.backend
        start = backend.now()
        deadline = start + self.seconds
        cleanup_end = deadline - self.report_seconds
        run_end = cleanup_end - self.cleanup_seconds
        row = {'status': 'RUNNING', 'argv': list(map(str, argv)),
               'start_monotonic': start, 'hard_deadline_monotonic': deadline,
               'run_cutoff_monotonic': run_end,
               'cleanup_deadline_monotonic': cleanup_end,
               'cleanup_seconds': self.cleanup_seconds,
               'supervisor_pid': backend.parent, 'controller_pid': None,
               'supervisor_uncatchable_death_contained': False,
               'trigger': None, 'errors': []}
        proc = None
        scope = None
        try:
            require_no_children(backend)
            scope = ChildScope(backend, protect_existing=False)
            self.record(row)
            if self.cancel.signum is not None:
                row['trigger'] = 'cancellation'
            elif backend.now() >= run_end:
                row['trigger'] = 'deadline'
            else:
                proc = self.launch(argv)
                row['controller_pid'] = proc.pid
                # Handlers only latch: assignment completes even if a signal
                # arrived inside fork/binding. Unknown partial births remain
                # covered by scope.close(None, ...) if launch raised instead.
                while True:
                    if self.cancel.signum is not None:
                        row['trigger'] = 'cancellation'
                        break
                    if backend.now() >= run_end:
                        row['trigger'] = 'deadline'
                        break
                    if proc.poll() is not None:
                        row['trigger'] = 'controller-exit'
                        break
                    backend.pause(max(0, min(POLL_SECONDS, run_end - backend.now())))
        except BaseException as exc:
            row['trigger'] = 'error'
            row['errors'].append(repr(exc))
        finally:
            if scope is not None:
                try:
                    row['cleanup'] = scope.close(proc, cleanup_end, self.cleanup_seconds)
                    row['errors'].extend(cleanup_errors(row['cleanup']))
                except BaseException as exc:
                    row['errors'].append('Outer cleanup: ' + repr(exc))
            try:
                require_no_children(backend)
                row['final_child_audit'] = True
            except BaseException as exc:
                row['final_child_audit'] = False
                row['errors'].append('Final child audit: ' + repr(exc))
            if proc is not None:
                row['controller_exit'] = proc.returncode
                try:
                    proc.close()
                except BaseException as exc:
                    row['errors'].append('Controller pidfd close: ' + repr(exc))
            row['cancellation_signal'] = self.cancel.signum
            row['elapsed_seconds'] = backend.now() - start
            row['deadline_exceeded'] = backend.now() >= deadline
            if self.cancel.signum is not None:
                row['status'] = 'CANCELLED'
            elif row['trigger'] == 'deadline' or row['deadline_exceeded']:
                row['status'] = 'DEADLINE_EXCEEDED'
            elif row['errors']:
                row['status'] = 'HOLD'
            elif row.get('controller_exit') != 0:
                row['status'] = 'INNER_FAILED'
            else:
                row['status'] = 'COMPLETED'
            # Closure can never turn an inner failure or cancellation into GO.
            self.record(row)
            late_signal = self.cancel.signum is not None and row['cancellation_signal'] is None
            late_deadline = backend.now() >= deadline and not row['deadline_exceeded']
            if late_signal or late_deadline:
                row['cancellation_signal'] = self.cancel.signum
                row['deadline_exceeded'] = row['deadline_exceeded'] or late_deadline
                row['status'] = 'CANCELLED' if self.cancel.signum is not None else 'DEADLINE_EXCEEDED'
                row['errors'].append('Cancellation/deadline during owner receipt closure')
                self.record(row)
        return row


def save(path, row):
    temporary = path.with_suffix('.tmp')
    temporary.write_text(json.dumps(row, indent=2) + '\n')
    temporary.replace(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument('--execute', action='store_true')
    parser.add_argument('--owner-output', type=Path, required=True)
    parser.add_argument('campaign_args', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    if not args.execute:
        parser.error('Source review only; launch requires explicit execution release')
    forwarded = args.campaign_args
    if not forwarded or forwarded[0] != '--':
        parser.error('Use -- followed by the documented campaign arguments')
    forwarded = forwarded[1:]
    if any(a.split('=', 1)[0] in ('--execute', '--outer-owner-reference') for a in forwarded):
        parser.error('Supervisor supplies execution and owner-reference arguments')
    owner = args.owner_output.resolve()
    if owner.exists():
        parser.error('Refuse an existing owner output/attempt directory')
    backend = LinuxProcesses()
    cancellation = Cancellation()
    cancellation.install()
    previous_chld = signal.signal(signal.SIGCHLD, signal.SIG_DFL)
    try:
        if len(list(Path('/proc/self/task').iterdir())) != 1:
            raise RuntimeError('Outer fork owner must be single-threaded')
        backend.verify_support()
        enable_subreaper()
        require_no_children(backend)
        owner.mkdir()
        receipt = owner / 'owner.json'
        argv = [sys.executable, str(HERE / 'run.py'), '--execute',
                '--outer-owner-reference', str(receipt)] + forwarded
        hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in
                  [Path(__file__), HERE / 'process_cleanup.py', HERE / 'cancellation.py']}
        def record(row):
            save(receipt, {**row, 'owner_source_sha256': hashes})
        with (owner / 'controller.stdout').open('xb') as stdout, \
             (owner / 'controller.stderr').open('xb') as stderr:
            def launch(command):
                return fork_controller(command, backend, stdout.fileno(), stderr.fileno())
            row = Supervisor(backend, cancellation, launch, record).run(argv)
        print(json.dumps({'status': row['status'], 'owner_receipt': str(receipt)}))
        return 0 if row['status'] == 'COMPLETED' else 2
    finally:
        signal.signal(signal.SIGCHLD, previous_chld)
        cancellation.restore()


if __name__ == '__main__':
    sys.exit(main())
