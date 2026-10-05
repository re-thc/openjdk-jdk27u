#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
#

"""Import an explicitly verified upstream source archive without local edits."""
import argparse
import hashlib
from pathlib import Path
import tarfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--archive', type=Path, required=True)
parser.add_argument('--version', required=True)
parser.add_argument('--sha256', required=True)
args = parser.parse_args()
if hashlib.sha256(args.archive.read_bytes()).hexdigest() != args.sha256:
    parser.error('archive SHA-256 does not match')
root = Path(__file__).resolve().parents[2]
dest = root / 'src/java.base/share/native/libzip/zlib-ng'
files = {}
with tarfile.open(args.archive) as archive:
    for member in archive.getmembers():
        if not member.isfile():
            continue
        try:
            path = Path(member.name).relative_to('zlib-ng-' + args.version)
        except ValueError:
            parser.error('archive path is outside the requested upstream release')
        if '..' in path.parts or path.is_absolute():
            parser.error('unsafe archive path')
        if ((len(path.parts) == 1 and
             (path.suffix in ('.c', '.h', '.in') or path.name in ('configure', 'LICENSE.md')))
                or path.parts[0] == 'arch' or str(path) == 'tools/config.sub'):
            files[path] = (archive.extractfile(member).read(), member.mode & 0o777)
if Path('LICENSE.md') not in files:
    parser.error('missing upstream license')
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
license = files[Path('LICENSE.md')][0].decode()
(root / 'src/java.base/share/legal/zlib-ng.md').write_text(
    '## zlib-ng v' + args.version + '\n\n### zlib License\n<pre>\n\n' + license + '\n</pre>\n')
print('Imported', len(files), 'unmodified upstream files for zlib-ng', args.version)
