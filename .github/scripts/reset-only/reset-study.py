"""Default is pure planning. --execute-once alone builds/checks and starts one fixed run.
Publication and execution of this prospective protocol require separate approval.
"""
from pathlib import Path
import argparse,base64,csv,hashlib,importlib.util,io,json,os,platform,re,resource,selectors,shlex,shutil,subprocess,tarfile,time
import reset_protocol as P
HERE=Path(__file__).resolve().parent
PIN=P.PIN
RUNTIME_FILES=['reset-study.c','reset-study.py','reset-score.py','reset_protocol.py','test_reset_mechanism.py','reset-invariants.c','backend-reset.patch','source-pins.json']
sha=P.sha;dump=P.dump
def load_score():
    spec=importlib.util.spec_from_file_location('reset_score',HERE/'reset-score.py')
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

def prepare(a,candidate_transform=None):
    out=a.out.resolve();P.require(sorted(p.name for p in out.iterdir())==['STARTED'],'Output must contain only the owned one-attempt marker')
    for name in ['source','inputs','compressed','build','baseline','candidate','verify']:(out/name).mkdir(parents=True,exist_ok=True)
    pins=json.loads((HERE/'source-pins.json').read_text());assert pins['head']==PIN and pins['ng']=='88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0';assert sha(HERE/'backend-reset.patch')==pins['patch_sha256']=='db471660e1faf92aa71bca6b1f2ab178b4ca259343f5a0fc22713094f355e8c2'
    prefix='src/java.base/share/native/libzip/';raw=subprocess.check_output(['git','archive',PIN,prefix+'zlib',prefix+'zlib-ng',prefix+'Deflater.c',prefix+'zip_zlib_backend.h'],cwd=a.root)
    with tarfile.open(fileobj=io.BytesIO(raw)) as tf:
        for item in tf:
            if item.isfile():
                assert '..' not in Path(item.name).parts;p=out/'baseline'/item.name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(tf.extractfile(item).read())
    stocksrc=out/'baseline'/prefix/'zlib';ngsrc=out/'baseline'/prefix/'zlib-ng'
    assert len(pins['ng_files'])==215
    for x in pins['ng_files']:assert sha(ngsrc/x['path'])==x['sha256']
    assert '#define ZLIB_VERSION "1.3.2"' in (stocksrc/'zlib.h').read_text()
    shutil.copytree(out/'baseline',out/'candidate',dirs_exist_ok=True)
    subprocess.run(['git','apply','--directory=candidate',str(HERE/'backend-reset.patch')],cwd=out,check=True,capture_output=True)
    if candidate_transform is not None:candidate_transform(out)  # Before verifier copies and ALL candidate builds.
    csrc=out/'candidate'/prefix/'zlib-ng';shutil.copytree(out/'candidate',out/'verify',dirs_exist_ok=True);vsrc=out/'verify'/prefix/'zlib-ng'
    p=vsrc/'deflate.c';s=p.read_text();s=s.replace('static int clear_small_hash(deflate_state *s) {','unsigned long Z_EXPORT jdk_ng_test_sparse_resets = 0;\nstatic int clear_small_hash(deflate_state *s) {');mark='''        s->head[hash] = 0;
    }
    return 1;''';assert s.count(mark)==1;s=s.replace(mark,'''        s->head[hash] = 0;
    }
    jdk_ng_test_sparse_resets++;
    for (uint32_t i=0;i<HASH_SIZE;i++) if (s->head[i]) abort();
    return 1;''');s+='''
int Z_EXPORT jdk_ng_test_reset_safe(PREFIX3(stream)*s){return deflateStateCheck(s)?-1:s->state->small_reset_safe;}
unsigned long Z_EXPORT jdk_ng_test_head_nonzero(PREFIX3(stream)*s){if(deflateStateCheck(s))abort();unsigned long n=0;for(uint32_t i=0;i<HASH_SIZE;i++)n+=s->state->head[i]!=0;return n;}
''';p.write_text(s)
    inputs=[]
    def add(name,data):
        p=out/'inputs'/f'{len(inputs)}.bin';p.write_bytes(data);inputs.append(dict(id=len(inputs),name=name,path=str(p),bytes=len(data),sha256=sha(p)))
    originals=[];groups=[]
    for family in pins['tiny_families']:
        group=[]
        for bank in family['banks']:
            data=base64.b64decode(bank['base64']);assert len(data)==64 and hashlib.sha256(data).hexdigest()==bank['sha256'];group.append(len(originals));originals.append(data)
        groups.append(group)
    assert len(originals)==132 and len(groups)==8
    for n in [32,64]:
        for i,data in enumerate(originals):add(f'tiny{n}-{i}',data[:n])
    add('empty',b'');add('fallback65',hashlib.shake_256(b'tiny-finish-v1:random:65').digest(65))
    n=1048576;unit=b'alpha beta alpha gamma: the small bird crossed the garden. '
    add('long-text',(unit*((n+len(unit)-1)//len(unit)))[:n]);add('long-random',hashlib.shake_256(b'tiny-finish-v1:random:1048576').digest(n))
    assert len(inputs)==268 and inputs[265]['sha256']=='452b1eed4edb62808bafc70285a7a04101c90e1452adc57aba4e133e3efab5c9'
    works=P.workloads(groups)
    (out/'inputs.tsv').write_text(''.join(f"{x['id']}\t{x['path']}\n" for x in inputs))
    (out/'workloads.tsv').write_text(''.join('\t'.join(str(w[k]) for k in ['id','section','life','iterations','warm','quartets'])+'\t'+','.join(map(str,w['banks']))+'\n' for w in works))
    P.write_plan(out,works,inputs)
    for name in RUNTIME_FILES:shutil.copyfile(HERE/name,out/'source'/name)
    workflow=HERE.parents[1]/'workflows/tiny-zlib-mechanism.yml'
    shutil.copyfile(workflow,out/'source'/workflow.name)
    dump(out/'preregistered.json',dict(manifest_sha256=sha(out/'manifest.json'),schedule_sha256=sha(out/'schedule.tsv'),files={p.name:sha(p) for p in (out/'source').iterdir()},frozen_before_measurement=True))
    commands=[]
    def command(cmd,log,cwd,env=None):
        commands.append(dict(argv=list(map(str,cmd)),cwd=str(cwd),environment={k:env.get(k) for k in ['CC','AR','CFLAGS','LDFLAGS','ASAN_OPTIONS','UBSAN_OPTIONS']} if env else None))
        with Path(log).open('w') as f:subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
        dump(out/'build-commands.json',commands)
    stock=out/'build/stock';stock.mkdir();objects=[]
    for p in sorted(stocksrc.glob('*.c')):
        if p.name.startswith('gz'):continue
        obj=stock/(p.stem+'.o');command(['gcc-14','-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',stocksrc,'-c',p,'-o',obj],stock/(p.stem+'.log'),out);objects.append(obj)
    command(['ar','rcs',stock/'libz.a',*objects],stock/'ar.log',out)
    libraries={}
    for name,src,extra,asan,control in [('N',ngsrc,[],False,False),('S',csrc,[],False,True),('V',vsrc,[],False,True),('NM',ngsrc,['-DNO_MEDIUM_STRATEGY'],False,False),('VM',vsrc,['-DNO_MEDIUM_STRATEGY'],False,False),('NA',ngsrc,[],True,False),('VA',vsrc,[],True,False)]:
        b=out/'build'/name;b.mkdir();flags=['-O1','-g','-fPIC','-fno-omit-frame-pointer','-fsanitize=address,undefined'] if asan else ['-O2','-fPIC'];flags+=extra;env=dict(os.environ,CC='gcc-14',AR='ar',CFLAGS=' '.join(flags),LDFLAGS='-fsanitize=address,undefined' if asan else '')
        command(['bash',src/'configure','--static','--zlib-compat','--sprefix=jdk_ng_'],b/'configure.log',b,env);command(['make','-j2','libz.a'],b/'make.log',b)
        extras=[]
        if control:
            actual=shlex.split(next(x[7:] for x in (b/'Makefile').read_text().splitlines() if x.startswith('CFLAGS=')));obj=b/'reset-control.o';command(['gcc-14',*actual,'-DRESET_CONTROL_OBJECT','-I',b,'-I',src,'-c',HERE/'reset-study.c','-o',obj],b/'control.log',out);extras.append(obj)
        so=b/'ng.so';command(['gcc-14',*(['-fsanitize=address,undefined'] if asan else []),'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',b/'libz.a','-Wl,--no-whole-archive',*extras,'-o',so],b/'link.log',out);libraries[name]=str(so)
    driver=out/'build/reset-study';command(['gcc-14','-O2','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stocksrc,HERE/'reset-study.c',stock/'libz.a','-ldl','-o',driver],out/'build/driver.log',out)
    checkdriver=out/'build/reset-check';command(['gcc-14','-O2','-DRESET_CHECK_ONLY','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stocksrc,HERE/'reset-study.c',stock/'libz.a','-ldl','-o',checkdriver],out/'build/check-driver.log',out)
    regress=out/'build/reset-invariants';command(['gcc-14','-O2','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stocksrc,HERE/'reset-invariants.c',stock/'libz.a','-ldl','-o',regress],out/'build/invariants-build.log',out)
    rega=out/'build/reset-invariants-asan';command(['gcc-14','-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stocksrc,HERE/'reset-invariants.c',stock/'libz.a','-ldl','-o',rega],out/'build/invariants-asan-build.log',out)
    payloads=[dict(id=x['id'],name='bank-'+str(x['id']),path=x['path']) for x in inputs[132:264]+inputs[:132]]
    (out/'regression-inputs.tsv').write_text(''.join(f"{x['id']}\t{x['name']}\t{x['path']}\n" for x in payloads));(out/'quality.csv').write_text('case_id,family,bytes,input_offset\n'+''.join(f'{i},0,64,{64*i}\n' for i in range(128)));(out/'quality.bin').write_bytes(b''.join(originals[:128]))
    for label,a1,a2,binary in [('default','N','V',regress),('no-medium','NM','VM',regress),('asan-ubsan','NA','VA',rega)]:
        env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1') if label=='asan-ubsan' else None
        command([binary,libraries[a1],libraries[a2],out/f'invariants-{label}.csv',out/f'invariants-{label}.bin',out/'regression-inputs.tsv',out/'quality.csv',out/'quality.bin','1'],out/f'invariants-{label}.log',out,env)
    basecmd=[str(driver),libraries['N'],libraries['S'],str(out/'inputs.tsv'),str(out/'workloads.tsv'),str(out/'schedule.tsv'),str(out)]
    for worker in P.WORKERS:
        tmp=out/f'untimed-{worker}';tmp.mkdir();(tmp/'compressed').mkdir();args=basecmd.copy();args[6]=str(tmp);command([*args,str(worker),P.VERSION,'--untimed-only'],out/f'untimed-{worker}.log',out)
    for worker in P.WORKERS:
        tmp=out/f'control-check-{worker}';tmp.mkdir();(tmp/'compressed').mkdir();args=basecmd.copy();args[0]=str(checkdriver);args[2]=libraries['V'];args[6]=str(tmp);command([*args,str(worker),P.VERSION,'--untimed-only'],out/f'control-check-{worker}.log',out)
    dump(out/'launch.json',dict(basecmd=basecmd,libraries=libraries))
    env=dict(cpu=subprocess.check_output(['lscpu'],text=True),compiler=subprocess.check_output(['gcc-14','--version'],text=True),uname=platform.uname()._asdict(),libc=platform.libc_ver(),affinity=sorted(os.sched_getaffinity(0)),cpu_pin=max(os.sched_getaffinity(0)),allocator={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']})
    for p in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:env[p]=Path(p).read_text()
        except OSError as e:env[p]=str(e)
    dump(out/'environment.json',env);dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=sha(p)) for top in ['source','inputs','build'] for p in (out/top).rglob('*') if p.is_file()})
    print('PREPARED_AND_UNTIMED_CHECKED:10 correctness profiles,12288 maximum timing rows; timing not started',flush=True);return out

class DeadlineExpired(TimeoutError):pass
class ProtocolFailure(P.InvalidData):pass

def remaining(deadline,clock):
    left=deadline-clock()
    if left<=0:raise DeadlineExpired('Fixed deadline expired; no retry')
    return left

class PipePeer:
    """Binary, nonblocking pipes; a partial line can never defeat the deadline."""
    def __init__(self,argv,log,clock=time.monotonic):
        self.clock=clock;self.buffer=bytearray();self.log=Path(log).open('wb')
        try:self.process=subprocess.Popen(argv,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=self.log,bufsize=0)
        except BaseException:self.log.close();raise
        os.set_blocking(self.process.stdout.fileno(),False)
        os.set_blocking(self.process.stdin.fileno(),False)
    def _ready(self,file,event,deadline):
        with selectors.DefaultSelector() as s:
            s.register(file,event)
            while not s.select(min(remaining(deadline,self.clock),30)):
                print('WAITING_FOR_WORKER',flush=True)
    def send(self,line,deadline):
        b=line.encode('ascii')
        while b:
            self._ready(self.process.stdin,selectors.EVENT_WRITE,deadline)
            try:n=os.write(self.process.stdin.fileno(),b)
            except BlockingIOError:continue
            except BrokenPipeError as e:raise ProtocolFailure('worker pipe closed') from e
            if not n:raise ProtocolFailure('zero-byte worker write')
            b=b[n:]
        remaining(deadline,self.clock)
    def expect(self,want,deadline):
        while b'\n' not in self.buffer:
            self._ready(self.process.stdout,selectors.EVENT_READ,deadline)
            try:b=os.read(self.process.stdout.fileno(),4096)
            except BlockingIOError:continue
            if not b:raise ProtocolFailure('worker EOF while expecting '+want)
            self.buffer.extend(b)
            if len(self.buffer)>4096:raise ProtocolFailure('oversize worker response')
        line,_,rest=self.buffer.partition(b'\n');self.buffer=bytearray(rest)
        try:got=line.decode('ascii')
        except UnicodeDecodeError as e:raise ProtocolFailure('non-ASCII worker response') from e
        if got!=want:raise ProtocolFailure('unexpected worker response '+repr(got)+'; expected '+want)
        remaining(deadline,self.clock)
    def finish(self,deadline):
        try:rc=self.process.wait(timeout=remaining(deadline,self.clock))
        except subprocess.TimeoutExpired as e:raise DeadlineExpired('Worker finalization timed out') from e
        remaining(deadline,self.clock)
        if rc!=0:raise ProtocolFailure('worker exit='+str(rc))
        if self.buffer or self.process.stdout.read():raise ProtocolFailure('extra worker stdout after QUIT')
    def close(self):
        if self.process.poll() is None:
            self.process.kill()
            self.process.wait(timeout=5)
        for p in [self.process.stdin,self.process.stdout,self.log]:p.close()

def coordinate(out,peer_factory,scorer,clock=time.monotonic):
    """One fixed command schedule. Injectable peers/clock permit synthetic-only testing."""
    out=Path(out);peers={};phases=[];completed=0;events=out/'coordination.jsonl'
    def event(name,**kw):
        with events.open('a') as f:f.write(json.dumps(dict(monotonic_seconds=clock(),event=name,**kw))+'\n')
    def ask(w,cmd,want,deadline):
        remaining(deadline,clock);event('SEND',worker=w,command=cmd.rstrip())
        peers[w].send(cmd,deadline);peers[w].expect(want,deadline)
        remaining(deadline,clock);event('ACK',worker=w,response=want)
    status={}
    try:
        before=scorer.verify_artifacts(out);dump(out/'provenance-before.json',before)
        event('PROVENANCE_BEFORE_VERIFIED',input_count=268)
        startup=clock()+P.STARTUP_SECONDS
        for w in P.LAUNCH_ORDER:
            remaining(startup,clock);peers[w]=peer_factory(w);event('LAUNCH',worker=w,**{k:v for k,v in P.factors(w).items() if k!='worker'})
        for w in P.LAUNCH_ORDER:peers[w].expect(f'READY {w}',startup)
        remaining(startup,clock)
        start=clock();deadline=start+P.MEASUREMENT_SECONDS;event('MEASUREMENT_START',cap_seconds=P.MEASUREMENT_SECONDS)
        observed=set();plans=P.schedule()
        for phase in [1,2,3]:
            for r in plans:
                if r['phase']!=phase:continue
                w=r['worker'];key=w,r['block']
                if phase==1 and key not in observed:
                    ask(w,f"E {r['block']}\n",f"EMPTY {w} {r['block']}",deadline);observed.add(key)
                ask(w,f"M {r['seq']}\n",f"DONE {r['seq']}",deadline);completed+=1
            phases.append(phase);remaining(deadline,clock)
            if phase==1:
                result=scorer.score(out,[1],False);dump(out/'pre-score.json',result)
                remaining(deadline,clock);event('GLOBAL_PRE_GATE',passed=result['calibration_passed'],failed=result['failed_controls'])
                if not result['calibration_passed']:break
        remaining(deadline,clock);elapsed=clock()-start
        event('MEASUREMENT_COMPLETE',phases=phases,seconds=elapsed)
        finish=clock()+P.FINISH_SECONDS
        # Final stock-inflate/byte checks are outside the measurement cap.
        for w in P.LAUNCH_ORDER:peers[w].send('Q\n',finish)
        for w in P.LAUNCH_ORDER:
            peers[w].expect(f'QUIT {w}',finish);peers[w].finish(finish)
        after=scorer.verify_artifacts(out)
        P.require(after==before,'artifact provenance changed during measurement/finalization')
        dump(out/'provenance-after.json',after);event('PROVENANCE_AFTER_VERIFIED',input_count=268)
        result=scorer.score(out,phases,True);dump(out/'score.json',result);scorer.report(out,result)
        native=result['record_origin']=='NATIVE_MEASUREMENT'
        status=dict(status='PRE_GATE_FAILED_COMPARISON_SKIPPED' if phases==[1] else
            'POST_GATE_FAILED_UNQUALIFIED' if not result['calibration_passed'] else
            'MECHANISM_CRITERIA_PASSED' if result['decision']['statistical_criteria_passed'] else 'MECHANISM_CRITERIA_NOT_MET',
            record_origin=result['record_origin'],native_mechanism_qualified=result.get('decision',{}).get('native_mechanism_qualified',False) and native,
            rows=completed,phases=phases,retries=0,measurement_seconds=elapsed,measurement_cap_seconds=900,
            public_api_qualified=False,fresh_long_Java_qualified=False)
    except DeadlineExpired as e:
        status=dict(status='INCOMPLETE_TIMEOUT',error=str(e),rows=completed,completed_phases=phases,retries=0)
        event('ABORT_TIMEOUT',error=str(e))
    except (P.InvalidData,OSError,ValueError,KeyError,TypeError) as e:
        status=dict(status='INVALID_DATA_OR_PROTOCOL',error=type(e).__name__+': '+str(e),rows=completed,completed_phases=phases,retries=0)
        event('ABORT_INVALID',error=str(e))
    finally:
        for peer in peers.values():peer.close()
        if status:dump(out/'status.json',status)
    return status

def claim_once(out,environment):
    P.require(environment.get('GITHUB_RUN_ATTEMPT','1')=='1','Workflow retries are not authorized')
    out=Path(out);out.mkdir(parents=True,exist_ok=True)
    P.require(not any(out.iterdir()),'Fresh output only; no overwrite or retry')
    with (out/'STARTED').open('x') as f:f.write('One fixed attempt; marker claimed before build. Never remove to retry.\n')

ONCE_TAG='diagnostic-tiny-zlib-mechanism-20261015-once'
def authorize_publication(environment,event,head):
    """Operational guard: only a fresh fixed lightweight-tag creation at HEAD.

    Creation of this tag at the reviewed commit requires separate authorization
    and a just-in-time absence check. Leave the tag intact afterward. Deleting
    and recreating it is separately unauthorized; this is not an administrator-
    resistant global lock and requires no protected environment or secret.
    """
    e=environment;ref='refs/tags/'+ONCE_TAG
    P.require(e.get('GITHUB_ACTIONS')=='true' and e.get('GITHUB_EVENT_NAME')=='push','native execution requires the approved GitHub tag push')
    P.require(e.get('GITHUB_REPOSITORY')=='re-thc/openjdk-jdk27u' and event['repository']['full_name']=='re-thc/openjdk-jdk27u','publication repository mismatch')
    P.require(e.get('GITHUB_RUN_ATTEMPT')=='1','Workflow retries are not authorized')
    P.require(e.get('GITHUB_REF')==event['ref']==ref and e.get('GITHUB_REF_TYPE')=='tag','only the fixed one-time tag is authorized')
    P.require(event.get('created') is True and event.get('deleted') is False and event.get('forced') is False and event.get('before')=='0'*40,'only first tag creation is authorized')
    commit=e.get('GITHUB_SHA','')
    P.require(re.fullmatch('[0-9a-f]{40}',commit) is not None and commit==head==event.get('after'),'tag event SHA does not match checked-out commit')
    P.require(re.fullmatch('[1-9][0-9]*',e.get('GITHUB_RUN_ID','')) is not None,'missing publication run identity')
    return dict(repository=e['GITHUB_REPOSITORY'],approved_commit=commit,tag=ONCE_TAG,run_id=e['GITHUB_RUN_ID'],attempt=1,
        event='first lightweight tag creation',external_requirement='Separately authorize tag creation after verifying absence; leave it intact. Deletion/recreation is separately unauthorized. Operational guard, not protection against a malicious administrator.')

def verify_tag_absence(returncode,stdout):
    """Interpret git ls-remote --exit-code --refs; errors never mean absence."""
    if returncode==0:raise P.InvalidData('One-time tag already exists; leave it intact, do not delete or recreate')
    P.require(returncode==2 and not stdout.strip(),'Tag absence check failed or returned ambiguous data')
    return dict(tag=ONCE_TAG,absent=True,method='git ls-remote --exit-code --refs --tags',
        requirement='Repeat immediately before separately authorized creation; this read is not authorization.')

def check_remote_tag_absent():
    cmd=['git','ls-remote','--exit-code','--refs','--tags','https://github.com/re-thc/openjdk-jdk27u.git','refs/tags/'+ONCE_TAG]
    r=subprocess.run(cmd,capture_output=True,text=True,timeout=30,env=dict(os.environ,GIT_TERMINAL_PROMPT='0'))
    return verify_tag_absence(r.returncode,r.stdout)

def execute(out):
    out=Path(out).resolve()
    P.require(os.environ.get('GITHUB_RUN_ATTEMPT','1')=='1','Workflow retry forbidden')
    P.require((out/'STARTED').is_file(),'One-attempt marker missing')
    P.require(not (out/'coordination.jsonl').exists(),'Coordinator already started; no retry')
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    env=json.loads((out/'environment.json').read_text());os.sched_setaffinity(0,{env['cpu_pin']})
    launch=json.loads((out/'launch.json').read_text())
    return coordinate(out,lambda w:PipePeer([*launch['basecmd'],str(w),P.VERSION],out/f'worker-{w}-addresses.log'),load_score())

def main():
    p=argparse.ArgumentParser();p.add_argument('--root',type=Path);p.add_argument('--out',type=Path)
    mode=p.add_mutually_exclusive_group();mode.add_argument('--execute-once',action='store_true');mode.add_argument('--check-tag-absent',action='store_true');a=p.parse_args()
    if a.check_tag_absent:
        print(json.dumps(check_remote_tag_absent(),sort_keys=True));return 0
    P.require(a.out is not None,'--out is required for a plan or native run')
    if not a.execute_once:
        P.require(not a.out.exists() or not any(a.out.iterdir()),'Plan output must be fresh')
        pins=json.loads((HERE/'source-pins.json').read_text());groups=[];offset=0
        for family in pins['tiny_families']:
            groups.append(list(range(offset,offset+len(family['banks']))));offset+=len(family['banks'])
        P.write_plan(a.out,P.workloads(groups),origin='PLAN_ONLY_NOT_MEASURED')
        print('PLAN_ONLY: no build, native execution, timing, publication or workflow dispatch')
        return 0
    P.require(a.root is not None,'--root is required for the separately approved native run')
    event=json.loads(Path(os.environ['GITHUB_EVENT_PATH']).read_text())
    head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=a.root,text=True).strip()
    publication=authorize_publication(os.environ,event,head)
    claim_once(a.out,os.environ)
    # prepare requires only STARTED initially; write the validated receipt after preparation.
    try:out=prepare(a)
    except Exception as e:
        dump(a.out/'status.json',dict(status='PREPARATION_FAILED_NO_TIMING',error=type(e).__name__+': '+str(e),retries=0));raise
    dump(out/'approved-publication.json',publication)
    status=execute(out)
    return 2 if status['status'] in ['INCOMPLETE_TIMEOUT','INVALID_DATA_OR_PROTOCOL'] else 0

if __name__=='__main__':raise SystemExit(main())
