"""One fixed new experiment. Build/fixtures first; calibration strictly gates tiny timing."""
from pathlib import Path
import argparse,hashlib,importlib.util,io,json,os,platform,shlex,shutil,subprocess,tarfile,time
ORDER=(0,7,3,4,5,2,6,1)
HERE=Path(__file__).resolve().parent;PIN='3f71d03f3297f94e8c2cc34160262a880be337fc';CORPUS='9870d54525f8f5a1315da6f2f9b289fb535e26a3'
spec=importlib.util.spec_from_file_location('order_score',HERE/'order-score.py');scorer=importlib.util.module_from_spec(spec);spec.loader.exec_module(scorer)
def digest(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def dump(p,x):scorer.dump(p,x)
def command(cmd,log,cwd,env=None):
    with Path(log).open('w') as f:subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
def prepare(a):
    out=a.out.resolve()
    if (out/'STARTED').exists():raise RuntimeError('Refusing to overwrite a previously started experiment')
    out.mkdir(parents=True,exist_ok=True)
    for name in ['src','build','inputs','compressed','source']:(out/name).mkdir(exist_ok=True)
    base='src/java.base/share/native/libzip/'
    raw=subprocess.check_output(['git','archive',PIN,base+'zlib',base+'zlib-ng'],cwd=a.root)
    with tarfile.open(fileobj=io.BytesIO(raw)) as tf:
        for item in tf:
            if item.isfile():p=out/'src'/item.name.removeprefix(base);p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(tf.extractfile(item).read())
    pins=json.loads((HERE/'source-pins.json').read_text())
    for x in pins['ng_files']:assert digest(out/'src/zlib-ng'/x['path'])==x['sha256']
    assert '#define ZLIB_VERSION "1.3.2"' in (out/'src/zlib/zlib.h').read_text()
    original={};patterns={'java':('src/java.base/share/classes/java/util','.java'),'hotspot':('src/hotspot/share/runtime','.cpp'),'documentation':('doc','.md')}
    if a.corpora:
        assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=a.corpora,text=True).strip()==CORPUS
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(p.read_bytes() for p in sorted((a.corpora/directory).glob('*'+suffix)))
    else:
        raw=subprocess.check_output(['git','archive',CORPUS,*[x[0] for x in patterns.values()]],cwd=a.root)
        with tarfile.open(fileobj=io.BytesIO(raw)) as tf:files={x.name:tf.extractfile(x).read() for x in tf if x.isfile()}
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(files[n] for n in sorted(files) if str(Path(n).parent)==directory and n.endswith(suffix))
    natural=b'The morning train passed the old station. A reader opened a small book, while rain moved across the window. The next page described a garden, a wooden gate, and a path beside the river. Later the clouds lifted and the street became quiet. '
    entropy=hashlib.shake_256(b'level-study-fixed-20261014').digest(12000)
    oldmixed=b''.join((natural[(i*17)%100:]+bytes([65+i%9])*31+entropy[i*47:i*47+37]+natural[:100]) for i in range(40))
    cases=[]
    def add(family,n,banks,phase):
        ci=len(cases);items=[]
        for bank,data in enumerate(banks):
            assert len(data)==n;p=out/'inputs'/f'{ci}-{bank}.bin';p.write_bytes(data);items.append(dict(id=bank,path=str(p),sha256=digest(p)))
        cases.append(dict(id=ci,family=family,size=n,phase=phase,banks=items))
    add('calibration-java',64,[original['java'][:64]],1);add('calibration-oldmixed',4096,[oldmixed[:4096]],1)
    assert cases[0]['banks'][0]['sha256']=='0c36fb832661d059d17aaa0077935d2d0f4cc5232ec970ebd487a25832dc5e22'
    assert cases[1]['banks'][0]['sha256']=='76a38993e452bf2d22ac4e0531861422c8bdb2261e19f07982b76058d28b4112'
    for family in ['java','hotspot','documentation','repeated-A','fresh-text','fresh-json','fresh-random','fresh-mixed']:
        for n in [32,64,128]:
            banks=[]
            for bank in range(32 if family.startswith('fresh') else 1):
                seed=b'fixed-order-v1-20261015:'+str(bank).encode();random=hashlib.shake_256(seed).digest(300)
                if family in original:data=original[family][:n]
                elif family=='repeated-A':data=b'A'*n
                elif family=='fresh-text':data=(f'{bank:02d}: Small birds crossed the garden; the reader wrote a short note beside the open window. '.encode()*3)[:n]
                elif family=='fresh-json':
                    head=('{"k":'+str(bank)+',"s":"').encode();tail=b'"}';data=head+(b'alpha beta alpha gamma '*10)[:n-len(head)-len(tail)]+tail;json.loads(data)
                elif family=='fresh-random':data=random[:n]
                else:data=(b'MX'+bytes([bank,bank^0x5a])+random[:12]+b'echo echo echo '+random[12:28]+b'echo echo echo '*8)[:n]
                banks.append(data)
            assert len(set(banks))==len(banks);add(family,n,banks,2)
    assert len(cases)==26 and sum(len(c['banks']) for c in cases)==398
    (out/'inputs.tsv').write_text(''.join(f"{c['id']}\t{b['id']}\t{c['size']}\t{b['path']}\t{c['family']}\n" for c in cases for b in c['banks']))
    cells=[]
    def append(phase,case,raw,mode,ca,cb,control,copy):
        cells.append(dict(id=len(cells),phase=phase,case=case,raw=raw,mode=mode,ca=ca,cb=cb,control=control,copy=copy,blocks=6 if phase==2 else 12,pairs=6 if phase==2 else 20,iterations=32 if phase==2 else 128))
    def calibration(phase):
        for config in range(4):
            for ci in [0,1]:
                for raw in [0,1]:
                    for mode in [0,1,2]:
                        for control in [0,1,2]:append(phase,ci,raw,mode,config,config,control,0)
    calibration(1)
    pairs=[(0,1),(0,2),(0,3),(1,2),(1,3),(3,2)]
    for c in cases[2:]:
        for raw in [0,1]:
            for mode in [1,2]:
                for ca,cb in pairs:
                    for copy in [0,1]:append(2,c['id'],raw,mode,ca,cb,-1,copy)
    calibration(3);assert len(cells)==1440
    (out/'schedule.tsv').write_text(''.join('\t'.join(str(c[k]) for k in ['phase','id','case','raw','mode','ca','cb','control','copy','blocks','pairs','iterations'])+'\n' for c in cells))
    manifest=dict(version=1,calibration_worker_order=list(ORDER),tiny_worker_order=list(reversed(ORDER)),experiment='New fixed order-calibration experiment; never rescoring or rescuing the previous sweep',pin=PIN,ng=pins['ng'],stock='1.3.2',corpus_pin=CORPUS,configs=scorer.CONFIGS,layouts=[dict(id=i,load_reverse=(i>>2)&1,swap_slots=(i>>1)&1,init_reverse=i&1) for i in range(8)],cases=cases,cells=cells,criterion='All1152 initial controls: abs(mean of12 chronological block paired deltas)+2.201*SEM<=100ns. Also require fixed physical-slot bound<=100ns for each nonshared control. No correction, trimming, cell exclusion or retry. Tiny runs only if every initial control passes. All1152 post controls must also pass for tiny timing qualification.',budget=dict(calibration_cells=1152,calibration_rows=552960,comparison_cells=9216,comparison_rows=663552,post_cells=1152,post_rows=552960,max_rows=1769472,max_pairs=884736),semantics='Every byte array is a complete known input before FINISH. Fresh cases rotate32 distinct fixed byte arrays, the same bank sequence in both arms. They are not an unbounded never-before-seen stream. Java1 remains physical ng2. No stream-chunk size inference.',coordination='Eight workers load fixed images and run calibration serially on one pinned CPU; each blocks with mappings resident. After all eight controls complete, send STOP to all if any fails; otherwise send GO serially. Each GO performs every tiny comparison then its fixed post bracket. No failure changes the declared sample budget.',ordering='Load order reverses all four exact byte-identical image copies. Slot assignment and initial creation/priming order form independent bits. Same-image two-state logical arms additionally reverse by block; physical effects retained. Separate-image logical arms keep image identity. Create/end actual creation rank coincides with execution order; controlled priming history is separate, not a claim of independent isolation.',guard='Untimed calibration inputs only before initial gate. Tiny roundtrips only after GO. Every image copy and configuration is stock-inflated and exact byte compared; A/B copies must emit exact bytes. Timed byte sums/last lengths checked; representative final output per physical state per block inflated outside timing. Not every timed operation inflated.')
    dump(out/'manifest.json',manifest)
    for name in ['order-study.c','order-study.py','order-score.py','order-README.md','source-pins.json']:(out/'source'/name).write_bytes((HERE/name).read_bytes())
    dump(out/'preregistered.json',dict(manifest_sha256=digest(out/'manifest.json'),source={n:digest(HERE/n) for n in ['order-study.c','order-study.py','order-score.py','order-README.md','source-pins.json']},samples_generated_before_execution=True))
    cc='gcc-14';stock=out/'build/stock';stock.mkdir(exist_ok=True);objects=[]
    for source in sorted((out/'src/zlib').glob('*.c')):
        if source.name.startswith('gz'):continue
        obj=stock/(source.stem+'.o');command([cc,'-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',out/'src/zlib','-c',source,'-o',obj],stock/(source.stem+'.log'),out);objects.append(obj)
    command(['ar','rcs',stock/'libz.a',*objects],stock/'ar.log',out);command([cc,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',stock/'libz.a','-Wl,--no-whole-archive','-o',out/'build/stock-A.so'],stock/'link.log',out)
    ng=out/'build/ng';ng.mkdir(exist_ok=True);env=dict(os.environ,CC=cc,AR='ar',CFLAGS='-O2 -fPIC',LDFLAGS='')
    command(['bash',out/'src/zlib-ng/configure','--static','--zlib-compat','--sprefix=jdk_ng_'],ng/'configure.log',ng,env);command(['make','-j1','libz.a'],ng/'make.log',ng)
    command([cc,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',ng/'libz.a','-Wl,--no-whole-archive','-o',out/'build/ng-A.so'],ng/'link.log',out)
    for family in ['stock','ng']:
        shutil.copyfile(out/'build'/(family+'-A.so'),out/'build'/(family+'-B.so'));assert digest(out/'build'/(family+'-A.so'))==digest(out/'build'/(family+'-B.so'));assert (out/'build'/(family+'-A.so')).stat().st_ino!=(out/'build'/(family+'-B.so')).stat().st_ino
    command([cc,'-O2','-Wall','-Wextra','-Werror','-I',out/'src/zlib',HERE/'order-study.c',stock/'libz.a','-ldl','-o',out/'build/order-study'],out/'build/driver.log',out)
    flags=shlex.split(next(x[7:] for x in (ng/'Makefile').read_text().splitlines() if x.startswith('CFLAGS=')))
    command([cc,*flags,'-I',ng,'-I',out/'src/zlib-ng','-dM','-E','-include',out/'src/zlib-ng/deflate.h','-x','c','/dev/null'],ng/'defines.log',out)
    defines=(ng/'defines.log').read_text();assert '#define NO_QUICK_STRATEGY' not in defines and '#define NO_MEDIUM_STRATEGY' not in defines
    environment=dict(cpu=subprocess.check_output(['lscpu'],text=True),compiler=subprocess.check_output([cc,'--version'],text=True),uname=platform.uname()._asdict(),affinity=sorted(os.sched_getaffinity(0)),cpu_pin=max(os.sched_getaffinity(0)),ng_flags=flags,allocator={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']})
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:environment[path]=Path(path).read_text()
        except OSError as e:environment[path]=str(e)
    dump(out/'environment.json',environment)
    dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=digest(p)) for top in ['src','build','inputs','source'] for p in (out/top).rglob('*') if p.is_file()})
    print('PREPARED',len(cases),'cases,398 payloads,1152 initial controls,9216 conditional comparisons,1152 post controls',flush=True)
    return out

def execute(out,smoke=False):
    out=out.resolve();env=json.loads((out/'environment.json').read_text());os.sched_setaffinity(0,{env['cpu_pin']})
    base=[str(out/'build/order-study'),*[str(out/'build'/(x+'.so')) for x in ['stock-A','stock-B','ng-A','ng-B']],str(out/'inputs.tsv'),str(out/'schedule.tsv'),str(out)]
    if smoke:
        command([*base,'0','--untimed-only'],out/'untimed-only.log',out);print('UNTIMED_ONLY_COMPLETE; no calibration or comparison timing executed');return
    with (out/'STARTED').open('x') as f:f.write('One fixed experiment; never delete to retry.\n')
    workers=[];streams=[];deadline=time.monotonic()+40*60
    try:
        for layout in ORDER:
            stdout=(out/f'worker-{layout}.csv').open('w');stderr=(out/f'worker-{layout}-addresses.log').open('w');streams.extend([stdout,stderr]);p=subprocess.Popen([*base,str(layout)],stdin=subprocess.PIPE,stdout=stdout,stderr=stderr,text=True);workers.append(p)
            while not (out/f'worker-{layout}.ready').exists():
                if p.poll() is not None:raise RuntimeError(f'Worker{layout} ended before calibration ready: {p.returncode}')
                if time.monotonic()>deadline:raise RuntimeError('Fixed workflow safety deadline expired')
                time.sleep(.1)
        initial=scorer.score(out,[1]);dump(out/'calibration-score.json',initial);go=initial['qualified'];print('CALIBRATION',go,initial['failed_controls'],flush=True)
        if not go:
            for p in workers:p.stdin.write('S\n');p.stdin.flush()
            for p in workers:assert p.wait(timeout=30)==0
            result=initial;status='CALIBRATION_FAILED_TINY_SKIPPED'
        else:
            for p in reversed(workers):
                p.stdin.write('G\n');p.stdin.flush();assert p.wait(timeout=max(1,deadline-time.monotonic()))==0
            result=scorer.score(out,[1,2,3]);status='ALL_GATES_PASSED' if result['qualified'] else 'POST_GATE_FAILED_TINY_UNQUALIFIED'
        import re
        images=[];buffers={}
        for i in range(8):
            for line in (out/f'worker-{i}-addresses.log').read_text().splitlines():
                if line.startswith('IMAGE '):images.append(dict(re.findall(r'(\w+)=([^ ]+)',line)))
                if line.startswith('OWNED '):
                    fields=dict(re.findall(r'(\w+)=([^ ]+)',line));key=str(i)+':'+fields['slot'];buffers.setdefault(key,set()).add((fields['stream'],fields['output']))
        dump(out/'address-summary.json',dict(images=images,slot_buffers={key:sorted(values) for key,values in buffers.items()},full_maps_and_state_batches='Full original address logs and raw CSV are retained, not replaced by these summaries.'))
        dump(out/'final-score.json',result);scorer.sizes_report(out);scorer.report(out,result,status);dump(out/'status.json',dict(status=status,tiny_executed=go,measurement_retries=0,qualification=result['qualified'],rows=result['rows'],cells=result['cells']));print(status,flush=True)
    finally:
        for p in workers:
            if p.poll() is None:p.terminate()
        for p in workers:
            try:p.wait(timeout=10)
            except subprocess.TimeoutExpired:p.kill();p.wait()
        for f in streams:f.close()
    return 0 if result['qualified'] else 2
if __name__=='__main__':
    a=argparse.ArgumentParser();a.add_argument('--root',type=Path,required=True);a.add_argument('--corpora',type=Path);a.add_argument('--out',type=Path,required=True);a.add_argument('--prepare-only',action='store_true');a.add_argument('--untimed-only',action='store_true');args=a.parse_args();out=prepare(args)
    if not args.prepare_only:raise SystemExit(execute(out,args.untimed_only))
