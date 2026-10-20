#!/usr/bin/env python3
"""Compilation diagnostics only; their scores are excluded from qualification."""
import json, subprocess, time
from pathlib import Path
root=Path('/workspace/sz-evidence')
for tier in ['c2','c1']:
    command=['taskset','-c','1','/workspace/sz-candidate/build/scans/images/jdk/bin/java',
        '-Xms256m','-Xmx256m','-XX:+UseSerialGC','-XX:UseAVX=2','-Xbatch']
    command+=['-XX:-TieredCompilation'] if tier=='c2' else ['-XX:TieredStopAtLevel=1']
    command+=(root/'hints/candidate.flags').read_text().splitlines()
    command+=['-XX:+PrintCompilation','-XX:+PrintInlining','-cp',
        str(root/'bench-classes')+':'+str(root/'jmh/*'),'org.openjdk.jmh.Main',
        'StringZillaScans.isBlank$','-p','workload=longBlank','-f','0',
        '-t','1','-wi','2','-w','100ms','-i','1','-r','100ms','-foe','true']
    with (root/'intrinsic-trace-commands.jsonl').open('a') as f:
        f.write(json.dumps(dict(tier=tier,start=time.time(),command=command))+'\n')
    log=root/f'compilation-final-{tier}.log'
    with log.open('w') as f:
        subprocess.run(command,stdout=f,stderr=subprocess.STDOUT,check=True)
    lines=log.read_text().splitlines()
    assert any('StringZilla::scanLatin1' in line and 'intrinsic' in line for line in lines)
    assert any('Blackhole::consumeCompiler' in line and 'intrinsic' in line for line in lines)
    print(tier,'native scan and compiler-blackhole intrinsics observed')
