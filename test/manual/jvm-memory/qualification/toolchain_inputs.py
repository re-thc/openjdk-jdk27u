# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Prospective byte custody for a new matched pair, never retroactive proof."""
from pathlib import Path
from image_manifest import catalog


def capture(boot, roots, check):
    if not roots:
        raise RuntimeError('Matched rebuild requires declared native compiler/linker input roots')
    native = {str(Path(p).resolve(strict=True)): catalog(Path(p), check, require_jdk=False)
              for p in roots}
    programs = set()
    for root, tree in native.items():
        for name in tree['entries']:
            p = Path(root) / name
            if p.name in {'gcc-16', 'g++-16', 'cc1', 'cc1plus', 'mold'} and p.is_file():
                check()
                with p.open('rb') as stream:
                    if stream.read(4) == b'\x7fELF': programs.add(p.name)
    if not {'gcc-16', 'g++-16', 'cc1', 'cc1plus', 'mold'} <= programs:
        raise RuntimeError('Native roots must include actual ELF GCC/G++, cc1/cc1plus and mold, not wrappers/docs alone')
    return {'format': 1, 'scope': 'captured before both new builds; no original baseline claim',
            'boot': str(Path(boot).resolve(strict=True)), 'boot_catalog': catalog(Path(boot), check),
            'native_roots': native}


def verify(expected, check):
    actual = capture(Path(expected['boot']), list(expected['native_roots']), check)
    if actual != expected:
        raise RuntimeError('Boot modules/native compiler inputs changed across the matched builds')


def covers(expected, filename):
    path = Path(filename).resolve(strict=True)
    return any(path.is_relative_to(Path(root)) for root in expected['native_roots'])
