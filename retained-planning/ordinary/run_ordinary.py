#!/usr/bin/env python3
"""Manifest-gated, exact-once serial supervisor for ordinary routing checks.

No command or image defaults are supplied here. The future frozen manifest is
the sole source of argv, environment, and working directories. This module is
not a launcher until a distinct authority and ready-review bind that manifest
and every frozen evidence file.
"""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
SCHEMA = 'pr57-ordinary-prepared-v1'
ORDER = (
    ('native-guard-EU', 'native_guard'),
    ('Eactivation', 'jvm'),
    ('Uactivation', 'jvm'),
    ('Einterpreted', 'jvm'),
    ('Uc1', 'jvm'),
    ('UdisableIntrinsic', 'jvm'),
    ('UUseAVX2', 'jvm'),
    ('Estress', 'jvm'),
    ('Ustress', 'jvm'),
)
BUDGET = {
    'slots': 9, 'per_slot_seconds': 60, 'global_seconds': 300,
    'cleanup_seconds': 5, 'explicit_GC': 0, 'planned_sorts_max': 30000,
}
LOG_LIMIT = 8 * 1024 * 1024
POLL_SECONDS = 0.05
CLEANUP_TOTAL_SECONDS = 5.0
TERM_GRACE_SECONDS = 3.0
KILL_GRACE_SECONDS = 2.0
monotonic = time.monotonic
sleep = time.sleep


def sha(path: str | Path) -> str:
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def valid_sha(value: object) -> bool:
    return isinstance(value, str) and len(value) == 64 and all(c in '0123456789abcdef' for c in value)


def canonical_sha(value: object) -> str:
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def atomic_json(path: Path, value: object) -> None:
    tmp = path.with_name(path.name + '.tmp')
    fd = os.open(tmp, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        with os.fdopen(fd, 'w', encoding='utf-8') as f:
            json.dump(value, f, indent=2, sort_keys=True)
            f.write('\n')
            f.flush()
            os.fsync(f.fileno())
        os.replace(tmp, path)
        dfd = os.open(path.parent, os.O_RDONLY | getattr(os, 'O_DIRECTORY', 0))
        try:
            os.fsync(dfd)
        finally:
            os.close(dfd)
    except BaseException:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass
        raise


def load_json(path: str | Path) -> dict:
    with Path(path).open(encoding='utf-8') as f:
        value = json.load(f)
    if not isinstance(value, dict):
        raise ValueError(f'expected JSON object: {path}')
    return value


def validate_preparation(prepared_path: Path, authority_path: Path, review_path: Path) -> tuple[dict, Path]:
    prepared_path = prepared_path.resolve(strict=True)
    authority_path = authority_path.resolve(strict=True)
    review_path = review_path.resolve(strict=True)
    p = load_json(prepared_path)
    if p.get('schema') != SCHEMA or p.get('execution_authorized') is not False:
        raise ValueError('prepared schema must remain explicitly unauthorized; separate authority gates execution')
    if p.get('budget') != BUDGET:
        raise ValueError('ordinary-run budget differs from the frozen limits')
    planned_sorts = p.get('planned_sorts')
    if not isinstance(planned_sorts, int) or isinstance(planned_sorts, bool) or not 0 <= planned_sorts <= BUDGET['planned_sorts_max']:
        raise ValueError('planned_sorts must be an integer within the 30,000-sort cap')
    slots = p.get('slots')
    if not isinstance(slots, list) or len(slots) != len(ORDER):
        raise ValueError('prepared manifest must contain exactly nine slots')
    for i, (slot, expected) in enumerate(zip(slots, ORDER)):
        if not isinstance(slot, dict) or (slot.get('name'), slot.get('kind')) != expected:
            raise ValueError(f'wrong slot order or kind at slot {i}')
        if slot.get('seconds') != BUDGET['per_slot_seconds']:
            raise ValueError(f'wrong timeout at slot {i}')
        argv = slot.get('argv')
        env = slot.get('env')
        cwd = slot.get('cwd')
        if (not isinstance(argv, list) or not argv or
                any(not isinstance(x, str) or not x for x in argv)):
            raise ValueError(f'missing exact argv for slot {i}')
        if not isinstance(env, dict) or any(not isinstance(k, str) or not isinstance(v, str) for k, v in env.items()):
            raise ValueError(f'missing exact environment for slot {i}')
        if not isinstance(cwd, str) or not Path(cwd).is_absolute() or not Path(cwd).is_dir():
            raise ValueError(f'invalid working directory for slot {i}')
        for arg in argv:
            if '{' in arg or '}' in arg:
                if arg.count('{slot_dir}') != 1 or arg.replace('{slot_dir}', '').find('{') >= 0 or arg.replace('{slot_dir}', '').find('}') >= 0:
                    raise ValueError(f'unsupported command placeholder in slot {i}: {arg}')

    output = p.get('output_directory')
    if not isinstance(output, str) or not Path(output).is_absolute():
        raise ValueError('output_directory must be an absolute path')
    output = Path(output)
    if output.exists():
        raise FileExistsError(f'collection output already exists: {output}')

    files = p.get('file_hashes')
    if not isinstance(files, dict) or not files:
        raise ValueError('missing complete frozen file_hashes map')
    canonical_files = {}
    for raw, expected in files.items():
        path = Path(raw)
        if not path.is_absolute() or not valid_sha(expected) or not path.is_file() or sha(path) != expected:
            raise ValueError(f'frozen input missing or changed: {raw}')
        canonical_files[str(path.resolve())] = expected
    if canonical_sha(canonical_files) != canonical_sha(files):
        raise ValueError('file_hashes paths must be canonical absolute paths')

    evidence = p.get('evidence')
    required_evidence = {'source', 'images', 'fixture', 'binary_stack_review'}
    if not isinstance(evidence, dict) or not required_evidence.issubset(evidence):
        raise ValueError(f'evidence must name {sorted(required_evidence)}')
    for label in required_evidence:
        entries = evidence[label] if isinstance(evidence[label], list) else [evidence[label]]
        if not entries:
            raise ValueError(f'empty evidence binding: {label}')
        for entry in entries:
            if not isinstance(entry, dict) or not isinstance(entry.get('path'), str) or not valid_sha(entry.get('sha256')):
                raise ValueError(f'malformed evidence binding: {label}')
            path = str(Path(entry['path']).resolve(strict=True))
            if canonical_files.get(path) != entry['sha256']:
                raise ValueError(f'{label} evidence is not covered by file_hashes: {path}')
    evidence_digest = canonical_sha(canonical_files)
    manifest_digest = sha(prepared_path)

    stack_review = p.get('stack_review')
    if not isinstance(stack_review, dict) or stack_review.get('status') != 'PASS':
        raise ValueError('missing successful binary stack review')
    stack_path, stack_hash = stack_review.get('path'), stack_review.get('sha256')
    if not isinstance(stack_path, str) or not valid_sha(stack_hash):
        raise ValueError('malformed stack review path/hash')
    resolved_stack = str(Path(stack_path).resolve(strict=True))
    if canonical_files.get(resolved_stack) != stack_hash or evidence_digest == '':
        raise ValueError('stack review bytes are not covered by file_hashes')
    source_commit = p.get('prototype_source_commit')
    if not isinstance(source_commit, str) or len(source_commit) != 40 or any(
            c not in '0123456789abcdef' for c in source_commit):
        raise ValueError('missing exact prototype source commit')
    reviewed_roles = stack_review.get('roles')
    if not isinstance(reviewed_roles, dict) or set(reviewed_roles) != {'E', 'U'}:
        raise ValueError('stack review must cover exactly the E and U production binaries')
    for role, item in reviewed_roles.items():
        if not isinstance(item, dict) or item.get('source_commit') != source_commit:
            raise ValueError(f'stack review source binding mismatch for {role}')
        dso_path, dso_hash = item.get('production_dso_path'), item.get('production_dso_sha256')
        if not isinstance(dso_path, str) or not valid_sha(dso_hash):
            raise ValueError(f'malformed production DSO binding for {role}')
        if canonical_files.get(str(Path(dso_path).resolve(strict=True))) != dso_hash:
            raise ValueError(f'production DSO hash is not covered for {role}')
        checks = ('callgraph_verified', 'guard_frame_verified', 'imports_verified',
                  'no_allocator_verified', 'stack_reserve_verified')
        if any(item.get(check) is not True for check in checks):
            raise ValueError(f'incomplete binary/stack review for {role}')
    authority = load_json(authority_path)
    review = load_json(review_path)
    if (authority.get('execution_authorized') is not True or
            authority.get('manifest_sha256') != manifest_digest or
            authority.get('evidence_sha256') != evidence_digest or
            authority.get('stack_review_sha256') != stack_hash or
            authority.get('review_path') != str(review_path) or
            authority.get('review_sha256') != sha(review_path)):
        raise ValueError('separate authority does not bind this manifest, evidence, and review')
    if (review.get('ready_to_run') is not True or
            review.get('prepared_manifest_sha256') != manifest_digest or
            review.get('evidence_sha256') != evidence_digest or
            review.get('stack_review_sha256') != stack_hash):
        raise ValueError('independent ready review does not bind this manifest and evidence')
    harness = p.get('harness')
    expected_harness = {
        str((HERE / 'run_ordinary.py').resolve()): sha(HERE / 'run_ordinary.py'),
        str((HERE / 'test_ordinary_offline.py').resolve()): sha(HERE / 'test_ordinary_offline.py'),
    }
    if not isinstance(harness, dict) or harness != expected_harness:
        raise ValueError('ordinary harness hashes are missing or stale')
    return p, output


def terminate_owned_group(proc: subprocess.Popen, global_cleanup_deadline: float) -> dict:
    """Stop only this process group, with a local five-second maximum grace."""
    started = monotonic()
    local_deadline = min(global_cleanup_deadline, started + CLEANUP_TOTAL_SECONDS)
    term_deadline = min(local_deadline, started + TERM_GRACE_SECONDS)
    term_sent = False
    kill_sent = False
    errors = []
    try:
        os.killpg(proc.pid, signal.SIGTERM)
        term_sent = True
    except ProcessLookupError:
        pass
    except OSError as e:
        errors.append(f'TERM: {type(e).__name__}: {e}')
    while proc.poll() is None and monotonic() < term_deadline:
        sleep(min(POLL_SECONDS, max(0.0, term_deadline - monotonic())))
    # Always signal the group after the TERM grace: the Popen leader may exit
    # while a descendant in its new session remains alive.
    try:
        os.killpg(proc.pid, signal.SIGKILL)
        kill_sent = True
    except ProcessLookupError:
        pass
    except OSError as e:
        errors.append(f'KILL: {type(e).__name__}: {e}')
    kill_deadline = min(local_deadline, monotonic() + KILL_GRACE_SECONDS)
    remaining = max(0.0, kill_deadline - monotonic())
    reaped = proc.poll() is not None
    try:
        proc.wait(timeout=remaining)
        reaped = True
    except subprocess.TimeoutExpired:
        reaped = proc.poll() is not None
    except OSError as e:
        errors.append(f'wait: {type(e).__name__}: {e}')
        reaped = proc.poll() is not None
    return {
        'term_sent': term_sent, 'kill_sent': kill_sent, 'reaped': reaped,
        'unresolved_process': not reaped,
        'cleanup_errors': errors,
        'elapsed_seconds': max(0.0, monotonic() - started),
        'local_deadline_monotonic': local_deadline,
    }


def _slot_argv(slot: dict, slot_dir: Path) -> list[str]:
    return [arg.replace('{slot_dir}', str(slot_dir)) for arg in slot['argv']]


def run_slot(slot: dict, slot_dir: Path, deadline: float, cleanup_deadline: float) -> dict:
    # The reservation is durable before Popen. Existing output forbids reruns.
    slot_dir.mkdir(mode=0o700)
    reservation = {
        'name': slot['name'], 'kind': slot['kind'], 'status': 'reserved',
        'argv': _slot_argv(slot, slot_dir), 'env': slot['env'], 'cwd': slot['cwd'],
        'reserved_monotonic': monotonic(),
    }
    atomic_json(slot_dir / 'RESERVATION.json', reservation)
    log_path = slot_dir / 'combined.log'
    status = 'failed'
    result = dict(reservation)
    proc = None
    try:
        with log_path.open('xb') as log:
            proc = subprocess.Popen(
                reservation['argv'], cwd=slot['cwd'], env=slot['env'],
                stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT,
                shell=False, start_new_session=True,
            )
            result['pid'] = proc.pid
            slot_deadline = min(deadline, monotonic() + slot['seconds'])
            while True:
                code = proc.poll()
                if log_path.stat().st_size > LOG_LIMIT:
                    result['failure'] = f'combined log exceeded {LOG_LIMIT} bytes'
                    if code is None:
                        result['cleanup'] = terminate_owned_group(proc, cleanup_deadline)
                    break
                if code is not None:
                    result['exit_code'] = code
                    if code == 0:
                        status = 'passed'
                    else:
                        result['failure'] = f'process exited {code}'
                    break
                if monotonic() >= slot_deadline:
                    result['failure'] = 'slot/global deadline expired'
                    result['cleanup'] = terminate_owned_group(proc, cleanup_deadline)
                    break
                sleep(min(POLL_SECONDS, max(0.0, slot_deadline - monotonic())))
    except BaseException as e:
        result['failure'] = f'{type(e).__name__}: {e}'
        raise
    finally:
        # Any exceptional exit after Popen still owns the child process group.
        if proc is not None and proc.poll() is None:
            result['cleanup'] = terminate_owned_group(proc, cleanup_deadline)
        result['status'] = status
        result['finished_monotonic'] = monotonic()
        atomic_json(slot_dir / 'RESULT.json', result)
    if status != 'passed':
        raise RuntimeError(f"slot {slot['name']} failed: {result.get('failure', 'unknown failure')}")
    return result


def execute(prepared_path: Path, authority_path: Path, review_path: Path) -> int:
    prepared, output = validate_preparation(prepared_path, authority_path, review_path)
    # mkdir is an exclusive claim. Existing output always blocks reruns.
    output.mkdir(mode=0o700, parents=True, exist_ok=False)
    manifest_digest = sha(prepared_path)
    started = monotonic()
    global_deadline = started + BUDGET['global_seconds']
    cleanup_deadline = global_deadline + BUDGET['cleanup_seconds']
    atomic_json(output / 'FROZEN.json', {
        'prepared_manifest': str(prepared_path.resolve()), 'manifest_sha256': manifest_digest,
        'started_monotonic': started, 'slot_order': [name for name, _ in ORDER],
        'budget': BUDGET,
    })
    atomic_json(output / 'RUN.json', {'status': 'running', 'completed_slots': []})
    completed = []
    failure = None
    try:
        for i, slot in enumerate(prepared['slots']):
            remaining = global_deadline - monotonic()
            if remaining <= BUDGET['cleanup_seconds']:
                raise TimeoutError('global budget leaves no time for another slot and cleanup')
            slot_dir = output / f'{i:02d}-{slot["name"]}'
            run_slot(slot, slot_dir, min(global_deadline - BUDGET['cleanup_seconds'],
                                         monotonic() + slot['seconds']), cleanup_deadline)
            completed.append(slot['name'])
            atomic_json(output / 'RUN.json', {'status': 'running', 'completed_slots': completed})
    except BaseException as e:
        failure = f'{type(e).__name__}: {e}'
        raise
    finally:
        atomic_json(output / 'RUN.json', {
            'status': 'passed' if failure is None and len(completed) == len(ORDER) else 'failed',
            'completed_slots': completed, 'failure': failure,
            'finished_monotonic': monotonic(),
        })
    return 0


def main(argv: list[str] | None = None) -> int:
    args = sys.argv[1:] if argv is None else argv
    if len(args) != 3:
        print('usage: run_ordinary.py PREPARED.json AUTHORITY.json REVIEW.json', file=sys.stderr)
        return 2
    try:
        return execute(Path(args[0]), Path(args[1]), Path(args[2]))
    except Exception as e:
        print(f'ordinary supervisor refused/failed: {e}', file=sys.stderr)
        return 1


if __name__ == '__main__':
    raise SystemExit(main())
