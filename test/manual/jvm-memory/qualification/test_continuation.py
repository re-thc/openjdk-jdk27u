# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Offline shutdown/provenance/serialization regressions; no native workload."""
import json
from pathlib import Path
import signal
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import continuation
from deadline import FixedCutoff, UTC_CUTOFF, utc
import image_manifest
import run as controller
import supervise
from cancellation import Cancellation
from process_cleanup import ChildScope, cleanup_errors
from test_supervisor import Kernel, Root


class DrainTests(unittest.TestCase):
    def setUp(self):
        self.kernel = Kernel()
        self.kernel.add(100, self.kernel.parent)
        self.kernel.add(200, 100)
        self.root = Root(self.kernel)
        self.kernel.exit(100, 0)
        self.scope = ChildScope(self.kernel, protect_existing=False)

    def test_five_second_build_shutdown_drains_without_signals_and_serializes(self):
        def shutdown():
            if self.kernel.time >= 5 and self.kernel.tasks.get(200, {}).get('state') == 'S':
                self.kernel.exit(200, 0)
        self.kernel.on_pause = shutdown
        row = self.scope.drain(self.root, 20, lambda: None)
        self.assertTrue(row['complete'])
        self.assertGreaterEqual(row['observed_monotonic'], 5)
        self.assertLessEqual(row['observed_monotonic'], 6)
        self.assertEqual(self.kernel.signals, [])
        self.assertEqual(json.loads(json.dumps(row))['commands'][0]['command'], ['fake-owned-child'])
        cleanup = self.scope.close(self.root, 20)
        self.assertEqual(cleanup_errors(cleanup), [])

    def test_persistent_child_fails_even_when_subsequent_cleanup_succeeds(self):
        row = self.scope.drain(self.root, 20, lambda: None)
        self.assertFalse(row['complete'])
        self.assertEqual(self.kernel.signals, [])
        cleanup = self.scope.close(self.root, 20)
        self.assertTrue(cleanup['complete'])
        self.assertTrue(cleanup['live_descendants_after_launcher_exit'])
        self.assertEqual(cleanup['descendant_commands'][0]['pid'], 200)
        self.assertTrue(row['errors'])  # Cleanup never changes failed drain.
        json.dumps(cleanup)

    def test_uninterruptible_child_receives_no_fresh_cleanup_budget(self):
        self.kernel.unkillable.add(200)
        row = self.scope.drain(self.root, 7, lambda: None)
        cleanup = self.scope.close(self.root, 7)
        self.assertFalse(row['complete'])
        self.assertFalse(cleanup['complete'])
        self.assertLessEqual(self.kernel.time, 7)
        self.assertNotIn(77, [p for p, t in self.kernel.signals])

    def test_late_empty_observation_is_not_a_timely_drain(self):
        original = self.kernel.snapshot
        def late():
            self.kernel.time = 7
            if 200 in self.kernel.tasks:
                self.kernel.exit(200, 0)
            return original()
        self.kernel.snapshot = late
        row = self.scope.drain(self.root, 20, lambda: None)
        self.assertFalse(row['complete'])
        self.assertIn('deadline missed', row['errors'][0])

    def test_cancellation_and_observation_failure_bypass_grace(self):
        for error in [RuntimeError('cancelled'), OSError('ownership unreadable')]:
            with self.subTest(error=error):
                row = self.scope.drain(self.root, 20, lambda: (_ for _ in ()).throw(error))
                self.assertFalse(row['complete'])
                self.assertEqual(self.kernel.time, 0)
                self.assertEqual(self.kernel.signals, [])

    def test_nonzero_build_never_receives_natural_grace(self):
        self.kernel.tasks[100]['code'] = 2
        row = self.scope.drain(self.root, 20, lambda: None)
        self.assertFalse(row['complete'])
        self.assertEqual(self.kernel.time, 0)

    def test_kernel_children_prevent_empty_snapshot_pass(self):
        self.kernel.hidden.add(200)
        row = self.scope.drain(self.root, 3, lambda: None)
        self.assertFalse(row['complete'])
        self.assertEqual(self.kernel.time, 3)

    def test_original_absolute_deadline_caps_a_later_supervisor(self):
        kernel = Kernel(); kernel.time = 100
        cancel = Cancellation()
        def launch(argv):
            kernel.add(100, kernel.parent)
            return Root(kernel)
        row = supervise.Supervisor(kernel, cancel, launch, lambda r: None,
                                   seconds=10, cleanup_seconds=4, report_seconds=1,
                                   absolute_deadline=107).run(['not-executed'])
        self.assertEqual(row['hard_deadline_monotonic'], 107)
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertTrue(row['final_child_audit'])
        self.assertLess(kernel.time, 107)


class WitnessTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.previous = self.root / 'previous'; self.previous.mkdir()
        self.owner = self.root / 'owner'; self.owner.mkdir()
        for tag in ['B', 'C']:
            (self.previous / tag).mkdir()
        self.image = self.previous / 'B/build/B-release/images/jdk'
        for name in ['bin/java', 'bin/javac', 'lib/modules', 'release']:
            p = self.image / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text('image')
        for name in ['spec.gmk', 'configure.log', 'build.log']:
            (self.previous / 'B/build/B-release' / name).write_text('preserved provenance')
        external = self.root / 'installed-input'; external.write_text('fixed')
        release = {'commit': continuation.ORIGINAL_HARNESS, 'start_monotonic': 0,
                   'hard_deadline_monotonic': 36000, 'output': str(self.previous), 'owner_output': str(self.owner),
                   'released_at_utc': '2026-10-17T15:23:44+00:00',
                   'hard_deadline_utc': '2026-10-18T01:23:44+00:00'}
        self.release = self.root / 'release.json'; self.write(self.release, release)
        self.write(self.previous / 'freeze.json', {'baseline': continuation.BASE,
                   'candidate': continuation.CANDIDATE, 'source_and_input_sha256': {str(external): continuation.sha(external)},
                   'methods': controller.METHODS, 'sources': controller.SOURCES,
                   'tests': controller.TESTS, 'flags': controller.COMMON, 'pairs': 8,
                   'order': 'BC,BB; CB,BB; repeated four times',
                   'confidence': 'paired log Student-t, df=7, Bonferroni 72 intervals',
                   'pause_metric': 'per-fork p99; paired log-ratio/delta t intervals'})
        build = {'label': 'build-B-release', 'exit': 0, 'error': continuation.FAILURE,
                 'measured': False, 'cleanup': {'complete': True, 'remaining': [], 'errors': []}}
        self.write(self.previous / 'commands.json', [build])
        self.write(self.previous / 'decision.json', {'decision': 'HOLD',
                   'error': "RuntimeError('build-B-release: " + continuation.FAILURE + "')"})
        args = ['python', '/source/run.py', '--execute', '--output', str(self.previous),
                '--outer-owner-reference', str(self.owner / 'owner.json')]
        for name in ['boot', 'jtreg', 'gtest', 'jmh', 'asan-runtime']:
            args += ['--' + name, '/fixed/' + name]
        args += ['--configure-option=--fixed=true', '--stop-after', 'all']
        self.write(self.owner / 'owner.json', {'harness_commit': continuation.ORIGINAL_HARNESS,
                   'cleanup': {'complete': True, 'remaining': []}, 'final_child_audit': True,
                   'errors': [], 'status': 'INNER_FAILED', 'argv': args})
        self.write(self.owner / 'terminal.json', {'supervisor_exit': 2, 'accepted': False})
        def fake_git(directory, *args):
            if args == ('rev-parse', 'HEAD'):
                return continuation.BASE if Path(directory).name == 'B' else continuation.CANDIDATE
            return ''
        for name, value in [('git', fake_git)]:
            patcher = patch.object(continuation, name, value); patcher.start(); self.addCleanup(patcher.stop)
        wall_patch = patch.object(continuation.time, 'time', return_value=UTC_CUTOFF - 35000)
        wall_patch.start(); self.addCleanup(wall_patch.stop)
        patcher = patch.object(continuation.time, 'monotonic', return_value=100)
        patcher.start(); self.addCleanup(patcher.stop)
        patcher = patch.object(continuation.subprocess, 'check_output', side_effect=AssertionError('No native child in offline tests'))
        patcher.start(); self.addCleanup(patcher.stop)

    @staticmethod
    def write(path, value):
        path.write_text(json.dumps(value, allow_nan=False))

    def prepare(self):
        # Fixture for the already-retained legacy witness, not a runtime writer
        # that can manufacture missing original boot/compiler evidence.
        folder = self.root / 'witness'
        continuation.check_original(self.previous, self.owner, json.loads(self.release.read_text()))
        folder.mkdir()
        manifest = folder / 'baseline-image.json'; image_manifest.record(self.image, manifest)
        files = [self.previous / n for n in ['freeze.json','commands.json','decision.json']]
        files += [self.owner / n for n in ['owner.json','terminal.json']]
        files += [self.release, manifest]
        files += [self.previous / 'B/build/B-release' / n for n in ['spec.gmk','configure.log','build.log']]
        freeze = json.loads((self.previous / 'freeze.json').read_text())
        owner = json.loads((self.owner / 'owner.json').read_text())
        proof = {'format': 1, 'kind': 'baseline-preparation-continuation',
                 'original_harness': continuation.ORIGINAL_HARNESS,
                 'baseline': continuation.BASE, 'candidate': continuation.CANDIDATE,
                 'previous': str(self.previous), 'previous_owner': str(self.owner),
                 'release_file': str(self.release), 'release': json.loads(self.release.read_text()),
                 'boot_sha256': 'capture-only-not-original', 'image': str(self.image),
                 'image_manifest': str(manifest),
                 'provenance_sha256': {str(p): continuation.sha(p) for p in files},
                 'arguments': continuation.original_arguments(owner['argv']),
                 'protocol': {k: freeze[k] for k in ['methods','sources','tests','flags','pairs','order','confidence','pause_metric']},
                 'release_stage_deadline_monotonic': 6600, 'measurements_started': False}
        p = folder / 'continuation.json'; self.write(p, proof); return p

    def test_complete_witness_roundtrip_preserves_terminal_and_clock(self):
        before = (self.previous / 'decision.json').read_bytes()
        p = self.prepare(); proof = continuation.load(p, continuation.sha(p), matched_rebuild=True)
        self.assertEqual(proof['release']['hard_deadline_monotonic'], 36000)
        self.assertEqual(proof['release_stage_deadline_monotonic'], 6600)
        self.assertEqual((self.previous / 'decision.json').read_bytes(), before)
        self.assertEqual(json.loads(json.dumps(proof)), proof)
        with self.assertRaises(FileExistsError):
            self.prepare()

    def test_old_image_is_not_reused_even_with_a_current_hash(self):
        p = self.prepare(); digest = continuation.sha(p)
        (self.image / 'lib/modules').write_text('other')
        with self.assertRaises(RuntimeError):
            continuation.load(p, digest)
        self.assertFalse(continuation.load(p, digest, matched_rebuild=True)['reuse_baseline'])

    def test_added_entries_and_external_image_links_are_rejected(self):
        manifest = self.root / 'manifest.json'; image_manifest.record(self.image, manifest)
        (self.image / 'added').write_text('new')
        with self.assertRaises(RuntimeError):
            image_manifest.verify(self.image, manifest)
        (self.image / 'escape').symlink_to(self.release)
        with self.assertRaises(RuntimeError):
            image_manifest.catalog(self.image)

    def test_provenance_or_witness_mutation_is_rejected(self):
        p = self.prepare(); digest = continuation.sha(p)
        self.write(self.previous / 'decision.json', {'decision': 'LOCAL_GO_FOR_REVIEW'})
        with self.assertRaises(RuntimeError):
            continuation.load(p, digest, matched_rebuild=True)
        p.write_text(p.read_text() + ' ')
        with self.assertRaises(RuntimeError):
            continuation.load(p, digest, matched_rebuild=True)

    def test_measurements_or_candidate_build_forbid_continuation(self):
        self.write(self.previous / 'samples.json', [{'time_per_work': 1}])
        with self.assertRaises(RuntimeError):
            self.prepare()
        self.write(self.previous / 'samples.json', [])
        (self.previous / 'C/build/C-release').mkdir(parents=True)
        with self.assertRaises(RuntimeError):
            self.prepare()

    def test_expired_utc_rejects_and_boot_reset_never_grants_a_fresh_budget(self):
        p = self.prepare(); digest = continuation.sha(p)
        with patch.object(continuation.time, 'time', return_value=UTC_CUTOFF + 1):
            with self.assertRaises(RuntimeError):
                continuation.load(p, digest, matched_rebuild=True)
        with patch.object(continuation.time, 'monotonic', return_value=1):
            proof = continuation.load(p, digest, matched_rebuild=True)
            self.assertFalse(proof['reuse_baseline'])
            clock = FixedCutoff()
            self.assertEqual(clock.deadline, 35001)
        with self.assertRaises(RuntimeError):
            continuation.load(p, digest)  # Original compiler history is missing.

    def test_changed_inputs_or_build_options_cannot_be_matched(self):
        p = self.prepare(); proof = continuation.load(p, continuation.sha(p), matched_rebuild=True)
        args = SimpleNamespace(**proof['arguments'], stop_after='all')
        continuation.match_arguments(proof, args)
        args.configure_option = ['--disable-javac-server']
        with self.assertRaises(RuntimeError):
            continuation.match_arguments(proof, args)
        (self.root / 'installed-input').write_text('changed')
        with self.assertRaises(RuntimeError):
            continuation.load(p, continuation.sha(p), matched_rebuild=True)

    def test_matched_continuation_rebuilds_baseline_instead_of_reusing_it(self):
        p = self.prepare(); proof = continuation.load(p, continuation.sha(p), matched_rebuild=True)
        campaign = object.__new__(controller.Campaign)
        campaign.out = self.root / 'new-output'; campaign.out.mkdir()
        campaign.continuation = proof; campaign.toolchain_inputs = None
        campaign.a = SimpleNamespace(**proof['arguments'])
        calls = []
        campaign.run = lambda label, *a, **k: calls.append((label, k))
        campaign.image_receipt = lambda repo, conf, asan: self.image
        self.assertEqual(campaign.build('B'), self.image)
        self.assertEqual([x[0] for x in calls], ['configure-B-release', 'build-B-release'])
        self.assertTrue(calls[-1][1]['build_stage'])
        self.assertFalse((campaign.out / 'baseline-reuse.json').exists())

    def test_release_stage_cap_is_not_restarted(self):
        campaign = object.__new__(controller.Campaign)
        release = json.loads(self.release.read_text())
        campaign.cancel = Cancellation()
        campaign.clock_guard = FixedCutoff(monotonic=lambda: 50,
                                          wall=lambda: utc(release['released_at_utc']) + 5000)
        campaign.deadline = campaign.clock_guard.deadline
        campaign.continuation = {'release': release}
        with patch.object(controller.time, 'monotonic', return_value=50):
            campaign.begin('release-builds', 6600)
        self.assertEqual(campaign.stage_end, 1650)

    def test_claim_is_single_use_and_bound_to_owner_output(self):
        p = self.prepare(); digest = continuation.sha(p)
        owner = self.root / 'new-owner/owner.json'; output = self.root / 'new-output'
        continuation.claim(p, digest, owner, ['python', 'run.py', '--output', str(output)])
        continuation.verify_claim(p, digest, owner, output)
        with self.assertRaises(FileExistsError):
            continuation.claim(p, digest, owner, ['python', 'run.py', '--output', str(output)])
        with self.assertRaises(RuntimeError):
            continuation.verify_claim(p, digest, owner, self.root / 'other-output')
        with self.assertRaises(RuntimeError):
            continuation.verify_claim(p, digest, self.root / 'other-owner', output)
        self.assertEqual(continuation.sha(p), digest)

    def test_receipts_reject_nonfinite_values_without_replacing_valid_json(self):
        for saver in [controller.save, supervise.save]:
            p = self.root / (saver.__module__ + '.json')
            saver(p, {'complete': True})
            with self.assertRaises(ValueError):
                saver(p, {'deadline': float('nan')})
            self.assertEqual(json.loads(p.read_text()), {'complete': True})


if __name__ == '__main__':
    unittest.main()
