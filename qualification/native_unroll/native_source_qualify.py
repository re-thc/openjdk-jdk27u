"""One native ARM source-to-qualification sequence. Default: print plan, execute nothing."""
import argparse
import ctypes
import json
import os
import re
from pathlib import Path
import shutil
import signal
import subprocess
import struct
import sys
import time

sys.dont_write_bytecode=True

from classifier_images import git, pins, source_binding, payload_manifest, record, require
from build_classifier_image import cleanup_group, toolchain
from jtreg83_harness import inventory,harness_version
import focused_native

BASE='87edd79d3104ff502f7befec034716b081436f49'
B3='b3ce67e362c3b1678fcf3d18ee714182b2395c86'
def vm_file(target): return 'lib/server/libjvm.dylib' if target=='mac' else 'lib/server/libjvm.so'

def image_files(target): return ('bin/java','bin/javac',vm_file(target),'lib/modules','release')
STAGES=[('reference-debug-build',5400),('harness-compatibility',600),
        ('reference-release-builds-and-overlays',15000),('compile-common-inputs',600),
        ('correctness-ir-stress',6000),('original-reference-release',5400),('release-assembly',7200),
        ('legacy-recovery',3600),('compact-and-controls-retention',14400),('full-suites-phases-gaps',57600)]


def budget(target,scope):
    return 14400 if scope=='focused' else (21600 if target=='mac' else 25200) if scope=='assembly' else 86400 if target=='mac' else 129600

def build_names(scope):
    if scope=='focused':return ['b3 fastdebug full image','classifier fastdebug HotSpot-only overlay']
    if scope=='assembly':return ['b3 fastdebug compatibility image','b3 release full image','classifier release HotSpot-only overlay']
    return ['b3 fastdebug full image','b3 release full image','classifier release HotSpot-only overlay','classifier fastdebug HotSpot-only overlay']+(['base87 release image after correctness'] if scope=='complete' else [])

def stages(target,scope):
    if scope=='focused':return {'reference-debug-build':5400,'harness-compatibility':600,'candidate-debug-overlay':4800,'focused-semantics-ir':1200}
    if scope=='assembly':return {'reference-debug-build':5400,'harness-compatibility':600,'reference-release-builds-and-overlays':10200,'compile-common-inputs':600,'release-assembly':3600 if target=='mac' else 4200}
    caps=dict(STAGES)
    if target=='mac':caps.update({'correctness-ir-stress':3600,'release-assembly':3600,'legacy-recovery':1800,'compact-and-controls-retention':7200,'full-suites-phases-gaps':28800})
    if scope=='correctness':
        for name in ['original-reference-release','release-assembly','legacy-recovery','compact-and-controls-retention']:caps.pop(name)
    return caps

def plan(root,out,jtreg,boot,target='linux',scope='complete'):
    return dict(experiment='pr14-native-source-v1',source_head=git(root,'rev-parse','HEAD'),
        platform=target,scope=scope,historical_linux_recovery_claim=False,
        native_host='macOS arm64 / Apple Silicon, NEON only' if target=='mac' else 'Linux aarch64 with enabled SVE; no emulation',
        required_tools=['JDK27 boot image','installed harness satisfying suite minimum 8.2.1+1','Xcode/clang and make' if target=='mac' else 'gcc16/binutils/mold/make/taskset','Python 3.11+; capstone for assembly/complete scopes'],
        harness=str(jtreg),boot_jdk=str(boot),output=str(out),max_seconds=budget(target,scope),
        references={'base87':BASE,'b3':B3,'candidate_product':pins()['product_head']},
        builds=build_names(scope),
        stages=[dict(name=n,maximum_seconds=s) for n,s in stages(target,scope).items()],
        fail_fast='Any harness, source/image, correctness/IR, stress or assembly failure stops timing; any recovery bound failure stops retention/full suites. No automatic retries/resume.',
        performance=dict(primary_comparisons=0 if scope!='complete' else 15 if target=='mac' else 30,pairs_each=12,maximum_timed_JVMs=0 if scope!='complete' else 360 if target=='mac' else 720,assembly_JVMs=(14 if target=='mac' else 28) if scope=='assembly' else 0 if scope!='complete' else 18 if target=='mac' else 36,
            process_windows=5,calls_per_window=100000,upper_paired_95_ratio=1.02,
            compact_conversion_upper_ratio_vs_original='strictly below1',maximum_bytes_per_call=0.01,
            uncertainty='adjacent balanced AB/BA process pairs,20000 pair bootstraps; no condition pooling'),
        private_inputs_required=False,automatic_downloads=False,hosted_CI_launch=False,
        executed=False,qualified=False)


def cleanup_command(child,target):
    if target=='linux':return cleanup_group(child)
    try:os.killpg(child.pid,signal.SIGTERM)
    except ProcessLookupError:pass
    try:child.wait(timeout=2)
    except subprocess.TimeoutExpired:
        try:os.killpg(child.pid,signal.SIGKILL)
        except ProcessLookupError:pass
        child.wait(timeout=5)
    try:os.killpg(child.pid,signal.SIGKILL)
    except ProcessLookupError:pass
    end=time.monotonic()+5
    while True:
        try:os.killpg(child.pid,0)
        except ProcessLookupError:return dict(pgid=child.pid,remaining_process_group=False)
        require(time.monotonic()<end,'Mac child process group did not terminate')
        time.sleep(0.02)


class Campaign:
    def __init__(self,root,out,jtreg,boot,target='linux',scope='complete'):
        self.root,self.out,self.jtreg,self.boot=root,out,jtreg,boot
        self.target,self.scope=target,scope
        self.maximum_seconds=budget(target,scope)
        self.deadline=time.monotonic()+self.maximum_seconds
        self.stage_deadline=self.deadline
        self.commands=[]
        self.harness=payload_manifest(jtreg)
        self.harness_jars=inventory(jtreg)
        self.selected_harness_version=harness_version(jtreg)
        self.reuse={}
        if target=='mac':
            self.tools={n:Path(subprocess.check_output(['xcrun','--find',n],text=True).strip()).resolve() for n in ['clang','clang++','ld','ar']}
            make=shutil.which('gmake') or shutil.which('make')
            require(make is not None,'GNU make4 or newer is required (gmake on macOS)')
            self.tools['make']=Path(make).resolve()
        else:self.tools=toolchain()
        self.env=dict(os.environ,PYTHONDONTWRITEBYTECODE='1',CC=str(self.tools['clang' if target=='mac' else 'gcc-16']),CXX=str(self.tools['clang++' if target=='mac' else 'g++-16']))
        self.env['MAKE']=str(self.tools['make'])
        self.sdk=None
        if target=='mac':
            sdk=Path(subprocess.check_output(['xcrun','--show-sdk-path'],text=True).strip())
            settings=next((p for p in [sdk/'SDKSettings.json',sdk/'SDKSettings.plist'] if p.is_file()),None)
            require(settings is not None,'SDK identity settings missing')
            self.sdk=dict(root=str(sdk),settings=str(settings),record=record(settings))
            self.env['SDKROOT']=str(sdk)
        for name in ['bin/java','bin/javac','lib/modules','release']:self.tools['boot/'+name]=boot/name
        if self.sdk:self.tools['sdk/settings']=Path(self.sdk['settings'])
        self.tool_records={k:record(v) for k,v in self.tools.items()}
        self.images={}
        self.builds={}
    def save(self):
        (self.out/'campaign.json').write_text(json.dumps(dict(experiment='pr14-native-source-v1',
            source_head=git(self.root,'rev-parse','HEAD'),platform=self.target,scope=self.scope,sdk=self.sdk,harness_version=self.selected_harness_version,harness_jars=self.harness_jars,harness_payload=self.harness,commands=self.commands,images=self.images,builds=self.builds,tools=self.tool_records,
            qualified=False),indent=2)+'\n')
    def invariant(self):
        if self.sdk:require(record(Path(self.sdk['settings']))==self.sdk['record'],'Mac SDK changed')
        require(payload_manifest(self.jtreg)==self.harness and inventory(self.jtreg)==self.harness_jars,'Common harness changed')
        require({k:record(v) for k,v in self.tools.items()}==self.tool_records,'Common toolchain changed')
        require(not git(self.root,'status','--porcelain','--','src','test','make','bin','qualification','.github/workflows'),
                'Reviewed source changed')
    def stage(self,name):
        self.invariant()
        self.stage_deadline=min(self.deadline,time.monotonic()+stages(self.target,self.scope)[name])
    def run(self,name,args,cwd=None):
        self.invariant()
        remaining=min(self.deadline,self.stage_deadline)-time.monotonic()
        require(remaining>0,'Campaign/stage budget exhausted')
        log=self.out/(name+'.log')
        row=dict(name=name,argv=[str(x) for x in args],cwd=str(cwd or self.root),timeout_seconds=remaining,status='started')
        self.commands.append(row);self.save()
        with log.open('w') as stream:
            child=subprocess.Popen(row['argv'],cwd=cwd or self.root,env=self.env,
                                   stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
            try:
                rc=child.wait(timeout=remaining)
                row.update(exit_status=rc,status='passed' if rc==0 else 'failed')
                require(rc==0,'Stage command failed: '+name)
            finally:
                signal.setitimer(signal.ITIMER_REAL,0)
                row['cleanup']=cleanup_command(child,self.target)
                while True:
                    try:
                        pid,_=os.waitpid(-1,os.WNOHANG)
                        if pid==0:break
                    except ChildProcessError:break
                row['log']=record(log);self.save()
                remaining_global=self.deadline-time.monotonic()
                require(remaining_global>0,'Campaign wall budget exhausted after cleanup')
                signal.setitimer(signal.ITIMER_REAL,remaining_global)
        self.invariant()
    def configure_arguments(self,level):
        return (['--with-toolchain-type=clang','--with-sysroot='+self.sdk['root']] if self.target=='mac' else [])+['--with-conf-name=source-qualification','--with-debug-level='+level,
            '--with-boot-jdk='+str(self.boot),'--with-jtreg='+str(self.jtreg),
            '--with-native-debug-symbols=none','--with-jobs=1']
    def load_reuse(self,directory):
        saved=json.loads((Path(directory)/'campaign.json').read_text())
        require(saved['source_head']==git(self.root,'rev-parse','HEAD') and saved['platform']==self.target,
                'Reuse source/platform differs')
        require(saved['tools']==self.tool_records and saved['sdk']==self.sdk and
                saved['harness_jars']==self.harness_jars and saved['harness_payload']==self.harness,
                'Reuse tool/SDK/harness identities differ')
        for key,image in saved['images'].items():
            receipt=saved['builds'][key];role,level=key.rsplit('-',1)
            expected=B3 if role=='b3' else BASE if role=='base87' else git(self.root,'rev-parse','HEAD')
            source=Path(receipt['source_dir']);spec=Path(receipt['spec_path'])
            require(receipt['source_head']==expected and git(source,'rev-parse','HEAD')==expected and
                    not git(source,'status','--porcelain','--','src','test','make','bin','configure'),
                    'Reuse source worktree differs: '+key)
            require(receipt['configure_arguments']==self.configure_arguments(level) and
                    record(spec)==receipt['spec'] and receipt['same_tools']==self.tool_records,
                    'Reuse configuration differs: '+key)
            require(self.image(Path(image['root']))==image and payload_manifest(Path(image['root']))==receipt['image_payload'],
                    'Reuse image payload differs: '+key)
            self.reuse[key]=(image,receipt,str(Path(directory).resolve()))
    def image(self,path):
        if self.target=='mac':
            for name in ['bin/java','bin/javac',vm_file('mac')]:native_macho(path/name)
        return dict(root=str(path),files={n:record(path/n) for n in image_files(self.target)})
    def build(self,role,ref,level,template=None):
        key=role+'-'+level
        if key in self.reuse:
            image,receipt,origin=self.reuse[key]
            self.images[key]=image;self.builds[key]={**receipt,'reused_from':origin};self.save()
            return Path(image['root']),Path(receipt['spec_path'])
        src=self.out/'sources'/key
        self.run(key+'-checkout',['git','worktree','add','--detach',src,ref])
        require(record(src/'bin/configure-dev')==record(self.root/'bin/configure-dev'),'Configure profile differs')
        require(git(src,'rev-parse','HEAD')==git(self.root,'rev-parse',ref),'Worktree source differs')
        conf='source-qualification';make_target='hotspot' if template else 'images'
        self.run(key+'-configure',['bash',src/'bin/configure-dev',*self.configure_arguments(level)],cwd=src)
        self.run(key+'-build',[self.tools['make'],'CONF='+conf,make_target],cwd=src)
        if template:
            image=self.out/'images'/key
            shutil.copytree(template,image,symlinks=True)
            before=payload_manifest(image)
            shutil.copy2(src/('build/'+conf+'/support/modules_libs/java.base/server/'+Path(vm_file(self.target)).name),image/vm_file(self.target))
            after=payload_manifest(image);vm=vm_file(self.target)
            require(set(before)==set(after) and before[vm]!=after[vm] and all(before[n]==after[n] for n in before if n!=vm),'Unexpected template overlay delta')
        else:image=src/('build/'+conf+'/images/jdk')
        require(not git(src,'status','--porcelain','--','src','test','make','bin','configure'),'Build changed tracked source')
        self.images[key]=self.image(image)
        self.builds[key]=dict(source_head=git(src,'rev-parse','HEAD'),src_tree=git(src,'rev-parse','HEAD:src'),
            target=make_target,spec=record(src/('build/'+conf+'/spec.gmk')),same_tools=self.tool_records,
            source_dir=str(src),spec_path=str(src/('build/'+conf+'/spec.gmk')),
            configure_arguments=self.configure_arguments(level),image_payload=payload_manifest(image),
            template=str(template) if template else None)
        self.save();return image,src/('build/'+conf+'/spec.gmk')
    def python(self,name,module,args):
        self.run(name,[sys.executable,self.root/'qualification/native_unroll'/module,*args])


def compile_inputs(c,candidate):
    frozen=c.out/'inputs';wb=frozen/'qualification/whitebox';classes=frozen/'qualification/classes'
    controller=c.out/'controller'
    for p in [wb,classes,controller]:p.mkdir(parents=True)
    c.run('compile-whitebox',[candidate/'bin/javac','-sourcepath',c.root/'test/lib','-d',wb,
        c.root/'test/lib/jdk/test/whitebox/WhiteBox.java'])
    names=['PhaseVectorKernels.java','PhaseVectorProbe.java','FixedVectorProbe.java','ProbeControllerPrimer.java']
    c.run('compile-kernels',[candidate/'bin/javac','--add-modules=jdk.incubator.vector','-cp',wb,'-d',classes,
        *[c.root/'qualification/src'/n for n in names[:2]]])
    c.run('compile-controller',[candidate/'bin/javac','--add-modules=jdk.incubator.vector','-cp',str(wb)+os.pathsep+str(classes),
        '-d',controller,*[c.root/'qualification/src'/n for n in names[2:]]])
    value=dict(schema=1,experiment='pr14-native-source-v1',scope='assembly' if c.scope=='assembly' else 'correctness',platform=c.target,source_head=git(c.root,'rev-parse','HEAD'),
        frozen=str(frozen),controller=str(controller),same_toolchain=True,images=c.images,
        build_toolchain=c.tool_records,build_receipts=c.builds,
        sources={str(p.relative_to(c.root)):record(p) for p in [*[c.root/'qualification/src'/n for n in names],
                    c.root/'test/lib/jdk/test/whitebox/WhiteBox.java']},
        payloads={n:payload_manifest(p) for n,p in [('classes',classes),('whitebox',wb),('controller',controller)]},
        kernel_classes={n+'.class':record(classes/(n+'.class'))['sha256'] for n in ['PhaseVectorKernels','PhaseVectorProbe']},
        controller_classes={n+'.class':record(controller/(n+'.class'))['sha256'] for n in ['FixedVectorProbe','ProbeControllerPrimer']},
        product_files=pins()['product_delta'],javac_image=c.image(candidate))
    path=c.out/'source-inputs-correctness.json';path.write_text(json.dumps(value,indent=2)+'\n')
    return frozen,controller,path



def complete_manifest(c,previous):
    value=json.loads(Path(previous).read_text())
    value.update(scope='complete',images=c.images,build_receipts=c.builds)
    path=c.out/'source-inputs-complete.json'
    path.write_text(json.dumps(value,indent=2)+'\n')
    return path


def native_macho(path):
    with Path(path).open('rb') as stream:header=stream.read(8)
    require(header[:4]==b'\xcf\xfa\xed\xfe' and len(header)==8 and
            struct.unpack('<I',header[4:8])[0]==0x0100000c,'Expected native Mach-O arm64: '+str(path))


def execute(root,out,jtreg,boot,target='linux',scope='complete',reuse=None):
    require(sys.version_info>=(3,11),'Python 3.11 or newer required')
    if target=='mac':
        for name in ['bin/java','bin/javac','lib/server/libjvm.dylib']:native_macho(boot/name)
    require((sys.platform=='darwin' and os.uname().machine=='arm64') if target=='mac' else (sys.platform=='linux' and os.uname().machine=='aarch64'),'Matching native ARM host required')
    require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS','CLASSPATH')), 'Inherited JVM/classpath options')
    if scope in ('assembly','complete'):
        import capstone  # Fail before building if the required assembly decoder is absent.
        require(hasattr(capstone,'CS_ARCH_ARM64') and hasattr(capstone,'CS_MODE_ARM'),'Compatible capstone ARM64 decoder API required')
    if target=='linux':require(ctypes.CDLL(None).prctl(36,1,0,0,0)==0,'Cannot enable child subreaper')
    require(not out.is_relative_to(root),'Output must be outside the checkout')
    out.mkdir(parents=True,exist_ok=False);(out/'sources').mkdir();(out/'images').mkdir()
    source_binding(root,pins())
    inventory(jtreg)
    c=Campaign(root,out,jtreg,boot,target,scope)
    if reuse:c.load_reuse(reuse)
    (out/'plan.json').write_text(json.dumps(plan(root,out,jtreg,boot,target,scope),indent=2)+'\n')
    def interrupted(signum,frame):raise TimeoutError('Campaign interrupted; no retry')
    old=signal.signal(signal.SIGTERM,interrupted)
    old_alarm=signal.signal(signal.SIGALRM,interrupted);signal.setitimer(signal.ITIMER_REAL,c.maximum_seconds)
    try:
        # Cheap harness identity/version admission precedes all builds. Full smoke precedes overlays.
        c.stage('reference-debug-build')
        c.run('make-version',[c.tools['make'],'--version'])
        require(re.search(r'GNU Make (?:[4-9]|[1-9][0-9]+)\.',(out/'make-version.log').read_text()),'GNU make 4 or newer required')
        c.run('harness-version',[boot/'bin/java','-jar',jtreg/'lib/jtreg.jar','-version'])
        require(harness_version(jtreg) in (out/'harness-version.log').read_text(),'Harness runtime version differs')
        c.run('host-default-SVE',[boot/'bin/java','-XX:+PrintFlagsFinal','-version'])
        text=(out/'host-default-SVE.log').read_text()
        require(re.search(r'\bUseSVE\s*:?=\s*0\b' if target=='mac' else r'\bUseSVE\s*:?=\s*[1-9]\d*\b',text),'Required native ISA coverage unavailable')
        debug,spec=c.build('b3',B3,'fastdebug')
        c.stage('harness-compatibility')
        c.python('harness-smoke','jtreg83_harness.py',['smoke','--image',jtreg,'--jdk',boot,
            '--debug-jdk',debug,'--debug-spec',spec,'--out',out/'harness-smoke','--execute'])
        if scope=='focused':
            c.stage('candidate-debug-overlay')
            candidate_debug,_=c.build('candidate',git(root,'rev-parse','HEAD'),'fastdebug',debug)
            c.stage('focused-semantics-ir');focused_native.run(c,debug,candidate_debug)
            (out/'qualification-result.json').write_text(json.dumps(dict(passed=True,qualified=False,platform=target,
                scope='focused',release_assembly=False,full_suites=False,timing_executed=False,
                historical_linux_recovery_claim=False,evidence=['harness-smoke/result.json','focused/gate.json']),indent=2)+'\n')
            return
        c.stage('reference-release-builds-and-overlays')
        b3,_=c.build('b3',B3,'release')
        base=None
        candidate,_=c.build('candidate',git(root,'rev-parse','HEAD'),'release',b3)
        if scope=='assembly':
            c.stage('compile-common-inputs');frozen,controller,manifest=compile_inputs(c,candidate)
            timing=['--b3-jdk',b3,'--rebuilt-b3-jdk',b3,'--candidate-jdk',candidate,'--frozen',frozen,
                '--controller',controller,'--source-input-manifest',manifest,'--source',root,'--platform',target,
                '--mode','assembly','--stage','assembly','--assembly-pair-only','--out',out/'assembly','--execute']
            c.stage('release-assembly');c.python('assembly','run_roundtrip_candidate.py',timing)
            c.python('assembly-gate','check_roundtrip_assembly.py',[out/'assembly','--platform',target,'--pair-only'])
            require(json.loads((out/'assembly/installed-assembly-gate.json').read_text())['passed'],'Assembly gate failed')
            (out/'qualification-result.json').write_text(json.dumps(dict(passed=True,qualified=False,platform=target,
                scope='assembly',timing_executed=False,full_suites=False,historical_linux_recovery_claim=False,
                evidence=['harness-smoke/result.json','assembly/installed-assembly-gate.json']),indent=2)+'\n')
            return
        candidate_debug,_=c.build('candidate',git(root,'rev-parse','HEAD'),'fastdebug',debug)
        c.stage('compile-common-inputs');frozen,controller,manifest=compile_inputs(c,candidate)
        shared=['--release-jdk',candidate,'--debug-jdk',candidate_debug,'--jtreg',jtreg,'--frozen',frozen,
                '--source-input-manifest',manifest,'--platform',target,'--execute']
        c.stage('correctness-ir-stress')
        for role,image in [('b3-release',b3),('b3-fastdebug',debug),('candidate-release',candidate),('candidate-fastdebug',candidate_debug)]:
            c.run('flags-'+role,[image/'bin/java','-XX:+PrintFlagsFinal','-version'])
            text=(out/('flags-'+role+'.log')).read_text()
            require(re.search(r'\bUseSVE\s*:?=\s*0\b' if target=='mac' else r'\bUseSVE\s*:?=\s*[1-9]\d*\b',text),'Actual default ISA coverage missing: '+role)
        c.python('correctness','run_classifier83_preflight.py',[*shared,'--control-jdk',b3,
            '--control-debug-jdk',debug,'--out',out/'preflight'])
        if scope=='complete':
            c.stage('original-reference-release')
            base,_=c.build('base87',BASE,'release')
            manifest=complete_manifest(c,manifest)
            shared[shared.index('--source-input-manifest')+1]=manifest
            timing=['--base-jdk',base,'--b3-jdk',b3,'--rebuilt-b3-jdk',b3,'--candidate-jdk',candidate,
                '--frozen',frozen,'--controller',controller,'--source-input-manifest',manifest,'--source',root,'--platform',target,'--execute']
            c.stage('release-assembly')
            c.python('assembly','run_roundtrip_candidate.py',[*timing,'--mode','assembly','--stage','assembly','--out',out/'assembly'])
            c.python('assembly-gate','check_roundtrip_assembly.py',[out/'assembly','--platform',target])
            require(json.loads((out/'assembly/installed-assembly-gate.json').read_text())['passed'],'Assembly gate failed')
            for name,stage in [('legacy-recovery','recovery'),('compact-and-controls-retention','retention')]:
                c.stage(name)
                c.python(name,'run_roundtrip_candidate.py',[*timing,'--mode','timing','--stage',stage,'--out',out/stage])
                require(json.loads((out/stage/'initial-gate.json').read_text())['passes'],'Performance gate failed')
        c.stage('full-suites-phases-gaps')
        c.python('full-suites','run_roundtrip_full.py',[*shared,'--out',out/'full'])
        require(json.loads((out/'full/full-result.json').read_text())['passed'],'Full suites incomplete')
        c.invariant()
        (out/'qualification-result.json').write_text(json.dumps(dict(passed=True,qualified=False,
            scope=scope,platform=target,timing_executed=scope=='complete',historical_linux_recovery_claim=False,
            interpretation='Automated gates for this platform/scope passed; no historical Linux recovery claim from Mac. Review paired uncertainty and separate allocation gaps.',
            evidence=['preflight/jtreg83-gate.json','full/full-result.json']+(['assembly/installed-assembly-gate.json','recovery/initial-gate.json','retention/initial-gate.json'] if scope=='complete' else [])),indent=2)+'\n')
    except BaseException as error:
        (out/'failure.json').write_text(json.dumps(dict(error=str(error),retry=False,qualified=False),indent=2)+'\n')
        raise
    finally:
        signal.setitimer(signal.ITIMER_REAL,0);signal.signal(signal.SIGALRM,old_alarm)
        signal.signal(signal.SIGTERM,old);c.save()


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--jtreg',type=Path,required=True);p.add_argument('--boot-jdk',type=Path,required=True)
    p.add_argument('--out',type=Path,required=True);p.add_argument('--execute',action='store_true')
    p.add_argument('--platform',choices=['linux','mac'],default='linux')
    p.add_argument('--scope',choices=['focused','assembly','complete','correctness'])
    p.add_argument('--reuse-builds',type=Path,help='Optional previous same-commit campaign directory; all source/configuration/image/tool identities must match')
    a=p.parse_args();a.scope=a.scope or ('focused' if a.platform=='mac' else 'complete');root=Path(__file__).resolve().parents[2]
    if a.execute:execute(root,a.out.resolve(),a.jtreg.resolve(),a.boot_jdk.resolve(),a.platform,a.scope,a.reuse_builds)
    else:print(json.dumps(plan(root,a.out.resolve(),a.jtreg.resolve(),a.boot_jdk.resolve(),a.platform,a.scope),indent=2))


if __name__=='__main__':main()
