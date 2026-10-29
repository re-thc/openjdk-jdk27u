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

"""Offline maintenance checks; pass the pinned upstream archive as --archive."""
import argparse
import contextlib
import difflib
import hashlib
import importlib.util
import io
from pathlib import Path
import tarfile
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[3]
spec = importlib.util.spec_from_file_location('update_zlib_ng', ROOT / 'make/scripts/update-zlib-ng.py')
importer = importlib.util.module_from_spec(spec)
spec.loader.exec_module(importer)
ARCHIVE = None


def snapshot(path, git_modes=False):
    return {str(p.relative_to(path)): (p.read_bytes(), (0o755 if p.stat().st_mode & 0o111 else 0o644)
                                    if git_modes else p.stat().st_mode & 0o777)
            for p in path.rglob('*') if p.is_file()}


class ImportTest(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix='test-zlib-ng-import-')
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        for rel in (importer.PATCH, importer.LEGAL):
            target = self.root / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes((ROOT / rel).read_bytes())
        self.dest = self.root / importer.VENDOR
        self.dest.mkdir(parents=True)
        (self.dest / 'sentinel.c').write_text('must survive failed imports\n')
        (self.dest / 'sentinel.c').chmod(0o755)

    def run_import(self, archive=None, revision=None, sha256=None):
        with contextlib.redirect_stdout(io.StringIO()):
            importer.import_sources(self.root, archive or ARCHIVE,
                                    revision or importer.REVISION,
                                    sha256 or importer.ARCHIVE_SHA256)

    def fails_without_writes(self, message, **kwargs):
        before = snapshot(self.root)
        with self.assertRaisesRegex((ValueError, OSError), message):
            self.run_import(**kwargs)
        self.assertEqual(before, snapshot(self.root))

    def synthetic_archive(self, members):
        target = self.root / 'input.tar'
        with tarfile.open(target, 'w') as archive:
            for member, data in members:
                archive.addfile(member, io.BytesIO(data) if data is not None else None)
        return target, hashlib.sha256(target.read_bytes()).hexdigest()

    def test_regeneration_and_idempotence(self):
        # Inherited git repository/index variables must not redirect patch replay.
        index = self.root / 'do-not-touch-index'
        index.write_bytes(b'untouched')
        with patch.dict('os.environ', {'GIT_DIR': str(self.root / 'no-repository'),
                                      'GIT_INDEX_FILE': str(index)}):
            self.run_import()
        self.assertEqual(index.read_bytes(), b'untouched')
        self.assertEqual(snapshot(ROOT / importer.VENDOR, True), snapshot(self.dest, True))
        for name in ('crc32_raw.h', 'arch/x86/crc32_raw_fold_tpl.h', 'test/raw_crc32.c'):
            self.assertTrue((self.dest / name).is_file())
        self.assertTrue((self.dest / 'configure').stat().st_mode & 0o111)
        with tarfile.open(ARCHIVE) as archive:
            license_bytes = archive.extractfile('zlib-ng-' + importer.REVISION + '/LICENSE.md').read()
        self.assertEqual((self.dest / 'LICENSE.md').read_bytes(), license_bytes)
        self.assertIn(license_bytes, (self.root / importer.LEGAL).read_bytes())
        self.assertIn(b'Locally modified', (self.root / importer.LEGAL).read_bytes())
        before = snapshot(self.root)
        self.run_import()
        self.assertEqual(before, snapshot(self.root))

    def test_unreviewed_revision(self):
        self.fails_without_writes('explicit raw CRC patch rebase', revision='1' * 40)

    def test_wrong_requested_hash(self):
        self.fails_without_writes('archive SHA-256', sha256='0' * 64)

    def test_changed_archive_even_with_matching_requested_hash(self):
        target = self.root / 'changed.tar.gz'
        target.write_bytes(ARCHIVE.read_bytes() + b'changed')
        self.fails_without_writes('archive SHA-256', archive=target,
                                 sha256=hashlib.sha256(target.read_bytes()).hexdigest())

    def test_missing_patch(self):
        (self.root / importer.PATCH).unlink()
        self.fails_without_writes('raw-crc32.patch')

    def test_changed_patch(self):
        with (self.root / importer.PATCH).open('ab') as stream:
            stream.write(b'changed')
        self.fails_without_writes('patch SHA-256')

    def test_next_update_context_drift(self):
        # Simulate a maintainer deliberately updating both upstream pins.
        revision = '1' * 40
        members = []
        with tarfile.open(ARCHIVE) as archive:
            for member in archive:
                member.name = member.name.replace(importer.REVISION, revision)
                data = archive.extractfile(member).read() if member.isfile() else None
                if member.name.endswith('/arch/x86/crc32_pclmulqdq.c'):
                    self.assertIn(b'#ifdef X86_PCLMULQDQ_CRC', data)
                    data = data.replace(b'#ifdef X86_PCLMULQDQ_CRC', b'#if 0 /* upstream drift */')
                    member.size = len(data)
                members.append((member, data))
        target, digest = self.synthetic_archive(members)
        with patch.object(importer, 'REVISION', revision), patch.object(importer, 'ARCHIVE_SHA256', digest):
            self.fails_without_writes('patch replay failed', archive=target)

    def test_missing_probe_is_not_silently_accepted(self):
        target = self.root / importer.PATCH
        sections = target.read_bytes().split(b'diff --git ')
        target.write_bytes(b'diff --git '.join(s for s in sections if not s.startswith(b'a/test/raw_crc32.c ')))
        with patch.object(importer, 'PATCH_SHA256', hashlib.sha256(target.read_bytes()).hexdigest()):
            self.fails_without_writes('patched vendor tree SHA-256')

    def test_unsafe_duplicate_and_link_entries(self):
        prefix = 'zlib-ng-' + importer.REVISION + '/'
        for names, link in ((['../outside.c'], False), ([prefix + '../outside.c'], False),
                            (['/outside.c'], False), ([prefix + r'arch\..\..\outside.c'], False),
                            ([prefix + 'C:/outside.c'], False), ([prefix + r'C:\outside.c'], False),
                            ([prefix + 'repeat.c'] * 2, False), ([prefix + 'link.c'], True)):
            with self.subTest(names=names):
                members = []
                for name in names:
                    member = tarfile.TarInfo(name)
                    data = b'example'
                    member.size = len(data)
                    if link:
                        member.type = tarfile.SYMTYPE
                        member.linkname = '/outside'
                        data = None
                    members.append((member, data))
                target, digest = self.synthetic_archive(members)
                with patch.object(importer, 'ARCHIVE_SHA256', digest):
                    self.fails_without_writes('archive (path|entry)', archive=target)

    def test_missing_license(self):
        member = tarfile.TarInfo('zlib-ng-' + importer.REVISION + '/inflate.c')
        member.size = 1
        target, digest = self.synthetic_archive([(member, b'x')])
        with patch.object(importer, 'ARCHIVE_SHA256', digest):
            self.fails_without_writes('missing upstream license', archive=target)

    def test_patch_cannot_change_upstream_license(self):
        target = self.root / importer.PATCH
        original = (ROOT / importer.VENDOR / 'LICENSE.md').read_text().splitlines(keepends=True)
        changed = ['Changed license text\n', *original[1:]]
        delta = ''.join(difflib.unified_diff(original, changed, 'a/LICENSE.md', 'b/LICENSE.md'))
        with target.open('ab') as stream:
            stream.write(b'\ndiff --git a/LICENSE.md b/LICENSE.md\n' + delta.encode())
        with patch.object(importer, 'PATCH_SHA256', hashlib.sha256(target.read_bytes()).hexdigest()):
            self.fails_without_writes('preserve the upstream license')

    def test_destination_symlinks(self):
        outside = self.root / 'outside'
        outside.mkdir()
        (outside / 'keep').write_bytes(b'untouched')
        for target in (self.dest / 'link', self.root / importer.LEGAL):
            with self.subTest(target=target):
                saved = target.read_bytes() if target.is_file() else None
                if saved is not None:
                    target.unlink()
                target.symlink_to(outside)
                self.fails_without_writes('destination contains a symlink')
                target.unlink()
                if saved is not None:
                    target.write_bytes(saved)
        self.assertEqual((outside / 'keep').read_bytes(), b'untouched')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive', type=Path, required=True)
    args, remaining = parser.parse_known_args()
    ARCHIVE = args.archive.resolve()
    unittest.main(argv=[__file__, *remaining])
