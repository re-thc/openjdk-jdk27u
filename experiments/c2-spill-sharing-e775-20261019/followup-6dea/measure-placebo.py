#!/usr/bin/env python3
"""Twelve fixed AB/BA pairs per cell, toggling target methods in one image."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

ROOT = Path('/workspace/work/spill-sharing')
sys.path.insert(0, str(ROOT))
from measure import CELLS, CP, OPTIONS

out = ROOT/'followup/placebo-copy'
out.mkdir(exist_ok=False)
image = ROOT/'images/diag-v'
digest = hashlib.file_digest((image/'lib/server/libjvm.so').open('rb'),'sha256').hexdigest()
(out/'identity.json').write_text(json.dumps({arm: dict(image=str(image),libjvm_sha256=digest,
    target_sharing_enabled=True) for arm in ('A','B')},indent=2)+'\n')
cells = [cell for cell in CELLS if cell[0] in
         ('copy-control',)]
records = []
for pair in range(12):
    order = 'AB' if pair%2==0 else 'BA'
    for cell,benchmark,parameters in cells[pair%len(cells):]+cells[:pair%len(cells)]:
        for position,arm in enumerate(order):
            stem = f'{cell}-pair{pair:02d}-{position}-{arm}'
            result_path = out/(stem+'.json')
            directives = ROOT/f'followup/toggle-directives/{cell}-B.txt'
            flags = OPTIONS.copy()+['-Xshare:on','-XX:CompileCommandFile='+str(directives)]
            if cell=='positive-trigger':
                flags += ['-XX:+UseFPUForSpilling',
                    '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::kernel',
                    '-XX:CompileCommand=dontinline,experiment.TestSharedSpillSharingTrigger::barrier',
                    '-XX:CompileCommand=exclude,experiment.TestSharedSpillSharingTrigger::reference']
            command = ['taskset','-c','0-3','/workspace/toolchains/jdk27/bin/java',
                '--add-modules','jdk.incubator.vector','-cp',CP,'org.openjdk.jmh.Main',
                '^'+benchmark+'$','-jvm',str(image/'bin/java'),'-jvmArgs',' '.join(flags),
                '-f','1','-t','1','-wi','3','-w','1s','-i','5','-r','1s',
                '-rf','json','-rff',str(result_path),*parameters]
            start=time.time()
            with (out/(stem+'.log')).open('w') as log:
                result=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT)
            records.append(dict(cell=cell,pair=pair,order=order,position=position,arm=arm,
                command=command,start_epoch=start,wall_seconds=time.time()-start,
                exit_code=result.returncode,result=str(result_path),
                directive_file=str(directives),directive_sha256=hashlib.file_digest(
                    directives.open('rb'),'sha256').hexdigest()))
            (out/'runs.json').write_text(json.dumps(records,indent=2)+'\n')
            print(cell,pair,order,arm,result.returncode,flush=True)
            if result.returncode!=0 or not result_path.is_file():
                raise RuntimeError('Failed invocation retained: '+stem)
            data=json.loads(result_path.read_text())
            assert len(data)==1 and len(data[0]['primaryMetric']['rawData'][0])==5
