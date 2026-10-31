#!/usr/bin/env python3
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Import the pinned zlib-ng archive and replay the maintained raw CRC patch."""
import argparse
import hashlib
import os
from pathlib import Path, PurePosixPath
import subprocess
import tarfile
import tempfile

# Updating upstream requires deliberately rebasing the patch and these checksums.
REVISION = '49323f2af98b92fccf03cfc62ea2cb5591a3202e'
ARCHIVE_SHA256 = 'bc36e6f11cdbe71352b551ed98c94cd9d5f13dc248f3c3b56c518cc72678d604'
PATCH_SHA256 = '704ecfdd24bf4e6f3015ec5feb7884b2a4be018c3ede26ebd3c17b9fd40be556'
TREE_SHA256 = '660dfe08f432771a3a1f1b6c8402e66cc5450f89b0d6b9097822a425969f0bfc'
VENDOR = Path('src/java.base/share/native/libzip/zlib-ng')
LEGAL = Path('src/java.base/share/legal/zlib-ng.md')
PATCH = Path('make/data/zlib-ng/raw-crc32.patch')


def selected(path):
    return ((len(path.parts) == 1 and
             (path.suffix in ('.c', '.h', '.in') or path.name in ('configure', 'LICENSE.md')))
            or (path.parts[0] == 'arch' and path.suffix in ('.c', '.h', '.in'))
            or (path.parts[0] == 'cmake' and not path.name.startswith('toolchain-')
                and path.suffix in ('.c', '.cmake'))
            or (path.parts[0] == 'utils' and path.suffix in ('.c', '.h'))
            or path.as_posix() in ('CMakeLists.txt', 'utils/CMakeLists.txt',
                             'zlib.pc.cmakein', 'zlib_name_mangling.h.empty',
                             'tools/config.sub', 'test/Makefile.in'))


def tree_digest(files):
    """Hash sorted paths, executable bits, lengths and exact file bytes."""
    digest = hashlib.sha256()
    for path, (content, mode) in sorted(files.items(), key=lambda item: item[0].as_posix()):
        metadata = (path.as_posix(), oct(0o755 if mode & 0o111 else 0o644), str(len(content)))
        digest.update(('\0'.join(metadata) + '\0').encode('utf-8'))
        digest.update(content)
    return digest.hexdigest()


def no_symlinks(path):
    # Check ancestors too: a legal-directory link must not redirect writes.
    for parent in (path, *path.parents):
        if parent.is_symlink():
            raise ValueError('destination contains a symlink: ' + str(parent))
    if path.is_dir():
        for child in path.rglob('*'):
            if child.is_symlink():
                raise ValueError('destination contains a symlink: ' + str(child))


def import_sources(root, archive_path, revision, sha256):
    if revision != REVISION:
        raise ValueError('revision requires an explicit raw CRC patch rebase and checksum update')
    if sha256 != ARCHIVE_SHA256 or hashlib.sha256(archive_path.read_bytes()).hexdigest() != ARCHIVE_SHA256:
        raise ValueError('archive SHA-256 does not match the maintained upstream pin')
    patch = (root / PATCH).read_bytes()
    if hashlib.sha256(patch).hexdigest() != PATCH_SHA256:
        raise ValueError('raw CRC patch SHA-256 does not match')
    files = {}
    seen = set()
    with tarfile.open(archive_path) as archive:
        for member in archive:
            name = PurePosixPath(member.name)
            if ('\\' in member.name or ':' in member.name
                    or not name.parts or name.parts[0] != 'zlib-ng-' + revision
                    or name.is_absolute() or '..' in name.parts or name in seen):
                raise ValueError('unsafe, duplicate or unexpected archive path: ' + member.name)
            seen.add(name)
            if member.isdir():
                continue
            if not member.isfile():
                raise ValueError('unsupported archive entry: ' + member.name)
            path = Path(*name.parts[1:])
            if not path.parts:
                raise ValueError('missing archive file path')
            if selected(path):
                files[path] = (archive.extractfile(member).read(),
                               0o755 if member.mode & 0o111 else 0o644)
    if Path('LICENSE.md') not in files:
        raise ValueError('missing upstream license')
    license_bytes = files[Path('LICENSE.md')][0]
    license_text = license_bytes.decode('utf-8')
    legal = ('## zlib-ng (commit ' + revision + ')\n\n'
             'Locally modified for persistent raw-inflate CRC32; maintained patch and\n'
             'synthetic regression probe: `make/data/zlib-ng/raw-crc32.patch`.\n\n'
             '### zlib License\n<pre>\n\n' + license_text + '\n</pre>\n')
    # No checkout writes until patch replay, output verification and path checks pass.
    with tempfile.TemporaryDirectory(prefix='zlib-ng-import-') as temporary:
        stage = Path(temporary)
        for path, (content, mode) in files.items():
            target = stage / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(content)
            target.chmod(mode)
        # git apply is only a patch reader here, with no repository/index access.
        git_env = {key: value for key, value in os.environ.items() if not key.startswith('GIT_')}
        for options in (['--check'], []):
            result = subprocess.run(['git', 'apply', '--no-index', '--whitespace=error-all', *options, '-'],
                                    cwd=stage, input=patch, env=git_env,
                                    stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if result.returncode:
                raise ValueError('raw CRC patch replay failed: ' + result.stderr.decode(errors='replace').strip())
        files = {}
        for target in stage.rglob('*'):
            if target.is_symlink():
                raise ValueError('patch created a symlink')
            if target.is_file():
                mode = 0o755 if target.stat().st_mode & 0o111 else 0o644
                files[target.relative_to(stage)] = (target.read_bytes(), mode)
        if files.get(Path('LICENSE.md'), (None,))[0] != license_bytes:
            raise ValueError('patch must preserve the upstream license')
        if tree_digest(files) != TREE_SHA256:
            raise ValueError('patched vendor tree SHA-256 does not match the reviewed tree')
    dest = root / VENDOR
    no_symlinks(dest)
    no_symlinks(root / LEGAL)
    for existing in dest.rglob('*'):
        if existing.is_file() and existing.relative_to(dest) not in files:
            existing.unlink()
    for path, (content, mode) in files.items():
        target = dest / path
        target.parent.mkdir(parents=True, exist_ok=True)
        if not target.exists() or target.read_bytes() != content:
            target.write_bytes(content)
        if target.stat().st_mode & 0o777 != mode:
            target.chmod(mode)
    (root / LEGAL).write_text(legal, encoding='utf-8')
    print('Imported', len(files), 'verified zlib-ng files with maintained raw CRC patch for', revision)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive', type=Path, required=True)
    parser.add_argument('--revision', required=True)
    parser.add_argument('--sha256', required=True)
    args = parser.parse_args()
    try:
        import_sources(Path(__file__).resolve().parents[2], args.archive, args.revision, args.sha256)
    except (OSError, ValueError, tarfile.TarError) as error:
        parser.exit(1, str(error) + '\n')


if __name__ == '__main__':
    main()
