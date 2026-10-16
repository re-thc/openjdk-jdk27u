# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""One baseline observation. Import, --help and offline tests launch no JVMs."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import subprocess
import time
from process_cleanup import ChildScope, cleanup_errors, enable_subreaper, require_no_children
from observer import BoundSampler, Costs, children, read_identity, worker

ROOT = Path(__file__).resolve().parent
WORKER = 'org.ope..rker-1'  # HotSpot first seven + '..' + final six bytes.
PERIOD_NS = 20_000_000


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def log_pid(xml, gc):
    match = re.fullmatch(r'hotspot_pid([1-9][0-9]*)\.xml', Path(xml).name)
    if not match or Path(gc).name != 'gc_' + match[1] + '.log':
        raise ValueError('mismatched or malformed log PID pair')
    return int(match[1])


def stat_identity(raw):
    fields = raw[raw.rfind(')') + 2:].split()
    return {'start': int(fields[19]), 'cpu': int(fields[36]), 'state': fields[0]}


def window_bounds(samples, begin, end):
    """Conservative cumulative-counter deltas, never interpolated."""
    if begin >= end:
        raise ValueError('window order')
    selected = [x for x in samples if x['after_ns'] >= begin - PERIOD_NS * 2
                and x['before_ns'] <= end + PERIOD_NS * 2]
    if len(selected) < 4 or len({(x['tid'], x['start']) for x in selected}) != 1:
        raise ValueError('missing/recycled worker')
    for a, b in zip(selected, selected[1:]):
        if b['before_ns'] - a['before_ns'] > 30_000_000:
            raise ValueError('sample gap exceeds 30ms')
        for key in ('runtime_ns', 'wait_ns', 'timeslices', 'se.nr_migrations',
                    'nr_switches', 'nr_voluntary_switches', 'nr_involuntary_switches'):
            if b[key] < a[key]:
                raise ValueError('counter reset')
    if any(x['after_ns'] - x['before_ns'] > 5_000_000 for x in selected):
        raise ValueError('sample acquisition exceeds 5ms')
    left = [x for x in selected if x['after_ns'] <= begin]
    right = [x for x in selected if x['before_ns'] >= end]
    inside = [x for x in selected if x['before_ns'] >= begin and x['after_ns'] <= end]
    if not left or not right or len(inside) < 2:
        raise ValueError('unbracketed window')
    outer_a, outer_b = left[-1], right[0]
    inner_a, inner_b = inside[0], inside[-1]
    result = {'window_ns': end - begin, 'outer_span_ns': outer_b['after_ns'] - outer_a['before_ns'],
              'inner_span_ns': inner_b['before_ns'] - inner_a['after_ns']}
    for key in ('runtime_ns', 'wait_ns', 'timeslices', 'se.nr_migrations',
                'nr_switches', 'nr_voluntary_switches', 'nr_involuntary_switches'):
        result[key] = [inner_b[key] - inner_a[key], outer_b[key] - outer_a[key]]
    return result


def analyze(stdout, samples):
    windows = []
    pattern = re.compile(r'^NIO_WINDOW benchmark=org\.openjdk\.bench\.nioqual\.NioCachePaths\.ordinaryHit iteration=(\d+) uptime_before_ms=(\d+) nano_before=(\d+) compiler_before_ms=(\d+) gc_before=(\d+) nano_after=(\d+) uptime_after_ms=(\d+) compiler_after_ms=(\d+) gc_after=(\d+)$', re.M)
    prefix = 'org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit'
    lines = stdout.splitlines()
    begin = 'NIO_WINDOWS_BEGIN benchmark=' + prefix + ' count=12'
    finish = 'NIO_WINDOWS_END benchmark=' + prefix + ' count=12'
    if lines.count(begin) != 1 or lines.count(finish) != 1:
        raise ValueError('observer frame missing/duplicated')
    a, b = lines.index(begin), lines.index(finish)
    if b - a != 13 or any('NIO_WINDOW' in x for x in lines[:a] + lines[b + 1:]):
        raise ValueError('observer frame order/length')
    if any(not pattern.fullmatch(x) for x in lines[a + 1:b]):
        raise ValueError('malformed observer row')
    rows = [list(map(int, m.groups())) for m in pattern.finditer(stdout)]
    if len(rows) != 12 or [x[0] for x in rows] != list(range(12)):
        raise ValueError('require twelve ordered observer windows')
    for row in rows:
        if row[1] > row[6] or row[3] > row[7] or row[4] > row[8]:
            raise ValueError('observer counter reset')
        try:
            bounds = window_bounds(samples, row[2], row[5])
        except ValueError as exc:
            if row[0] >= 3:
                raise
            bounds = {'unavailable': str(exc)}  # Worker creation may preclude the first bracket.
        windows.append({'iteration': row[0], 'phase': 'warmup' if row[0] < 5 else 'measurement',
                        'compiler_ms': row[7] - row[3], 'gc_count': row[8] - row[4], **bounds})
    return windows


def close_receipt(path, receipt, started, end):
    """A successful write must finish before the deadline, including closure I/O."""
    try:
        receipt['elapsed_s'] = time.monotonic() - started
        if time.monotonic() >= end:
            raise TimeoutError('global cap reached before receipt closure')
        save(path, receipt)
        if time.monotonic() >= end:
            raise TimeoutError('global cap reached during receipt closure')
        return True
    except BaseException as exc:
        # Invalidate the successful file before attempting any further write.
        receipt['status'] = 'inconclusive; receipt closure failed'
        receipt['closure_error'] = repr(exc)
        receipt['elapsed_s'] = time.monotonic() - started
        path.unlink(missing_ok=True)
        save(path, receipt)
        return False


def admit_processes(proc, java, deadline):
    coordinator = {'pid': proc.pid, **read_identity(proc.pid)}
    if coordinator['pgrp'] != proc.pid or coordinator['session'] != proc.pid:
        raise ValueError('coordinator is not isolated process-group/session leader')
    fork = None
    while proc.poll() is None:
        if time.monotonic() >= deadline:
            raise TimeoutError('8-second fork/worker admission cap')
        found = children(proc.pid, coordinator)
        if len(found) > 1:
            raise ValueError('unexpected coordinator children')
        if found:
            pid = next(iter(found))
            row = read_identity(pid)
            if row['ppid'] != proc.pid or row['pgrp'] != proc.pid or row['session'] != proc.pid:
                raise ValueError('fork outside owned coordinator group/session')
            if fork is not None and (pid, row['start']) != (fork['pid'], fork['start']):
                raise ValueError('fork identity changed during admission')
            fork = {'pid': pid, **row}
            # taskset execs the coordinator; JMH starts the identified java executable.
            if (Path('/proc') / str(pid) / 'exe').resolve() != Path(java).resolve():
                raise ValueError('unexpected fork executable')
            bound = worker(pid, fork)
            if bound:
                tid, thread = bound
                return coordinator, fork, {'tid': tid, **thread}
        time.sleep(.02)
    raise ValueError('coordinator exited before worker admission')


def audit_owned(scope, identities):
    observed = scope.owned(scope.backend.snapshot())
    if {pid: row['start'] for pid, row in observed.items()} != identities:
        raise ValueError('admission/exit ownership audit mismatch')


def output_size(paths):
    total = 0
    for path in paths:
        try:
            total += path.stat().st_size
        except FileNotFoundError:
            pass
    if total > 48 * 1024 * 1024:
        raise ValueError('48MiB total output cap')


def run(reference):
    started = time.monotonic()
    end = started + 90
    proc = None
    scope = None
    sampler = None
    costs = Costs()
    receipt = {'approval_reference': reference, 'status': 'inconclusive', 'performance_qualified': False,
               'ownership_detection': 'One bound coordinator/fork; full admission/exit/cleanup audits. Sampling does not enumerate processes or threads and cannot detect transient extra children or duplicate worker names during collection.'}
    out = ROOT / 'run'
    out.mkdir(exist_ok=False)  # One execution; never overwrite or resume.
    def expired(*unused):
        raise TimeoutError('90-second global cap')
    signal.signal(signal.SIGALRM, expired)
    signal.setitimer(signal.ITIMER_REAL, 88)  # Two seconds reserved for cleanup.
    try:
        frozen = json.loads((ROOT / 'freeze.json').read_text())
        for name, expected in frozen['files'].items():
            if digest(name) != expected:
                raise ValueError('frozen input changed: ' + name)
        for directory in frozen['directories']:
            actual = {str(p) for p in Path(directory).rglob('*') if p.is_file()}
            expected = {p for p in frozen['files'] if p.startswith(directory + '/')}
            if actual != expected:
                raise ValueError('frozen input file set changed: ' + directory)
        if Path('/sys/fs/cgroup/cpu.max').read_text() != frozen['cpu_max']:
            raise ValueError('CPU quota changed')
        if set(range(5)) - os.sched_getaffinity(0):
            raise ValueError('required CPUs unavailable')
        os.sched_setaffinity(0, {4})
        command = json.loads((ROOT / 'command.json').read_text())
        env = frozen['environment']
        enable_subreaper()
        costs.measure('prelaunch_ownership_audit', require_no_children)
        scope = costs.measure('ownership_scope', ChildScope)
        samples = []
        if time.monotonic() >= started + 30:
            raise TimeoutError('preflight exceeded 30s; no launch')
        with (out / 'stdout').open('wb') as so, (out / 'stderr').open('wb') as se, (out / 'samples.jsonl').open('w') as stream:
            proc = subprocess.Popen(command, env=env, cwd=out, stdout=so, stderr=se, start_new_session=True)
            admission_end = min(started + 60, time.monotonic() + 8)
            coordinator, bound_fork, thread = costs.measure(
                'admission_discovery', admit_processes, proc, command[3], admission_end)
            fork = bound_fork['pid']
            seen = {proc.pid: coordinator['start'], fork: bound_fork['start']}
            costs.measure('admission_ownership_audit', audit_owned, scope, seen)
            if time.monotonic() >= admission_end:
                raise TimeoutError('admission ownership audit exceeded cap')
            receipt['bound_identities'] = {'coordinator': coordinator, 'fork': bound_fork, 'worker': thread}
            sampler = BoundSampler(coordinator, bound_fork, thread)
            capped = [out / name for name in ('stdout', 'stderr', 'samples.jsonl', 'result.json',
                      'hotspot_pid' + str(fork) + '.xml', 'gc_' + str(fork) + '.log')]
            cpu_start = time.process_time_ns()
            sampling_start = time.monotonic_ns()
            while proc.poll() is None:
                tick = time.monotonic_ns()
                try:
                    sample = costs.measure('bound_reads', sampler.sample)
                except (FileNotFoundError, ProcessLookupError):
                    receipt['sampling_end'] = 'bound task/process exited; no rebinding'
                    break
                samples.append(sample)
                costs.measure('encode_write', lambda: stream.write(json.dumps(sample) + '\n'))
                costs.measure('output_cap', output_size, capped)
                if time.monotonic() >= min(end - 2, started + 60):
                    raise TimeoutError('60-second invocation cap')
                time.sleep(max(0, (PERIOD_NS - (time.monotonic_ns() - tick)) / 1e9))
            observer_cpu = time.process_time_ns() - cpu_start
            observer_wall = time.monotonic_ns() - sampling_start
            sampler.close()
            sampler = None
            # Collection has ended. Global discovery is permitted again here.
            while proc.poll() is None:
                if time.monotonic() >= min(end - 2, started + 60):
                    raise TimeoutError('coordinator exit deadline')
                time.sleep(.02)
            # Every still-owned process must be one of the bound identities.
            remaining = costs.measure('exit_ownership_audit', scope.backend.snapshot)
            owned = scope.owned(remaining)
            if any(pid not in seen or seen[pid] != row['start'] for pid, row in owned.items()):
                raise ValueError('unexpected process at exit ownership audit')
        costs.measure('final_output_cap', output_size, [p for p in out.iterdir() if p.is_file()])
        receipt.update(exit_code=proc.returncode, process_identities=seen,
                       observer_cpu_ns=observer_cpu, observer_wall_ns=observer_wall,
                       observer_cpu_fraction=observer_cpu / observer_wall)
        cleanup = costs.measure('cleanup', scope.close, proc, min(end, time.monotonic() + 2))
        receipt['cleanup'] = cleanup
        if cleanup_errors(cleanup):
            raise ValueError('cleanup failed')
        costs.measure('final_ownership_audit', require_no_children)
        if proc.returncode != 0 or (out / 'stderr').stat().st_size:
            raise ValueError('nonzero exit or nonempty stderr')
        xml, gc = list(out.glob('hotspot_*.xml')), list(out.glob('gc_*.log'))
        if len(xml) != 1 or len(gc) != 1 or log_pid(xml[0], gc[0]) != fork:
            raise ValueError('log identities missing/mismatched')
        payload = json.loads((out / 'result.json').read_text())
        if len(payload) != 1 or payload[0]['benchmark'] != 'org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit':
            raise ValueError('benchmark identity mismatch')
        if payload[0]['jvm'] != command[3] or payload[0]['jvmArgs'] != command[-1].split():
            raise ValueError('JVM identity/flags mismatch')
        if len(payload[0]['primaryMetric']['rawData']) != 1 or len(payload[0]['primaryMetric']['rawData'][0]) != 7:
            raise ValueError('measurement count mismatch')
        d = payload[0]
        for key, want in {'jmhVersion': '1.37', 'mode': 'avgt', 'threads': 1, 'forks': 1,
                          'warmupIterations': 5, 'measurementIterations': 7,
                          'warmupBatchSize': 1, 'measurementBatchSize': 1}.items():
            if d.get(key) != want:
                raise ValueError('JMH metadata mismatch: ' + key)
        if d['primaryMetric']['scoreUnit'] != 'ns/op':
            raise ValueError('wrong score unit')
        if any(not isinstance(v, (int, float)) or isinstance(v, bool) or not math.isfinite(v) or v <= 0
               for v in d['primaryMetric']['rawData'][0]):
            raise ValueError('invalid score')
        receipt['windows'] = costs.measure('analysis', analyze, (out / 'stdout').read_text(), samples)
        receipt['scores_ns_op'] = payload[0]['primaryMetric']['rawData'][0]
        if observer_cpu / observer_wall > .02:
            raise ValueError('observer exceeds 2% of one CPU; intrusive collection')
        receipt['status'] = 'diagnostic data only; no performance pass'
    except BaseException as exc:
        receipt['error'] = repr(exc)
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        if sampler is not None:
            sampler.close()
        if scope is not None and 'cleanup' not in receipt:
            receipt['cleanup'] = costs.measure('cleanup', scope.close, proc, min(end, time.monotonic() + 2))
        receipt['observer_costs'] = costs.stages
        closed = close_receipt(out / 'receipt.json', receipt, started, end)
    return 0 if closed and receipt['status'].startswith('diagnostic data only') else 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--execute-approved', action='store_true')
    parser.add_argument('--approval-reference')
    args = parser.parse_args()
    if not args.execute_approved or not args.approval_reference:
        parser.error('a new bounded runtime approval and its reference are required')
    raise SystemExit(run(args.approval_reference))
