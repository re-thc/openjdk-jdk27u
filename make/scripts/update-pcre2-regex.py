#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
"""Verify/import the pinned official PCRE2 runtime archive; builds stay offline."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import tarfile
import tempfile

ROOT = Path(__file__).resolve().parents[2]
DEST = ROOT / 'src/hotspot/share/runtime/pcre2regex'
PIN = json.loads((DEST / 'UPSTREAM.json').read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('archive', type=Path, nargs='?', help='official source tar.bz2 (download separately)')
    parser.add_argument('--verify', action='store_true', help='verify every checked-in upstream file')
    args = parser.parse_args()
    if args.verify:
        for name, expected in PIN['files'].items():
            if digest(DEST / 'upstream' / name) != expected:
                raise SystemExit('upstream file changed: ' + name)
        print('Verified', len(PIN['files']), 'pinned PCRE2/SLJIT files')
        return
    if args.archive is None or digest(args.archive) != PIN['sha256']:
        raise SystemExit('provide the exact archive with SHA-256 ' + PIN['sha256'])
    with tempfile.TemporaryDirectory(prefix='jdk-pcre2-import-') as directory:
        extract = Path(directory)
        with tarfile.open(args.archive) as tar:
            tar.extractall(extract, filter='data')
        source = extract / ('pcre2-' + PIN['version'])
        common = re.search(r'COMMON_SOURCES = (.*?)\n\nif WITH_PCRE2_8',
                           (source / 'Makefile.am').read_text(), re.S).group(1)
        files = re.findall(r'src/[A-Za-z0-9_.]+', common) + [
            'src/pcre2_chartables.c.dist', 'src/pcre2.h.generic', 'src/config.h.generic',
            'LICENCE.md', 'COPYING', 'AUTHORS.md']
        staging = extract / 'runtime'
        for name in files:
            target = staging / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source / name, target)
        shutil.copytree(source / 'deps/sljit/sljit_src', staging / 'deps/sljit/sljit_src')
        shutil.copyfile(source / 'deps/sljit/LICENSE', staging / 'deps/sljit/LICENSE')
        for original, generated in [('pcre2.h.generic','pcre2.h'), ('config.h.generic','config.h'),
                                    ('pcre2_chartables.c.dist','pcre2_chartables.c')]:
            shutil.copyfile(staging / 'src' / original, staging / 'src' / generated)
        found = {str(p.relative_to(staging)): digest(p) for p in staging.rglob('*') if p.is_file()}
        if found != PIN['files']:
            raise SystemExit('import differs from the pinned runtime manifest')
        shutil.copytree(staging, DEST / 'upstream', dirs_exist_ok=True)
        notices = '## PCRE2 v' + PIN['version'] + '\n\n' + (source / 'LICENCE.md').read_text()
        notices += '\n## SLJIT\n\n```text\n' + (source / 'deps/sljit/LICENSE').read_text() + '\n```\n'
        (ROOT / 'src/java.base/share/legal/pcre2_regex.md').write_text(notices)
        print('Imported pinned PCRE2', PIN['version'])


if __name__ == '__main__':
    main()
