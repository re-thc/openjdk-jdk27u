#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Read-only verification of the exact retained builds and terminal evidence."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import stat
import subprocess

DIRECTORY = Path(__file__).resolve().parent


def digest(path):
    value = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            value.update(chunk)
    return value.hexdigest()


def tree_identity(root):
    # Hash all image bytes, names, executable modes and symlink targets. No
    # timestamps, inode numbers, absolute host paths or file data are published.
    entries = [['.', 'dir', stat.S_IMODE(root.stat().st_mode)]]
    for path in sorted(root.rglob('*')):
        mode = path.lstat().st_mode
        name = path.relative_to(root).as_posix()
        if stat.S_ISLNK(mode):
            target = path.readlink().as_posix()
            if path.resolve().is_dir():
                raise ValueError('Directory symlink cannot be inventoried: ' + name)
            entries.append([name, 'link', target, digest(path)])
        elif stat.S_ISREG(mode):
            entries.append([name, 'file', stat.S_IMODE(mode), digest(path)])
        elif stat.S_ISDIR(mode):
            entries.append([name, 'dir', stat.S_IMODE(mode)])
        else:
            raise ValueError('Unexpected image file type: ' + name)
    value = hashlib.sha256(json.dumps(entries, separators=(',', ':')).encode()).hexdigest()
    return dict(sha256=value, entries=len(entries))


def git(tree, *args):
    return subprocess.check_output(['git', '-C', str(tree), *args], text=True).strip()


def verify(previous):
    for name in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'LD_PRELOAD', 'LD_AUDIT'):
        if os.environ.get(name):
            raise ValueError('Clear external instrumentation/options: ' + name)
    binding = json.loads((DIRECTORY / 'retained-builds.json').read_text())
    if git(DIRECTORY, 'rev-parse', 'HEAD') != os.environ['ZIP_REVIEW_COMMIT']:
        raise ValueError('Continuation review HEAD changed')
    subprocess.run(['git', '-C', str(DIRECTORY), 'diff', '--quiet', 'HEAD', '--', '.'], check=True)
    previous = previous.resolve(strict=True)
    for name, expected in binding['provenance_sha256'].items():
        if digest(previous / name) != expected:
            raise ValueError('Retained provenance changed: ' + name)
    status = json.loads((previous / 'supervisor-status.json').read_text())
    if (status['elapsed_seconds'] != binding['prior_elapsed_seconds']
            or status['child_exit'] != 2 or status['remaining_owned_processes']
            or status['error'] is not None):
        raise ValueError('Unexpected prior terminal/cleanup state')
    analysis = json.loads((previous / 'analysis.json').read_text())
    for name, expected in analysis['evidence_sha256'].items():
        if digest(previous / name) != expected:
            raise ValueError('Retained attempt evidence changed: ' + name)
    identities = {}
    for label, commit in binding['source_commits'].items():
        tree = previous / label
        if git(tree, 'rev-parse', 'HEAD') != commit:
            raise ValueError('Retained source HEAD changed: ' + label)
        subprocess.run(['git', '-C', str(tree), 'diff', '--quiet', 'HEAD', '--'], check=True)
        identities[label] = tree_identity(tree / 'build/zip-qual/images/jdk')
        if identities[label] != binding['images'][label]:
            raise ValueError('Retained packaged image changed: ' + label)
    for path, expected in binding['shared_source_blobs'].items():
        if git(DIRECTORY, 'rev-parse', 'HEAD:' + path) != expected:
            raise ValueError('Continuation changed measured source: ' + path)
    boot = Path(os.environ['BOOT_JDK'])
    for name, expected in binding['tools']['boot_files'].items():
        if digest(boot / name) != expected:
            raise ValueError('Boot JDK changed: ' + name)
    if tree_identity(Path(os.environ['JTREG_HOME']) / 'lib') != binding['tools']['jtreg_lib']:
        raise ValueError('Installed jtreg libraries changed')
    for tool in ('gcc', 'g++'):
        version = subprocess.check_output([tool, '--version'], text=True).splitlines()[0]
        if version != binding['tools'][tool]:
            raise ValueError('Diagnostic compiler version changed: ' + tool)
    if (previous / 'results/timing').exists() or (previous / 'workload.jar').exists():
        raise ValueError('Prior allocation/timing phase unexpectedly started')
    if (previous / 'candidate/build/zip-qual/test-results').exists():
        raise ValueError('Prior candidate correctness phase unexpectedly started')
    if any((previous / f'results/{label}-{gc}-tests.log').exists()
           for label in ('base', 'candidate') for gc in ('G1', 'Z')):
        raise ValueError('Prior later collector group unexpectedly started')
    baseline = (previous / 'results/base-Serial-tests.log').read_text()
    if baseline.count('\nPassed: ') != 6 or 'TEST SUCCESS' not in baseline:
        raise ValueError('Prior baseline Serial controls were not complete')
    return dict(source_commits=binding['source_commits'], images=identities,
                prior_elapsed_seconds=binding['prior_elapsed_seconds'],
                remaining_work_seconds=14400 - binding['prior_elapsed_seconds'],
                retained_evidence_files=len(analysis['evidence_sha256']),
                baseline_serial_controls_reused=6)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('previous', type=Path)
    args = parser.parse_args()
    print(json.dumps(verify(args.previous), indent=2))
