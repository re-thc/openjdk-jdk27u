"""Plan/build/observe/compare full current-PR images. Default commands launch nothing."""
import argparse
import ctypes
import importlib.metadata
import json
import os
from pathlib import Path
import random
import re
import shutil
import signal
import struct
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

sys.dont_write_bytecode=True
from classifier_images import canonical,executed_binding,git,payload_manifest,record,require
from current_campaign_contract import REFS,KERNELS,STAGES,stage_caps,comparisons,observed,verify_plan,correctness,gate,require_clean,counts,validate_windows
from jtreg83_harness import inventory,harness_version
from tool_invocation import invocation_path,invocation_records,configure_paths
from build_classifier_image import toolchain
from native_source_qualify import cleanup_command,native_macho
from run_release_causal import HEADER,rows
from report_backend_candidate import decode_ordinary
from check_roundtrip_assembly import loops,check_conversion_loop

ROOT=Path(__file__).resolve().parents[2]
SOURCES=['PhaseVectorKernels.java','PhaseVectorProbe.java','FixedVectorProbe.java','ProbeControllerPrimer.java']

def tools_for(platform):
    if platform=='linux':
        tools=toolchain();taskset=shutil.which('taskset');require(taskset,'taskset is missing')
        tools['taskset']=invocation_path(taskset)
        return tools,None
    tools={n:invocation_path(subprocess.check_output(['xcrun','--find',n],text=True).strip()) for n in ['clang','clang++','ld','ar']}
    make=shutil.which('gmake') or shutil.which('make');require(make,'GNU make is missing')
    tools['make']=invocation_path(make)
    sdk=Path(subprocess.check_output(['xcrun','--show-sdk-path'],text=True).strip())
    settings=next((p for p in [sdk/'SDKSettings.json',sdk/'SDKSettings.plist'] if p.is_file()),None)
    require(settings,'SDK identity missing');tools['sdk-settings']=settings
    return tools,str(sdk)

def snapshot_tools(platform,boot):
    tools,sdk=tools_for(platform)
    for name in ['git','bash','autoconf','zip','unzip']:
        path=shutil.which(name);require(path,'Missing build tool: '+name);tools[name]=invocation_path(path)
    tools['python']=invocation_path(sys.executable)
    for n in ['bin/java','bin/javac','lib/modules','release']:tools['boot/'+n]=Path(boot)/n
    return dict(paths={n:str(p) for n,p in tools.items()},identities=invocation_records(tools),sdk=sdk)

def source_identity(repo,ref):
    return dict(head=git(repo,'rev-parse',ref),trees={n:git(repo,'rev-parse',ref+':'+n) for n in ['src','test','make','bin']},
                configure_blob=git(repo,'rev-parse',ref+':bin/configure-dev'))

def make_plan(a):
    require(sys.version_info>=(3,11),'Python3.11+ required')
    repo=a.product_repo.resolve();boot=a.boot_jdk.resolve();jtreg=a.jtreg.resolve();out=a.out.resolve()
    require(not out.exists() and not out.is_relative_to(repo) and not out.is_relative_to(ROOT),'Fresh external output required')
    configure_paths(dict(product=repo,harness=ROOT,boot=boot,jtreg=jtreg,output=out))
    tools=snapshot_tools(a.platform,boot)
    configure_paths(tools['paths'])
    if tools['sdk']:configure_paths({'sdk':tools['sdk']})
    sources={role:source_identity(repo,ref) for role,ref in REFS.items()}
    require(len({v['configure_blob'] for v in sources.values()})==1,'Reference configure profiles differ; explicit design needed')
    import capstone
    decoder=dict(version=importlib.metadata.version('capstone'),payload=payload_manifest(Path(capstone.__file__).parent))
    value=dict(schema=2,experiment='pr14-current-decision-v2',platform=a.platform,
        product_repo=str(repo),harness_root=str(ROOT),harness_head=git(ROOT,'rev-parse','HEAD'),
        harness_binding=executed_binding(ROOT),refs=REFS,source_identities=sources,tools=tools,
        boot=str(boot),jtreg=str(jtreg),harness_version=harness_version(jtreg),jars=inventory(jtreg),
        jtreg_payload=payload_manifest(jtreg),decoder=decoder,out=str(out),
        correctness=correctness(a.correctness_receipt,a.platform),pairs=12,windows=5,calls=100000,
        comparisons=comparisons(a.platform),observed=[[c,r] for c,r in observed(a.platform)],
        limits=dict(ratio=1.02,allocation=.01,bootstrap=20000),stages=STAGES,stage_caps=stage_caps(a.platform),
        builds='two full release images, no module overlays',automatic_retry=False,qualified=False,
        counts=counts(a.platform),affinity=sorted(os.sched_getaffinity(0)) if a.platform=='linux' else None,
        environment=dict(PATH=os.environ.get('PATH',''),python=sys.version,uname=list(os.uname())),
        history=dict(primer_kernel_calls=61001,zero_call_metadata_windows=1000,warmup_calls=10000,calibration_calls=1000),
        source_assets={n:record(ROOT/'qualification/src'/n) for n in SOURCES})
    value['sha256']=canonical(value);return verify_plan(value)

def native_image(root,platform):
    for name in ['bin/java','bin/javac','lib/server/libjvm.'+('dylib' if platform=='mac' else 'so')]:
        if platform=='mac':native_macho(Path(root)/name)
        else:
            with (Path(root)/name).open('rb') as stream:header=stream.read(20)
            require(header[:6]==b'\x7fELF\x02\x01' and len(header)==20 and
                struct.unpack('<H',header[18:20])[0]==183,'Expected native ELF64 AArch64: '+name)

class Session:
    def __init__(self,plan,stage):
        self.p=verify_plan(plan);self.stage=stage;self.out=Path(plan['out']);self.repo=Path(plan['product_repo'])
        self.end=time.monotonic()+plan['stage_caps'][stage];self.commands=[]
        self.env=dict(os.environ,PYTHONDONTWRITEBYTECODE='1',MAKE=plan['tools']['paths']['make'])
        cc,cxx=('clang','clang++') if plan['platform']=='mac' else ('gcc-16','g++-16')
        self.env.update(CC=plan['tools']['paths'][cc],CXX=plan['tools']['paths'][cxx])
        if plan['tools']['sdk']:self.env['SDKROOT']=plan['tools']['sdk']
        require(not any(os.environ.get(n) for n in ['JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS','CLASSPATH','CFLAGS','CXXFLAGS','LDFLAGS','CONFIGURE_DEV_NO_MOLD']), 'Unplanned inherited VM/build overrides')
        require(not any(os.environ.get(n) for n in ['MAKEFLAGS','MFLAGS','COMPILER_PATH','LIBRARY_PATH','CPATH','CPLUS_INCLUDE_PATH',
            'C_INCLUDE_PATH','LD_PRELOAD','LD_LIBRARY_PATH','DYLD_INSERT_LIBRARIES','DYLD_LIBRARY_PATH']),
            'Unplanned inherited tool/loader overrides')
        require((sys.platform=='darwin' and os.uname().machine=='arm64') if plan['platform']=='mac' else (sys.platform=='linux' and os.uname().machine=='aarch64'),'Matching native ARM required; no emulation')
        if plan['platform']=='linux':require(ctypes.CDLL(None).prctl(36,1,0,0,0)==0,'Child subreaper unavailable')
        self.invariant()
        if stage=='prepare':
            self.out.mkdir(parents=True,exist_ok=False)
            (self.out/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
        else:
            require(json.loads((self.out/'plan.json').read_text())==plan,'Stored plan changed')
        self.stage_dir=self.out/stage;self.stage_dir.mkdir(exist_ok=False)
        self.manifest=None
        if stage!='prepare':
            self.prepared=self.prerequisite('prepare')
            require(record(self.out/'inputs.json')==self.prepared['inputs_record'],'Prepared inputs manifest changed')
            self.manifest=json.loads((self.out/'inputs.json').read_text());self.verify_inputs(True)
    def prerequisite(self,stage):
        path=self.out/stage/'result.json';value=json.loads(path.read_text())
        require(value.get('passed') is True and value.get('plan_sha')==self.p['sha256'],stage+' prerequisite missing')
        return value
    def invariant(self):
        p=self.p
        require(Path(p['harness_root'])==ROOT and git(ROOT,'rev-parse','HEAD')==p['harness_head'] and executed_binding(ROOT)==p['harness_binding'],'Harness source changed')
        require({r:source_identity(self.repo,ref) for r,ref in REFS.items()}==p['source_identities'],'Product source objects differ')
        require(snapshot_tools(p['platform'],p['boot'])==p['tools'],'Tool invocation/identity changed')
        require(inventory(Path(p['jtreg']))==p['jars'] and payload_manifest(Path(p['jtreg']))==p['jtreg_payload'],'Harness distribution changed')
        import capstone
        require(dict(version=importlib.metadata.version('capstone'),payload=payload_manifest(Path(capstone.__file__).parent))==p['decoder'],'Decoder changed')
        require(correctness(p['correctness']['file'],p['platform'])==p['correctness'],'Correctness prerequisite changed')
        require(dict(PATH=os.environ.get('PATH',''),python=sys.version,uname=list(os.uname()))==p['environment'],
            'Host/tool search environment changed')
        if p['platform']=='linux':require(sorted(os.sched_getaffinity(0))==p['affinity'],'Host CPU affinity changed')
    def save(self):
        (self.stage_dir/'commands.json').write_text(json.dumps(self.commands,indent=2)+'\n')
    def run(self,name,argv,cwd=None,maximum=180):
        require(time.monotonic()<self.end,'Stage wall budget exhausted')
        # Per-process metadata checks are cheap; full bytes are checked at stage boundaries.
        if self.manifest:self.verify_inputs(False)
        log=self.stage_dir/(name+'.out');row=dict(name=name,argv=list(map(str,argv)),status='started');self.commands.append(row);self.save()
        with log.open('w') as stream:
            child=subprocess.Popen(row['argv'],cwd=cwd or self.stage_dir,env=self.env,stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
            try:
                row['exit_status']=child.wait(timeout=min(maximum,self.end-time.monotonic()))
                require(row['exit_status']==0,'Command failed: '+name)
                row['status']='passed'
            finally:
                # A deadline interrupt must still allow bounded group cleanup and evidence capture.
                remaining=signal.setitimer(signal.ITIMER_REAL,0)[0]
                try:
                    row['cleanup']=cleanup_command(child,self.p['platform'])
                    if self.p['platform']=='linux':
                        # Reap only this command's adopted descendants, never another group's children.
                        deadline=time.monotonic()+2
                        while True:
                            try:pid,status=os.waitpid(-child.pid,os.WNOHANG)
                            except ChildProcessError:break
                            if pid:continue
                            require(time.monotonic()<deadline,'Command descendants not reaped')
                            time.sleep(.02)
                finally:
                    stream.flush();row['output']=record(log);self.save()
                    if remaining:signal.setitimer(signal.ITIMER_REAL,max(.001,self.end-time.monotonic()))
        return log
    def verify_inputs(self,full):
        m=self.manifest
        if hasattr(self,'prepared'):
            require(record(self.out/'inputs.json')==self.prepared['inputs_record'],'Prepared inputs manifest changed')
        require(m['plan_sha']==self.p['sha256'],'Inputs belong to another plan')
        require(canonical(m['binding'])==m['binding_sha'],'Input binding changed')
        require(set(m['binding']['images'])==set(REFS),'Missing/extra full image')
        for role,item in m['binding']['images'].items():
            require_clean(Path(item['source']),REFS[role])
            require(record(Path(item['spec']))==item['spec_record'],'Build configuration changed')
            root=Path(item['root'])
            for name,saved in item['core_stat'].items():require(stat_record(root/name)==saved,'Image core metadata changed')
            if full:require(payload_manifest(root)==item['payload'],'Full source-appropriate image changed')
        require({str(path):record(path) for path in sorted(Path(m['binding']['classes']).rglob('*.class'))}==m['binding']['assets'],
            'Compiled class inventory changed')
        for name,saved in m['binding']['assets'].items():require(record(Path(name))==saved,'Compiled input changed')
    def finish(self,result):
        require(time.monotonic()<self.end,'Stage wall budget exhausted')
        self.invariant()
        if self.manifest:self.verify_inputs(True)
        result.update(plan_sha=self.p['sha256'],qualified=False)
        (self.stage_dir/'result.json').write_text(json.dumps(result,indent=2)+'\n')
        return result

def stat_record(path):
    s=path.stat();return dict(size=s.st_size,mtime=s.st_mtime_ns,ctime=s.st_ctime_ns,inode=s.st_ino,mode=s.st_mode)

def prepare(s):
    p=s.p;built={};make=p['tools']['paths']['make']
    native_image(p['boot'],p['platform'])
    version=s.run('make-version',[make,'--version']).read_text()
    require(re.search(r'GNU Make (?:[4-9]|[1-9][0-9]+)\.',version),'GNU make4+ required')
    version=s.run('jtreg-version',[Path(p['boot'])/'bin/java','-jar',Path(p['jtreg'])/'lib/jtreg.jar','-version']).read_text()
    require(p['harness_version'] in version,'jtreg runtime version differs')
    for role,ref in REFS.items():
        src=s.out/'sources'/role
        s.run(role+'-checkout',[p['tools']['paths']['git'],'-C',s.repo,'worktree','add','--detach',src,ref])
        args=['--with-conf-name=current-full','--with-debug-level=release','--with-jobs=1',
              '--with-boot-jdk='+p['boot'],'--with-jtreg='+p['jtreg'],'--with-native-debug-symbols=none','--disable-ccache']
        if p['platform']=='mac':args+=['--with-toolchain-type=clang','--with-sysroot='+p['tools']['sdk']]
        s.run(role+'-configure',[p['tools']['paths']['bash'],src/'bin/configure-dev',*args],cwd=src,maximum=600)
        s.run(role+'-build',[make,'CONF=current-full','JOBS=1','images'],cwd=src,maximum=3600)
        require_clean(src,ref);image=src/'build/current-full/images/jdk'
        vm='lib/server/libjvm.dylib' if p['platform']=='mac' else 'lib/server/libjvm.so'
        native_image(image,p['platform'])
        spec=src/'build/current-full/spec.gmk'
        built[role]=dict(root=str(image),source=str(src),spec=str(spec),spec_record=record(spec),
            configure=args,tool_invocations=p['tools'],payload=payload_manifest(image),
            core_stat={name:stat_record(image/name) for name in ['bin/java','bin/javac','lib/modules','release',vm]})
    classes=s.out/'classes';classes.mkdir()
    wb_source=Path(built['master']['source'])/'test/lib'
    javac=Path(built['candidate']['root'])/'bin/javac'
    s.run('compile-whitebox',[javac,'-sourcepath',wb_source,'-d',classes,wb_source/'jdk/test/whitebox/WhiteBox.java'])
    s.run('compile-frozen-inputs',[javac,'--add-modules=jdk.incubator.vector','-source','27','-target','27','-cp',classes,'-d',classes,
              *[ROOT/'qualification/src'/name for name in SOURCES]])
    binding=dict(images=built,classes=str(classes),assets={str(path):record(path) for path in sorted(classes.rglob('*.class'))},
                 probe_sources={name:record(ROOT/'qualification/src'/name) for name in SOURCES},
                 whitebox_source=dict(root=str(wb_source),source_ref=REFS['master']))
    # No per-reference recompilation: every observed/timed image consumes these bytes.
    m=dict(plan_sha=p['sha256'],binding=binding,binding_sha=canonical(binding));s.manifest=m
    (s.out/'inputs.json').write_text(json.dumps(m,indent=2)+'\n')
    return s.finish(dict(passed=True,full_images=2,classes_compiled_once=True,inputs_record=record(s.out/'inputs.json'),
                         compatibility='Pending complete separately observed scalar/ABI/ordinary-C2 assembly cohort'))

def launch_arguments(s,role,condition,name,diagnostic):
    header,sve,unroll,kernel=condition;m=s.manifest['binding'];image=Path(m['images'][role]['root']);classes=m['classes']
    argv=[] if s.p['platform']=='mac' else [s.p['tools']['paths']['taskset'],'-c',str(min(s.p['affinity']))]
    argv += [image/'bin/java','-Xms256m','-Xmx512m','-XX:ActiveProcessorCount=2','--add-modules=jdk.incubator.vector',
             '-DvectorBits=128','-DmeasureCalls='+str(1000 if diagnostic else 100000),'-Xbatch','-XX:-TieredCompilation',
             '-XX:CompileCommand=dontinline,FixedVectorProbe::invoke','-XX:CompileCommand=dontinline,PhaseVectorKernels::'+kernel,*HEADER[header]]
    if sve=='0':argv+=['-XX:UseSVE=0']
    if unroll!='default':argv+=['-XX:LoopMaxUnroll='+unroll]
    if diagnostic:
        argv+=['-DobserveCompilation=true','-XX:+UnlockDiagnosticVMOptions','-XX:+WhiteBoxAPI','-Xbootclasspath/a:'+classes,
               '-XX:+LogCompilation','-XX:LogFile='+str(s.stage_dir/(name+'.xml')),'-XX:+PrintFlagsFinal',
               '-XX:CompileCommand=print,PhaseVectorKernels::'+kernel,
               '-XX:CompileCommand=print,FixedVectorProbe::invoke','-XX:CompileCommand=print,FixedVectorProbe::window']
    argv+=['-cp',classes,'ProbeControllerPrimer',kernel,'c2']
    return argv

def launch(s,role,condition,name,diagnostic):
    kernel=condition[3];argv=launch_arguments(s,role,condition,name,diagnostic)
    path=s.run(name,argv);windows=[r for r in rows(path) if r['phase'].startswith('measure')]
    validate_windows(windows,kernel,diagnostic)
    return dict(name=name,windows=windows,checksum=windows[0]['checksum'],
        ns_per_op=sum(int(r['nanoseconds'])/int(r['calls']) for r in windows)/5,
        B_per_op=max(int(r['allocated_bytes'])/int(r['calls']) for r in windows))

def assembly(s):
    if s.stage=='controls-assembly':s.prerequisite('legacy')
    evidence=[]
    for condition,role in observed(s.p['platform'],s.stage):
        name=role+'-'+'-'.join(condition);launch(s,role,condition,name,True)
        tree=ET.parse(s.stage_dir/(name+'.xml'));text=(s.stage_dir/(name+'.out')).read_text()
        normal=[n.attrib for n in tree.findall('.//nmethod') if n.get('method')=='PhaseVectorKernels '+condition[3]+' (I)J' and n.get('compile_kind')!='osr']
        require(normal,'Ordinary-entry kernel missing')
        selected=normal[-1]
        require(not any(n.get('compile_id')==selected['compile_id'] for n in tree.findall('.//make_not_entrant')),'Selected ordinary entry is dead')
        code=decode_ordinary(text,selected);bodies=loops(code)
        applicable=condition[1]=='0' or bool(re.search(r'\bMaxVectorSize\s*:?=\s*16\b',text))
        if condition[1]=='default':require(re.search(r'\bUseSVE\s*:?=\s*[1-9]\d*\b',text),'Linux default SVE not exposed')
        if role=='candidate' and condition[3]=='conversion' and applicable:body=check_conversion_loop(bodies,name)
        else:body=max(bodies,key=lambda b:len(b['instructions']),default=None)
        require(body,'Kernel loop missing')
        callers=[n.attrib for n in tree.findall('.//nmethod') if n.get('method','').startswith('FixedVectorProbe ') and n.get('compile_kind')!='osr']
        # Preserve whatever caller code was actually emitted, never invent absent bytes.
        caller_code=[]
        for method in ['invoke','window']:
            choices=[n for n in callers if n['method'].split(' ')[1]==method]
            require(choices,'Caller ordinary entry missing: '+method+'; no timing admitted')
            require(not any(n.get('compile_id')==choices[-1]['compile_id'] for n in tree.findall('.//make_not_entrant')),
                'Selected ordinary caller entry is dead: '+method)
            caller_code.append(dict(method=method,nmethod=choices[-1],decoded=decode_ordinary(text,choices[-1])))
        evidence.append(dict(condition=condition,role=role,ordinary=selected,decoded=code,loop=body,callers=caller_code))
        (s.stage_dir/'assembly-evidence.json').write_text(json.dumps(evidence,indent=2)+'\n')
    return s.finish(dict(passed=True,observed_JVMs=len(evidence),frozen_workload_compatibility=True,
        scope='Separate observed ordinary release code; not code from timed JVMs'))

def timing(s):
    s.prerequisite(s.stage+'-assembly')
    if s.stage=='controls':s.prerequisite('legacy')
    specs=[r for r in comparisons(s.p['platform']) if r['stage']==s.stage];paired=[];rng=random.Random(8392077)
    for pair in range(12):
        shuffled=list(specs);rng.shuffle(shuffled)
        for spec in shuffled:
            ref=spec['reference'];order=[ref,'candidate'] if pair%2==0 else ['candidate',ref]
            key=ref+'-'+'-'.join(spec['condition']);results={}
            for role in order:results[role]=launch(s,role,spec['condition'],f'pair{pair:02d}-{role}-{key}',False)
            require(results[ref]['checksum']==results['candidate']['checksum'],'Paired scalar checksum mismatch')
            row=dict(comparison=spec,pair=pair,order=order,results=results);paired.append(row)
            with (s.stage_dir/'pairs.jsonl').open('a') as stream:stream.write(json.dumps(row)+'\n')
    result=gate(paired,specs);s.finish(result)
    require(result['passed'],'Paired gate failed; all samples retained, no retry')
    return result

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('operation',choices=['plan',*STAGES])
    p.add_argument('--product-repo',type=Path);p.add_argument('--boot-jdk',type=Path);p.add_argument('--jtreg',type=Path)
    p.add_argument('--correctness-receipt',type=Path);p.add_argument('--out',type=Path);p.add_argument('--platform',choices=['mac','linux'])
    p.add_argument('--plan',type=Path);p.add_argument('--execute',action='store_true');p.add_argument('--authorized-plan-sha')
    a=p.parse_args()
    if a.operation=='plan':
        require(all([a.product_repo,a.boot_jdk,a.jtreg,a.correctness_receipt,a.out,a.platform]),'Missing planning input')
        require(not a.execute,'Planning never executes workloads');print(json.dumps(make_plan(a),indent=2));return
    require(a.plan,'A saved immutable plan is required');plan=verify_plan(json.loads(a.plan.read_text()))
    if not a.execute:
        print(json.dumps(dict(operation=a.operation,plan_sha=plan['sha256'],counts=plan['counts'],executed=False,qualified=False),indent=2));return
    if a.operation in ['legacy','controls']:
        require(a.authorized_plan_sha==plan['sha256'],'Measured execution requires explicit matching plan-sha opt-in and separate actual authorization')
    def interrupted(signum,frame):raise TimeoutError('Stage interrupted; no retry')
    previous={sig:signal.signal(sig,interrupted) for sig in [signal.SIGTERM,signal.SIGALRM]}
    signal.setitimer(signal.ITIMER_REAL,plan['stage_caps'][a.operation])
    s=None
    try:
        s=Session(plan,a.operation)
        result=prepare(s) if a.operation=='prepare' else assembly(s) if a.operation.endswith('-assembly') else timing(s)
        print(json.dumps(dict(operation=a.operation,passed=result['passed'],qualified=False,plan_sha=plan['sha256'])))
    except BaseException as error:
        if s is not None:(s.stage_dir/'failure.json').write_text(json.dumps(dict(error=str(error),retry=False,qualified=False))+'\n')
        raise
    finally:
        signal.setitimer(signal.ITIMER_REAL,0)
        for sig,handler in previous.items():signal.signal(sig,handler)

if __name__=='__main__':main()
