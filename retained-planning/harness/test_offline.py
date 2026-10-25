#!/usr/bin/env python3
"""Process-free guardrail tests for the proposed comparison harness."""
from __future__ import annotations

import importlib.util
import csv
import ctypes
import hashlib
import json
import os
import sys
import tempfile
import threading
import unittest
from pathlib import Path
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
PROPOSAL_PATH = Path(
    '/workspace/pr57-xss-integration-plan-20261023/'
    'PROTOTYPE-AND-DECISIVE-COMPARISON-PROPOSAL.json')


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


runner = load('xss_runner_offline', HERE / 'run_comparison.py')
analysis = load('xss_analysis_offline', HERE / 'analyze_results.py')


def file_sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


class SimulatedProcess:
    """In-process protocol peer; it never starts an OS child process."""
    def __init__(self, command, env, corrupt=False, **kwargs):
        self.command = command
        self.corrupt = corrupt
        self.pid = os.getpid()
        self.returncode = None
        child_stdin_r, parent_stdin_w = os.pipe()
        parent_stdout_r, child_stdout_w = os.pipe()
        self.stdin = os.fdopen(parent_stdin_w, 'wb', buffering=0)
        self.stdout = os.fdopen(parent_stdout_r, 'rb', buffering=0)
        self._child_stdin = os.fdopen(child_stdin_r, 'rb', buffering=0)
        self._child_stdout = os.fdopen(child_stdout_w, 'wb', buffering=0)
        self._thread = threading.Thread(target=self._serve, name='fake-jvm', daemon=True)
        self._thread.start()

    def _emit(self, text):
        self._child_stdout.write((text + '\n').encode())
        self._child_stdout.flush()

    def _ack(self):
        if self._child_stdin.readline() != b'\n':
            raise RuntimeError('controller omitted protocol acknowledgement')

    def _serve(self):
        try:
            libc = ctypes.CDLL(None)
            if libc.prctl(15, b'xss-sorter', 0, 0, 0) != 0:
                raise RuntimeError('prctl(PR_SET_NAME) failed')
            tid = threading.get_native_id()
            self._emit(f'BOOT {self.pid} {tid}')
            self._ack()
            self._emit(f'READY {self.pid} {tid}')
            self._ack()
            history = int(self.command[-2])
            csv_path = Path(self.command[-1])
            cases = [(int(c['longs']), c['pattern'])
                     for c in json.loads(PROPOSAL_PATH.read_text())[
                         'one_fixed_comparison_proposal']['cases']]
            rows = []
            for ordinal in range(20):
                rows.append(['SORT', 0, history, -1, 1048576, 'random', ordinal, 100, 0, 0, 0])
            for cid, (size, pattern) in enumerate(runner.case_schedule(history, cases)):
                for phase, count in ((1, 8), (2, 16)):
                    for ordinal in range(count):
                        rows.append(['SORT', phase, history, cid, size, pattern,
                                     ordinal, 100, 1, 2, 3])
            if self.corrupt:
                rows[-1][6] = 999
            with csv_path.open('w', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(runner.CSV_HEADER)
                writer.writerows(rows)
            self._emit(f'DONE {self.pid} {tid}')
            self._ack()
            self._emit('COMPLETE simulated')
            self.returncode = 0
        except BaseException as exc:
            self.error = exc
            self.returncode = 1
            try:
                self._emit(f'FAKE_ERROR {exc!r}')
            except OSError:
                pass
        finally:
            self._child_stdin.close()
            self._child_stdout.close()

    def poll(self):
        if not self._thread.is_alive():
            self._thread.join()
        return self.returncode

    def wait(self, timeout=None):
        self._thread.join(timeout)
        if self._thread.is_alive():
            raise runner.subprocess.TimeoutExpired(self.command, timeout)
        return self.returncode

    def cancel(self):
        try:
            self.stdin.close()
        except OSError:
            pass
        return self.wait(timeout=2)


class OfflineHarnessTests(unittest.TestCase):
    def setUp(self):
        self.proposal = json.loads(PROPOSAL_PATH.read_text())
        self.slots, self.cases = runner.plan_from_proposal(self.proposal)
        self.temp = tempfile.TemporaryDirectory(prefix='xss-harness-offline-')
        self.base = Path(self.temp.name) / 'base'
        self.base.mkdir()
        self.prepared, self.prepared_path, self.authority_path, self.review_path = (
            self.authorized_inputs(self.base))
        self.output = self.prepared['output_directory']

    def tearDown(self):
        self.temp.cleanup()

    def authorized_inputs(self, root):
        root = Path(root)
        root.mkdir(parents=True, exist_ok=True)
        prototype_commit = '0123456789abcdef0123456789abcdef01234567'
        implementation_delta = runner._implementation_delta(prototype_commit)
        classfile = root / 'XssPublicBench.class'
        classfile.write_bytes(b'\xca\xfe\xba\xbe' + b'fixture-bytecode')
        toolchain_file = root / 'toolchain-manifest.txt'
        toolchain_file.write_text('synthetic fixed compiler identity\n')
        toolchain_files = {str(toolchain_file.resolve()): file_sha(toolchain_file)}
        configuration_file = root / 'shared-configuration.txt'
        configuration_file.write_text('synthetic fixed configuration identity\n')
        configuration_files = {str(configuration_file.resolve()): file_sha(configuration_file)}
        roles = {}
        file_hashes = {
            str(classfile.resolve()): file_sha(classfile),
            **toolchain_files, **configuration_files,
        }
        hotspot_hashes_by_role = {}
        for role in ('A', 'E', 'U'):
            image = root / role
            image.mkdir()
            java_path = image / 'bin' / 'java'
            libjvm_path = image / 'lib' / 'server' / 'libjvm.so'
            modules_path = image / 'lib' / 'modules'
            for path, content in (
                    (java_path, b'\x7fELF' + b'synthetic java executable'),
                    (libjvm_path, b'\x7fELF' + b'synthetic libjvm'),
                    (modules_path, b'synthetic java modules')):
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(content)
                if path == java_path:
                    path.chmod(0o755)
            hotspot_files = {
                'bin/java': {'path': str(java_path.resolve()), 'sha256': file_sha(java_path)},
                'lib/server/libjvm.so': {
                    'path': str(libjvm_path.resolve()), 'sha256': file_sha(libjvm_path)},
                'lib/modules': {'path': str(modules_path.resolve()), 'sha256': file_sha(modules_path)},
            }
            hotspot_hashes = {key: value['sha256'] for key, value in hotspot_files.items()}
            hotspot_hashes_by_role[role] = hotspot_hashes
            binding = {
                'java': str(java_path.resolve()), 'image_root': str(image.resolve()),
                'java_hotspot_sha256': runner.canonical_hash(hotspot_hashes),
                'java_overlay_sha256': file_sha(classfile),
                'build_receipt_path': None,
                'build_receipt_sha256': None,
                'source_commit': (self.proposal['identities']['public_fork_master_verified']
                                  if role == 'A' else prototype_commit),
                'source_tree_sha256': 'f' * 64,
                'backend': ('stock-default' if role == 'A' else
                            ('embedded' if role == 'E' else 'upstream')),
                'toolchain_sha256': runner.canonical_hash(toolchain_files),
                'configuration_sha256': runner.canonical_hash(configuration_files),
                'range_dso_path': None,
                'range_dso_sha256': None,
            }
            if role == 'A':
                range_dso = None
                backend = 'stock-default'
            else:
                range_dso = image / 'librange.so'
                range_dso.write_bytes(b'\x7fELF' + ('synthetic ' + role).encode())
                dso_digest = file_sha(range_dso)
                binding['range_dso_path'] = str(range_dso.resolve())
                binding['range_dso_sha256'] = dso_digest
                backend = 'embedded' if role == 'E' else 'upstream'
                file_hashes[str(range_dso.resolve())] = dso_digest
            for item in hotspot_files.values():
                file_hashes[item['path']] = item['sha256']
            receipt = {
                'schema': 'xss-comparison-build-receipt-v1',
                'role': role,
                'backend': backend,
                'source_commit': binding['source_commit'],
                'source_dirty': False,
                'source_tree_sha256': 'f' * 64,
                'image_root': str(image.resolve()),
                'java_hotspot_files': hotspot_files,
                'java_overlay': {'path': str(classfile.resolve()),
                                 'sha256': file_sha(classfile),
                                 'classpath_entry': str(root.resolve())},
                'range_dso': (None if range_dso is None else {
                    'path': str(range_dso.resolve()), 'sha256': file_sha(range_dso)}),
                'toolchain': {
                    'sha256': runner.canonical_hash(toolchain_files),
                    'files': toolchain_files,
                },
                'configuration': {
                    'sha256': runner.canonical_hash(configuration_files),
                    'files': configuration_files,
                },
                'implementation_delta': (None if role == 'A' else implementation_delta),
            }
            receipt_path = root / f'{role}-build-receipt.json'
            receipt_path.write_text(json.dumps(receipt, sort_keys=True) + '\n')
            receipt_sha = file_sha(receipt_path)
            binding['build_receipt_path'] = str(receipt_path.resolve())
            binding['build_receipt_sha256'] = receipt_sha
            file_hashes[str(receipt_path.resolve())] = receipt_sha
            roles[role] = binding
        activation_roles = {}
        for role in ('E', 'U'):
            source_path = root / f'{role}-activation-witness.cpp'
            shim_path = root / f'{role}-activation-witness.so'
            source_path.write_text(f'// synthetic activation witness: {role}\n')
            shim_path.write_bytes(b'\x7fELF' + f'synthetic witness {role}'.encode())
            source_sha, shim_sha = file_sha(source_path), file_sha(shim_path)
            file_hashes[str(source_path.resolve())] = source_sha
            file_hashes[str(shim_path.resolve())] = shim_sha
            activation_roles[role] = {
                'backend': roles[role]['backend'],
                'production_dso_path': roles[role]['range_dso_path'],
                'production_dso_sha256': roles[role]['range_dso_sha256'],
                'java_hotspot_sha256': roles[role]['java_hotspot_sha256'],
                'java_overlay_sha256': roles[role]['java_overlay_sha256'],
                'entry_symbol': 'range_sort_entry',
                'entry_count': 1,
                'diagnostic_source_path': str(source_path.resolve()),
                'diagnostic_source_sha256': source_sha,
                'diagnostic_shim_path': str(shim_path.resolve()),
                'diagnostic_shim_sha256': shim_sha,
                'entry_verified': True,
                'compiled_helper_verified': True,
            }
        activation_path = root / 'activation-review.json'
        activation = {
            'schema': 'xss-range-activation-review-v1',
            'status': 'PASS',
            'scope': 'ordinary-c2-native-entry',
            'source_commit': prototype_commit,
            'roles': activation_roles,
        }
        activation_path.write_text(json.dumps(activation, sort_keys=True) + '\n')
        activation_sha = file_sha(activation_path)
        file_hashes[str(activation_path.resolve())] = activation_sha
        prepared = {
            'schema': 'xss-in-place-comparison-prepared-v2',
            'execution_authorized': True,
            'implementation_delta': implementation_delta,
            'activation_review_path': str(activation_path.resolve()),
            'activation_review_sha256': activation_sha,
            'proposal_path': str(PROPOSAL_PATH.resolve()),
            'proposal_sha256': runner.sha(PROPOSAL_PATH),
            'output_directory': str((root / 'collection').resolve()),
            'slots': self.slots,
            'cases': [{'longs': n, 'pattern': p} for n, p in self.cases],
            'budget': runner.BUDGET,
            'role_bindings': roles,
            'slot_commands': [{
                'slot': slot,
                'argv': [roles[slot['role']]['java'], '-cp', str(root.resolve()),
                         'XssPublicBench', '{history}', '{output_csv}'],
                'env': {'PATH': '/usr/bin', 'LC_ALL': 'C'},
            } for slot in self.slots],
            'file_hashes': file_hashes,
            'harness_sha256': {name: runner.sha(HERE / name) for name in (
                'XssPublicBench.java', 'run_comparison.py', 'analyze_results.py',
                'test_offline.py', 'CONTRACT.md')},
        }
        prepared_path = root / 'prepared.json'
        prepared_path.write_text(json.dumps(prepared, sort_keys=True) + '\n')
        prepared_digest = file_sha(prepared_path)
        review_path = root / 'review.json'
        review_path.write_text(json.dumps({
            'ready_to_execute': True,
            'prepared_manifest_sha256': prepared_digest,
            'activation_review_sha256': activation_sha,
        }, sort_keys=True) + '\n')
        authority_path = root / 'authority.json'
        authority_path.write_text(json.dumps({
            'execution_authorized': True,
            'prepared_manifest_sha256': prepared_digest,
            'review_path': str(review_path.resolve()),
            'review_sha256': file_sha(review_path),
        }, sort_keys=True) + '\n')
        return prepared, prepared_path, authority_path, review_path

    def test_frozen_plan_validates_without_creating_output(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            commands = runner.validate_prepared(
                self.prepared, self.proposal, PROPOSAL_PATH.resolve(),
                self.prepared_path, check_disk=True)
            self.assertEqual(len(commands), 36)
            self.assertEqual(len(self.cases), 32)
            self.assertFalse(Path(self.output).exists())
            analysis.self_test()

    def test_changed_budget_and_role_bytes_are_rejected(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            bad = json.loads(json.dumps(self.prepared))
            bad['budget']['measured_sorts'] += 1
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path,
                                         check_disk=False)

    def test_hidden_policy_flags_and_role_command_drift_are_rejected(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            bad = json.loads(json.dumps(self.prepared))
            bad['slot_commands'][0]['argv'].append('-XX:UseAVX=0')
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path,
                                         check_disk=False)

    def test_build_receipt_backend_and_exact_dso_binding_are_required(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            bad = json.loads(json.dumps(self.prepared))
            bad['role_bindings']['E']['backend'] = 'upstream'
            with self.assertRaisesRegex(ValueError, 'source/backend'):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path, check_disk=False)
            bad = json.loads(json.dumps(self.prepared))
            bad['role_bindings']['E']['range_dso_path'] = (
                bad['role_bindings']['U']['range_dso_path'])
            with self.assertRaisesRegex(ValueError, 'exact range DSO'):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path, check_disk=False)
            bad = json.loads(json.dumps(self.prepared))
            bad['role_bindings']['U']['build_receipt_path'] = None
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path, check_disk=False)
            bad = json.loads(json.dumps(self.prepared))
            bad['slot_commands'][0]['argv'][1] = '-Xint'
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path,
                                         check_disk=False)
            bad = json.loads(json.dumps(self.prepared))
            bad['slot_commands'][0]['env']['JAVA_TOOL_OPTIONS'] = '-Xint'
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         self.prepared_path,
                                         check_disk=False)
            bad = json.loads(json.dumps(self.prepared))
            bad['role_bindings']['U']['java_overlay_sha256'] = 'f' * 64
            with self.assertRaises(ValueError):
                runner.validate_prepared(bad, self.proposal, PROPOSAL_PATH.resolve(),
                                         Path(self.temp.name) / 'prepared.json',
                                         check_disk=False)

    def test_invalid_authority_never_opens_a_process(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            with tempfile.TemporaryDirectory(prefix='xss-authority-offline-') as td:
                p = Path(td)
                prepared_path = p / 'prepared.json'
                authority_path = p / 'authority.json'
                review_path = p / 'review.json'
                prepared_path.write_text('{}')
                authority_path.write_text('{}')
                review_path.write_text('{}')
                with self.assertRaises(ValueError):
                    runner.validate_authority(prepared_path, {}, authority_path, review_path)

    def test_runner_rejects_header_and_sample_corruption_offline(self):
        with patch.object(runner.subprocess, 'Popen',
                          side_effect=AssertionError('offline test attempted Popen')):
            data = Path(self.temp.name) / 'synthetic.csv'
            rows = []
            for ordinal in range(20):
                rows.append(['SORT', 0, 0, -1, 1048576, 'random', ordinal, 10, 0, 0, 0])
            for cid, (size, pattern) in enumerate(runner.case_schedule(0, self.cases)):
                for phase, count in ((1, 8), (2, 16)):
                    for ordinal in range(count):
                        rows.append(['SORT', phase, 0, cid, size, pattern,
                                     ordinal, 10, 0, 0, 0])
            with data.open('w', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(runner.CSV_HEADER)
                writer.writerows(rows)
            receipt = runner.validate_data_file(data, 0, self.cases)
            self.assertEqual(receipt['sort_rows'], 788)
            self.assertEqual(receipt['measured'], 512)
            self.assertEqual(receipt['conditioning'], 256)
            corrupt = Path(self.temp.name) / 'bad.csv'
            with corrupt.open('w', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(['wrong'])
            with self.assertRaises(ValueError):
                runner.validate_data_file(corrupt, 0, self.cases)

    def test_authorized_controller_and_analysis_in_process_simulation(self):
        """Exercise authority, all 36 slots, receipts, frozen output, and analysis."""
        root = Path(self.temp.name) / 'full-success'
        root.mkdir()
        prepared, prepared_path, authority_path, review_path = self.authorized_inputs(root)

        with patch.object(runner.subprocess, 'Popen', side_effect=SimulatedProcess) as popen, \
             patch.object(runner, 'kill_bounded', side_effect=lambda proc: proc.cancel()):
            rc = runner.main(['run_comparison.py', str(prepared_path), str(authority_path),
                              str(review_path), str(PROPOSAL_PATH)])
        self.assertEqual(rc, 0)
        self.assertEqual(popen.call_count, 36)
        collection = Path(prepared['output_directory'])
        self.assertEqual(json.loads((collection / 'CURRENT.json').read_text())['state'],
                         'finished')
        events = [json.loads(line) for line in (collection / 'events.jsonl').read_text().splitlines()]
        self.assertEqual(len(events), 73)
        self.assertEqual(sum(e.get('state') == 'complete' for e in events), 36)
        for slot in self.slots:
            receipt = json.loads((collection / f"{slot['slot']:02d}-{slot['role']}.receipt.json").read_text())
            self.assertEqual(receipt['state'], 'complete')
            self.assertEqual(receipt['protocol_stages'], 3)
            self.assertEqual(receipt['data']['sort_rows'], 788)

        analysis_dir = root / 'analysis'
        report = analysis.analyze(collection, analysis_dir)
        self.assertEqual(report['contrast_rows'], 1152)
        self.assertEqual(len(report['summaries']), 495)
        self.assertEqual(report['role_identity']['A']['source_commit'],
                         self.proposal['identities']['public_fork_master_verified'])
        with (analysis_dir / 'ALL-PAIRED-CONTRASTS.csv').open(newline='') as f:
            self.assertEqual(len(list(csv.DictReader(f))), 1152)
        with (analysis_dir / 'ALL-JVM-CASE-MEDIANS.csv').open(newline='') as f:
            self.assertEqual(len(list(csv.DictReader(f))), 36 * 32)
        self.assertIn('do not prove a native entry', report['activation_limit'])

    def test_simulated_bad_sample_stops_after_one_slot_without_retry(self):
        root = Path(self.temp.name) / 'full-failure'
        root.mkdir()
        prepared, prepared_path, authority_path, review_path = self.authorized_inputs(root)
        with patch.object(
                runner.subprocess, 'Popen',
                side_effect=lambda command, env, **kwargs:
                    SimulatedProcess(command, env, corrupt=True, **kwargs)) as popen, \
             patch.object(runner, 'kill_bounded', side_effect=lambda proc: proc.cancel()):
            with self.assertRaisesRegex(ValueError, 'identity mismatch'):
                runner.main(['run_comparison.py', str(prepared_path), str(authority_path),
                             str(review_path), str(PROPOSAL_PATH)])
        self.assertEqual(popen.call_count, 1)
        collection = Path(prepared['output_directory'])
        self.assertEqual(json.loads((collection / 'CURRENT.json').read_text())['state'],
                         'stopped')
        self.assertTrue((collection / '00-A.receipt.json').is_file())
        self.assertFalse((collection / '01-E.receipt.json').exists())
        self.assertNotEqual(json.loads((collection / 'CURRENT.json').read_text())['state'],
                            'finished')
        with self.assertRaisesRegex(ValueError, 'output directory already exists'):
            runner.main(['run_comparison.py', str(prepared_path), str(authority_path),
                         str(review_path), str(PROPOSAL_PATH)])


if __name__ == '__main__':
    unittest.main()
