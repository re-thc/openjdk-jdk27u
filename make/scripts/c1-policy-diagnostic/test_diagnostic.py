"""Static and fabricated-data tests only. Never launches a JVM or benchmark."""
import ast
import hashlib
import json
import os
from pathlib import Path
import shlex
import shutil
import subprocess
import tarfile
import tempfile
import unittest
from unittest.mock import Mock, patch

import yaml
import build
import common
import preflight
import run as runner
import stats
import blackhole
import image_views


class ElfLoaderTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.image = self.root / 'images/before'
        self.vm = self.image / 'lib/server/libjvm.so'
        self.vm.parent.mkdir(parents=True)
        self.vm.write_bytes(b'\x7fELF fabricated VM')
        self.library = self.image / 'lib/libattach.so'
        self.library.write_bytes(b'\x7fELF fabricated JNI library')
        self.output = self.root / 'out'
        self.output.mkdir()
        self.vm_dynamic = '(SONAME) Library soname: [libjvm.so]'
        self.initial = 'libjvm.so => not found\n'
        self.contextual = None
        self.context_calls = 0

    def invoke(self, command, limit):
        self.assertEqual(10, limit)
        if command[0] == 'readelf':
            if command[1] == '-h':
                return 'ELF64 Advanced Micro Devices X86-64'
            return self.vm_dynamic if Path(command[-1]) == self.vm else 'NEEDED libjava.so'
        if command[0] == 'ldd':
            return self.initial
        self.assertEqual('env', command[0])
        self.assertEqual(['ldd', str(self.library)], command[2:])
        context = Path(command[1].removeprefix('LD_LIBRARY_PATH='))
        self.assertEqual(['libjvm.so'], [p.name for p in context.iterdir()])
        self.assertEqual(self.vm.resolve(), (context / 'libjvm.so').resolve())
        self.context_calls += 1
        return self.contextual or ('libjvm.so => ' + str(context / 'libjvm.so') + ' (0x123)\n')

    def test_jvm_loaded_context_resolves_only_the_images_own_vm(self):
        # ldd can report the same missing SONAME for direct and transitive edges.
        self.initial *= 2
        environment = dict(os.environ)
        preflight.check_elf(self.root, self.output, self.invoke)
        self.assertEqual(environment, dict(os.environ))
        self.assertEqual(1, self.context_calls)
        records = json.loads((self.output / 'elf-resolution.json').read_text())
        self.assertEqual(self.initial, records[0]['ldd'])
        self.assertEqual(common.sha(self.vm), records[0]['jvm_context']['sha256'])
        hashes = json.loads((self.output / 'resolved-library-hashes.json').read_text())
        self.assertEqual({str(self.vm): common.sha(self.vm)}, hashes)
        self.assertFalse(list(self.output.glob('elf-jvm-*')))

    def test_genuine_missing_dependencies_and_wrong_vm_are_rejected(self):
        cases = [
            ('another dependency', 'libjvm.so => not found\nlibmissing.so => not found\n', None),
            ('context still missing dependency', self.initial, 'libjvm.so => ' + str(self.vm) + '\nlibmissing.so => not found\n'),
            ('wrong contextual VM', self.initial, 'libjvm.so => /wrong/image/libjvm.so (0x123)\n'),
            ('wrong standalone VM', 'libjvm.so => /wrong/image/libjvm.so (0x123)\n', None),
            ('context omits VM', self.initial, 'linux-vdso.so.1 (0x123)\n'),
        ]
        for name, initial, contextual in cases:
            self.initial, self.contextual = initial, contextual
            with self.subTest(name=name), self.assertRaises(ValueError):
                preflight.check_elf(self.root, self.output, self.invoke)
            self.assertFalse(list(self.output.glob('elf-jvm-*')))

    def test_missing_vm_and_wrong_soname_are_rejected(self):
        self.vm.unlink()
        with self.assertRaisesRegex(ValueError, 'Missing image JVM'):
            preflight.check_elf(self.root, self.output, self.invoke)
        self.vm.write_bytes(b'\x7fELF fabricated VM')
        self.vm_dynamic = '(SONAME) Library soname: [different.so]'
        with self.assertRaisesRegex(ValueError, 'SONAME'):
            preflight.check_elf(self.root, self.output, self.invoke)
        self.assertEqual(0, self.context_calls)

    def test_executable_does_not_receive_a_jvm_loaded_context(self):
        executable = self.image / 'bin/java'
        executable.parent.mkdir()
        self.library.rename(executable)
        with self.assertRaisesRegex(ValueError, 'Unresolved ELF'):
            preflight.check_elf(self.root, self.output, self.invoke)
        self.assertEqual(0, self.context_calls)


class DiagnosticTests(unittest.TestCase):
    def test_derived_images_only_omit_reviewed_archives(self):
        self.assertEqual({'lib/server/classes.jsa', 'lib/server/classes_fourbyte.jsa',
                          'lib/server/classes_nocoh.jsa', 'lib/server/classes_nocoops.jsa',
                          'lib/server/classes_nocoops_fourbyte.jsa',
                          'lib/server/classes_nocoops_nocoh.jsa'}, image_views.ARCHIVES)
        for fault in [None, 'archive', 'copy']:
            with self.subTest(fault=fault), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                payload = root / 'payload'
                for arm in ['before', 'current', 'repair']:
                    image = payload / 'images' / arm
                    (image / 'lib/server').mkdir(parents=True)
                    (image / 'lib/server/libjvm.so').write_text(arm)
                    (image / 'lib/modules').write_text('unchanged modules')
                    for name in image_views.ARCHIVES:
                        (image / name).write_text('archive ' + arm + name)
                (payload / 'native-manifest.json').write_text('{}')
                if fault == 'archive':
                    (payload / 'images/before/lib/server/extra.jsa').write_text('unexpected')
                before = common.snapshot(payload)
                destination = root / 'runtime'
                copytree = shutil.copytree
                def corrupt(source, target, *args, **kwargs):
                    result = copytree(source, target, *args, **kwargs)
                    vm = Path(target) / 'lib/server/libjvm.so'
                    if vm.exists():
                        vm.write_text('corruption')
                    return result
                if fault:
                    with patch.object(image_views.shutil, 'copytree', side_effect=corrupt if fault == 'copy' else copytree):
                        with self.assertRaises(ValueError):
                            image_views.prepare_images(payload, destination)
                else:
                    images = image_views.prepare_images(payload, destination, root / 'evidence.json')
                    record = json.loads((root / 'evidence.json').read_text())
                    for arm in ['before', 'current', 'repair']:
                        self.assertEqual(image_views.ARCHIVES, set(record['images'][arm]['omitted']))
                        self.assertFalse(list((images / arm).rglob('*.jsa')))
                        original = common.snapshot(payload / 'images' / arm)
                        self.assertEqual({k: v for k, v in original.items() if k not in image_views.ARCHIVES},
                                         common.snapshot(images / arm))
                self.assertEqual(before, common.snapshot(payload))

    def test_blackhole_errors_and_fallback_modes_are_rejected(self):
        accepted = 'CompileCommand: blackhole some/fake/Class.method bool blackhole = true\n'
        blackhole.validate_probe('openjdk version fixture\n', True)
        blackhole.validate_probe(accepted, False)
        for text, quiet in [('Mark mismatch while restoring from shared file\n' + accepted, False),
                            ('Error occurred during initialization of VM', True),
                            (accepted, True), ('', False),
                            ('CompileCommand: error\n' + accepted, False)]:
            with self.subTest(text=text, quiet=quiet), self.assertRaises(ValueError):
                blackhole.validate_probe(text, quiet)
        valid = ('# Blackhole mode: compiler (auto-detected, fixture)\nHINTS_SHA256=' + 'a' * 64 +
                 '\nBLACKHOLE_READINESS_PASS_AUTO_COMPILER\n')
        blackhole.validate_selection(valid)
        for text in [valid.replace('compiler (auto-detected,', 'compiler (forced,'),
                     valid.replace('compiler (auto-detected,', 'full + dont-inline hint ('),
                     'Mark mismatch while restoring from shared file\n' + valid,
                     valid + '# Blackhole mode: compiler (auto-detected, duplicate)\n']:
            with self.subTest(text=text), self.assertRaises(ValueError):
                blackhole.validate_selection(text)
        expected = 'compiler (auto-detected, fixture)'
        blackhole.validate_timing_mode('# Blackhole mode: ' + expected + '\n', expected)
        for text in ['', '# Blackhole mode: full + dont-inline hint\n',
                     '# Blackhole mode: ' + expected + '\n# Blackhole mode: duplicate\n']:
            with self.subTest(text=text), self.assertRaises(ValueError):
                blackhole.validate_timing_mode(text, expected)

    def test_derived_image_paths_preserve_all_other_timing_arguments(self):
        for row in common.schedule():
            original = common.timing_command(row, Path('/payload'), Path('/output'), 7)
            derived = common.timing_command(row, Path('/payload'), Path('/output'), 7, Path('/runtime/images'))
            self.assertEqual(str(common.image('/payload', row['arm'], '/runtime/images') / 'bin/java'), derived[3])
            derived[3] = original[3]
            derived[derived.index('-jvm') + 1] = original[original.index('-jvm') + 1]
            self.assertEqual(original, derived)

    def test_actual_blackhole_probe_trace_requires_exact_commands_and_zero_exits(self):
        for fault in [None, 'nonzero', 'missing', 'extra-option', 'wrong-image']:
            with self.subTest(fault=fault), tempfile.TemporaryDirectory() as directory:
                prefix = Path(directory) / 'process'
                java = '/runtime/images/repair/bin/java'
                for index, quiet in enumerate([True, False]):
                    if fault == 'missing' and not quiet:
                        continue
                    command = [java] + blackhole.probe_arguments(quiet)
                    if fault == 'extra-option' and quiet:
                        command.insert(1, '-Djmh.blackhole.mode=COMPILER')
                    code = '1' if fault == 'nonzero' and not quiet else '0'
                    executable = '/wrong/image/bin/java' if fault == 'wrong-image' and quiet else java
                    Path(str(prefix) + '.' + str(100 + index)).write_text(
                        'execve("' + executable + '", ' + json.dumps(command) + ', 0x123 /* env */) = 0\n'
                        'exit_group(' + code + ') = ?\n+++ exited with ' + code + ' +++\n')
                if fault:
                    with self.assertRaises(ValueError):
                        blackhole.validate_trace(prefix, java)
                else:
                    probes = blackhole.validate_trace(prefix, java)
                    self.assertEqual(2, len(probes))
                    self.assertTrue(all(probe['exit'] == 0 for probe in probes))

    def test_fixed_protocol_matches_recorded_rows_and_commands(self):
        reference = os.environ.get('REFERENCE_SCHEDULE')
        rows = common.schedule()
        self.assertEqual(196, len(rows))
        self.assertEqual(15, len(common.probes()))
        self.assertEqual([32, 36, 96, 32], [sum(r['phase'] == p for r in rows) for p in 'ABCD'])
        if reference:
            old = json.loads(Path(reference).read_text())
            self.assertEqual(len(old), len(rows))
            for row, prior in zip(rows, old):
                self.assertEqual(row, {k: prior[k] for k in row})
                command = common.timing_command(row, Path('/payload'), Path('/output'), 7)
                expected = prior['command']
                self.assertEqual('-Xshare:off', command.pop(4))
                index = command.index('-jvmArgs')
                self.assertEqual(['-jvmArgs', '-XX:ActiveProcessorCount=2'], command[index:index + 2])
                del command[index:index + 2]
                for key in ['-cp', '-jvm', '-rff']:
                    command[command.index(key) + 1] = expected[expected.index(key) + 1]
                command[2] = expected[2]
                command[3] = expected[3]
                self.assertEqual(command, expected)

    def test_outer_cds_fix_preserves_all_measured_fork_arguments(self):
        for row in common.schedule():
            command = common.timing_command(row, Path('/payload'), Path('/output'), 7)
            self.assertEqual(['-Xshare:off', '-XX:ActiveProcessorCount=2'], command[4:6])
            inherited = shlex.split(command[command.index('-jvmArgs') + 1])
            appended = shlex.split(command[command.index('-jvmArgsAppend') + 1])
            self.assertEqual(['-XX:ActiveProcessorCount=2'], inherited)
            self.assertEqual(['-XX:ActiveProcessorCount=2'] + shlex.split(common.flags(row['mode'], row['route'])),
                             inherited + appended)
            self.assertEqual(1, (inherited + appended).count('-Xshare:off'))

    def test_actual_launcher_readiness_covers_every_arm_and_fails_before_timing(self):
        benchmark = common.plan()['inputs']['ordinary']['benchmark']
        for missing_arm, readiness_only in [(None, False), ('repair', False), ('blackhole', False), (None, True)]:
            with self.subTest(missing_arm=missing_arm, readiness_only=readiness_only), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                output = root / 'results'
                calls = []
                def invoke(driver, command, log, limit, **metadata):
                    calls.append((command, metadata))
                    self.assertEqual('readiness', metadata['phase'])
                    if command[-1] == 'ThreadProbe':
                        return 'FOUR_THREADS_PASS'
                    self.assertEqual('-l', command[-1])
                    self.assertEqual('JMH-list', metadata['kind'])
                    self.assertEqual(20, limit)
                    self.assertEqual(['-Xshare:off', '-XX:ActiveProcessorCount=2'], command[4:6])
                    self.assertEqual('-XX:ActiveProcessorCount=2', command[command.index('-jvmArgs') + 1])
                    return 'Benchmarks:\n' + ('' if metadata['arm'] == missing_arm else benchmark)
                argv = ['run.py', '--payload', str(root / 'payload'), '--output', str(output)]
                if readiness_only:
                    argv += ['--readiness-only']
                with patch('sys.argv', argv), \
                     patch.object(runner.ctypes, 'CDLL') as libc, \
                     patch.object(runner.signal, 'signal'), \
                     patch.object(runner, 'verify_native', return_value={'fixture': True}), \
                     patch.object(runner, 'prepare_images', return_value=root / 'payload/images'), \
                     patch.object(runner, 'check_blackholes',
                                  side_effect=ValueError('fixture blackhole failure') if missing_arm == 'blackhole' else None) as check_bh, \
                     patch.object(runner, 'host_metadata', return_value={'affinity': [0, 1]}), \
                     patch.object(runner, 'require_host'), patch.object(runner, 'check_elf'), \
                     patch.object(runner.Driver, 'invoke', new=invoke), \
                     patch.object(runner, 'execute_protocol', side_effect=RuntimeError('fixture stops after readiness')) as protocol:
                    libc.return_value.prctl.return_value = 0
                    if readiness_only:
                        runner.main()
                    else:
                        with self.assertRaisesRegex((ValueError, RuntimeError),
                                                    'Missing benchmark|fixture blackhole failure|fixture stops after readiness'):
                            runner.main()
                    if missing_arm:
                        protocol.assert_not_called()
                        self.assertFalse((output / 'preflight/PASS.json').exists())
                    else:
                        if readiness_only:
                            protocol.assert_not_called()
                        else:
                            protocol.assert_called_once()
                        self.assertIn('three_actual_JMH_launcher_checks',
                                      json.loads((output / 'preflight/PASS.json').read_text()))
                    if missing_arm == 'repair':
                        check_bh.assert_not_called()
                    else:
                        check_bh.assert_called_once()
                self.assertEqual(['before', 'current', 'repair'],
                                 [m['arm'] for c, m in calls if c[-1] == '-l'])
                completion = json.loads((output / 'completion.json').read_text())
                self.assertEqual((0, 0), (completion['timing_forks'], completion['diagnostic_processes']))
                if readiness_only:
                    self.assertEqual('READINESS_ONLY_PASS; NO TIMING OR QUALIFICATION', completion['status'])
                    self.assertEqual((0, 180), (completion['maximum'], completion['cap_seconds']))

    def test_calibration_failure_stops_exactly_at_32(self):
        events = []
        result = common.execute_protocol(lambda r: events.append(r['tag']),
                                         lambda: False, lambda r: self.fail('Probe after failed calibration'))
        self.assertEqual((32, 0), result)
        self.assertEqual(32, len(events))

    def test_calibration_pass_executes_all_fixed_observations_once(self):
        timings, diagnostics = [], []
        result = common.execute_protocol(timings.append, lambda: True, diagnostics.append)
        self.assertEqual((196, 15), result)
        self.assertEqual(196, len({r['tag'] for r in timings}))
        self.assertEqual(15, len(diagnostics))

    def test_interruption_never_continues_or_retries(self):
        count = 0
        def fail(row):
            nonlocal count
            count += 1
            if count == 9:
                raise TimeoutError('fabricated failure')
        with self.assertRaises(TimeoutError):
            common.execute_protocol(fail, lambda: True, lambda r: self.fail('Probe'))
        self.assertEqual(9, count)

    def test_execution_deadline_prevents_any_new_process(self):
        with tempfile.TemporaryDirectory() as directory:
            driver = runner.Driver(Path(directory))
            self.assertAlmostEqual(3000, driver.deadline - driver.started, places=6)
            with patch.object(runner.time, 'monotonic', return_value=driver.deadline + 1), \
                 patch.object(runner.subprocess, 'Popen') as start:
                with self.assertRaises(TimeoutError):
                    driver.invoke(['never-executed'], Path(directory) / 'fake.log', 60)
                start.assert_not_called()

    def test_process_timeout_uses_remaining_budget_and_owned_cleanup(self):
        with tempfile.TemporaryDirectory() as directory:
            driver = runner.Driver(Path(directory))
            with patch.object(runner.time, 'monotonic', return_value=driver.deadline - 5), \
                 patch.object(runner.subprocess, 'Popen') as start, \
                 patch.object(runner.os, 'killpg') as kill:
                start.return_value.pid = 123456
                start.return_value.wait.side_effect = [subprocess.TimeoutExpired('fabricated', 5), -9]
                with self.assertRaises(subprocess.TimeoutExpired):
                    driver.invoke(['never-executed'], Path(directory) / 'fake.log', 60)
                start.return_value.wait.assert_any_call(timeout=5)
                kill.assert_called_once_with(123456, runner.signal.SIGKILL)
                self.assertIsNone(driver.active)

    def test_statistics_are_the_frozen_bytes_and_family(self):
        self.assertEqual('7d13c1e252e422b9db1f3583cadf6e45338721b40178f0abdfef61e7eb7ba602',
                         common.sha(common.HERE / 'stats.py'))
        p = common.plan()
        self.assertEqual(16, len(p['primary_endpoints']))
        self.assertEqual(4, sum(e['upper_percent_below'] == 0 for e in p['primary_endpoints']))
        self.assertEqual(3000, p['runtime_budget']['hard_total_seconds'])
        self.assertEqual(60, p['runtime_budget']['per_timing_invocation_seconds'])
        self.assertEqual(40, p['runtime_budget']['per_diagnostic_seconds'])
        result = stats.contrast([99, 100, 98, 99, 100, 99, 98, 99], [100] * 8)
        self.assertEqual(16, result['family_endpoints'])
        self.assertGreater(result['familywise_95_upper_percent'], result['nominal_paired_95_percent'][1])
        self.assertTrue(stats.calibration([100] * 8, [100] * 8)['pass'])
        self.assertFalse(stats.calibration([100] * 8, [102] * 8)['pass'])
        self.assertTrue(stats.allocation([64] * 8, [64] * 8)['pass'])
        self.assertFalse(stats.allocation([65] * 8, [64] * 8)['pass'])

    def test_unexpected_native_source_change_is_rejected(self):
        control = {k: {'sha256': 'a'} for k in common.CHANGED}
        repair = {k: {'sha256': 'b'} for k in common.CHANGED}
        self.assertEqual(sorted(common.CHANGED), build.check_delta(control, repair))
        repair['src/hotspot/share/opto/compile.cpp'] = {'sha256': 'c'}
        with self.assertRaises(ValueError):
            build.check_delta(control, repair)

    def test_resource_and_architecture_preflight_rejects_unusable_host(self):
        metadata = {'system': 'Linux', 'machine': 'x86_64', 'runner': {'RUNNER_ARCH': 'X64'},
                    'affinity': [0, 1], 'cpuinfo': 'flags : avx avx2 bmi1 bmi2 f16c fma movbe xsave sse4_1 sse4_2 popcnt cx16 ssse3 sse2 lahf_lm abm',
                    'disk': {'free': 12 * 1024**3},
                    'cgroup': {'cpu.max': '200000 100000', 'memory.max': str(8 * 1024**3),
                               'pids.max': '1024', 'pids.current': '10'}}
        with patch.dict(os.environ, {}, clear=True):
            preflight.require_host(metadata, building=True)
            changed = json.loads(json.dumps(metadata))
            changed['runner']['GITHUB_RUN_ATTEMPT'] = '2'
            with self.assertRaises(ValueError):
                preflight.require_host(changed)
            for group, key, value in [('cgroup', 'cpu.max', '100000 100000'),
                                      ('cgroup', 'memory.max', str(5 * 1024**3)),
                                      ('cgroup', 'pids.current', '1000'),
                                      ('disk', 'free', 1024**3)]:
                changed = json.loads(json.dumps(metadata))
                changed[group][key] = value
                with self.assertRaises(ValueError):
                    preflight.require_host(changed, building=True)

    def test_archive_traversal_and_links_are_rejected(self):
        for name, link in [('../escape', None), ('escape', '/etc/passwd'), ('escape', '../outside')]:
            with self.subTest(name=name, link=link), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                archive = root / 'bad.tar'
                with tarfile.open(archive, 'w') as stream:
                    member = tarfile.TarInfo(name)
                    if link:
                        member.type = tarfile.SYMTYPE
                        member.linkname = link
                    stream.addfile(member)
                with self.assertRaises(ValueError):
                    common.safe_extract(archive, root / 'out')

    def test_prepared_support_exact_files_and_hash_failure(self):
        support = os.environ.get('SUPPORT_DIRECTORY')
        if not support:
            self.skipTest('Set SUPPORT_DIRECTORY for local recreated asset check')
        expected = json.loads((common.HERE / 'support-manifest.json').read_text())
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory) / 'support'
            shutil.copytree(support, root)
            common.verify(root, expected['files'])
            candidate = next(p for p in root.rglob('*') if p.is_file())
            candidate.write_bytes(b'fabricated corruption')
            with self.assertRaises(ValueError):
                common.verify(root, expected['files'])

    def test_unresolved_elf_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            image = root / 'images/before/bin'
            image.mkdir(parents=True)
            (image / 'java').write_bytes(b'\x7fELF fabricated only')
            output = root / 'out'
            output.mkdir()
            def invoke(command, limit):
                return ('ELF64 Advanced Micro Devices X86-64' if command[1] == '-h' else
                        'NEEDED libc.so.6' if command[1] == '-d' else 'libc.so.6 => not found')
            with self.assertRaisesRegex(ValueError, 'Unresolved ELF'):
                preflight.check_elf(root, output, invoke)

    def test_native_provenance_content_and_tool_changes_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            payload = root / 'payload'
            provenance = payload / 'provenance'
            provenance.mkdir(parents=True)
            fake_code = root / 'code'
            fake_code.mkdir()
            support = payload / 'support'
            support.mkdir()
            (support / 'dummy').write_text('fabricated support')
            common.save(fake_code / 'support-manifest.json', {'files': common.snapshot(support)})
            bindings = {'trees': {common.BASE: 'base-tree', common.ORIGINAL: 'original-tree'}}
            for arm in ['current', 'repair']:
                source = {k: {'sha256': hashlib.sha256((arm + k).encode()).hexdigest()}
                          for k in common.CHANGED}
                bindings[arm] = {k: v['sha256'] for k, v in source.items()}
                common.save(provenance / (arm + '-source.json'), source)
                common.save(provenance / (arm + '-compiler-inputs.json'),
                            {'/same-source/' + k: v['sha256'] for k, v in source.items()})
                (provenance / (arm + '-spec.gmk')).write_text('# timestamp\nFLAGS := identical\n')
                (provenance / (arm + '-native-commands.json')).write_text('{}\n')
                generated = provenance / (arm + '-generated-inputs')
                generated.mkdir()
                (generated / 'same.h').write_text('same generated input')
                image = payload / 'images' / arm
                (image / 'lib/server').mkdir(parents=True)
                (image / 'lib/server/libjvm.so').write_text(arm)
                (image / 'modules').write_text('same')
            common.save(fake_code / 'source-bindings.json', bindings)
            for name in ['before', 'after']:
                common.save(provenance / ('tool-inputs-' + name + '.json'), {'fabricated': 'same'})
            revisions = {'before': {'commit': common.ORIGINAL, 'git_tree': 'original-tree'},
                         'current': {'commit': common.BASE, 'git_tree': 'base-tree'},
                         'repair': {'commit': common.BASE, 'git_tree': 'base-tree'}}
            common.save(provenance / 'source-revisions.json', revisions)
            shutil.copyfile(common.HERE / 'production.patch', provenance / 'production.patch')
            native = {'experiment': 'matched-native-rebuild-v1', 'original': common.ORIGINAL,
                      'base': common.BASE, 'patch_sha256': common.PATCH_SHA}
            def bind():
                native['files'] = common.snapshot(payload, excluded=('native-manifest.json',))
                common.save(payload / 'native-manifest.json', native)
            bind()
            with patch.object(preflight, 'HERE', fake_code):
                preflight.verify_native(payload)
                original = (provenance / 'repair-source.json').read_bytes()
                altered = json.loads(original)
                altered[next(iter(common.CHANGED))]['sha256'] = 'wrong-content'
                common.save(provenance / 'repair-source.json', altered)
                bind()
                with self.assertRaisesRegex(ValueError, 'Changed source contents'):
                    preflight.verify_native(payload)
                (provenance / 'repair-source.json').write_bytes(original)
                common.save(provenance / 'tool-inputs-after.json', {'fabricated': 'changed'})
                bind()
                with self.assertRaisesRegex(ValueError, 'Build inputs changed'):
                    preflight.verify_native(payload)

    def test_workflow_branch_scope_pinned_actions_and_shell_syntax(self):
        path = common.HERE.parents[2] / '.github/workflows/main.yml'
        workflow = yaml.load(path.read_text(), Loader=yaml.BaseLoader)
        self.assertEqual({'workflow_dispatch'}, set(workflow['on']))
        self.assertEqual({'expected_head'}, set(workflow['on']['workflow_dispatch']['inputs']))
        self.assertEqual({'diagnostic'}, set(workflow['jobs']))
        self.assertEqual({'contents': 'read', 'actions': 'read'}, workflow['permissions'])
        job = workflow['jobs']['diagnostic']
        self.assertEqual("github.ref == 'refs/heads/diagnose-c1-policy-20261016'", job['if'])
        self.assertEqual('25', job['timeout-minutes'])
        actions = [s['uses'] for s in job['steps'] if 'uses' in s]
        self.assertEqual([
            'actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1',
            'actions/download-artifact@3e5f45b2cfb9172054b4087a40e8e0b5a5461e7c',
            'actions/upload-artifact@043fb46d1a93c77aae656e7c1c64a875d1fc6a0a'], actions)
        self.assertNotIn('build.py', path.read_text())
        download = next(s for s in job['steps'] if s.get('uses', '').startswith('actions/download-artifact@'))
        self.assertEqual('12014298650', download['with']['artifact-ids'])
        self.assertEqual('38815696411', download['with']['run-id'])
        self.assertEqual('error', download['with']['digest-mismatch'])
        self.assertEqual('15', download['timeout-minutes'])
        upload = job['steps'][-1]
        self.assertEqual('${{ always() }}', upload['if'])
        self.assertIn('${{ runner.temp }}/c1-native-results', upload['with']['path'].splitlines())
        self.assertIn('${{ runner.temp }}/c1-native-preflight', upload['with']['path'].splitlines())
        self.assertEqual('${{ always() }}', job['steps'][-2]['if'])
        for job in workflow['jobs'].values():
            self.assertEqual('ubuntu-26.04', job['runs-on'])
            for step in job['steps']:
                if 'uses' in step and not step['uses'].startswith('./'):
                    self.assertRegex(step['uses'], r'@[0-9a-f]{40}$')
                if 'run' in step:
                    subprocess.run(['bash', '-n'], input=step['run'], text=True, check=True)

    def test_dispatch_rejection_keeps_preflight_log_without_network(self):
        workflow = yaml.load((common.HERE.parents[2] / '.github/workflows/main.yml').read_text(),
                             Loader=yaml.BaseLoader)
        step = workflow['jobs']['diagnostic']['steps'][1]
        for attempt, head, error in [('2', 'approved', 'Workflow reruns are not approved'),
                                     ('1', 'different', 'Dispatch is not at the approved diagnostic head')]:
            with self.subTest(attempt=attempt, head=head), tempfile.TemporaryDirectory() as directory:
                environment = dict(os.environ, RUNNER_TEMP=directory, GITHUB_RUN_ATTEMPT=attempt,
                                   EXPECTED_HEAD=head, GITHUB_SHA='approved')
                # An accidental API call would fail on the missing token before I/O.
                environment.pop('GH_TOKEN', None)
                done = subprocess.run(['bash', '-c', step['run']], cwd=common.HERE.parents[2],
                                      env=environment, text=True, capture_output=True, timeout=20)
                self.assertNotEqual(0, done.returncode)
                log = (Path(directory) / 'c1-native-preflight/source-check.log').read_text()
                self.assertIn(error, log)
                self.assertFalse((Path(directory) / 'c1-native-results-source.json').exists())

    def test_staging_failure_keeps_traceback_and_nonzero_exit(self):
        workflow = yaml.load((common.HERE.parents[2] / '.github/workflows/main.yml').read_text(),
                             Loader=yaml.BaseLoader)
        step = next(s for s in workflow['jobs']['diagnostic']['steps']
                    if s.get('name') == 'Unpack the exact build artifact')
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            archive = root / 'c1-native-artifact/native-images.tar'
            archive.parent.mkdir()
            archive.write_bytes(b'fabricated invalid archive')
            environment = dict(os.environ, **step['env'], RUNNER_TEMP=str(root))
            done = subprocess.run(['bash', '-c', step['run']], cwd=common.HERE.parents[2],
                                  env=environment, text=True, capture_output=True, timeout=20)
            self.assertNotEqual(0, done.returncode)
            log = (root / 'c1-native-preflight/staging.log').read_text()
            self.assertIn('Traceback', log)
            self.assertIn('Build artifact archive hash mismatch', log)
            self.assertFalse((root / 'c1-native-payload').exists())
            self.assertFalse((root / 'c1-native-results').exists())

    def test_failed_elf_readiness_keeps_commands_logs_and_hold(self):
        for exit_code in [0, 1]:
            with self.subTest(ldd_exit=exit_code), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                java = root / 'payload/images/before/bin/java'
                java.parent.mkdir(parents=True)
                java.write_bytes(b'\x7fELF fabricated executable')
                output = root / 'results'
                def start(command, **options):
                    text = ('ELF64 Advanced Micro Devices X86-64' if command[1] == '-h' else
                            'NEEDED libc.so.6' if command[1] == '-d' else 'libc.so.6 => not found')
                    options['stdout'].write(text)
                    return Mock(pid=123456, wait=Mock(return_value=exit_code if command[0] == 'ldd' else 0))
                with patch('sys.argv', ['run.py', '--payload', str(root / 'payload'), '--output', str(output)]), \
                     patch.object(runner.ctypes, 'CDLL') as libc, \
                     patch.object(runner.signal, 'signal'), \
                     patch.object(runner, 'verify_native', return_value={'fixture': True}), \
                     patch.object(runner, 'prepare_images', return_value=root / 'payload/images'), \
                     patch.object(runner, 'host_metadata', return_value={'affinity': [0, 1]}), \
                     patch.object(runner, 'require_host'), \
                     patch.object(runner.subprocess, 'Popen', side_effect=start), \
                     patch.object(runner.os, 'waitpid', side_effect=ChildProcessError), \
                     patch.object(runner, 'execute_protocol') as protocol:
                    libc.return_value.prctl.return_value = 0
                    with self.assertRaises((ValueError, RuntimeError)):
                        runner.main()
                    protocol.assert_not_called()
                completion = json.loads((output / 'completion.json').read_text())
                self.assertEqual('HOLD: incomplete', completion['status'])
                self.assertEqual((0, 0), (completion['timing_forks'], completion['diagnostic_processes']))
                self.assertIn('error', completion)
                commands = json.loads((output / 'commands.json').read_text())
                self.assertEqual(['readelf', 'readelf', 'ldd'], [c['command'][0] for c in commands])
                self.assertEqual(exit_code, commands[-1]['exit'])
                self.assertIn('libc.so.6 => not found', Path(commands[-1]['log']).read_text())
                if exit_code == 0:
                    records = json.loads((output / 'preflight/elf-resolution.json').read_text())
                    self.assertIn('libc.so.6 => not found', records[-1]['ldd'])

    def test_workflow_cli_loads_exact_staged_driver_and_frozen_definitions(self):
        expected = {
            'common.py': '2acd5b8c1698bd843696d52e67fd850b8959122f1a0201e2092ade0e6b037f9f',
            'run.py': 'ae5b5869cc4646a5a2229b5be8f0701219c0699f551bd1f2217b123e08767c31',
            'analyze.py': '7930da7976be92f6d810f28c131655e94d926659e6b81f78316da05c92548971',
            'stats.py': '7d13c1e252e422b9db1f3583cadf6e45338721b40178f0abdfef61e7eb7ba602',
            'frozen-plan.json': common.PLAN_SHA,
        }
        for name, digest in expected.items():
            self.assertEqual(digest, common.sha(common.HERE / name))
        for module in [common, runner, stats, preflight, blackhole, image_views]:
            self.assertEqual(common.HERE, Path(module.__file__).resolve().parent)
        self.assertIs(runner.plan, common.plan)
        self.assertIs(runner.execute_protocol, common.execute_protocol)
        self.assertIs(runner.calibration, stats.calibration)
        self.assertIs(runner.check_elf, preflight.check_elf)
        self.assertIs(runner.prepare_images, image_views.prepare_images)
        self.assertIs(runner.check_blackholes, blackhole.check_blackholes)
        workflow = yaml.load((common.HERE.parents[2] / '.github/workflows/main.yml').read_text(),
                             Loader=yaml.BaseLoader)
        step = next(s for s in workflow['jobs']['diagnostic']['steps']
                    if s.get('name') == 'Run bounded readiness only')
        self.assertIn('/usr/bin/python3 make/scripts/c1-policy-diagnostic/run.py', step['run'])
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            payload = root / 'c1-native-payload'
            payload.mkdir()
            for name in ['common.py', 'stats.py', 'preflight.py', 'blackhole.py', 'image_views.py']:
                (payload / name).write_text("raise AssertionError('PAYLOAD_SHADOW_IMPORTED')\n")
            output = root / 'c1-native-results'
            done = subprocess.run(['bash', '-c', step['run']], cwd=common.HERE.parents[2],
                                  env=dict(os.environ, **workflow['env'], RUNNER_TEMP=str(root),
                                           PYTHONPATH=str(payload), PYTHONVERBOSE='1'),
                                  text=True, capture_output=True, timeout=20)
            self.assertNotEqual(0, done.returncode)
            self.assertNotIn('PAYLOAD_SHADOW_IMPORTED', done.stderr)
            self.assertIn('native-manifest.json', done.stderr)
            for name in ['common.py', 'stats.py', 'preflight.py', 'blackhole.py', 'image_views.py']:
                self.assertIn(str(common.HERE / name), done.stderr)
            self.assertEqual(common.PLAN_SHA, common.sha(output / 'frozen-plan.json'))
            self.assertEqual(common.schedule(), json.loads((output / 'fixed-schedule.json').read_text()))
            budget = json.loads((output / 'execution-budget.json').read_text())
            self.assertEqual(expected['run.py'], budget['runner_sha256'])
            self.assertEqual((180, 0, 0), (budget['seconds'], budget['max_timing_forks'], budget['max_compiler_probes']))
            self.assertTrue(budget['readiness_only'])
            completion = json.loads((output / 'completion.json').read_text())
            self.assertEqual((0, 0), (completion['timing_forks'], completion['diagnostic_processes']))
            analysis = next(s for s in workflow['jobs']['diagnostic']['steps']
                            if s.get('name') == 'Analyze without extending runtime or restarting measurements')
            done = subprocess.run(['bash', '-c', analysis['run']], cwd=common.HERE.parents[2],
                                  env=dict(os.environ, **workflow['env'], RUNNER_TEMP=str(root),
                                           PYTHONPATH=str(payload), PYTHONVERBOSE='1'),
                                  text=True, capture_output=True, timeout=20)
            self.assertEqual(0, done.returncode, done.stderr)
            self.assertIn(str(common.HERE / 'stats.py'), done.stderr)
            result = json.loads((output / 'results.json').read_text())
            self.assertEqual('HOLD: not qualified', result['status'])
            self.assertFalse(result['local_screen_accept'])
            self.assertEqual(0, result['executed_forks'])
            self.assertEqual(196, len(result['missing_fixed_forks']))
            self.assertEqual(16, len(result['primary_endpoints']))
            self.assertTrue(all(not endpoint['pass_gate'] for endpoint in result['primary_endpoints']))
            full_output = root / 'full-mode-invalid-input'
            full = subprocess.run(['/usr/bin/python3', str(common.HERE / 'run.py'), '--payload', str(payload),
                                   '--output', str(full_output)], cwd=common.HERE.parents[2],
                                  env=dict(os.environ, **workflow['env']), text=True, capture_output=True, timeout=20)
            self.assertNotEqual(0, full.returncode)
            full_budget = json.loads((full_output / 'execution-budget.json').read_text())
            self.assertEqual((3000, 196, 15),
                             (full_budget['seconds'], full_budget['max_timing_forks'], full_budget['max_compiler_probes']))
            self.assertFalse(full_budget['readiness_only'])

    def test_python_syntax_and_no_embedded_transfer_credentials(self):
        for path in common.HERE.glob('*.py'):
            ast.parse(path.read_text(), filename=str(path))
        for path in [common.HERE.parents[2] / '.github/workflows/main.yml', common.HERE / 'support-manifest.json']:
            text = path.read_text().lower()
            self.assertNotIn('x-amz-signature', text)
            self.assertNotIn('x-goog-signature', text)
            self.assertNotIn('library.openai', text)


if __name__ == '__main__':
    unittest.main(verbosity=2)
