# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import diagnostic


class ClosureTests(unittest.TestCase):
    def close_at(self, before, after):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'receipt.json'
            receipt = {'status': 'diagnostic data only; no performance pass'}
            now = [before]
            real_save = diagnostic.save
            def writer(target, value):
                real_save(target, value)
                now[0] = after
            with patch.object(diagnostic.time, 'monotonic', side_effect=lambda: now[0]), \
                 patch.object(diagnostic, 'save', side_effect=writer):
                closed = diagnostic.close_receipt(path, receipt, 0, 90)
            return closed, json.loads(path.read_text())

    def test_write_finishes_before_deadline(self):
        closed, result = self.close_at(89, 89.999)
        self.assertTrue(closed)
        self.assertTrue(result['status'].startswith('diagnostic data only'))

    def test_write_hits_deadline(self):
        closed, result = self.close_at(89, 90)
        self.assertFalse(closed)
        self.assertTrue(result['status'].startswith('inconclusive'))
        self.assertIn('during receipt closure', result['closure_error'])

    def test_write_crosses_deadline(self):
        closed, result = self.close_at(89, 91)
        self.assertFalse(closed)
        self.assertTrue(result['status'].startswith('inconclusive'))
        self.assertEqual(result['elapsed_s'], 91)

    def test_already_at_deadline(self):
        closed, result = self.close_at(90, 91)
        self.assertFalse(closed)
        self.assertIn('before receipt closure', result['closure_error'])

    def test_failed_invalidation_write_leaves_no_success_file(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'receipt.json'
            receipt = {'status': 'diagnostic data only; no performance pass'}
            now = [89]
            real_save = diagnostic.save
            def writer(target, value):
                if value['status'].startswith('inconclusive'):
                    raise OSError('invalidation write failed')
                real_save(target, value)
                now[0] = 91
            with patch.object(diagnostic.time, 'monotonic', side_effect=lambda: now[0]), \
                 patch.object(diagnostic, 'save', side_effect=writer):
                with self.assertRaises(OSError):
                    diagnostic.close_receipt(path, receipt, 0, 90)
            self.assertFalse(path.exists())
            self.assertTrue(receipt['status'].startswith('inconclusive'))


if __name__ == '__main__':
    unittest.main()
