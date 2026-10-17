#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.

"""Runner tests use temporary data and harmless child processes; no JVM workload."""
import argparse
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import tarfile
import tempfile
import time
import unittest
from unittest import mock

sys.dont_write_bytecode = True
import qualify as q
import guard_evidence as guard
import storage


class QualificationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)

    def tearDown(self):
        self.tmp.cleanup()

    def plan(self):
        args = argparse.Namespace(output=self.root / 'new', checkout=q.HERE.parents[1],
            boot_jdk=Path('/normal/boot-jdk'), input_root=[], configure_arg=[])
        return q.build_plan(args)

    def test_complete_plan_and_matched_builds(self):
        plan = self.plan()
        commands = plan['commands']
        self.assertEqual(len([x for x in commands if x['stage'] == 'measure']), 36)
        self.assertEqual(len([x for x in commands if x['name'].endswith('-images')]), 4)
        self.assertEqual(plan['overall_seconds'], 25200)
        self.assertEqual(plan['measurement_seconds'], 1800)
        self.assertEqual(plan['candidate'], '57f567fcb9ad7dddbd7fb2b2d9b443309681fc0f')
        for debug in ('release', 'fastdebug'):
            a = next(x for x in commands if x['name'] == 'baseline-' + debug + '-configure')
            b = next(x for x in commands if x['name'] == 'candidate-' + debug + '-configure')
            self.assertEqual(a['argv'], b['argv'])
            self.assertIn('--disable-javac-server', a['argv'])
        for item in commands:
            if item['stage'] == 'measure':
                self.assertIn('-f', item['argv'])
                self.assertIn('-foe', item['argv'])
                if item['screen_record']['kind'] == 'compiler':
                    wi = item['argv'].index('-wi')
                    self.assertEqual(item['argv'][wi + 1], '0')

    def test_staged_last_consumers_precede_cleanup_and_next_build(self):
        commands = self.plan()['commands']
        indices = {row['name']:i for i, row in enumerate(commands)}
        for number, (name, _, _) in enumerate(q.VARIANTS):
            prune = indices[name + '-prune']
            self.assertTrue(all(indices[x] < prune for x in storage.LAST_CONSUMERS[name]))
            if number + 1 < len(q.VARIANTS):
                self.assertLess(prune, indices[q.VARIANTS[number + 1][0] + '-clone'])
        self.assertLess(storage.MIN_FREE_BYTES, 25 * storage.GiB)
        self.assertEqual(storage.MAX_WORK_BYTES + storage.FREE_FLOOR_BYTES, storage.MIN_FREE_BYTES)
        self.assertLess(sum(storage.peak_components().values()), storage.MAX_WORK_BYTES)

    def prune_fixture(self, name='baseline-release', live_reference=False):
        root = self.root / 'new-campaign'
        root.mkdir()
        for child in ('input-manifests', 'storage', 'results'):
            (root / child).mkdir()
        q.write_json(root / 'plan.json', dict(test=True))
        q.write_json(root / 'campaign-owner.json', storage.create_owner(root, q.sha256(root / 'plan.json')))
        q.write_json(root / 'runs.json', [dict(name=x, returncode=0) for x in storage.LAST_CONSUMERS[name]])
        tree = root / name
        build = tree / 'build/qualified'
        image = build / 'images/jdk'
        image.mkdir(parents=True)
        (tree / 'Tracked.java').write_text('unchanged source')
        (image / 'runtime').write_text('complete immutable image')
        (build / 'spec.gmk').write_text('original configuration')
        (build / 'configure.log').write_text('original log')
        (build / 'build.log').write_text('completed normal build')
        for child in ('hotspot', 'support', 'jdk', 'images/jmods', 'test-results'):
            (build / child).mkdir(parents=True)
            (build / child / 'temporary').write_text('generated intermediate')
        if name == 'baseline-release':
            retained = build / 'images/test/micro/benchmarks.jar'
        else:
            retained = build / 'images/test/hotspot/gtest/server/libjvm.so'
        retained.parent.mkdir(parents=True)
        retained.write_text('retained test artifact')
        if live_reference:
            (image / 'bad-link').symlink_to(build / 'support/temporary')
        outside = self.root / 'other-task-data'
        outside.mkdir()
        (outside / 'keep').write_text('unrelated data')
        (build / 'support/escape').symlink_to(outside, target_is_directory=True)
        expected = next(source for variant, source, _ in q.VARIANTS if variant == name)
        def source_record(path):
            return dict(head=expected, tracked_files=q.file_manifest(path / 'Tracked.java'))
        with mock.patch.object(q, 'capture_source', side_effect=source_record):
            q.freeze(root / 'input-manifests', tree, 'source')
            for item in (image, build / 'spec.gmk', build / 'configure.log'):
                q.freeze(root / 'input-manifests', item)
        return root, tree, build, image, retained, source_record, outside

    def test_cleanup_keeps_original_inputs_and_removes_only_owned_intermediates(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture()
        original = q.file_manifest(image)
        with mock.patch.object(q, 'capture_source', side_effect=capture):
            q.prune_build(root, 'baseline-release')
            q.verify_frozen(root / 'input-manifests')
        self.assertEqual(q.file_manifest(image), original)
        self.assertTrue((tree / 'Tracked.java').exists())
        self.assertTrue((build / 'spec.gmk').exists())
        self.assertTrue(retained.exists())
        self.assertFalse((build / 'support').exists())
        self.assertFalse((build / 'hotspot').exists())
        self.assertFalse((build / 'jdk').exists())
        self.assertFalse((build / 'images/jmods').exists())
        self.assertEqual((outside / 'keep').read_text(), 'unrelated data')
        self.assertTrue((root / 'results/build-evidence/baseline-release/test-results/temporary').exists())
        journal = json.loads((root / 'storage/baseline-release-prune.json').read_text())
        self.assertEqual(journal['status'], 'complete')
        self.assertIn('support', journal['removed'])
        self.assertGreater(journal['allocated_build_before'], journal['allocated_build_after'])

    def test_gtest_artifacts_survive_last_consumer_cleanup(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture('candidate-fastdebug')
        with mock.patch.object(q, 'capture_source', side_effect=capture):
            q.prune_build(root, 'candidate-fastdebug')
            q.verify_frozen(root / 'input-manifests')
        self.assertTrue(retained.exists())
        self.assertFalse((build / 'hotspot').exists())

    def test_cleanup_refuses_missing_consumer_and_unowned_root(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture()
        q.write_json(root / 'runs.json', [])
        with mock.patch.object(q, 'capture_source', side_effect=capture):
            with self.assertRaisesRegex(ValueError, 'Last consumers'):
                q.prune_build(root, 'baseline-release')
        self.assertTrue((build / 'support/temporary').exists())
        owner = json.loads((root / 'campaign-owner.json').read_text())
        owner['directory_inode'] += 1
        q.write_json(root / 'campaign-owner.json', owner)
        with self.assertRaisesRegex(ValueError, 'ownership'):
            q.prune_build(root, 'baseline-release')
        self.assertTrue((build / 'support/temporary').exists())

    def test_cleanup_refuses_image_drift_before_any_removal(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture()
        (image / 'runtime').write_text('drift')
        with mock.patch.object(q, 'capture_source', side_effect=capture):
            with self.assertRaisesRegex(ValueError, 'Input drift'):
                q.prune_build(root, 'baseline-release')
        self.assertTrue((build / 'support/temporary').exists())

    def test_cleanup_refuses_retained_reference_to_intermediate(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture(live_reference=True)
        with mock.patch.object(q, 'capture_source', side_effect=capture):
            with self.assertRaisesRegex(ValueError, 'Retained input refers'):
                q.prune_build(root, 'baseline-release')
        self.assertTrue((build / 'support/temporary').exists())

    def test_interrupted_cleanup_preserves_inputs_and_remains_active(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture()
        real_remove = storage.remove_generated
        removed = []
        def fail_after_first(target):
            if removed:
                raise OSError('injected cancellation-like interruption')
            real_remove(target)
            removed.append(target)
        with mock.patch.object(q, 'capture_source', side_effect=capture), mock.patch.object(storage, 'remove_generated', side_effect=fail_after_first):
            with self.assertRaises(OSError):
                q.prune_build(root, 'baseline-release')
            q.verify_frozen(root / 'input-manifests')
        journal = json.loads((root / 'storage/baseline-release-prune.json').read_text())
        self.assertEqual(journal['status'], 'removing')
        self.assertEqual(len(journal['removed']), 1)
        self.assertTrue((image / 'runtime').exists())
        (root / 'candidate-release/build/qualified').mkdir(parents=True)
        with self.assertRaisesRegex(ValueError, 'More than one build'):
            storage.check_limits(root)

    def test_cleanup_rejects_symlinked_build_ancestor(self):
        root, tree, build, image, retained, capture, outside = self.prune_fixture()
        moved = tree / 'build/original'
        build.rename(moved)
        build.symlink_to(moved, target_is_directory=True)
        with self.assertRaisesRegex(ValueError, 'symlinked build ancestor'):
            storage.deletion_targets(root, 'baseline-release')
        self.assertTrue((moved / 'support/temporary').exists())

    def test_storage_rejects_two_active_builds_and_incomplete_prune(self):
        (self.root / 'baseline-release/build/qualified').mkdir(parents=True)
        (self.root / 'candidate-release/build/qualified').mkdir(parents=True)
        (self.root / 'storage').mkdir()
        q.write_json(self.root / 'storage/baseline-release-prune.json', dict(status='removing'))
        with self.assertRaisesRegex(ValueError, 'More than one build'):
            storage.check_limits(self.root)

    def test_transient_image_uses_active_bound_then_retained_image_bound(self):
        build = self.root / 'candidate-release/build/qualified'
        image = build / 'images/jdk'
        image.mkdir(parents=True)
        (image / 'runtime').write_text('image')
        with mock.patch.object(storage, 'MAX_IMAGE_BYTES', 1):
            storage.check_limits(self.root, build)
            q.freeze(self.root / 'input-manifests', image)
            with self.assertRaisesRegex(ValueError, 'Completed JDK image'):
                storage.check_limits(self.root, build)

    def test_every_download_is_pinned(self):
        rows = q.dependencies()
        self.assertEqual(len(rows), 8)
        for row in rows:
            self.assertRegex(row['sha256'], r'^[0-9a-f]{64}$')
            self.assertTrue(row['url'].startswith('https://'))
            self.assertGreater(row['bytes'], 0)

    def test_complete_file_manifest_and_drift(self):
        source = self.root / 'image'
        source.mkdir()
        (source / 'launcher').write_text('launcher')
        (source / 'libjvm').write_text('vm')
        (source / 'support').write_text('runtime support')
        (source / 'link').symlink_to('support')
        state = self.root / 'state'
        q.freeze(state, source)
        self.assertEqual(q.verify_frozen(state), 1)
        (source / 'support').write_text('changed support')
        with self.assertRaisesRegex(ValueError, 'Input drift'):
            q.verify_frozen(state)

    def test_directory_symlink_and_frozen_snapshot(self):
        tree = self.root / 'sysroot'
        tree.mkdir()
        target = self.root / 'headers'
        target.mkdir()
        (target / 'header.h').write_text('source')
        (tree / 'include').symlink_to(target, target_is_directory=True)
        state = self.root / 'state'
        q.freeze(state, tree, 'source-snapshot')
        (tree / 'generated.o').write_text('build output')
        self.assertEqual(q.verify_frozen(state), 1)
        (target / 'header.h').write_text('drift')
        with self.assertRaisesRegex(ValueError, 'Input drift'):
            q.verify_frozen(state)
        with self.assertRaisesRegex(ValueError, 'Cannot replace frozen'):
            q.freeze(state, tree, 'source-snapshot')

    def test_separate_console_and_compilation_log_layout(self):
        import screen
        logs, results = self.root / 'logs', self.root / 'results'
        logs.mkdir()
        results.mkdir()
        case = screen.CONTROLS[0][0]
        owner, method = case.rsplit('.', 1)
        records = []
        for side in ('baseline', 'candidate'):
            stem = 'throughput-' + method + '-0-' + side
            (results / (stem + '-compile-123.xml')).write_text(
                "<nmethod compile_id='1' compiler='c2' method='" + owner + ' ' + method + " ()V' size='200'/>")
            (logs / (stem + '.log')).write_text('separate stdout log')
            records.append(dict(case=case, kind='throughput', pair=0, side=side, result=str(results / (stem + '.json'))))
        screen.compilation_metrics(records, results, logs)
        data = json.loads((results / 'compilation-metrics.json').read_text())
        self.assertFalse(data['comparisons'][0]['investigate'])
        self.assertEqual(list(data['comparisons'][0]['matching_regular_c2_nmethod_ratios'].values()), [1])

    def test_safe_archive_extraction(self):
        evil = self.root / 'evil.tar.gz'
        with tarfile.open(evil, 'w:gz') as out:
            entry = tarfile.TarInfo('../escape')
            out.addfile(entry)
        with self.assertRaises(tarfile.FilterError):
            q.extract_archive(evil, self.root / 'extract')
        self.assertFalse((self.root / 'escape').exists())

    def test_scoped_graph_ignores_other_masks(self):
        scopes = dict(first_guard_bci=100, mask_call_bci=120, mask_guard_bci=3)
        first = ' !jvms: BlockDecoder::decodeSequencesRolling @ bci:100 (line245)'
        call = ' !jvms: Bits::mask64 @ bci:3 (line86) BlockDecoder::decodeSequencesRolling @ bci:120 (line249)'
        other = call.replace('bci:120', 'bci:150')
        graph = '\n'.join([
            ' 1 ConI === 0 [[ 3 ]] #int:63', ' 2 ConI === 0 [[ 6 ]] #int:64',
            ' 3 CmpI === _ 10 1 [[ 4 ]]' + first, ' 4 Bool === _ 3 [[ 5 ]] [le]' + first,
            ' 5 If === 0 4 [[ 11 ]]' + first, ' 6 CmpI === _ 10 2 [[ 7 ]]' + call,
            ' 7 Bool === _ 6 [[ 8 ]] [lt]' + call, ' 8 If === 11 7 [[ 12 ]]' + call,
            ' 9 CallStaticJava === 12 0 [[ 0 ]] uncommon_trap(reason=\'unstable_if\' action=\'reinterpret\')' + call,
            ' 13 CmpI === _ 15 2 [[ 14 ]]' + other,
            ' 14 Bool === _ 13 [[ 16 ]] [lt]' + other, ' 16 If === 12 14 [[ 0 ]]' + other])
        rows = guard.scoped_graph(graph, scopes)
        self.assertEqual(len(rows['first_guard_ifs']), 1)
        self.assertEqual(len(rows['mask_guard_ifs']), 1)
        self.assertEqual(len(rows['mask_guard_traps']), 1)
        self.assertEqual(rows['mask_guard_cmps'][0]['inputs'][1], rows['first_guard_cmps'][0]['inputs'][1])
        candidate = '\n'.join(line for line in graph.splitlines() if not any(line.startswith(' ' + n + ' ') for n in ('6', '7', '8', '9')))
        candidate += '\n 20 LShiftL === _ 10 2 [[ 21 ]]' + call.replace('bci:3', 'bci:12')
        rows = guard.scoped_graph(candidate, scopes)
        self.assertEqual(rows['mask_guard_ifs'], [])
        self.assertEqual(len(rows['first_guard_ifs']), 1)
        self.assertEqual(len(guard.parse_nodes(candidate)), 9)

    def test_bytecode_exact_scope(self):
        bits = '''  public static long mask64(int);
    descriptor: (I)J
    Code:
       0: iload_0
       1: bipush        64
       3: if_icmplt     12
  public static int next();'''
        decoder = '''  private static int decodeSequencesRolling(byte[], int, int, dev.jzstd.internal.EntropyState, dev.jzstd.internal.Workspace, int, int);
    descriptor: ([BIILdev/jzstd/internal/BlockDecoder$EntropyState;Ldev/jzstd/internal/Workspace;II)I
    Code:
      95: iload        25
      97: bipush       63
      99: if_icmpgt    200
     110: iload        25
     120: invokestatic #1 // Method dev/jzstd/internal/Bits.mask64:(I)J
     150: invokestatic #1 // Method dev/jzstd/internal/Bits.mask64:(I)J
    LineNumberTable:
      line245: 95
      line249: 110
      line252: 150
  private static int next();'''.replace('line245', 'line 245').replace('line249', 'line 249').replace('line252', 'line 252')
        self.assertEqual(guard.bytecode_scopes(bits, decoder), dict(first_guard_bci=99, mask_call_bci=120, mask_guard_bci=3))
        with self.assertRaises(ValueError):
            guard.bytecode_scopes(bits, decoder.replace('63', '62'))

    def test_command_timeout_reaps_own_children(self):
        (self.root / 'logs').mkdir()
        (self.root / 'results').mkdir()
        item = dict(name='timeout', argv=[sys.executable, '-c', 'import time;time.sleep(20)'],
                    cwd=str(self.root), timeout_seconds=.2)
        started = time.monotonic()
        with self.assertRaisesRegex(RuntimeError, 'Timeout'):
            q.run_one(item, self.root, started + 5)
        self.assertLess(time.monotonic() - started, 5)

    def test_sigterm_cleanup_and_final_verification(self):
        output = self.root / 'campaign'
        pidfile = self.root / 'pids.json'
        pin = self.root / 'input'
        pin.write_text('immutable')
        child = ("import sys,subprocess,time,json,os;sys.path.insert(0," + repr(str(q.HERE)) + ");import qualify;"
                 "from pathlib import Path;qualify.freeze(Path(" + repr(str(output / 'input-manifests')) + "),Path(" + repr(str(pin)) + "));"
                 "p=subprocess.Popen([sys.executable,'-c','import time;time.sleep(20)']);"
                 "Path(" + repr(str(pidfile)) + ").write_text(json.dumps([os.getpid(),p.pid]));time.sleep(20)")
        script = ("import sys;sys.path.insert(0," + repr(str(q.HERE)) + ");import qualify as q;from pathlib import Path;"
                  "from argparse import Namespace;q.OVERALL_SECONDS=30;q.FINAL_SECONDS=5;"
                  "q.execute(Namespace(output=Path(" + repr(str(output)) + ")),dict(commands=[dict(stage='prepare',name='harmless',"
                  "argv=[sys.executable,'-B','-c'," + repr(child) + "],cwd=" + repr(str(self.root)) + ",timeout_seconds=20)]))")
        with (self.root / 'outer.log').open('wb') as log:
            process = subprocess.Popen([sys.executable, '-B', '-c', script], stdout=log, stderr=subprocess.STDOUT)
            try:
                limit = time.monotonic() + 5
                while not pidfile.exists() and process.poll() is None and time.monotonic() < limit:
                    time.sleep(.05)
                self.assertTrue(pidfile.exists(), (self.root / 'outer.log').read_text())
                process.send_signal(signal.SIGTERM)
                time.sleep(.15)
                process.send_signal(signal.SIGTERM)
                process.wait(timeout=10)
            finally:
                if process.poll() is None:
                    process.kill()
                    process.wait()
        outcome = json.loads((output / 'outcome.json').read_text())
        self.assertFalse(outcome['completed'])
        self.assertIn('Cancelled', outcome['failure'])
        self.assertIsNone(outcome['final_verification_failure'])
        self.assertTrue((output / 'final-verification.json').exists())
        for pid in json.loads(pidfile.read_text()):
            status = Path(f'/proc/{pid}/stat')
            if status.exists():
                self.assertEqual(status.read_text().split()[2], 'Z', 'Live descendant remains')


if __name__ == '__main__':
    unittest.main()
