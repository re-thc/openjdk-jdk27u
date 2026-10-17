"""Main-thread deadline watchdog for synchronous controller work on Linux.

The timer checks existing absolute clocks; it never creates another allowance.
Cooperative checks bound streaming I/O, while SIGALRM also interrupts CPU-bound
analysis that does not call back into the controller.
"""
import math
import signal
import time

from mechanism_process import Failure


class DeadlineExpired(Failure):
    pass


_active_guard = None


def deadline_check():
    if _active_guard is not None:
        _active_guard.check()


class DeadlineGuard:
    def __init__(self, remaining, hard_remaining=None, defer=None, work_check=None):
        self.remaining = remaining
        self.hard_remaining = hard_remaining or remaining
        self.defer = defer or (lambda: False)
        self.entered = False
        self.pending = False
        self.expired_at = None
        self.work_check = work_check
        self.pending_error = None

    @staticmethod
    def _seconds(probe):
        value = probe()
        if type(value) not in (int, float) or not math.isfinite(value):
            raise DeadlineExpired("controller deadline is unavailable")
        return value

    def check(self):
        remaining = min(self._seconds(self.remaining), self._hard_seconds())
        if self.pending or remaining <= 0:
            self._mark_expired(remaining)
            raise self.pending_error or DeadlineExpired("controller processing exhausted its original deadline")
        if self.work_check:
            try:
                self.work_check(force=False)
            except Failure as error:
                self._mark_expired(0)
                self.pending, self.pending_error = True, error
                raise

    def _mark_expired(self, remaining):
        self.pin_stop(time.monotonic() + min(0.0, remaining))

    def pin_stop(self, anchor):
        """Bind a previously observed monotonic failure without rebuilding its clock."""
        if type(anchor) not in (int, float) or not math.isfinite(anchor):
            raise DeadlineExpired("invalid recorded controller stop timestamp")
        self.expired_at = anchor if self.expired_at is None else min(self.expired_at, anchor)

    def _hard_seconds(self):
        remaining = self._seconds(self.hard_remaining)
        if self.expired_at is not None:
            remaining = min(remaining, self.expired_at + 60 - time.monotonic())
        return remaining

    def _arm(self, seconds):
        signal.setitimer(signal.ITIMER_REAL, max(0.000001, min(1.0, seconds)))

    def _alarm(self, _signum, _frame):
        hard = self._hard_seconds()
        remaining = min(self._seconds(self.remaining), hard)
        problem = self.pending_error
        if self.pending or remaining <= 0:
            problem = problem or DeadlineExpired("controller processing exhausted its original deadline")
        elif self.work_check:
            try:
                self.work_check(force=True)
            except Failure as error:
                problem = error
        if problem is not None:
            self._mark_expired(remaining)
            hard = self._hard_seconds()
            self.pending, self.pending_error = True, problem
            # Launch registration and owned cleanup retain their identity anchor.
            # Cancellation is deferred only while the original hard clock is open.
            deferred = self.defer()
            if hard > 0 and deferred:
                self._arm(min(0.1, hard))
                return
            signal.setitimer(signal.ITIMER_REAL, 0)
            raise problem
        self._arm(remaining)

    def rebind(self, remaining, defer=None, work_check=None):
        """Switch to the caller's already anchored cleanup/phase deadline."""
        self.remaining = remaining
        if defer is not None:
            self.defer = defer
        self.pending = False
        self.pending_error = None
        self.work_check = work_check
        self.check()
        if self.entered:
            self._arm(min(self._seconds(self.remaining), self._hard_seconds()))

    def __enter__(self):
        global _active_guard
        if _active_guard is not None or signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
            raise Failure("controller deadline watchdog requires an unused main-thread timer")
        self.check()
        self.previous_handler = signal.getsignal(signal.SIGALRM)
        signal.signal(signal.SIGALRM, self._alarm)
        self.entered = True
        _active_guard = self
        try:
            self._arm(min(self._seconds(self.remaining), self._hard_seconds()))
        except BaseException:
            self.__exit__(None, None, None)
            raise
        return self

    def __exit__(self, *_error):
        global _active_guard
        try:
            signal.setitimer(signal.ITIMER_REAL, 0)
        finally:
            try:
                signal.signal(signal.SIGALRM, self.previous_handler)
            finally:
                _active_guard = None
                self.entered = False
