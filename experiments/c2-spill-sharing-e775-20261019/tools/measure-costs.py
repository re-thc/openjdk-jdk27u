#!/usr/bin/env python3
"""Balanced independent startup/compiler-cost runs, separate from throughput."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import time

root = Path('/workspace/work/spill-sharing')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--baseline', type=Path, required=True)
parser.add_argument('--candidate', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--jvm-arg', action='append', default=[])
args = parser.parse_args()
args.output.mkdir(parents=True, exist_ok=False)
images = {'A': args.baseline.resolve(), 'B': args.candidate.resolve()}
records = []
for cell in ('startup', 'compiler'):
    for pair in range(12):
        order = 'AB' if pair % 2 == 0 else 'BA'
        for position, arm in enumerate(order):
            stem = f'{cell}-pair{pair:02d}-{position}-{arm}'
            metrics = args.output / (stem + '-resource.json')
            command = ['taskset', '-c', '0-3',
                       str(images[arm] / 'bin/java'), '--add-modules', 'jdk.incubator.vector',
                       '-XX:+UseSerialGC', '-Xms512m', '-Xmx512m', '-XX:ActiveProcessorCount=4']
            command += args.jvm_arg
            if cell == 'startup':
                command += ['-Dprobe.checkOnly=true', '-cp', str(root / 'classes'),
                            'CodecProbe', 'decode', str(root / 'corpus/source.bin'),
                            '3', str(root / 'corpus/source.zst')]
            else:
                command += ['-Xbatch', '-XX:-TieredCompilation', '-XX:+CITime',
                            '-cp', str(root / 'classes'), 'DecodeOverlayCheck',
                            str(root / 'corpus/frames.tsv')]
            start = time.perf_counter()
            with (args.output / (stem + '.log')).open('w') as output:
                process = subprocess.Popen(command, stdout=output, stderr=subprocess.STDOUT)
                pid, status, usage = os.wait4(process.pid, 0)
                assert pid == process.pid
                process.returncode = os.waitstatus_to_exitcode(status)
            resource = dict(wall_s=time.perf_counter()-start, user_s=usage.ru_utime,
                            system_s=usage.ru_stime, max_rss_kib=usage.ru_maxrss)
            metrics.write_text(json.dumps(resource)+'\n')
            record = dict(cell=cell, pair=pair, order=order, position=position, arm=arm,
                          command=command, elapsed_s=time.perf_counter()-start,
                          exit_code=process.returncode)
            if metrics.exists():
                record['resource'] = json.loads(metrics.read_text())
            records.append(record)
            (args.output / 'runs.json').write_text(json.dumps(records, indent=2)+'\n')
            print(f'{cell} pair={pair+1}/12 order={order} arm={arm} exit={process.returncode} wall={record["elapsed_s"]:.3f}s', flush=True)
            if process.returncode != 0:
                raise RuntimeError(f'Failed run retained: {stem}')
