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
import sys
import time

sys.dont_write_bytecode=True

from classifier_images import git, pins, source_binding, payload_manifest, record, require
from build_classifier_image import cleanup_group, toolchain
from jtreg83_harness import inventory,harness_version

BASE='87edd79d3104ff502f7befec034716b081436f49'
B3='b3ce67e362c3b1678fcf3d18ee714182b2395c86'
def vm_file(target): return 'lib/server/libjvm.dylib' if target=='mac' else 'lib/server/libjvm.so'

def image_files(target): return ('bin/java','bin/javac',vm_file(target),'lib/modules','release')
STAGES=[('reference-debug-build',5400),('harness-compatibility',600),
        ('reference-release-builds-and-overlays',15000),('compile-common-inputs',600),
        ('correctness-ir-stress',6000),('original-reference-release',5400),('release-assembly',7200),
        ('legacy-recovery',3600),('compact-and-controls-retention',14400),('full-suites-phases-gaps',57600)]


def stages(target,scope):
    caps=dict(STAGES)
    if target=='mac':caps.update({'correctness-ir-stress':3600,'release-assembly':3600,'legacy-recovery':1800,'compact-and-controls-retention':7200,'full-suites-phases-gaps':28800})
    if scope=='correctness':
        for name in ['original-reference-release','release-assembly','legacy-recovery','compact-and-controls-retention']:caps.pop(name)
    return caps

def plan(root,out,jtreg,boot,target='linux',scope='complete'):
    return dict(experiment='pr14-native-source-v1',source_head=git(root,'rev-parse','HEAD'),
        platform=target,scope=scope,historical_linux_recovery_claim=False,
        native_host='macOS arm64 / Apple Silicon, NEON only' if target=='mac' else 'Linux aarch64 with enabled SVE; no emulation',
        required_tools=['JDK27 boot image','installed compatible jtreg8.3 build1or later','Xcode/clang and make' if target=='mac' else 'gcc16/binutils/mold/make/taskset','Python3; capstone for complete scope'],
        harness=str(jtreg),boot_jdk=str(boot),output=str(out),max_seconds=86400 if target=='mac' else 129600,
        references={'base87':BASE,'b3':B3,'candidate_product':pins()['product_head']},
        builds=['b3 fastdebug full image','b3 release full image','classifier release HotSpot-only overlay','classifier fastdebug HotSpot-only overlay']+(['base87 release full image after correctness passes'] if scope=='complete' else []),
        stages=[dict(name=n,maximum_seconds=s) for n,s in stages(target,scope).items()],
        fail_fast='Any harness, source/image, correctness/IR, stress or assembly failure stops timing; any recovery bound failure stops retention/full suites. No automatic retries/resume.',
        performance=dict(primary_comparisons=0 if scope=='correctness' else 15 if target=='mac' else 30,pairs_each=12,maximum_timed_JVMs=0 if scope=='correctness' else 360 if target=='mac' else 720,assembly_JVMs=0 if scope=='correctness' else 18 if target=='mac' else 36,
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
        self.maximum_seconds=86400 if target=='mac' else 129600
        self.deadline=time.monotonic()+self.maximum_seconds
        self.stage_deadline=self.deadline
        self.commands=[]
        self.harness=payload_manifest(jtreg)
        if target=='mac':
            self.tools={n:Path(subprocess.check_output(['xcrun','--find',n],text=True).strip()).resolve() for n in ['clang','clang++','ld','ar']}
            self.tools['make']=Path(shutil.which('gmake') or shutil.which('make')).resolve()
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
            platform=self.target,scope=self.scope,sdk=self.sdk,commands=self.commands,images=self.images,builds=self.builds,tools=self.tool_records,
            qualified=False),indent=2)+'\n')
    def invariant(self):
        if self.sdk:require(record(Path(self.sdk['settings']))==self.sdk['record'],'Mac SDK changed')
        require(payload_manifest(self.jtreg)==self.harness,'Common harness changed')
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
    def image(self,path):
        return dict(root=str(path),files={n:record(path/n) for n in image_files(self.target)})
    def build(self,role,ref,level,template=None):
        key=role+'-'+level;src=self.out/'sources'/key
        self.run(key+'-checkout',['git','worktree','add','--detach',src,ref])
        require(record(src/'bin/configure-dev')==record(self.root/'bin/configure-dev'),'Configure profile differs')
        require(git(src,'rev-parse','HEAD')==git(self.root,'rev-parse',ref),'Worktree source differs')
        conf='source-qualification';make_target='hotspot' if template else 'images'
        self.run(key+'-configure',['bash',src/'bin/configure-dev','--with-conf-name='+conf,
            '--with-debug-level='+level,'--with-boot-jdk='+str(self.boot),
            '--with-jtreg='+str(self.jtreg),'--with-native-debug-symbols=none','--with-jobs=1'],cwd=src)
        self.run(key+'-build',[self.tools['make'],'CONF='+conf,make_target],cwd=src)
        if template:
            image=self.out/'images'/key
            shutil.copytree(template,image,symlinks=True)
            before=payload_manifest(image)
            shutil.copy2(src/('build/'+conf+'/support/modules_libs/java.base/server/'+Path(vm_file(self.target)).name),image/vm_file(self.target))
            after=payload_manifest(image);vm=vm_file(self.target)
            require(set(before)==set(after) and before[vm]!=after[vm] and all(before[n]==after[n] for n in before if n!=vm),'Unexpected template overlay delta')
        else:image=src/('build/'+conf+'/images/jdk')
        self.images[key]=self.image(image)
        self.builds[key]=dict(source_head=git(src,'rev-parse','HEAD'),src_tree=git(src,'rev-parse','HEAD:src'),
            target=make_target,spec=record(src/('build/'+conf+'/spec.gmk')),same_tools=self.tool_records,
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
    value=dict(schema=1,experiment='pr14-native-source-v1',scope='correctness',platform=c.target,source_head=git(c.root,'rev-parse','HEAD'),
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


def execute(root,out,jtreg,boot,target='linux',scope='complete'):
    require((sys.platform=='darwin' and os.uname().machine=='arm64') if target=='mac' else (sys.platform=='linux' and os.uname().machine=='aarch64'),'Matching native ARM host required')
    require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS','CLASSPATH')), 'Inherited JVM/classpath options')
    if scope=='complete':
        import capstone  # Fail before building if the required assembly decoder is absent.
        require(hasattr(capstone,'CS_ARCH_ARM64') and hasattr(capstone,'CS_MODE_ARM'),'Compatible capstone ARM64 decoder API required')
    if target=='linux':require(ctypes.CDLL(None).prctl(36,1,0,0,0)==0,'Cannot enable child subreaper')
    require(not out.is_relative_to(root),'Output must be outside the checkout')
    out.mkdir(parents=True,exist_ok=False);(out/'sources').mkdir();(out/'images').mkdir()
    source_binding(root,pins())
    inventory(jtreg)
    c=Campaign(root,out,jtreg,boot,target,scope)
    (out/'plan.json').write_text(json.dumps(plan(root,out,jtreg,boot,target,scope),indent=2)+'\n')
    def interrupted(signum,frame):raise TimeoutError('Campaign interrupted; no retry')
    old=signal.signal(signal.SIGTERM,interrupted)
    old_alarm=signal.signal(signal.SIGALRM,interrupted);signal.setitimer(signal.ITIMER_REAL,c.maximum_seconds)
    try:
        # Cheap harness identity/version admission precedes all builds. Full smoke precedes overlays.
        c.stage('reference-debug-build')
        c.run('make-version',[c.tools['make'],'--version'])
        require(re.search(r'GNU Make (?:[4-9]|[1-9][0-9]+)\.',(out/'make-version.log').read_text()),'GNU make4or newer required')
        c.run('harness-version',[boot/'bin/java','-jar',jtreg/'lib/jtreg.jar','-version'])
        require(harness_version(jtreg) in (out/'harness-version.log').read_text(),'Harness runtime version differs')
        c.run('host-default-SVE',[boot/'bin/java','-XX:+PrintFlagsFinal','-version'])
        text=(out/'host-default-SVE.log').read_text()
        require(re.search(r'\bUseSVE\s*:?=\s*0\b' if target=='mac' else r'\bUseSVE\s*:?=\s*[1-9]\d*\b',text),'Required native ISA coverage unavailable')
        debug,spec=c.build('b3',B3,'fastdebug')
        c.stage('harness-compatibility')
        c.python('harness-smoke','jtreg83_harness.py',['smoke','--image',jtreg,'--jdk',boot,
            '--debug-jdk',debug,'--debug-spec',spec,'--out',out/'harness-smoke','--execute'])
        c.stage('reference-release-builds-and-overlays')
        b3,_=c.build('b3',B3,'release')
        base=None
        candidate,_=c.build('candidate',git(root,'rev-parse','HEAD'),'release',b3)
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
    p.add_argument('--scope',choices=['complete','correctness'],default='complete')
    a=p.parse_args();root=Path(__file__).resolve().parents[2]
    if a.execute:execute(root,a.out.resolve(),a.jtreg.resolve(),a.boot_jdk.resolve(),a.platform,a.scope)
    else:print(json.dumps(plan(root,a.out.resolve(),a.jtreg.resolve(),a.boot_jdk.resolve(),a.platform,a.scope),indent=2))


if __name__=='__main__':main()
