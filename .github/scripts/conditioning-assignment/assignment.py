"""Fixed unchanged-code diagnostic. Default plans; native execution is tag-gated.

Build-only compiles without invoking any resulting executable. Audit reads saved
files only. No backend changes, sampling options, automatic retries or dispatch.
"""
from pathlib import Path
import argparse,base64,csv,hashlib,io,json,os,platform,selectors,shutil,statistics,struct,subprocess,sys,tarfile,time,zlib
import timing_model as M
HERE=Path(__file__).resolve().parent
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc'
NG='88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0'
TAG='diagnostic-tiny-zlib-conditioning-assignment-20261016-once'
PINS_SHA='6dfceaab5c67f2fe169c26dc18558af7899b89eb348db4b922a6a69c68584ebd'
CORPUS_SHA='a7b4c50174f6408897ab171e66943b358a4a6816483b0e3366fee498957c8492'
ROW_FIELDS=['row','episode','block','condition','condition_position','swap','order','position','label','slot','gap_ns']
KINDS=('warm','prep','padding','timed')

def require(x,why):
    if not x:raise ValueError(why)
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2,allow_nan=False)+'\n')
def read(p):return json.loads(Path(p).read_text())
def table(p):
    with Path(p).open(newline='') as f:return [{k:(v if k=='kind' else int(v)) for k,v in r.items()} for r in csv.DictReader(f)]
def plan_rows():
    rows=[]
    for e in M.diagnostic_plan():
        for pos in range(4):
            rows.append(dict(zip(ROW_FIELDS,[len(rows),e['episode'],e['block'],M.CONDITIONS.index(e['condition']),e['condition_position'],e['role_swap'],e['order'],pos,e['labels'][pos],e['slots'][pos],e['gaps_ns'][pos]])))
    require(len(rows)==192 and len(M.diagnostic_plan())==48,'fixed192/48 dimensions')
    return rows
def plan_bytes():
    f=io.StringIO(newline='');w=csv.DictWriter(f,fieldnames=ROW_FIELDS,delimiter='\t',lineterminator='\n');w.writeheader();w.writerows(plan_rows());return f.getvalue().encode()
def specification():
    return dict(version='conditioning-assignment-v2',collector_revision=2,reference_claims='generic_event_availability_only_no_frequency_inference',pin=PIN,ng=NG,tag=TAG,rows=192,quartets=48,blocks=8,processes=1,streams=2,
        warm=3328,prep=8,iterations=64,measurement_seconds=900,startup_seconds=180,finish_seconds=180,retries=0,
        base_gap_ns=M.BASE_GAP_NS,half_skew_ns=M.HALF_SKEW_NS,delivery_late_ns=M.DELIVERY_LATE_NS,
        first_row='quartet anchor + assigned incoming-role gap',family=4,df=7,critical=M.DIAGNOSTIC_T,resolution_pp=1,
        denominator='one common grand mean of all24 timed row rates per block',
        required_counters=['cycles','instructions','reference_cycles'],intervals=list(KINDS),counter_records=768,
        qualification=False,old_result='HOLD_UNCHANGED',plan_sha256=hashlib.sha256(plan_bytes()).hexdigest(),corpus_sha256=CORPUS_SHA)
def corpus():
    require(sha(HERE/'corpus.json')==CORPUS_SHA,'corpus identity')
    x=read(HERE/'corpus.json');require(len(x['warm'])==132 and len(x['target'])==8 and len(x['warm_ring'])==256,'input dimensions')
    b=[]
    for i,item in enumerate(x['warm']+x['target']):
        raw=base64.b64decode(item['base64'],validate=True)
        require(len(raw)==item['bytes']==(64 if i<132 else 4096) and hashlib.sha256(raw).hexdigest()==item['sha256'],'input bytes')
        b.append(raw)
    require(all(isinstance(i,int) and 0<=i<132 for i in x['warm_ring']),'warm ring')
    return x,b
def source_inventory(out):
    out=Path(out)
    return {str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=sha(p)) for top in ['source','baseline','build'] for p in sorted((out/top).rglob('*')) if p.is_file()} | {n:dict(bytes=(out/n).stat().st_size,sha256=sha(out/n)) for n in ['plan.tsv','inputs.bin','manifest.json','build-commands.json','environment.json','checkout.json']}
def verify_inventory(out,inventory):
    require(source_inventory(Path(out))==inventory,'inventory additions/removals or changed bytes')
    for name,want in inventory.items():
        p=Path(out)/name;require(p.is_file() and dict(bytes=p.stat().st_size,sha256=sha(p))==want,'provenance changed: '+name)

def write_plan(out):
    out=Path(out);out.mkdir(parents=True,exist_ok=False)
    (out/'plan.tsv').write_bytes(plan_bytes());dump(out/'manifest.json',specification())
    _,banks=corpus();ring=corpus()[0]['warm_ring']
    b=b'CASGv1\n\0'+b''.join(struct.pack('<I',len(x))+x for x in banks)+b''.join(struct.pack('<I',i) for i in ring)
    (out/'inputs.bin').write_bytes(b);return out
def prepare(root,out,cc='gcc-14'):
    root=Path(root).resolve();out=write_plan(Path(out).resolve())
    require(sha(HERE/'source-pins.json')==PINS_SHA,'source pin file')
    pins=read(HERE/'source-pins.json');require(pins['head']==PIN and pins['ng']==NG and len(pins['ng_files'])==215,'production pins')
    prefix='src/java.base/share/native/libzip/'
    archive=subprocess.check_output(['git','archive',PIN,prefix+'zlib',prefix+'zlib-ng'],cwd=root)
    baseline=out/'baseline';baseline.mkdir()
    with tarfile.open(fileobj=io.BytesIO(archive)) as tf:
        for item in tf:
            if item.isfile():
                p=Path(item.name);require(not p.is_absolute() and '..' not in p.parts,'archive traversal')
                target=baseline/p;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(tf.extractfile(item).read())
    stock=baseline/prefix/'zlib';ng=baseline/prefix/'zlib-ng'
    for x in pins['ng_files']:require(sha(ng/x['path'])==x['sha256'],'unchanged ng source: '+x['path'])
    require('#define ZLIB_VERSION "1.3.2"' in (stock/'zlib.h').read_text(),'stock inflate pin')
    shutil.copytree(HERE,out/'source',ignore=shutil.ignore_patterns('__pycache__'))
    workflow=HERE.parents[1]/'workflows/conditioning-assignment.yml'
    require(workflow.is_file(),'reviewed workflow source missing');shutil.copy2(workflow,out/'source'/workflow.name)
    dump(out/'checkout.json',dict(head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()))
    commands=[];build=out/'build';build.mkdir();sb=build/'stock';sb.mkdir();nb=build/'N';nb.mkdir()
    def command(argv,log,cwd,env=None):
        argv=list(map(str,argv));commands.append(dict(argv=argv,cwd=str(cwd),environment={k:env[k] for k in ['CC','AR','CFLAGS','LDFLAGS']} if env else None))
        dump(out/'build-commands.json',commands)
        with Path(log).open('w') as f:subprocess.run(argv,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
    objects=[]
    for p in sorted(stock.glob('*.c')):
        if p.name.startswith('gz'):continue
        obj=sb/(p.stem+'.o');command([cc,'-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',stock,'-c',p,'-o',obj],sb/(p.stem+'.log'),out);objects.append(obj)
    command(['ar','rcs',sb/'libz.a',*objects],sb/'ar.log',out)
    env=dict(os.environ,CC=cc,AR='ar',CFLAGS='-O2 -fPIC',LDFLAGS='')
    command(['bash',ng/'configure','--static','--zlib-compat','--sprefix=jdk_ng_'],nb/'configure.log',nb,env)
    command(['make','-j2','libz.a'],nb/'make.log',nb)
    command([cc,'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',nb/'libz.a','-Wl,--no-whole-archive','-o',nb/'ng.so'],nb/'link.log',out)
    command([cc,'-O2','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stock,HERE/'assignment.c',sb/'libz.a','-ldl','-o',build/'assignment'],build/'driver.log',out)
    symbols=subprocess.check_output(['nm','-D','--defined-only',nb/'ng.so'],text=True);(nb/'symbols.txt').write_text(symbols)
    require(not any(x in symbols for x in ['jdk_ng_test_','jdk_ng_deflateResetKeepChecked','clear_small_hash']),'unexpected patched/control library')
    for x in pins['ng_files']:require(sha(ng/x['path'])==x['sha256'],'source mutated during build')
    environment=dict(compiler=subprocess.check_output([cc,'--version'],text=True),uname=platform.uname()._asdict(),libc=platform.libc_ver(),cpu=Path('/proc/cpuinfo').read_text(),affinity=sorted(os.sched_getaffinity(0)),build_only_no_native_execution=True)
    for path in ['/sys/fs/cgroup/cpu.stat','/sys/fs/cgroup/cpu.max','/sys/devices/system/clocksource/clocksource0/current_clocksource']:
        try:environment[path]=Path(path).read_text()
        except OSError as e:environment[path]=dict(errno=e.errno,error=str(e))
    dump(out/'environment.json',environment)
    dump(out/'identities.json',source_inventory(out));dump(out/'PREPARED.json',dict(build_only=True,native_executions=0,pin=PIN,ng=NG))
    return out

def authorize(env,event):
    require(env.get('GITHUB_ACTIONS')=='true' and env.get('GITHUB_EVENT_NAME')=='push','fresh approved tag only')
    require(env.get('GITHUB_REPOSITORY')==event['repository']['full_name']=='re-thc/openjdk-jdk27u','repository')
    require(env.get('GITHUB_REF_TYPE')=='tag' and env.get('GITHUB_REF')==event['ref']=='refs/tags/'+TAG,'exact tag')
    require(env.get('GITHUB_RUN_ATTEMPT')=='1' and event.get('created') is True and event.get('deleted') is False and event.get('forced') is False and event.get('before')=='0'*40,'one fresh nonforced attempt')
    require(env.get('GITHUB_SHA')==event.get('after') and len(event['after'])==40,'checkout event identity')
    return dict(tag=TAG,commit=event['after'],run=env.get('GITHUB_RUN_ID'),attempt=1)

def execute(out,env=None):
    env=dict(os.environ) if env is None else env
    receipt=authorize(env,read(env['GITHUB_EVENT_PATH']));out=Path(out).resolve()
    require(read(out/'manifest.json')==specification() and (out/'plan.tsv').read_bytes()==plan_bytes(),'frozen plan')
    require(read(out/'PREPARED.json')['native_executions']==0,'build-only preparation required')
    require(read(out/'checkout.json')['head']==receipt['commit'],'build checkout does not match approved event')
    inventory=read(out/'identities.json');verify_inventory(out,inventory)
    with (out/'EXECUTION_STARTED').open('x') as f:json.dump(receipt,f)
    dump(out/'origin.json',dict(record_origin='AUTHORIZED_NATIVE_ATTEMPT'))
    cpu=max(os.sched_getaffinity(0));dump(out/'launch.json',dict(cpu=cpu,receipt=receipt,argv=[str(out/'build/assignment'),str(out/'build/N/ng.so'),str(out/'inputs.bin'),str(out/'plan.tsv'),str(out),str(cpu),'linux-ref-cycles-ratio-only']))
    launch=read(out/'launch.json');deadline=time.monotonic()+180;buffer=b'';stage='startup';timed_out=False;protocol_error=None
    with (out/'native-stderr.log').open('wb') as err,(out/'native-stdout.log').open('wb') as log:
        p=subprocess.Popen(launch['argv'],stdout=subprocess.PIPE,stderr=err,bufsize=0)
        try:
            os.set_blocking(p.stdout.fileno(),False)
            with selectors.DefaultSelector() as sel:
                sel.register(p.stdout,selectors.EVENT_READ)
                while True:
                    left=deadline-time.monotonic()
                    if left<=0:timed_out=True;p.kill();break
                    if not sel.select(min(left,1)):continue
                    chunk=os.read(p.stdout.fileno(),4096)
                    if not chunk:
                        require(not buffer,'truncated native protocol line');break
                    log.write(chunk);log.flush();buffer+=chunk;require(len(buffer)<=4096,'oversized protocol line')
                    while b'\n' in buffer:
                        line,buffer=buffer.split(b'\n',1)
                        if line==b'MEASUREMENT_START':
                            require(stage=='startup','duplicate measurement start');window=read(out/'measurement-window.json')
                            dump(out/'origin.json',dict(record_origin='NATIVE_MEASUREMENT'))
                            require(window['deadline_ns']-window['start_ns']==900000000000,'900s native window');deadline=window['deadline_ns']/1e9;stage='measurement'
                        elif line==b'MEASUREMENT_END':require(stage=='measurement','end without start');deadline=time.monotonic()+180;stage='finish'
                        else:raise ValueError('unexpected native protocol line')
                p.wait(timeout=5)
        except Exception as e:
            protocol_error=repr(e)
        finally:
            if p.poll() is None:p.kill();p.wait()
            p.stdout.close()
    dump(out/'execution.json',dict(returncode=p.returncode,timeout=timed_out,last_stage=stage,retries=0,protocol_error=protocol_error))
    verify_inventory(out,inventory)
    if protocol_error:
        dump(out/'result.json',dict(status='INVALID_NATIVE_PROTOCOL',error=protocol_error,qualification=False,old_result='HOLD_UNCHANGED'));raise ValueError(protocol_error)
    if p.returncode==77:
        require(stage=='startup' and read(out/'preflight.json')['status']=='PREFLIGHT_UNAVAILABLE','invalid preflight exit')
        require(not any((out/n).exists() for n in ['rows.csv','counters.csv','measurement-window.json']),'unavailable preflight followed by measurement')
        dump(out/'result.json',dict(status='PREFLIGHT_UNAVAILABLE_NO_MEASUREMENT',preflight=read(out/'preflight.json'),qualification=False,old_result='HOLD_UNCHANGED'));return
    audit(out)
    require(read(out/'result.json')['status']=='DIAGNOSTIC_COMPLETE','native diagnostic incomplete; all saved rows retained')

def counter_valid(v):
    walls=[v[k] for k in ['read0','read1','enable0','enable1','w0','w1','disable0','disable1','read2','read3']]
    if walls!=sorted(walls) or v['w1']<=v['w0'] or v['c1']<=v['c0']:return False
    enabled=v['enabled_after']-v['enabled_before'];running=v['running_after']-v['running_before']
    return enabled>0 and running==enabled and all(v[k+'_after']>v[k+'_before'] for k in ['cycles','instructions','reference'])

def preflight_available(v):
    return (v.get('status')=='AVAILABLE_GENERIC_EVENTS' and len(v.get('event_ids',[]))==3
        and len(set(v['event_ids']))==3 and all(isinstance(x,int) and x>0 for x in v['event_ids'])
        and v.get('user_only') is True and v.get('exclude_hv') is True
        and v.get('probe_enabled_ns',0)>0 and v['probe_enabled_ns']==v.get('probe_running_ns')
        and v.get('reference_event')=='PERF_COUNT_HW_REF_CPU_CYCLES' and v.get('host_reference_semantics_verified') is False)

def reject_evidence(out,reasons,**details):
    out=Path(out);previous=out/'result.json'
    if previous.is_file() and not (out/'result-before-rejection.json').exists():
        (out/'result-before-rejection.json').write_bytes(previous.read_bytes())
    result=dict(status='INCOMPLETE_OR_INVALID',reasons=reasons,**details,
        assignment_response=False,bounded_response=False,residual_instability=False,
        indeterminate=True,delivery_valid=False,telemetry_valid=False,
        labels=['INDETERMINATE'],qualification=False,old_result='HOLD_UNCHANGED')
    history=dict(rejection=result)
    if previous.is_file():
        old=previous.read_bytes();history.update(previous_result_sha256=hashlib.sha256(old).hexdigest(),previous_result_base64=base64.b64encode(old).decode('ascii'))
    with (out/'audit-rejections.jsonl').open('a') as log:log.write(json.dumps(history,allow_nan=False)+'\n')
    dump(out/'result.json',result)
    (out/'REPORT.txt').write_text('INVALID EVIDENCE; no informative outcome; old HOLD unchanged.\n'+json.dumps(result,indent=2)+'\n')

def audit(out):
    try:return _audit(Path(out))
    except (ValueError,KeyError,TypeError,OSError,zlib.error) as error:
        reject_evidence(out,['audit_validation_failed: '+repr(error)])
        raise

def _audit(out):
    out=Path(out);raw=table(out/'rows.csv');counters=table(out/'counters.csv');expected=plan_rows()
    origin=read(out/'origin.json')['record_origin'];require(origin in ['NATIVE_MEASUREMENT','SYNTHETIC_UNIT_TEST','AUTHORIZED_NATIVE_ATTEMPT'],'record origin')
    if origin=='NATIVE_MEASUREMENT':verify_inventory(out,read(out/'identities.json'))
    require(read(out/'manifest.json')==specification() and (out/'plan.tsv').read_bytes()==plan_bytes(),'saved plan changed')
    execution=read(out/'execution.json');native=read(out/'native-status.json') if (out/'native-status.json').exists() else {}
    reasons=[]
    if (out/'driver-error.json').exists():reasons.append('saved_collector_error')
    if (out/'result.json').exists():
        previous=read(out/'result.json')
        if previous.get('status')!='DIAGNOSTIC_COMPLETE' or previous.get('delivery_valid') is False or previous.get('telemetry_valid') is False:
            reasons.append('saved_failed_result_cannot_be_promoted')
    if execution.get('protocol_error','MISSING') is not None:reasons.append('saved_protocol_error_or_missing_field')
    if execution.get('last_stage')!='finish':reasons.append('inconsistent_terminal_stage')
    if type(execution.get('retries')) is not int or execution['retries']!=0:reasons.append('nonzero_or_missing_retry_count')
    if execution.get('timeout') is not False or type(execution.get('returncode')) is not int or execution.get('returncode')!=0:reasons.append('unsuccessful_execution')
    stdout=out/'native-stdout.log'
    if not stdout.is_file() or stdout.read_bytes()!=b'MEASUREMENT_START\nMEASUREMENT_END\n':reasons.append('inconsistent_saved_terminal_protocol')
    if len(raw)!=192 or len(counters)!=768 or native.get('status')!='COMPLETE' or native.get('rows')!=192:reasons.append('incomplete_native_evidence')
    if reasons:
        reject_evidence(out,reasons,record_origin=origin,rows=len(raw),counter_records=len(counters),execution=execution,native=native);return
    require(origin!='AUTHORIZED_NATIVE_ATTEMPT','complete rows without measurement-start origin')
    require([r['row'] for r in raw]==list(range(192)),'rows duplicated/reordered')
    for r,e in zip(raw,expected):require(all(r[k]==v for k,v in e.items()),'row assignment differs')
    require([(v['row'],v['kind']) for v in counters]==[(i,k) for i in range(192) for k in KINDS],'exact768 counter records')
    meta=read(out/'native-metadata.json');require(meta['stream'][1]-meta['stream'][0]==128 and meta['stream'][0]%64==0 and meta['state'][0]!=meta['state'][1],'two stable stream slots')
    require(preflight_available(read(out/'preflight.json')),'counter preflight')
    window=read(out/'measurement-window.json');require(window['deadline_ns']-window['start_ns']==900000000000,'measurement cap')
    inputs,banks=corpus();refs=[]
    for i,b in enumerate(banks):
        compressed=(out/f'compressed-{i}.bin').read_bytes();require(zlib.decompress(compressed)==b,'independent stock inflate');refs.append(len(compressed))
    correct=read(out/'correctness.json');require(correct['before']==correct['after']==280 and correct['final_row_inflates']==192 and correct['bytes_equal'] is True,'correctness coverage')
    require(all(type(native.get(k)) is int for k in ['measurement_start_ns','end_ns']),'mandatory native start/completion timestamps')
    require(native['measurement_start_ns']==window['start_ns'],'native/window measurement-start mismatch')
    require(window['start_ns']<=counters[0]['read0'],'first complete counter bracket begins before measurement window')
    require(counters[-1]['read3']<=correct['measurement_end_ns']<=window['deadline_ns'],'last complete counter bracket exceeds measurement end/deadline')
    require(correct['measurement_end_ns']<=native['end_ns'],'measurement end exceeds native completion')
    require(window['start_ns']<raw[0]['begin_ns'] and raw[-1]['end_ns']<=correct['measurement_end_ns']<=window['deadline_ns'],'timing cap exceeded')
    delivery_checks=[];details=[];blocks=[];counter_bad=[]
    for before,after in zip(counters,counters[1:]):
        if any(after[k+'_before']!=before[k+'_after'] for k in ['enabled','running','cycles','instructions','reference']):
            counter_bad.append(dict(row=after['row'],kind=after['kind'],reason='disabled_counter_discontinuity'))
        if before['read3']>after['read0']:
            counter_bad.append(dict(row=after['row'],kind=after['kind'],reason='overlapping_complete_counter_brackets'))
    for i,r in enumerate(raw):
        require((r['warm_operations'],r['prep_operations'],r['operations'])==(3328,8,64),'fixed operation budget')
        slot=r['slot'];require(r['stream']==meta['stream'][slot] and r['state']==meta['state'][slot] and all(r[k]==meta[k] for k in ['output','def_entry','reset_entry']),'entry/state drift')
        require(r['cpu_before']==r['cpu_after']==meta['cpu'],'CPU migration')
        require(r['warm_sum']==13*sum(refs[x] for x in inputs['warm_ring']) and r['prep_sum']==sum(refs[132:]) and r['timed_sum']==8*sum(refs[132:]),'work counts/output sums')
        require(r['last_input']==139 and r['output_bytes']==refs[139],'last ring input/output')
        vs=counters[4*i:4*i+4];timed=vs[3]
        require(i==0 or raw[i-1]['end_ns']<=vs[0]['read0'],'overlapping row work')
        require(all(r[k]==timed[v] for k,v in [('begin_ns','w0'),('end_ns','w1'),('cpu_begin_ns','c0'),('cpu_end_ns','c1')]),'counter/raw timing mismatch')
        require(vs[0]['read0']<=vs[0]['w0']<vs[0]['w1']<=vs[1]['read0']<=vs[1]['w0']<vs[1]['w1']<=r['fixed_work_end_ns']<=vs[2]['read0']<=vs[2]['w0']<vs[2]['w1']<=vs[3]['read0']<=timed['w0'],'interval ordering')
        for v in vs:
            if not counter_valid(v):counter_bad.append(dict(row=i,kind=v['kind']))
        r['warm_wall_ns']=vs[0]['w1']-vs[0]['w0']+vs[1]['w1']-vs[1]['w0']
    for e in M.diagnostic_plan():
        rr=raw[4*e['episode']:4*e['episode']+4];require(len({r['anchor_ns'] for r in rr})==1,'quartet anchor drift')
        delivery_checks.append(M.delivery(rr,rr[0]['anchor_ns'],e['condition'],e['role_swap']))
        details.append(dict(episode=e['episode'],block=e['block'],condition=e['condition'],order=e['order'],role_swap=e['role_swap'],
            raw_delta_ns_per_op=float(M.contrast(M.ns_per_op_rows(rr),'y')),**{k:float(v) for k,v in M.centers(rr).items()}))
    for b in range(8):
        conditions={c:[] for c in M.CONDITIONS}
        for e in M.diagnostic_plan():
            if e['block']==b:conditions[e['condition']].append(raw[4*e['episode']:4*e['episode']+4])
        v=M.normalized_block(conditions);blocks.append(dict(reference_ns_per_op=float(v['reference_ns_per_op']),raw_ns_per_op={k:float(x) for k,x in v['raw_ns_per_op'].items()},pp={k:float(x) for k,x in v['pp'].items()}))
    result=M.outcomes({c:[b['pp'][c] for b in blocks] for c in M.CONDITIONS},all(x['valid'] for x in delivery_checks),not counter_bad)
    for x in details:x['delta_pp']=100*x['raw_delta_ns_per_op']/blocks[x['block']]['reference_ns_per_op']
    descriptive=[]
    for c in M.CONDITIONS:
        for key in ['order','role_swap']:
            for value in (0,1):
                selected=[x for x in details if x['condition']==c and x[key]==value]
                descriptive.append(dict(condition=c,factor=key,value=value,quartets=len(selected),
                    mean_ns_per_op=statistics.mean(x['raw_delta_ns_per_op'] for x in selected),
                    mean_pp=statistics.mean(x['delta_pp'] for x in selected),inferential_interval=False))
    hardware=[]
    for v in counters:
        delta={k:v[k+'_after']-v[k+'_before'] for k in ['cycles','instructions','reference']}
        hardware.append(dict(row=v['row'],kind=v['kind'],valid=counter_valid(v),
            **delta,raw_cycles_reference_event_ratio=delta['cycles']/delta['reference'] if delta['reference']>0 else None,
            frequency_semantics_verified=False,
            wall_ns=v['w1']-v['w0'],thread_cpu_ns=v['c1']-v['c0'],
            enabled_ns=v['enabled_after']-v['enabled_before'],running_ns=v['running_after']-v['running_before']))
    result.update(status='DIAGNOSTIC_COMPLETE',record_origin=origin,rows=192,counter_records=768,blocks=blocks,delivery=delivery_checks,counter_invalid=counter_bad,centers=details,old_result='HOLD_UNCHANGED',qualification=False,
        descriptive_order_and_mapping=descriptive,hardware_brackets=hardware,host_reference_semantics_verified=False,frequency_inference_supported=False,
        scope='New unchanged-code conditioning assignment only; no cause/bias estimate for old results, pure-geometry claim or qualification.')
    dump(out/'result.json',result)
    (out/'REPORT.txt').write_text('192 rows / 48 quartets; old HOLD unchanged; no qualification.\n'+json.dumps({k:v for k,v in result.items() if k in ['labels','delivery_valid','telemetry_valid','intervals']},indent=2)+'\n')

def main():
    p=argparse.ArgumentParser();g=p.add_mutually_exclusive_group();g.add_argument('--plan',action='store_true');g.add_argument('--build-only',action='store_true');g.add_argument('--execute-once',action='store_true');g.add_argument('--audit',action='store_true')
    p.add_argument('--out',type=Path,required=True);p.add_argument('--checkout',type=Path);p.add_argument('--cc',default='gcc-14');a=p.parse_args()
    if a.execute_once:execute(a.out)
    elif a.audit:audit(a.out)
    elif a.build_only:require(a.checkout is not None,'checkout required');prepare(a.checkout,a.out,a.cc)
    else:write_plan(a.out)
if __name__=='__main__':
    try:main()
    except Exception as error:
        # Preserve native status/raw data. A CLI failure never manufactures a
        # complete diagnostic result or replaces a partial result already saved.
        if '--out' in sys.argv:
            try:
                target=Path(sys.argv[sys.argv.index('--out')+1])
                if target.is_dir():
                    error_record=dict(error=repr(error),qualification=False)
                    if not (target/'driver-error.json').exists():dump(target/'driver-error.json',error_record)
                    with (target/'driver-errors.jsonl').open('a') as log:log.write(json.dumps(error_record)+'\n')
            except (OSError,ValueError,IndexError):pass
        raise
