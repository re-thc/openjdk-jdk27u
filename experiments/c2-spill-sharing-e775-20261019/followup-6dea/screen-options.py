#!/usr/bin/env python3
"""Fixed, balanced six-pair screening of two lifetime policies; no retries."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

ROOT = Path('/workspace/work/spill-sharing')
sys.path.insert(0, str(ROOT))
from measure import CELLS, CP, OPTIONS

output = ROOT/'followup/screen'
output.mkdir(exist_ok=False)
options = {'short': ROOT/'images/test-s', 'hybrid': ROOT/'images/test-h'}
baseline = ROOT/'images/test-v'
cells = [cell for cell in CELLS if cell[0] in
         ('decode-dense', 'decode-source', 'positive-trigger', 'copy-control')]
records = {name: [] for name in options}
for name, candidate in options.items():
    directory = output/name
    directory.mkdir()
    identity = {arm: dict(image=str(image), libjvm_sha256=hashlib.file_digest(
        (image/'lib/server/libjvm.so').open('rb'), 'sha256').hexdigest())
        for arm, image in [('A', baseline), ('B', candidate)]}
    (directory/'identity.json').write_text(json.dumps(identity, indent=2)+'\n')

for pair in range(6):
    order = 'AB' if pair % 2 == 0 else 'BA'
    cell_order = cells[pair % len(cells):] + cells[:pair % len(cells)]
    option_order = list(options) if pair % 2 == 0 else list(reversed(options))
    for cell, benchmark, parameters in cell_order:
        for name in option_order:
            for position, arm in enumerate(order):
                image = baseline if arm == 'A' else options[name]
                directory = output/name
                stem = f'{cell}-pair{pair:02d}-{position}-{arm}'
                result_path = directory/(stem+'.json')
                flags = OPTIONS.copy() + ['-Xshare:on']
                if cell == 'positive-trigger':
                    flags += ['-XX:+UseFPUForSpilling',
                        '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::kernel',
                        '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::barrier',
                        '-XX:CompileCommand=exclude,experiment.TestSharedSpillSharingTrigger::reference']
                command = ['taskset', '-c', '0-3', '/workspace/toolchains/jdk27/bin/java',
                    '--add-modules', 'jdk.incubator.vector', '-cp', CP, 'org.openjdk.jmh.Main',
                    '^'+benchmark+'$', '-jvm', str(image/'bin/java'), '-jvmArgs', ' '.join(flags),
                    '-f', '1', '-t', '1', '-wi', '3', '-w', '1s', '-i', '5', '-r', '1s',
                    '-rf', 'json', '-rff', str(result_path), *parameters]
                start = time.time()
                with (directory/(stem+'.log')).open('w') as log:
                    result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
                record = dict(option=name, cell=cell, pair=pair, order=order,
                    position=position, arm=arm, command=command, start_epoch=start,
                    wall_seconds=time.time()-start, exit_code=result.returncode, result=str(result_path))
                records[name].append(record)
                (directory/'runs.json').write_text(json.dumps(records[name], indent=2)+'\n')
                print(name, cell, pair, order, arm, result.returncode, flush=True)
                if result.returncode != 0 or not result_path.is_file():
                    raise RuntimeError('Failed screen invocation retained: '+stem)
                data = json.loads(result_path.read_text())
                assert len(data) == 1 and len(data[0]['primaryMetric']['rawData'][0]) == 5
