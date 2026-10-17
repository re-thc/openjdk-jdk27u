# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Offline staging tests: synthetic files; unlink is mocked, no native children.

Successful unlink mocks rename scratch objects into a holding directory, keeping
their bytes available while exercising real post-cleanup namespace verification.
No existing campaign output or compiled/JVM workload is accessed by these tests.
"""
import copy
import io
import json
import os
from pathlib import Path
import signal
import tempfile
import time
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from cancellation import Cancellation
import run as controller
import staging
import staging_cleanup
import supervise
import toolchain_inputs


class StagingTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.campaign = Path(self.temporary.name) / 'campaign'
        self.root = staging.root_path(self.campaign, 'C-release')
        self.holding = Path(self.temporary.name) / 'holding'; self.holding.mkdir()
        self.events = []
        self.audit_count = 0
        self.files = [
            'images/jdk/bin/java', 'images/jdk/bin/javac', 'images/jdk/lib/modules',
            'images/jdk/release', 'images/symbols/libjvm.debuginfo',
            'images/test/hotspot/gtest/server/gtestLauncher',
            'images/test/hotspot/gtest/server/libjvm.so',
            'hotspot/variant-server/libjvm/gtest/gtestLauncher',
            'hotspot/variant-server/libjvm/gtest/libjvm.so',
            'hotspot/variant-server/libjvm/gtest/objs/test_array.o',
            'hotspot/variant-server/libjvm/gtest/objs/test_array.o.cmdline',
            'hotspot/variant-server/libjvm/gtest/objs/objects.txt',
            'hotspot/variant-server/libjvm/objs/array.o',
            'hotspot/variant-server/libjvm/libgtest/libgtest.a',
            'support/native/java.base/libjava/native.o',
            'support/gensrc/header.hpp', 'images/keep.o', 'unlisted/keep.o',
            'build.log', 'configure.log', 'spec.gmk',
        ]
        for name in self.files:
            self.write(name, 'synthetic ' + name)
        self.sealed = staging.seal(self.campaign, 'C-release', lambda: None, self.audit)
        self.plan = staging.make_plan(self.campaign, 'C-release', self.sealed)

    def write(self, name, text):
        p = self.root / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text(text)
        return p

    def audit(self):
        self.audit_count += 1

    def operate(self, **kwargs):
        args = dict(check=lambda: None, audit=self.audit, journal=self.events.append)
        args.update(kwargs)
        return staging.operate(self.campaign, 'C-release', self.sealed, self.plan, **args)

    def preserve_unlink(self, name, *, dir_fd):
        # Preserve all scratch bytes. The mock removes just the selected name
        # from its configuration, allowing the real catalog to check retention.
        os.rename(name, self.holding / str(len(list(self.holding.iterdir()))), src_dir_fd=dir_fd)

    def apply(self, **kwargs):
        with patch.object(staging.os, 'unlink', side_effect=self.preserve_unlink) as unlink:
            result = self.operate(apply=True, approved_policy=staging.POLICY, **kwargs)
        return result, unlink

    def test_exact_manifest_excludes_images_symbols_archives_logs_commands(self):
        names = {x['path'] for x in self.plan['objects']}
        self.assertEqual(names, {'hotspot/variant-server/libjvm/objs/array.o',
            'hotspot/variant-server/libjvm/gtest/objs/test_array.o',
            'support/native/java.base/libjava/native.o'})
        self.assertEqual(self.plan['object_count'], 3)
        self.assertEqual(self.plan['seal_sha256'], staging.digest(self.sealed))

    def test_dry_run_is_exact_and_never_unlinks(self):
        with patch.object(staging.os, 'unlink', side_effect=AssertionError('No deletion')):
            result = self.operate()
        self.assertEqual(result['status'], 'DRY_RUN_VERIFIED')
        self.assertEqual(result['deleted'], [])
        self.assertTrue(all((self.root / f).exists() for f in self.files))

    def test_explicit_policy_required_before_any_unlink(self):
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaisesRegex(RuntimeError, 'not approved'):
                self.operate(apply=True)
            unlink.assert_not_called()

    def test_applied_mock_preserves_every_nonobject_and_records_progress(self):
        result, unlink = self.apply()
        names = [r['path'] for r in self.plan['objects']]
        self.assertEqual(result['deleted'], names)
        self.assertEqual(unlink.call_count, len(names))
        self.assertEqual(result['status'], 'APPLIED_AND_VERIFIED')
        self.assertEqual(len(list(self.holding.iterdir())), 3)
        self.assertTrue(all((self.root / f).exists() for f in self.files if f not in names))
        staging.verify_retained(self.campaign, 'C-release', self.sealed, names, lambda: None, self.audit)
        self.assertEqual([e['event'] for e in self.events].count('unlink-intent'), 3)
        self.assertEqual(self.events[-1]['event'], 'complete')

    def test_modified_or_replaced_object_refused_before_first_unlink(self):
        name = self.plan['objects'][0]['path']
        self.write(name, 'changed')
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaisesRegex(RuntimeError, 'configuration changed'):
                self.operate(apply=True, approved_policy=staging.POLICY)
            unlink.assert_not_called()

    def test_same_bytes_new_inode_refused(self):
        name = self.plan['objects'][0]['path']; p = self.root / name
        replacement = self.holding / 'replacement'; replacement.write_bytes(p.read_bytes())
        replacement.replace(p)
        with self.assertRaisesRegex(RuntimeError, 'configuration changed'):
            self.operate()

    def test_added_object_and_changed_retained_log_refused(self):
        for name in ['support/native/java.base/libjava/new.o', 'build.log']:
            with self.subTest(name=name):
                self.write(name, 'drift')
                with patch.object(staging.os, 'unlink') as unlink:
                    with self.assertRaisesRegex(RuntimeError, 'configuration changed'):
                        self.operate(apply=True, approved_policy=staging.POLICY)
                    unlink.assert_not_called()

    def test_traversal_absolute_and_image_manifest_entries_refused(self):
        for name in ['../outside.o', '/tmp/outside.o', 'images/keep.o',
                     'support/native/java.base/libjava/../outside.o']:
            with self.subTest(name=name):
                plan = copy.deepcopy(self.plan); plan['objects'][0]['path'] = name
                with self.assertRaisesRegex(RuntimeError, 'changed or out of scope'):
                    staging.operate(self.campaign, 'C-release', self.sealed, plan,
                                    check=lambda: None, audit=self.audit)

    def test_wrong_configuration_campaign_or_policy_refused(self):
        for field, value in [('configuration', 'B-release'), ('campaign_root', '/workspace/other'),
                             ('policy', 'all-files'), ('root', '/workspace/other')]:
            plan = copy.deepcopy(self.plan); plan[field] = value
            with self.assertRaises(RuntimeError):
                staging.operate(self.campaign, 'C-release', self.sealed, plan,
                                check=lambda: None, audit=self.audit)
        with self.assertRaises(RuntimeError):
            staging.root_path(self.campaign, 'C-slowdebug')

    def test_hardlinked_compile_object_refused(self):
        os.link(self.root / self.plan['objects'][0]['path'], self.holding / 'link')
        sealed = staging.seal(self.campaign, 'C-release', lambda: None, self.audit)
        with self.assertRaisesRegex(RuntimeError, 'hardlinks'):
            staging.make_plan(self.campaign, 'C-release', sealed)

    def test_symlink_directory_and_ancestor_refused(self):
        original = self.root / 'support/native/java.base/libjava'
        original.rename(self.holding / 'native')
        original.symlink_to(self.holding / 'native', target_is_directory=True)
        with self.assertRaisesRegex(RuntimeError, 'configuration changed'):
            self.operate()
        alias = Path(self.temporary.name) / 'alias'; alias.symlink_to(self.campaign, target_is_directory=True)
        with self.assertRaises(OSError):
            staging.seal(alias, 'C-release', lambda: None, self.audit)

    def test_image_escape_cycle_or_missing_native_runtime_refused(self):
        self.write('outside', 'data')
        (self.root / 'images/escape').symlink_to('../outside')
        with self.assertRaisesRegex(RuntimeError, 'escapes'):
            staging.seal(self.campaign, 'C-release', lambda: None, self.audit)

    def test_image_internal_symlink_is_sealed(self):
        (self.root / 'images/jdk/bin/jvm-alias').symlink_to('java')
        sealed = staging.seal(self.campaign, 'C-release', lambda: None, self.audit)
        self.assertEqual(sealed['entries']['images/jdk/bin/jvm-alias']['target'], 'java')

    def test_image_cycle_refused(self):
        (self.root / 'images/one').symlink_to('two')
        (self.root / 'images/two').symlink_to('one')
        with self.assertRaisesRegex(RuntimeError, 'Cyclic'):
            staging.seal(self.campaign, 'C-release', lambda: None, self.audit)

    def test_missing_packaged_runtime_refused(self):
        p = self.root / 'images/test/hotspot/gtest/server/libjvm.so'
        p.rename(self.holding / 'native-runtime')
        with self.assertRaisesRegex(RuntimeError, 'Incomplete packaged'):
            staging.seal(self.campaign, 'C-release', lambda: None, self.audit)

    def test_manifest_pin_and_immutable_write(self):
        path = self.holding / 'plan.json'; staging.write_new(path, self.plan)
        self.assertEqual(staging.read_pinned(path, staging.digest(self.plan)), self.plan)
        with self.assertRaises(FileExistsError):
            staging.write_new(path, self.plan)
        path.write_text(path.read_text() + ' ')
        with self.assertRaisesRegex(RuntimeError, 'hash differs'):
            staging.read_pinned(path, staging.digest(self.plan))

    def test_changed_object_after_intent_refused(self):
        def journal(row):
            self.events.append(row)
            if row['event'] == 'unlink-intent':
                self.write(row['path'], 'late change')
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaisesRegex(RuntimeError, 'identity changed'):
                self.operate(apply=True, approved_policy=staging.POLICY, journal=journal)
            unlink.assert_not_called()
        self.assertEqual(self.events[-1]['result']['status'], 'HOLD')

    def test_parent_replaced_after_intent_cannot_redirect_unlink(self):
        def journal(row):
            if row['event'] == 'unlink-intent':
                parent = (self.root / row['path']).parent
                parent.rename(self.holding / 'old-parent')
                parent.symlink_to(self.holding / 'old-parent', target_is_directory=True)
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaises(OSError):
                self.operate(apply=True, approved_policy=staging.POLICY, journal=journal)
            unlink.assert_not_called()

    def test_cancellation_during_verification_has_no_unlinks(self):
        cancellation = Cancellation(); calls = 0
        def check():
            nonlocal calls
            calls += 1
            if calls == 5:
                cancellation.request(signal.SIGTERM)
            cancellation.check()
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaises(RuntimeError):
                self.operate(apply=True, approved_policy=staging.POLICY, check=check)
            unlink.assert_not_called()

    def test_partial_cancellation_retains_progress_and_never_becomes_go(self):
        cancellation = Cancellation()
        def journal(row):
            self.events.append(row)
            if row['event'] == 'unlinked':
                cancellation.request(signal.SIGHUP)
        with self.assertRaises(RuntimeError):
            self.apply(check=cancellation.check, journal=journal)
        self.assertEqual(len(list(self.holding.iterdir())), 1)
        self.assertEqual(self.events[-1]['event'], 'failed')
        self.assertEqual(len(self.events[-1]['result']['deleted']), 1)

    def test_failed_unlink_retains_partial_journal(self):
        count = 0
        def unlink(name, *, dir_fd):
            nonlocal count
            count += 1
            if count == 2:
                raise OSError('synthetic unlink failure')
            self.preserve_unlink(name, dir_fd=dir_fd)
        with patch.object(staging.os, 'unlink', side_effect=unlink):
            with self.assertRaises(OSError):
                self.operate(apply=True, approved_policy=staging.POLICY)
        self.assertEqual(len(self.events[-1]['result']['deleted']), 1)

    def test_postcleanup_retained_drift_refused(self):
        def journal(row):
            self.events.append(row)
            if row['event'] == 'unlinked':
                self.write('build.log', 'late evidence drift')
        with self.assertRaisesRegex(RuntimeError, 'Retained configuration changed'):
            self.apply(journal=journal)
        self.assertEqual(self.events[-1]['result']['status'], 'HOLD')

    def test_postcleanup_child_audit_failure_is_hold(self):
        def audit():
            if len(list(self.holding.iterdir())) == 3:
                raise RuntimeError('synthetic live child')
        with self.assertRaisesRegex(RuntimeError, 'live child'):
            self.apply(audit=audit)
        self.assertEqual(self.events[-1]['result']['status'], 'HOLD')

    def test_root_moved_after_intent_refuses_unlink(self):
        def journal(row):
            if row['event'] == 'unlink-intent':
                self.root.rename(self.holding / 'configuration')
                self.root.mkdir()
        with patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaisesRegex(RuntimeError, 'root moved'):
                self.operate(apply=True, approved_policy=staging.POLICY, journal=journal)
            unlink.assert_not_called()

    def test_deadline_checked_between_hash_chunks(self):
        ticks = 0
        def check():
            nonlocal ticks
            ticks += 1
            if ticks >= 10:
                raise RuntimeError('synthetic deadline exhausted')
        with self.assertRaisesRegex(RuntimeError, 'deadline exhausted'):
            self.operate(check=check)

    def test_retention_cannot_exclude_images_or_unknown_objects(self):
        for name in ['images/keep.o', 'images/symbols/libjvm.debuginfo', 'unlisted/keep.o']:
            with self.assertRaisesRegex(RuntimeError, 'outside object policy'):
                staging.verify_retained(self.campaign, 'C-release', self.sealed, [name], lambda: None, self.audit)

    def test_applied_plan_cannot_be_replayed(self):
        self.apply()
        with self.assertRaisesRegex(RuntimeError, 'configuration changed'):
            self.operate()

    def controller(self, policy='dry-run'):
        c = object.__new__(controller.Campaign)
        c.out = self.campaign; c.backend = object(); c.cancel = Cancellation()
        c.staging_number = 0; c.stage = 'correctness-benefit'
        c.stage_end = c.deadline = time.monotonic() + 300
        c.a = SimpleNamespace(storage_cleanup=policy)
        c.sealed = {'C-release': self.sealed}; c.staging_plans = {'C-release': self.plan}
        c.discarded_objects = {'C-release': []}
        staging.write_new(c.out / 'C-release-complete-seal.json', self.sealed)
        staging.write_new(c.out / 'C-release-object-cleanup-plan.json', self.plan)
        return c

    def test_controller_default_dry_run_preserves_objects_and_receipts(self):
        c = self.controller()
        with patch.object(controller, 'require_no_children'), patch.object(staging.os, 'unlink') as unlink:
            result = c.cleanup_configuration('C-release')
        unlink.assert_not_called()
        self.assertEqual(result['status'], 'DRY_RUN_VERIFIED')
        self.assertEqual(c.discarded_objects['C-release'], [])
        report = json.loads(next(c.out.glob('*-staging-*.json')).read_text())
        self.assertEqual(report['status'], 'VERIFIED')
        self.assertIn('minimum_observed_free_bytes', report['storage'])
        self.assertIn('observed_net_free_change_bytes', report)

    def test_controller_approved_policy_and_final_retention_verification(self):
        c = self.controller(staging.POLICY)
        with patch.object(controller, 'require_no_children'), \
             patch.object(staging.os, 'unlink', side_effect=self.preserve_unlink):
            c.cleanup_configuration('C-release')
            c.verify_configuration('C-release')
        self.assertEqual(len(c.discarded_objects['C-release']), 3)
        journal = [json.loads(line) for line in (c.out/'C-release-object-cleanup-journal.jsonl').read_text().splitlines()]
        self.assertEqual(journal[-1]['result']['status'], 'APPLIED_AND_VERIFIED')

    def test_controller_refuses_changed_on_disk_manifest_before_unlink(self):
        c = self.controller(staging.POLICY)
        p = c.out / 'C-release-object-cleanup-plan.json'; p.write_text(p.read_text() + ' ')
        with patch.object(controller, 'require_no_children'), patch.object(staging.os, 'unlink') as unlink:
            with self.assertRaisesRegex(RuntimeError, 'hash differs'):
                c.cleanup_configuration('C-release')
            unlink.assert_not_called()
        report = json.loads(next(c.out.glob('*-staging-*.json')).read_text())
        self.assertEqual(report['status'], 'HOLD')

    def test_owned_exact_old_cleanup_entry_only_with_pinned_manifest(self):
        # Make an independent B configuration from synthetic C fixture names.
        baseline = staging.root_path(self.campaign, 'B-release')
        baseline.parent.mkdir(parents=True)
        self.root.rename(baseline)
        self.root = baseline
        sealed = staging.seal(self.campaign, 'B-release', lambda: None, self.audit)
        plan = staging.make_plan(self.campaign, 'B-release', sealed)
        seal = self.campaign / 'old-B-seal.json'; manifest = self.campaign / 'old-B-plan.json'
        staging.write_new(seal, sealed); staging.write_new(manifest, plan)
        receipt = self.campaign / 'cleanup.json'; owner = self.campaign / 'owner'; owner.mkdir()
        args = ['staging_cleanup.py', '--execute', '--outer-owner-reference', str(owner/'owner.json'),
                '--campaign-root', str(self.campaign), '--configuration', 'B-release',
                '--seal', str(seal), '--seal-sha256', staging.digest(sealed),
                '--manifest', str(manifest), '--manifest-sha256', staging.digest(plan),
                '--receipt', str(receipt), '--harness-commit', 'reviewed',
                '--storage-cleanup', staging.POLICY]
        backend = SimpleNamespace(verify_support=lambda: None)
        def git(directory, *args):
            return 'reviewed' if args == ('rev-parse','HEAD') else ''
        with patch.object(staging_cleanup.sys, 'argv', args), \
             patch.object(staging_cleanup, 'LinuxProcesses', return_value=backend), \
             patch.object(staging_cleanup, 'enable_subreaper'), \
             patch.object(staging_cleanup, 'require_no_children'), \
             patch.object(staging_cleanup, 'git', side_effect=git), \
             patch.object(staging.os, 'unlink', side_effect=self.preserve_unlink):
            self.assertEqual(staging_cleanup.main(), 0)
        result = json.loads(receipt.read_text())
        self.assertEqual(result['status'], 'APPLIED_AND_VERIFIED')
        self.assertFalse(result['qualification_pass'])
        self.assertEqual(len(result['result']['deleted']), 3)


class FreshMatchedSpecTests(unittest.TestCase):
    """Synthetic configure receipts; no configure/compiler/JVM is executed."""
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(); self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        native = self.root/'native'; boot = self.root/'boot'
        for directory, names in [(native, ['gcc-16','g++-16','cc1','cc1plus','mold']),
                                 (boot, ['bin/java','bin/javac','lib/modules','release'])]:
            for name in names:
                p = directory/name; p.parent.mkdir(parents=True, exist_ok=True)
                p.write_bytes(b'\x7fELFsynthetic' if directory == native else b'synthetic boot input')
        self.fields = {'CC': str(native/'gcc-16'), 'CXX': str(native/'g++-16'),
                       'CC_VERSION_NUMBER': '16.2.0', 'CXX_VERSION_NUMBER': '16.2.0',
                       'BOOT_JDK': str(boot), 'JVM_FEATURES_server': 'g1gc serialgc zgc',
                       'ENABLE_DESKTOP': 'false', 'JVM_VARIANTS': 'server',
                       'ENABLE_JAVAC_SERVER': 'true', 'ASAN_ENABLED': 'false'}
        c = self.c = object.__new__(controller.Campaign)
        c.out = self.root/'output'; c.out.mkdir(); c.continuation = None
        c.toolchain_inputs = toolchain_inputs.capture(boot, [native], lambda: None)
        c.cancel = Cancellation(); c.stage = 'release-builds'; c.clock_guard = None
        c.stage_end = c.deadline = time.monotonic()+120
        c.a = SimpleNamespace(boot=boot, jtreg=self.root/'jtreg', gtest=self.root/'gtest',
                              configure_option=[])
        controller.save(c.out/'matched-toolchain-inputs.json', c.toolchain_inputs)
        for tag in ['B', 'C']:
            self.spec(tag)
            image = c.out/tag/'build'/f'{tag}-release'/'images/jdk'
            image.mkdir(parents=True); (image/'release').write_text('synthetic image')

    def spec(self, tag, fields=None):
        p = self.c.out/tag/'build'/f'{tag}-release'/'spec.gmk'; p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(''.join(f'{key} := {value}\n' for key,value in (fields or self.fields).items()))
        return p

    def test_fresh_matched_receipts_apply_without_continuation(self):
        self.assertIsNone(self.c.continuation)
        for tag in ['B', 'C']:
            image = self.c.image_receipt(self.c.out/tag, f'{tag}-release', False)
            self.assertTrue((image/'release').is_file())
            self.assertTrue((self.c.out/f'{tag}-release-spec.json').is_file())

    def test_fresh_out_of_root_cc_and_cxx_rejected_even_when_pair_matches(self):
        outside = self.root/'uncataloged-compiler'; outside.write_bytes(b'\x7fELFother')
        for key in ['CC', 'CXX']:
            with self.subTest(key=key):
                fields = {**self.fields, key: str(outside)}
                self.spec('B', fields); self.spec('C', fields)
                for tag in ['B', 'C']:
                    with self.assertRaisesRegex(RuntimeError, 'outside captured native input roots: '+key):
                        self.c.image_receipt(self.c.out/tag, f'{tag}-release', False)

    def test_fresh_candidate_spec_mismatch_rejected_for_every_matched_field(self):
        alternatives = {'CC': self.fields['CXX'], 'CXX': self.fields['CC'],
                        'CC_VERSION_NUMBER': 'other', 'CXX_VERSION_NUMBER': 'other',
                        'BOOT_JDK': '/other/boot', 'JVM_FEATURES_server': 'g1gc serialgc',
                        'ENABLE_DESKTOP': 'true', 'JVM_VARIANTS': 'client',
                        'ENABLE_JAVAC_SERVER': 'false'}
        for key, value in alternatives.items():
            with self.subTest(key=key):
                self.spec('C', {**self.fields, key: value})
                with self.assertRaisesRegex(RuntimeError, 'toolchain or profile differs: '+key):
                    self.c.image_receipt(self.c.out/'C', 'C-release', False)

    def test_fresh_pair_cannot_select_an_uncaptured_boot(self):
        alternate = self.root/'other-boot'; alternate.mkdir()
        for tag in ['B', 'C']:
            self.spec(tag, {**self.fields, 'BOOT_JDK': str(alternate)})
        with self.assertRaisesRegex(RuntimeError, 'outside captured boot inputs'):
            self.c.image_receipt(self.c.out/'B', 'B-release', False)

    def test_fresh_missing_catalog_refused(self):
        self.c.toolchain_inputs = None
        with self.assertRaisesRegex(RuntimeError, 'Missing prospective matched toolchain catalog'):
            self.c.image_receipt(self.c.out/'B', 'B-release', False)

    def test_fresh_missing_or_duplicate_compiler_spec_refused(self):
        for change in ['missing', 'duplicate']:
            with self.subTest(change=change):
                p = self.spec('B')
                text = p.read_text()
                p.write_text(text.replace('CC :=', 'OTHER_CC :=') if change == 'missing'
                             else text+'CC := '+self.fields['CC']+'\n')
                with self.assertRaisesRegex(RuntimeError, 'toolchain or profile differs: CC'):
                    self.c.image_receipt(self.c.out/'B', 'B-release', False)

    def test_fresh_configured_uncataloged_compiler_stops_before_make(self):
        outside = self.root/'uncataloged-compiler'; outside.write_bytes(b'\x7fELFother')
        self.spec('B', {**self.fields, 'CC': str(outside)})
        self.spec('C', {**self.fields, 'CC': str(outside)})
        calls = []
        self.c.run = lambda label, *args, **kwargs: calls.append(label)
        with patch.object(self.c, 'seal_configuration') as sealed:
            with self.assertRaisesRegex(RuntimeError, 'outside captured native input roots'):
                self.c.build('C')
            sealed.assert_not_called()
        self.assertEqual(calls, ['configure-C-release'])

    def test_fresh_postbuild_spec_drift_refused_before_sealing(self):
        calls = []
        def run(label, *args, **kwargs):
            calls.append(label)
            if label == 'build-C-release':
                self.spec('C', {**self.fields, 'CXX_VERSION_NUMBER': 'changed during make'})
        self.c.run = run
        with patch.object(self.c, 'seal_configuration') as sealed:
            with self.assertRaisesRegex(RuntimeError, 'toolchain or profile differs: CXX_VERSION_NUMBER'):
                self.c.build('C')
            sealed.assert_not_called()
        self.assertEqual(calls, ['configure-C-release', 'build-C-release'])


class ControllerOrderTests(unittest.TestCase):
    def campaign(self, stop='all', fail=None):
        c = object.__new__(controller.Campaign)
        c.out = Path('/synthetic/output'); c.backend = object(); c.samples = []
        c.a = SimpleNamespace(stop_after=stop); c.sealed = {}; events = []
        def event(name):
            events.append(name)
            if name == fail:
                raise RuntimeError('synthetic gate failure')
        c.begin = lambda name, seconds: event('begin-' + name)
        c.run = lambda *args, **kw: event('offline-or-profile')
        c.checkout = lambda: event('checkout')
        def build(tag, debug='release', asan=False):
            conf = tag + '-' + debug + ('-asan' if asan else '')
            event('build-' + conf); c.sealed[conf] = {}; return Path('/image') / conf
        c.build = build
        c.cleanup_configuration = lambda conf: event('cleanup-' + conf)
        c.verify_configuration = lambda conf: event('verify-' + conf)
        c.native = lambda image, conf, **kw: event('native-' + conf)
        c.old_control = lambda image: event('old-control')
        c.correctness = lambda image, name, **kw: event('correctness-' + name)
        c.compile_sources = lambda: event('compile-fixtures')
        c.memory = lambda images: event('memory')
        c.performance = lambda images, cp: event('performance')
        return c, events

    def exercise(self, campaign):
        import analyze
        with patch.object(controller.shutil, 'disk_usage', return_value=SimpleNamespace(free=20*1024**3)), \
             patch.object(controller, 'save'), patch.object(controller, 'require_no_children'), \
             patch.object(analyze, 'analyze', return_value={'decision': 'LOCAL_GO'}):
            return campaign.all()

    def test_all_cleanup_boundaries_follow_final_compile_consumers(self):
        c, events = self.campaign(); result = self.exercise(c)
        for first, second in [('build-B-release','cleanup-B-release'),
                              ('cleanup-B-release','build-C-release'),
                              ('old-control','cleanup-C-release'),
                              ('correctness-C','cleanup-C-release'),
                              ('cleanup-C-release','memory'),
                              ('correctness-C-fastdebug','cleanup-C-fastdebug'),
                              ('cleanup-C-fastdebug','build-C-release-asan'),
                              ('native-C-release-asan','cleanup-C-release-asan')]:
            self.assertLess(events.index(first), events.index(second))
        self.assertEqual(result['decision'], 'LOCAL_GO_FOR_REVIEW')

    def test_negative_control_or_correctness_failure_keeps_candidate_objects(self):
        for failure in ['old-control', 'correctness-C']:
            c, events = self.campaign(fail=failure)
            with self.assertRaises(RuntimeError):
                self.exercise(c)
            self.assertNotIn('cleanup-C-release', events)

    def test_fastdebug_failure_keeps_objects_and_never_launches_asan(self):
        c, events = self.campaign(fail='correctness-C-fastdebug')
        with self.assertRaises(RuntimeError):
            self.exercise(c)
        self.assertNotIn('cleanup-C-fastdebug', events)
        self.assertNotIn('build-C-release-asan', events)

    def test_debug_twelve_gib_gate_unchanged(self):
        c, events = self.campaign()
        import analyze
        with patch.object(controller.shutil, 'disk_usage', return_value=SimpleNamespace(free=12*1024**3-1)), \
             patch.object(controller, 'save'), \
             patch.object(analyze, 'analyze', return_value={'decision': 'LOCAL_GO'}):
            result = c.all()
        self.assertEqual(result['decision'], 'HOLD_DEBUG_STORAGE')
        self.assertNotIn('build-C-fastdebug', events)

    def test_expired_staging_budget_records_hold_before_operation(self):
        with tempfile.TemporaryDirectory() as folder:
            c = object.__new__(controller.Campaign)
            c.out = Path(folder); c.backend = object(); c.cancel = Cancellation()
            c.staging_number = 0; c.stage = 'release-builds'
            c.stage_end = time.monotonic()-1; c.deadline = time.monotonic()+300
            with patch.object(controller, 'require_no_children'):
                with self.assertRaisesRegex(RuntimeError, 'deadline exhausted'):
                    c.staging_operation('C-release', 'synthetic', lambda check, audit: self.fail('expired'))
            receipt = json.loads(next(c.out.glob('*-staging-*.json')).read_text())
            self.assertEqual(receipt['status'], 'HOLD')

    def test_cleanup_only_parent_defers_manifest_reads_to_owned_child(self):
        with tempfile.TemporaryDirectory() as folder:
            owner = Path(folder)/'owner'; calls = []
            class Owner:
                def __init__(self, *args, **kwargs):
                    self.kwargs = kwargs
                def run(self, argv):
                    calls.append((argv, self.kwargs))
                    return {'status': 'HOLD'}
            args = ['supervise.py','--execute','--cleanup-only','--owner-output',str(owner),
                    '--','--manifest','/not-read-in-parent']
            with patch.object(supervise.sys, 'argv', args), \
                 patch.object(supervise, 'LinuxProcesses'), patch.object(supervise, 'Supervisor', Owner), \
                 patch.object(staging, 'read_pinned', side_effect=AssertionError('outside owner')), \
                 patch.object(supervise.sys, 'stdout', io.StringIO()):
                self.assertEqual(supervise.main(), 2)
            argv, kwargs = calls[0]
            self.assertTrue(argv[1].endswith('/staging_cleanup.py'))
            self.assertEqual(kwargs['seconds'], 240)
            self.assertIsNone(kwargs['utc_cutoff'])

    def test_cleanup_only_rejects_continuation_instead_of_resetting_its_budget(self):
        with tempfile.TemporaryDirectory() as folder:
            owner = Path(folder)/'owner'
            args = ['supervise.py','--execute','--cleanup-only','--owner-output',str(owner),
                    '--continuation','/unused','--matched-rebuild','--','--manifest','/unused']
            with patch.object(supervise.sys, 'argv', args), \
                 patch.object(supervise, 'LinuxProcesses'), patch.object(supervise.sys, 'stderr', io.StringIO()):
                with self.assertRaises(SystemExit):
                    supervise.main()
            self.assertFalse(owner.exists())


if __name__ == '__main__':
    unittest.main()
