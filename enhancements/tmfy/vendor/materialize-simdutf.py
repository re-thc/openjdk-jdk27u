#!/usr/bin/env python3
"""Materialize checksum-pinned simdutf into an ignored build cache.

Only --fetch permits network access. No arguments reuses the archive cache
without network access. --check reproduces and compares without changing output
or the archive cache. Upstream source trees are temporary, never checked in.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
import tempfile
import urllib.request

HERE = Path(__file__).resolve().parent
REPOSITORY = HERE.parents[2]
BUILD_CACHE = REPOSITORY / 'build/tmfy-deps'
OUTPUT_FILES = ('simdutf.cpp', 'simdutf.h', 'LICENSE-APACHE', 'LICENSE-MIT')
RECEIPT = 'dependency-receipt.json'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def write_if_changed(path, data):
    """Atomically publish changed bytes, preserving unchanged timestamps."""
    if path.is_file() and path.read_bytes() == data:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(dir=path.parent, delete=False) as output:
        temporary = Path(output.name)
        output.write(data)
    try:
        os.replace(temporary, path)
    finally:
        temporary.unlink(missing_ok=True)


def build_location(path, parser):
    path = path.resolve()
    if path.is_relative_to(REPOSITORY) and not path.is_relative_to(REPOSITORY / 'build'):
        parser.error('dependency caches inside the checkout must be under ignored build/')
    return path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('archive', nargs='?', type=Path)
    parser.add_argument('--archive', dest='explicit_archive', type=Path)
    parser.add_argument('--fetch', action='store_true')
    parser.add_argument('--output', type=Path, default=BUILD_CACHE / 'simdutf')
    parser.add_argument('--cache-dir', '--cache', dest='cache_dir', type=Path,
                        default=BUILD_CACHE / 'downloads')
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    if args.archive is not None and args.explicit_archive is not None:
        parser.error('provide either positional archive or --archive, not both')
    args.archive = args.archive or args.explicit_archive
    if args.archive is not None and args.fetch:
        parser.error('provide an archive path or --fetch, not both')
    args.output = build_location(args.output, parser)
    args.cache_dir = build_location(args.cache_dir, parser)

    lock_bytes = (HERE / 'vendor-lock.json').read_bytes()
    lock = json.loads(lock_bytes)
    component, = (item for item in lock['components'] if item['name'] == 'simdutf')
    features = component['amalgamation_features']
    if features != ['UTF8', 'UTF16', 'LATIN1']:
        raise SystemExit('review required: unexpected simdutf feature selection')
    version = component['version']
    cache_archive = args.cache_dir / ('simdutf-v' + version + '.tar.gz')
    # Fail closed even if --fetch or an explicit archive was supplied.
    if cache_archive.exists() and digest(cache_archive.read_bytes()) != component['sha256']:
        raise SystemExit('simdutf cached source archive hash mismatch: ' + str(cache_archive))

    with tempfile.TemporaryDirectory(prefix='tmfy-simdutf-') as directory:
        temporary = Path(directory)
        archive_path = args.archive or cache_archive
        if args.fetch and not archive_path.is_file():
            archive_path = temporary / 'source.tar.gz'
            request = urllib.request.Request(component['source'],
                                             headers={'User-Agent': 'tmfy-vendor-materializer'})
            with urllib.request.urlopen(request, timeout=120) as source, archive_path.open('wb') as target:
                shutil.copyfileobj(source, target)
        if not archive_path.is_file():
            raise SystemExit('simdutf archive is not cached; use --fetch once or supply the pinned archive')
        archive_bytes = archive_path.read_bytes()
        if digest(archive_bytes) != component['sha256']:
            raise SystemExit('simdutf source archive hash mismatch: ' + str(archive_path))
        with tarfile.open(archive_path) as archive:
            archive.extractall(temporary, filter='data')
        upstream = temporary / ('simdutf-' + version)
        generated = temporary / 'generated'
        # Ignore upstream environment overrides for source/include/output paths.
        environment = {key: value for key, value in os.environ.items()
                       if not key.startswith('AMALGAMATE_')}
        process = subprocess.run(
            [sys.executable, str(upstream / 'singleheader/amalgamate.py'),
             '--with-utf8', '--with-utf16', '--with-latin1', '--no-zip', '--no-readme',
             '--output-dir', str(generated)], env=environment,
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
        if process.returncode:
            sys.stderr.buffer.write(process.stdout + process.stderr)
            raise SystemExit('simdutf amalgamation failed')
        header = ('/* simdutf ' + version + '; ' + ', '.join(features) +
                  '; generated from the checksum-pinned official archive. */\n').encode('ascii')
        output = {}
        for name in OUTPUT_FILES:
            if name.startswith('simdutf.'):
                # Upstream writes text files with platform-native newlines.
                # Normalize those before applying the platform-independent pin.
                generated_bytes = (generated / name).read_bytes().replace(b'\r\n', b'\n')
                first, separator, body = generated_bytes.partition(b'\n')
                if not separator or not first.startswith(b'/* auto-generated on '):
                    raise SystemExit('unexpected amalgamation provenance header: ' + name)
                output[name] = header + body
            else:
                output[name] = (upstream / name).read_bytes()
            if digest(output[name]) != component['generated_sha256'][name]:
                raise SystemExit('simdutf generated file hash mismatch: ' + name)
        receipt = dict(component)
        receipt['vendor_lock_sha256'] = digest(lock_bytes)
        output[RECEIPT] = (json.dumps(receipt, indent=2, sort_keys=True) + '\n').encode('utf-8')
        if args.check:
            if not args.output.is_dir() or {path.name for path in args.output.iterdir()} != set(output):
                raise SystemExit('simdutf output file set mismatch: ' + str(args.output))
            for name, data in output.items():
                path = args.output / name
                if not path.is_file() or path.read_bytes() != data:
                    raise SystemExit('simdutf output mismatch: ' + str(path))
            print('Verified simdutf ' + version + ' dependency: ' + str(args.output))
        else:
            # Verify all generated hashes before publishing. No extracted source
            # tree, C API header, demo, or other upstream output is retained.
            if args.output.exists() and any(path.name not in output for path in args.output.iterdir()):
                raise SystemExit('unexpected files in simdutf output directory: ' + str(args.output))
            write_if_changed(cache_archive, archive_bytes)
            for name, data in output.items():
                write_if_changed(args.output / name, data)
            print('Materialized simdutf ' + version + ' dependency: ' + str(args.output))


if __name__ == '__main__':
    main()
