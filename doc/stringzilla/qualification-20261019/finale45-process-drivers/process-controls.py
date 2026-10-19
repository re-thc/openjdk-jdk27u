#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Balanced ordinary-process startup and javac controls for the complete JDKs."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import statistics as stats
import subprocess
import time

p=argparse.ArgumentParser(description=__doc__)
for n in ('pair','source','output'):p.add_argument('--'+n,type=Path,required=True)
a=p.parse_args();a.output.mkdir(parents=True,exist_ok=False)
for n in ('JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS'):os.environ.pop(n,None)
spec=importlib.util.spec_from_file_location('support',a.source/'.github/scripts/stringzilla-performance.py')
support=importlib.util.module_from_spec(spec);spec.loader.exec_module(support)
affinity=support.pin_cpu()
images={n:(a.pair/n).resolve() for n in ('original','fork')}
inventories={n:support.image(root) for n,root in images.items()}
expected=json.loads((a.pair/'pair-inventories.json').read_text())
assert all(inventories[n]['files']==expected[n]['files'] for n in images)
sources=[a.source/'test/jdk/java/lang/String'/n for n in ('StringZillaSearch.java','StringZillaBounded.java','StringZillaKernelsTest.java')]
controls=('original','enabled','disabled');exe='.exe' if os.name=='nt' else ''
results=[]
for workload in ('startup','javac'):
    rounds=[];class_hashes=None
    # One untimed full round warms filesystem pages for each complete image.
    for repeat in range(-1,6):
        paired={}
        for offset in range(3):
            control=controls[(max(repeat,0)+offset)%3]
            image=images['original' if control=='original' else 'fork']
            flag=[] if control=='original' else ['-XX:'+('+' if control=='enabled' else '-')+'UseStringZillaIntrinsics']
            prefix=f'{workload}-r{repeat}-{control}'
            if workload=='startup':cmd=[str(image/('bin/java'+exe)),*flag,'-version']
            else:
                classes=a.output/(prefix+'-classes');classes.mkdir()
                cmd=[str(image/('bin/javac'+exe)),*['-J'+v for v in flag],'-proc:none','-d',str(classes),*[str(s) for s in sources]]
            with (a.output/(prefix+'.log')).open('w') as log:
                start=time.perf_counter_ns()
                # A timeout makes POSIX wait poll, adding observation delay.
                subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True)
                elapsed=time.perf_counter_ns()-start
            if workload=='javac':
                observed={str(f.relative_to(classes)):support.sha(f) for f in sorted(classes.rglob('*.class'))}
                assert observed
                if class_hashes is None:class_hashes=observed
                assert observed==class_hashes,'Different javac product bytes'
            paired[control]={'milliseconds':elapsed/1e6,'command':cmd}
        if repeat>=0:rounds.append(paired)
    speedup={c:[r[c]['milliseconds']/r['enabled']['milliseconds'] for r in rounds] for c in ('original','disabled')}
    results.append({'workload':workload,'rounds':rounds,'speedup':speedup,
        'paired_median_speedup':{c:stats.median(v) for c,v in speedup.items()},
        'control_median_ms':{c:stats.median(r[c]['milliseconds'] for r in rounds) for c in controls},'compiled_class_hashes':class_hashes})
assert all(support.image(root)['files']==inventories[n]['files'] for n,root in images.items())
receipt={'sources':json.loads((a.pair/'pair-receipt.json').read_text())['sources'],
    'image_hashes':{n:i['tree_sha256'] for n,i in inventories.items()},'affinity':affinity,
    'method':'one untimed full round, six paired rounds in balanced rotating order; ordinary JVM defaults including CDS; process wall time uses blocking wait without timeout polling',
    'script_sha256':support.sha(Path(__file__)),'source_hashes':{s.name:support.sha(s) for s in sources},'results':results}
(a.output/'RESULTS.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps({r['workload']:{'medians_ms':r['control_median_ms'],'paired_median_speedup':r['paired_median_speedup'],'all_round_ratios':r['speedup']} for r in results}))
