import argparse, itertools, json, math, os, re, statistics, subprocess, time
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('before')
p.add_argument('candidate')
p.add_argument('output')
p.add_argument('--blocks', type=int, default=600)
a = p.parse_args()
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[1]})
flags = ['-XX:ActiveProcessorCount=1', '-XX:CICompilerCount=2', '-XX:+UseSerialGC',
         '-Xms32m', '-Xmx256m', '-XX:-UsePerfData', '-XX:+DisableAttachMechanism', '-Xrs',
         '-Xint', '-Xlog:startuptime:stderr:none']
variants = {'before-off': (a.before, False), 'before-on': (a.before, True),
            'candidate-off': (a.candidate, False), 'candidate-on': (a.candidate, True)}
orders = list(itertools.permutations(variants))
raw = []
for block in range(a.blocks + 24):
    for label in orders[block % len(orders)]:
        java, enabled = variants[label]
        command = ['taskset', '-c', str(worker), java, *flags,
                   '-XX:' + ('+' if enabled else '-') + 'UseCommonIntrinsics', '-version']
        start = time.perf_counter_ns()
        proc = subprocess.run(command, capture_output=True, text=True, check=True)
        wall = (time.perf_counter_ns() - start) / 1e6
        timings = {key: float(value) * 1000 for key, value in re.findall(r'([^\n]+?),\s*([0-9.]+) secs', proc.stderr)}
        timings['wall'] = wall
        raw.append(dict(block=block, label=label, timings_ms=timings, command=command, stderr=proc.stderr))
samples = {label: [r['timings_ms'] for r in raw if r['block'] >= 24 and r['label'] == label] for label in variants}
keys = sorted(set.intersection(*(set(r['timings_ms']) for r in raw)))
summary = {}
def estimate(values):
    mean = statistics.mean(values)
    half = 1.964 * statistics.stdev(values) / math.sqrt(len(values))
    return dict(difference_ms=mean, paired_95_ci_ms=[mean-half, mean+half])
for key in keys:
    s = {label: [r[key] for r in samples[label]] for label in variants}
    comparisons = {}
    for left, right in [('before-off', 'before-on'), ('candidate-off', 'candidate-on'),
                        ('before-off', 'candidate-off'), ('before-on', 'candidate-on')]:
        comparisons[left + '_' + right] = estimate([y-x for x,y in zip(s[left],s[right])])
    contrasts = [(co-cf)-(bo-bf) for bf,bo,cf,co in zip(s['before-off'],s['before-on'],s['candidate-off'],s['candidate-on'])]
    summary[key] = dict(means_ms={label:statistics.mean(v) for label,v in s.items()},
                        comparisons=comparisons, enabled_cost_change=estimate(contrasts))
Path(a.output).write_text(json.dumps(dict(before=a.before, candidate=a.candidate, blocks=a.blocks,
                                        worker=worker, flags=flags, orders=orders, summary=summary, raw=raw), indent=2) + '\n')
print(json.dumps(summary, indent=2))
