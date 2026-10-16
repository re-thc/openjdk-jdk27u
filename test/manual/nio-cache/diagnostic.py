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


def task(pid, tid):
    root = Path('/proc') / str(pid) / 'task' / str(tid)
    before = time.monotonic_ns()
    first = stat_identity((root / 'stat').read_text())
    counters = list(map(int, (root / 'schedstat').read_text().split()))
    if len(counters) != 3 or any(x < 0 for x in counters):
        raise ValueError('schedstat format')
    sched = (root / 'sched').read_text()
    fields = {}
    for key in ('se.nr_migrations', 'nr_switches', 'nr_voluntary_switches', 'nr_involuntary_switches'):
        match = re.search(r'^' + re.escape(key) + r'\s*:\s*(\d+)\s*$', sched, re.M)
        if not match:
            raise ValueError('missing sched counter ' + key)
        fields[key] = int(match[1])
    last = stat_identity((root / 'stat').read_text())
    if first['start'] != last['start']:
        raise ValueError('TID reuse during sample')
    return {'before_ns': before, 'after_ns': time.monotonic_ns(), 'tid': tid,
            **last, 'runtime_ns': counters[0], 'wait_ns': counters[1],
            'timeslices': counters[2], **fields}


def snapshot(pid, start):
    root = Path('/proc') / str(pid)
    if stat_identity((root / 'stat').read_text())['start'] != start:
        raise ValueError('fork PID reused')
    matches = []
    for entry in (root / 'task').iterdir():
        try:
            if (entry / 'comm').read_text().strip() == WORKER:
                matches.append(int(entry.name))
        except FileNotFoundError:
            continue
    if len(matches) > 1:
        raise ValueError('ambiguous worker identity')
    return task(pid, matches[0]) if matches else None


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


def run(reference):
    started = time.monotonic()
    end = started + 90
    proc = None
    scope = None
    receipt = {'approval_reference': reference, 'status': 'inconclusive', 'performance_qualified': False}
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
        require_no_children()
        scope = ChildScope()
        samples = []
        seen = {}
        fork = None
        cpu_start = time.process_time_ns()
        sampling_start = time.monotonic_ns()
        if time.monotonic() >= started + 30:
            raise TimeoutError('preflight exceeded 30s; no launch')
        with (out / 'stdout').open('wb') as so, (out / 'stderr').open('wb') as se, (out / 'samples.jsonl').open('w') as stream:
            proc = subprocess.Popen(command, env=env, cwd=out, stdout=so, stderr=se, start_new_session=True)
            while proc.poll() is None:
                tick = time.monotonic_ns()
                owned = scope.owned(scope.backend.snapshot())
                for pid, row in owned.items():
                    if pid in seen and seen[pid] != row['start']:
                        raise ValueError('owned PID reused')
                    seen[pid] = row['start']
                if len(seen) > 2:
                    raise ValueError('more than one coordinator and one fork')
                children = [pid for pid in seen if pid != proc.pid]
                if children:
                    if fork is not None and fork != children[0]:
                        raise ValueError('fork changed')
                    fork = children[0]
                    try:
                        sample = snapshot(fork, seen[fork])
                    except (FileNotFoundError, ProcessLookupError):
                        sample = None  # Exit races are recorded as a gap, never interpolated.
                    if sample:
                        sample['cgroup_cpu_stat'] = Path('/sys/fs/cgroup/cpu.stat').read_text()
                        sample['proc_stat'] = Path('/proc/stat').read_text()
                        samples.append(sample)
                        stream.write(json.dumps(sample) + '\n')
                if sum(p.stat().st_size for p in out.iterdir() if p.is_file()) > 48 * 1024 * 1024:
                    raise ValueError('48MiB total output cap')
                if time.monotonic() > min(end - 2, started + 60):
                    raise TimeoutError('60-second invocation cap')
                time.sleep(max(0, (PERIOD_NS - (time.monotonic_ns() - tick)) / 1e9))
        observer_cpu = time.process_time_ns() - cpu_start
        observer_wall = time.monotonic_ns() - sampling_start
        receipt.update(exit_code=proc.returncode, process_identities=seen,
                       observer_cpu_ns=observer_cpu, observer_wall_ns=observer_wall,
                       observer_cpu_fraction=observer_cpu / observer_wall)
        cleanup = scope.close(proc, min(end, time.monotonic() + 2))
        receipt['cleanup'] = cleanup
        if cleanup_errors(cleanup):
            raise ValueError('cleanup failed')
        require_no_children()
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
        receipt['windows'] = analyze((out / 'stdout').read_text(), samples)
        receipt['scores_ns_op'] = payload[0]['primaryMetric']['rawData'][0]
        if observer_cpu / observer_wall > .02:
            raise ValueError('observer exceeds 2% of one CPU; intrusive collection')
        receipt['status'] = 'diagnostic data only; no performance pass'
    except BaseException as exc:
        receipt['error'] = repr(exc)
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        if scope is not None and 'cleanup' not in receipt:
            receipt['cleanup'] = scope.close(proc, min(end, time.monotonic() + 2))
        receipt['elapsed_s'] = time.monotonic() - started
        if receipt['elapsed_s'] >= 90:
            receipt['status'] = 'inconclusive; global cap exceeded'
        save(out / 'receipt.json', receipt)
    return 0 if receipt['status'].startswith('diagnostic data only') else 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--execute-approved', action='store_true')
    parser.add_argument('--approval-reference')
    args = parser.parse_args()
    if not args.execute_approved or not args.approval_reference:
        parser.error('a new bounded runtime approval and its reference are required')
    raise SystemExit(run(args.approval_reference))
