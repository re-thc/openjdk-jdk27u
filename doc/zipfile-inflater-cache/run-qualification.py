#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Prepared fixed qualification runner. Do not run before execution is authorized."""
import argparse
import json
import math
import os
from pathlib import Path
import re
import statistics
import subprocess
import time

parser = argparse.ArgumentParser()
parser.add_argument('--baseline', type=Path, required=True)
parser.add_argument('--candidate', type=Path, required=True)
parser.add_argument('--workload-jar', type=Path, required=True)
parser.add_argument('--fixture', type=Path, required=True)
parser.add_argument('--out', type=Path, required=True)
args = parser.parse_args()
for name in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'LD_PRELOAD', 'LD_AUDIT'):
    if os.environ.get(name):
        raise RuntimeError('Clear external instrumentation/options before timing: ' + name)
args.out.mkdir(parents=True, exist_ok=False)  # never overwrite an earlier run
deadline = time.monotonic() + 1800
rows = []
checksums = {}
cases = ('metadata', 'serial-full', 'serial-partial', 'parallel4', 'promoted32', 'promote2', 'loader')
images = {'baseline': args.baseline.resolve(), 'candidate': args.candidate.resolve()}

def launch(policy, gc, kind, index):
    image = images[policy]
    java = image / 'bin' / 'java'
    if not java.is_file():
        java = image / 'bin' / 'java.exe'
    flags = ['-Xms128m', '-Xmx128m', '-XX:ActiveProcessorCount=4', '-XX:+Use' + gc + 'GC']
    if kind == 'batch':
        flags.append('-Xbatch')
    command = [str(java), *flags, '-cp', str(args.workload_jar.resolve()),
               'ZipCacheQualification', kind, str(args.fixture.resolve())]
    remaining = deadline - time.monotonic()
    if remaining <= 0:
        raise RuntimeError('30-minute timing budget exhausted; do not rerun')
    started = time.perf_counter_ns()
    log = args.out / f'{gc}-{kind}-{index}-{policy}.log'
    try:
        result = subprocess.run(command, text=True, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                timeout=min(90 if kind == 'batch' else 15, remaining))
    except subprocess.TimeoutExpired as failure:
        partial = failure.stdout or ''
        if isinstance(partial, bytes):
            partial = partial.decode(errors='replace')
        log.write_text(partial + '\nQUALIFICATION TIMEOUT; NO RERUN\n')
        raise
    elapsed = time.perf_counter_ns() - started
    log.write_text(result.stdout)
    result.check_returncode()
    return result.stdout, elapsed

def check_checksum(key, value):
    previous = checksums.setdefault(key, value)
    if previous != value:
        raise RuntimeError('Content checksum mismatch: ' + key)

def record(row):
    rows.append(row)
    with (args.out / 'observations.ndjson').open('a') as output:
        output.write(json.dumps(row) + '\n')

for gc in ('Serial', 'G1', 'Z'):
    # Three independent paired JVMs, AB / BA / AB. Each batch retains all rounds.
    for fork in range(3):
        for policy in (('baseline', 'candidate') if fork % 2 == 0 else ('candidate', 'baseline')):
            output, _ = launch(policy, gc, 'batch', fork)
            parsed = {case: [] for case in cases}
            for mode, round_text, nanos, checksum in re.findall(
                    r'^mode=(\S+) round=(\d+) ns=(\d+) checksum=(-?\d+)$', output, re.MULTILINE):
                if mode not in parsed or int(round_text) != len(parsed[mode]):
                    raise RuntimeError('Unexpected or unordered batch output')
                parsed[mode].append(int(nanos))
                check_checksum(mode, int(checksum))
            if any(len(values) != 8 for values in parsed.values()):
                raise RuntimeError('Incomplete batch output')
            for case, values in parsed.items():
                record(dict(gc=gc, kind='batch', case=case, pair=fork,
                                 policy=policy, rounds_ns=values,
                                 value_ns=statistics.median(values[3:])))
    # Two unmeasured startup pairs followed by six measured pairs, alternating AB/BA.
    for pair in range(8):
        for policy in (('baseline', 'candidate') if pair % 2 == 0 else ('candidate', 'baseline')):
            output, elapsed = launch(policy, gc, 'startup', pair)
            match = re.search(r'^startup checksum=(-?\d+)$', output, re.MULTILINE)
            if not match:
                raise RuntimeError('Missing startup success oracle')
            check_checksum('startup', int(match[1]))
            record(dict(gc=gc, kind='startup', case='startup', pair=pair,
                             policy=policy, warmup=pair < 2, value_ns=elapsed))
    (args.out / 'observations.json').write_text(json.dumps(rows, indent=2) + '\n')

summary = []
for gc in ('Serial', 'G1', 'Z'):
    for case in (*cases, 'startup'):
        selected = [row for row in rows if row['gc'] == gc and row['case'] == case
                    and not row.get('warmup', False)]
        pairs = sorted({row['pair'] for row in selected})
        ratios = []
        for pair in pairs:
            values = {row['policy']: row['value_ns'] for row in selected if row['pair'] == pair}
            ratios.append(values['candidate'] / values['baseline'])
        logs = [math.log(value) for value in ratios]
        critical = 2.015048 if case == 'startup' else 2.919986
        upper = math.exp(statistics.mean(logs)
                         + critical * statistics.stdev(logs) / math.sqrt(len(logs)))
        budget = 1.03 if case == 'startup' else 1.02
        summary.append(dict(gc=gc, case=case, paired_ratios=ratios,
                            geometric_mean=math.exp(statistics.mean(logs)),
                            per_row_one_sided_95_upper=upper, budget=budget,
                            passes_resolution_gate=upper <= budget))
(args.out / 'timing-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
passed = all(row['passes_resolution_gate'] for row in summary)
print(json.dumps({'timing_gate_pass': passed,
                  'note': 'Per-row small-sample bounds, not universal or family-wise neutrality.'}))
raise SystemExit(0 if passed else 2)
