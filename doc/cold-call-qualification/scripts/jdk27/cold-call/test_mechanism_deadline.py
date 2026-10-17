"""Offline watchdog fixtures: no real timers, children, or workload execution."""
import json
from pathlib import Path
import signal
import tempfile
import unittest
from unittest.mock import patch

import mechanism_deadline as deadline
import mechanism_validation as runner


class DeadlineTests(unittest.TestCase):
    def setUp(self):
        self.remaining, self.hard = 120.0, 180.0
        self.previous = object()
        for name, result in (("getitimer", (0.0, 0.0)), ("getsignal", self.previous),
                             ("signal", self.previous), ("setitimer", (0.0, 0.0))):
            mock = patch.object(deadline.signal, name, return_value=result)
            setattr(self, name, mock.start())
            self.addCleanup(mock.stop)
        self.assertIsNone(deadline._active_guard)

    def guard(self, defer=None):
        return deadline.DeadlineGuard(lambda: self.remaining, lambda: self.hard, defer)

    def test_polling_timer_uses_existing_limits_and_restores_handler(self):
        with self.guard() as guard:
            self.assertIs(deadline._active_guard, guard)
            self.setitimer.assert_called_with(signal.ITIMER_REAL, 1.0)
            self.remaining = 0.25
            guard._alarm(signal.SIGALRM, None)
            self.setitimer.assert_called_with(signal.ITIMER_REAL, 0.25)
        self.assertIsNone(deadline._active_guard)
        self.signal.assert_called_with(signal.SIGALRM, self.previous)
        self.setitimer.assert_called_with(signal.ITIMER_REAL, 0)

    def test_synchronous_processing_is_interrupted_without_a_callback(self):
        with self.assertRaises(deadline.DeadlineExpired):
            with self.guard() as guard:
                self.remaining = 0
                guard._alarm(signal.SIGALRM, None)
        self.assertIsNone(deadline._active_guard)

    def test_forward_utc_or_hard_deadline_cannot_be_renewed_by_rebind(self):
        with self.guard() as guard:
            guard.rebind(lambda: 99999)
            self.hard = 0
            with self.assertRaises(deadline.DeadlineExpired):
                guard._alarm(signal.SIGALRM, None)

    def test_work_expiry_can_defer_until_owned_registration_finishes(self):
        critical = [True]
        with self.guard(lambda: critical[0]) as guard:
            self.remaining = -1
            guard._alarm(signal.SIGALRM, None)
            self.assertTrue(guard.pending)
            self.setitimer.assert_called_with(signal.ITIMER_REAL, 0.1)
            critical[0] = False
            with self.assertRaises(deadline.DeadlineExpired):
                guard._alarm(signal.SIGALRM, None)

    def test_critical_section_cannot_defer_the_raw_outer_deadline(self):
        with self.guard(lambda: True) as guard:
            self.remaining, self.hard = -1, 0
            with self.assertRaises(deadline.DeadlineExpired):
                guard._alarm(signal.SIGALRM, None)

    def test_cleanup_uses_raw_remainder_after_work_reserve_expires(self):
        with self.guard() as guard:
            self.remaining, self.hard = -1, 59
            with self.assertRaises(deadline.DeadlineExpired):
                guard._alarm(signal.SIGALRM, None)
            guard.rebind(lambda: min(self.hard, 60))
            guard.check()
            self.hard = 0
            with self.assertRaises(deadline.DeadlineExpired):
                guard.check()

    def test_first_expiry_pins_cleanup_before_deferred_owned_work(self):
        with patch.object(deadline.time, "monotonic", return_value=1000) as now:
            with self.guard(lambda: True) as guard:
                self.remaining = -2
                guard._alarm(signal.SIGALRM, None)
                self.assertEqual(guard.expired_at, 998)
                now.return_value = 1010
                guard._alarm(signal.SIGALRM, None)
                self.assertEqual(guard.expired_at, 998)
                guard.rebind(lambda: guard.expired_at + 60 - now.return_value)
                self.assertEqual(guard.remaining(), 48)
                now.return_value = 1058
                with self.assertRaises(deadline.DeadlineExpired):
                    guard.check()

    def test_deferred_cleanup_still_stops_at_the_first_expiry_plus_sixty(self):
        with patch.object(deadline.time, "monotonic", return_value=1000) as now:
            with self.guard(lambda: True) as guard:
                self.remaining = 0
                guard._alarm(signal.SIGALRM, None)
                now.return_value = 1060
                with self.assertRaises(deadline.DeadlineExpired):
                    guard._alarm(signal.SIGALRM, None)

    def test_existing_or_nested_timer_is_rejected(self):
        self.getitimer.return_value = (10, 0)
        with self.assertRaises(runner.Failure):
            with self.guard():
                pass
        self.getitimer.return_value = (0, 0)
        with self.guard():
            with self.assertRaises(runner.Failure):
                with self.guard():
                    pass

    def test_missing_nonfinite_and_expired_limits_fail_before_install(self):
        for value in (float("inf"), float("nan"), None, True, 0, -1):
            with self.subTest(value=value):
                self.remaining = value
                with self.assertRaises(deadline.DeadlineExpired):
                    with self.guard():
                        pass
        self.signal.assert_not_called()

    def test_streamed_json_expiry_does_not_replace_existing_receipt(self):
        with tempfile.TemporaryDirectory() as directory:
            target = Path(directory) / "receipt.json"
            target.write_text('{"status":"previous"}\n')
            def pieces(_encoder, _value):
                yield '{"large":['
                self.remaining = 0
                yield '1,2,3]}'
            with self.guard():
                with patch.object(json.JSONEncoder, "iterencode", pieces):
                    with self.assertRaises(deadline.DeadlineExpired):
                        runner.save(target, {"large": [1, 2, 3]})
            self.assertEqual(target.read_text(), '{"status":"previous"}\n')

    def test_hash_chunk_checks_controller_deadline(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input"
            path.write_bytes(b"one chunk")
            with self.guard():
                self.remaining = 0
                with self.assertRaises(deadline.DeadlineExpired):
                    runner.sha256(path)


if __name__ == "__main__":
    unittest.main()
