#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Bounded public-C1 Adler proposal. Defaults to plan-only; never auto-runs."""
from pathlib import Path
import argparse, hashlib, json, math, os, platform, shutil, signal, statistics, subprocess, sys, tempfile, time, types
HERE = Path(__file__).resolve().parent
BASE = '3f71d03f3297f94e8c2cc34160262a880be337fc'
CANDIDATE = '5944fe1cb7fc072a8a1b8207383d2f009f785338'
NAME = 'org.openjdk.bench.java.util.zip.ChecksumPaths'
FLAGS = ['-Xshare:off', '-Xms256m', '-Xmx256m', '-XX:+UseG1GC', '-XX:+TieredCompilation',
         '-XX:TieredStopAtLevel=1', '-Xbatch', '-XX:ActiveProcessorCount=2', '-XX:+UnlockDiagnosticVMOptions']
CASES = {**{f'direct-{n}':dict(method='adlerDirect', size=n,
          nonregression_margin=.05 if n == 64 else .01 if n >= 65536 else .03,
          control_margin=.01 if n >= 65536 else .03) for n in [64,4095,4096,4097,65536,1048576]},
         'heap-4096':dict(method='adlerHeap', size=4096, nonregression_margin=.02, control_margin=.03)}
ARMS = {'A':['baseline',True], 'B':['candidate',True], 'C':['candidate',False], 'CP':['baseline',False]}
PHASES = {'prepare':180, 'diagnostic':180, 'measurement':480, 'analysis':60}

def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def read(path): return json.loads(Path(path).read_text())
def dump(path, value):
    # Publish complete JSON in one rename. A failed/interrupted write leaves
    # the prior file intact and propagates; it never counts as successful state.
    path=Path(path);temporary=None
    try:
        with tempfile.NamedTemporaryFile(mode='w',encoding='utf-8',dir=path.parent,
                                         prefix='.'+path.name+'.',suffix='.tmp',delete=False) as f:
            temporary=Path(f.name)
            json.dump(value,f,indent=2,allow_nan=False);f.write('\n')
            f.flush();os.fsync(f.fileno())
        os.replace(temporary,path)
    finally:
        if temporary is not None:temporary.unlink(missing_ok=True)
def require(ok, why):
    if not ok: raise ValueError(why)

# Helpers execute captured source bytes, not an unrelated import-path module.
_body=(HERE/'study.py').read_bytes()
require(compile(_body,sys._getframe().f_code.co_filename,'exec',dont_inherit=True,optimize=sys.flags.optimize)==sys._getframe().f_code,'Executing controller/source mismatch')
SOURCE = {'study.py':sha(HERE/'study.py')}
def helper(name):
    path=HERE/(name+'.py');body=path.read_bytes();SOURCE[path.name]=hashlib.sha256(body).hexdigest()
    m=types.ModuleType(name);exec(compile(body,str(path),'exec'),m.__dict__);return m
SCORE, ROUTES = helper('score'), helper('routes')

def policy():
    return dict(protocol='ADLER_PUBLIC_C1_V1_PROPOSAL', total_seconds=900, phases=PHASES,
                base=BASE,candidate=CANDIDATE,arms=ARMS,cases=CASES,flags=FLAGS,
                sessions=2,forks=3,warmup_forks=0,fail_on_error=True,warmup_iterations=2,measurement_iterations=3,iteration_ms=200,
                diagnostic_forks=28,timed_forks=168,family=14,alpha=.05,benefit_4096=.03,
                retries=0,automatic_followup=False,performance_authorized=False)

def assets():
    names=['study.py','score.py','routes.py','dependencies.json','AdlerPublicChecks.java','README.md','test_study.py','.gitignore']
    benchmark=HERE/'ChecksumPaths.java' if (HERE/'ChecksumPaths.java').is_file() else HERE.parent/'ChecksumPaths.java'
    return {n:sha(HERE/n) for n in names} | {'ChecksumPaths.java':sha(benchmark)}

def image_identity(path, revision):
    path=Path(path).resolve();release=(path/'release').read_text()
    source=next((line.split('=',1)[1].strip('"') for line in release.splitlines() if line.startswith('SOURCE=')), '')
    require(source.startswith('.:git:'+revision[:12]) and '+' not in source,'Image SOURCE must identify the clean exact source revision')
    names=['bin/java','bin/javac','release','lib/modules']
    names += [str(p.relative_to(path)) for p in sorted((path/'lib').rglob('*.dylib'))]
    require('lib/server/libjvm.dylib' in names and 'lib/libzip.dylib' in names,'Native macOS full JDK required')
    return dict(path=str(path),source=revision,files={n:sha(path/n) for n in names})

def plan(out, baseline=None, candidate=None, checkout=None):
    require(all(x is None for x in [baseline,candidate,checkout]) or all(x is not None for x in [baseline,candidate,checkout]),'Supply both images and normal source repository together')
    out=Path(out).resolve();out.mkdir(parents=True,exist_ok=False)
    bindings=None
    if baseline:
        checkout=Path(checkout).resolve()
        changed=subprocess.check_output(['git','diff','--name-only',BASE,CANDIDATE,'--','src','make'],cwd=checkout,text=True).splitlines()
        require(changed==['src/hotspot/share/c1/c1_GraphBuilder.cpp'],'Unexpected production delta in selected source revisions')
        bindings=dict(baseline=image_identity(baseline,BASE),candidate=image_identity(candidate,CANDIDATE),checkout=str(checkout))
    manifest=dict(policy=policy(),sources=assets(),dependencies=read(HERE/'dependencies.json'),images=bindings)
    (out/'source').mkdir()
    for name in manifest['sources']:
        src=HERE/name if (HERE/name).is_file() else HERE.parent/name
        shutil.copyfile(src,out/'source'/name)
        require(sha(out/'source'/name)==manifest['sources'][name],'Source changed while snapshotting')
    dump(out/'manifest.json',manifest)
    dump(out/'approval-template.json',dict(approved=False,purpose='ADLER_PUBLIC_C1_COMPARISON',manifest_sha256=sha(out/'manifest.json'),total_seconds=900,retries=0))
    return out

def verify(out, images=False):
    m=read(out/'manifest.json');require(m['policy']==policy() and m['sources']==assets(),'Plan/executing source changed')
    require(m['dependencies']==read(HERE/'dependencies.json'),'Dependency pins changed')
    require(all(sha(out/'source'/n)==h for n,h in m['sources'].items()),'Source snapshot changed')
    require(all(sha(HERE/n)==h for n,h in SOURCE.items()),'Executing source changed since import')
    if images:
        require(m['images'] is not None,'Normal source-built images not bound in plan')
        for k,revision in [('baseline',BASE),('candidate',CANDIDATE)]:
            require(image_identity(m['images'][k]['path'],revision)==m['images'][k],'Image bytes changed')
    return m

class Runner:
    def __init__(self,out):
        self.out=out;self.end=time.monotonic()+900;self.deadline=None;self.commands=[]
    def phase(self,name):
        self.deadline=min(self.end,time.monotonic()+PHASES[name]);self.name=name
    def left(self):
        value=self.deadline-time.monotonic();require(value>0,'Stage/global budget expired');return value
    def run(self,cmd,label):
        entry=dict(phase=self.name,argv=list(map(str,cmd)),start=time.monotonic());self.commands.append(entry)
        dump(self.out/'commands.json',self.commands)
        with (self.out/(label+'.log')).open('wb') as log:
            p=subprocess.Popen(entry['argv'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
            try:
                p.wait(timeout=self.left())
                require(p.returncode==0,'Command failed: '+label)
            except BaseException:
                # A failed controller can leave a fork alive even if the
                # controller itself has exited. Kill its group once either way.
                try:
                    os.killpg(p.pid,signal.SIGKILL)
                except ProcessLookupError:
                    pass
                except Exception as error:
                    entry['cleanup_error']=repr(error)
                if p.poll() is None:
                    try:
                        p.wait(timeout=max(0,min(5,self.end-time.monotonic())))
                    except Exception as error: entry['cleanup_error']=repr(error)
                raise
            finally:
                entry.update(end=time.monotonic(),returncode=p.returncode)
                dump(self.out/'commands.json',self.commands)
        self.left()

def arguments(image,classpath,method,sizes,forks,result,diagnostic=None):
    flags=FLAGS+['-XX:'+('+' if image['enabled'] else '-')+'UseAdler32Intrinsics']
    if diagnostic:
        flags += ['-XX:+LogCompilation','-XX:LogFile='+str(diagnostic)]
    return [str(Path(image['path'])/'bin/java'),'-cp',classpath,'org.openjdk.jmh.Main',NAME.replace('.','\\.')+'\\.'+method+'$',
            '-p','size='+','.join(map(str,sizes)),'-f',str(forks),'-wi','2','-w','200ms','-i','3','-r','200ms',
            '-wf','0','-foe','true','-t','1','-bm','avgt','-tu','ns','-v','EXTRA','-jvmArgs',' '.join(json.dumps(f) if any(c.isspace() for c in f) else f for f in flags),'-rf','json','-rff',str(result)]

def result_rows(path,method,sizes,forks,image,diagnostic=None):
    rows=read(path);require(isinstance(rows,list) and len(rows)==len(sizes),'Complete JMH result set required')
    expected_flags=FLAGS+['-XX:'+('+' if image['enabled'] else '-')+'UseAdler32Intrinsics']
    if diagnostic: expected_flags += ['-XX:+LogCompilation','-XX:LogFile='+str(diagnostic)]
    result={}
    for row in rows:
        require(row['benchmark']==NAME+'.'+method and row['mode']=='avgt' and row['threads']==1 and row['forks']==forks,'Benchmark/fork/mode drift')
        require(row['jmhVersion']=='1.37' and row['warmupIterations']==2 and row['measurementIterations']==3,'Iteration/version drift')
        require(row['warmupTime']==row['measurementTime']=='200 ms','Duration drift')
        require(row['jvmArgs']==expected_flags and Path(row['jvm']).resolve()==(Path(image['path'])/'bin/java').resolve(),'Actual fork VM/settings differ')
        n=int(row['params']['size']);require(n in sizes and n not in result,'Unexpected/duplicate size')
        metric=row['primaryMetric'];require(metric['scoreUnit']=='ns/op','Units drift')
        raw=metric['rawData'];require(len(raw)==forks and all(len(f)==3 for f in raw),'Missing fork/iteration')
        require(all(type(v) in [int,float] and math.isfinite(v) and v>0 for f in raw for v in f),'Invalid samples')
        require(row['params']==dict(size=str(n)),'Parameter drift')
        result[n]=[statistics.mean(f) for f in raw]
    return result

def release_identity(out,image):
    version=(out/(image+'-vm-identity.log')).read_text()
    require(len(version.strip())>16 and not any(tag in version.lower() for tag in ['fastdebug','slowdebug']),'Clean release image required')

def save_classes(out):
    return {str(p.relative_to(out/'classes')):sha(p) for p in (out/'classes').rglob('*') if p.is_file()}

def freeze(out):
    paths=[out/'manifest.json',out/'commands.json',out/'classes.json',out/'routes.json',out/'execution.json',out/'baseline-vm-identity.log',out/'candidate-vm-identity.log']
    paths += sorted((out/'raw').glob('*'))+sorted((out/'diagnostic').glob('*'))
    snapshot={str(p.relative_to(out)):sha(p) for p in paths if p.is_file()}
    if (out/'analysis-inputs.json').exists():require(read(out/'analysis-inputs.json')==snapshot,'First-analysis evidence changed')
    else:
        (out/'analysis-inputs').mkdir()
        for n in snapshot:
            dest=out/'analysis-inputs'/n;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(out/n,dest)
        dump(out/'analysis-inputs.json',snapshot)

def validate_diagnostics(out,m):
    saved=read(out/'routes.json')
    require(len(saved)==28,'All 28 diagnostic route records required')
    for arm,(which,enabled) in ARMS.items():
        image=dict(path=m['images'][which]['path'],enabled=enabled)
        for key,case in CASES.items():
            label=arm+'-'+key;log=out/'diagnostic'/(label+'-%p.xml')
            result_rows(out/'diagnostic'/(label+'.json'),case['method'],[case['size']],1,image,log)
            logs=list((out/'diagnostic').glob(label+'-*.xml'));require(len(logs)==1,'One exact diagnostic fork log required')
            expected='intrinsic' if enabled and (which=='baseline' or case['method']=='adlerHeap') else 'declined'
            actual=ROUTES.verify(logs[0],case['method'],expected)
            require(all(saved[label].get(k)==v for k,v in actual.items()),'Saved route evidence changed')

def analyze(out):
    out=Path(out)
    try:
        return _analyze(out)
    except Exception as error:
        previous=read(out/'result.json') if (out/'result.json').exists() else None
        dump(out/'result.json',dict(status='INVALID',error=repr(error),shipping_qualified=False,prior_result=previous))
        raise

def _analyze(out):
    m=verify(out);require(read(out/'execution.json')['status']=='COMPLETE','Incomplete/failed execution cannot be scored')
    require(not (out/'result.json').exists() or read(out/'result.json').get('status')!='INVALID','Saved invalid result cannot be promoted')
    require(save_classes(out)==read(out/'classes.json'),'Compiled benchmark changed')
    for image in ['baseline','candidate']:release_identity(out,image)
    validate_diagnostics(out,m)
    freeze(out);data={arm:{key:[None,None] for key in CASES} for arm in ARMS}
    for session in range(2):
        for arm,(which,enabled) in ARMS.items():
            image=dict(path=m['images'][which]['path'],enabled=enabled)
            for method,sizes in [('adlerDirect',[64,4095,4096,4097,65536,1048576]),('adlerHeap',[4096])]:
                samples=result_rows(out/'raw'/f'{session}-{arm}-{method}.json',method,sizes,3,image)
                for n,values in samples.items():data[arm][('direct-' if method=='adlerDirect' else 'heap-')+str(n)][session]=values
    result=SCORE.assess(data,CASES);dump(out/'result.json',result);return result

def execute(out,approval):
    # No timing authorization is embedded in source, plan or an existing report.
    out=Path(out).resolve();m=verify(out);a=read(approval)
    require(a==dict(approved=True,purpose='ADLER_PUBLIC_C1_COMPARISON',manifest_sha256=sha(out/'manifest.json'),total_seconds=900,retries=0),'Separate exact comparison approval required')
    require(not any(os.environ.get(n) for n in ['JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS','JDK_JAVAC_OPTIONS','LD_PRELOAD','LD_LIBRARY_PATH','DYLD_INSERT_LIBRARIES','DYLD_LIBRARY_PATH','DYLD_FRAMEWORK_PATH','DYLD_FALLBACK_LIBRARY_PATH']),'Injected VM/compiler/native settings are not part of this plan')
    require(platform.system()=='Darwin' and platform.machine() in ['arm64','aarch64'],'Native Apple arm64 comparison only')
    with (out/'EXECUTION_STARTED').open('x') as f:json.dump(a,f)
    run=Runner(out)
    try:
        run.phase('prepare');verify(out,images=True)
        for image in ['baseline','candidate']:
            label=image+'-vm-identity'
            run.run([Path(m['images'][image]['path'])/'bin/java','-Xinternalversion'],label)
            release_identity(out,image)
        (out/'deps').mkdir();(out/'classes').mkdir();(out/'raw').mkdir();(out/'diagnostic').mkdir()
        for name,item in m['dependencies'].items():
            dst=out/'deps'/name
            run.run(['/usr/bin/curl','--fail','--location','--silent','--show-error','--max-time',str(min(30,run.left())),'-o',dst,'https://repo.maven.apache.org/maven2/'+item['path']],name)
            require(sha(dst)==item['sha256'],'Pinned dependency mismatch')
        classpath=os.pathsep.join(str(out/'deps'/n) for n in m['dependencies'])
        run.run([Path(m['images']['baseline']['path'])/'bin/javac','-cp',classpath,'-processorpath',classpath,'-processor','org.openjdk.jmh.generators.BenchmarkProcessor','-d',out/'classes',out/'source/ChecksumPaths.java'],'compile-benchmark')
        dump(out/'classes.json',save_classes(out));classpath=str(out/'classes')+os.pathsep+classpath
        run.run([Path(m['images']['baseline']['path'])/'bin/javac','-proc:none','-cp',classpath,'-d',out/'classes',out/'source/AdlerPublicChecks.java'],'compile-public-checks')
        dump(out/'classes.json',save_classes(out))
        for image in ['baseline','candidate']:
            run.run([Path(m['images'][image]['path'])/'bin/java',*FLAGS,'-XX:+UseAdler32Intrinsics','-cp',classpath,'org.openjdk.bench.java.util.zip.AdlerPublicChecks'],'untimed-'+image)
        run.phase('diagnostic');route_results={}
        for arm,(which,enabled) in ARMS.items():
            image=dict(path=m['images'][which]['path'],enabled=enabled)
            for key,case in CASES.items():
                label=arm+'-'+key;result=out/'diagnostic'/(label+'.json');log=out/'diagnostic'/(label+'-%p.xml')
                run.run(arguments(image,classpath,case['method'],[case['size']],1,result,log),'diagnostic-'+label)
                result_rows(result,case['method'],[case['size']],1,image,log)
                logs=list((out/'diagnostic').glob(label+'-*.xml'));require(len(logs)==1,'One exact diagnostic fork log required')
                expected='intrinsic' if enabled and (which=='baseline' or case['method']=='adlerHeap') else 'declined'
                route_results[label]=ROUTES.verify(logs[0],case['method'],expected)
                route_results[label]['entry_label']=('C1 leaf' if expected=='intrinsic' else 'interpreter entry inferred from source/flags; no direct entry breakpoint' if enabled else 'JNI selected by Adler-disabled flag/source; no reused LLDB script')
                run.left()
        dump(out/'routes.json',route_results);verify(out,images=True)
        run.phase('measurement')
        jobs=[(a,method,sizes) for a in ARMS for method,sizes in [('adlerDirect',[64,4095,4096,4097,65536,1048576]),('adlerHeap',[4096])]]
        for session in range(2):
            for arm,method,sizes in (jobs if session==0 else reversed(jobs)):
                require(save_classes(out)==read(out/'classes.json'),'Compiled benchmark changed')
                which,enabled=ARMS[arm];image=dict(path=m['images'][which]['path'],enabled=enabled)
                dest=out/'raw'/f'{session}-{arm}-{method}.json'
                run.run(arguments(image,classpath,method,sizes,3,dest),f'measure-{session}-{arm}-{method}')
                result_rows(dest,method,sizes,3,image)
        run.phase('analysis');verify(out,images=True);require(save_classes(out)==read(out/'classes.json'),'Classes changed')
        dump(out/'execution.json',dict(status='COMPLETE',retries=0));analyze(out);run.left()
    except BaseException as error:
        dump(out/'execution.json',dict(status='INVALID',error=repr(error),retries=0))
        prior=read(out/'result.json') if (out/'result.json').exists() else None
        dump(out/'result.json',dict(status='INVALID',error=repr(error),shipping_qualified=False,prior_result=prior))
        raise

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True)
    g=p.add_mutually_exclusive_group();g.add_argument('--execute',action='store_true');g.add_argument('--analyze',action='store_true')
    p.add_argument('--approval',type=Path);p.add_argument('--baseline',type=Path);p.add_argument('--candidate',type=Path);p.add_argument('--checkout',type=Path)
    a=p.parse_args()
    if a.execute:
        require(a.approval is not None,'Approval required');execute(a.out,a.approval)
        result=read(a.out/'result.json')
    elif a.analyze:result=analyze(a.out)
    else:
        plan(a.out,a.baseline,a.candidate,a.checkout);print('Plan only; no execution authorized');return 0
    print(json.dumps(dict(status=result['status'],shipping_qualified=False)))
    return 0 if result['status']=='BASELINE_BENEFIT_WITH_BOUNDED_GUARDS' else 2
if __name__=='__main__':sys.exit(main())
