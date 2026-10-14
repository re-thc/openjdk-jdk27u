import argparse, itertools, json, math, os, statistics, subprocess, time
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('master')
p.add_argument('modified')
p.add_argument('output')
p.add_argument('--blocks', type=int, default=120)
a = p.parse_args()
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[1]})
flags = ['-XX:ActiveProcessorCount=1', '-XX:CICompilerCount=2', '-XX:+UseSerialGC',
         '-Xms32m', '-Xmx256m', '-XX:-UsePerfData', '-XX:+DisableAttachMechanism', '-Xrs']
orders = list(itertools.permutations(['master', 'off', 'on']))
results = {}
for tier, mode in [('int', ['-Xint']), ('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1']),
                   ('c2', ['-Xbatch', '-XX:-TieredCompilation'])]:
    for operation in ['scalar', 'hash', 'multiply', 'sha256']:
        raw = []
        checksum = None
        for block in range(a.blocks + 18):
            for label in orders[block % 6]:
                java = a.master if label == 'master' else a.modified
                extra = [] if label == 'master' else ['-XX:' + ('+' if label == 'on' else '-') + 'UseCommonIntrinsics']
                command = ['taskset', '-c', str(worker), java, *flags, *mode, *extra,
                           '-cp', str(Path(__file__).parent), 'FirstUse', operation]
                start = time.perf_counter_ns()
                proc = subprocess.run(command, capture_output=True, text=True, check=True)
                wall = (time.perf_counter_ns() - start) / 1e6
                elapsed, value = map(int, proc.stdout.split())
                if checksum is None: checksum = value
                assert value == checksum, (operation, label, value, checksum)
                raw.append(dict(block=block, label=label, call_ms=elapsed / 1e6, wall_ms=wall, command=command, value=value))
        samples = {label: [r for r in raw if r['block'] >= 18 and r['label'] == label] for label in orders[0]}
        summaries = {}
        for metric in ['wall_ms', 'call_ms']:
            comparisons = {}
            for before, after in [('master', 'on'), ('off', 'on')]:
                diff = [y[metric] - x[metric] for x, y in zip(samples[before], samples[after])]
                mean = statistics.mean(diff)
                half = 1.98 * statistics.stdev(diff) / math.sqrt(len(diff))
                comparisons[before + '_' + after] = dict(difference_ms=mean, paired_95_ci_ms=[mean-half, mean+half])
            summaries[metric] = dict(means={label: statistics.mean(r[metric] for r in entries) for label, entries in samples.items()}, comparisons=comparisons)
        results[tier + '-' + operation] = dict(summary=summaries, raw=raw)
        Path(a.output).write_text(json.dumps(dict(master=a.master, modified=a.modified, blocks=a.blocks,
                                                worker=worker, flags=flags, orders=orders, results=results), indent=2) + '\n')
        print(tier, operation, json.dumps(summaries), flush=True)
