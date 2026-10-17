# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Storage guards for every subprocess; timed probes stay outside child timing.

Untimed writers are polled at most once/second, including after stdout closes.
Measured fixed-input commands reserve their documented 256-MiB write allowance
at admission, have no in-interval filesystem probes, and are checked after exit.
This is not protection against unrelated writers exhausting the same filesystem.
"""
import shutil
import time

RESERVE = 1024**3
TIMED_ALLOWANCE = 256 * 1024**2


class StorageError(RuntimeError):
    pass


class StorageGuard:
    def __init__(self, paths, measured=False, usage=shutil.disk_usage, clock=time.monotonic):
        self.paths = list(dict.fromkeys(map(str, paths)))
        self.measured = measured
        self.usage = usage
        self.clock = clock
        self.before = None
        self.next_poll = None
        self.polls = 0

    def snapshot(self):
        return {path: self.usage(path).free for path in self.paths}

    @staticmethod
    def require_space(snapshot, allowance=0):
        for path, free in snapshot.items():
            if free <= RESERVE + allowance:
                raise StorageError('Storage reserve/admission failed: %s free=%d required>%d' %
                                   (path, free, RESERVE + allowance))

    def admit(self):
        self.before = self.snapshot()
        self.require_space(self.before, TIMED_ALLOWANCE if self.measured else 0)
        self.next_poll = self.clock() + 1

    def poll(self):
        if self.before is None:
            raise StorageError('Storage guard used without admission')
        if self.measured or self.clock() < self.next_poll:
            return
        self.next_poll = self.clock() + 1
        self.polls += 1
        self.require_space(self.snapshot())

    def finish(self):
        after = self.snapshot()
        self.require_space(after)
        if self.measured:
            for path in self.paths:
                if self.before[path] - after[path] > TIMED_ALLOWANCE:
                    raise StorageError('Timed write allowance exceeded, or concurrent disk writer: ' + path)
        return {'before_free_bytes': self.before, 'after_free_bytes': after,
                'active_storage_polls': self.polls,
                'policy': 'admit-reserved-check-after-exit' if self.measured else 'admit-poll-check-after-exit',
                'reserve_bytes': RESERVE,
                'timed_write_allowance_bytes': TIMED_ALLOWANCE if self.measured else None}
