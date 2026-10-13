import argparse, json, math, os, statistics, subprocess, time
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('master')
p.add_argument('modified')
p.add_argument('output')
p.add_argument('--pairs', type=int, default=200)
a = p.parse_args()
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[min(1, len(cpus)-1)]})
flags = ['-XX:ActiveProcessorCount=1', '-XX:CICompilerCount=2', '-XX:+UseSerialGC',
         '-Xms32m', '-Xmx256m', '-XX:-UsePerfData', '-XX:+DisableAttachMechanism', '-Xrs']
results = {}
for tier, mode in [('int', ['-Xint']), ('c1', ['-XX:TieredStopAtLevel=1']),
                   ('c2', ['-XX:-TieredCompilation'])]:
    samples = {'master': [], 'modified': []}
    for i in range(a.pairs + 20):
        for label in (['master', 'modified'] if i % 2 == 0 else ['modified', 'master']):
            java = a.master if label == 'master' else a.modified
            start = time.perf_counter_ns()
            subprocess.run(['taskset', '-c', str(worker), java, *flags, *mode, '-version'],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
            elapsed = (time.perf_counter_ns() - start) / 1_000_000
            if i >= 20: samples[label].append(elapsed)
    diffs = [m - b for b, m in zip(samples['master'], samples['modified'])]
    mean = statistics.mean(diffs)
    half = 1.972 * statistics.stdev(diffs) / math.sqrt(a.pairs)
    results[tier] = dict(master_ms=statistics.mean(samples['master']),
                         modified_ms=statistics.mean(samples['modified']),
                         difference_ms=mean, paired_95_ci_ms=[mean-half, mean+half], samples=samples)
    print(json.dumps({tier: {k:v for k,v in results[tier].items() if k != 'samples'}}), flush=True)
Path(a.output).write_text(json.dumps(dict(master=a.master, modified=a.modified,
                                         pairs=a.pairs, worker_cpu=worker, vm_flags=flags,
                                         results=results), indent=2) + '\n')
