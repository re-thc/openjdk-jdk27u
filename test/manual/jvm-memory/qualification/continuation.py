# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Narrow preparation continuation, never a measurement retry or fresh budget.

The failed baseline-build custody result remains immutable. Reuse certifies the
retained image now, not retrospectively, and requires successful make plus full
terminal cleanup. All correctness and measurements remain to be executed once.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import subprocess
import time

from image_manifest import record, verify

BASE = '89885a6288e7aaabd01678a704a586272c0f96e3'
CANDIDATE = 'f03c433e6846632173209a2d85ca471c6ae6aa22'
ORIGINAL_HARNESS = 'a30e3351ac2e8bb2fc353ce29006ee36ca205b9b'
FAILURE = 'Launcher exited with live descendants; cleaned result remains inconclusive'


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def need(value, message):
    if not value:
        raise RuntimeError(message)


def boot():
    return sha('/proc/sys/kernel/random/boot_id')


def git(directory, *args):
    return subprocess.check_output(['git', '-C', str(directory), *args], text=True, timeout=10).strip()


def original_arguments(argv):
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument('--execute', action='store_true')
    for name in ['output', 'outer-owner-reference', 'boot', 'jtreg', 'gtest', 'jmh', 'asan-runtime']:
        parser.add_argument('--' + name, required=True)
    parser.add_argument('--configure-option', action='append', default=[])
    parser.add_argument('--stop-after', default='all')
    args = vars(parser.parse_args(argv[2:]))
    need(args.pop('execute') and args.pop('stop_after') == 'all', 'Original scope must be all')
    args.pop('output'); args.pop('outer_owner_reference')
    return args


def check_original(previous, owner, release):
    freeze = json.loads((previous / 'freeze.json').read_text())
    rows = json.loads((previous / 'commands.json').read_text())
    decision = json.loads((previous / 'decision.json').read_text())
    outer = json.loads((owner / 'owner.json').read_text())
    terminal = json.loads((owner / 'terminal.json').read_text())
    need(release['commit'] == outer['harness_commit'] == ORIGINAL_HARNESS, 'Wrong original harness')
    need(all(isinstance(release[k], (float, int)) and math.isfinite(release[k])
             for k in ['start_monotonic', 'hard_deadline_monotonic']), 'Invalid original clock')
    need(freeze['baseline'] == BASE and freeze['candidate'] == CANDIDATE, 'Production identities changed')
    need(release['output'] == str(previous) and release['owner_output'] == str(owner), 'Release paths differ')
    need(release['hard_deadline_monotonic'] == release['start_monotonic'] + 36000,
         'Original deadline is not one ten-hour release')
    need(time.monotonic() < release['hard_deadline_monotonic'] - 60, 'Original deadline exhausted')
    need(outer['cleanup']['complete'] and outer['final_child_audit']
         and not outer['cleanup']['remaining'] and not outer['errors'], 'Original outer cleanup uncertain')
    need(outer['status'] == 'INNER_FAILED' and terminal['supervisor_exit'] == 2
         and terminal['accepted'] is False, 'Not the preserved failed preparation')
    need(decision == {'decision': 'HOLD', 'error': "RuntimeError('build-B-release: " + FAILURE + "')"},
         'Only the known baseline ownership failure can continue')
    need(rows and rows[-1]['label'] == 'build-B-release', 'Work continued beyond baseline build')
    build = rows[-1]
    need(build['exit'] == 0 and build['error'] == FAILURE and build['cleanup']['complete']
         and not build['cleanup']['remaining'] and not build['cleanup']['errors'], 'Baseline make not reusable')
    need(all(not row['measured'] for row in rows), 'Cannot continue consumed measurements')
    need(all(row['error'] is None for row in rows[:-1]), 'Earlier failed gate')
    for name in ['samples.json', 'statistics.json', 'coverage.json']:
        p = previous / name
        need(not p.exists() or json.loads(p.read_text()) == [], 'A later stage already ran: ' + name)
    need(not (previous / 'C/build/C-release').exists(), 'Candidate build already started')
    need(git(previous / 'B', 'rev-parse', 'HEAD') == BASE, 'Baseline source HEAD differs')
    need(not git(previous / 'B', 'status', '--porcelain', '--untracked-files=all'), 'Baseline source dirty')
    need(git(previous / 'C', 'rev-parse', 'HEAD') == CANDIDATE, 'Candidate source HEAD differs')
    need(not git(previous / 'C', 'status', '--porcelain', '--untracked-files=all'), 'Candidate source dirty')
    # Only reviewed harness source may change. Standard tools/test inputs and
    # configure-dev remain byte-identical to the original frozen inputs.
    harness = Path(outer['argv'][1]).resolve().parent
    for name, expected in freeze['source_and_input_sha256'].items():
        p = Path(name)
        if p.parent == harness and p.name in {
                'run.py', 'process_cleanup.py', 'supervise.py', 'test_guards.py', 'test_supervisor.py'}:
            continue
        need(sha(p) == expected, 'Original installed input changed: ' + name)
    return freeze, outer, build


def prepare(previous, owner, release_file, destination):
    previous, owner = previous.resolve(strict=True), owner.resolve(strict=True)
    release_file = release_file.resolve(strict=True)
    release = json.loads(release_file.read_text())
    freeze, outer, build = check_original(previous, owner, release)
    destination.mkdir()  # Never replace a trusted witness.
    image = previous / 'B/build/B-release/images/jdk'
    manifest = destination / 'baseline-image.json'
    record(image, manifest)
    verify(image, manifest)
    files = [previous / n for n in ['freeze.json', 'commands.json', 'decision.json']]
    files += [owner / n for n in ['owner.json', 'terminal.json']]
    files += [release_file, manifest, previous / 'B/build/B-release/spec.gmk',
              previous / 'B/build/B-release/configure.log', previous / 'B/build/B-release/build.log']
    proof = {'format': 1, 'kind': 'baseline-preparation-continuation',
             'original_harness': ORIGINAL_HARNESS, 'baseline': BASE, 'candidate': CANDIDATE,
             'previous': str(previous), 'previous_owner': str(owner),
             'release_file': str(release_file), 'release': release,
             'boot_sha256': boot(), 'image': str(image), 'image_manifest': str(manifest),
             'provenance_sha256': {str(p): sha(p) for p in files},
             'arguments': original_arguments(outer['argv']),
             'protocol': {k: freeze[k] for k in ['methods', 'sources', 'tests', 'flags',
                                               'pairs', 'order', 'confidence', 'pause_metric']},
             'release_stage_deadline_monotonic': release['start_monotonic'] + 6600,
             'captured_monotonic': time.monotonic(),
             'image_manifest_scope': 'first full witness captured after terminal cleanup; not a historical build-time hash',
             'original_outcome': 'HOLD preserved; successful make reused as preparation, not a qualification pass',
             'measurements_started': False}
    p = destination / 'continuation.json'
    with p.open('x') as stream:
        json.dump(proof, stream, indent=2, allow_nan=False); stream.write('\n')
    return p


def load(path, expected_sha256):
    path = Path(path).resolve(strict=True)
    need(len(expected_sha256) == 64 and sha(path) == expected_sha256, 'Continuation witness hash differs')
    proof = json.loads(path.read_text())
    need(proof.get('format') == 1 and proof.get('kind') == 'baseline-preparation-continuation', 'Unknown witness')
    need(proof['baseline'] == BASE and proof['candidate'] == CANDIDATE, 'Production identity differs')
    need(proof['original_harness'] == ORIGINAL_HARNESS and proof['measurements_started'] is False,
         'Not a preparation-only witness')
    need(proof['boot_sha256'] == boot(), 'Continuation moved to a different boot/monotonic clock')
    for name, expected in proof['provenance_sha256'].items():
        need(sha(name) == expected, 'Retained provenance changed: ' + name)
    release = json.loads(Path(proof['release_file']).read_text())
    need(release == proof['release'], 'Release changed')
    need(proof['release_stage_deadline_monotonic'] == release['start_monotonic'] + 6600,
         'Release preparation stage budget changed')
    check_original(Path(proof['previous']), Path(proof['previous_owner']), release)
    verify(Path(proof['image']), Path(proof['image_manifest']))
    return proof


def match_arguments(proof, args):
    actual = {k: [str(x) for x in v] if isinstance(v, list) else str(v)
              for k in proof['arguments'] for v in [getattr(args, k)]}
    need(actual == proof['arguments'], 'Continuation changed matched build/test inputs or options')
    need(args.stop_after == 'all', 'Continuation retains all remaining stages')


def claim(path, digest, owner_receipt, argv):
    """Consume the trusted continuation once, atomically, before any inner fork."""
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument('--output', type=Path, required=True)
    args, _ = parser.parse_known_args(argv[2:])
    row = {'format': 1, 'witness_sha256': digest,
           'owner_receipt': str(Path(owner_receipt).resolve()),
           'output': str(args.output.resolve()), 'claimed_monotonic': time.monotonic()}
    with Path(path).with_name('continuation.claim.json').open('x') as stream:
        json.dump(row, stream, indent=2, allow_nan=False); stream.write('\n')
    return row


def verify_claim(path, digest, owner_receipt, output):
    row = json.loads(Path(path).with_name('continuation.claim.json').read_text())
    need(row['format'] == 1 and row['witness_sha256'] == digest
         and row['owner_receipt'] == str(Path(owner_receipt).resolve())
         and row['output'] == str(Path(output).resolve()), 'Continuation claim differs')
    return row


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    p.add_argument('previous', type=Path)
    p.add_argument('owner', type=Path)
    p.add_argument('release', type=Path)
    p.add_argument('destination', type=Path)
    a = p.parse_args()
    witness = prepare(a.previous, a.owner, a.release, a.destination)
    print(json.dumps({'continuation': str(witness), 'sha256': sha(witness)}))
