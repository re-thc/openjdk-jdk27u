"""Process-free tests for the ordinary supervisor; Popen is always mocked."""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest import mock

import run_ordinary as runner


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, sort_keys=True, indent=2) + '\n', encoding='utf-8')


class FakeProcess:
    def __init__(self, code=0, *, hung=False):
        self.pid = 32100
        self.code = code
        self.hung = hung
        self.terminated = False

    def poll(self):
        if self.hung and not self.terminated:
            return None
        return self.code

    def wait(self, timeout=None):
        if self.poll() is None:
            raise runner.subprocess.TimeoutExpired('fake', timeout)
        return self.code


class PreparedFixture:
    def __init__(self, root: Path):
        self.root = root
        self.source = self._file('source.txt', b'prototype source receipt\n')
        self.dso_e = self._file('E.so', b'ELF-E')
        self.dso_u = self._file('U.so', b'ELF-U')
        self.fixture = self._file('Fixture.class', b'fixture bytes')
        self.stack = root / 'stack-review.json'
        self.output = root / 'new-output'
        self.prepared_path = root / 'PREPARED.json'
        self.authority_path = root / 'AUTHORITY.json'
        self.review_path = root / 'REVIEW.json'
        self.commit = 'a' * 40
        roles = {}
        for role, dso in (('E', self.dso_e), ('U', self.dso_u)):
            roles[role] = {
                'production_dso_path': str(dso.resolve()), 'production_dso_sha256': digest(dso),
                'source_commit': self.commit, 'callgraph_verified': True,
                'guard_frame_verified': True, 'imports_verified': True,
                'no_allocator_verified': True, 'stack_reserve_verified': True,
            }
        write_json(self.stack, {'status': 'PASS', 'roles': roles})
        self.files = {
            str(p.resolve()): digest(p) for p in
            (self.source, self.dso_e, self.dso_u, self.fixture, self.stack)
        }
        evidence = {
            'source': {'path': str(self.source.resolve()), 'sha256': digest(self.source)},
            'images': [
                {'path': str(self.dso_e.resolve()), 'sha256': digest(self.dso_e)},
                {'path': str(self.dso_u.resolve()), 'sha256': digest(self.dso_u)},
            ],
            'fixture': {'path': str(self.fixture.resolve()), 'sha256': digest(self.fixture)},
            'binary_stack_review': {'path': str(self.stack.resolve()), 'sha256': digest(self.stack)},
        }
        slots = []
        for name, kind in runner.ORDER:
            slots.append({
                'name': name, 'kind': kind, 'seconds': 60,
                'argv': ['/manifest/command', name, '{slot_dir}/out.bin'],
                'env': {'FIXED_TEST_ENV': name}, 'cwd': str(root.resolve()),
            })
        prepared = {
            'schema': runner.SCHEMA,
            'execution_authorized': False,
            'prototype_source_commit': self.commit,
            'planned_sorts': 18000,
            'budget': runner.BUDGET,
            'output_directory': str(self.output.resolve()),
            'slots': slots,
            'file_hashes': self.files,
            'evidence': evidence,
            'stack_review': {
                'path': str(self.stack.resolve()), 'sha256': digest(self.stack),
                'status': 'PASS', 'roles': roles,
            },
            'harness': {
                str((runner.HERE / 'run_ordinary.py').resolve()): digest(runner.HERE / 'run_ordinary.py'),
                str((runner.HERE / 'test_ordinary_offline.py').resolve()): digest(runner.HERE / 'test_ordinary_offline.py'),
            },
        }
        write_json(self.prepared_path, prepared)
        self.evidence_sha = runner.canonical_sha(self.files)
        self.manifest_sha = digest(self.prepared_path)
        review = {
            'ready_to_run': True, 'prepared_manifest_sha256': self.manifest_sha,
            'evidence_sha256': self.evidence_sha, 'stack_review_sha256': digest(self.stack),
        }
        write_json(self.review_path, review)
        write_json(self.authority_path, {
            'execution_authorized': True, 'manifest_sha256': self.manifest_sha,
            'evidence_sha256': self.evidence_sha,
            'stack_review_sha256': digest(self.stack),
            'review_path': str(self.review_path.resolve()),
            'review_sha256': digest(self.review_path),
        })

    def _file(self, name: str, contents: bytes) -> Path:
        path = self.root / name
        path.write_bytes(contents)
        return path

    def args(self):
        return self.prepared_path, self.authority_path, self.review_path


class FakeClock:
    def __init__(self):
        self.value = 1.0

    def now(self):
        return self.value

    def sleep(self, duration):
        self.value += max(0.001, duration)


class OrdinaryOfflineTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.prep = PreparedFixture(self.root)

    def assert_no_real_processes(self, patcher):
        self.addCleanup(patcher.stop)
        return patcher.start()

    def test_nine_exact_ordered_slots_succeed_without_child_processes(self):
        calls = []
        def fake_popen(argv, **kwargs):
            calls.append((argv, kwargs))
            return FakeProcess()
        popen = self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen', side_effect=fake_popen))
        self.assertEqual(runner.execute(*self.prep.args()), 0)
        self.assertEqual(popen.call_count, 9)
        self.assertEqual([c[0][1] for c in calls], [name for name, _ in runner.ORDER])
        self.assertEqual([c[1]['env']['FIXED_TEST_ENV'] for c in calls], [name for name, _ in runner.ORDER])
        self.assertTrue(all(c[1]['shell'] is False and c[1]['start_new_session'] is True for c in calls))
        self.assertEqual(len(list(self.prep.output.glob('*/RESULT.json'))), 9)
        self.assertEqual(json.loads((self.prep.output / 'RUN.json').read_text())['status'], 'passed')
        self.assertTrue(all((d / 'combined.log').is_file() for d in self.prep.output.iterdir() if d.is_dir()))

    def test_nonzero_result_fail_stops_without_replacement(self):
        calls = []
        def fake_popen(argv, **kwargs):
            calls.append(argv)
            return FakeProcess(code=9 if len(calls) == 4 else 0)
        self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen', side_effect=fake_popen))
        with self.assertRaisesRegex(RuntimeError, 'Uinterpreted|Einterpreted|failed'):
            runner.execute(*self.prep.args())
        self.assertEqual(len(calls), 4)
        self.assertEqual(len(list(self.prep.output.glob('*/RESERVATION.json'))), 4)
        with self.assertRaises(FileExistsError):
            runner.execute(*self.prep.args())
        self.assertEqual(len(calls), 4)

    def test_timeout_is_owned_cleanup_and_never_retried(self):
        calls = []
        processes = []
        def fake_popen(argv, **kwargs):
            calls.append(argv)
            p = FakeProcess(hung=True)
            processes.append(p)
            return p
        fake_clock = FakeClock()
        self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen', side_effect=fake_popen))
        self.assert_no_real_processes(mock.patch.object(runner, 'terminate_owned_group', side_effect=lambda p, d: setattr(p, 'terminated', True)))
        self.assert_no_real_processes(mock.patch.object(runner, 'monotonic', fake_clock.now))
        self.assert_no_real_processes(mock.patch.object(runner, 'sleep', fake_clock.sleep))
        with self.assertRaisesRegex(RuntimeError, 'deadline expired'):
            runner.execute(*self.prep.args())
        self.assertEqual(len(calls), 1)
        self.assertTrue(processes[0].terminated)
        self.assertEqual(len(list(self.prep.output.glob('*/RESERVATION.json'))), 1)
        self.assertEqual(json.loads((self.prep.output / 'RUN.json').read_text())['status'], 'failed')

    def test_cleanup_has_local_five_second_cap_even_with_large_global_budget(self):
        proc = FakeProcess(hung=True)
        clock = FakeClock()
        clock.value = 10.0
        signals = []
        def fake_killpg(pid, sig):
            signals.append((pid, sig))
            if sig == runner.signal.SIGKILL:
                proc.terminated = True
        self.assert_no_real_processes(mock.patch.object(runner, 'monotonic', clock.now))
        self.assert_no_real_processes(mock.patch.object(runner, 'sleep', clock.sleep))
        self.assert_no_real_processes(mock.patch.object(runner.os, 'killpg', side_effect=fake_killpg))
        result = runner.terminate_owned_group(proc, global_cleanup_deadline=10_000.0)
        self.assertEqual([s for _, s in signals], [runner.signal.SIGTERM, runner.signal.SIGKILL])
        self.assertEqual(result['local_deadline_monotonic'], 15.0)
        self.assertLessEqual(result['elapsed_seconds'], 5.0)
        self.assertTrue(result['reaped'])

    def test_mutated_source_or_wrong_authority_blocks_before_output_or_popen(self):
        self.prep.source.write_bytes(b'changed source')
        popen = self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen'))
        with self.assertRaisesRegex(ValueError, 'frozen input'):
            runner.execute(*self.prep.args())
        self.assertEqual(popen.call_count, 0)
        self.assertFalse(self.prep.output.exists())

    def test_authority_must_bind_exact_manifest_and_review(self):
        write_json(self.prep.authority_path, {
            'execution_authorized': True, 'manifest_sha256': '0' * 64,
            'evidence_sha256': self.prep.evidence_sha,
            'stack_review_sha256': digest(self.prep.stack),
            'review_path': str(self.prep.review_path.resolve()),
            'review_sha256': digest(self.prep.review_path),
        })
        popen = self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen'))
        with self.assertRaisesRegex(ValueError, 'separate authority'):
            runner.execute(*self.prep.args())
        self.assertEqual(popen.call_count, 0)
        self.assertFalse(self.prep.output.exists())

    def test_unexpected_controller_interrupt_cleans_owned_process_group(self):
        proc = FakeProcess(hung=True)
        popen = self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen', return_value=proc))
        cleanup = self.assert_no_real_processes(mock.patch.object(
            runner, 'terminate_owned_group', side_effect=lambda p, d: setattr(p, 'terminated', True)))
        # Fail after Popen but before polling can return, as a signal/IO error might.
        ticks = {'n': 0}
        def interrupt_once():
            ticks['n'] += 1
            if ticks['n'] == 5:
                raise KeyboardInterrupt()
            return float(ticks['n'])
        self.assert_no_real_processes(mock.patch.object(runner, 'monotonic', side_effect=interrupt_once))
        with self.assertRaises(KeyboardInterrupt):
            runner.execute(*self.prep.args())
        self.assertEqual(popen.call_count, 1)
        self.assertTrue(proc.terminated)
        self.assertEqual(cleanup.call_count, 1)
        self.assertEqual(len(list(self.prep.output.glob('*/RESERVATION.json'))), 1)

    def test_wrong_slot_order_and_unreviewed_stack_receipt_block(self):
        with self.prep.prepared_path.open(encoding='utf-8') as f:
            prepared = json.load(f)
        prepared['slots'][0], prepared['slots'][1] = prepared['slots'][1], prepared['slots'][0]
        write_json(self.prep.prepared_path, prepared)
        popen = self.assert_no_real_processes(mock.patch.object(runner.subprocess, 'Popen'))
        with self.assertRaisesRegex(ValueError, 'slot order'):
            runner.execute(*self.prep.args())
        self.assertEqual(popen.call_count, 0)
        self.assertFalse(self.prep.output.exists())


if __name__ == '__main__':
    unittest.main()
