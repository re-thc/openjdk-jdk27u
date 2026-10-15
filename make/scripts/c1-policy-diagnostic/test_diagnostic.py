"""Static and fabricated-data tests only. Never launches a JVM or benchmark."""
import ast
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tarfile
import tempfile
import unittest
from unittest.mock import patch

import yaml
import build
import common
import preflight
import run as runner
import stats


class DiagnosticTests(unittest.TestCase):
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
                for key in ['-cp', '-jvm', '-rff']:
                    command[command.index(key) + 1] = expected[expected.index(key) + 1]
                command[2] = expected[2]
                command[3] = expected[3]
                self.assertEqual(command, expected)

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
        self.assertEqual({'push', 'workflow_dispatch'}, set(workflow['on']))
        self.assertEqual(['diagnose-c1-policy-20261016'], workflow['on']['push']['branches'])
        self.assertEqual({'contents': 'read', 'actions': 'read'}, workflow['permissions'])
        self.assertEqual('90', workflow['jobs']['build']['timeout-minutes'])
        self.assertEqual('75', workflow['jobs']['diagnostic']['timeout-minutes'])
        for job in workflow['jobs'].values():
            self.assertEqual('ubuntu-26.04', job['runs-on'])
            for step in job['steps']:
                if 'uses' in step and not step['uses'].startswith('./'):
                    self.assertRegex(step['uses'], r'@[0-9a-f]{40}$')
                if 'run' in step:
                    subprocess.run(['bash', '-n'], input=step['run'], text=True, check=True)

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
