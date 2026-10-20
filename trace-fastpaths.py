#!/usr/bin/env python3
"""Selected-case compilation diagnostic, not an A/B performance study."""
import json, subprocess, time
from pathlib import Path
root=Path('/workspace/sz-evidence')
out=root/'trace-source32'
out.mkdir(exist_ok=False)
for label in ['base','candidate','off']:
    image='/workspace/sz-scans' if label=='base' else '/workspace/sz-candidate'
    hint='base' if label=='base' else 'candidate'
    command=['taskset','-c','1',image+'/build/scans/images/jdk/bin/java',
        '-Xms256m','-Xmx256m','-XX:+UseSerialGC','-XX:UseAVX=2',
        '-Xbatch','-XX:-TieredCompilation']
    command+=(root/'hints'/f'{hint}.flags').read_text().splitlines()
    command+=['-XX:+PrintCompilation','-XX:+PrintInlining']
    if label=='off': command+=['-XX:-UseStringZillaIntrinsics']
    command+=['-cp',str(root/'bench-classes')+':'+str(root/'jmh/*'),
        'org.openjdk.jmh.Main','StringZillaScans.(trim|stripTrailing)$',
        '-p','workload=empty,shortClean,longClean','-f','0','-t','1',
        '-wi','2','-w','100ms','-i','1','-r','100ms','-foe','true']
    with (out/'commands.jsonl').open('a') as f:
        f.write(json.dumps(dict(label=label,start=time.time(),command=command))+'\n')
    with (out/f'{label}.log').open('w') as log:
        subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,check=True)
    print('Compilation diagnostic completed:',label,flush=True)
