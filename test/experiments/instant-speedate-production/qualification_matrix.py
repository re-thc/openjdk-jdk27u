#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Proposed, UNEXECUTED exact-image qualification. See QUALIFICATION.md."""
import argparse,csv,hashlib,json,math,os,platform,re,shutil,statistics,sys,time
from pathlib import Path
sys.dont_write_bytecode=True
from deadline import (TOTAL_SECONDS,LaunchHold,execute,fingerprint,image_files,
    validate_causal_report,validate_launch_audit,validate_provenance)
from prepare_java_control import control_source

p=argparse.ArgumentParser()
for field in ['repo','baseline','cached','enabled','configured-off','out']:p.add_argument('--'+field,type=Path,required=True)
p.add_argument('--started',type=float,required=True);p.add_argument('--candidate-sha',required=True)
p.add_argument('--provenance',type=Path,required=True);p.add_argument('--launch-audit',type=Path)
a=p.parse_args();a.out=a.out.resolve();a.out.mkdir(exist_ok=False)
here=Path(__file__).resolve().parent;ev=a.out/'evidence';ev.mkdir();global_deadline=a.started+TOTAL_SECONDS
deadline=min(global_deadline,time.monotonic()+1800)
windows=os.name=='nt';mac=platform.system()=='Darwin';exe='.exe' if windows else ''
lib='instant.dll' if windows else ('libinstant.dylib' if mac else 'libinstant.so')
libdir='bin' if windows else 'lib';include='win32' if windows else ('darwin' if mac else 'linux')
homes={'baseline':a.baseline,'cached':a.cached,'enabled':a.enabled,'runtime-off':a.enabled,'configured-off':a.configured_off}
rows=[];cold=[];oracles={};events=[];wall_times={};gate_events=[]
findings={'NO-GO':[],'HOLD':[],'INCONCLUSIVE':[]};completed=False
decision='INCONCLUSIVE: packet did not complete'
class CorrectnessFailure(Exception):pass
class UnstableComparison(Exception):pass
BAD_JVM=re.compile(r'(?m)^(?:Exception in thread "[^"]*" |Caused by: )?'
    r'(?:java\.lang\.)?AssertionError(?:[:\s]|$)|'
    r'WARNING in native method|FATAL ERROR in native method|'
    r'JNI DETECTED ERROR|A fatal error has been detected by the Java Runtime Environment')
def require(value,message):
    if not value:raise RuntimeError(message)
def correct(value,message):
    if not value:raise CorrectnessFailure(message)
def strongest_decision():
    for verdict in ['NO-GO','HOLD','INCONCLUSIVE']:
        if findings[verdict]:return verdict+': '+json.dumps(findings[verdict])
    return ('RUNTIME-GATES-PASS: owner must consolidate normal-build/provenance/inspection checks before target-only integration GO'
        if completed else 'INCONCLUSIVE: packet did not complete')
def checkpoint():
    global decision
    # Persist the strongest known verdict before larger raw-row/summary writes.
    decision=strongest_decision()
    path=ev/'decision.txt';temporary=path.with_suffix('.tmp')
    temporary.write_text(decision+'\n');temporary.replace(path)
    for name,data in [('blocks.csv',rows),('cold.csv',cold)]:
        if data:
            path=ev/name;temporary=path.with_suffix('.tmp')
            with temporary.open('w',newline='') as stream:
                writer=csv.DictWriter(stream,fieldnames=list(data[0]),lineterminator='\n')
                writer.writeheader();writer.writerows(data)
            temporary.replace(path)
    summaries=[]
    keys=list(dict.fromkeys((r['phase'],r['route'],r['compact'],r['gc'],r['corpus'],r['fork']) for r in rows))
    for key in keys:
        data=[r for r in rows if (r['phase'],r['route'],r['compact'],r['gc'],r['corpus'],r['fork'])==key]
        summaries.append(dict(zip(['phase','route','compact','gc','corpus','fork'],key),blocks=len(data),
            median_ns=statistics.median(r['ns'] for r in data),min_ns=min(r['ns'] for r in data),
            max_ns=max(r['ns'] for r in data),median_bytes=statistics.median(r['bytes'] for r in data)))
    if summaries:
        path=ev/'per-fork-summary.csv';temporary=path.with_suffix('.tmp')
        with temporary.open('w',newline='') as stream:
            writer=csv.DictWriter(stream,fieldnames=list(summaries[0]),lineterminator='\n')
            writer.writeheader();writer.writerows(summaries)
        temporary.replace(path)
    for name,value in [('events.json',events),('gate-events.json',gate_events),('findings.json',findings)]:
        path=ev/name;temporary=path.with_suffix('.tmp')
        temporary.write_text(json.dumps(value,indent=2)+'\n');temporary.replace(path)
def finding(verdict,message):
    if message not in findings[verdict]:findings[verdict].append(message)
    checkpoint()
def invoke(name,cmd,timeout=120):
    events.append(name);require(len(set(events))==len(events),'duplicate command name')
    print(name,flush=True)
    try:
        result=execute(cmd,ev/(name+'.log'),deadline,timeout,cwd=a.repo,
            launch_audit=a.launch_audit,started=a.started)
        wall_times[name]=result['wall_ns'];captured=result['stdout']
        if BAD_JVM.search(captured):
            raise CorrectnessFailure(name+': assertion/JNI misuse or JVM fatal-error diagnostic')
        return captured
    except Exception as error:
        captured=(ev/(name+'.log')).read_text() if (ev/(name+'.log')).exists() else ''
        if BAD_JVM.search(captured):
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
    checkpoint()
    correct(all(r['checksum']==oracles[corpus] for r in selected),name+': checksum mismatch')
    require(all(math.isfinite(r['ns']) and math.isfinite(r['bytes']) and r['bytes']>=0
        and r['compile_before']>=0 and r['compile_after']>=r['compile_before'] and r['gc_ms']>=0
        and (diagnostic or r['ns']>0) for r in selected),name+': invalid counters')
    require(max(r['bytes'] for r in selected)-min(r['bytes'] for r in selected)<=1,name+': allocation unstable')
    require(len({r[field] for r in selected for field in ['compile_before','compile_after']})==1,
        name+': measured compiler time changed')
    if not diagnostic:
        times=[r['ns'] for r in selected]
        require(max(times)/min(times)<=1.10,name+': timing max/min >1.10')
        require(0.95<=statistics.median(times[3:])/statistics.median(times[:3])<=1.05,name+': timing trend outside5%')
        require(all(r['gc_ms']<=0.10*r['ns']*500000/1e6 for r in selected),name+': GC time exceeds10%')
def median(route,compact,gc,corpus,field='ns',fork=None):
    return statistics.median(r[field] for r in rows if r['phase']=='timing' and
        (r['route'],r['compact'],r['gc'],r['corpus'])==(route,compact,gc,corpus) and (fork is None or r['fork']==fork))
def gate(name,route,compact,gc,corpus,reference=None,ratio=1,extra=0,field='ns',absolute=None):
    passes=[];values=[];limits=[]
    for fork in [0,1]:
        limit=absolute if absolute is not None else ratio*median(reference,compact,gc,corpus,field,fork)+extra
        value=median(route,compact,gc,corpus,field,fork);values.append(value);limits.append(limit);passes.append(value<=limit)
    verdict='PASS' if all(passes) else 'NO-GO' if not any(passes) else 'INCONCLUSIVE'
    gate_events.append(dict(name=name,verdict=verdict,values=values,limits=limits,field=field))
    if verdict!='PASS':finding(verdict,name+(': fork-dependent gate; no pooled-median rescue' if verdict=='INCONCLUSIVE' else ''))
    else:checkpoint()
def protected_gate(name,route,compact,gc,corpus):
    ratios=[median(route,compact,gc,corpus,fork=fork)/median('baseline',compact,gc,corpus,fork=fork) for fork in [0,1]]
    if all(r>1.03 for r in ratios):verdict='NO-GO'
    elif all(r>1 for r in ratios):verdict='HOLD'
    elif any(r>1 for r in ratios):verdict='INCONCLUSIVE'
    else:verdict='PASS'
    gate_events.append(dict(name=name,verdict=verdict,ratios=ratios,limit=1.03,
        reason='both forks lose' if verdict=='HOLD' else 'fork loss directions disagree' if verdict=='INCONCLUSIVE' else ''))
    if verdict!='PASS':finding(verdict,name+': '+json.dumps(ratios))
    else:checkpoint()
    # A consistent positive loss is already HOLD even if the 3% threshold is ambiguous.
    if all(r>1 for r in ratios) and any(r>1.03 for r in ratios) and not all(r>1.03 for r in ratios):
        finding('INCONCLUSIVE',name+': fork-dependent 3% gate')
def evaluate_group(gc,compact,corpus):
    before=len(findings['INCONCLUSIVE'])
    if corpus=='happy':
        gate(f'{gc}/{compact}: canonical <1.5x baseline','enabled',compact,gc,corpus,'baseline',ratio=1/1.5)
        gate(f'{gc}/{compact}: canonical allocation reduction <90%','enabled',compact,gc,corpus,'baseline',ratio=.10,field='bytes')
        if gc=='G1':gate(f'{compact}: canonical <1.25x Java control','enabled',compact,gc,corpus,'cached',ratio=1/1.25)
    elif gc=='G1' or corpus in ['mixed','fallback']:
        protected_gate(f'{gc}/{compact}/{corpus}: enabled loss','enabled',compact,gc,corpus)
    if gc=='G1':
        for route in ['runtime-off','configured-off']:protected_gate(f'{compact}/{corpus}: {route} loss',route,compact,gc,corpus)
    for route in (['enabled','runtime-off','configured-off'] if gc=='G1' else ['enabled']):
        gate(f'{gc}/{compact}/{corpus}: {route} allocation growth',route,compact,gc,corpus,'baseline',extra=1,field='bytes')
    if len(findings['INCONCLUSIVE'])>before:raise UnstableComparison('fork disagreement; stop without sample expansion')

try:
    audit=validate_launch_audit(a.launch_audit,a.started,a.candidate_sha,a.out.parent)
    causal=audit.get('causal_report')
    if not causal or fingerprint(causal['path'])!=causal:
        raise LaunchHold('HOLD: full qualification requires the audited candidate-bound causal PASS')
    validate_causal_report(causal['path'],a.candidate_sha)
    provenance=validate_provenance(a.provenance,root=a.out.parent,candidate_sha=a.candidate_sha,
        started=a.started,variants=['baseline','cached','enabled','configured-off'])
    require(provenance['candidate_sha']==a.candidate_sha and provenance['started_monotonic']==a.started
        and Path(provenance['root']).resolve()==a.out.parent,'provenance belongs to another packet')
    provenance_identity=fingerprint(a.provenance);launch_identity=fingerprint(a.launch_audit)
    checkpoint()
    observed=invoke('candidate-head',['git','rev-parse','HEAD']).splitlines()[-1]
    require(observed==a.candidate_sha,'candidate revision changed')
    require(not invoke('candidate-status',['git','status','--porcelain']).strip(),'candidate checkout is dirty')
    require(0<=time.monotonic()-a.started<TOTAL_SECONDS,'invalid or expired packet start clock')
    source_ids={}
    for name in ['ProductionProbe.java','OnLoad.c','QualificationProbe.java','prepare_java_control.py',
                 'deadline.py','qualification_matrix.py','disabled_comparison.py','launch_qualification.sh',
                 'job_entry.py','build_and_qualify.sh','QUALIFICATION.md']:
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
    ordinary_tests=' '.join(['test/jdk/java/time/test/java/time/TestInstant.java',
        'test/jdk/java/time/tck/java/time/TCKInstant.java','test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java'])
    candidate_tests='test/jdk/java/time/test/java/time/TestInstantSpeedate.java '+ordinary_tests+' test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java'
    test_options=['TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m',
        'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0']
    contracts={f'images-{v}':(v,['make','CONF=qualification','JOBS=4','images'],'make') for v in ['baseline','cached','enabled','configured-off']}
    for variant in ['enabled','configured-off','cached']:
        contracts['junit-'+variant]=(variant,['make','CONF=qualification','JOBS=1','run-test',
            'TEST='+(ordinary_tests if variant=='cached' else candidate_tests)]+test_options,'make')
    rust=provenance['rust']
    contracts['rust-tests']=('enabled',['env','-u','CARGO_ENCODED_RUSTFLAGS','CARGO_BUILD_JOBS=2',
        'RUSTC='+rust['rustc'],'RUSTFLAGS=-C target-cpu='+rust['cpu']+' -C panic=unwind',rust['cargo'],
        'test','--frozen','--manifest-path','src/java.base/share/native/libinstant/rust/Cargo.toml',
        '--target',rust['target'],'--target-dir',str(a.out.parent/'rust-tests')],'env')
    for name,(variant,command,tool) in contracts.items():
        receipt=json.loads((build_logs/(name+'.log.receipt.json')).read_text())
        require(receipt.get('schema')==2 and receipt['exit_status']==0
            and a.started<=provenance['created_monotonic']<=receipt['started_monotonic']<=time.monotonic()
            and receipt['packet_started_monotonic']==a.started and receipt['deadline']<=global_deadline
            and receipt['timeout_seconds']==(1800 if name.startswith('images-') else 600),
            name+': missing fresh successful normal-build/check receipt')
        require(Path(receipt['cwd']).resolve()==(a.out.parent/variant).resolve(),name+': receipt belongs to another checkout')
        require(receipt['command']==command,name+': unexpected normal build/check command')
        require(receipt['provenance']==provenance_identity and receipt['launch_audit']==launch_identity,
            name+': wrong toolchain/configuration/launch provenance')
        expected_tool=provenance['files']['tool:'+tool]
        require(all(receipt['executable'][key]==expected_tool[key] for key in ['resolved','sha256']),name+': wrong command executable')
        require(receipt['capture_helper']['sha256']==source_ids['deadline.py'],name+': receipt produced by another deadline helper')
        require(receipt['cargo_encoded_rustflags'] is None,name+': encoded Cargo flags were inherited')
        if name.startswith('images-') or name.startswith('junit-'):
            expected_image=image_files(a.out.parent/variant)
            require(receipt['image_after']==expected_image,name+': image hash changed after build/check')
            if name.startswith('junit-'):require(receipt['image_before']==expected_image,name+': test used another image')
    checkpoint()
    identities={}
    for route,home in homes.items():
        checkout=a.out.parent/('enabled' if route=='runtime-off' else route)
        identities[route]=image_files(checkout)
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
    deadline=min(global_deadline,time.monotonic()+5400)
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
                # Evaluate a complete pair now, so later failures cannot erase a known miss/HOLD.
                evaluate_group(gc,compact,corpus)
    deadline=min(global_deadline,time.monotonic()+300)
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
                    checkpoint()
            for field in ['parse_ns','wall_ns']:
                b=statistics.median(r[field] for r in cold if (r['route'],r['compact'],r['corpus'])==('baseline',compact,corpus))
                for route in ['enabled','runtime-off','configured-off']:
                    value=statistics.median(r[field] for r in cold if (r['route'],r['compact'],r['corpus'])==(route,compact,corpus))
                    if value>b+max(.05*b,2000000):finding('NO-GO',f'cold/{compact}/{corpus}/{route}/{field}: budget exceeded')
    require(time.monotonic()<=global_deadline,'whole packet budget exhausted')
    completed=True
except LaunchHold as error:finding('HOLD',str(error))
except CorrectnessFailure as error:finding('NO-GO',str(error)+'; correctness/safety failure, stop')
except KeyboardInterrupt as error:finding('INCONCLUSIVE','interrupted; command cleanup attempted; require whole-job teardown: '+str(error))
except Exception as error:finding('INCONCLUSIVE',str(error)+'; stop without retry or sample expansion')
finally:
    checkpoint();print(decision,flush=True)
sys.exit(0 if decision.startswith('RUNTIME-GATES-PASS:') else 1 if decision.startswith('NO-GO:') else 3 if decision.startswith('HOLD:') else 2)
