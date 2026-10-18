#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Offline fixture files/mocks only: never starts Java, Git or another process."""
import json
from pathlib import Path
import re
import tempfile
import types
import unittest
from unittest.mock import Mock, patch
import compare
import identity as i
import matrix as m


class Fixture:
    def __init__(self, root, system='Linux'):
        self.root, self.system = root, system
        self.package_root = root / 'package'
        self.package = self.package_root / 'test/benchmarks/hex-simd'
        self.harness, self.output = root / 'harness', root / 'results'
        self.package.mkdir(parents=True)
        self.output.mkdir(parents=True)
        self.pin = 'a' * 40
        self.original = b'package java.util; public class HexFormat {}\n'
        self.source = {'product': i.PRODUCT, 'baseline': m.BASE,
                       'harness_source': i.HARNESS_SOURCE, 'source_files': {}}
        for name in i.PACKAGE_FILES:
            self.write(self.package / name, 'fixture ' + name)
            self.source['source_files'][name] = i.sha(self.package / name)
        self.source_bytes = (json.dumps(self.source) + '\n').encode()
        self.write(self.package / 'SOURCE.json', self.source_bytes)
        self.receipt = {'revision': i.PRODUCT, 'baseline': m.BASE,
                        'source_tree_root': str(root / 'sources'), 'artifacts': {},
                        'package_sha256': self.source['source_files'].copy()}
        self.images = {}
        suffix = '.dylib' if system == 'Darwin' else '.so'
        cpu = 'aarch64' if system == 'Darwin' else 'x86_64'
        for state in ['baseline', 'candidate']:
            tree = root / 'sources' / state
            image = self.images[state] = tree / 'build/conf/images/jdk'
            names = ['release', 'bin/java', 'lib/modules', 'jmods/java.base.jmod',
                     'lib/libjava' + suffix, 'lib/server/libjvm' + suffix, 'lib/server/classes.jsa']
            if state == 'candidate':
                names.append('lib/libhexsimd' + suffix)
            hashes = {}
            for name in names:
                self.write(image / name, state + name)
                hashes[name] = i.sha(image / name)
            self.receipt['artifacts'][state] = {'retained_path': str(image), 'sha256': hashes}
            spec = '\n'.join(['DEBUG_LEVEL := release', 'JVM_VARIANTS := server',
                'JVM_VARIANT_MAIN := server', 'JVM_FEATURES_server := compiler2 cds serialgc g1gc zgc',
                'TOPDIR := ' + str(tree), 'OPENJDK_TARGET_CPU := ' + cpu,
                'OPENJDK_TARGET_OS := ' + ('macosx' if system == 'Darwin' else 'linux'),
                'ENABLE_HEX_SIMD := ' + ('true' if state == 'candidate' else 'false')]) + '\n'
            snapshot = root / ('spec-' + state)
            self.write(snapshot, spec)
            self.write(image.parents[1] / 'spec.gmk', spec)
            self.receipt['spec-' + state] = {'path': str(snapshot), 'sha256': i.sha(snapshot)}
        self.lock = root / 'sources/candidate/src/java.base/share/native/libhexsimd/rust/Cargo.lock'
        self.write(self.lock, 'fixture frozen lock\n')
        for name in i.REQUIRED_HARNESS:
            self.write(self.harness / name, name)
        self.write(self.harness / 'reference/HexFormat.original', self.original)
        self.write(self.harness / 'reference/java/util/HexFormatReference.java',
                   re.sub(r'\bHexFormat\b', 'HexFormatReference', self.original.decode()))
        self.write(self.harness / 'reference/javac.options', i.REFERENCE_JAVAC_OPTIONS)
        self.receipt['harness_sha256'] = {str(p.relative_to(self.harness)): i.sha(p)
                                        for p in self.harness.rglob('*') if p.is_file()}
        self.receipt_path = root / 'receipt.json'
        self.freeze_receipt()

    @staticmethod
    def write(path, value):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value if isinstance(value, bytes) else value.encode())

    def freeze_receipt(self):
        self.receipt_path.write_text(json.dumps(self.receipt) + '\n')
        self.receipt_sha = i.sha(self.receipt_path)

    def git(self, path, *args):
        if args == ('rev-parse', '--show-toplevel'):
            return str(self.package_root).encode()
        if args == ('rev-parse', 'HEAD'):
            return {str(self.package_root): self.pin,
                    str(self.root / 'sources/candidate'): i.PRODUCT,
                    str(self.root / 'sources/baseline'): m.BASE}[str(path)].encode()
        if args[0] == 'status':
            return b''
        if args[0] == 'show':
            return self.source_bytes if args[1].endswith(':test/benchmarks/hex-simd/SOURCE.json') else self.original
        raise AssertionError(args)

    def frozen(self):
        return i.FrozenInputs(self.receipt_path, self.receipt_sha, self.package, self.pin,
            self.images['baseline'], self.images['candidate'], self.harness, self.output,
            self.system, 'arm64' if self.system == 'Darwin' else 'x86_64', git_read=self.git)


class Offline(unittest.TestCase):
    def setUp(self):
        guard = patch('subprocess.Popen', side_effect=AssertionError('offline test started a process'))
        guard.start()
        self.addCleanup(guard.stop)
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)


class LoadRecords(Offline):
    def test_linux_and_mac_paths(self):
        for name in ['libhexsimd.so', 'libhexsimd.dylib']:
            path = self.root / 'My JDK, native/lib' / name
            text = '[0.01s][info][library] Loaded library ' + str(path) + ', handle 0x1234\n'
            self.assertEqual(m.check_library_load(text, path, True), [str(path)])

    def test_unexpected_libraries_rejected(self):
        expected = self.root / 'candidate/lib/libhexsimd.dylib'
        for name in ['other/libhexsimd.dylib', 'candidate/lib/libhexsimd.so',
                     'candidate/lib/prefixlibhexsimd.dylib', 'candidate/lib/libhexsimd.dylib.extra']:
            text = 'Loaded library ' + str(self.root / name) + ', handle 0x1\n'
            with self.subTest(name=name), self.assertRaises(m.Stop):
                m.check_library_load(text, expected, True)

    def test_unloaded_duplicate_missing_and_malformed(self):
        path = self.root / 'libhexsimd.so'
        line = 'Loaded library ' + str(path) + ', handle 0x1\n'
        self.assertEqual(m.check_library_load('Loaded library /jdk/lib/libjava.so, handle 0x2', path, False), [])
        for text, expected in [(line, False), (line + line, True), ('', True),
                               ('Loaded library ' + str(path), False)]:
            with self.subTest(text=text), self.assertRaises(m.Stop):
                m.check_library_load(text, path, expected)

    def test_timing_methods_require_preflight(self):
        for name in ['cold', 'measurements']:
            with self.assertRaises(m.Stop):
                getattr(m.Campaign(), name)(*([[]] if name == 'measurements' else []))

    def test_real_preflight_uses_only_unmeasured_processes(self):
        for suffix in ['.so', '.dylib']:
            c = m.Campaign()
            c.root, c.repo, c.harness, c.env = self.root, self.root, self.root, {}
            c.jdks = {'baseline': self.root / 'base', 'candidate': self.root / 'candidate'}
            c.library = self.root / ('candidate/lib/libhexsimd' + suffix)
            calls = []
            def run(label, argv, cwd, env, **kwargs):
                self.assertFalse(kwargs['measurement'])
                calls.append(label)
                text = ('Loaded library ' + str(c.library) + ', handle 0x1\n'
                        if label in ['library-encode', 'library-decode'] else '')
                if label.startswith('availability-'):
                    text = 'PASS concurrent first use; nativeAvailable=' + str(label == 'availability-enabled').lower()
                out, err = self.root / (label + '.out'), self.root / (label + '.err')
                out.write_text(text)
                err.write_text('')
                return out, err, 0
            c.s = types.SimpleNamespace(logs=self.root, run=run)
            c.library_preflight()
            self.assertTrue(c.library_preflight_complete)
            self.assertEqual(len(calls), 7)

    def test_preflight_precedes_all_timing_and_failures_stop(self):
        for reject in [False, True]:
            events = []
            frozen = types.SimpleNamespace(verify=lambda when: events.append(when))
            def preflight():
                events.append('library')
                if reject:
                    raise m.Stop('EVIDENCE_OR_CORRECTNESS', 'unexpected library')
            c = types.SimpleNamespace(root=self.root, s=None, library_preflight=preflight,
                cold=lambda: events.append('cold'), measurements=lambda cold: events.append('steady'))
            with patch.object(m, 'adjudicate', return_value={'status': 'LOCAL_GO'}):
                if reject:
                    with self.assertRaises(m.Stop):
                        compare.execute(c, frozen)
                    self.assertEqual(events, ['before', 'library', 'after'])
                else:
                    compare.execute(c, frozen)
                    self.assertEqual(events, ['before', 'library', 'cold', 'steady', 'after'])

    def test_post_identity_failure_overrides_win(self):
        def verify(when):
            if when == 'after':
                raise m.Stop('EVIDENCE_OR_CORRECTNESS', 'mutated artifact')
        c = types.SimpleNamespace(root=self.root, s=None, library_preflight=lambda: None,
                                 cold=lambda: [], measurements=lambda cold: [])
        with patch.object(m, 'adjudicate', return_value={'status': 'LOCAL_GO'}), self.assertRaises(m.Stop):
            compare.execute(c, types.SimpleNamespace(verify=verify))


class Identities(Offline):
    def fixture(self, system='Linux'):
        f = Fixture(self.root / system, system)
        guard = patch.object(m, 'LOCK_SHA', i.sha(f.lock))
        guard.start()
        self.addCleanup(guard.stop)
        return f

    def test_valid_linux_and_mac_receipts_before_after(self):
        for system in ['Linux', 'Darwin']:
            f = self.fixture(system)
            f.frozen().verify('before')
            f.frozen().verify('after')

    def test_receipt_tampering(self):
        f = self.fixture()
        f.receipt_path.write_text(f.receipt_path.read_text() + ' ')
        with self.assertRaises(m.Stop): f.frozen().verify('before')

    def test_wrong_source_pin_or_incomplete_module_receipt(self):
        for target in ['revision', 'modules']:
            f = Fixture(self.root / target)
            with patch.object(m, 'LOCK_SHA', i.sha(f.lock)):
                if target == 'revision': f.receipt['revision'] = 'b' * 40
                else: del f.receipt['artifacts']['candidate']['sha256']['lib/modules']
                f.freeze_receipt()
                with self.assertRaises(m.Stop): f.frozen().verify('before')

    def test_module_library_harness_and_reference_mutations(self):
        for target in ['module', 'library', 'class', 'reference', 'extra']:
            f = Fixture(self.root / target)
            with patch.object(m, 'LOCK_SHA', i.sha(f.lock)):
                path = {'module': f.images['candidate'] / 'lib/modules',
                        'library': f.images['candidate'] / 'lib/libhexsimd.so',
                        'class': f.harness / 'classes/Bench.class',
                        'reference': f.harness / 'patch/java/util/HexFormatReference.class',
                        'extra': f.harness / 'classes/Unexpected.class'}[target]
                Fixture.write(path, 'changed')
                with self.subTest(target=target), self.assertRaises(m.Stop): f.frozen().verify('after')

    def test_workload_build_receipt_must_match_reviewed_source(self):
        f = self.fixture()
        f.receipt['package_sha256']['Bench.java'] = '0' * 64
        f.freeze_receipt()
        with self.assertRaises(m.Stop): f.frozen().verify('before')

    def test_reference_compiler_options_are_bound_and_checked(self):
        f = self.fixture()
        Fixture.write(f.harness / 'reference/javac.options', '-g\n')
        f.receipt['harness_sha256']['reference/javac.options'] = i.sha(f.harness / 'reference/javac.options')
        f.freeze_receipt()
        with self.assertRaisesRegex(m.Stop, 'compiler settings differ'):
            f.frozen().verify('before')

    def test_package_or_spec_mutation(self):
        for target in ['package', 'spec']:
            f = Fixture(self.root / target)
            with patch.object(m, 'LOCK_SHA', i.sha(f.lock)):
                path = f.package / 'compare.py' if target == 'package' else f.images['candidate'].parents[1] / 'spec.gmk'
                Fixture.write(path, 'modified')
                with self.assertRaises(m.Stop): f.frozen().verify('before')

    def test_real_post_identity_rejects_module_mutation_after_provisional_win(self):
        f = self.fixture()
        def cold():
            Fixture.write(f.images['candidate'] / 'lib/modules', 'changed during run')
            return []
        c = types.SimpleNamespace(root=f.output, s=None, library_preflight=lambda: None,
                                 cold=cold, measurements=lambda cold: [])
        with patch.object(m, 'adjudicate', return_value={'status': 'LOCAL_GO'}), self.assertRaises(m.Stop):
            compare.execute(c, f.frozen())


if __name__ == '__main__':
    unittest.main()
