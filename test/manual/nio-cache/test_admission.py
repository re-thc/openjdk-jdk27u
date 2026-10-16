# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
from pathlib import Path
import struct
import tempfile
import unittest
from unittest.mock import patch
import admission
import diagnostic
from test_observer import fixture, stat

NONCE = '0123456789abcdef' * 2


def record(nonce=NONCE):
    return ('NIO_BIND protocol=nio-bind-v1 nonce=' + nonce
            + ' pid=20 tid=21 start=100 benchmark=' + admission.BENCHMARK + '\n')


def marker_class(markers=None):
    # Synthetic constant pool only, for offline readiness-parser coverage.
    if markers is None:
        markers = [b'nio-bind-v1', b'/proc/thread-self/stat', b'nio.observer.binding', b'nio.observer.nonce']
    return b'\xca\xfe\xba\xbe\x00\x00\x00\x47' + struct.pack('>H', len(markers) + 1) + b''.join(b'\x01' + struct.pack('>H', len(x)) + x for x in markers)


def launched(root):
    proc, cg, co, fo, th = fixture(root)
    # Match the actual JMH fork argv shape. Child-list views deliberately absent.
    for path in proc.rglob('children'):
        path.unlink()
    java = root / 'image/bin/java'
    java.parent.mkdir(parents=True)
    java.write_text('synthetic image, never executable')
    (proc / '20/exe').symlink_to(java)
    binding = root / 'run/binding.txt'
    binding.parent.mkdir()
    argv = [str(java), '-Xms32m', '--sun-misc-unsafe-memory-access=allow',
            '-Djmh.blackhole.autoDetect=false', '-Djmh.compilerhints.mode=FORCE_ON',
            '-Dnio.observer.binding=' + str(binding), '-Dnio.observer.nonce=' + NONCE,
            '-XX:CompileCommandFile=/tmp/synthetic-jmh-hints', '-cp', '/synthetic/classes:/synthetic/jmh.jar',
            'org.openjdk.jmh.runner.ForkedMain', '127.0.0.1', '34717']
    (proc / '20/cmdline').write_bytes(('\0'.join(argv) + '\0').encode())
    return proc, cg, {'pid': 10, **admission.read_identity(10, proc)}, java, binding


class AdmissionTests(unittest.TestCase):
    def test_binding_is_independent_of_children_views_and_names(self):
        for name in ('org.ope..rker-1', 'renamed-worker', 'long-unrelated-name'):
            with self.subTest(name=name), tempfile.TemporaryDirectory() as directory:
                proc, cg, co, java, path = launched(Path(directory))
                (proc / '20/task/21/comm').write_text(name)
                path.write_text(record())
                data = admission.read_binding(path, NONCE, {})
                with patch.object(Path, 'iterdir', side_effect=AssertionError('thread discovery')), \
                     patch.object(Path, 'glob', side_effect=AssertionError('process discovery')):
                    fork, thread = admission.verify_binding(data, co, java, path, NONCE, proc)
                self.assertEqual((fork['pid'], thread['tid'], thread['start']), (20, 21, 100))

    def test_delayed_and_partial_file(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'binding.txt'
            details = {}
            self.assertIsNone(admission.read_binding(path, NONCE, details))
            self.assertIn('awaiting trial-setup', details['last_state'])
            path.write_text(record()[:40])
            self.assertIsNone(admission.read_binding(path, NONCE, details))
            self.assertIn('complete binding record', details['last_state'])
            path.write_text(record())
            self.assertEqual(admission.read_binding(path, NONCE, details)['tid'], 21)
            self.assertEqual(details['polls'], 3)

    def test_bad_nonce_duplicate_and_malformed_records(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'binding.txt'
            for text in (record('0' * 32), record() * 2, record().replace('tid=21', 'tid=0'), 'x' * 1025):
                path.write_text(text)
                with self.assertRaises(ValueError):
                    admission.read_binding(path, NONCE, {})

    def test_identity_ancestry_and_command_are_required(self):
        for bad in ('start', 'parent', 'executable', 'command', 'vanished'):
            with self.subTest(bad=bad), tempfile.TemporaryDirectory() as directory:
                proc, cg, co, java, path = launched(Path(directory))
                data = {'pid': 20, 'tid': 21, 'start': 100}
                if bad == 'start':
                    data['start'] = 101
                elif bad == 'parent':
                    (proc / '20/stat').write_text(stat(20, 99))
                elif bad == 'executable':
                    java = Path(directory) / 'other-java'
                elif bad == 'command':
                    (proc / '20/cmdline').write_bytes(b'java\0other.Main\0')
                else:
                    (proc / '20/task/21/stat').unlink()
                with self.assertRaises((ValueError, FileNotFoundError)):
                    admission.verify_binding(data, co, java, path, NONCE, proc)

    def test_controller_waits_for_worker_handshake_and_records_timeout_stage(self):
        class Proc:
            pid = 10
            def poll(self): return None
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, java, path = launched(Path(directory))
            clock = [0.0]
            def pause(seconds): clock[0] += seconds
            def read(pid): return admission.read_identity(pid, proc)
            def verify(data, coordinator, java_arg, path_arg, nonce):
                return admission.verify_binding(data, coordinator, java_arg, path_arg, nonce, proc)
            details = {}
            with patch.object(diagnostic, 'read_identity', side_effect=read), \
                 patch.object(diagnostic, 'verify_binding', side_effect=verify), \
                 patch.object(diagnostic.time, 'monotonic', side_effect=lambda: clock[0]), \
                 patch.object(diagnostic.time, 'sleep', side_effect=pause):
                with self.assertRaisesRegex(TimeoutError, 'awaiting trial-setup binding file'):
                    diagnostic.admit_processes(Proc(), java, .05, path, NONCE, details)
                path.write_text(record())
                coordinator, fork, thread = diagnostic.admit_processes(Proc(), java, 1, path, NONCE, details)
                self.assertEqual(thread['tid'], 21)
                self.assertIn('ownership audit pending', details['last_state'])

    def test_visibility_requires_actual_thread_self_correspondence(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, java, path = launched(Path(directory))
            (proc / 'thread-self').mkdir()
            (proc / 'thread-self/stat').write_text(stat(21, 10))
            result = admission.visibility(proc, cg, 20, 21)
            self.assertFalse(result['children_view_required'])
            self.assertFalse(result['children_view_present'])
            (proc / 'thread-self/stat').unlink()
            with self.assertRaises(FileNotFoundError):
                admission.visibility(proc, cg, 20, 21)

    def test_stale_and_corrupt_classes_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            classes = Path(directory)
            target = classes / 'org/openjdk/bench/nioqual/NioCachePaths.class'
            target.parent.mkdir(parents=True)
            for data in (b'not a class', marker_class([b'old fixture']), marker_class()[:-1]):
                target.write_bytes(data)
                with self.assertRaises(ValueError):
                    admission.verify_fixture_protocol(classes)
            target.write_bytes(marker_class())
            admission.verify_fixture_protocol(classes)


class LaunchGuardTests(unittest.TestCase):
    def test_unavailable_required_view_and_stale_classes_stop_before_popen(self):
        import json
        for missing_view in (False, True):
            with self.subTest(missing_view=missing_view), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                classes = root / 'classes'
                target = classes / 'org/openjdk/bench/nioqual/NioCachePaths.class'
                target.parent.mkdir(parents=True)
                target.write_bytes(marker_class([b'old fixture']))
                (root / 'freeze.json').write_text(json.dumps({'files': {}, 'directories': [],
                    'cpu_max': 'synthetic quota\n', 'fixture_classes': str(classes)}))
                (root / 'command.json').write_text('[]')
                original = Path.read_text
                def read(path, *args, **kwargs):
                    if str(path) == '/sys/fs/cgroup/cpu.max':
                        return 'synthetic quota\n'
                    return original(path, *args, **kwargs)
                with patch.object(diagnostic, 'ROOT', root), \
                     patch.object(Path, 'read_text', read), \
                     patch.object(diagnostic.os, 'sched_getaffinity', return_value=set(range(5))), \
                     patch.object(diagnostic.os, 'sched_setaffinity'), \
                     patch.object(diagnostic.signal, 'setitimer'), patch.object(diagnostic.signal, 'signal'), \
                     patch.object(diagnostic, 'visibility', side_effect=FileNotFoundError('required procfs view') if missing_view else None, return_value={'readable': True}), \
                     patch.object(diagnostic.subprocess, 'Popen') as popen:
                    self.assertEqual(diagnostic.run('offline synthetic approval'), 1)
                    popen.assert_not_called()
                saved = json.loads((root / 'run/receipt.json').read_text())
                self.assertEqual(saved['status'], 'inconclusive')
                self.assertIn('required procfs view' if missing_view else 'stale fixture classes', saved['error'])
