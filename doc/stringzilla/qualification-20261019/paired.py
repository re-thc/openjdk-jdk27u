#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Bounded repeated complete-image JMH comparisons, using ordinary JVM processes."""
import argparse
import csv
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import statistics as stats
import subprocess
import time

CONTROLS = ('original', 'enabled', 'disabled')
TIERS = {'interpreter': ['-Xint'], 'c1': ['-XX:TieredStopAtLevel=1'], 'c2': ['-XX:-TieredCompilation']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('source', 'pair', 'manifest', 'output'):
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--backend', choices=('serial', 'avx2', 'avx512', 'neon', 'msvc'), required=True)
    p.add_argument('--tiers', default='interpreter,c1,c2')
    args = p.parse_args()
    args.output.mkdir(parents=True, exist_ok=False)
    for name in ('JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS'):
        os.environ.pop(name, None)
    spec = importlib.util.spec_from_file_location('support', args.source / '.github/scripts/stringzilla-performance.py')
    support = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(support)
    write = lambda name, data: (args.output / name).write_text(json.dumps(data, indent=2) + '\n')
    images = {name: (args.pair / name).resolve() for name in ('original', 'fork')}
    inventories = {name: support.image(root) for name, root in images.items()}
    expected = json.loads((args.pair / 'pair-inventories.json').read_text())
    for name in images:
        assert inventories[name]['files'] == expected[name]['files'], name
        assert inventories[name]['tree_sha256'] == expected[name]['tree_sha256'], name
    receipt = json.loads((args.pair / 'pair-receipt.json').read_text())
    assert receipt['sources']['original'] == support.BASE
    assert support.read_spec(args.pair / 'original-spec.gmk') == support.read_spec(args.pair / 'fork-spec.gmk')
    affinity = support.pin_cpu()
    exe = '.exe' if os.name == 'nt' else ''
    java = {name: images['original' if name == 'original' else 'fork'] / ('bin/java' + exe) for name in CONTROLS}
    jars = support.download_jmh(args.output / 'jmh')
    classes = args.output / 'classes'
    classes.mkdir()
    sources = [args.source / 'test/micro/org/openjdk/bench/java/lang' / (name + '.java')
               for name in ('StringZillaSearch', 'StringZillaLongNeedle', 'StringZillaTailSearch')]
    support.command([images['original'] / ('bin/javac' + exe), '-cp', jars[0], '-processorpath',
                     os.pathsep.join(map(str, jars[:2])), '-processor',
                     'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', classes, *sources])
    cp = os.pathsep.join(map(str, [classes, jars[0], *jars[2:]]))
    backend_flags = [] if args.backend == 'neon' else ['-XX:UseAVX=' + {'serial':'0', 'avx2':'2', 'avx512':'3', 'msvc':'0'}[args.backend]]
    probe = args.output / 'BackendProbe.java'
    probe.write_text('class BackendProbe { public static void main(String[] a) throws Exception {'
                     'Class<?> c=Class.forName("java.lang.StringZilla"); '
                     'for(String n:new String[]{"BACKEND","ENABLED"}) { var f=c.getDeclaredField(n);'
                     'f.setAccessible(true); System.out.println(n+"="+f.get(null)); } } }')
    support.command([images['original'] / ('bin/javac' + exe), '-d', classes, probe])
    attestation = {}
    for control in ('enabled', 'disabled'):
        attestation[control] = support.command([java[control], *backend_flags,
            '-XX:' + ('+' if control == 'enabled' else '-') + 'UseStringZillaIntrinsics',
            '--add-opens=java.base/java.lang=ALL-UNNAMED', '-cp', classes, 'BackendProbe'])
        assert attestation[control] == 'BACKEND=' + str({'serial':0, 'msvc':0, 'avx2':1, 'avx512':2, 'neon':4}[args.backend]) + '\nENABLED=' + str(control == 'enabled').lower()
    rows = list(csv.DictReader(args.manifest.open(), delimiter='\t'))
    assert len({r['id'] for r in rows}) == len(rows)
    selected = [(tier, row) for tier in args.tiers.split(',') for row in rows
                if args.backend in row['backends'].split(',') and tier in row['tiers'].split(',')]
    provenance = {'pair_receipt':receipt, 'backend':args.backend, 'affinity':affinity,
        'machine':platform.platform(), 'cpu':Path('/proc/cpuinfo').read_text().split('\n\n')[0] if Path('/proc/cpuinfo').exists() else platform.processor(),
        'manifest_sha256':support.sha(args.manifest), 'runner_sha256':support.sha(Path(__file__)),
        'helper_sha256':support.sha(args.source / '.github/scripts/stringzilla-performance.py'),
        'benchmark_sources':{s.name:support.sha(s) for s in sources},
        'harness':{str(f.relative_to(args.output)):support.sha(f) for root in (classes,args.output/'jmh') for f in sorted(root.rglob('*')) if f.is_file()},
        'images':{n:i['tree_sha256'] for n,i in inventories.items()}, 'attestation':attestation,
        'method':{'rounds':3, 'forks_per_control_per_round':1, 'warmup':'3 x 300ms', 'measurement':'5 x 300ms',
                  'summary':'median of paired round medians; all rounds and samples retained', 'order':'rotating Latin square', 'gc':'Serial', 'cds':'off'},
        'triplets':len(selected), 'started':time.time()}
    write('provenance.json',provenance)
    results = []
    for case_index,(tier,row) in enumerate(selected):
        group = []
        for repeat in range(3):
            paired = {}
            for offset in range(3):
                control = CONTROLS[(case_index + repeat + offset) % 3]
                flags = ['-XX:ActiveProcessorCount=1','-XX:+UseSerialGC','-Xshare:off',*backend_flags,*TIERS[tier]]
                if control != 'original': flags += ['-XX:' + ('+' if control == 'enabled' else '-') + 'UseStringZillaIntrinsics']
                name = f'{tier}-{row["id"]}-r{repeat}-{control}'
                target = args.output / (name + '.json')
                params = {'length':row['length'],'needleLength':row['needleLength']}
                params.update({'shape':row['shape']} if row['shape'] != '-' else {'coder':row['coder'],'position':row['position']})
                argv = [str(java[control]),*flags,'-cp',cp,'org.openjdk.jmh.Main',row['benchmark']+'$',
                        *[v for k,v in params.items() for v in ('-p',k+'='+v)],
                        '-f','1','-wi','3','-w','300ms','-i','5','-r','300ms','-foe','true',
                        '-jvm',str(java[control]),'-jvmArgs',' '.join(flags),'-rf','json','-rff',str(target)]
                with (args.output/(name+'.log')).open('w') as log:
                    subprocess.run(argv,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=180)
                data = json.loads(target.read_text())
                assert len(data)==1
                data=data[0]
                assert data['params']==params and data['jvmArgs']==flags
                assert data['forks']==1 and data['warmupIterations']==3 and data['measurementIterations']==5
                assert data['warmupTime']==data['measurementTime']=='300 ms'
                metric=data['primaryMetric']
                assert metric['scoreUnit']=='ns/op' and len(metric['rawData'])==1 and len(metric['rawData'][0])==5
                paired[control]={'median':stats.median(metric['rawData'][0]),'mean':metric['score'],'error':metric['scoreError'],
                    'samples':metric['rawData'][0], 'json':target.name,'sha256':support.sha(target),'command':argv}
            group.append(paired)
        summary={'backend':args.backend,'tier':tier,'case':row,'rounds':group,
            'medians':{c:stats.median(r[c]['median'] for r in group) for c in CONTROLS},
            'speedup':{c:[r[c]['median']/r['enabled']['median'] for r in group] for c in ('original','disabled')}}
        summary['paired_median_speedup']={c:stats.median(v) for c,v in summary['speedup'].items()}
        summary['higher_enabled_median']=[c for c,v in summary['paired_median_speedup'].items() if v<1]
        results.append(summary)
        write('results.json',results)
        print(json.dumps({k:v for k,v in summary.items() if k!='rounds'}),flush=True)
    assert all(support.image(images[n])['files']==inventories[n]['files'] for n in images)
    assert support.sha(args.manifest)==provenance['manifest_sha256']
    assert support.sha(Path(__file__))==provenance['runner_sha256']
    write('complete.json',{'triplets':len(results),'controls':len(results)*9,'samples':len(results)*45,'images_unchanged':True,'completed':time.time()})


if __name__=='__main__':
    main()
