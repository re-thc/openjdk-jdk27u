#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Select a local jtreg at the TEST.ROOT minimum or newer; record actual bytes."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

MINIMUM = (8, 2, 1, 1)


class IncompatibleVersion(ValueError):
    pass


def version_tuple(output):
    match = re.search(r'\bjtreg,?\s+(?:version\s+)?(\d+(?:\.\d+){0,2})'
                      r'(?:-[\w.-]+)?(?:\+(\d+)(?:-[\w.-]+)?)?(?![\w.+-])', output, re.I)
    if not match:
        raise ValueError('Cannot identify jtreg version from: ' + output.strip())
    release = tuple(map(int, match[1].split('.')))
    return release + (0,) * (3 - len(release)) + (int(match[2] or 0),)


def meets_minimum(actual, minimum=MINIMUM):
    # Match jtreg Version.compareTo: compare release numbers first. When they
    # are equal, build zero means unspecified and does not order below +1.
    # The milestone (such as -dev) is not part of that comparison.
    if actual[:3] != minimum[:3]:
        return actual[:3] > minimum[:3]
    return actual[3] == 0 or minimum[3] == 0 or actual[3] >= minimum[3]


def jar_sha(home):
    digest = hashlib.sha256()
    with (Path(home) / 'lib/jtreg.jar').open('rb') as stream:
        for part in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(part)
    return digest.hexdigest()


def read_version(java, jar):
    result = subprocess.run([str(java), '-jar', str(jar), '-version'], text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            timeout=30)
    if result.returncode:
        raise ValueError('jtreg version probe failed: ' + result.stdout.strip())
    return result.stdout.strip()


def inspect_home(home, java, origin='dependencies.json', reader=read_version):
    home = Path(home).expanduser().resolve()
    jar = home / 'lib/jtreg.jar'
    if not jar.is_file():
        raise ValueError('No lib/jtreg.jar under ' + str(home))
    before = jar_sha(home)
    output = reader(java, jar)
    version = version_tuple(output)
    if not meets_minimum(version):
        raise IncompatibleVersion('Requires jtreg satisfying TEST.ROOT 8.2.1+1; found ' + output)
    if before != jar_sha(home):
        raise ValueError('jtreg.jar changed during version inspection')
    return {'home': str(home), 'version': '.'.join(map(str, version[:3])) + '+' + str(version[3]),
            'version_output': output, 'jar_sha256': before, 'origin': origin}


def unchanged(identity):
    if jar_sha(identity['home']) != identity['jar_sha256']:
        raise RuntimeError('jtreg.jar changed during the paired run; stop and keep the separate evidence.')


def select_installed(java, explicit=None, env=None, launcher=None, cached=None,
                     reader=read_version, extra_homes=None):
    env = os.environ if env is None else env
    selected = explicit or env.get('JTREG_HOME') or env.get('JT_HOME')
    if selected:
        # Explicit choices are authoritative: report an error, never silently replace them.
        return inspect_home(selected, java, 'explicit home', reader), []
    launcher = shutil.which('jtreg', path=env.get('PATH', '')) if launcher is None else launcher
    candidates = []
    if launcher:
        for path in (Path(launcher).absolute(), Path(launcher).resolve()):
            candidates.extend([path.parent.parent, path.parent.parent / 'libexec'])
    candidates.extend(map(Path, extra_homes if extra_homes is not None else
                          ['/opt/homebrew/opt/jtreg/libexec', '/usr/local/opt/jtreg/libexec']))
    if cached:
        candidates.append(Path(cached))
    seen, notes = set(), []
    for home in candidates:
        home = home.resolve()
        if home in seen or not (home / 'lib/jtreg.jar').is_file():
            continue
        seen.add(home)
        try:
            return inspect_home(home, java, 'installed discovery', reader), notes
        except IncompatibleVersion as error:
            notes.append(str(home) + ': ' + str(error))
    return None, notes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['select', 'inspect'])
    parser.add_argument('--java', required=True)
    parser.add_argument('--home')
    parser.add_argument('--cached-home')
    parser.add_argument('--origin', default='source fallback')
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.action == 'select':
        identity, notes = select_installed(args.java, explicit=args.home, cached=args.cached_home)
        for note in notes:
            print('Skipped installed harness: ' + note, file=sys.stderr)
        if identity is None:
            print('No compatible installed jtreg found; use the documented source fallback.', file=sys.stderr)
            return 3
    else:
        if not args.home:
            raise ValueError('--home is required for inspect')
        identity = inspect_home(args.home, args.java, args.origin)
    args.output.write_text(json.dumps(identity, indent=2) + '\n')
    print('Selected jtreg: ' + identity['home'] + ' (' + identity['version'] + ')')
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (ValueError, OSError, subprocess.TimeoutExpired) as error:
        print('BLOCKED: ' + str(error), file=sys.stderr)
        sys.exit(2)
