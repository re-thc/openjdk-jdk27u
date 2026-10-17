#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Offline spec-text fixtures; no configure, build, JVM or campaign."""
import unittest
from unittest.mock import patch

from qualify import Stop, require_gc_profile

SERVER = 'JVM_VARIANTS := server\nJVM_FEATURES_server := cds compiler1 compiler2 g1gc serialgc zgc\n'
INACTIVE = ('JVM_FEATURES_client := \nJVM_FEATURES_core := \n'
            'JVM_FEATURES_minimal := \nJVM_FEATURES_zero := \n'
            'JVM_FEATURES_custom := \n# Used for make-time verifications\nOTHER := value\n')


class TestGCProfile(unittest.TestCase):
    def setUp(self):
        guard = patch('qualify.subprocess.Popen', side_effect=AssertionError('offline fixture started a process'))
        guard.start()
        self.addCleanup(guard.stop)

    def test_generated_server_with_inactive_variants(self):
        self.assertEqual(require_gc_profile(SERVER + INACTIVE), ['server'])

    def test_line_boundaries_do_not_consume_following_declarations(self):
        self.assertEqual(require_gc_profile(INACTIVE + SERVER), ['server'])

    def test_every_active_variant_is_checked(self):
        text = SERVER.replace('JVM_VARIANTS := server', 'JVM_VARIANTS := server custom')
        text += 'JVM_FEATURES_custom := serialgc zgc g1gc\n'
        self.assertEqual(require_gc_profile(text), ['server', 'custom'])
        with self.assertRaises(Stop):
            require_gc_profile(text.replace('JVM_FEATURES_custom := serialgc zgc g1gc',
                                            'JVM_FEATURES_custom := serialgc'))

    def test_missing_or_empty_active_features_are_rejected(self):
        for text in ['JVM_VARIANTS := server\n', 'JVM_VARIANTS := server\nJVM_FEATURES_server := \n' + INACTIVE]:
            with self.subTest(text=text), self.assertRaises(Stop):
                require_gc_profile(text)

    def test_inactive_features_cannot_substitute_for_active_features(self):
        with self.assertRaises(Stop):
            require_gc_profile('JVM_VARIANTS := server\nJVM_FEATURES_client := g1gc serialgc zgc\n')

    def test_wrong_collectors_are_rejected(self):
        for features in ['serialgc zgc', 'g1gc serialgc zgc parallelgc', 'g1gc serialgc zgc zgc']:
            with self.subTest(features=features), self.assertRaises(Stop):
                require_gc_profile('JVM_VARIANTS := server\nJVM_FEATURES_server := ' + features + '\n')

    def test_missing_empty_or_duplicate_variants_are_rejected(self):
        for text in ['JVM_FEATURES_server := g1gc serialgc zgc\n', 'JVM_VARIANTS := \n',
                     SERVER.replace('JVM_VARIANTS := server', 'JVM_VARIANTS := server server')]:
            with self.subTest(text=text), self.assertRaises(Stop):
                require_gc_profile(text)

    def test_duplicate_declarations_are_rejected(self):
        with self.assertRaises(Stop):
            require_gc_profile(SERVER + 'JVM_FEATURES_server := g1gc serialgc zgc\n')
        with self.assertRaises(Stop):
            require_gc_profile(SERVER + 'JVM_VARIANTS := server\n')


if __name__ == '__main__':
    unittest.main()
