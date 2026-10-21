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
import sys
import tarfile
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request
import zipfile


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
    release = unique(jdk, 'release')
    home = release.parent
    require(manifest['build_commit'] in release.read_text(), 'Wrong compiled revision in release file')
    win = pin['platform'].startswith('windows')
    jli = unique(tests, 'JliLaunchTest.exe' if win else 'JliLaunchTest')
    selected = {'home': str(home), 'jli': str(jli), 'release': release.read_text(),
                'hashes': {str(jli): sha256(jli)}}
    if win:
        daemon = unique(tests, 'daemonDestroy.exe')
        selected['daemon'] = str(daemon)
        files = [daemon, home / 'bin/jli.dll', home / 'bin/server/jvm.dll']
    else:
        require(home.name == 'Home', 'Mac app bundle Home layout required')
        require((home.parent / 'MacOS/libjli.dylib').is_file(), 'MacOS libjli alias missing')
        jni = unique(tests, 'JniInvocationTest')
        selected['jni'] = str(jni)
        files = [jni, home / 'lib/libjli.dylib', home / 'lib/server/libjvm.dylib']
    for path in files:
        require(path.is_file(), 'Required native file missing: ' + str(path))
        selected['hashes'][str(path)] = sha256(path)
    return selected


def self_test():
    import io
    import unittest

    class Tests(unittest.TestCase):
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

        def test_ambiguous_native(self):
            with tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                for name in ('a', 'b'):
                    (root / name).mkdir()
                    (root / name / 'JliLaunchTest').touch()
                with self.assertRaises(RuntimeError):
                    unique(root, 'JliLaunchTest')

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
        identity['images'][pin['variant']] = unpack(archive, args.root / pin['variant'], pin, manifest)
        (args.evidence / 'identity.json').write_text(json.dumps(identity, indent=2))
    require(set(identity['images']) == {'release', 'fastdebug'}, 'Missing image variant')


if __name__ == '__main__':
    main()
