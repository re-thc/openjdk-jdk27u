#
# Copyright (c) 2026, Harry Chan. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#/

"""Absolute monotonic budget; watchdog starts only in the authorized driver CLI."""
import os
import signal
import threading
import time


class DeadlineExpired(RuntimeError):
    pass


class HardDeadline:
    def __init__(self, seconds, *, clock=None):
        self.clock = clock or time.monotonic
        self.start = self.clock()
        self.end = self.start + seconds
        self.expired = False
        self.process = None
        self.thread = None

    def check(self):
        if self.expired or self.clock() >= self.end:
            self.expired = True
            raise DeadlineExpired('Absolute monotonic deadline reached')

    def remaining(self):
        remaining = self.end - self.clock()
        if self.expired or remaining <= 0:
            self.expired = True
            raise DeadlineExpired('Absolute monotonic deadline reached')
        return remaining

    def track(self, process):
        self.process = process
        self.check()

    def untrack(self, process):
        if self.process is process:
            self.process = None

    def kill_owned(self):
        process = self.process
        if process is not None and process.poll() is None:
            try:
                os.killpg(process.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass

    def expire(self):
        self.expired = True
        try:
            self.kill_owned()
        finally:
            # No grace period, unbounded cleanup or file I/O after the hard cap.
            os._exit(124)

    def _watch(self):
        wake = threading.Event()
        while True:
            remaining = self.end - self.clock()
            if remaining <= 0:
                self.expire()
                return
            wake.wait(remaining)

    def start_watchdog(self):
        self.check()
        if self.thread is not None:
            raise RuntimeError('Watchdog already started')
        self.thread = threading.Thread(target=self._watch, daemon=True,
                                       name='validation-absolute-deadline')
        self.thread.start()
