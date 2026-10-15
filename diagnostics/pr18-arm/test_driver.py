# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This diagnostic is distributed under the GNU General Public License version 2.

"""Exercise the complete diagnostic driver with synthetic data and no subprocesses.

These tests validate orchestration and reporting. They provide no JDK correctness,
code-generation or performance evidence. Every command, including objdump, is mocked.
"""
import contextlib
import copy
import hashlib
import io
import json
import os
from pathlib import Path
import runpy
import subprocess
import tempfile
import unittest
from unittest.mock import patch

DRIVER = Path(os.environ.get('PR18_DRIVER', Path(__file__).with_name('run.py'))).resolve()
PROTOCOL = json.loads(DRIVER.with_name('protocol.json').read_text())
CHECKSUM = 'checksum=3c84c971e300cb2c\n'
CODE = bytes.fromhex('1f2003d5')  # Synthetic AArch64 nop, never executed.
CODE_SHA = hashlib.sha256(CODE).hexdigest()


class SyntheticRun:
    def __init__(self, directory, *, vl=16, fault=None):
        self.root = directory
        self.evidence = directory / 'evidence'
        self.evidence.mkdir()
        self.repo = directory / 'repo'
        self.repo.mkdir()
        self.vl = vl
        self.fault = fault
        self.commands = []
        self.stages = set()
        self.forks = []
        self.error = None
        self.provisional_summaries = []
        for name in ['base', 'candidate']:
            image = directory / 'images' / name
            (image / 'bin').mkdir(parents=True)
            # Non-executable files make an accidentally unmocked Java launch fail.
            (image / 'bin/java').write_text('synthetic, non-executable JDK placeholder\n')
            (image / 'lib').mkdir()
            (image / 'lib/libjvm.so').write_bytes(name.encode())
        manifest = {name: {'jdk': str(directory / 'images' / name)} for name in ['base', 'candidate']}
        manifest.update(jtreg={'jar': str(directory / 'jtreg.jar')}, classpath=str(directory / 'classes'))
        (directory / 'manifest.json').write_text(json.dumps(manifest))
        (self.evidence / 'hardware.json').write_text(json.dumps({
            'native': True, 'sve': vl > 0, 'maximum_sve_vl_bytes': vl,
            'description': 'Synthetic fixture; not a native hardware observation'}))

    def stage(self, args):
        if args[0] == 'objdump': return 'objdump'
        if 'org.openjdk.jmh.Main' in args: return 'jmh'
        if '-version' in args: return 'flags'
        if '-jar' in args:
            if '-listTests' in args: return 'jtreg-preflight'
            return 'range-jtreg' if args[-1].endswith('TestVectorMulLongToSignedUnsignedInt.java') else 'jtreg'
        if 'DumpMultiplyCode' in args: return 'codegen'
        if 'BenchmarkCheck' in args: return 'benchmark-check'
        if 'MultiplyLoops' in args:
            if '-Xint' in args: return 'interpreter'
            if '-XX:TieredStopAtLevel=1' in args: return 'c1'
            return 'scalar-c2'
        raise AssertionError(f'Unrecognized command: {args}')

    def run_command(self, args, **kwargs):
        assert isinstance(args, list) and all(isinstance(x, str) for x in args), args
        stage = self.stage(args)
        self.stages.add(stage)
        self.commands.append(args.copy())
        if stage == 'objdump':
            return subprocess.CompletedProcess(args, 0, 'synthetic disassembly: nop\n', '')
        log = Path(kwargs['stdout'].name)
        folder = log.parent
        recorded = json.loads((folder / 'command.json').read_text())
        assert recorded == args, (recorded, args)
        if self.fault == 'interpreter-exit' and stage == 'interpreter':
            kwargs['stdout'].write('synthetic subprocess failure\n')
            return subprocess.CompletedProcess(args, 7)
        if stage == 'jmh':
            previous = self.evidence / 'summary.json'
            if previous.exists():
                self.provisional_summaries.append(json.loads(previous.read_text()))
            if self.fault == 'timing-timeout':
                raise subprocess.TimeoutExpired(args, kwargs['timeout'])
            if self.fault == 'partial-comparison-exit' and folder.name == 'ab-1-0-A':
                return subprocess.CompletedProcess(args, 9)
            self.write_timing(args, folder)
        elif stage == 'codegen':
            assert Path(args[-1]) == folder
            for name in ['fourLongs', 'differentLongs', 'bytes', 'shorts', 'ints']:
                (folder / (name + '.bin')).write_bytes(CODE)
            kwargs['stdout'].write(CHECKSUM * 2)
        elif stage in ['interpreter', 'c1', 'scalar-c2']:
            # Verify the original Path-valued classpath is normalized and recorded.
            assert args[args.index('-cp') + 1] == str(self.root / 'classes')
            kwargs['stdout'].write(CHECKSUM)
        else:
            kwargs['stdout'].write('synthetic successful command\n')
        return subprocess.CompletedProcess(args, 0)

    def write_timing(self, args, folder):
        label = folder.name
        assert label not in [x['label'] for x in self.forks], label
        method = args[args.index('org.openjdk.jmh.Main') + 1].removeprefix('^bench.MultiplyBench.').removesuffix('$')
        image = 'candidate' if args[args.index('-jvm') + 1] == str(self.root / 'images/candidate/bin/java') else 'base'
        params = [args[i + 1] for i, value in enumerate(args) if value == '-p']
        flags = args[args.index('-jvmArgs') + 1]
        for flag in ['-Xms256m', '-Xmx256m', '-Xshare:off', '-XX:ActiveProcessorCount=1', '-Xbatch', '-XX:+WhiteBoxAPI']:
            assert flag in flags
        assert args[args.index('-wi') + 1] == str(PROTOCOL['warmup_iterations'])
        assert args[args.index('-i') + 1] == str(PROTOCOL['measurement_iterations'])
        assert args[args.index('-w') + 1] == '1s' and args[args.index('-r') + 1] == '1s'
        score = 100.0
        if label.startswith('aa-'):
            assert image == 'base' and method == 'fourLongs'
            if self.fault == 'calibration' and label.endswith('-B'): score = 110.0
        elif image == 'candidate':
            if method == 'fourLongs' and '-XX:-UseSuperWord' not in flags: score = 80.0
            if self.fault == 'control-regression' and method == 'differentLongs': score = 110.0
        if self.fault == 'image-verification-error':
            (self.evidence / 'base-image-before.json').unlink(missing_ok=True)
        if self.fault == 'image-mutation':
            (self.root / 'images/candidate/lib/libjvm.so').write_bytes(b'modified synthetic image')
        gc = 1 if self.fault == 'measured-gc' and label.startswith('ab-0-') else 0
        data = [{'primaryMetric': {'score': score, 'rawData': [[score] * 5]}, 'secondaryMetrics': {'gc.count': {'score': gc}}}]
        Path(args[args.index('-rff') + 1]).write_text(json.dumps(data))
        (folder / 'stub.bin').write_bytes(CODE)
        stub = {'level': 4, 'compile_id': 123, 'sha256': CODE_SHA, 'file': 'stub.bin',
                'code_begin': 4096, 'entry_address': 4096, 'bytes': len(CODE)}
        for sequence in range(5):
            before = {'uptime_ms': 10000 + sequence * 1000, 'worker_allocated_bytes': 100,
                      'worker_cpu_ns': 0, 'timed_stub': {'normal': stub}}
            after = copy.deepcopy(before)
            after.update(uptime_ms=11000 + sequence * 1000, worker_allocated_bytes=101, worker_cpu_ns=1000000000)
            item = {'sequence': sequence, 'type': 'MEASUREMENT', 'before': before, 'after': after,
                    'measured_operations': 1000, 'score_ns_per_op': score}
            (folder / f'iteration-{sequence}.json').write_text(json.dumps(item))
        (folder / 'compilation.xml').write_text(
            '<hotspot_log><nmethod compile_id="123" stamp="1.0" method="bench.MultiplyBench ' + method + ' ()J"/></hotspot_log>')
        self.forks.append({'label': label, 'method': method, 'image': image, 'params': params, 'flags': flags})

    def check_output(self, args, **kwargs):
        assert args == ['lscpu', '-e'], args
        return 'synthetic CPU topology\n'

    def execute(self):
        output = io.StringIO()
        with patch.dict(os.environ, ARM_ROOT=str(self.root), GITHUB_WORKSPACE=str(self.repo)), \
             patch('subprocess.run', side_effect=self.run_command), \
             patch('subprocess.check_output', side_effect=self.check_output), \
             patch('subprocess.Popen', side_effect=AssertionError('No real subprocess is allowed')), \
             patch('os.sched_getaffinity', return_value={0, 1, 2, 3}, create=True), \
             contextlib.redirect_stdout(output):
            try:
                runpy.run_path(str(DRIVER), run_name='__main__')
            except Exception as error:
                self.error = error
        self.log = output.getvalue()
        self.summary = json.loads((self.evidence / 'summary.json').read_text())
        return self


class DriverTest(unittest.TestCase):
    def exercise(self, **options):
        directory = tempfile.TemporaryDirectory(prefix='pr18-synthetic-driver-')
        self.addCleanup(directory.cleanup)
        return SyntheticRun(Path(directory.name), **options).execute()

    def assert_unqualified(self, run):
        self.assertFalse(run.summary['performance_qualified'])
        for case in run.summary['comparisons']:
            self.assertFalse(case['qualified'])
            self.assertFalse(case['measured_improvement'])

    def assert_complete(self, run, count):
        self.assertIsNone(run.error, repr(run.error))
        self.assertTrue(run.summary['completed_fixed_protocol'])
        self.assertEqual(len(run.forks), count)
        self.assertEqual(len({x['label'] for x in run.forks}), count)
        self.assertEqual(run.stages, {'flags', 'jtreg-preflight', 'jtreg', 'range-jtreg',
            'interpreter', 'c1', 'scalar-c2', 'codegen', 'benchmark-check', 'objdump', 'jmh'})
        self.assertTrue(run.summary['base_image_unchanged'])
        self.assertTrue(run.summary['candidate_image_unchanged'])
        for provisional in run.provisional_summaries:
            self.assertFalse(provisional['performance_qualified'])
            for case in provisional['comparisons']:
                self.assertFalse(case['qualified'])
                self.assertFalse(case['measured_improvement'])
        cases = PROTOCOL['comparison']['cases_always'] + PROTOCOL['comparison'][
            'additional_if_sve256' if run.vl >= 32 else 'fallback_if_no_sve256']
        self.assertEqual([x['case'] for x in run.summary['comparisons']], cases)
        for index, case in enumerate(cases):
            method, length, offset, mode = case
            observations = [x for x in run.forks if x['label'].startswith(f'ab-{index}-')]
            self.assertEqual(len(observations), 8)
            for item in observations:
                self.assertEqual(item['method'], method)
                self.assertEqual(item['params'], [f'length={length}', f'offset={offset}'])
                if mode == 'neon':
                    self.assertIn('-XX:UseSVE=0', item['flags'])
                    self.assertIn('-XX:MaxVectorSize=16', item['flags'])
                elif mode == 'scalar':
                    self.assertIn('-XX:-UseSuperWord', item['flags'])
                elif mode.startswith('sve'):
                    self.assertIn('-XX:UseSVE=1', item['flags'])
                    self.assertIn('-XX:MaxVectorSize=' + str(int(mode[3:]) // 8), item['flags'])

    def test_complete_narrow_protocol_and_path_arguments(self):
        run = self.exercise()
        self.assert_complete(run, 112)
        self.assertTrue(run.summary['performance_qualified'])
        self.assertEqual(run.summary['supported_test_scenarios'], [0, 1])
        self.assertEqual(run.summary['unsupported_test_scenarios'], [2, 3])
        self.assertTrue(any(x['measured_improvement'] for x in run.summary['comparisons']))

    def test_minimum_wide_vector_length(self):
        run = self.exercise(vl=32)
        self.assert_complete(run, 152)
        self.assertEqual(run.summary['supported_test_scenarios'], [0, 1, 2])
        self.assertFalse(any('-XX:MaxVectorSize=64' in args for args in run.commands))

    def test_complete_wide_protocol_and_all_codegen_modes(self):
        run = self.exercise(vl=64)
        self.assert_complete(run, 152)
        self.assertEqual(run.summary['supported_test_scenarios'], [0, 1, 2, 3])
        self.assertTrue(run.summary['performance_qualified'])
        self.assertTrue(any('-XX:MaxVectorSize=64' in args for args in run.commands))

    def test_non_sve_protocol_avoids_sve_modes(self):
        run = self.exercise(vl=0)
        self.assert_complete(run, 112)
        self.assertEqual(run.summary['supported_test_scenarios'], [0])
        self.assertFalse(any('-XX:UseSVE=1' in ' '.join(args) for args in run.commands))

    def test_control_regression_revokes_all_case_qualification(self):
        run = self.exercise(fault='control-regression')
        self.assert_complete(run, 112)
        self.assertTrue(any(x['significant_regression_above_5_percent'] for x in run.summary['comparisons']))
        self.assert_unqualified(run)

    def test_image_mutation_revokes_all_case_qualification(self):
        run = self.exercise(fault='image-mutation')
        self.assertIsNone(run.error, repr(run.error))
        self.assertTrue(run.summary['completed_fixed_protocol'])
        self.assertFalse(run.summary['candidate_image_unchanged'])
        self.assert_unqualified(run)

    def test_image_verification_error_revokes_all_case_qualification(self):
        run = self.exercise(fault='image-verification-error')
        self.assertIsNone(run.error, repr(run.error))
        self.assertTrue(run.summary['completed_fixed_protocol'])
        self.assertIn('base_image_verification_error', run.summary)
        self.assert_unqualified(run)

    def test_calibration_failure_retains_fixed_diagnostic_comparisons(self):
        run = self.exercise(fault='calibration')
        self.assert_complete(run, 112)
        self.assertFalse(run.summary['calibration']['passed'])
        self.assertEqual(len(run.summary['calibration']['all_forks']), 16)
        self.assert_unqualified(run)

    def test_gc_failure_revokes_all_case_qualification(self):
        run = self.exercise(fault='measured-gc')
        self.assert_complete(run, 112)
        self.assertTrue(any(not x['integrity_passed'] for x in run.summary['comparisons']))
        self.assert_unqualified(run)

    def test_path_command_failure_retains_command_log_and_summary(self):
        run = self.exercise(fault='interpreter-exit')
        self.assertIsInstance(run.error, RuntimeError)
        self.assertIn('base-interpreter: exit 7', run.summary['error'])
        folder = run.evidence / 'base-interpreter'
        self.assertEqual((folder / 'exit-code.txt').read_text(), '7')
        self.assertIn('synthetic subprocess failure', (folder / 'stdout.log').read_text())
        self.assertTrue(all(isinstance(x, str) for x in json.loads((folder / 'command.json').read_text())))
        self.assert_unqualified(run)

    def test_timeout_retains_failure_report_without_qualifying(self):
        run = self.exercise(fault='timing-timeout')
        self.assertIsInstance(run.error, subprocess.TimeoutExpired)
        self.assertIn('TimeoutExpired', run.summary['error'])
        self.assertTrue((run.evidence / 'correctness-complete.json').exists())
        self.assertTrue((run.evidence / 'aa-0-0-A/command.json').exists())
        self.assert_unqualified(run)

    def test_interrupted_comparison_retains_provisional_results_unqualified(self):
        run = self.exercise(fault='partial-comparison-exit')
        self.assertIsInstance(run.error, RuntimeError)
        self.assertEqual(len(run.summary['comparisons']), 1)
        self.assertEqual(len(run.summary['comparisons'][0]['all_forks']), 8)
        self.assertIn('ab-1-0-A: exit 9', run.summary['error'])
        self.assert_unqualified(run)


if __name__ == '__main__':
    unittest.main(verbosity=2)
