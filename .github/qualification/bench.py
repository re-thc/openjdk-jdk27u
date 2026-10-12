import argparse
import json
import os
import subprocess
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('java')
parser.add_argument('classpath')
parser.add_argument('output')
parser.add_argument('--suite', choices=['current', 'guard', 'controls'], default='current')
args = parser.parse_args()
output = Path(args.output)
output.mkdir(parents=True, exist_ok=True)
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[min(1, len(cpus) - 1)]})
flags = ['-XX:ActiveProcessorCount=1', '-XX:CICompilerCount=2', '-XX:+UseSerialGC',
         '-Xms128m', '-Xmx256m', '-XX:-UsePerfData', '-XX:+DisableAttachMechanism', '-Xrs',
         '--add-exports=java.base/jdk.internal.util=ALL-UNNAMED']
cases = [
    ('bulk', 'org.openjdk.bench.vm.compiler.CommonIntrinsics.(aesCtr|sha256|sha3|hashBytes|multiply|modPow)', ['-p', 'length=4096']),
    ('scalar', 'org.openjdk.bench.vm.compiler.CommonScalarIntrinsics.bitCount', []),
]
tiers = [('int', ['-Xint']), ('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1']),
         ('c2', ['-Xbatch', '-XX:-TieredCompilation'])]
if args.suite == 'guard':
    cases = [('mixed', 'org.openjdk.bench.vm.compiler.CommonGuardIntrinsics.mixedOperations',
              ['-p', 'size=1024,4096', '-p', 'failedGuard=false,true'])]
    tiers = [('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1'])]
pairs = 3
warmups, measurements, measurement_time = 3, 5, '1s'
if args.suite == 'controls':
    cases = [
        ('multiply', 'org.openjdk.bench.vm.compiler.CommonIntrinsics.multiply', ['-p', 'length=4096']),
        ('bitCount', 'org.openjdk.bench.vm.compiler.CommonScalarIntrinsics.bitCount', []),
    ]
    tiers = [('c2', ['-Xbatch', '-XX:-TieredCompilation'])]
    pairs = 6
    warmups, measurements, measurement_time = 8, 10, '2s'
manifest = dict(java=args.java, classpath=args.classpath, worker_cpu=worker, flags=flags,
                suite=args.suite, runs=[])
for tier, tier_flags in tiers:
    for pair in range(pairs):
        order = ['off', 'on'] if pair % 2 == 0 else ['on', 'off']
        if args.suite == 'guard':
            order = ['on']
        for setting in order:
            for label, pattern, params in cases:
                name = f'{tier}-{label}-{setting}-{pair}'
                result_file = output / (name + '.json')
                command = ['taskset', '-c', str(worker), args.java, *flags, '-cp', args.classpath,
                           'org.openjdk.jmh.Main', pattern, *params, '-f', '1', '-wi', str(warmups), '-i', str(measurements),
                           '-w', '1s', '-r', measurement_time, '-t', '1', '-foe', 'true', '-rf', 'json',
                           '-rff', str(result_file), '-jvm', args.java, '-jvmArgs',
                           ' '.join(flags + tier_flags + ['-XX:' + ('+' if setting == 'on' else '-') + 'UseCommonIntrinsics'])]
                print(name, flush=True)
                with (output / (name + '.log')).open('w') as log:
                    subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
                data = json.loads(result_file.read_text())
                manifest['runs'].append(dict(name=name, tier=tier, setting=setting, pair=pair,
                                             command=command, result=data))
                (output / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
print('Benchmarks complete', flush=True)
