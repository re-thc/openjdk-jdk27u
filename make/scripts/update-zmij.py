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

"""Refresh Żmij from a clean, pinned upstream checkout, retaining its MIT license."""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('upstream', type=Path, help='clean vitaut/zmij checkout with integer formatting')
parser.add_argument('--cxx', default=os.environ.get('CXX', 'c++'),
                    help='host C++ compiler used to verify the metadata bridge')
parser.add_argument('--commit', help='exact 40-hex upstream HEAD to import instead of a release tag')
args = parser.parse_args()
upstream = args.upstream.resolve()
root = Path(__file__).resolve().parents[2]


def git(*argv):
    return subprocess.check_output(['git', '-C', str(upstream), *argv], text=True).strip()


commit = git('rev-parse', 'HEAD')
if args.commit:
    if not re.fullmatch('[0-9a-f]{40}', args.commit) or args.commit != commit:
        raise SystemExit('--commit must match the exact upstream HEAD')
    version = 'main-' + commit[:12]
else:
    version = git('describe', '--tags', '--exact-match', 'HEAD')
    release = re.fullmatch(r'v([0-9]+)\.([0-9]+)(?:\.([0-9]+))?', version)
    if not release or tuple(int(n or 0) for n in release.groups()) < (1, 2, 0):
        raise SystemExit('Use an upstream release tag at least v1.2, or an exact --commit')
if git('status', '--porcelain', '--untracked-files=all', '--', 'zmij.cc', 'zmij-int.cc', 'zmij.h', 'LICENSE'):
    raise SystemExit('The upstream implementation, header and license must be unmodified')
license_text = (upstream / 'LICENSE').read_text()
if not license_text.startswith('MIT License\n'):
    raise SystemExit('Review the changed upstream license before updating')
with tempfile.TemporaryDirectory() as tmp:
    staged = Path(tmp)
    for name in ('zmij.cc', 'zmij-int.cc', 'zmij.h'):
        (staged / name).write_text((upstream / name).read_text())
    for patch in ('java-format.patch', 'clang-compat.patch', 'shortest-only.patch', 'integer-only.patch'):
        subprocess.run(['patch', '--batch', '--forward', '--fuzz=0', '-p1', '-i',
                        str(root / 'make/data/zmij' / patch)], cwd=staged, check=True)
    # Validate the production bridge before changing any installed vendor file.
    subprocess.run([sys.executable, str(root / 'make/scripts/check-zmij-metadata.py'),
                    str(staged), '--cxx', args.cxx], check=True)
    subprocess.run([sys.executable, str(root / 'make/scripts/check-zmij.py'),
                    str(staged), '--cxx', args.cxx], check=True)
    subprocess.run([sys.executable, str(root / 'make/scripts/check-zmij-integer.py'),
                    str(staged), '--cxx', args.cxx], check=True)
    destination = root / 'src/hotspot/share/utilities/zmij'
    destination.mkdir(exist_ok=True)
    shutil.copyfile(staged / 'zmij.cc', destination / 'zmij-impl.hpp')
    shutil.copyfile(staged / 'zmij-int.cc', destination / 'zmij-int-impl.hpp')
    shutil.copyfile(staged / 'zmij.h', destination / 'zmij.h')
(root / 'src/java.base/share/legal/zmij.md').write_text(
    f'## Żmij {version}\n\n### Żmij License\n\n'
    'Żmij is used under its MIT license option.\n\n```\n' + license_text + '```\n')
(root / 'make/data/zmij/version.txt').write_text(f'{version}\n{commit}\n')
print(f'Updated Żmij {version} ({commit}) using the MIT license option.')
