#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Six balanced paired executions of a fixed source-indexing application task."""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import statistics as stats
import subprocess
import time

p=argparse.ArgumentParser(description=__doc__)
for name in ('pair','source','corpus','output'):p.add_argument('--'+name,type=Path,required=True)
a=p.parse_args();a.output.mkdir(parents=True,exist_ok=False)
for name in ('JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS'):os.environ.pop(name,None)
spec=importlib.util.spec_from_file_location('support',a.source/'.github/scripts/stringzilla-performance.py')
support=importlib.util.module_from_spec(spec);spec.loader.exec_module(support)
affinity=support.pin_cpu()
images={n:(a.pair/n).resolve() for n in ('original','fork')}
inventories={n:support.image(root) for n,root in images.items()}
expected=json.loads((a.pair/'pair-inventories.json').read_text())
assert all(inventories[n]['files']==expected[n]['files'] for n in images)
files=sorted((a.corpus/'src/java.base/share/classes/java/lang').glob('String*.java'))
assert files and subprocess.check_output(['git','-C',str(a.corpus),'rev-parse','HEAD'],text=True).strip()==support.BASE
assert subprocess.check_output(['git','-C',str(a.corpus),'status','--porcelain'],text=True).strip()==''
manifest=a.output/'corpus.txt';manifest.write_text(''.join(str(f)+'\n' for f in files))
classes=a.output/'classes';classes.mkdir()
app=Path(__file__).with_name('SourceScan.java')
subprocess.run([str(images['original']/'bin/javac'),'-proc:none','-d',str(classes),str(app)],check=True)
probe=a.output/'DefaultBackend.java'
probe.write_text('class DefaultBackend { public static void main(String[] a) throws Exception {'
    'Class<?> c=Class.forName("java.lang.StringZilla"); '
    'for(String n:new String[]{"BACKEND","ENABLED"}) { var f=c.getDeclaredField(n);'
    'f.setAccessible(true); System.out.println(n+"="+f.get(null)); } } }')
subprocess.run([str(images['original']/'bin/javac'),'-d',str(classes),str(probe)],check=True)
attestation={}
for control in ('enabled','disabled'):
    flag='-XX:'+('+' if control=='enabled' else '-')+'UseStringZillaIntrinsics'
    attestation[control]=support.command([images['fork']/'bin/java',flag,
        '--add-opens=java.base/java.lang=ALL-UNNAMED','-cp',classes,'DefaultBackend'])
    assert 'ENABLED='+str(control=='enabled').lower() in attestation[control]
rounds=[];checksum=None;controls=('original','enabled','disabled')
for repeat in range(-1,6):
    paired={}
    for offset in range(3):
        control=controls[(max(repeat,0)+offset)%3]
        image=images['original' if control=='original' else 'fork']
        flag=[] if control=='original' else ['-XX:'+('+' if control=='enabled' else '-')+'UseStringZillaIntrinsics']
        cmd=[str(image/'bin/java'),*flag,'-cp',str(classes),'SourceScan',str(manifest),'128']
        start=time.perf_counter_ns()
        done=subprocess.run(cmd,capture_output=True,text=True,check=True)
        elapsed=(time.perf_counter_ns()-start)/1e6
        if checksum is None:checksum=done.stdout.strip()
        assert done.stdout.strip()==checksum
        (a.output/f'r{repeat}-{control}.log').write_text(done.stdout+done.stderr)
        paired[control]={'milliseconds':elapsed,'command':cmd,'checksum':checksum}
    if repeat>=0:rounds.append(paired)
speedup={c:[r[c]['milliseconds']/r['enabled']['milliseconds'] for r in rounds] for c in ('original','disabled')}
assert all(support.image(root)['files']==inventories[n]['files'] for n,root in images.items())
result={'sources':json.loads((a.pair/'pair-receipt.json').read_text())['sources'],
    'image_hashes':{n:i['tree_sha256'] for n,i in inventories.items()},'affinity':affinity,
    'machine':subprocess.check_output(['uname','-a'],text=True).strip(),'default_backend_attestation':attestation,
    'method':'One untimed full round, six paired rounds in balanced rotating order; default-tiered JVM defaults including CDS; complete process wall time uses blocking wait without timeout polling; fixed 128 passes',
    'scope':'Token occurrence indexing, reverse token/brace lookup and line classification over the eight original JDK String*.java source files; one application task, not a general application suite',
    'corpus':{str(f.relative_to(a.corpus)):support.sha(f) for f in files},
    'script_sha256':support.sha(Path(__file__)),'application_sha256':support.sha(app),
    'class_sha256':support.sha(classes/'SourceScan.class'),'checksum':checksum,'rounds':rounds,
    'speedup':speedup,'paired_median_speedup':{c:stats.median(v) for c,v in speedup.items()},
    'control_median_ms':{c:stats.median(r[c]['milliseconds'] for r in rounds) for c in controls}}
(a.output/'RESULTS.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({n:result[n] for n in ('control_median_ms','paired_median_speedup','speedup','checksum')}))
