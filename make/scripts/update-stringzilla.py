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
"""Update pinned StringZilla headers and apply tracked local patches."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import subprocess
import tempfile
import urllib.request

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / 'src/java.base/share/native/libjava/stringzilla'
LEGAL = ROOT / 'src/java.base/share/legal/stringzilla.md'


def verify():
    manifest = json.loads((VENDOR / 'UPSTREAM.json').read_text())
    patched = manifest.get('patched_sha256', {})
    for name, digest in manifest['sha256'].items():
        data = (VENDOR / name).read_bytes()
        if hashlib.sha256(data).hexdigest() != patched.get(name, digest):
            raise SystemExit('Vendored file differs from manifest: ' + name)
    for name, digest in manifest.get('patches', {}).items():
        if hashlib.sha256((VENDOR / name).read_bytes()).hexdigest() != digest:
            raise SystemExit('Local patch differs from manifest: ' + name)
    print('Verified', len(manifest['sha256']), 'upstream files;', len(patched), 'locally patched')


def apply_patches(files, patches):
    with tempfile.TemporaryDirectory(prefix='stringzilla-') as directory:
        stage = Path(directory)
        for name, data in files.items():
            destination = stage / name
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(data)
        for name, digest in patches.items():
            data = (VENDOR / name).read_bytes()
            if hashlib.sha256(data).hexdigest() != digest:
                raise SystemExit('Local patch differs from manifest: ' + name)
            result = subprocess.run(['patch', '--batch', '--forward', '--fuzz=0', '-p1', '-d', directory],
                                    input=data, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            if result.returncode:
                raise SystemExit('Review local patch against new upstream: ' + name + '\n'
                                 + result.stdout.decode())
        return {name: (stage / name).read_bytes() for name in files}


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
    # Fetch dependencies and apply patches before modifying the checkout.
    old = json.loads((VENDOR / 'UPSTREAM.json').read_text()) if (VENDOR / 'UPSTREAM.json').exists() else {'sha256': {}}
    upstream_hashes = {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())}
    patches = old.get('patches', {})
    files = apply_patches(files, patches)
    patched_hashes = {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())
                      if hashlib.sha256(data).hexdigest() != upstream_hashes[name]}
    for name in old['sha256'].keys() - files.keys():
        (VENDOR / name).unlink()
    for name, data in files.items():
        destination = VENDOR / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(data)
    manifest = {'version': args.version, 'commit': args.commit,
                'sha256': upstream_hashes, 'patches': patches, 'patched_sha256': patched_hashes}
    (VENDOR / 'UPSTREAM.json').write_text(json.dumps(manifest, indent=2) + '\n')
    LEGAL.write_text('## StringZilla v' + args.version + '\n\n### Notice\n\n'
                    'Source: https://github.com/ashvardanian/StringZilla/tree/' + args.commit + '\n\n'
                    'Copyright (c) Ash Vardanian and contributors.\n\n### License\n\n```\n'
                    + files['LICENSE'].decode() + '```\n')
    verify()


if __name__ == '__main__':
    main()
