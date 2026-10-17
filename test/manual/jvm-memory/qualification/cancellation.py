# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Cooperative catchable cancellation; never throw from a signal handler.

This protects Python launch/cleanup critical sections from asynchronous raises.
It cannot contain SIGKILL, a dead interpreter, or a native Popen that never returns;
those require an outer job owner with a descendant deadline/cleanup boundary.
"""
import signal


class Cancelled(RuntimeError):
    pass


class Cancellation:
    def __init__(self):
        self.signum = None
        self.previous = {}

    def request(self, signum, frame=None):
        # First signal wins. Repeated signals must not interrupt bounded cleanup.
        if self.signum is None:
            self.signum = signum

    def install(self):
        for signum in [signal.SIGTERM, signal.SIGHUP, signal.SIGINT]:
            self.previous[signum] = signal.signal(signum, self.request)

    def restore(self):
        for signum, handler in self.previous.items():
            signal.signal(signum, handler)
        self.previous.clear()

    def message(self):
        return None if self.signum is None else 'Cancellation requested: ' + signal.Signals(self.signum).name

    def check(self):
        if self.signum is not None:
            raise Cancelled(self.message())
