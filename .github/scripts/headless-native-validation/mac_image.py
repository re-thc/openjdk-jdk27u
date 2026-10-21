# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. See LICENSE for details.

"""Validate the layouts defined by the pinned Bundles/MacBundles/spec makefiles."""
import hashlib
from pathlib import Path
import re
import stat
import struct


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def sha256(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def macho(path, kind):
    require(path.is_file() and path.resolve() == path, 'Missing or noncanonical native file: ' + str(path))
    if kind == 2:
        require(path.stat().st_mode & stat.S_IXUSR, 'Mac native file is not owner-executable: ' + str(path))
    with path.open('rb') as stream:
        header = stream.read(32)
    require(len(header) == 32, 'Truncated Mach-O file: ' + str(path))
    magic, cpu, _, actual_kind = struct.unpack('<IIII', header[:16])
    require((magic, cpu, actual_kind) == (0xfeedfacf, 0x0100000c, kind),
            f'Expected arm64 Mach-O type {kind}: {path}')
    return path


def mac_executable(root, name):
    root = root.resolve()
    expected = root / 'jdk/jtreg/native' / name
    # JtregNativeJdk.gmk flattens binaries here; debug payloads live in .dSYM.
    candidates = [p for p in root.rglob(name) if p.is_file() and not any(
        part.lower().endswith('.dsym') for part in p.relative_to(root).parts)]
    require(len(candidates) == 1, f'Expected one non-dSYM {name}, found {len(candidates)}')
    require(candidates[0] == expected, 'Native executable outside canonical path: ' + str(candidates[0]))
    require(expected.resolve() == expected, 'Mac native executable must not use symlinks')
    return macho(expected, 2)


def release_value(text, key):
    values = re.findall(r'^' + key + r'="([^"\n]*)"$', text, re.MULTILINE)
    require(len(values) == 1, 'Missing or duplicate release property: ' + key)
    return values[0]


def inspect_image(jdk, tests, variant, revision):
    jdk, tests = jdk.resolve(), tests.resolve()
    releases = [p for p in jdk.rglob('release') if p.is_file()]
    require(len(releases) == 1, f'Expected one release, found {len(releases)}')
    release = releases[0]
    text = release.read_text()
    # SourceRevision.gmk truncates SOURCE to 12 hex digits; the CI version-opt
    # preserves GITHUB_SHA in JAVA_RUNTIME_VERSION (build-macos.yml).
    root_sources = [token for token in release_value(text, 'SOURCE').split() if token.startswith('.:git:')]
    expected_source = '.:git:' + revision[:12]
    # CI dependency actions can leave untracked directories; '+' alone does not
    # identify a product-source change. Archive hashes still pin the whole image.
    require(len(root_sources) == 1 and root_sources[0] in (expected_source, expected_source + '+'),
            'Wrong root SOURCE revision')
    require(revision in release_value(text, 'JAVA_RUNTIME_VERSION'), 'Wrong compiled runtime revision')
    require(release_value(text, 'OS_ARCH') == 'aarch64' and release_value(text, 'OS_NAME') == 'Darwin',
            'Wrong Mac release platform')
    # ReleaseInfoPlugin writes JAVA_VERSION from the java.base module version.
    version = release_value(text, 'JAVA_VERSION').split('-')[0].split('+')[0]
    require(re.fullmatch(r'[0-9]+(?:\.[0-9]+)*', version), 'Invalid numeric JAVA_VERSION')
    require(variant in ('release', 'fastdebug'), 'Unexpected Mac image variant')
    if variant == 'release':
        home = jdk / f'jdk-{version}.jdk/Contents/Home'
        layout = 'app-bundle'
    else:
        home = jdk / f'jdk-{version}/fastdebug'
        layout = 'ordinary-jdk'
    require(release == home / 'release' and home.resolve() == home,
            f'Wrong {variant} JDK layout: {release.parent}')
    files = {'java': macho(home / 'bin/java', 2),
             'jli': mac_executable(tests, 'JliLaunchTest'),
             'jni': mac_executable(tests, 'JniInvocationTest'),
             'libjli': macho(home / 'lib/libjli.dylib', 6),
             'libjvm': macho(home / 'lib/server/libjvm.dylib', 6),
             'libjava': macho(home / 'lib/libjava.dylib', 6)}
    config = home / 'lib/jvm.cfg'
    require(config.is_file(), 'Missing lib/jvm.cfg')
    files['jvm_config'] = config
    if variant == 'release':
        # MacBundles.gmk copies this dylib; it need not be a symlink or byte-identical after signing.
        files['bundle_libjli'] = macho(home.parent / 'MacOS/libjli.dylib', 6)
    return {'jdk_root': str(jdk), 'tests_root': str(tests), 'home': str(home),
            'layout': layout, 'release': text, 'source_root': root_sources[0],
            'source_status_marker': root_sources[0].endswith('+'),
            **{key: str(path) for key, path in files.items()},
            'hashes': {str(path): sha256(path) for path in files.values()}}
