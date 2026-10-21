# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. See LICENSE for details.

"""Fetch only the four reviewed, immutable CI archives; never build or retry."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import platform
import shutil
import stat
import struct
import sys
import tarfile
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request
import zipfile

from mac_image import inspect_image, mac_executable


MANIFEST = Path(__file__).with_name('artifacts.json')


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def sha256(path):
    with open(path, 'rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def api(path, token):
    request = urllib.request.Request('https://api.github.com/' + path, headers={
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
    })
    return urllib.request.build_opener(NoRedirect).open(request, timeout=20)


def api_json(path, token):
    with api(path, token) as response:
        return json.load(response)


def verify_metadata(actual, pin, manifest):
    for key, value in [('id', pin['id']), ('name', pin['name']),
                       ('size_in_bytes', pin['size_bytes']),
                       ('digest', 'sha256:' + pin['sha256'])]:
        require(actual.get(key) == value, 'Artifact metadata mismatch: ' + key)
    require(not actual['expired'], 'Artifact expired')
    expiry = datetime.datetime.fromisoformat(actual['expires_at'].replace('Z', '+00:00'))
    require(expiry > datetime.datetime.now(datetime.timezone.utc), 'Artifact expired')
    run = actual['workflow_run']
    require(run['id'] == manifest['run_id'] and run['head_sha'] == manifest['head'],
            'Artifact run/head mismatch')


def download(pin, dest, repo, token):
    # Do not let urllib forward the API Authorization header to blob storage.
    try:
        response = api(f'repos/{repo}/actions/artifacts/{pin["id"]}/zip', token)
    except urllib.error.HTTPError as error:
        require(error.code == 302, 'Artifact API download did not redirect')
        location = error.headers.get('Location', '')
        error.close()
        require(urllib.parse.urlsplit(location).scheme == 'https', 'Unsafe download URL')
        response = urllib.request.urlopen(location, timeout=20)
    deadline = time.monotonic() + 300
    count = 0
    digest = hashlib.sha256()
    with response, open(dest, 'xb') as output:
        while chunk := response.read(1024 * 1024):
            count += len(chunk)
            require(count <= pin['size_bytes'], 'Artifact larger than pinned size')
            require(time.monotonic() < deadline, 'Artifact download exceeded five minutes')
            digest.update(chunk)
            output.write(chunk)
    require(count == pin['size_bytes'], 'Artifact size mismatch')
    require(digest.hexdigest() == pin['sha256'], 'Artifact SHA256 mismatch')


def safe_zip_member(info):
    path = PurePosixPath(info.filename)
    require(not path.is_absolute() and '..' not in path.parts and
            '\\' not in info.filename and ':' not in info.filename,
            'Unsafe ZIP path')
    require(not stat.S_ISLNK(info.external_attr >> 16), 'ZIP symlink unsupported')


def extract_zip(archive, dest):
    with zipfile.ZipFile(archive) as package:
        require(sum(x.file_size for x in package.infolist()) < 16 * 1024**3,
                'ZIP expands beyond budget')
        for info in package.infolist():
            safe_zip_member(info)
        package.extractall(dest)


def extract_tar(archive, dest):
    require(hasattr(tarfile, 'data_filter'), 'Python tar data filter is required')
    with tarfile.open(archive) as package:
        require(sum(x.size for x in package.getmembers()) < 16 * 1024**3,
                'Tar expands beyond budget')
        package.extractall(dest, filter='data')


def unique(root, name):
    files = [p.resolve() for p in root.rglob(name) if p.is_file()]
    require(len(files) == 1, f'Expected one {name}, found {len(files)}')
    return files[0]


def unpack(archive, root, pin, manifest):
    suffix = '-debug' if pin['variant'] == 'fastdebug' else ''
    base = pin['platform'] + suffix
    jdk_bundle = 'jdk-' + base + ('.zip' if pin['platform'].startswith('windows') else '.tar.gz')
    tests_bundle = 'tests-' + base + '.tar.gz'
    root.mkdir()
    with zipfile.ZipFile(archive) as outer:
        for name in (jdk_bundle, tests_bundle):
            matches = [x for x in outer.infolist() if x.filename == name]
            require(len(matches) == 1, 'Missing or duplicate bundle ' + name)
            with outer.open(matches[0]) as src, open(root / name, 'xb') as dst:
                shutil.copyfileobj(src, dst)
    jdk = root / 'jdk'
    tests = root / 'tests'
    jdk.mkdir()
    tests.mkdir()
    (extract_zip if jdk_bundle.endswith('.zip') else extract_tar)(root / jdk_bundle, jdk)
    extract_tar(root / tests_bundle, tests)
    if not pin['platform'].startswith('windows'):
        return inspect_image(jdk, tests, pin['variant'], manifest['build_commit'])
    release = unique(jdk, 'release')
    home = release.parent
    require(manifest['build_commit'] in release.read_text(), 'Wrong compiled revision in release file')
    jli = unique(tests, 'JliLaunchTest.exe')
    selected = {'home': str(home), 'jli': str(jli), 'release': release.read_text(),
                'hashes': {str(jli): sha256(jli)}}
    daemon = unique(tests, 'daemonDestroy.exe')
    selected['daemon'] = str(daemon)
    files = [daemon, home / 'bin/jli.dll', home / 'bin/server/jvm.dll']
    for path in files:
        require(path.is_file(), 'Required native file missing: ' + str(path))
        selected['hashes'][str(path)] = sha256(path)
    return selected


def self_test():
    import io
    import unittest

    class Tests(unittest.TestCase):
        revision = json.loads(MANIFEST.read_text())['build_commit']

        def test_unsafe_zip(self):
            for name in ('../escape', '/escape', 'C:/escape', 'a\\escape'):
                with self.assertRaises(RuntimeError):
                    safe_zip_member(zipfile.ZipInfo(name))

        def test_unsafe_tar_link(self):
            with tempfile.TemporaryDirectory() as temp:
                archive = Path(temp) / 'bad.tar'
                with tarfile.open(archive, 'w') as tar:
                    info = tarfile.TarInfo('escape')
                    info.type, info.linkname = tarfile.SYMTYPE, '/outside'
                    tar.addfile(info)
                with self.assertRaises(tarfile.FilterError):
                    extract_tar(archive, Path(temp) / 'out')

        def test_wrong_metadata(self):
            m = json.loads(MANIFEST.read_text())
            pin = m['artifacts'][0]
            with self.assertRaises(RuntimeError):
                verify_metadata({'id': pin['id'], 'name': pin['name'],
                                 'size_in_bytes': pin['size_bytes'], 'digest': 'wrong'}, pin, m)

        def test_corrupt_download_rejected_before_unpack(self):
            from unittest.mock import patch
            payload = b'corrupted zip bytes'
            pin = {'id': 1, 'size_bytes': len(payload), 'sha256': '0' * 64}
            with tempfile.TemporaryDirectory() as temp, patch(__name__ + '.api', return_value=io.BytesIO(payload)):
                with self.assertRaisesRegex(RuntimeError, 'SHA256 mismatch'):
                    download(pin, Path(temp) / 'input.zip', 'fixture/repo', 'fixture')

        def test_ambiguous_release(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                for name in ('a', 'b'):
                    (root / name).mkdir()
                    (root / name / 'release').touch()
                with self.assertRaises(RuntimeError):
                    unique(root, 'release')

        def native(self, root, relative, cpu=0x0100000c, kind=2, mode=0o755):
            path = root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(struct.pack('<IIIIIIII', 0xfeedfacf, cpu, 0, kind, 0, 0, 0, 0))
            path.chmod(mode)
            return path

        def test_canonical_executables_with_dsym_duplicates(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                for name in ('JliLaunchTest', 'JniInvocationTest'):
                    expected = self.native(root, 'jdk/jtreg/native/' + name)
                    self.native(root, f'jdk/jtreg/native/{name}.dSYM/Contents/Resources/DWARF/{name}', kind=10)
                    # Reproduce the original basename failure before checking the repair.
                    with self.assertRaisesRegex(RuntimeError, 'found 2'):
                        unique(root, name)
                    self.assertEqual(mac_executable(root, name), expected.resolve())

        def test_dsym_only_rejected(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                self.native(root, 'jdk/jtreg/native/JliLaunchTest.dSYM/Contents/Resources/DWARF/JliLaunchTest', kind=10)
                with self.assertRaisesRegex(RuntimeError, 'found 0'):
                    mac_executable(root, 'JliLaunchTest')

        def test_noncanonical_executable_rejected(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                self.native(root, 'other/JliLaunchTest')
                with self.assertRaisesRegex(RuntimeError, 'outside canonical path'):
                    mac_executable(root, 'JliLaunchTest')

        def test_real_native_ambiguity_rejected(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                self.native(root, 'jdk/jtreg/native/JliLaunchTest')
                self.native(root, 'other/JliLaunchTest')
                with self.assertRaisesRegex(RuntimeError, 'found 2'):
                    mac_executable(root, 'JliLaunchTest')

        def test_invalid_executable_rejected(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                for cpu, kind, mode in ((0x01000007, 2, 0o755), (0x0100000c, 10, 0o755),
                                        (0x0100000c, 6, 0o755), (0x0100000c, 2, 0o644),
                                        (0x0100000c, 2, 0o611)):
                    with self.subTest(cpu=cpu, kind=kind, mode=mode):
                        self.native(root, 'jdk/jtreg/native/JliLaunchTest', cpu=cpu, kind=kind, mode=mode)
                        with self.assertRaises(RuntimeError):
                            mac_executable(root, 'JliLaunchTest')
                path = self.native(root, 'jdk/jtreg/native/JliLaunchTest')
                for invalid in (b'#!/bin/sh\n', b'\0' * 32):
                    path.write_bytes(invalid)
                    with self.assertRaises(RuntimeError):
                        mac_executable(root, 'JliLaunchTest')

        def test_symlink_executable_rejected(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                real = self.native(root, 'jdk/jtreg/native/payload')
                (real.parent / 'JliLaunchTest').symlink_to(real.name)
                with self.assertRaisesRegex(RuntimeError, 'must not use symlinks'):
                    mac_executable(root, 'JliLaunchTest')

        def mac_fixture(self, root, variant):
            # Pinned spec.gmk.template:905 and Bundles.gmk:152-174 define these layouts.
            jdk = root / 'jdk-input'
            relative = ('jdk-27.0.2.jdk/Contents/Home' if variant == 'release'
                        else 'jdk-27.0.2/fastdebug')
            home = jdk / relative
            home.mkdir(parents=True)
            (home / 'release').write_text(f'SOURCE=".:git:{self.revision[:12]}"\nJAVA_VERSION="27.0.2-internal"\n'
                                        f'JAVA_RUNTIME_VERSION="27.0.2-internal+0-re-thc-{self.revision}"\n'
                                        'OS_ARCH="aarch64"\nOS_NAME="Darwin"\n')
            self.native(jdk, relative + '/bin/java')
            for name in ('lib/libjli.dylib', 'lib/server/libjvm.dylib', 'lib/libjava.dylib'):
                self.native(jdk, relative + '/' + name, kind=6)
            (home / 'lib/jvm.cfg').write_text('-server KNOWN\n')
            if variant == 'release':
                self.native(jdk, 'jdk-27.0.2.jdk/Contents/MacOS/libjli.dylib', kind=6)
            tests = root / 'tests-input'
            for name in ('JliLaunchTest', 'JniInvocationTest'):
                self.native(tests, 'jdk/jtreg/native/' + name)
                self.native(tests, f'jdk/jtreg/native/{name}.dSYM/Contents/Resources/DWARF/{name}', kind=10)
            return jdk, tests, home

        def test_unpack_actual_release_and_fastdebug_layouts(self):
            for variant in ('release', 'fastdebug'):
                with self.subTest(variant=variant), tempfile.TemporaryDirectory() as temp:
                    root = Path(temp)
                    jdk, tests, home = self.mac_fixture(root, variant)
                    suffix = '-debug' if variant == 'fastdebug' else ''
                    bundles = []
                    for prefix, source in (('jdk', jdk), ('tests', tests)):
                        bundle = root / f'{prefix}-macos-aarch64{suffix}.tar.gz'
                        with tarfile.open(bundle, 'w:gz') as package:
                            for entry in source.iterdir():
                                package.add(entry, arcname=entry.name)
                        bundles.append(bundle)
                    archive = root / 'artifact.zip'
                    with zipfile.ZipFile(archive, 'w') as package:
                        for bundle in bundles:
                            package.write(bundle, bundle.name)
                    selected = unpack(archive, root / 'output',
                                      {'platform': 'macos-aarch64', 'variant': variant},
                                      {'build_commit': self.revision})
                    for key, name in (('jli', 'JliLaunchTest'), ('jni', 'JniInvocationTest')):
                        path = root.resolve() / 'output/tests/jdk/jtreg/native' / name
                        self.assertEqual(selected[key], str(path))
                        self.assertEqual(selected['hashes'][str(path)], sha256(path))
                    self.assertEqual(Path(selected['home']).relative_to(root.resolve() / 'output/jdk'),
                                     home.relative_to(jdk))
                    self.assertEqual(selected['layout'], 'app-bundle' if variant == 'release' else 'ordinary-jdk')
                    self.assertEqual('bundle_libjli' in selected, variant == 'release')
                    for key in ('java', 'libjli', 'libjvm', 'libjava'):
                        self.assertEqual(selected['hashes'][selected[key]], sha256(Path(selected[key])))

        def test_missing_required_mac_paths(self):
            for variant in ('release', 'fastdebug'):
                missing = ('bin/java', 'lib/libjli.dylib', 'lib/server/libjvm.dylib',
                           'lib/libjava.dylib', 'lib/jvm.cfg', 'jli', 'jni')
                if variant == 'release':
                    missing += ('../MacOS/libjli.dylib',)
                for name in missing:
                    with self.subTest(variant=variant, missing=name), tempfile.TemporaryDirectory() as temp:
                        jdk, tests, home = self.mac_fixture(Path(temp), variant)
                        path = (tests / 'jdk/jtreg/native' / ('JliLaunchTest' if name == 'jli' else 'JniInvocationTest')
                                if name in ('jli', 'jni') else home / name)
                        path.unlink()
                        with self.assertRaises(RuntimeError):
                            inspect_image(jdk, tests, variant, self.revision)

        def test_wrong_mac_layout_and_release_identity(self):
            for variant in ('release', 'fastdebug'):
                with self.subTest(variant=variant), tempfile.TemporaryDirectory() as temp:
                    jdk, tests, home = self.mac_fixture(Path(temp), variant)
                    other = 'fastdebug' if variant == 'release' else 'release'
                    with self.assertRaisesRegex(RuntimeError, 'JDK layout'):
                        inspect_image(jdk, tests, other, self.revision)
                    text = (home / 'release').read_text()
                    source = '.:git:' + self.revision[:12]
                    for old, new in ((source, '.:git:bad-revision'), (source, source + '++'),
                                     (source, source[:-1]), (self.revision, '0' * 40),
                                     ('aarch64', 'x86_64'), ('Darwin', 'Linux'),
                                     ('27.0.2-internal', '../escape')):
                        (home / 'release').write_text(text.replace(old, new))
                        with self.assertRaises(RuntimeError):
                            inspect_image(jdk, tests, variant, self.revision)
                    (home / 'release').write_text(text + 'JAVA_VERSION="27.0.2"\n')
                    with self.assertRaisesRegex(RuntimeError, 'duplicate release property'):
                        inspect_image(jdk, tests, variant, self.revision)

        def test_mac_release_ambiguity(self):
            with tempfile.TemporaryDirectory() as temp:
                jdk, tests, home = self.mac_fixture(Path(temp), 'release')
                (jdk / 'release').write_text((home / 'release').read_text())
                with self.assertRaisesRegex(RuntimeError, 'Expected one release, found 2'):
                    inspect_image(jdk, tests, 'release', self.revision)

        def test_source_status_marker_from_ci_dependencies(self):
            for variant in ('release', 'fastdebug'):
                with self.subTest(variant=variant), tempfile.TemporaryDirectory() as temp:
                    jdk, tests, home = self.mac_fixture(Path(temp), variant)
                    path = home / 'release'
                    text = path.read_text()
                    source = '.:git:' + self.revision[:12]
                    path.write_text(text.replace(source, source + '+'))
                    image = inspect_image(jdk, tests, variant, self.revision)
                    self.assertEqual(image['source_root'], source + '+')
                    self.assertTrue(image['source_status_marker'])

    result = unittest.TextTestRunner().run(unittest.defaultTestLoader.loadTestsFromTestCase(Tests))
    require(result.wasSuccessful(), 'Loader self-test failed')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--platform', choices=('windows-x64', 'macos-aarch64'))
    parser.add_argument('--root', type=Path)
    parser.add_argument('--evidence', type=Path)
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    require(args.root and args.evidence and args.platform, 'Missing paths/platform')
    manifest = json.loads(MANIFEST.read_text())
    args.root.mkdir(parents=True, exist_ok=True)
    args.evidence.mkdir(parents=True, exist_ok=True)
    (args.evidence / 'setup.json').write_text(json.dumps({
        'platform': args.platform, 'manifest': manifest, 'probe_commit': os.environ.get('GITHUB_SHA'),
        'controller_hashes': {p.name: sha256(p) for p in MANIFEST.parent.iterdir() if p.is_file()},
    }, indent=2))
    token = os.environ['GITHUB_TOKEN']
    repo = manifest['repository']
    # The publisher checks PR45's live head before both writes and dispatch.
    # Runtime reads use only contents/actions permissions and immutable run IDs.
    run = api_json(f'repos/{repo}/actions/runs/{manifest["run_id"]}', token)
    require(run['head_sha'] == manifest['head'] and run['conclusion'] == 'success'
            and run['run_attempt'] == manifest['attempt'], 'Pinned CI run changed')
    identity = {'manifest': manifest, 'probe_commit': os.environ.get('GITHUB_SHA'),
                'python': sys.version, 'system': platform.platform(),
                'runner': {k: os.environ.get(k) for k in ('ImageOS', 'ImageVersion', 'RUNNER_ARCH')},
                'verified_artifacts': [], 'images': {}}
    for pin in manifest['artifacts']:
        if pin['platform'] != args.platform:
            continue
        actual = api_json(f'repos/{repo}/actions/artifacts/{pin["id"]}', token)
        verify_metadata(actual, pin, manifest)
        archive = args.root / (str(pin['id']) + '.zip')
        download(pin, archive, repo, token)
        identity['verified_artifacts'].append(actual)
        if args.platform == 'macos-aarch64':
            print(json.dumps({'verified_artifact': pin['id'], 'variant': pin['variant'],
                              'sha256': pin['sha256']}), flush=True)
            # Preserve completed byte verification even if layout validation fails.
            (args.evidence / 'identity.json').write_text(json.dumps(identity, indent=2))
        identity['images'][pin['variant']] = unpack(archive, args.root / pin['variant'], pin, manifest)
        (args.evidence / 'identity.json').write_text(json.dumps(identity, indent=2))
        if args.platform == 'macos-aarch64':
            image = identity['images'][pin['variant']]
            print(json.dumps({'variant': pin['variant'], **{key: image[key] for key in (
                'layout', 'home', 'java', 'jli', 'jni', 'libjli', 'libjvm', 'source_root')}}), flush=True)
    require(set(identity['images']) == {'release', 'fastdebug'}, 'Missing image variant')


if __name__ == '__main__':
    main()
