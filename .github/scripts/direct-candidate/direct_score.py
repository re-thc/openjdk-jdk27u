"""Strict all-row public N/S scorer; calibration and slowdown diagnostics separate."""
from pathlib import Path
import argparse,base64,collections,csv,hashlib,json,lzma,math,statistics as S,subprocess,sys
sys.dont_write_bytecode=True
import direct_protocol as P

def read_csv(path,delimiter=','):
    with Path(path).open() as f:
        result=[]
        for r in csv.DictReader(f,delimiter=delimiter):
            P.require(None not in r and all(v is not None for v in r.values()),'CSV shape')
            try:result.append({k:v if k=='kind' and v in ['mono_pair','legacy_nested','empty_batch'] else int(v) for k,v in r.items()})
            except ValueError as e:raise P.InvalidData('CSV types') from e
        return result

def quantile(p,df):
    P.require(df in [7,31] and .5<p<1,'fixed degrees of freedom')
    def cdf(x):
        theta=math.atan(x/math.sqrt(df));v=theta
        for n in range(2,df,2):v=math.sin(theta)*math.cos(theta)**(n-1)/n+(n-1)*v/n
        return .5+math.exp(math.lgamma((df+1)/2)-.5*math.log(math.pi)-math.lgamma(df/2))*v
    a,b=0.,100.
    for _ in range(100):
        m=(a+b)/2
        if cdf(m)<p:a=m
        else:b=m
    return (a+b)/2

def interval(values,critical,n):
    P.require(len(values)==n and all(math.isfinite(v) for v in values),'finite complete block vector')
    mean=S.mean(values);half=critical*S.stdev(values)/math.sqrt(n)
    return dict(mean=mean,half=half,ci=[mean-half,mean+half],absolute_bound=abs(mean)+half,blocks=values,critical=critical,observations=n,df=n-1)

def classify_guard(effect,nulls,differences,order_means,limit,primary_calibration_passed=True):
    """No early precision/calibration return may erase independent diagnostics."""
    positive=effect['ci'][0]>0
    consistent=all(v>0 for v in differences) and all(v>0 for v in order_means)
    self_calibration=all(x['absolute_bound']<=limit for x in nulls)
    calibration=self_calibration and primary_calibration_passed
    precision=effect['half']<=limit
    bounded=effect['absolute_bound']<=limit
    if not calibration:status='UNRESOLVED';reason='self_null_calibration_failed'
    elif positive or consistent:status='HOLD_SLOWDOWN';reason='positive_interval' if positive else 'consistent_direction'
    elif not precision:status='UNRESOLVED';reason='effect_precision_failed'
    elif effect['ci'][1]<=0:status='CLEAR_NONINCREASE';reason='nonpositive_interval'
    elif effect['ci'][0]<=0<=effect['ci'][1] and bounded:status='RESOLUTION_LIMITED_CLEAR';reason='bounded_uncertainty_not_zero_regression'
    else:status='UNRESOLVED';reason='uncertainty_outside_resolution'
    return dict(status=status,reason=reason,calibration_passed=calibration,self_null_calibration_passed=self_calibration,primary_calibration_passed=primary_calibration_passed,resolution_passed=precision,
        observed_positive_effect_interval=positive,observed_consistent_direction=consistent,
        demonstrated_candidate_slowdown=calibration and positive,consistent_candidate_hold=calibration and consistent,
        guard_gate_passed=status in ['CLEAR_NONINCREASE','RESOLUTION_LIMITED_CLEAR'],zero_regression_proven=False)

def guard_differences(n,s):
    P.require(len(n)==len(s)==8 and all(math.isfinite(v) and v>0 for v in n) and all(math.isfinite(v) for v in s),'finite positive guard denominator')
    raw=[b-a for a,b in zip(n,s)]
    return raw,[100*d/a for d,a in zip(raw,n)]

def observed_order(worker,rows,events,clocks):
    eps,plan,commands=P.plans()
    P.require([r['seq'] for r in rows]==[r['seq'] for r in plan if r['worker']==worker],'observed row order')
    P.require([r['command'] for r in events]==[r['command'] for r in commands if r['worker']==worker],'observed event order')
    P.require([(r['episode'],r['kind']) for r in clocks]==[(e['episode'],k) for e in eps if e['worker']==worker for k in ['mono_pair','legacy_nested','empty_batch']],'observed clock order')

def score_records(m,rows,events,clocks,metadata,checks,refs,provenance_verified=False):
    P.validate_manifest(m);origin=m['record_origin'];P.require(origin not in ['PLAN_ONLY_NOT_MEASURED','VALIDATION_ONLY_SYNTHETIC_CLOCK'],'not measurement evidence')
    P.require(origin!='NATIVE_MEASUREMENT' or provenance_verified,'native provenance required')
    eps,plan,commands=P.plans();profiles=m['profiles'];P.require((len(rows),len(events),len(clocks))==(P.ROWS,P.COMMANDS,P.CLOCKS),'complete fixed row/event/clock counts')
    P.require(set(metadata)==set(checks)==set(range(8)),'worker proofs missing');rsums={}
    for w in range(8):
        x=metadata[w];P.require(x['protocol']==P.VERSION and x['worker']==w,'metadata identity')
        P.require(x['load_reverse']==((w>>1)&1) and x['init_reverse']==(w&1) and x['allocator_trace'] is False,'load/init/allocator')
        P.require(x['sizeof_stream']==112 and x['slot_stride']==128 and x['S_stream']==x['N_stream']+128 and x['N_stream']%64==0,'stream layout')
        for key in ['N_state','S_state','N_fresh_stream','S_fresh_stream','output','N_def','S_def','N_reset','S_reset']:P.require(isinstance(x[key],int) and x[key]>0,'pointer identity')
        P.require(x['mono_resolution_ns']>0 and x['cpu_resolution_ns']>0 and x['before_checks']==1652,'clock/correctness metadata')
        for p in profiles:
            for i in set(p['banks']):P.require(refs[w,p['id'],i]>0,'missing compressed reference')
            rsums[w,p['id']]=sum(refs[w,p['id'],i] for i in p['banks'])
        owned=[c for c in commands if c['worker']==w]
        expected=dict(worker=w,before_checks=1652,after_checks=1652,all_bytes_equal=True,batches=sum(c['opcode']==2 for c in owned),resets=sum(c['opcode']==0 for c in owned),prefixes=sum(c['opcode']==1 for c in owned))
        P.require(checks[w]==expected,'final correctness/count proof')
    event_map={};last_end=0
    for r,c in zip(events,commands):
        P.require(all(r[k]==c[k] for k in ['command','worker','opcode','episode']),'command schedule')
        e=eps[r['episode']];w=r['worker'];work=(1 if e['phase']==3 else e['work']^1) if r['opcode']==1 else e['work'];p=profiles[work]
        ops=0 if r['opcode']==0 else 3072 if r['opcode']==1 else p['iterations']
        P.require((r['work'],r['operations'],r['output_sum'],r['reset_calls'])==(work,ops,rsums[w,work]*(ops//len(p['banks'])),4 if r['opcode']==0 else 0),'event recipe/output')
        P.require(r['begin_ns']>=last_end and r['end_ns']>r['begin_ns'] and r['cpu_end_ns']>r['cpu_begin_ns'],'event timing/order');last_end=r['end_ns']
        P.require(r['cpu_before']==r['cpu_after']==metadata[w]['cpu_pin'],'CPU affinity')
        event_map[r['command']]=r
    row_commands={c['row']:c['command'] for c in commands if c['opcode']==2};grouped=collections.defaultdict(list);resources=collections.Counter()
    for r,expected in zip(rows,plan):
        P.require(all(r[k]==v for k,v in expected.items()),'row schedule/arm/label');w=r['worker'];a=r['arm'];p=profiles[r['work']];warm=profiles[p['warm_work']];meta=metadata[w];prefix='N_' if a==0 else 'S_'
        P.require(r['command']==row_commands[r['seq']],'row command');ev=event_map[r['command']]
        P.require((r['operations'],r['warm_operations'],r['prep_operations'],r['warm_work'],r['bank_phase'])==(p['iterations'],3328,p['prep'],p['warm_work'],0),'fixed warm/prep/operation recipe')
        for key,source in [('output','output'),('def_entry',prefix+'def'),('reset_entry',prefix+'reset')]:P.require(r[key]==meta[source],'row code/output identity')
        P.require(r['stream']==meta[prefix+('fresh_stream' if p['life']==1 else 'stream')],'row stream identity')
        P.require(r['state']>0 and (p['life']==1 or r['state']==meta[prefix+'state']),'row state identity')
        P.require(ev['begin_ns']<=r['warm_begin_ns']<r['warm_end_ns']<=r['begin_ns']<r['end_ns']<=ev['end_ns'],'wall nesting')
        P.require(ev['cpu_begin_ns']<=r['warm_cpu_begin_ns']<r['warm_cpu_end_ns']<=r['cpu_begin_ns']<r['cpu_end_ns']<=ev['cpu_end_ns'],'CPU nesting')
        for stem in ['', 'warm_']:
            P.require(r[stem+'wall_ns']==r[stem+'end_ns']-r[stem+'begin_ns']>0 and r[stem+'cpu_ns']==r[stem+'cpu_end_ns']-r[stem+'cpu_begin_ns']>0,'timestamp intervals')
        last=p['banks'][-1]
        P.require((r['last_input'],r['output_bytes'],r['output_sum'],r['warm_sum'],r['prep_sum'])==(last,refs[w,p['id'],last],rsums[w,p['id']]*(p['iterations']//len(p['banks'])),rsums[w,warm['id']]*(3328//len(warm['banks'])),rsums[w,p['id']]*(p['prep']//len(p['banks']))),'reference/output sums')
        for pre in ['','w_']:
            for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']:P.require(r[pre+k]>=0,'negative resource');resources[pre+k]+=r[pre+k]
        grouped[r['episode']].append(r)
    clock_groups=collections.defaultdict(list)
    for c in clocks:
        P.require(c['episode'] in range(P.EPISODES),'clock episode');e=eps[c['episode']];ev=event_map[6*c['episode']]
        P.require(c['command']==6*c['episode'] and c['worker']==e['worker'] and c['kind'] in ['mono_pair','legacy_nested','empty_batch'],'clock identity')
        P.require(c['operations']==(512 if c['kind']=='empty_batch' else 128),'clock recipe')
        P.require(ev['begin_ns']<=c['begin_ns']<c['end_ns']<=ev['end_ns'] and c['outer_wall_ns']==c['end_ns']-c['begin_ns'] and 0<=c['wall_ns']<=c['outer_wall_ns'] and c['cpu_ns']>0,'clock interval')
        clock_groups[c['episode']].append(c)
    for e in eps:
        cs=clock_groups[e['episode']];P.require([c['kind'] for c in cs]==['mono_pair','legacy_nested','empty_batch'] and all(a['end_ns']<=b['begin_ns'] for a,b in zip(cs,cs[1:])),'clock order/completeness')
    cells=collections.defaultdict(dict)
    for eid,rs in grouped.items():
        e=eps[eid];P.require([r['position'] for r in rs]==[0,1,2,3],'quartet positions');ops=profiles[e['work']]['iterations']
        means={label:S.mean(r['wall_ns']/ops for r in rs if r['label']==label) for label in [0,1]}
        cells[e['phase'],e['worker'],e['work'],e['kind']][e['block'],e['order']]=dict(delta=means[0]-means[1],A=means[0],B=means[1])
    def vectors(values,n,key='delta'):
        P.require(set(values)=={(b,o) for b in range(n) for o in [0,1]},'cell completeness')
        orders={name:[values[b,o][key] for b in range(n)] for name,o in [('ABBA',0),('BAAB',1)]}
        return [(a+b)/2 for a,b in zip(orders['ABBA'],orders['BAAB'])],orders
    controls=[];effects=[];guards=[];tc=quantile(1-.05/32,31);tg=quantile(1-.05/560,7)
    for (phase,w,work,kind),values in sorted(cells.items()):
        if phase==3:continue
        v,orders=vectors(values,32);critical=tc if phase==2 else 2.201
        x=dict(phase=phase,worker=w,work=work,kind=kind,effect=interval(v,critical,32),order={k:interval(z,critical,32) for k,z in orders.items()})
        if phase==2:x['benefit_passed']=x['effect']['ci'][0]>=500 and all(z['mean']>0 for z in x['order'].values());effects.append(x)
        else:x['passed']=x['effect']['absolute_bound']<=100 and all(z['absolute_bound']<=100 for z in x['order'].values());controls.append(x)
    P.require(len(controls)==64 and len(effects)==16,'main cell counts');main_calibrated=all(x['passed'] for x in controls)
    for w in range(4):
      for work in range(2,12):
        values=cells[3,w,work,2];n,unused=vectors(values,8,'A');s,unused=vectors(values,8,'B')
        raw,ratios=guard_differences(n,s);percentage=work not in [2,3,4,11];scale=lambda b:100/n[b] if percentage else 1
        vec=ratios if percentage else raw;effect=interval(vec,tg,8);order_means=[];nulls=[];null_details=[]
        for o in [0,1]:order_means.append(S.mean(-values[b,o]['delta']*scale(b) for b in range(8)))
        for kind in [0,1]:
          pooled,orders=vectors(cells[3,w,work,kind],8)
          parts={'pooled':pooled,**orders};d={k:interval([v*scale(b) for b,v in enumerate(vs)],tg,8) for k,vs in parts.items()};nulls+=list(d.values());null_details.append(dict(kind=kind,strata=d))
        flags=classify_guard(effect,nulls,raw,order_means,1 if percentage else 100,main_calibrated)
        guards.append(dict(worker=w,work=work,unit='percentage_points' if percentage else 'ns',N_blocks=n,S_blocks=s,raw_differences=raw,order_means=order_means,effect=effect,self_nulls=null_details,**flags))
    calibrated=all(x['passed'] for x in controls);benefit=all(x['benefit_passed'] for x in effects);guardpass=all(x['guard_gate_passed'] for x in guards)
    return dict(protocol=P.VERSION,record_origin=origin,rows=len(rows),commands=len(events),clock_rows=len(clocks),all_rows_retained=True,
      controls=controls,effects=effects,guards=guards,resources=dict(resources),primary_calibration_passed=calibrated,public_benefit_passed=benefit,guard_gate_passed=guardpass,
      statistical_criteria_passed=calibrated and benefit and guardpass,bounded_native_criteria_passed=origin=='NATIVE_MEASUREMENT' and calibrated and benefit and guardpass,
      primary_family=16,primary_critical=tc,guard_family=280,guard_critical=tg,zero_regression_proven=False,shipping_qualified=False,Java_qualified=False,
      warning='RESOLUTION_LIMITED_CLEAR is bounded uncertainty, never zero regression. Invalid calibration retains positive diagnostics but forbids demonstrated candidate slowdown.')

def inventory(root):
    root=Path(root).resolve();m=json.loads((root/'manifest.json').read_text());P.validate_manifest(m,root)
    frozen=json.loads((root/'preregistered.json').read_text());P.require(frozen['manifest']==P.sha(root/'manifest.json') and frozen['before_build'] is True,'preregistration')
    expected={'source/'+x for x in [*P.SOURCES,'tiny-zlib-direct-ns.yml']}|{'legacy-source/'+x for x in ['reset-study.c','reset-study.py','reset-score.py','reset_protocol.py','test_reset_mechanism.py','reset-invariants.c','backend-reset.patch','source-pins.json','tiny-zlib-mechanism.yml']}
    P.require(set(frozen['sources'])==expected,'full source set')
    for rel,h in frozen['sources'].items():P.require(P.sha(root/rel)==h,'source changed')
    P.require(P.sha(root/'legacy-source/backend-reset.patch')==P.PATCH and P.sha(root/'legacy-source/source-pins.json')==P.PINS,'backend/pins changed')
    identities=json.loads((root/'identities.json').read_text());actual={str(p.relative_to(root)):p for top in ['source','legacy-source','inputs','build'] for p in (root/top).rglob('*') if p.is_file()}
    required={'build/'+n for n in ['direct-driver','direct-driver-asan','reset-proof','reset-proof-asan','extended-boundaries','extended-boundaries-asan','reset-study','reset-check','reset-invariants','reset-invariants-asan','S/reset-control.o','V/reset-control.o']}|{'build/'+v+'/'+n for v in ['N','S','NM','VM','NA','VA','V','SA','VD','VAD'] for n in ['libz.a','ng.so']}|{'build/stock/libz.a'}
    P.require(set(identities)==set(actual) and required<=set(actual),'native/input/source inventory')
    P.require({n for n in actual if n.startswith(('source/','legacy-source/'))}==expected,'unexpected source inventory')
    prior=json.loads((root/'preparation/preregistered.json').read_text());P.require(prior['frozen_before_measurement'] is True and set(prior['files'])=={Path(n).name for n in expected if n.startswith('legacy-source/')},'legacy preregistration')
    for n,h in prior['files'].items():P.require(P.sha(root/'legacy-source'/n)==h,'legacy build source changed')
    for rel,p in actual.items():P.require(not p.is_symlink() and identities[rel]==dict(bytes=p.stat().st_size,sha256=P.sha(p)),'actual identity changed')
    launch=json.loads((root/'launch.json').read_text());expected_launch=[str(root/'build/direct-driver'),str(root/'build/N/ng.so'),str(root/'build/S/ng.so'),*[str(root/n) for n in ['inputs.tsv','profiles.tsv','episodes.tsv','commands.tsv']],str(root)]
    P.require(launch['basecmd']==expected_launch,'public launch binding')
    receipt=json.loads((root/'approved-publication.json').read_text());P.require(receipt['repository']=='re-thc/openjdk-jdk27u' and receipt['tag']==P.TAG and receipt['attempt']==1,'publication receipt')
    for name in ['second-reset-proof.json','second-reset-proof-asan.json']:
        proof=json.loads((root/name).read_text());P.require(proof['cases']==66 and all(proof[k] is True for k in ['first_sparse_0_through_64','65_full_fallback','second_public_reset_full_every_case','head_empty_every_reset','prev_initialized_on_create','public_N_S_verifier_bytes_equal','public_libraries_no_test_counters']) and proof['timing'] is False,'second reset proof')
    for v in ['N','S','SA']:
        symbols=(root/f'public-symbols-{v}.txt').read_text();actual_symbols=subprocess.check_output(['nm','-D',root/f'build/{v}/ng.so'],text=True)
        P.require(symbols==actual_symbols and 'jdk_ng_test_' not in symbols and 'reset_control' not in symbols,'timed public instrumentation/symbol binding')
    return {name:P.sha(root/name) for name in ['manifest.json','preregistered.json','identities.json','launch.json','environment.json','build-commands.json','direct-build-commands.json','approved-publication.json','second-reset-proof.json','second-reset-proof-asan.json','preparation/preregistered.json','public-symbols-N.txt','public-symbols-S.txt','public-symbols-SA.txt','extended-boundaries.c','extended-boundaries.log','extended-boundaries-asan.log']}

def score(root):
    root=Path(root);proof=inventory(root);P.require(json.loads((root/'provenance-before.json').read_text())==proof==json.loads((root/'provenance-after.json').read_text()),'before/after provenance')
    rows=[];events=[];clocks=[];meta={};checks={};refs={};hashes={}
    for w in range(8):
        r=read_csv(root/f'worker-{w}.csv');e=read_csv(root/f'events-{w}.csv');c=read_csv(root/f'clocks-{w}.csv');observed_order(w,r,e,c);rows+=r;events+=e;clocks+=c
        meta[w]=json.loads((root/f'worker-{w}-metadata.json').read_text());checks[w]=json.loads((root/f'worker-{w}-checks.json').read_text())
        for p in json.loads((root/'manifest.json').read_text())['profiles']:
            for i in set(p['banks']):
                b=(root/f"compressed/w{w}-p{p['id']}-i{i}.bin").read_bytes();key=p['id'],i;h=hashlib.sha256(b).hexdigest();P.require(key not in hashes or hashes[key]==h,'cross-worker compressed bytes');hashes[key]=h;refs[w,*key]=len(b)
    rows.sort(key=lambda r:r['seq']);events.sort(key=lambda r:r['command']);result=score_records(json.loads((root/'manifest.json').read_text()),rows,events,clocks,meta,checks,refs,True);result['artifact_provenance']=proof;return result

def report(root,result):
    lines=[P.VERSION+' '+result['record_origin'],f"Rows {result['rows']}; primary calibration {result['primary_calibration_passed']}; public benefit {result['public_benefit_passed']}; guards {result['guard_gate_passed']}",result['warning']]
    for x in result['guards']:lines.append(f"worker {x['worker']} profile {x['work']}: {x['status']}; effect {x['effect']['mean']} {x['unit']}, CI {x['effect']['ci']}; observed positive {x['observed_positive_effect_interval']}, observed consistent {x['observed_consistent_direction']}, calibration {x['calibration_passed']}, precision {x['resolution_passed']}")
    (Path(root)/'REPORT.txt').write_text('\n'.join(lines)+'\n')

def export(root):
    root=Path(root);files={}
    if not root.exists():print('No direct N/S evidence.');return
    for p in sorted(root.rglob('*')):
        if not p.is_file():continue
        rel=p.relative_to(root)
        if rel.parts[0] in ['build','baseline','candidate','verify','inputs','compressed'] or rel.suffix=='.bin':continue
        b=p.read_bytes();files[str(rel)]=dict(bytes=len(b),sha256=hashlib.sha256(b).hexdigest(),base64=base64.b64encode(b).decode())
    b=lzma.compress(json.dumps(files,separators=(',',':')).encode());encoded=base64.b64encode(b).decode()
    if len(encoded)>7000000:print('DIRECT_FULL_ARTIFACT_ONLY',len(encoded))
    else:
        print('DIRECT_XZ_BEGIN',len(encoded),len(b),hashlib.sha256(b).hexdigest())
        for i in range(0,len(encoded),1000):print('DIRECT_DATA',encoded[i:i+1000])
        print('DIRECT_END')
    if (root/'REPORT.txt').exists():print((root/'REPORT.txt').read_text())
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--export-local',type=Path,required=True);export(parser.parse_args().export_local)
