#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
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
