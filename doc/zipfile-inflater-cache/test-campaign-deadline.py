#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Offline delayed/expired launch and verification fixtures; no campaign APIs."""
import ast
import copy
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock, patch
import campaign_deadline as budget


class CampaignDeadlineTest(unittest.TestCase):
    launch = '2026-10-17T14:47:24Z'
    end = '2026-10-17T18:47:24Z'
    deadline = datetime(2026, 10, 17, 18, 47, 24, tzinfo=timezone.utc).timestamp()
    directory = Path(__file__).resolve().parent

    def fixture(self, root):
        previous = root / 'previous'
        previous.mkdir()
        binding = dict(campaign=dict(launch_utc=self.launch, deadline_utc=self.end),
                       prior_elapsed_seconds=1801.9732814519994, provenance_sha256={})
        records = {'analysis.json': dict(launch_utc=self.launch,
                                        supervisor_limits=dict(work_seconds=14400)),
                   'supervisor-status.json': dict(limits=dict(work_seconds=14400))}
        for name, record in records.items():
            data = json.dumps(record).encode()
            (previous / name).write_bytes(data)
            binding['provenance_sha256'][name] = hashlib.sha256(data).hexdigest()
        return previous, binding

    def test_deadline_comes_from_pinned_original_launch_and_cap(self):
        with tempfile.TemporaryDirectory() as temporary:
            previous, binding = self.fixture(Path(temporary))
            self.assertEqual(budget.original_deadline(binding, previous), self.deadline)
            changed = copy.deepcopy(binding)
            changed['campaign']['deadline_utc'] = '2026-10-17T19:47:24Z'
            with self.assertRaisesRegex(ValueError, 'disagrees'):
                budget.original_deadline(changed, previous)
            (previous / 'analysis.json').write_text('{}')
            with self.assertRaisesRegex(ValueError, 'evidence changed'):
                budget.original_deadline(binding, previous)

    def test_delayed_launch_counts_review_waiting(self):
        for remaining in (12598, 10000, 1):
            with self.subTest(remaining=remaining), patch.object(budget.time, 'time', return_value=self.deadline - remaining):
                self.assertEqual(budget.require_remaining(self.deadline), remaining)
        # A 70-minute launch delay leaves 170 minutes, not the prior-run balance.
        with patch.object(budget.time, 'time', return_value=self.deadline - 10200):
            self.assertEqual(budget.require_remaining(self.deadline), 10200)

    def test_expired_launch_rejected_before_root_creation_or_workers(self):
        # Execute only the supervisor's read-only admission prefix, stopping
        # before pidfd/affinity/subreaper/output/process APIs. Its real deadline
        # check must reject at and after expiry; ROOT is never created.
        source = (self.directory / 'supervise-linux.py').read_text()
        prefix = compile(ast.parse(source[:source.index("if not hasattr(os, 'pidfd_open')")]),
                         '<supervisor admission fixture>', 'exec')
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            previous, binding = self.fixture(root)
            (root / 'retained-builds.json').write_text(json.dumps(binding))
            output = root / 'fresh'
            argv = ['supervise-linux.py', '--resume-from', str(previous), str(output), 'a' * 40]
            for now, rollback in ((now, rollback) for now in (self.deadline - 10000, self.deadline, self.deadline + 60)
                                  for rollback in (False, True)):
                with self.subTest(now=now, rollback=rollback), patch('sys.argv', argv), \
                     patch.object(budget.time, 'time', side_effect=[now, now - 5000 if rollback else now]), \
                     patch.object(budget.time, 'monotonic', return_value=100):
                    namespace = dict(__file__=str(root / 'supervise-linux.py'))
                    if now < self.deadline:
                        exec(prefix, namespace)
                        self.assertEqual(namespace['absolute_deadline'], self.deadline)
                        self.assertEqual(namespace['deadline'], 100 + self.deadline - now)
                    else:
                        with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                            exec(prefix, namespace)
                    self.assertFalse(output.exists())

    def preflight_fixture(self, root, clock):
        source = (self.directory / 'supervise-linux.py').read_text()
        prefix = compile(ast.parse(source[:source.index("if not hasattr(os, 'pidfd_open')")]),
                         '<supervisor admission fixture>', 'exec')
        main = next(node for node in ast.parse(source).body if isinstance(node, ast.Try))
        preflight = compile(ast.Module(body=main.body, type_ignores=[]), '<preflight fixture>', 'exec')
        previous, binding = self.fixture(root)
        (root / 'retained-builds.json').write_text(json.dumps(binding))
        output = root / 'fresh'
        argv = ['supervise-linux.py', '--resume-from', str(previous), str(output), 'a' * 40]
        with patch('sys.argv', argv):
            namespace = dict(__file__=str(root / 'supervise-linux.py'))
            exec(prefix, namespace)
        self.assertEqual(namespace['deadline'], 110)
        output.mkdir()  # Temporary fixture output, not a supervisor launch.
        namespace.update(subprocess=Mock(), env={}, reason='completed', stop_signal=None)
        return preflight, namespace

    def test_preflight_expiry_retains_admitted_anchor_and_starts_no_worker(self):
        with tempfile.TemporaryDirectory() as temporary:
            clock = dict(utc=self.deadline - 10, mono=100)
            with patch.object(budget.time, 'time', side_effect=lambda: clock['utc']), \
                 patch.object(budget.time, 'monotonic', side_effect=lambda: clock['mono']):
                preflight, namespace = self.preflight_fixture(Path(temporary), clock)
                clock.update(utc=self.deadline - 5000, mono=110)
                with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                    exec(preflight, namespace)
                self.assertEqual(namespace['deadline'], 110)
                namespace['subprocess'].Popen.assert_not_called()

    def test_monitored_preflight_rechecks_forward_utc_and_elapsed_monotonic(self):
        for jump in (dict(utc=self.deadline + 1, mono=101),
                     dict(utc=self.deadline - 5000, mono=110)):
            with self.subTest(jump=jump), tempfile.TemporaryDirectory() as temporary:
                clock = dict(utc=self.deadline - 10, mono=100)
                with patch.object(budget.time, 'time', side_effect=lambda: clock['utc']), \
                     patch.object(budget.time, 'monotonic', side_effect=lambda: clock['mono']):
                    preflight, namespace = self.preflight_fixture(Path(temporary), clock)
                    child = Mock(returncode=None)
                    child.poll.return_value = None  # Synthetic stalled git preflight.
                    def start_preflight(argv, **kwargs):
                        self.assertEqual(argv[:2], ['bash', '-euc'])
                        self.assertIn('git rev-parse HEAD', argv[2])
                        self.assertIn('git diff --quiet HEAD', argv[2])
                        self.assertIn('exec "$@"', argv[2])
                        clock.update(jump)
                        return child
                    namespace['subprocess'].Popen.side_effect = start_preflight
                    exec(preflight, namespace)
                    self.assertEqual(namespace['reason'], 'original-campaign-deadline')
                    self.assertEqual(namespace['deadline'], 110)
                    namespace['subprocess'].Popen.assert_called_once()

    def test_verification_cannot_report_success_after_expiry(self):
        binding = dict(campaign=dict(launch_utc=self.launch, deadline_utc=self.end))
        with patch.object(budget.time, 'time', side_effect=[self.deadline - 2, self.deadline]):
            self.assertEqual(budget.require_remaining(self.deadline), 2)
            with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                budget.report(binding, self.deadline)

    def test_monotonic_limit_prevents_backward_clock_extension(self):
        with patch.object(budget.time, 'time', return_value=self.deadline - 10000), \
             patch.object(budget.time, 'monotonic', return_value=100):
            self.assertEqual(budget.remaining_seconds(self.deadline, 110), 10)
            with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                budget.require_remaining(self.deadline, 100)

    def test_forward_clock_expiry_overrides_monotonic_balance(self):
        with patch.object(budget.time, 'time', return_value=self.deadline + 1), \
             patch.object(budget.time, 'monotonic', return_value=100):
            with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                budget.require_remaining(self.deadline, 10000)

    def test_stage_and_verifier_inherit_original_monotonic_deadline(self):
        with patch.dict(os.environ, dict(ZIP_QUAL_SUPERVISED='1', ZIP_QUAL_MONOTONIC_DEADLINE='110'), clear=True), \
             patch.object(budget.time, 'time', return_value=self.deadline - 10000), \
             patch.object(budget.time, 'monotonic', return_value=110):
            with self.assertRaisesRegex(TimeoutError, 'deadline expired'):
                budget.require_remaining(self.deadline, budget.supervised_deadline())
        with patch.dict(os.environ, dict(ZIP_QUAL_SUPERVISED='1'), clear=True):
            with self.assertRaisesRegex(ValueError, 'Missing supervisor'):
                budget.supervised_deadline()


if __name__ == '__main__':
    unittest.main()
