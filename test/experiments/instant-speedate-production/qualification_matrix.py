#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Proposed, UNEXECUTED exact-image qualification. See QUALIFICATION.md."""
import argparse,csv,hashlib,json,os,platform,re,shutil,statistics,sys,time
from pathlib import Path
sys.dont_write_bytecode=True
from deadline import execute
from prepare_java_control import control_source

p=argparse.ArgumentParser()
for field in ['repo','baseline','cached','enabled','configured-off','out']:p.add_argument('--'+field,type=Path,required=True)
p.add_argument('--started',type=float,required=True);p.add_argument('--candidate-sha',required=True)
a=p.parse_args();a.out=a.out.resolve();a.out.mkdir(exist_ok=False)
here=Path(__file__).resolve().parent;ev=a.out/'evidence';ev.mkdir();deadline=a.started+10800
windows=os.name=='nt';mac=platform.system()=='Darwin';exe='.exe' if windows else ''
lib='instant.dll' if windows else ('libinstant.dylib' if mac else 'libinstant.so')
libdir='bin' if windows else 'lib';include='win32' if windows else ('darwin' if mac else 'linux')
homes={'baseline':a.baseline,'cached':a.cached,'enabled':a.enabled,'runtime-off':a.enabled,'configured-off':a.configured_off}
rows=[];cold=[];oracles={};events=[];misses=[];wall_times={}
decision='INCONCLUSIVE: packet did not complete'
class CorrectnessFailure(Exception):pass
def require(value,message):
    if not value:raise RuntimeError(message)
def correct(value,message):
    if not value:raise CorrectnessFailure(message)
def invoke(name,cmd,timeout=120):
    events.append(name);require(len(set(events))==len(events),'duplicate command name')
    print(name,flush=True)
    try:
        result=execute(cmd,ev/(name+'.log'),deadline,timeout,cwd=a.repo)
        wall_times[name]=result['wall_ns'];captured=result['stdout']
        if re.search(r'WARNING in native method|FATAL ERROR in native method|JNI DETECTED ERROR|A fatal error has been detected by the Java Runtime Environment',captured):
            raise CorrectnessFailure(name+': JNI misuse or JVM fatal-error diagnostic')
        return captured
    except Exception as error:
        captured=(ev/(name+'.log')).read_text() if (ev/(name+'.log')).exists() else ''
        if re.search(r'AssertionError|WARNING in native method|FATAL ERROR in native method|JNI DETECTED ERROR|A fatal error has been detected by the Java Runtime Environment',captured):
            raise CorrectnessFailure(name+': failed assertion/JNI safety check; '+str(error)+'; inspect retained log')
        raise
def java(name,route,action,compact=True,gc='G1',flags=(),stress=False,home=None):
    home=home or homes[route]
    cmd=[home/('bin/java'+exe),'-Xms64m' if stress else '-Xms256m','-Xmx64m' if stress else '-Xmx256m',
         '-XX:ActiveProcessorCount=2','-XX:+Use'+gc+'GC','-XX:+CompactStrings' if compact else '-XX:-CompactStrings']
    if route=='runtime-off':cmd+=['-Djdk.time.instantSpeedate=false']
    return invoke(name,cmd+list(flags)+['-cp',a.out/'classes']+list(action))
def blocks(text,name,route,compact,gc,corpus,fork,diagnostic=False):
    selected=[]
    for line in text.splitlines():
        if not line.startswith('block,'):continue
        _,index,ns,before_bytes,before,after,gc_ms,checksum=line.split(',')
        selected.append(dict(route=route,compact=compact,gc=gc,corpus=corpus,fork=fork,block=int(index),
            ns=float(ns)/500000,bytes=float(before_bytes)/500000,compile_before=int(before),compile_after=int(after),
            gc_ms=int(gc_ms),checksum=int(checksum)))
    require([r['block'] for r in selected]==list(range(6)),name+': missing/duplicated block')
    rows.extend(dict(phase='diagnostic' if diagnostic else 'timing',**r) for r in selected)
    correct(all(r['checksum']==oracles[corpus] for r in selected),name+': checksum mismatch')
    require(max(r['bytes'] for r in selected)-min(r['bytes'] for r in selected)<=1,name+': allocation unstable')
    require(selected[0]['compile_before']==selected[-1]['compile_after'],name+': measured compiler time changed')
    if not diagnostic:
        times=[r['ns'] for r in selected]
        require(max(times)/min(times)<=1.10,name+': timing max/min >1.10')
        require(0.95<=statistics.median(times[3:])/statistics.median(times[:3])<=1.05,name+': timing trend outside5%')
        require(all(r['gc_ms']<=0.10*r['ns']*500000/1e6 for r in selected),name+': GC time exceeds10%')
def median(route,compact,gc,corpus,field='ns',fork=None):
    return statistics.median(r[field] for r in rows if r['phase']=='timing' and
        (r['route'],r['compact'],r['gc'],r['corpus'])==(route,compact,gc,corpus) and (fork is None or r['fork']==fork))
def gate(name,route,compact,gc,corpus,reference=None,ratio=1,extra=0,field='ns',absolute=None):
    passes=[]
    for fork in [0,1]:
        limit=absolute if absolute is not None else ratio*median(reference,compact,gc,corpus,field,fork)+extra
        passes.append(median(route,compact,gc,corpus,field,fork)<=limit)
    require(passes[0]==passes[1],name+': fork-dependent gate; no pooled-median rescue')
    if not passes[0]:misses.append(name)

try:
    observed=invoke('candidate-head',['git','rev-parse','HEAD']).splitlines()[-1]
    require(observed==a.candidate_sha,'candidate revision changed')
    require(not invoke('candidate-status',['git','status','--porcelain']).strip(),'candidate checkout is dirty')
    require(0<=time.monotonic()-a.started<10800,'invalid or expired packet start clock')
    source_ids={}
    for name in ['ProductionProbe.java','OnLoad.c','QualificationProbe.java','prepare_java_control.py',
                 'deadline.py','qualification_matrix.py','QUALIFICATION.md']:
        source=here/name;frozen=a.repo/'test/experiments/instant-speedate-production'/name
        require(source.read_bytes()==frozen.read_bytes(),'qualification helper differs from frozen source: '+name)
        source_ids[name]=hashlib.sha256(source.read_bytes()).hexdigest()
    (ev/'helper-identities.json').write_text(json.dumps(source_ids,indent=2)+'\n')
    for name in ['JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS','CLASSPATH','LD_PRELOAD','DYLD_INSERT_LIBRARIES']:
        require(not os.environ.get(name),name+' must be empty for a controlled packet')
    build_logs=a.out.parent/'logs'
    for variant in ['baseline','cached','enabled','configured-off']:
        source=a.out.parent/variant
        require(homes[variant].resolve()==(source/'build/qualification/images/jdk').resolve(),'image is not the prescribed local normal build: '+variant)
        expected='89885a6288e7aaabd01678a704a586272c0f96e3' if variant in ['baseline','cached'] else a.candidate_sha
        actual=invoke('source-head-'+variant,['git','-C',source,'rev-parse','HEAD']).strip()
        require(actual==expected,'wrong source checkout: '+variant)
        control_path='src/java.base/share/classes/java/time/format/DateTimeFormatterBuilder.java'
        changes=invoke('source-status-'+variant,['git','-C',source,'status','--porcelain','--untracked-files=all']).rstrip('\n')
        require(changes==(' M '+control_path if variant=='cached' else ''),'unexpected staged, unstaged or untracked source changes: '+variant)
        if variant=='cached':
            original=invoke('cached-control-original',['git','-C',source,'show','HEAD:'+control_path])
            require((source/control_path).read_text()==control_source(original),'cached control differs from the frozen transformation')
    for name in [*(f'images-{v}' for v in ['baseline','cached','enabled','configured-off']),
                 'junit-enabled','junit-configured-off','junit-cached','rust-tests']:
        receipt=json.loads((build_logs/(name+'.log.receipt.json')).read_text())
        require(receipt['exit_status']==0 and receipt['started_monotonic']>=a.started,name+': missing fresh successful normal-build/check receipt')
        if name.startswith('images-'):
            variant=name[len('images-'):]
            require(Path(receipt['cwd']).resolve()==(a.out.parent/variant).resolve(),name+': receipt belongs to another checkout')
            require(receipt['command']==['make','CONF=qualification','JOBS=4','images'],name+': unexpected normal build command')
    identities={}
    for route,home in homes.items():
        identities[route]={}
        for path in [home/'release',home/'lib/modules',home/libdir/lib]:
            if path.name in ['release','modules']:require(path.is_file(),route+': required image identity file missing: '+str(path))
            if path.exists():identities[route][str(path)]=hashlib.sha256(path.read_bytes()).hexdigest()
    (ev/'image-identities.json').write_text(json.dumps(identities,indent=2)+'\n')
    require((a.enabled/libdir/lib).is_file(),'enabled native library missing')
    require(not (a.configured_off/libdir/lib).exists(),'configure-disabled image contains native library')
    require(not (a.configured_off/'legal/java.base/speedate.md').exists(),'disabled notices not excluded')
    require(not (a.configured_off/'legal/java.base/COPYRIGHT-library.html').exists(),'disabled compiler notices not excluded')
    require((a.enabled/'legal/java.base/speedate.md').is_file(),'dependency notices missing')
    require((a.enabled/'legal/java.base/COPYRIGHT-library.html').is_file(),'compiler notices missing')
    (a.out/'classes').mkdir()
    invoke('compile-fixtures',[a.enabled/('bin/javac'+exe),'--add-exports','java.base/jdk.internal.misc=ALL-UNNAMED',
        '-d',a.out/'classes',here/'ProductionProbe.java',here/'QualificationProbe.java'])
    source=a.repo/'src/java.base/share/native/libinstant/InstantParser.c'
    for fault,macro in [('failure','INSTANT_SPEEDATE_FORCE_FAILURE'),('symbol','INSTANT_SPEEDATE_NO_SYMBOL'),('onload',None)]:
        target=a.out/(('instant_'+fault+'.dll') if windows else ('libinstant_'+fault+('.dylib' if mac else '.so')))
        src=source if macro else here/'OnLoad.c'
        if windows:
            cmd=['cl.exe','/nologo','/O2','/LD']+(['/D'+macro] if macro else [])+['/I'+str(a.enabled/'include'),
                '/I'+str(a.enabled/'include/win32'),'/Fo'+str(a.out/(fault+'.obj')),src,'/link','/OUT:'+str(target)]
        else:cmd=[os.environ.get('CC','cc'),'-O2','-dynamiclib' if mac else '-shared','-fPIC']+(['-D'+macro] if macro else [])+[
                '-I'+str(a.enabled/'include'),'-I'+str(a.enabled/('include/'+include)),src,'-o',target]
        invoke('compile-'+fault,cmd)
    expected_digest='a0c9818f610a52c4a5429fe59d286443efec207525cd6f1a64876f2bdd45ed8a'
    opens=['--add-opens','java.base/java.time=ALL-UNNAMED']
    routes=list(homes)
    for compact in [True,False]:
        for route in routes:
            native=route=='enabled'
            flags=['-Xcheck:jni','-Xlog:library=info']+opens+(['-Dprobe.native=true'] if native else [])
            text=java(f'correctness-{route}-{compact}',route,['ProductionProbe','test'],compact,flags=flags)
            correct('differential_checked=100308' in text and 'corpus_sha256='+expected_digest in text,'oracle mismatch')
            if native:correct('systematic_native_hits=49680' in text,'native route did not execute')
            if route in ['runtime-off','configured-off']:correct(not re.search(r'Loaded library [^\n]*instant\.(so|dylib|dll)',text),'disabled route loaded native library')
            text=java(f'corpus-audit-{route}-{compact}',route,['QualificationProbe','audit']+(['native'] if native else []),compact,flags=opens)
            current={line.split(',')[1]:int(line.split(',')[2]) for line in text.splitlines() if line.startswith('oracle,')}
            require(len(current)==7,'payload audit incomplete')
            if oracles:correct(current==oracles,'payload checksums differ')
            oracles=current
    for fault in ['missing','failure','symbol']:
        scratch=a.out/('fault-'+fault);shutil.copytree(a.enabled,scratch)
        target=scratch/libdir/lib;target.unlink()
        if fault!='missing':shutil.copyfile(a.out/(('instant_'+fault+'.dll') if windows else ('libinstant_'+fault+('.dylib' if mac else '.so'))),target)
        for compact in [True,False]:
            text=java(f'fault-{fault}-{compact}','enabled',['ProductionProbe','test'],compact,flags=['-Xcheck:jni'],home=scratch)
            correct('differential_checked=100308' in text and 'corpus_sha256='+expected_digest in text,'fault changed outcomes')
    for gc in ['Serial','G1','Z']:
        for compact in [True,False]:
            text=java(f'stress-{gc}-{compact}','enabled',['ProductionProbe','stress'],compact,gc,
                ['-Xcheck:jni','-Xlog:gc=info','-Dprobe.native=true']+opens,True)
            correct('concurrent_checked=90000' in text and 'native_coverage=hits,misses,epoch-floor' in text,'stress coverage missing')
            require(any('GC(' in line and '->' in line and 'Aborted' not in line for line in text.splitlines()),'no real completed GC')
    text=java('preboot','enabled',['ProductionProbe','bootstrap'],flags=opens+['--add-exports','java.base/jdk.internal.misc=ALL-UNNAMED',
        '-Xlog:library=info','-Djava.system.class.loader=ProductionProbe$EarlyLoader','-Xcheck:jni'])
    correct('bootstrap_checked=preboot-fallback,postboot-native' in text,'preboot regression')
    loads=list(re.finditer(r'Loaded library [^\n]*instant\.(so|dylib|dll)',text))
    correct(len(loads)==1 and text.index('postboot_parse_begin')<loads[0].start(),'incorrect bootstrap loading')
    text=java('cold-race','enabled',['ProductionProbe','race'],flags=opens+['-Xlog:library=info','-Xcheck:jni'])
    correct('cold_race_checked=8000' in text and len(re.findall(r'Loaded library [^\n]*instant\.(so|dylib|dll)',text))==1,'cold race regression')
    onload=a.out/('instant_onload.dll' if windows else ('libinstant_onload.dylib' if mac else 'libinstant_onload.so'))
    text=java('onload-race','enabled',['ProductionProbe','onload'],flags=opens+['--add-opens','java.base/jdk.internal.loader=ALL-UNNAMED',
        '--enable-native-access=ALL-UNNAMED','-Xcheck:jni','-Dprobe.onload.library='+str(onload.resolve()),
        '-Dprobe.parser.library='+str((a.enabled/libdir/lib).resolve())])
    correct('onload_race_checked=callback-fallback,post-load-native' in text,'onload regression')
    invoke('cds',[a.enabled/('bin/java'+exe),'-Xshare:on','-version'])
    # Separate compiler diagnostics, not throughput observations.
    for route in routes:
        for corpus in ['happy','mixed','fallback']:
            for compact in [True,False]:
                name=f'diagnostic-{route}-{corpus}-{compact}';xml=ev/(name+'.xml')
                text=java(name,route,['QualificationProbe','diagnostic',corpus],compact,flags=['-Xbatch',
                    '-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation','-XX:LogFile='+str(xml)])
                require(any('<nmethod ' in line and "compiler='c2'" in line and "method='QualificationProbe loop " in line for line in xml.read_text().splitlines()),'no diagnostic C2 loop')
                blocks(text,name,route,compact,'G1',corpus,-1,True)
    deadline=min(deadline,time.monotonic()+2700)
    for gc in ['G1','Serial','Z']:
        corpora=['happy','mostly','mixed','fallback','syntax','calendar','custom'] if gc=='G1' else ['happy','mixed','fallback']
        selected_routes=routes if gc=='G1' else ['baseline','enabled']
        for compact in [True,False]:
            for corpus in corpora:
                for fork in range(2):
                    order=selected_routes if fork==0 else list(reversed(selected_routes))
                    for route in order:
                        name=f'timing-{gc}-{compact}-{corpus}-{fork}-{route}'
                        text=java(name,route,['QualificationProbe','bench',corpus],compact,gc,['-Xbatch'])
                        blocks(text,name,route,compact,gc,corpus,fork)
    for gc in ['G1','Serial','Z']:
        for compact in [True,False]:
            gate(f'{gc}/{compact}: canonical <1.5x baseline','enabled',compact,gc,'happy','baseline',ratio=1/1.5)
            gate(f'{gc}/{compact}: canonical allocation reduction <90%','enabled',compact,gc,'happy','baseline',ratio=.10,field='bytes')
            if gc=='G1':
                gate(f'{compact}: canonical <1.25x Java control','enabled',compact,gc,'happy','cached',ratio=1/1.25)
                for corpus in ['mostly','mixed','fallback','syntax','calendar','custom']:
                    gate(f'{compact}/{corpus}: enabled >3% loss','enabled',compact,gc,corpus,'baseline',ratio=1.03)
                for route in ['runtime-off','configured-off']:
                    for corpus in ['happy','mostly','mixed','fallback','syntax','calendar','custom']:
                        gate(f'{compact}/{corpus}: {route} >3% loss',route,compact,gc,corpus,'baseline',ratio=1.03)
            else:
                for corpus in ['mixed','fallback']:
                    gate(f'{gc}/{compact}/{corpus}: >3% loss','enabled',compact,gc,corpus,'baseline',ratio=1.03)
            for corpus in (['happy','mostly','mixed','fallback','syntax','calendar','custom'] if gc=='G1' else ['happy','mixed','fallback']):
                for route in (['enabled','runtime-off','configured-off'] if gc=='G1' else ['enabled']):
                    gate(f'{gc}/{compact}/{corpus}: {route} allocation growth',route,compact,gc,corpus,'baseline',extra=1,field='bytes')
    deadline=min(a.started+10800,time.monotonic()+300)
    for compact in [True,False]:
        for corpus in ['happy','fallback','calendar']:
            for fork in range(10):
                order=routes[fork%len(routes):]+routes[:fork%len(routes)]
                for route in order:
                    name=f'cold-{compact}-{corpus}-{fork}-{route}'
                    text=java(name,route,['QualificationProbe','cold',corpus],compact)
                    wall=wall_times[name]
                    value=int(re.search(r'^cold,(\d+)$',text,re.MULTILINE).group(1))
                    cold.append(dict(route=route,compact=compact,corpus=corpus,fork=fork,parse_ns=value,wall_ns=wall))
    for compact in [True,False]:
        for corpus in ['happy','fallback','calendar']:
            for field in ['parse_ns','wall_ns']:
                b=statistics.median(r[field] for r in cold if (r['route'],r['compact'],r['corpus'])==('baseline',compact,corpus))
                for route in ['enabled','runtime-off','configured-off']:
                    value=statistics.median(r[field] for r in cold if (r['route'],r['compact'],r['corpus'])==(route,compact,corpus))
                    if value>b+max(.05*b,2000000):misses.append(f'cold/{compact}/{corpus}/{route}/{field}: budget exceeded')
    decision='NO-GO: '+json.dumps(misses) if misses else 'RUNTIME-GATES-PASS: owner must consolidate normal-build/provenance/inspection checks before target-only integration GO'
except CorrectnessFailure as error:decision='NO-GO: '+str(error)+'; correctness/safety failure, stop'
except KeyboardInterrupt as error:decision='INCONCLUSIVE: interrupted; command cleanup attempted; require whole-job teardown: '+str(error)
except Exception as error:decision='INCONCLUSIVE: '+str(error)+'; stop without retry or sample expansion'
finally:
    for name,data in [('blocks.csv',rows),('cold.csv',cold)]:
        if data:
            with (ev/name).open('w',newline='') as stream:
                w=csv.DictWriter(stream,fieldnames=list(data[0]),lineterminator='\n');w.writeheader();w.writerows(data)
    summaries=[]
    keys=list(dict.fromkeys((r['phase'],r['route'],r['compact'],r['gc'],r['corpus'],r['fork']) for r in rows))
    for key in keys:
        data=[r for r in rows if (r['phase'],r['route'],r['compact'],r['gc'],r['corpus'],r['fork'])==key]
        summaries.append(dict(zip(['phase','route','compact','gc','corpus','fork'],key),blocks=len(data),
            median_ns=statistics.median(r['ns'] for r in data),min_ns=min(r['ns'] for r in data),
            max_ns=max(r['ns'] for r in data),median_bytes=statistics.median(r['bytes'] for r in data)))
    if summaries:
        with (ev/'per-fork-summary.csv').open('w',newline='') as stream:
            w=csv.DictWriter(stream,fieldnames=list(summaries[0]),lineterminator='\n');w.writeheader();w.writerows(summaries)
    (ev/'events.json').write_text(json.dumps(events,indent=2)+'\n')
    (ev/'decision.txt').write_text(decision+'\n');print(decision,flush=True)
sys.exit(0 if decision.startswith('RUNTIME-GATES-PASS:') else 1 if decision.startswith('NO-GO:') else 2)
