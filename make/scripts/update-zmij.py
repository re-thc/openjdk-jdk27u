#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Refresh Żmij from a clean, tagged upstream release, retaining its MIT license."""
import argparse
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('upstream', type=Path, help='clean vitaut/zmij release checkout')
args = parser.parse_args()
upstream = args.upstream.resolve()
root = Path(__file__).resolve().parents[2]

def git(*argv):
    return subprocess.check_output(['git', '-C', str(upstream), *argv], text=True).strip()

version = git('describe', '--tags', '--exact-match', 'HEAD')
release = re.fullmatch(r'v([0-9]+)\.([0-9]+)(?:\.([0-9]+))?', version)
if not release or tuple(int(n or 0) for n in release.groups()) < (1, 2, 0):
    raise SystemExit('Use an upstream release tag at least v1.2')
commit = git('rev-parse', 'HEAD')
if git('status', '--porcelain', '--untracked-files=all', '--', 'zmij.cc', 'zmij.h', 'LICENSE'):
    raise SystemExit('The upstream implementation, header and license must be unmodified')
license_text = (upstream / 'LICENSE').read_text()
if not license_text.startswith('MIT License\n'):
    raise SystemExit('Review the changed upstream license before updating')
with tempfile.TemporaryDirectory() as tmp:
    staged = Path(tmp)
    for name in ('zmij.cc', 'zmij.h'):
        (staged / name).write_text((upstream / name).read_text())
    subprocess.run(['patch', '--batch', '--forward', '--fuzz=0', '-p1', '-i',
                    str(root / 'make/data/zmij/java-format.patch')], cwd=staged, check=True)
    destination = root / 'src/hotspot/share/utilities/zmij'
    destination.mkdir(exist_ok=True)
    # Include the implementation once, avoiding a second VM translation unit.
    shutil.copyfile(staged / 'zmij.cc', destination / 'zmij-impl.hpp')
    shutil.copyfile(staged / 'zmij.h', destination / 'zmij.h')
(root / 'src/java.base/share/legal/zmij.md').write_text(
    f'## Żmij {version}\n\n### Żmij License\n\n'
    'Żmij is used under its MIT license option.\n\n```\n' + license_text + '```\n')
(root / 'make/data/zmij/version.txt').write_text(f'{version}\n{commit}\n')
print(f'Updated Żmij {version} ({commit}) using the MIT license option.')
