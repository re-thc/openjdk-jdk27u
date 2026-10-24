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

"""Verify exact integer stores through the production bridge against to_chars."""
import argparse
from pathlib import Path
import shlex
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('source', type=Path, help='staged zmij-int.cc and zmij.h')
parser.add_argument('--cxx', default='c++')
args = parser.parse_args()
root = Path(__file__).resolve().parents[2]
target = subprocess.check_output(shlex.split(args.cxx) + ['-dumpmachine'], text=True)
profiles = {
    'native': [],
    'scalar': ['-DZMIJ_USE_SIMD=0'],
    'no-int128': ['-DZMIJ_USE_INT128=0'],
}
if 'x86_64' in target or 'i686' in target:
    profiles['sse41'] = ['-msse4.1', '-DZMIJ_USE_AVX2=0', '-DZMIJ_USE_FMA=0']
    profiles['sse41-no-int128'] = profiles['sse41'] + ['-DZMIJ_USE_INT128=0']
with tempfile.TemporaryDirectory() as temporary:
    for name, flags in profiles.items():
        executable = Path(temporary) / name
        subprocess.run(shlex.split(args.cxx) + ['-std=c++17', '-O2',
                       '-fsanitize=address,undefined', '-fno-sanitize-recover=all',
                       '-DZMIJ_HOTSPOT_INTEGER_ONLY=1',
                       '-I' + str(args.source.resolve()),
                       '-I' + str(root / 'src/hotspot/share'), *flags,
                       str(root / 'make/data/zmij/verify-integer.cpp'), '-o', str(executable)], check=True)
        result = subprocess.check_output([str(executable)], text=True)
        print(name + ': ' + result.strip())
