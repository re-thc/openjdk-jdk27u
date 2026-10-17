#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Static command-path checks only; no shell, build, JVM or /proc execution."""
from pathlib import Path
import re
import unittest


def check_plan(source):
    commands = source.replace('\\\n', '')
    targets = re.findall(r'\bmake CONF=zip-qual JOBS=4 ([\w-]+)', commands)
    if targets != ['jdk-image', 'test', 'test']:
        raise ValueError('Build jdk-image before the two packaged-image test commands')
    paths = set(re.findall(r'build/zip-qual/(?:images/)?jdk\b', commands))
    if paths != {'build/zip-qual/images/jdk'}:
        raise ValueError('Use images/jdk consistently; jdk is an exploded layout')
    required = (
        "printf '%s/%s/build/zip-qual/images/jdk\\n' \"$ROOT\" \"$1\"",
        'image=$(jdk_image "$tree")',
        'BASE_JDK=$(jdk_image base)',
        'CANDIDATE_JDK=$(jdk_image candidate)',
        'if [[ $label == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi',
        'test -x "$image/bin/java"',
        'release lib/modules lib/server/libjvm.so lib/libzip.so include/jni.h include/linux/jni_md.h',
        'test -f "$image/$file"',
        'cp "$image/release"',
        'sha256sum "$image/lib/modules" "$image/lib/server/libjvm.so"',
        '"$image/lib/libzip.so" >',
        'test JDK_IMAGE_DIR="$BASE_JDK"',
        'test JDK_IMAGE_DIR="$CANDIDATE_JDK"',
        '-I"$CANDIDATE_JDK/include" -I"$CANDIDATE_JDK/include/linux"',
        '"$image/bin/java"',
        '--baseline "$BASE_JDK" --candidate "$CANDIDATE_JDK"',
        'source "$Q/test-selections.sh"',
        'TEST="$consumer_tests"',
        'TEST="$candidate_tests"',
    )
    for command in required:
        if command not in commands:
            raise ValueError('Missing packaged-image command path: ' + command)
    if 'JDK_OUTPUTDIR' in commands or 'exploded-test' in commands:
        raise ValueError('Correctness and measurements must use the same packaged images')


class ImageLayoutTest(unittest.TestCase):
    directory = Path(__file__).resolve().parent
    source = ((directory / 'run-linux.sh').read_text()
              + (directory / 'run-stages.sh').read_text())

    def test_complete_command_path(self):
        check_plan(self.source)

    def test_static_check_precedes_build(self):
        self.assertLess(self.source.index('test-image-layout.py'),
                        self.source.index('90m make'))

    def test_continuation_confines_shared_stage_cwd(self):
        source = (self.directory / 'continue-linux.sh').read_text()
        position = source.index('cd -- "$ROOT"')
        self.assertLess(source.index('BOOT_JDK=$(cd -- "$BOOT_JDK" && pwd -P)'), position)
        self.assertLess(source.index('JTREG_HOME=$(cd -- "$JTREG_HOME" && pwd -P)'), position)
        self.assertLess(position, source.index('initial-provenance.json'))
        self.assertLess(position, source.index('source "$Q/run-stages.sh"'))

    def test_original_build_hash_mismatch_is_rejected(self):
        # The failed attempt built an exploded JDK, then expected a jlink file.
        fixture = '''timeout --kill-after=30s 90m make CONF=zip-qual JOBS=4 jdk
sha256sum build/zip-qual/jdk/lib/modules
make CONF=zip-qual JOBS=4 test
make CONF=zip-qual JOBS=4 test
'''
        with self.assertRaisesRegex(ValueError, 'Build jdk-image'):
            check_plan(fixture)

    def test_packaged_target_with_exploded_paths_is_rejected(self):
        fixture = self.source.replace('build/zip-qual/images/jdk', 'build/zip-qual/jdk')
        with self.assertRaisesRegex(ValueError, 'Use images/jdk consistently'):
            check_plan(fixture)

    def test_correctness_image_cannot_drift(self):
        fixture = self.source.replace('test JDK_IMAGE_DIR="$BASE_JDK"', 'test')
        with self.assertRaisesRegex(ValueError, 'test JDK_IMAGE_DIR='):
            check_plan(fixture)

    def test_repository_target_semantics(self):
        main = (self.directory.parents[1] / 'make/Main.gmk').read_text()
        self.assertRegex(main, r'(?m)^jdk: exploded-image$')
        self.assertRegex(main, r'(?s)SetupTarget, jdk-image,.*?MAKEFILE := Images,.*?TARGET := jdk,')
        self.assertRegex(main, r'(?s)SetupTarget, test,.*?DEPS := jdk-image test-image')


if __name__ == '__main__':
    unittest.main()
