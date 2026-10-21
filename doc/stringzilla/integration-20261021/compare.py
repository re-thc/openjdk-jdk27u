#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
"""Sequential ordinary JMH forks with balanced paired controls and retained raw data."""
import argparse
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess
import sys
import time

sys.dont_write_bytecode = True


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--controls', type=Path, required=True)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--jars', type=Path)
    parser.add_argument('--manifest', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--rounds', type=int)
    parser.add_argument('--warmup', type=int, default=3)
    parser.add_argument('--samples', type=int, default=5)
    parser.add_argument('--duration', default='300ms')
    args = parser.parse_args()
    args.output.mkdir(exist_ok=False)
    ROOT = args.source.resolve()
    spec = importlib.util.spec_from_file_location('support', ROOT/'.github/scripts/stringzilla-performance.py')
    support = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(support)
    affinity = support.pin_cpu()
    for name in ('JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS'):
        os.environ.pop(name, None)
    controls = json.loads(args.controls.read_text())
    if args.rounds is None:
        args.rounds = len(controls)
    assert args.rounds >= len(controls) and args.rounds % len(controls) == 0
    assert args.duration.endswith('ms') and args.duration[:-2].isdigit()
    cases = json.loads(args.manifest.read_text())
    specifications = {name: support.read_spec(Path(data['spec'])) for name, data in controls.items()}
    assert all(value == specifications['original'] for value in specifications.values()), 'Unmatched build settings'
    assert len({c['id'] for c in cases}) == len(cases)
    inventories = {name: support.image(Path(data['image'])) for name, data in controls.items()}
    for name, control in controls.items():
        expected = control.get('expected_tree_sha256')
        if expected:
            assert inventories[name]['tree_sha256'] == expected, name
    classes = args.output/'classes'
    classes.mkdir()
    suffix = '.exe' if os.name == 'nt' else ''
    arm = platform.machine().lower() in ('aarch64', 'arm64')
    if args.jars:
        jars = [args.jars.resolve()/n for n in ('jmh-core-1.37.jar', 'jmh-generator-annprocess-1.37.jar', 'jopt-simple-5.0.4.jar', 'commons-math3-3.6.1.jar')]
    else:
        jars = support.download_jmh(args.output/'jmh')
    pinned_jars = {
        'commons-math3-3.6.1.jar': '1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308',
        'jmh-core-1.37.jar': 'dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3',
        'jmh-generator-annprocess-1.37.jar': '6a5604b5b804e0daca1145df1077609321687734a8b49387e49f10557c186c77',
        'jopt-simple-5.0.4.jar': 'df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28'
    }
    assert all(digest(jar) == pinned_jars[jar.name] for jar in jars)
    sources = [ROOT/'test/micro/org/openjdk/bench/java/lang'/f'{n}.java' for n in ('StringZillaScans', 'StringZillaSearch', 'StringZillaLongNeedle', 'StringZillaTailSearch')]
    snapshots=args.output/'benchmark-sources';snapshots.mkdir()
    for source in sources:
        (snapshots/source.name).write_bytes(source.read_bytes())
    javac = Path(controls['original']['image']).resolve()/('bin/javac'+suffix)
    subprocess.run([str(javac), '-cp', str(jars[0]), '-processorpath', os.pathsep.join(map(str,jars[:2])), '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', str(classes), *map(str,[snapshots/p.name for p in sources])], check=True)
    cp = os.pathsep.join(map(str,[classes,jars[0],*jars[2:]]))
    write = lambda name, value: (args.output/name).write_text(json.dumps(value,indent=2)+'\n')
    probe=args.output/'BackendProbe.java'
    probe.write_text('class BackendProbe {public static void main(String[] a)throws Exception {'
                     'Class<?> c=Class.forName("java.lang.StringZilla");'
                     'for(String n:new String[]{"BACKEND","ENABLED","MSVC_SERIAL","SCANS_ENABLED","SCAN_PROBE"})'
                     '{try{var f=c.getDeclaredField(n);f.setAccessible(true);System.out.println(n+"="+f.get(null));}'
                     'catch(NoSuchFieldException e){System.out.println(n+"=absent");}}}}')
    subprocess.run([str(javac),'-d',str(classes),str(probe)],check=True)
    attestations={}
    for name, control in controls.items():
        if name=='original':
            continue
        for avx in sorted({case.get('avx',2) for case in cases}):
            java=Path(control['image']).resolve()/('bin/java'+suffix)
            flags=['-XX:ActiveProcessorCount=1',*([] if arm else [f'-XX:UseAVX={avx}']),*control.get('flags',[])]
            raw=support.command([java,*flags,'--add-opens=java.base/java.lang=ALL-UNNAMED','-cp',classes,'BackendProbe'])
            fields=dict(line.split('=',1) for line in raw.splitlines() if '=' in line)
            expected=4 if arm else 0 if os.name=='nt' else {0:0,2:1,3:2}[avx]
            assert fields['BACKEND']==str(expected),(name,avx,raw)
            enabled='-XX:-UseStringZillaIntrinsics' not in control.get('flags',[])
            assert fields['ENABLED']==str(enabled).lower(),(name,avx,raw)
            if fields['SCANS_ENABLED']!='absent':
                assert fields['SCANS_ENABLED']==str(enabled and expected!=0).lower()
            label='neon' if arm else f'avx{avx}'
            vm_flags=support.command([java,*flags,'-XX:+PrintFlagsFinal','-version'])
            selected_flags=[line for line in vm_flags.splitlines() if any(flag in line for flag in
                ('UseAVX ', 'UseSVE ', 'UseStringZillaIntrinsics ', 'UseCompactObjectHeaders ',
                 'ObjectAlignmentInBytes ', 'UseCompressedOops ', 'TieredCompilation '))]
            attestations[f'{name}-{label}']={'command':[str(java),*flags],'output':raw,'selected_default_vm_flags':selected_flags}
    provenance = {'started':time.time(),'controls':controls,'matched_build_settings':specifications,'images':inventories,'affinity':affinity,'machine':platform.platform(),'cpu':Path('/proc/cpuinfo').read_text().split('\n\n')[0] if Path('/proc/cpuinfo').exists() else platform.processor(), 'driver_sha256':digest(Path(__file__)),'manifest_sha256':digest(args.manifest),'cases':cases,'method':{'rounds':args.rounds,'forks':1,'warmup_iterations':args.warmup,'measurement_iterations':args.samples,'iteration_duration':args.duration,'order':'rotating control order; every position once when rounds equal control count','summary':'median of paired round-median ratios; all samples and losses retained'},'benchmark_sources':{str(p.relative_to(ROOT)):digest(p) for p in sources},'harness':{str(p):digest(p) for p in jars},'compiled_harness':{str(p.relative_to(classes)):digest(p) for p in classes.rglob('*') if p.is_file()}}
    provenance['backend_attestations']=attestations
    provenance['controller_source_sha256']=digest(Path(__file__))
    write('provenance.json',provenance)
    (args.output/'controller.py').write_bytes(Path(__file__).read_bytes())
    (args.output/'manifest.json').write_bytes(args.manifest.read_bytes())
    names = list(controls)
    results = []
    for ci,case in enumerate(cases):
        rounds=[]
        for repeat in range(args.rounds):
            group={}
            order=names[(ci+repeat)%len(names):]+names[:(ci+repeat)%len(names)]
            for name in order:
                control=controls[name]
                java=Path(control['image']).resolve()/('bin/java'+suffix)
                flags=['-Xms256m','-Xmx256m','-XX:ActiveProcessorCount=1','-XX:+UseSerialGC','-Xshare:off',*([] if arm else [f'-XX:UseAVX={case.get("avx",2)}']),*{'c2':['-XX:-TieredCompilation'],'c1':['-XX:TieredStopAtLevel=1'],'interpreter':['-Xint']}[case.get('tier','c2')],*control.get('flags',[])]
                stem=f'{case["id"]}-r{repeat}-{name}'
                target=(args.output/(stem+'.json')).resolve()
                benchmark=case['benchmark'] if case['benchmark'].startswith('org.openjdk.') else 'org.openjdk.bench.java.lang.'+case['benchmark']
                argv=[str(java),*flags,'-cp',cp,'org.openjdk.jmh.Main',benchmark+'$',*[v for key,value in case['params'].items() for v in ('-p',key+'='+str(value))],'-f','1','-wi',str(args.warmup),'-w',args.duration,'-i',str(args.samples),'-r',args.duration,'-foe','true','-jvm',str(java),'-jvmArgs',' '.join(flags),'-rf','json','-rff',str(target)]
                with (args.output/(stem+'.log')).open('w') as log:
                    subprocess.run(argv,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=180)
                data=json.loads(target.read_text());assert len(data)==1;data=data[0]
                assert data['params']=={k:str(v) for k,v in case['params'].items()}
                assert data['jvmArgs']==flags and Path(data['jvm']).resolve()==java.resolve()
                assert data['forks']==1 and data['warmupIterations']==args.warmup and data['measurementIterations']==args.samples
                expected_duration=args.duration.removesuffix('ms')+' ms'
                assert data['warmupTime']==data['measurementTime']==expected_duration
                metric=data['primaryMetric'];raw=metric['rawData'];assert len(raw)==1 and len(raw[0])==args.samples and metric['scoreUnit']=='ns/op'
                assert all(math.isfinite(v) and v>0 for v in raw[0])
                group[name]={'median':statistics.median(raw[0]),'mean':metric['score'],'error':metric['scoreError'],'samples':raw[0],'file':target.name,'sha256':digest(target),'command':argv}
            rounds.append(group)
        reference='candidate' if 'candidate' in names else names[-1]
        ratios={n:[r[n]['median']/r[reference]['median'] for r in rounds] for n in names if n!=reference}
        result={'case':case,'reference':reference,'rounds':rounds,'medians':{n:statistics.median(r[n]['median'] for r in rounds) for n in names},'paired':{n:{'median':statistics.median(v),'min':min(v),'max':max(v),'ratios':v} for n,v in ratios.items()}}
        results.append(result);write('results.json',results)
        print(json.dumps({k:v for k,v in result.items() if k!='rounds'}),flush=True)
    for name,data in controls.items():
        assert support.image(Path(data['image']))['files']==inventories[name]['files'],name
    assert digest(args.manifest)==provenance['manifest_sha256']
    assert digest(Path(__file__))==provenance['controller_source_sha256']
    assert all(digest(source)==provenance['benchmark_sources'][str(source.relative_to(ROOT))] for source in sources)
    write('complete.json',{'cases':len(results),'rounds':args.rounds,'jmh_files':len(results)*args.rounds*len(names),'samples':len(results)*args.rounds*len(names)*args.samples,'images_unchanged':True,'completed':time.time()})


if __name__=='__main__':
    main()
