"""Unchanged pinned libraries, known whole inputs, one fixed local level study."""
from pathlib import Path,PurePosixPath
import argparse,hashlib,io,json,os,platform,shlex,subprocess,tarfile
HERE=Path(__file__).resolve().parent
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc';CORPUS='9870d54525f8f5a1315da6f2f9b289fb535e26a3'
a=argparse.ArgumentParser();a.add_argument('--root',type=Path,default=Path('/workspace/openjdk-jdk27u'));a.add_argument('--corpora',type=Path);a.add_argument('--out',type=Path,default=HERE);a.add_argument('--phase',choices=['prepare','sizes','timing','all'],default='all');args=a.parse_args();OUT=args.out.resolve();OUT.mkdir(parents=True,exist_ok=True);CC='gcc-14'
def digest(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2)+'\n')
def command(cmd,log,cwd=OUT,env=None):
    with Path(log).open('w') as f:subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
def archive(ref,paths):return tarfile.open(fileobj=io.BytesIO(subprocess.check_output(['git','archive',ref,*paths],cwd=args.root)))
def prepare():
    for name in ['src','build','inputs','compressed','evidence']:(OUT/name).mkdir(exist_ok=True)
    base='src/java.base/share/native/libzip/'
    with archive(PIN,[base+'zlib',base+'zlib-ng']) as t:
        for item in t:
            if item.isfile():
                p=OUT/'src'/item.name.removeprefix(base);p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(t.extractfile(item).read())
    pins=json.loads((HERE/'source-pins.json').read_text())
    for x in pins['ng_files']:assert digest(OUT/'src/zlib-ng'/x['path'])==x['sha256']
    assert '#define ZLIB_VERSION "1.3.2"' in (OUT/'src/zlib/zlib.h').read_text()
    patterns={'java-prefix':('src/java.base/share/classes/java/util','.java'),'hotspot-prefix':('src/hotspot/share/runtime','.cpp'),'documentation-prefix':('doc','.md')};original={}
    if args.corpora:
        assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=args.corpora,text=True).strip()==CORPUS
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(p.read_bytes() for p in sorted((args.corpora/directory).glob('*'+suffix)))
    else:
        with archive(CORPUS,[x[0] for x in patterns.values()]) as t:
            files={i.name:t.extractfile(i).read() for i in t if i.isfile()}
        for name,(directory,suffix) in patterns.items():original[name]=b''.join(files[n] for n in sorted(files) if str(PurePosixPath(n).parent)==directory and n.endswith(suffix))
    natural=(b'The morning train passed the old station. A reader opened a small book, while rain moved across the window. The next page described a garden, a wooden gate, and a path beside the river. Later the clouds lifted and the street became quiet. ')
    records=b''.join(json.dumps({'id':i,'type':['reading','writing','idle'][i%3],'user':'person-'+str(i%7),'ok':i%5!=0,'value':(i*17)%101,'message':'sample event from sensor '+str(i%4)},separators=(',',':')).encode()+b'\n' for i in range(100))
    entropy=hashlib.shake_256(b'level-study-fixed-20261014').digest(12000)
    mixed=b''.join((natural[(i*17)%100:]+bytes([65+i%9])*31+entropy[i*47:i*47+37]+natural[:100]) for i in range(40))
    inputs=[]
    for corpus in [*original,'json-string','json-records','natural-text','repeated-byte','random','mixed']:
        for n in [32,64,128,256,512,1024,4096]:
            if corpus in original:data=original[corpus][:n]
            elif corpus=='json-string':
                head=b'{"id":7,"ok":true,"s":"';tail=b'"}';fill=(b'alpha beta alpha gamma '*300)[:n-len(head)-len(tail)];data=head+fill+tail;json.loads(data)
            elif corpus=='json-records':data=records[:n]
            elif corpus=='natural-text':data=(natural*30)[:n]
            elif corpus=='repeated-byte':data=b'A'*n
            elif corpus=='random':data=entropy[:n]
            else:data=mixed[:n]
            assert len(data)==n,(corpus,n)
            p=OUT/'inputs'/f'{corpus}-{n}.bin';p.write_bytes(data);inputs.append(dict(id=len(inputs),corpus=corpus,size=n,path=str(p),sha256=digest(p)))
    assert len(inputs)==63
    (OUT/'inputs.tsv').write_text(''.join(f"{x['id']}\t{x['corpus']}\t{x['size']}\t{x['path']}\n" for x in inputs))
    # Equal numeric levels are not assumed algorithmically equivalent.
    pairs=[dict(label='stock6-v-ng'+str(k),al=0,an=6,bl=1,bn=k,group='primary') for k in [6,5,4,3,2,1]]
    pairs +=[dict(label='equal-level-'+str(k),al=0,an=k,bl=1,bn=k,group='equal') for k in [1,2,3,4,5]]
    pairs +=[dict(label='Java-requested1-stock1-v-ng2',al=0,an=1,bl=1,bn=2,group='requested1')]
    pairs +=[dict(label='ng6-v-ng'+str(k),al=1,an=6,bl=1,bn=k,group='ng6') for k in [5,4,3,2,1]]
    cells=[]
    def add(category,inp,raw,mode,pair,control=-1):cells.append(dict(id=len(cells),category=category,input=inp['id'],format='raw' if raw else 'wrapped',raw=raw,mode=['reset','reuse','create'][mode],mode_id=mode,control=control,blocks=12 if category else 6,pairs=20 if category else 6,iterations=128 if category else 32 if inp['size']<=1024 else 8,**pair))
    def brackets(category):
        for control in range(3):
            for corpus,size in [('java-prefix',64),('mixed',4096)]:
                inp=next(x for x in inputs if (x['corpus'],x['size'])==(corpus,size))
                for raw in [0,1]:
                    for mode in [0,1,2]:add(category,inp,raw,mode,dict(label=['shared-stream','two-states','separate-images'][control],al=1,an=6,bl=2 if control==2 else 1,bn=6,group='aa'),control)
    brackets(1)
    for inp in inputs:
        for raw in [0,1]:
            for mode in [1,2]:
                for pair in pairs:add(0,inp,raw,mode,pair)
    brackets(2)
    assert len(cells)==4356
    (OUT/'schedule.tsv').write_text(''.join('\t'.join(str(x[k]) for k in ['id','category','input','raw','mode_id','al','an','bl','bn','control','blocks','pairs','iterations'])+'\n' for x in cells))
    manifest=dict(pin=PIN,ng=pins['ng'],stock='1.3.2',corpus_pin=CORPUS,inputs=inputs,cells=cells,
        semantics='Every case is a whole input known before one Z_FINISH. Stock1..6 and ng physical1..6 stay explicit. Java requested1 maps to ng2; aliases are labeled, not a new default.',
        criterion='Predeclared meaningful absolute timing difference100ns. Every pre/post A/A cell requires abs(mean of12 block paired means)+2.201*SEM<=100ns; also require the same bound for fixed state1-minus-state0 in two-state AA. All samples. A failed gate makes ALL comparative latency unqualified; output sizes remain verified.',
        samples='One process;36 pre AA cells,4284 comparative cells,36 post AA cells. AA12x20 alternating pairs x128 operations; comparisons6x6 alternating pairs x32 calls through1KiB or8 at4KiB; warmup32 per logical arm per block. No per-call clock. Comparative initialization order reverses by block; permanent API ownership.',
        rule='One fixed local run even on failed brackets. No rerun, outlier deletion, prior offset correction or policy selection. Fastest means/Pareto are descriptive; qualified pairwise speed requires an interval beyond100ns and all gates. Rankings between unpaired lower levels can remain unknown.')
    dump(OUT/'manifest.json',manifest)
    b=OUT/'build/stock';b.mkdir(exist_ok=True);objects=[]
    for p in sorted((OUT/'src/zlib').glob('*.c')):
        if p.name.startswith('gz'):continue
        obj=b/(p.stem+'.o');command([CC,'-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',OUT/'src/zlib','-c',p,'-o',obj],b/(p.stem+'.log'));objects.append(obj)
    command(['ar','rcs',b/'libz.a',*objects],b/'ar.log');command([CC,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',b/'libz.a','-Wl,--no-whole-archive','-o',b/'libstock.so'],b/'link.log')
    libs=[b/'libstock.so'];flags_by_role={}
    for name,prefix in [('ng','jdk_ng_'),('ng-control','cand_')]:
        b=OUT/'build'/name;b.mkdir(exist_ok=True);env=dict(os.environ,CC=CC,AR='ar',CFLAGS='-O2 -fPIC',LDFLAGS='')
        command(['bash',OUT/'src/zlib-ng/configure','--static','--zlib-compat','--sprefix='+prefix],b/'configure.log',cwd=b,env=env);command(['make','-j1','libz.a'],b/'build.log',cwd=b)
        command([CC,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',b/'libz.a','-Wl,--no-whole-archive','-o',b/'libng.so'],b/'link.log');libs.append(b/'libng.so')
        flags=shlex.split(next(x[7:] for x in (b/'Makefile').read_text().splitlines() if x.startswith('CFLAGS=')));flags_by_role[name]=flags
        command([CC,*flags,'-I',b,'-I',OUT/'src/zlib-ng','-dM','-E','-include',OUT/'src/zlib-ng/deflate.h','-x','c','/dev/null'],b/'preprocessor-defines.log')
        for obj in ['deflate.o','trees.o','deflate_medium.o']:command(['objcopy','--dump-section','.text='+str(b/(obj+'.text')),b/obj],b/(obj+'.text.log'))
    for obj in ['deflate.o','trees.o','deflate_medium.o']:assert digest(OUT/'build/ng'/(obj+'.text'))==digest(OUT/'build/ng-control'/(obj+'.text'))
    command([CC,'-O2','-Wall','-Wextra','-Werror','-I',OUT/'src/zlib',HERE/'study.c',OUT/'build/stock/libz.a','-ldl','-o',OUT/'build/study'],OUT/'build/driver.log')
    environment=dict(cpu=subprocess.check_output(['lscpu'],text=True),compiler=subprocess.check_output([CC,'--version'],text=True),uname=platform.uname()._asdict(),python=platform.python_version(),affinity_before=sorted(os.sched_getaffinity(0)),selected_cpu=max(os.sched_getaffinity(0)),allocator={k:os.environ.get(k) for k in ['GLIBC_TUNABLES','MALLOC_ARENA_MAX','MALLOC_MMAP_THRESHOLD_','MALLOC_TRIM_THRESHOLD_','MALLOC_PERTURB_']},ng_flags=flags_by_role)
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max','/proc/self/cgroup']:
        try:environment[path]=Path(path).read_text()
        except OSError as e:environment[path]=str(e)
    dump(OUT/'evidence/environment.json',environment)
    defines=(OUT/'build/ng/preprocessor-defines.log').read_text();assert '#define NO_MEDIUM_STRATEGY' not in defines and '#define NO_QUICK_STRATEGY' not in defines
    dump(OUT/'evidence/algorithm-map.json',{'NO_MEDIUM_STRATEGY':False,'NO_QUICK_STRATEGY':False,'physical_ng_levels':{'1':'quick','2':'fast','3':'medium','4':'medium','5':'medium_fizzle','6':'medium_fizzle'},'no_assumed_monotonicity':True})
    dump(OUT/'build-config.json',dict(libraries=list(map(str,libs)),binary=str(OUT/'build/study')))
    identities={str(p.relative_to(OUT)):{'bytes':p.stat().st_size,'sha256':digest(p)} for top in [OUT/'src',OUT/'build',OUT/'inputs'] for p in top.rglob('*') if p.is_file()}
    dump(OUT/'evidence/identities.json',identities);print('PREPARED',len(inputs),'inputs',len(cells),'scheduled cells',flush=True)
def execute(mode):
    config=json.loads((OUT/'build-config.json').read_text());env=json.loads((OUT/'evidence/environment.json').read_text());os.sched_setaffinity(0,{env['selected_cpu']})
    if mode=='timing':
        with (OUT/'evidence/TIMING_STARTED').open('x') as f:f.write('One fixed run; never delete this marker to rerun.\n')
    filename='sizes.csv' if mode=='sizes' else 'timing.csv';target=OUT/'compressed' if mode=='sizes' else OUT/'schedule.tsv'
    before={}
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:before[path]=Path(path).read_text()
        except OSError as e:before[path]=str(e)
    dump(OUT/'evidence'/(mode+'-controller-before.json'),before)
    cmd=[config['binary'],*config['libraries'],str(OUT/'inputs.tsv'),'sizes' if mode=='sizes' else 'campaign',str(target),'-']
    with (OUT/'evidence'/filename).open('w') as out,(OUT/'evidence'/(mode+'-addresses.log')).open('w') as err:subprocess.run(cmd,stdout=out,stderr=err,check=True)
    dump(OUT/'evidence'/(mode+'-command.json'),dict(argv=cmd,cpu=env['selected_cpu']))
    after={}
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max']:
        try:after[path]=Path(path).read_text()
        except OSError as e:after[path]=str(e)
    dump(OUT/'evidence'/(mode+'-controller-after.json'),after)
    print(mode.upper(),'COMPLETE',flush=True)
if args.phase in ['prepare','all']:prepare()
if args.phase in ['sizes','all']:execute('sizes')
if args.phase in ['timing','all']:execute('timing')
