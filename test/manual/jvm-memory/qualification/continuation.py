# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Narrow preparation continuation, never a measurement retry or fresh budget.

The failed baseline-build result remains immutable. Original boot modules and
native compiler bytes were not recorded: retained-baseline reuse is forbidden.
Only explicit new matched builds may continue, under the fixed original UTC cap.
"""
import argparse
from contextlib import contextmanager
import hashlib
import json
import math
from pathlib import Path
import subprocess
import time

from deadline import UTC_CUTOFF, ORIGINAL_UTC_CUTOFF, utc
from process_cleanup import ChildScope, LinuxProcesses, cleanup_errors, enable_subreaper, require_no_children

BASE = '89885a6288e7aaabd01678a704a586272c0f96e3'
CANDIDATE = 'f03c433e6846632173209a2d85ca471c6ae6aa22'
ORIGINAL_HARNESS = 'a30e3351ac2e8bb2fc353ce29006ee36ca205b9b'
FAILURE = 'Launcher exited with live descendants; cleaned result remains inconclusive'
_check = lambda: None
_records = None
_limit = None


@contextmanager
def verification(check, records=None, deadline=None):
    global _check, _records, _limit
    previous = _check, _records, _limit
    _check, _records, _limit = check, records, deadline
    try:
        check()
        yield
    finally:
        _check, _records, _limit = previous


def sha(path):
    _check()
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while block := stream.read(1024 * 1024):
            _check()
            digest.update(block)
    _check()
    return digest.hexdigest()


def need(value, message):
    if not value:
        raise RuntimeError(message)


def git(directory, *args):
    _check()
    backend = LinuxProcesses(); backend.verify_support(); enable_subreaper(); require_no_children(backend)
    scope = ChildScope(backend)
    end = min(time.monotonic() + 10, _limit if _limit is not None else float('inf'))
    proc = None
    failure = None
    try:
        proc = subprocess.Popen(['git', '-C', str(directory), *args], text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
        while True:
            _check()
            need(time.monotonic() < end - 2, 'Git verification deadline')
            try:
                stdout, stderr = proc.communicate(timeout=.05)
                break
            except subprocess.TimeoutExpired:
                continue
        need(proc.returncode == 0 and len(stdout) + len(stderr) < 1024**2,
             'Git verification failed or exceeded output cap')
        return stdout.strip()
    except BaseException as exc:
        failure = exc
        raise
    finally:
        receipt = scope.close(proc, end)
        if _records is not None:
            _records.append({'argv': ['git', '-C', str(directory), *args], 'cleanup': receipt})
        if proc is not None:
            proc.stdout.close(); proc.stderr.close()
        errors = cleanup_errors(receipt) if failure is None else receipt['errors']
        need(receipt['complete'] and not errors, 'Git verification cleanup failed: ' + repr(receipt))


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
    original_utc = utc(release['hard_deadline_utc'])
    need(UTC_CUTOFF <= original_utc < UTC_CUTOFF + 1
         and abs(original_utc - utc(release['released_at_utc']) - 36000) < .001,
         'Original UTC evidence differs from the fixed approved cutoff')
    need(time.time() < UTC_CUTOFF - 60, 'Original fixed UTC deadline exhausted')
    need(outer['cleanup']['complete'] and outer['final_child_audit']
         and not outer['cleanup']['remaining'] and not outer['errors'], 'Original outer cleanup uncertain')
    need(outer['status'] == 'INNER_FAILED' and terminal['supervisor_exit'] == 2
         and terminal['accepted'] is False, 'Not the preserved failed preparation')
    need(decision == {'decision': 'HOLD', 'error': "RuntimeError('build-B-release: " + FAILURE + "')"},
         'Only the known baseline ownership failure can continue')
    need(rows and rows[-1]['label'] == 'build-B-release', 'Work continued beyond baseline build')
    build = rows[-1]
    need(build['exit'] == 0 and build['error'] == FAILURE and build['cleanup']['complete']
         and not build['cleanup']['remaining'] and not build['cleanup']['errors'], 'Original preparation receipt invalid')
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


def load(path, expected_sha256, matched_rebuild=False, check=lambda: None, records=None, deadline=None):
    with verification(check, records, deadline):
        return _load(path, expected_sha256, matched_rebuild)


def _load(path, expected_sha256, matched_rebuild):
    need(matched_rebuild, 'Retained baseline lacks original boot modules/native compiler hashes; matched rebuild required')
    path = Path(path).resolve(strict=True)
    need(len(expected_sha256) == 64 and sha(path) == expected_sha256, 'Continuation witness hash differs')
    proof = json.loads(path.read_text())
    need(proof.get('format') in (1, 2) and proof.get('kind') == 'baseline-preparation-continuation', 'Unknown witness')
    need(proof['baseline'] == BASE and proof['candidate'] == CANDIDATE, 'Production identity differs')
    need(proof['original_harness'] == ORIGINAL_HARNESS and proof['measurements_started'] is False,
         'Not a preparation-only witness')
    # Capture-time boot hashes cannot prove which boot ran the original build.
    # Historical monotonic values remain provenance only, never timer authority.
    for name, expected in proof['provenance_sha256'].items():
        need(sha(name) == expected, 'Retained provenance changed: ' + name)
    release = json.loads(Path(proof['release_file']).read_text())
    need(release == proof['release'], 'Release changed')
    need(proof['release_stage_deadline_monotonic'] == release['start_monotonic'] + 6600,
         'Release preparation stage budget changed')
    check_original(Path(proof['previous']), Path(proof['previous_owner']), release)
    proof['reuse_baseline'] = False
    proof['clock_policy'] = 'fixed original UTC; original boot identity not recorded'
    proof['fixed_utc_cutoff'] = ORIGINAL_UTC_CUTOFF
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
    raise SystemExit('No new witness can recover missing original compiler/boot-module hashes. '
                     'Use the reviewed supervised --matched-rebuild continuation; do not reuse the baseline.')
