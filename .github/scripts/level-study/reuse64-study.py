"""Prepare first; only --execute-once can start the fixed approved measurement."""
from pathlib import Path
import argparse,csv,hashlib,importlib.util,io,json,os,platform,resource,select,shlex,shutil,subprocess,tarfile,time

HERE=Path(__file__).resolve().parent
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc'
CORPUS='9870d54525f8f5a1315da6f2f9b289fb535e26a3'
spec=importlib.util.spec_from_file_location('reuse64_score',HERE/'reuse64-score.py')
scorer=importlib.util.module_from_spec(spec);spec.loader.exec_module(scorer)
FIELDS=['seq','worker','phase','block','family','kind','quartet','position','label','level','offset']+['warm'+str(i) for i in range(8)]

def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def dump(path,value):Path(path).write_text(json.dumps(value,indent=2)+'\n')
def prepare(a):
    out=a.out.resolve()
    if out.exists() and any(out.iterdir()):raise RuntimeError('Use a new output directory; never overwrite or retry a started experiment')
    out.mkdir(parents=True,exist_ok=True)
    for name in ['src','build','source','inputs','compressed']:(out/name).mkdir()
    base='src/java.base/share/native/libzip/'
    raw=subprocess.check_output(['git','archive',PIN,base+'zlib',base+'zlib-ng'],cwd=a.root)
    with tarfile.open(fileobj=io.BytesIO(raw)) as tf:
        for item in tf:
            if item.isfile():
                p=out/'src'/item.name.removeprefix(base);p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(tf.extractfile(item).read())
    pins=json.loads((HERE/'source-pins.json').read_text())
    assert pins['head']==PIN and pins['ng']=='88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0'
    assert len(pins['ng_files'])==215
    for x in pins['ng_files']:assert sha(out/'src/zlib-ng'/x['path'])==x['sha256']
    assert '#define ZLIB_VERSION "1.3.2"' in (out/'src/zlib/zlib.h').read_text()
    patterns={'java':('src/java.base/share/classes/java/util','.java'),'hotspot':('src/hotspot/share/runtime','.cpp'),'documentation':('doc','.md')}
    original={}
    if a.corpora:
        assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=a.corpora,text=True).strip()==CORPUS
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(p.read_bytes() for p in sorted((a.corpora/directory).glob('*'+suffix)))
    else:
        raw=subprocess.check_output(['git','archive',CORPUS,*[x[0] for x in patterns.values()]],cwd=a.root)
        with tarfile.open(fileobj=io.BytesIO(raw)) as tf:files={x.name:tf.extractfile(x).read() for x in tf if x.isfile()}
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(files[n] for n in sorted(files) if str(Path(n).parent)==directory and n.endswith(suffix))
    families=[]
    for name in ['java','hotspot','documentation','repeated-A','fresh-text','fresh-json','fresh-random','fresh-mixed']:
        bankdata=[]
        for bank in range(32 if name.startswith('fresh-') else 1):
            random=hashlib.shake_256(b'fixed-order-v1-20261015:'+str(bank).encode()).digest(300)
            if name in original:data=original[name][:64]
            elif name=='repeated-A':data=b'A'*64
            elif name=='fresh-text':data=(f'{bank:02d}: Small birds crossed the garden; the reader wrote a short note beside the open window. '.encode()*3)[:64]
            elif name=='fresh-json':
                head=('{"k":'+str(bank)+',"s":"').encode();tail=b'"}';data=head+(b'alpha beta alpha gamma '*10)[:64-len(head)-len(tail)]+tail;json.loads(data)
            elif name=='fresh-random':data=random[:64]
            else:data=(b'MX'+bytes([bank,bank^0x5a])+random[:12]+b'echo echo echo '+random[12:28]+b'echo echo echo '*8)[:64]
            assert len(data)==64;bankdata.append(data)
        assert len(set(bankdata))==len(bankdata)
        family=len(families);items=[]
        for bank,data in enumerate(bankdata):
            p=out/'inputs'/f'{family}-{bank}.bin';p.write_bytes(data);items.append(dict(id=bank,path=str(p),sha256=sha(p)))
        families.append(dict(id=family,name=name,banks=items))
    assert sum(len(f['banks']) for f in families)==132
    assert families[0]['banks'][0]['sha256']=='0c36fb832661d059d17aaa0077935d2d0f4cc5232ec970ebd487a25832dc5e22'
    (out/'inputs.tsv').write_text(''.join(f"{f['id']}\t{b['id']}\t{b['path']}\n" for f in families for b in f['banks']))
    rows=[]
    for phase,workers in [(1,[0,1]),(2,[0,1]),(3,[1,0])]:
        for worker in workers:
            for block in range(12):
                order=[(block+i)%8 for i in range(8)]
                if worker:order.reverse()
                for family in order:
                    kinds=[0] if phase==2 else ([1,6] if (block+family+worker)%2==0 else [6,1])
                    for kind in kinds:
                        for quartet in range(8):
                            labels=[0,1,1,0] if (block+quartet+worker)%2==0 else [1,0,0,1]
                            count=len(families[family]['banks']);offset=(8*block+quartet)%count
                            warm=[(offset-8+j)%count for j in range(8)]
                            for position,label in enumerate(labels):
                                level=(6 if label==0 else 1) if kind==0 else kind
                                vals=[len(rows),worker,phase,block,family,kind,quartet,position,label,level,offset,*warm]
                                rows.append(dict(zip(FIELDS,vals)))
    assert len(rows)==30720
    with (out/'schedule.tsv').open('w') as f:
        w=csv.DictWriter(f,fieldnames=FIELDS,delimiter='\t',lineterminator='\n');w.writeheader();w.writerows(rows)
    manifest=dict(version=1,experiment='One approved native reuse64 experiment; previous calibration remains failed',pin=PIN,ng=pins['ng'],stock_inflate='1.3.2',corpus_pin=CORPUS,families=families,formats=[dict(windowBits=15,memLevel=8,strategy='Z_DEFAULT_STRATEGY')],physical_levels=[1,6],workers=[dict(id=0,initial_level=6),dict(id=1,initial_level=1)],coordination=['READY0','READY1','P0.pre','P1.pre','GLOBAL_PRE_GATE','P0.comparison','P1.comparison','P1.post','P0.post','QUIT_BOTH'],waiting='Workers block in getchar; coordinator blocks in select. Both images/streams stay resident. No worker runs end-to-end before the global pre gate.',warm_recipe='At each batch: reset empty, deflateParams(target) with no input/output, then exactly8 reset+FINISH warm streams at banks (offset-8+j)%K for j0..7. Timed128 streams use banks(offset+k)%K. Same fixed recipe in A/A and contrast.',predecessor='Actual target level before preparation is retained in every batch. Switched/unchanged strata retained descriptively, without exclusions or independence claim.',statistics=dict(blocks=12,quartets_per_block=8,batches_per_quartet=4,operations_per_batch=128,quartet='(sum(labelA batch wall/128)-sum(labelB batch wall/128))/2',block='arithmetic mean of8 quartet contrasts',uncertainty='Only12 chronological block observations; no batch-row pseudoreplication',calibration_critical=2.201,calibration_bound_ns=100,benefit_estimates=18,benefit_adjustment='two-sided Bonferroni Student-t(df11), quantile1-0.05/(2*18)',benefit_margin_ns=500,family_nonharm_ns=-100,max_extra_bytes_vs_ng6=8),budget=dict(pre_cells=32,pre_rows=12288,comparison_cells=16,comparison_rows=6144,post_cells=32,post_rows=12288,max_cells=80,max_rows=30720,max_operations=3932160,deadline_seconds=900,retries=0),scope='Complete64-byte wrapped streams; fixed8-warm preparation only. No Java/stock/fresh/larger/unknown-length-stream inference. PR6 Java1 maps to physical ng2.')
    dump(out/'manifest.json',manifest)
    names=['reuse64-study.c','reuse64-study.py','reuse64-score.py','reuse64-README.md','source-pins.json']
    for name in names:(out/'source'/name).write_bytes((HERE/name).read_bytes())
    workflow=HERE/'tiny-zlib-reuse64.yml'
    if not workflow.exists():workflow=a.root/'.github/workflows/tiny-zlib-reuse64.yml'
    assert workflow.exists();(out/'source/tiny-zlib-reuse64.yml').write_bytes(workflow.read_bytes())
    dump(out/'preregistered.json',dict(manifest_sha256=sha(out/'manifest.json'),schedule_sha256=sha(out/'schedule.tsv'),inputs_sha256=sha(out/'inputs.tsv'),sources={p.name:sha(p) for p in (out/'source').iterdir()},frozen_before_execution=True))
    commands=[]
    def command(cmd,log,cwd,env=None):
        commands.append(dict(argv=list(map(str,cmd)),cwd=str(cwd),environment={k:env.get(k) for k in ['CC','AR','CFLAGS','LDFLAGS']} if env else None))
        with Path(log).open('w') as f:subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
    cc='gcc-14';stock=out/'build/stock';stock.mkdir();objects=[]
    for source in sorted((out/'src/zlib').glob('*.c')):
        if source.name.startswith('gz'):continue
        obj=stock/(source.stem+'.o');command([cc,'-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',out/'src/zlib','-c',source,'-o',obj],stock/(source.stem+'.log'),out);objects.append(obj)
    command(['ar','rcs',stock/'libz.a',*objects],stock/'ar.log',out)
    ng=out/'build/ng';ng.mkdir();env=dict(os.environ,CC=cc,AR='ar',CFLAGS='-O2 -fPIC',LDFLAGS='')
    command(['bash',out/'src/zlib-ng/configure','--static','--zlib-compat','--sprefix=jdk_ng_'],ng/'configure.log',ng,env)
    command(['make','-j1','libz.a'],ng/'make.log',ng)
    command([cc,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',ng/'libz.a','-Wl,--no-whole-archive','-o',out/'build/ng.so'],ng/'link.log',out)
    command([cc,'-O2','-Wall','-Wextra','-Werror','-I',out/'src/zlib',HERE/'reuse64-study.c',stock/'libz.a','-ldl','-o',out/'build/reuse64-study'],out/'build/driver.log',out)
    flags=shlex.split(next(x[7:] for x in (ng/'Makefile').read_text().splitlines() if x.startswith('CFLAGS=')))
    command([cc,*flags,'-I',ng,'-I',out/'src/zlib-ng','-dM','-E','-include',out/'src/zlib-ng/deflate.h','-x','c','/dev/null'],ng/'defines.log',out)
    defines=(ng/'defines.log').read_text();assert '#define NO_QUICK_STRATEGY' not in defines and '#define NO_MEDIUM_STRATEGY' not in defines
    dump(out/'build-commands.json',commands)
    environment=dict(cpu=subprocess.check_output(['lscpu'],text=True),compiler=subprocess.check_output([cc,'--version'],text=True),uname=platform.uname()._asdict(),python=platform.python_version(),libc=platform.libc_ver(),affinity=sorted(os.sched_getaffinity(0)),cpu_pin=max(os.sched_getaffinity(0)),ng_flags=flags,allocator={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']})
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:environment[path]=Path(path).read_text()
        except OSError as e:environment[path]=str(e)
    dump(out/'environment.json',environment)
    dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=sha(p)) for top in ['src','build','inputs','source'] for p in (out/top).rglob('*') if p.is_file()})
    print('PREPARED:132 payloads,80 maximum cells,30720 maximum rows; no timings yet',flush=True)
    return out

def execute(out,untimed=False):
    out=out.resolve();env=json.loads((out/'environment.json').read_text());os.sched_setaffinity(0,{env['cpu_pin']});resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    base=[str(out/'build/reuse64-study'),str(out/'build/ng.so'),str(out/'inputs.tsv'),str(out/'schedule.tsv'),str(out)]
    if untimed:
        for worker in range(2):
            with (out/f'untimed-{worker}.log').open('w') as f:subprocess.run([*base,str(worker),'--untimed-only'],stdout=f,stderr=subprocess.STDOUT,check=True)
        print('UNTIMED_ONLY_COMPLETE: no worker/cell timing or STARTED marker');return 0
    if os.environ.get('GITHUB_RUN_ATTEMPT','1')!='1':raise RuntimeError('A workflow retry is not authorized')
    with (out/'STARTED').open('x') as f:f.write('One approved attempt. Never remove this marker to retry.\n')
    workers=[];logs=[];deadline=None;phases=[];result=None;comparison_started=False
    events=(out/'coordination.jsonl').open('w')
    def event(name,**extra):
        events.write(json.dumps(dict(event=name,monotonic_ns=time.monotonic_ns(),**extra))+'\n');events.flush()
    def ack(worker,want,limit):
        p=workers[worker]
        while True:
            left=limit-time.monotonic()
            if left<=0:raise RuntimeError('Fixed deadline expired; no retry or reduced budget')
            ready,_,_=select.select([p.stdout],[],[],min(30,left))
            if ready:
                got=p.stdout.readline().rstrip('\n');event('ACK',worker=worker,text=got)
                if got!=want:raise RuntimeError(f'Unexpected worker acknowledgement: {got!r}, expected {want!r}')
                return
            print('WAITING',want,flush=True)
    def phase(worker,command,number):
        event('SEND',worker=worker,command=command,phase=number)
        workers[worker].stdin.write(command+'\n');workers[worker].stdin.flush()
        ack(worker,f'DONE {worker} {number}',deadline)
    try:
        for worker in range(2):
            log=(out/f'worker-{worker}-addresses.log').open('w');logs.append(log)
            workers.append(subprocess.Popen([*base,str(worker)],stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=log,text=True,bufsize=1))
        startup=time.monotonic()+120
        ack(0,'READY 0',startup);ack(1,'READY 1',startup)
        deadline=time.monotonic()+900;event('MEASUREMENT_START',deadline_seconds=900)
        phase(0,'P',1);phase(1,'P',1);phases=[1]
        initial=scorer.score(out,[1]);dump(out/'calibration-score.json',initial)
        event('GLOBAL_PRE_GATE',passed=initial['calibration_passed'],failed=initial['failed_controls'])
        if initial['calibration_passed']:
            comparison_started=True
            phase(0,'C',2);phase(1,'C',2);phase(1,'B',3);phase(0,'B',3);phases=[1,2,3]
        if time.monotonic()>deadline:raise RuntimeError('Fixed measurement deadline expired')
        event('MEASUREMENT_COMPLETE')
        for worker,p in enumerate(workers):event('SEND',worker=worker,command='Q');p.stdin.write('Q\n');p.stdin.flush()
        for p in workers:assert p.wait(timeout=10)==0
        result=scorer.score(out,phases);dump(out/'final-score.json',result)
        status=('CALIBRATION_FAILED_COMPARISON_SKIPPED' if phases==[1] else 'POST_CALIBRATION_FAILED_UNQUALIFIED' if not result['calibration_passed'] else 'QUALIFIED_NATIVE_REUSE64_GAIN_WITHIN_BUDGET' if result['decision']['passed'] else 'QUALIFIED_CRITERIA_NOT_MET')
        dump(out/'status.json',dict(status=status,comparison_executed=2 in phases,measurement_retries=0,calibration_passed=result['calibration_passed'],decision_passed=result.get('decision',{}).get('passed',False),rows=result['rows'],cells=result['cells'],scope='Native64-byte wrapped reuse under fixed8-warm recipe; not Java/stock/fresh/long qualification'))
        scorer.report(out,result,status);print(status,flush=True)
        return 0 if status=='QUALIFIED_NATIVE_REUSE64_GAIN_WITHIN_BUDGET' else 2
    except Exception as e:
        event('INCOMPLETE',error=str(e));dump(out/'status.json',dict(status='INCOMPLETE_ERROR',error=str(e),measurement_retries=0,comparison_executed=comparison_started,calibration_passed=False,decision_passed=False,completed_phases=phases));raise
    finally:
        for p in workers:
            if p.poll() is None:p.terminate()
        for p in workers:
            try:p.wait(timeout=10)
            except subprocess.TimeoutExpired:p.kill();p.wait()
        for f in logs:f.close()
        events.close()
        dump(out/'final-files.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=sha(p)) for p in out.rglob('*') if p.is_file() and p.name!='final-files.json'})

if __name__=='__main__':
    a=argparse.ArgumentParser();a.add_argument('--root',type=Path,required=True);a.add_argument('--corpora',type=Path);a.add_argument('--out',type=Path,required=True)
    mode=a.add_mutually_exclusive_group(required=True);mode.add_argument('--prepare-only',action='store_true');mode.add_argument('--untimed-only',action='store_true');mode.add_argument('--execute-once',action='store_true')
    args=a.parse_args();out=prepare(args)
    if not args.prepare_only:raise SystemExit(execute(out,args.untimed_only))
