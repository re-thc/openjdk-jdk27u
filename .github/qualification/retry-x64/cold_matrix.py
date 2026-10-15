import argparse
import itertools
import json
import math
import os
from pathlib import Path
import re
import statistics
import subprocess
import time

p = argparse.ArgumentParser()
p.add_argument('kind', choices=['startup', 'first'])
p.add_argument('--blocks', type=int, default=120)
a = p.parse_args()
root = Path('/workspace/pr9-validation')
images = json.loads((root / 'images.json').read_text())
variants = {'master': ('master', []), 'before-off': ('before', ['-XX:-UseCommonIntrinsics']),
            'before-on': ('before', ['-XX:+UseCommonIntrinsics']),
            'final-off': ('final', ['-XX:-UseCommonIntrinsics']),
            'final-on': ('final', ['-XX:+UseCommonIntrinsics'])}
orders = list(itertools.permutations(variants))
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[1]})
flags = ['-XX:ActiveProcessorCount=1', '-XX:CICompilerCount=2', '-XX:+UseSerialGC',
         '-Xms32m', '-Xmx256m', '-XX:-UsePerfData', '-XX:+DisableAttachMechanism', '-Xrs']
tiers = [('int', ['-Xint']), ('c1-l1', ['-Xbatch', '-XX:TieredStopAtLevel=1']),
         ('c1-l3', ['-Xbatch', '-XX:TieredStopAtLevel=3']), ('c2', ['-Xbatch', '-XX:-TieredCompilation'])]
results = {}
def interval(values):
    mean = statistics.mean(values)
    half = 1.98 * statistics.stdev(values) / math.sqrt(len(values))
    return {'difference_ms': mean, 'paired_95_ci_ms': [mean-half, mean+half]}
def save():
    (root / (a.kind + '-matrix.json')).write_text(json.dumps(
        {'images': images, 'blocks': a.blocks, 'discarded_blocks': 20, 'worker': worker,
         'flags': flags, 'orders': orders, 'results': results}, indent=2) + '\n')
for tier, mode in tiers:
    cases = [('version', 0)] if a.kind == 'startup' else [
        ('multiply', 512), ('modpow', 512), ('multiply', 4096), ('modpow', 4096)]
    for operation, bits in cases:
        key = f'{tier}-{operation}-{bits}'
        raw = []
        results[key] = {'raw': raw, 'status': 'running'}
        checksum = None
        for block in range(a.blocks + 20):
            for label in orders[block % len(orders)]:
                image, extra = variants[label]
                command = ['taskset', '-c', str(worker), images[image]['path'] + '/bin/java',
                           *flags, *mode, *extra]
                if a.kind == 'startup':
                    command += ['-Xlog:startuptime=debug:stderr:none', '-version']
                else:
                    command += ['-cp', str(root / 'jmh/classes'), 'FirstBigInteger', operation, str(bits)]
                start = time.perf_counter_ns()
                proc = subprocess.run(command, capture_output=True, text=True)
                elapsed = (time.perf_counter_ns() - start) / 1e6
                row = {'block': block, 'label': label, 'wall_ms': elapsed,
                       'command': command, 'exit_code': proc.returncode}
                if proc.returncode:
                    row.update(stdout=proc.stdout, stderr=proc.stderr)
                    raw.append(row)
                    results[key]['status'] = 'failed-control-or-test'
                    save()
                    raise RuntimeError(row)
                if a.kind == 'first':
                    ns, value = map(int, proc.stdout.split())
                    if checksum is None:
                        checksum = value
                    if value != checksum:
                        row.update(stdout=proc.stdout, stderr=proc.stderr)
                        raw.append(row)
                        results[key]['status'] = 'checksum-mismatch'
                        save()
                        raise RuntimeError(row)
                    row.update(call_ms=ns/1e6, checksum=value)
                else:
                    row['timings_ms'] = {key: float(value)*1000 for key, value in
                        re.findall(r'([^\n]+?),\s*([0-9.]+) secs', proc.stderr)}
                raw.append(row)
            if block % 20 == 0:
                save()
        samples = {label: [r for r in raw if r['block'] >= 20 and r['label'] == label]
                   for label in variants}
        summary = {}
        for metric in (['wall_ms'] if a.kind == 'startup' else ['call_ms', 'wall_ms']):
            comparisons = {}
            for left, right in [('master', 'final-on'), ('before-on', 'final-on'),
                                ('before-off', 'final-off'), ('final-off', 'final-on')]:
                comparisons[left + '_' + right] = interval(
                    [y[metric]-x[metric] for x,y in zip(samples[left], samples[right])])
            summary[metric] = {'means': {label: statistics.mean(r[metric] for r in rows)
                for label, rows in samples.items()}, 'comparisons': comparisons}
        results[key].update(status='passed', summary=summary)
        save()
        print(key, json.dumps(summary), flush=True)
