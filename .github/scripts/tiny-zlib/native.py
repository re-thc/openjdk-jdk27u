"""Serial native experiment. No production source mutation or JDK build."""
from pathlib import Path
import argparse,collections,csv,hashlib,json,math,os,platform,shlex,shutil,statistics,subprocess,sys,time
from score_batch import score
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc'
NG='88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0'
CORPUS='9870d54525f8f5a1315da6f2f9b289fb535e26a3'
CC='gcc-14'
a=argparse.ArgumentParser();a.add_argument('--root',type=Path,required=True);a.add_argument('--corpora',type=Path,required=True);a.add_argument('--out',type=Path,required=True);a.add_argument('--aa-only',action='store_true');a.add_argument('--controls-only',action='store_true');args=a.parse_args()
ROOT=args.root.resolve();CORPORA=args.corpora.resolve();OUT=args.out.resolve();TOOLS=Path(__file__).resolve().parent
OUT.mkdir(parents=True,exist_ok=True)
for d in ['logs','builds','sources','payloads','calibration','paired','retained','correctness','trees']:(OUT/d).mkdir(exist_ok=True)
state=dict(pin=PIN,ng=NG,stock='1.3.2',corpus=CORPUS,status='preparing',calibrations=[],qualified={},measurements=[],commands=[],warnings=['Prior v1/v2/v3 instruction-count rejections are warnings, not measured stream-latency regressions.','Baseline ng has an unresolved separate Memcheck match-insertion finding.','Timed cells verify representative final results; separate exact-byte matrices verify every complete test stream.'])

def note(*x):print(*x,flush=True)
def dump(path,value):Path(path).write_text(json.dumps(value,indent=2))
def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def run(cmd,log=None,cwd=ROOT,env=None):
    cmd=list(map(str,cmd));state['commands'].append(dict(argv=cmd,cwd=str(cwd)))
    if log:
        log=Path(log);log.parent.mkdir(parents=True,exist_ok=True)
        with log.open('w') as f:subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
    else:subprocess.run(cmd,cwd=cwd,env=env,check=True)
def capture(cmd,cwd=ROOT):return subprocess.check_output(list(map(str,cmd)),cwd=cwd,text=True)
def write_state():dump(OUT/'results.json',state)
def stock_build():
    b=OUT/'builds/stock';b.mkdir(exist_ok=True);objs=[]
    with (b/'build.log').open('w') as log:
        for p in sorted((OUT/'sources/stock').glob('*.c')):
            if p.name.startswith('gz'):continue
            obj=b/(p.stem+'.o');cmd=[CC,'-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',OUT/'sources/stock','-c',p,'-o',obj];state['commands'].append(dict(argv=list(map(str,cmd)),cwd=str(ROOT)));subprocess.run(list(map(str,cmd)),stdout=log,stderr=log,check=True);objs.append(obj)
        subprocess.run(['ar','rcs',str(b/'stock.a'),*map(str,objs)],stdout=log,stderr=log,check=True)
    return b/'stock.a'
def ng_build(name,source,prefix,sanitized=False):
    b=OUT/'builds'/name;b.mkdir(exist_ok=True)
    flags='-O1 -g -fPIC -fno-omit-frame-pointer -fsanitize=address,undefined' if sanitized else '-O2 -fPIC'
    env=dict(os.environ,CC=CC,AR='ar',CFLAGS=flags,LDFLAGS='-fsanitize=address,undefined' if sanitized else '')
    run(['bash',source/'configure','--static','--zlib-compat','--sprefix='+prefix],b/'configure-output.log',cwd=b,env=env)
    # Serial builds and all tests precede performance; no build overlaps a measurement.
    run(['make','-j1','libz.a'],b/'build.log',cwd=b)
    name_so='libbaseline.so' if prefix=='jdk_ng_' else 'libcandidate.so'
    so=b/name_so
    run([CC,'-shared',*(['-fsanitize=address,undefined'] if sanitized else []),'-Wl,-Bsymbolic','-Wl,--whole-archive',b/'libz.a','-Wl,--no-whole-archive','-o',so],b/'link.log')
    return dict(dir=b,archive=b/'libz.a',so=so,source=source,prefix=prefix)
def driver(source,name,libs,defines=(),sanitized=False):
    path=OUT/'builds'/name
    flags=['-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined'] if sanitized else ['-O2']
    cmd=[CC,*flags,*defines,'-I',OUT/'sources/stock',TOOLS/source,stock]
    for lib in libs:cmd.extend(['-L',lib['dir'],'-l:'+lib['so'].name])
    cmd.extend(['-Wl,-rpath,'+':'.join(str(x['dir']) for x in libs),'-o',path]);run(cmd,OUT/'logs'/('compile-'+name+'.log'));return path
def identities():
    files={}
    for base in [OUT/'sources',OUT/'builds',OUT/'payloads',TOOLS]:
        for p in base.rglob('*'):
            if p.is_file() and '__pycache__' not in p.parts and p.suffix!='.pyc':
                label=str(p.relative_to(OUT)) if p.is_relative_to(OUT) else 'experiment/'+str(p.relative_to(TOOLS));files[label]=dict(sha256=sha(p),bytes=p.stat().st_size)
    dump(OUT/'identities.json',files)
def report():
    lines=['# Tiny zlib native diagnostic','',f"Status: **{state['status']}**",'',f'Production source: {PIN}; ng {NG}; stock 1.3.2.','',f"CPU: {state.get('cpu_model','unknown')}; affinity: {state.get('cpu','unknown')}",'', '## A/A calibration','']
    for c in state['calibrations']:
        lines.append(f"- {c['label']}: {'PASS' if c['passed'] else 'FAIL'}")
        for key,value in c['cells'].items():lines.append(f"  - {key}: B−A {value['mean_delta_ns']:.2f} ns; 95% CI {value['ci95_ns'][0]:.2f} to {value['ci95_ns'][1]:.2f} ns; absolute bound {value['absolute_error_bound_ns']:.2f} ns.")
    lines.extend(['','Calibration requires each absolute 95% bound ≤100 ns; no exclusions or retry-until-pass. Thread CPU, contexts, faults and throttle counters are retained in raw CSV. Missing cgroup fields must be interpreted from the retained controller snapshot, not as proof of zero throttling.','','## Candidate correctness',''])
    for name,q in state['qualified'].items():lines.append(f"- {name}: {'native exact-byte, tree and ASan/UBSan gates passed' if q['passed'] else 'INVALID: '+q.get('error','failed')}")
    if state['measurements']:
        lines.extend(['','## Level-6 original 64-byte prefixes','', '| Comparison | Payload | Mode | B−A ns (95% CI) | B/A (95% CI) | Bytes A/B |','|---|---|---|---|---|---|'])
        for x in state['measurements']:
            if x['payload'] not in ['java-o0-64','hotspot-o0-64','documentation-o0-64'] or x['level']!=6:continue
            d=x['ci95_delta_ns'];r=x['ci95_ratio'];lines.append(f"| {x['comparison']} | {x['payload']} | {x['mode']} | {x['mean_B_minus_A_ns']:.1f} ({d[0]:.1f}, {d[1]:.1f}) | {x['paired_geomean_B_over_A']:.4f} ({r[0]:.4f}, {r[1]:.4f}) | {x['output_bytes']} |")
        lines.extend(['','Complete tiny/ordinary/long cells and raw pairs are in results.json and paired/. Ordinary/long meaningful-regression screening uses a predeclared 1% bound. Tiny parity screening uses the calibrated 100 ns bound; neither screen is a universal speed guarantee.'])
        if 'screening' in state:lines.extend(['','## Predeclared screening','', '```json',json.dumps(state['screening'],indent=2),'```'])
    lines.extend(['','## Interpretation','',*['- '+w for w in state['warnings']],'','No patched-JDK performance claim: this job builds native libraries and C drivers only. PR6 is not changed or merged.'])
    if 'error' in state:lines.extend(['','## Experimental failure','',state['error']])
    (OUT/'report.md').write_text('\n'.join(lines)+'\n');write_state()
def calibration(label):
    note('CALIBRATION_START',label);p=OUT/'calibration'/(label+'.csv');run([cal_aa,OUT/'payloads/java-o0-64.bin'],p)
    run([sys.executable,TOOLS/'score_calibration.py',p],OUT/'calibration'/(label+'.log'))
    g=json.loads(p.with_suffix('.gate.json').read_text());state['calibrations'].append(dict(label=label,**g));write_state()
    note('CALIBRATION_RESULT',label,json.dumps(dict(passed=g['passed'],cells={k:dict(mean_delta_ns=v['mean_delta_ns'],ci95_ns=v['ci95_ns'],absolute_error_bound_ns=v['absolute_error_bound_ns']) for k,v in g['cells'].items()})))
    return g['passed']
def assets():
    payload=OUT/'payloads';patterns={'java':'src/java.base/share/classes/java/util/*.java','hotspot':'src/hotspot/share/runtime/*.cpp','documentation':'doc/*.md'}
    for name,pattern in patterns.items():
        data=b''.join(p.read_bytes() for p in sorted(CORPORA.glob(pattern)));assert data
        (OUT/'retained'/(name+'.bin')).write_bytes(data)
        for offset in [0,127,4096,17001]:(payload/f'{name}-o{offset}-64.bin').write_bytes(data[offset:offset+64])
        for n in [1024,65536,1048576]:(payload/f'{name}-{n}.bin').write_bytes((data*((n+len(data)-1)//len(data)))[:n])
    for n in [0,1,2,3,4,31,63,64,65,128,256,1024,65536,1048576]:
        for name,data in [('zeros',bytes(n)),('random',hashlib.shake_256(b'tiny-zlib-repeatable').digest(n)),('repeat',(b'abcd abcdef abcdefgh\n'*((n+19)//20))[:n]),('json',(b'{"id":17,"ok":true,"msg":"hello hello"}\n'*((n+35)//36+1))[:n])]:
            if len(data)<n:data=(data*((n+len(data)-1)//len(data)))[:n]
            (payload/f'{name}-{n}.bin').write_bytes(data)
    dump(OUT/'payloads.json',{p.name:dict(bytes=p.stat().st_size,sha256=sha(p)) for p in sorted(payload.glob('*.bin'))})
def tree_test(name,lib):
    target=OUT/'trees'/('tree-'+name);source=target.with_suffix('.c');source.write_text((TOOLS/'tree_cases.c').read_text().replace('TREE_SOURCE',str(lib['source']/'trees.c')))
    flags=shlex.split(next(x[7:] for x in (lib['dir']/'Makefile').read_text().splitlines() if x.startswith('CFLAGS=')))
    run([CC,*flags,'-I',lib['dir'],'-I',lib['source'],source,lib['archive'],'-o',target],OUT/'logs'/('tree-build-'+name+'.log'))
    data=target.with_suffix('.bin')
    with data.open('wb') as f:subprocess.run([str(target)],stdout=f,check=True)
    return dict(file=str(data),sha256=sha(data),bytes=data.stat().st_size)
def bench_campaign(label,binary,cells):
    note('CAMPAIGN_START',label,len(cells));folder=OUT/'paired'/label;folder.mkdir(exist_ok=True)
    for payload,level,mode in cells:
        source=OUT/'payloads'/(payload+'.bin');n=source.stat().st_size;iters=128 if n<=1024 else 4 if n<=65536 else 1
        p=folder/f'{payload}-{level}-{mode}.csv';run([binary,source,level,mode,iters,6,10],p)
        state['measurements'].append(dict(comparison=label,payload=payload,level=level,mode=mode,size=n,iterations=iters,raw=str(p.relative_to(OUT)),**score(p)))
    write_state();note('CAMPAIGN_DONE',label)
def screening():
    results={}
    for v,q in state['qualified'].items():
        if not q['passed']:results[v]={'valid':False};continue
        tiny=[x for x in state['measurements'] if x['comparison']==v+'-stock' and x['level']==6 and x['size']==64]
        big=[x for x in state['measurements'] if x['comparison']=='baseline-'+v and x['size']>=1024]
        results[v]=dict(valid=True,AA_all_passed=all(x['passed'] for x in state['calibrations']),tiny_64_parity_within_100ns=bool(tiny) and all(x['ci95_delta_ns'][0]>=-100 for x in tiny),ordinary_long_upper_ratio_within_1percent=bool(big) and all(x['ci95_ratio'][1]<=1.01 for x in big),tiny_failing_cells=[dict(payload=x['payload'],mode=x['mode'],ci95_delta_ns=x['ci95_delta_ns']) for x in tiny if x['ci95_delta_ns'][0]<-100],ordinary_long_unresolved_or_regressing=[dict(payload=x['payload'],level=x['level'],mode=x['mode'],ratio=x['paired_geomean_B_over_A'],ci95_ratio=x['ci95_ratio']) for x in big if x['ci95_ratio'][1]>1.01])
        # In candidate-stock rows A is candidate and B stock. Negative B-A
        # means candidate is slower; a lower CI bound >=-100 ns is parity.
    state['screening']=results

try:
    if subprocess.run(['git','cat-file','-e',PIN+'^{commit}'],cwd=ROOT,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL).returncode:
        run(['git','fetch','--no-tags','--depth=1','origin',PIN],OUT/'logs/source-fetch.log')
    run(['git','diff','--exit-code',PIN,'HEAD','--','src/java.base/share/native/libzip'],OUT/'logs/production-source-diff.log')
    metadata=dict(head=capture(['git','rev-parse','HEAD']).strip(),production_pin=PIN,stock_tree=capture(['git','rev-parse',PIN+':src/java.base/share/native/libzip/zlib']).strip(),ng_tree=capture(['git','rev-parse',PIN+':src/java.base/share/native/libzip/zlib-ng']).strip(),corpus_head=capture(['git','rev-parse','HEAD'],cwd=CORPORA).strip(),compiler=capture([CC,'--version']),cpu=capture(['lscpu']),uname=platform.uname()._asdict(),python=sys.version,glibc=capture(['getconf','GNU_LIBC_VERSION']),affinity_before=sorted(os.sched_getaffinity(0)),allocator_environment={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']})
    assert metadata['corpus_head']==CORPUS
    for f in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max','/proc/self/cgroup','/etc/os-release']:
        try:metadata[f]=Path(f).read_text()
        except OSError as e:metadata[f]=str(e)
    dump(OUT/'environment.json',metadata);state['cpu_model']=next((x.split(':',1)[1].strip() for x in metadata['cpu'].splitlines() if x.startswith('Model name:')),'unknown')
    original=ROOT/'src/java.base/share/native/libzip';expected=json.loads((TOOLS/'source-pins.json').read_text())
    for item in expected['ng_files']:assert sha(original/'zlib-ng'/item['path'])==item['sha256'],item['path']
    assert '#define ZLIB_VERSION "1.3.2"' in (original/'zlib/zlib.h').read_text()
    shutil.copytree(original/'zlib-ng',OUT/'sources/baseline',dirs_exist_ok=True);shutil.copytree(original/'zlib',OUT/'sources/stock',dirs_exist_ok=True)
    assets();stock=stock_build();base=ng_build('baseline',OUT/'sources/baseline','jdk_ng_');aa=ng_build('aa',OUT/'sources/baseline','cand_')
    text_ids={}
    for name,lib in [('A',base),('B',aa)]:
        for obj in ['deflate.o','trees.o','deflate_medium.o']:
            p=lib['dir']/(obj+'.text');run(['objcopy','--dump-section','.text='+str(p),lib['dir']/obj],OUT/'logs'/('text-'+name+'-'+obj+'.log'));text_ids[name+'/'+obj]=sha(p)
    assert all(text_ids['A/'+x]==text_ids['B/'+x] for x in ['deflate.o','trees.o','deflate_medium.o']);dump(OUT/'aa-object-text-identities.json',text_ids)
    cal_aa=driver('calibrate.c','calibrate-aa',[base,aa]);cpu=max(os.sched_getaffinity(0));os.sched_setaffinity(0,{cpu});state['cpu']=cpu
    dump(OUT/'preregister.json',dict(AA_gate='Both cells abs(mean of 12 chronological block paired means)+2.201*SEM <=100 ns, no exclusions; first/pre-timing/post-timing checkpoints must all pass',AA_source=str(TOOLS/'calibrate.c'),AA_source_sha256=sha(TOOLS/'calibrate.c'),cpu=cpu,processes=capture(['ps','-eo','pid,etime,pcpu,comm']),batch='128 operations, 12 blocks x20 pairs per calibration cell; end-to-end 6 blocks x10 pairs, 128/4/1 operations by size',comparisons='Baseline-stock; baseline-v1/v2/v3; direct candidate-stock tiny. Arm order alternates by pair/block.',warmup='64 reset+finish cycles per arm, default allocator; no tuning',meaningful_ordinary_long_regression='1% upper 95% paired ratio bound',tiny_parity='Direct candidate-stock lower 95% B-A bound >=-100 ns, level 6 and 64-byte cells; report actual intervals',source_pins=expected))
    if args.controls_only:
        # One fixed battery; never stop early on a failed gate or retry a mode.
        import base64,gzip
        from score_controls import score as score_control
        state['warnings']=['Calibration-only identification experiment; no candidates, stock timing or speed claim.','Separate-library .text equality does not imply equal runtime code/data/heap addresses.']
        fixed_modes=['shared-stream','two-states','separate-libraries']
        control=driver('calibrate_controls.c','calibrate-controls',[base,aa])
        protocol=dict(modes=fixed_modes,iterations=128,blocks=12,pairs_per_block=20,
            gate='Unchanged: abs(mean of 12 chronological block paired differences)+2.201*SEM <=100 ns in each reset/reuse cell, all samples.',
            state_diagnostic='Also apply that same 100 ns bound to the fixed physical slot1-minus-slot0 contrast, since logical assignment reverses in two-states.',
            ordering='One process for all modes in fixed listed order, preserving DSO mappings across modes; 10 AB and 10 BA pairs per block; cells reset then reuse.',
            warmup='64 reset/finish calls per logical arm; two-state and separate-library states each receive 64, shared stream receives 128.',
            allocations='Default allocator, no hooks/tuning. Record initialization order, returned stream.state address, stream/input/output addresses, function addresses/DSO bases, mappings and block assignments before timing.',
            limits='Fixed single battery even if a gate fails. No candidates or stock campaign; no post-correctness workload, reruns or threshold relaxation.')
        dump(OUT/'controls-preregister.json',protocol);dump(OUT/'preregister.json',protocol);note('CONTROLS_PREREGISTER',json.dumps(protocol))
        state['control_scores']={}
        combined=OUT/'calibration/all-controls.txt';mapping=OUT/'calibration/all-addresses.log'
        cmd=list(map(str,[control,OUT/'payloads/java-o0-64.bin']));state['commands'].append(dict(argv=cmd,cwd=str(ROOT)))
        with combined.open('w') as stdout,mapping.open('w') as stderr:subprocess.run(cmd,cwd=ROOT,stdout=stdout,stderr=stderr,check=True)
        def section(text,begin,end,mode):
            assert text.count(begin+' '+mode+'\n')==1 and text.count(end+' '+mode+'\n')==1
            return text.split(begin+' '+mode+'\n',1)[1].split(end+' '+mode+'\n',1)[0]
        for mode in fixed_modes:
            raw=OUT/'calibration'/(mode+'.csv');addresses=OUT/'calibration'/(mode+'-addresses.log')
            raw.write_text(section(combined.read_text(),'CONTROL_DATA_BEGIN','CONTROL_DATA_END',mode))
            addresses.write_text(section(mapping.read_text(),'CONTROL_ADDRESS_BEGIN','CONTROL_ADDRESS_END',mode))
            result=score_control(raw,mode);dump(raw.with_suffix('.gate.json'),result)
            state['control_scores'][mode]=result;state['calibrations'].append(dict(label=mode,**result))
            note('CONTROL_RESULT',mode,json.dumps(result));write_state()
        state['controls_primary_all_passed']=all(r['passed'] for r in state['control_scores'].values())
        state['controls_physical_all_passed']=all(r['physical_states_within_100ns'] is not False for r in state['control_scores'].values())
        state['status']='CALIBRATION_CONTROLS_COMPLETED'
        write_state();identities()
        lines=['# Calibration identification controls','',json.dumps(protocol,indent=2),'','```json',json.dumps(state['control_scores'],indent=2),'```','', 'All three controls ran once. No comparative candidate or stock timing ran. Physical and logical contrasts are both reported; neither is a prototype performance result.']
        (OUT/'report.md').write_text('\n'.join(lines)+'\n')
        # Retain selected text through completed job logs as well as the ZIP.
        # The payload has no credentials and includes every calibration CSV row.
        files={str(p.relative_to(OUT)):p.read_text() for p in sorted((OUT/'calibration').glob('*')) if p.is_file()}
        for name in ['results.json','environment.json','controls-preregister.json','aa-object-text-identities.json','report.md','identities.json']:files[name]=(OUT/name).read_text()
        packed=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0)
        encoded=base64.b64encode(packed).decode();note('CONTROLS_EVIDENCE_BEGIN',hashlib.sha256(packed).hexdigest(),len(packed))
        for offset in range(0,len(encoded),200):note('CONTROLS_EVIDENCE_DATA',encoded[offset:offset+200])
        note('CONTROLS_EVIDENCE_END')
        sys.exit(0 if state['controls_primary_all_passed'] and state['controls_physical_all_passed'] else 2)
    if not calibration('first'):
        state['status']='AA_GATE_FAILED_BEFORE_CANDIDATE_WORK';report();identities();sys.exit(2)
    if args.aa_only:
        state['status']='AA_ONLY_PASSED';report();identities();sys.exit(0)
    variants={};treebase=tree_test('baseline',base);dump(OUT/'trees/baseline-equality.json',treebase)
    asanbase=ng_build('asan-baseline',OUT/'sources/baseline','jdk_ng_',True)
    small_asan=['java-o0-64','hotspot-o0-64','documentation-o0-64',*[f'random-{n}' for n in [0,1,2,3,4,63,64,65]],'zeros-64','repeat-64','json-64','random-1024','java-65536','random-1048576','repeat-1048576']
    for name in ['v1','v2','v3']:
        note('CORRECTNESS_START',name);source=OUT/'sources'/name;shutil.copytree(OUT/'sources/baseline',source,dirs_exist_ok=True)
        patch=TOOLS/'patches'/(name+'.patch');run(['patch','--batch','-p1','-d',source,'-i',patch],OUT/'logs'/('patch-'+name+'.log'))
        try:
            lib=ng_build(name,source,'cand_');variants[name]=lib;tree=tree_test(name,lib);assert tree['sha256']==treebase['sha256'] and tree['bytes']==treebase['bytes'];dump(OUT/'trees'/(name+'-equality.json'),dict(exact=True,**tree))
            correct=driver('correctness.c','correctness-'+name,[base,lib]);run([correct,*sorted((OUT/'payloads').glob('*.bin'))],OUT/'correctness'/(name+'.log'))
            asan=ng_build('asan-'+name,source,'cand_',True);correctasan=driver('correctness.c','correctness-asan-'+name,[asanbase,asan],sanitized=True)
            env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1');run([correctasan,*[OUT/'payloads'/(p+'.bin') for p in small_asan]],OUT/'correctness'/(name+'-asan.log'),env=env)
            state['qualified'][name]=dict(passed=True,tree_sha256=tree['sha256']);note('CORRECTNESS_PASS',name)
        except (subprocess.CalledProcessError,AssertionError) as e:
            state['qualified'][name]=dict(passed=False,error=repr(e));note('CORRECTNESS_FAIL',name,repr(e))
        write_state()
    if not calibration('pre-timing'):
        state['status']='AA_GATE_FAILED_AFTER_CORRECTNESS';report();identities();sys.exit(2)
    calstock=driver('calibrate.c','calibrate-stock',[base],['-DSTOCK_B']);run([calstock,OUT/'payloads/java-o0-64.bin'],OUT/'calibration/stock-controls.csv')
    retained=OUT/'builds/retained-compare';run([CC,'-O2','-Wall','-Wextra','-I',OUT/'sources/stock',TOOLS/'level-mapping.c',stock,base['archive'],'-o',retained],OUT/'logs/retained-build.log')
    for corpus in ['java','hotspot','documentation']:
        for batch in range(6):run([retained,OUT/'retained'/(corpus+'.bin'),batch%2],OUT/'retained'/f'{corpus}-{batch}.csv')
    tiny=['java-o0-64','hotspot-o0-64','documentation-o0-64','java-o127-64','hotspot-o4096-64','documentation-o17001-64',*[f'random-{n}' for n in [0,1,2,3,4,63,64,65]],'zeros-64','repeat-64','json-64','repeat-65']
    ordinary=[f'{p}-{n}' for p in ['java','random','repeat','json'] for n in [1024,65536,1048576]]
    cells=[(p,l,m) for p in tiny+ordinary for l in [1,6] for m in ['reuse','create']]
    tinycells=[(p,l,m) for p in tiny for l in [1,6] for m in ['reuse','create']]
    bs=driver('batch.c','batch-baseline-stock',[base],['-DSTOCK_B']);bench_campaign('baseline-stock',bs,cells)
    for name,lib in variants.items():
        if not state['qualified'][name]['passed']:continue
        bc=driver('batch.c','batch-baseline-'+name,[base,lib]);bench_campaign('baseline-'+name,bc,cells)
        cs=driver('batch.c','batch-'+name+'-stock',[lib],['-DCANDIDATE_A','-DSTOCK_B']);bench_campaign(name+'-stock',cs,tinycells)
    final=calibration('post-timing');screening();state['status']='MEASURED_ALL_AA_GATES_PASSED' if final else 'AA_GATE_FAILED_AFTER_TIMING_NO_WINNER';report();identities();note('RESULT_SUMMARY',json.dumps(dict(status=state['status'],qualified=state['qualified'],screening=state.get('screening'))));sys.exit(0 if final else 2)
except Exception as e:
    state['status']='EXPERIMENTAL_FAILURE';state['error']=repr(e);report()
    try:identities()
    except Exception:pass
    raise
