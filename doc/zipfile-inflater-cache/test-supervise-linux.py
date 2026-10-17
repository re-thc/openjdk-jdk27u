#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Offline ancestry fixtures: python3 -E -B test-supervise-linux.py.

Extract only owned_processes from the supervisor AST. No top-level supervisor
code, real /proc reads, process creation or signalling runs in these tests.
"""
import ast
from pathlib import Path
from types import SimpleNamespace
import unittest


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
