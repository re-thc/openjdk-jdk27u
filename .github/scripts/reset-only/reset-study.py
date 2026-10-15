"""Prepare/check by default. Only --execute-once starts the proposed timing."""
from pathlib import Path
import argparse,base64,csv,hashlib,importlib.util,io,json,os,platform,resource,select,shlex,shutil,subprocess,tarfile,time
HERE=Path(__file__).resolve().parent
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc'
FIELDS=['seq','worker','phase','block','work','kind','quartet','position','label','arm','offset']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2)+'\n')
def load_score():
    spec=importlib.util.spec_from_file_location('reset_score',HERE/'reset-score.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
def prepare(a):
    out=a.out.resolve();assert not out.exists() or not any(out.iterdir()),'Fresh output only; no overwrite/retry'
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
    rings=[[base+groups[f][b%len(groups[f])] for b in range(32) for f in range(8)] for base in [0,132]]
    works=[]
    for name,section,life,banks in [('reuse32',0,0,rings[0]),('reuse64',0,0,rings[1]),('reuse0-eligible-boundary',0,0,[264]),('reuse65-full-fallback',0,0,[265]),('fresh32',0,1,rings[0]),('fresh64',0,1,rings[1]),('long-text-prefix64',0,2,[266]),('long-random-prefix64',0,2,[267]),('reset-only32',1,0,rings[0]),('reset-only64',1,0,rings[1])]:
        long=life==2;works.append(dict(id=len(works),name=name,section=section,life=life,iterations=8 if long else 128,warm=1 if long else 8,quartets=1 if long else 2,banks=banks))
    (out/'inputs.tsv').write_text(''.join(f"{x['id']}\t{x['path']}\n" for x in inputs));(out/'workloads.tsv').write_text(''.join('\t'.join(str(w[k]) for k in ['id','section','life','iterations','warm','quartets'])+'\t'+','.join(map(str,w['banks']))+'\n' for w in works))
    rows=[]
    for phase in [1,2,3]:
        for block in range(12):
            workers=[0,1] if (block+(phase==3))%2==0 else [1,0]
            for worker in workers:
                order=list(range(10));shift=block%10;order=order[shift:]+order[:shift]
                if worker or phase==3:order.reverse()
                for wi in order:
                    w=works[wi];kinds=[4] if wi>=8 else ([3,4] if wi<2 else [3])
                    if phase!=2:kinds=[(block+worker+wi+j)%3 for j in range(3)]
                    for kind in kinds:
                        arms=([0,0] if kind==0 else [3,3] if kind==1 and wi>=8 else [1,1] if kind==1 else [0,2] if kind==2 else [0,1] if kind==3 else [2,3])
                        for q in range(w['quartets']):
                            labels=[0,1,1,0] if (block+worker+q)%2==0 else [1,0,0,1];offset=(128*block+8*q)%len(w['banks'])
                            for pos,label in enumerate(labels):rows.append(dict(zip(FIELDS,[len(rows),worker,phase,block,wi,kind,q,pos,label,arms[label],offset])))
    assert len(rows)==12480 and [sum(r['phase']==p for r in rows) for p in [1,2,3]]==[5184,2112,5184]
    with (out/'schedule.tsv').open('w') as f:writer=csv.DictWriter(f,fieldnames=FIELDS,delimiter='\t',lineterminator='\n');writer.writeheader();writer.writerows(rows)
    manifest=dict(experiment='THIN_RESET_ONLY_NATIVE_PILOT',pin=PIN,ng=pins['ng'],patch_sha256=pins['patch_sha256'],physical_level=6,window=15,memLevel=8,strategy=0,inputs=inputs,workloads=works,arms={'0':'unchanged ng public reset','1':'sparse ng public reset','2':'same sparse build, wrapper forces full reset','3':'same wrapper, preserves eligibility'},controls={'0':'same-code N/N','1':'same-code S/S (wrapper U/U for reset-only)','2':'full-clear equivalence N/F; includes bookkeeping/control-call cost, no subtraction'},statistics=dict(blocks=12,short_quartets=2,long_quartets=1,calibration_critical=2.201,calibration_ns=100,simultaneous_estimates=24,benefit_ns=500,nonharm_ns=-100,fallback_upper_ratio=1.01),budget=dict(workloads=10,complete_operation_workloads=8,reset_only_workloads=2,pre_controls=60,post_controls=60,pre_rows=5184,comparison_rows=2112,post_rows=5184,max_rows=12480,empty_timer_records=24,measurement_seconds=900,retries=0),scope='Pooled equal-eight-family finite 132-bank population at32/64, native physical6 only. No per-family, stock-relative, Java, shipping or whole-PR qualification. 0B is eligible,65B/fresh/long are fallbacks. Long first64 NO_FLUSH then rest FINISH. Complete operation is FINISH+reset; fresh is init+FINISH+end. Reset-only times only reset, with finish outside each segment. Every control including long retains100ns bound.',independent_review=pins['independent_review'])
    dump(out/'manifest.json',manifest)
    for name in ['reset-study.c','reset-study.py','reset-score.py','reset-invariants.c','backend-reset.patch','source-pins.json']:shutil.copyfile(HERE/name,out/'source'/name)
    workflow=HERE.parents[1]/'workflows/tiny-zlib-reset-only.yml';assert workflow.exists();shutil.copyfile(workflow,out/'source/tiny-zlib-reset-only.yml')
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
    for worker in [0,1]:
        tmp=out/f'untimed-{worker}';tmp.mkdir();(tmp/'compressed').mkdir();args=basecmd.copy();args[6]=str(tmp);command([*args,str(worker),'protocol-v1','--untimed-only'],out/f'untimed-{worker}.log',out)
    for worker in [0,1]:
        tmp=out/f'control-check-{worker}';tmp.mkdir();(tmp/'compressed').mkdir();args=basecmd.copy();args[0]=str(checkdriver);args[2]=libraries['V'];args[6]=str(tmp);command([*args,str(worker),'protocol-v1','--untimed-only'],out/f'control-check-{worker}.log',out)
    dump(out/'launch.json',dict(basecmd=basecmd,libraries=libraries))
    env=dict(cpu=subprocess.check_output(['lscpu'],text=True),compiler=subprocess.check_output(['gcc-14','--version'],text=True),uname=platform.uname()._asdict(),libc=platform.libc_ver(),affinity=sorted(os.sched_getaffinity(0)),cpu_pin=max(os.sched_getaffinity(0)),allocator={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']})
    for p in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:env[p]=Path(p).read_text()
        except OSError as e:env[p]=str(e)
    dump(out/'environment.json',env);dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=sha(p)) for top in ['source','inputs','build'] for p in (out/top).rglob('*') if p.is_file()})
    print('PREPARED_AND_UNTIMED_CHECKED:10 workloads,12480 maximum principal rows; no timing started',flush=True);return out
def execute(out):
    out=out.resolve();assert os.environ.get('GITHUB_RUN_ATTEMPT','1')=='1','No workflow retry'
    with (out/'STARTED').open('x') as f:f.write('One fixed attempt; never remove to retry\n')
    resource.setrlimit(resource.RLIMIT_CORE,(0,0));env=json.loads((out/'environment.json').read_text());os.sched_setaffinity(0,{env['cpu_pin']});launch=json.loads((out/'launch.json').read_text());base=launch['basecmd'];score=load_score();plans=[{k:int(v) for k,v in x.items()} for x in csv.DictReader((out/'schedule.tsv').open(),delimiter='\t')];workers=[];logs=[];events=[]
    def event(**x):events.append(dict(monotonic_ns=time.monotonic_ns(),**x));dump(out/'coordination.json',events)
    def ack(w,want,deadline):
        while True:
            left=deadline-time.monotonic();assert left>0,'Fixed deadline expired'
            ready,_,_=select.select([workers[w].stdout],[],[],min(left,30))
            if ready:got=workers[w].stdout.readline().strip();assert got==want,(got,want);return
            print('WAITING',want,flush=True)
    phases=[]
    try:
        for w in [0,1]:
            f=(out/f'worker-{w}-addresses.log').open('w');logs.append(f);workers.append(subprocess.Popen([*base,str(w),'protocol-v1'],stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=f,text=True,bufsize=1))
        startup=time.monotonic()+120
        for w in [0,1]:ack(w,f'READY {w}',startup)
        deadline=time.monotonic()+900;event(event='MEASUREMENT_START',deadline_seconds=900)
        for phase in [1,2,3]:
            prior=None
            for r in [r for r in plans if r['phase']==phase]:
                w=r['worker'];p=workers[w];block=(r['block'],w)
                if phase==2 and block!=prior:p.stdin.write(f"E {r['block']}\n");p.stdin.flush();ack(w,f"EMPTY {w} {r['block']}",deadline)
                prior=block;p.stdin.write(f"M {r['seq']}\n");p.stdin.flush();ack(w,f"DONE {r['seq']}",deadline)
            phases.append(phase)
            if phase==1:
                result=score.score(out,phases);dump(out/'pre-score.json',result);event(event='GLOBAL_PRE_GATE',passed=result['calibration_passed'],failed=result['failed_controls'])
                if not result['calibration_passed']:break
        event(event='MEASUREMENT_COMPLETE',phases=phases)
        for p in workers:p.stdin.write('Q\n');p.stdin.flush()
        for p in workers:assert p.wait(timeout=120)==0
        result=score.score(out,phases);dump(out/'score.json',result);score.report(out,result)
        dump(out/'status.json',dict(status='PRE_GATE_FAILED_COMPARISON_SKIPPED' if phases==[1] else 'POST_GATE_FAILED_UNQUALIFIED' if not result['calibration_passed'] else 'NATIVE_PILOT_CRITERIA_PASSED_NOT_PR_QUALIFICATION' if result['decision']['passed'] else 'NATIVE_PILOT_CRITERIA_NOT_MET',rows=result['rows'],retries=0,phases=phases))
    except Exception as e:dump(out/'status.json',dict(status='INCOMPLETE',error=str(e),completed_phases=phases,retries=0));raise
    finally:
        for p in workers:
            if p.poll() is None:p.terminate()
        for f in logs:f.close()
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--root',type=Path,required=True);p.add_argument('--out',type=Path,required=True);p.add_argument('--execute-once',action='store_true');a=p.parse_args()
    if a.execute_once:assert os.environ.get('GITHUB_RUN_ATTEMPT','1')=='1','Workflow retries are not authorized'
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    out=prepare(a)
    if a.execute_once:execute(out)
