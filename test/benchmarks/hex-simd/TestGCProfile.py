#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Offline spec-text fixtures; no configure, build, JVM or campaign."""
import unittest
from unittest.mock import patch

from qualify import Stop, require_gc_profile, validate_platform_options

SERVER = ('JVM_VARIANTS := server\nJVM_VARIANT_MAIN := server\n'
          'JVM_FEATURES_server := cds compiler1 compiler2 g1gc serialgc zgc\n')
INACTIVE = ('JVM_FEATURES_client := \nJVM_FEATURES_core := \n'
            'JVM_FEATURES_minimal := \nJVM_FEATURES_zero := \n'
            'JVM_FEATURES_custom := \n# Used for make-time verifications\nOTHER := value\n')


class OfflineFixtures(unittest.TestCase):
    def setUp(self):
        guard = patch('qualify.subprocess.Popen', side_effect=AssertionError('offline fixture started a process'))
        guard.start()
        self.addCleanup(guard.stop)


class TestGCProfile(OfflineFixtures):
    def test_generated_server_with_inactive_variants(self):
        self.assertEqual(require_gc_profile(SERVER + INACTIVE), ['server'])

    def test_line_boundaries_do_not_consume_following_declarations(self):
        self.assertEqual(require_gc_profile(INACTIVE + SERVER), ['server'])

    def test_extra_active_variant_is_rejected(self):
        text = SERVER.replace('JVM_VARIANTS := server', 'JVM_VARIANTS := server custom')
        text += 'JVM_FEATURES_custom := cds compiler2 serialgc zgc g1gc\n'
        with self.assertRaises(Stop):
            require_gc_profile(text)

    def test_wrong_active_variants_are_rejected(self):
        for variant in ['client', 'custom', 'zero']:
            text = SERVER.replace('JVM_VARIANTS := server', 'JVM_VARIANTS := ' + variant)
            text = text.replace('JVM_VARIANT_MAIN := server', 'JVM_VARIANT_MAIN := ' + variant)
            text += 'JVM_FEATURES_' + variant + ' := cds compiler2 g1gc serialgc zgc\n'
            with self.subTest(variant=variant), self.assertRaises(Stop):
                require_gc_profile(text)

    def test_main_server_property_is_required(self):
        for text in [SERVER.replace('JVM_VARIANT_MAIN := server\n', ''),
                     SERVER.replace('JVM_VARIANT_MAIN := server', 'JVM_VARIANT_MAIN := client'),
                     SERVER.replace('JVM_VARIANT_MAIN := server', 'JVM_VARIANT_MAIN := ')]:
            with self.subTest(text=text), self.assertRaisesRegex(Stop, 'main JVM variant'):
                require_gc_profile(text)

    def test_compiler2_and_cds_are_required(self):
        for features in ['cds compiler1 g1gc serialgc zgc', 'compiler1 compiler2 g1gc serialgc zgc',
                         'compiler1 g1gc serialgc zgc']:
            text = SERVER.replace('cds compiler1 compiler2 g1gc serialgc zgc', features)
            with self.subTest(features=features), self.assertRaisesRegex(Stop, 'compiler2 and cds'):
                require_gc_profile(text)

    def test_missing_or_empty_active_features_are_rejected(self):
        prefix = 'JVM_VARIANTS := server\nJVM_VARIANT_MAIN := server\n'
        for text in [prefix, prefix + 'JVM_FEATURES_server := \n' + INACTIVE]:
            with self.subTest(text=text), self.assertRaisesRegex(Stop, 'compiler2 and cds'):
                require_gc_profile(text)

    def test_inactive_features_cannot_substitute_for_active_features(self):
        with self.assertRaises(Stop):
            require_gc_profile('JVM_VARIANTS := server\nJVM_VARIANT_MAIN := server\n'
                               'JVM_FEATURES_client := cds compiler2 g1gc serialgc zgc\n')

    def test_wrong_collectors_are_rejected(self):
        for features in ['serialgc zgc', 'g1gc serialgc zgc parallelgc', 'g1gc serialgc zgc zgc']:
            with self.subTest(features=features), self.assertRaisesRegex(Stop, 'collector profile'):
                require_gc_profile('JVM_VARIANTS := server\nJVM_VARIANT_MAIN := server\n'
                                   'JVM_FEATURES_server := cds compiler2 ' + features + '\n')

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
        with self.assertRaises(Stop):
            require_gc_profile(SERVER + 'JVM_VARIANT_MAIN := server\n')


class TestPlatformOptions(OfflineFixtures):
    def test_feature_override_forms_are_rejected(self):
        for options in [
            ['--with-jvm-features=-compiler2'], ['--with-jvm-features=-cds'],
            ['--with-jvm-features=-compiler2,-cds'], ['--with-jvm-features=compiler2,cds'],
            ['--with-jvm-features', '-compiler2'], ['--without-jvm-features'],
            ['--without-jvm-features=compiler2'], ['-with-jvm-features=-cds'],
            ['-without-jvm-features'],
        ]:
            with self.subTest(options=options), self.assertRaises(ValueError):
                validate_platform_options(options)

    def test_variant_override_forms_are_rejected(self):
        for options in [
            ['--with-jvm-variants=client'], ['--with-jvm-variants=server,client'],
            ['--with-jvm-variants=server'], ['--with-jvm-variants', 'server'],
            ['--without-jvm-variants'], ['--without-jvm-variants=server'],
            ['-with-jvm-variants=client'], ['-without-jvm-variants'],
        ]:
            with self.subTest(options=options), self.assertRaises(ValueError):
                validate_platform_options(options)

    def test_existing_frozen_options_remain_rejected(self):
        for option in ['--disable-jvm-feature-compiler2', '--enable-jvm-feature-cds',
                       '--with-debug-level=fastdebug', '--with-jobs=8', '--with-memory-size=16384',
                       '--with-conf-name=other', '--enable-hex-simd']:
            with self.subTest(option=option), self.assertRaises(ValueError):
                validate_platform_options([option])

    def test_dependency_paths_and_empty_options_remain_allowed(self):
        options = ['--with-toolchain-path=/workspace/gcc16/bin',
                   '--with-extra-ldflags=-B/workspace/mold/bin', '--with-sysroot=/workspace/sysroot',
                   '--with-libffi=/workspace/libffi', '--with-freetype-include=/workspace/include',
                   '--with-rust-runtime-notices=/workspace/rust/share/doc/rust',
                   '-with-libffi=/workspace/libffi']
        self.assertIsNone(validate_platform_options(options))
        self.assertIsNone(validate_platform_options([]))


if __name__ == '__main__':
    unittest.main()
