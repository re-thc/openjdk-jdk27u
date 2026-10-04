#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Update the unmodified StringZilla search headers from an immutable commit."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import urllib.request

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / 'src/hotspot/share/utilities/stringzilla'
LEGAL = ROOT / 'src/java.base/share/legal/stringzilla.md'


def verify():
    manifest = json.loads((VENDOR / 'UPSTREAM.json').read_text())
    for name, digest in manifest['sha256'].items():
        data = (VENDOR / name).read_bytes()
        if hashlib.sha256(data).hexdigest() != digest:
            raise SystemExit('Vendored file differs from upstream: ' + name)
    print('Verified', len(manifest['sha256']), 'unmodified upstream files')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--verify', action='store_true')
    parser.add_argument('--version', help='Release version, e.g. 5.2.0')
    parser.add_argument('--commit', help='Full 40-character upstream commit SHA')
    args = parser.parse_args()
    if args.verify:
        verify()
        return
    if not args.version or not args.commit or not re.fullmatch('[0-9a-f]{40}', args.commit):
        parser.error('--version and a full immutable --commit are required')
    base = 'https://raw.githubusercontent.com/ashvardanian/StringZilla/' + args.commit + '/'
    pending = ['stringzilla/types.h', 'stringzilla/compare.h', 'stringzilla/find.h']
    files = {}
    while pending:
        name = pending.pop()
        if name in files:
            continue
        if '..' in PurePosixPath(name).parts or not name.startswith('stringzilla/'):
            raise SystemExit('Unexpected include: ' + name)
        with urllib.request.urlopen(base + 'include/' + name) as response:
            files[name] = response.read()
        pending.extend(re.findall(r'#include\s+"(stringzilla/[^"\n]+)"', files[name].decode()))
    with urllib.request.urlopen(base + 'LICENSE') as response:
        files['LICENSE'] = response.read()
    # Fetch all dependencies before modifying the checkout.
    old = json.loads((VENDOR / 'UPSTREAM.json').read_text()) if (VENDOR / 'UPSTREAM.json').exists() else {'sha256': {}}
    for name in old['sha256'].keys() - files.keys():
        (VENDOR / name).unlink()
    for name, data in files.items():
        destination = VENDOR / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(data)
    manifest = {'version': args.version, 'commit': args.commit,
                'sha256': {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())}}
    (VENDOR / 'UPSTREAM.json').write_text(json.dumps(manifest, indent=2) + '\n')
    LEGAL.write_text('## StringZilla v' + args.version + '\n\n### Notice\n\n'
                    'Source: https://github.com/ashvardanian/StringZilla/tree/' + args.commit + '\n\n'
                    'Copyright (c) Ash Vardanian and contributors.\n\n### License\n\n```\n'
                    + files['LICENSE'].decode() + '```\n')
    verify()


if __name__ == '__main__':
    main()
