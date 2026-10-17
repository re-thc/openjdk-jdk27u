#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Offline ancestry fixtures: python3 -E -B test-supervise-linux.py.

Extract only owned_processes from the supervisor AST. No top-level supervisor
code, real /proc reads, process creation or signalling runs in these tests.
"""
import ast
import argparse
from pathlib import Path
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch


class OwnedProcessesTest(unittest.TestCase):
    source = Path(__file__).with_name('supervise-linux.py').read_text()

    def discover(self, snapshot, fresh):
        seen = set()
        reads = []

        def process_info(pid):
            reads.append(pid)
            if pid in snapshot and pid not in seen:
                seen.add(pid)
                return snapshot[pid]
            value = fresh[pid]
            if isinstance(value, list):
                value = value.pop(0) if len(value) > 1 else value[0]
            if isinstance(value, Exception):
                raise value
            return value

        paths = [SimpleNamespace(parent=SimpleNamespace(name=str(pid)))
                 for pid in snapshot]
        fake_proc = SimpleNamespace(glob=lambda pattern: paths)
        namespace = dict(Path=lambda path: fake_proc,
                         os=SimpleNamespace(getpid=lambda: 10),
                         process_info=process_info)
        function = next(node for node in ast.parse(self.source).body
                        if isinstance(node, ast.FunctionDef)
                        and node.name == 'owned_processes')
        exec(compile(ast.Module(body=[function], type_ignores=[]),
                     '<owned_processes fixture>', 'exec'), namespace)
        return namespace['owned_processes'](), reads

    def test_stale_child_does_not_acquire_reused_owned_parent(self):
        # Child 30 is scanned under unrelated old PID 20. After that parent
        # exits, the child is reparented to 1 and PID 20 is reused by our child.
        # A later snapshot of 20 sees its new owned identity. Parent validation
        # alone would incorrectly classify the still-live unrelated child 30.
        snapshot = {30: (20, 300, 1), 20: (10, 400, 2)}
        fresh = {10: (1, 100, 3), 20: (10, 400, 2), 30: (1, 300, 5)}
        owned, _ = self.discover(snapshot, fresh)
        self.assertEqual(owned, {20: fresh[20]})

    def test_reused_child_is_rejected_even_with_same_parent_pid(self):
        snapshot = {20: (10, 200, 1)}
        fresh = {10: (1, 100, 2), 20: (10, 201, 3)}
        owned, _ = self.discover(snapshot, fresh)
        self.assertEqual(owned, {})

    def test_continuation_cli_before_remainder(self):
        nodes = []
        for node in ast.parse(self.source).body:
            if isinstance(node, ast.Assign) and any(isinstance(target, ast.Name)
                    and target.id in ('parser', 'args') for target in node.targets):
                nodes.append(node)
                if any(isinstance(target, ast.Name) and target.id == 'args' for target in node.targets):
                    break
            elif isinstance(node, ast.Expr) and isinstance(node.value, ast.Call):
                call = node.value.func
                if isinstance(call, ast.Attribute) and isinstance(call.value, ast.Name) and call.value.id == 'parser':
                    nodes.append(node)
        namespace = dict(argparse=argparse, Path=Path)
        with patch('sys.argv', ['supervise-linux.py', '--resume-from', '/preserved',
                                '/fresh', 'a' * 40]):
            exec(compile(ast.Module(body=nodes, type_ignores=[]), '<CLI fixture>', 'exec'), namespace)
        self.assertEqual(namespace['args'].resume_from, Path('/preserved'))
        self.assertEqual(namespace['args'].root, Path('/fresh'))
        self.assertEqual(namespace['args'].configure_options, [])

    def test_scratch_counts_both_roots(self):
        function = next(node for node in ast.parse(self.source).body
                        if isinstance(node, ast.FunctionDef) and node.name == 'disk_usage')
        process = Mock()
        process.check_output.return_value = '10 /fresh\n20 /preserved\n'
        namespace = dict(subprocess=process, disk_roots=[Path('/fresh'), Path('/preserved')])
        exec(compile(ast.Module(body=[function], type_ignores=[]), '<disk fixture>', 'exec'), namespace)
        self.assertEqual(namespace['disk_usage'](3), 30)
        process.check_output.assert_called_once_with(
            ['du', '-sb', '--', '/fresh', '/preserved'], text=True, timeout=3)

    def test_cleanup_reaps_preflight_workers_without_campaign_child(self):
        function = next(node for node in ast.parse(self.source).body
                        if isinstance(node, ast.FunctionDef) and node.name == 'cleanup')
        processes = {20: (10, 200, 1)}
        namespace = dict(time=SimpleNamespace(monotonic=lambda: 0, sleep=Mock()),
                         owned_processes=Mock(side_effect=[processes, {}]),
                         signal_owned=Mock(), signal=SimpleNamespace(SIGTERM=15, SIGKILL=9),
                         os=SimpleNamespace(waitpid=Mock(), WNOHANG=1))
        exec(compile(ast.Module(body=[function], type_ignores=[]), '<cleanup fixture>', 'exec'), namespace)
        self.assertEqual(namespace['cleanup'](None, 10), {})
        namespace['signal_owned'].assert_called_once_with(processes, 15)
        namespace['os'].waitpid.assert_called_once_with(20, 1)

    def test_parent_is_revalidated_after_reading_child(self):
        snapshot = {30: (20, 300, 1), 20: (10, 200, 2)}
        original_parent = (10, 200, 4)
        fresh = {10: (1, 100, 3), 30: (20, 300, 5),
                 20: [original_parent, (10, 201, 6)]}
        owned, reads = self.discover(snapshot, fresh)
        self.assertEqual(owned, {20: original_parent})
        self.assertEqual(reads, [30, 20, 10, 20, 10, 30, 20])

    def test_owned_descendants_use_fresh_records(self):
        snapshot = {30: (20, 300, 1), 20: (10, 200, 2)}
        fresh = {10: (1, 100, 3), 20: (10, 200, 4), 30: (20, 300, 5)}
        owned, _ = self.discover(snapshot, fresh)
        self.assertEqual(owned, {20: fresh[20], 30: fresh[30]})

    def test_disappeared_child_is_skipped(self):
        snapshot = {20: (10, 200, 1)}
        fresh = {10: (1, 100, 2), 20: FileNotFoundError()}
        owned, _ = self.discover(snapshot, fresh)
        self.assertEqual(owned, {})


if __name__ == '__main__':
    unittest.main()
