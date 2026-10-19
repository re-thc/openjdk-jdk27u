#!/usr/bin/env python3
"""Ordinary sequential JMH runs with fixed balanced ordering; no retries."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time

ROOT = Path('/workspace/work/spill-sharing')
CP = str(ROOT / 'classes') + ':' + str(ROOT / 'deps/jars') + '/*'
OPTIONS = ['--add-modules', 'jdk.incubator.vector', '-XX:+UseSerialGC',
           '-Xms512m', '-Xmx512m', '-XX:ActiveProcessorCount=4']
CELLS = [(f'decode-{kind}', 'experiment.FrameBench.direct', ['-p', f'corpus={kind}'])
         for kind in ('source', 'repetitive', 'dense', 'long-offset', 'random')]
CELLS += [('allocating-source', 'experiment.FrameBench.allocating', ['-p', 'corpus=source']),
          ('spill-kernel4', 'experiment.SpillBench.kernel4', []),
          ('positive-trigger', 'experiment.TriggerBench.kernel', []),
          ('copy-control', 'experiment.FrameBench.copyControl', ['-p', 'corpus=random'])]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--baseline', type=Path, required=True)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--pairs', type=int, default=12)
    parser.add_argument('--cell', action='append')
    parser.add_argument('--profile-gc', action='store_true')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=False)
    images = {'A': args.baseline.resolve(), 'B': args.candidate.resolve()}
    identity = {arm: {'image': str(image), 'libjvm_sha256': hashlib.sha256(
        (image / 'lib/server/libjvm.so').read_bytes()).hexdigest()} for arm, image in images.items()}
    (args.output / 'identity.json').write_text(json.dumps(identity, indent=2) + '\n')
    records = []
    for cell, benchmark, parameters in CELLS:
        if args.cell and cell not in args.cell:
            continue
        for pair in range(args.pairs):
            order = 'AB' if pair % 2 == 0 else 'BA'
            for position, arm in enumerate(order):
                stem = f'{cell}-pair{pair:02d}-{position}-{arm}'
                result_path = args.output / (stem + '.json')
                options = OPTIONS.copy()
                if cell == 'spill-kernel4':
                    options += ['-XX:CompileCommand=dontinline,experiment.TestSharedSpillLoads::kernel*',
                                '-XX:CompileCommand=dontinline,experiment.TestSharedSpillLoads::cold',
                                '-XX:CompileCommand=exclude,experiment.TestSharedSpillLoads::reference']
                if cell == 'positive-trigger':
                    options += ['-XX:+UseFPUForSpilling',
                                '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::kernel',
                                '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::barrier',
                                '-XX:CompileCommand=exclude,experiment.TestSharedSpillSharingTrigger::reference']
                command = ['taskset', '-c', '0-3', '/workspace/toolchains/jdk27/bin/java',
                           '--add-modules', 'jdk.incubator.vector',
                           '-cp', CP, 'org.openjdk.jmh.Main', '^' + benchmark + '$',
                           '-jvm', str(images[arm] / 'bin/java'),
                           '-jvmArgs', ' '.join(options), '-f', '1', '-t', '1',
                           '-wi', '3', '-w', '1s', '-i', '5', '-r', '1s',
                           '-rf', 'json', '-rff', str(result_path), *parameters]
                if args.profile_gc:
                    command += ['-prof', 'gc']
                start = time.time()
                with (args.output / (stem + '.log')).open('w') as log:
                    result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
                record = dict(cell=cell, pair=pair, order=order, position=position, arm=arm,
                              command=command, start_epoch=start, wall_seconds=time.time()-start,
                              exit_code=result.returncode, result=str(result_path))
                records.append(record)
                (args.output / 'runs.json').write_text(json.dumps(records, indent=2) + '\n')
                print(f'{cell} pair={pair+1}/{args.pairs} order={order} arm={arm} exit={result.returncode} wall={record["wall_seconds"]:.2f}s', flush=True)
                if result.returncode != 0 or not result_path.exists():
                    raise RuntimeError(f'Failed run retained: {stem}')
                data = json.loads(result_path.read_text())
                if len(data) != 1 or 'primaryMetric' not in data[0]:
                    raise RuntimeError(f'Invalid JMH result retained: {stem}')


if __name__ == '__main__':
    main()
