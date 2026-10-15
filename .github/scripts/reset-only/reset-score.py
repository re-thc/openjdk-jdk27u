"""Strict mechanism-v2 scorer/exporter. Reads saved observations; never runs native code."""
from pathlib import Path
import argparse,base64,collections,csv,gzip,hashlib,json,math,statistics as S
import reset_protocol as P

def cdf(t,df):
    sign=1 if t>=0 else -1;theta=math.atan(abs(t)/math.sqrt(df))
    if df==4:v=math.sin(theta)-math.sin(theta)**3/3
    elif df==11:
        v=theta
        for n in range(2,11,2):v=math.sin(theta)*math.cos(theta)**(n-1)/n+(n-1)*v/n
    else:raise ValueError('only prespecified df4/11 supported')
    return .5+sign*math.exp(math.lgamma((df+1)/2)-.5*math.log(math.pi)-math.lgamma(df/2))*v
def quantile(p,df):
    P.require(.5<p<1,'quantile probability');lo,hi=0.,100.
    for _ in range(100):
        mid=(lo+hi)/2
        if cdf(mid,df)<p:lo=mid
        else:hi=mid
    return (lo+hi)/2
def interval(xs,t=P.CAL_T):
    P.require(len(xs)==12 and all(math.isfinite(v) for v in xs),'12 finite block observations required')
    mean=S.mean(xs);half=t*S.stdev(xs)/math.sqrt(12)
    return dict(mean=mean,half=half,ci=[mean-half,mean+half],absolute_bound=abs(mean)+half,
                blocks=xs,observations=12,df=11,critical=t)
def classification(x):
    lo,hi=x['ci'];m=x['mean'];h=x['half']
    return ('equivalent_within_100ns' if abs(m)+h<=100 else
        'interval_entirely_outside_100ns' if lo>100 or hi < -100 else
        'point_outside_100ns_with_uncertainty' if abs(m)>100 else
        'uncertainty_crosses_100ns')
def describe_control(x):
    """Reporting only: distinguish pooled classification from the actual gate."""
    pooled=classification(x['wall'])
    orders={name:classification(value) for name,value in x['order'].items()}
    gate=('equivalence_established_all_required_strata' if x['passed'] else
          'equivalence_not_established_by_order_bound' if x['pooled_gate_passed'] else
          'equivalence_not_established_by_pooled_bound')
    return dict(pooled_classification=pooled,order_classifications=orders,
                gate_classification=gate,
                classification=pooled if x['passed'] or not x['pooled_gate_passed'] else 'order_equivalence_not_established')

def read_csv(path,delimiter=','):
    with Path(path).open() as f:
        reader=csv.DictReader(f,delimiter=delimiter);result=[]
        for r in reader:
            P.require(None not in r and all(v is not None for v in r.values()),'malformed CSV row')
            try:result.append({k:(v if k=='kind' and not v.isdigit() else int(v)) for k,v in r.items()})
            except ValueError as e:raise P.InvalidData('noninteger numeric CSV field') from e
        return result
def validate_metadata(meta,w):
    P.require(meta['protocol']==P.VERSION,'worker protocol version')
    for k,v in P.factors(w).items():P.require(meta[k]==v,'worker factor mismatch: '+k)
    P.require(meta['load_order']==([1,0] if meta['load_reverse'] else [0,1]),'observed load order')
    P.require(meta['init_order']==([1,0] if meta['init_reverse'] else [0,1]),'observed init order')
    P.require(meta['allocator_trace_before_init'] is False,'allocator trace polluted timed initialization')
    P.require(meta['timer_layout']=='CPU0,MONO0,operations,MONO1,CPU1','wall/CPU timestamp scope')
    P.require(meta['mono_resolution_ns']>0 and meta['cpu_resolution_ns']>0,'missing clock resolution')
    P.require(meta['sizeof_stream']==112 and meta['slot_stride']==128,'stream layout')
    for k in ['N_stream','S_stream','N_state','S_state','output','N_def','S_def','N_reset','S_reset','control']:
        P.require(isinstance(meta[k],int) and meta[k]>0,'missing address '+k)
    P.require(all(meta[k]%64==0 for k in ['N_stream','S_stream','N_state','S_state']),'unequal/misaligned public stream slots')
    P.require(meta['S_stream']-meta['N_stream']==128,'public stream stride')
    P.require(meta['N_state']!=meta['S_state'] and meta['N_def']!=meta['S_def'],'separate N/S image/state')
    P.require(meta['before_checks']==3184,'untimed before coverage not complete')

def score_records(manifest,rows,clocks,metadata,checks,refs,phases,finalized,provenance_verified=False):
    """Pure statistical/structural engine; synthetic callers must mark their origin."""
    P.validate_manifest(manifest)
    P.require(phases in [[1],[1,2,3]],'only complete pre or complete fixed run may be scored')
    origin=manifest['record_origin'];P.require(origin in ['NATIVE_MEASUREMENT','SYNTHETIC_UNIT_TEST'],'unknown record origin')
    P.require(origin!='NATIVE_MEASUREMENT' or provenance_verified,'native artifact provenance has not been verified')
    works=manifest['workloads'];P.require(len(works)==10,'untimed coverage profile missing')
    for wi in [0,1]:
        w=works[wi];P.require(w['section']==0 and w['life']==0 and w['iterations']==512 and w['warm']==256 and w['quartets']==2 and len(w['banks'])==256,'timed workload changed')
        multisets=[collections.Counter(w['banks'][(o+k)%256] for k in range(512)) for o in [0,8,128,136]]
        P.require(all(x==multisets[0] for x in multisets),'order/input multiset mismatch')
    expected=[r for r in P.schedule() if r['phase'] in phases]
    P.require(len(rows)==len(expected),'missing or extra measurement rows')
    P.require(set(metadata)==set(P.WORKERS),'missing worker metadata')
    for w in P.WORKERS:validate_metadata(metadata[w],w)
    last_work={w:-1 for w in P.WORKERS};last_end=0;resources=collections.Counter();groups=collections.defaultdict(list)
    for r,p in zip(rows,expected):
        P.require(all(r[k]==v for k,v in p.items()),'row schedule/order/arm mismatch at '+str(p['seq']))
        w=r['worker'];m=metadata[w];work=works[r['work']];image='N' if r['arm']==0 else 'S'
        P.require(r['stream']==m[image+'_stream'] and r['state']==m[image+'_state'],'stream/state identity changed')
        P.require(r['def_entry']==m[image+'_def'],'compression image mismatch')
        P.require(r['reset_entry']==(m['N_reset'] if r['arm']==0 else m['control']),'reset wrapper/image mismatch')
        P.require(r['force_full']==int(r['arm']==2),'forced-reset argument mismatch')
        P.require(r['previous_work']==last_work[w],'worker predecessor mismatch');last_work[w]=r['work']
        P.require(r['begin_ns']>=last_end and r['end_ns']>r['begin_ns'],'overlapping or nonmonotonic measurement windows');last_end=r['end_ns']
        P.require(r['wall_ns']==r['window_ns']==r['end_ns']-r['begin_ns'],'wall interval changed')
        P.require(r['cpu_ns']==r['cpu_end_ns']-r['cpu_begin_ns']>0,'CPU enclosing interval changed')
        P.require(r['prep_ns']>=0,'negative preparation duration')
        ids=[work['banks'][(r['offset']+k)%256] for k in range(512)]
        P.require(r['last_input']==ids[-1],'last input mismatch')
        P.require(r['output_sum']==sum(refs[w,r['work'],i] for i in ids) and r['output_bytes']==refs[w,r['work'],ids[-1]],'output length accounting')
        P.require(r['output']==m['output'],'output buffer changed')
        for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']:
            P.require(r[k]>=0,'negative resource counter');resources[k]+=r[k]
        groups[w,r['phase'],r['work'],r['kind'],r['block'],r['quartet']].append(r)
    balance=P.position_balance(rows,phases)
    clock_keys={(w,b,k) for w in P.WORKERS for b in range(12) for k in ['mono_pair','legacy_nested','empty_batch']}
    P.require(len(clocks)==288 and {(x['worker'],x['block'],x['kind']) for x in clocks}==clock_keys,'missing/duplicate clock observations')
    for x in clocks:
        P.require(x['operations']==(512 if x['kind']=='empty_batch' else 128),'clock observation operations')
        P.require(x['end_ns']>x['begin_ns'] and x['outer_wall_ns']==x['end_ns']-x['begin_ns'],'clock observation interval')
        P.require(0<=x['wall_ns']<=x['outer_wall_ns'] and x['cpu_ns']>0,'invalid clock observations')
        first=next(r for r in rows if r['worker']==x['worker'] and r['phase']==1 and r['block']==x['block'])
        P.require(x['end_ns']<=first['begin_ns'],'clock diagnostics collected after calibration')
        prior=rows[first['seq']-1] if first['seq'] else None
        P.require(prior is None or x['begin_ns']>=prior['end_ns'],'clock diagnostics overlap an earlier measurement')
    for w in P.WORKERS:
        observed=[x for x in clocks if x['worker']==w]
        expected_clocks=[(b,k) for b in range(12) for k in ['mono_pair','legacy_nested','empty_batch']]
        P.require([(x['block'],x['kind']) for x in observed]==expected_clocks,'clock command/type order changed')
        P.require(all(a['end_ns']<=b['begin_ns'] for a,b in zip(observed,observed[1:])),'overlapping clock observations')
    P.require(set(checks)==set(P.WORKERS) if finalized else not checks,'finalization proof missing/unexpected')
    if finalized:
        for w,c in checks.items():
            P.require(c['worker']==w and c['before_checks']==c['after_checks']==3184 and c['all_outputs_equal'] is True,'untimed after proof incomplete')
            P.require(c['batches']==sum(r['worker']==w for r in rows),'final batch count')
            P.require(c['clock_commands']==12,'clock diagnostics not complete')
    cells=collections.defaultdict(dict)
    for (w,phase,wi,kind,b,q),rs in groups.items():
        P.require([r['position'] for r in rs]==[0,1,2,3],'quartet positions')
        labels=[r['label'] for r in rs];P.require(labels in [[0,1,1,0],[1,0,0,1]],'quartet order')
        def avg(key,label):return S.mean(r[key]/512 for r in rs if r['label']==label)
        cells[w,phase,wi,kind][b,q]=dict(wall=avg('wall_ns',0)-avg('wall_ns',1),cpu=avg('cpu_ns',0)-avg('cpu_ns',1),a=avg('wall_ns',0),b=avg('wall_ns',1),order='ABBA' if labels[0]==0 else 'BAAB')
    controls=[];treatments=[];t32=quantile(1-.05/(2*32),11)
    for (w,phase,wi,kind),values in sorted(cells.items()):
        P.require(set(values)=={(b,q) for b in range(12) for q in range(2)},'missing complete block/quartet')
        vec=lambda key:[S.mean(values[b,q][key] for q in range(2)) for b in range(12)]
        ds=vec('wall');orders={o:[next(v['wall'] for (bb,q),v in values.items() if bb==b and v['order']==o) for b in range(12)] for o in ['ABBA','BAAB']}
        x=dict(worker=w,phase=phase,work=wi,kind=kind,name=P.NAMES[kind],wall=interval(ds,P.CAL_T if phase!=2 else t32),cpu=interval(vec('cpu'),P.CAL_T if phase!=2 else t32),
               order={o:interval(v,P.CAL_T if phase!=2 else t32) for o,v in orders.items()},a_mean_ns=S.mean(vec('a')),b_mean_ns=S.mean(vec('b')),
               first6_mean=S.mean(ds[:6]),last6_mean=S.mean(ds[6:]),positive_blocks=sum(v>0 for v in ds),negative_blocks=sum(v<0 for v in ds))
        if phase!=2:
            x['pooled_gate_passed']=x['wall']['absolute_bound']<=100
            x['order_veto_passed']=all(v['absolute_bound']<=100 for v in x['order'].values())
            x['passed']=x['pooled_gate_passed'] and x['order_veto_passed'];x.update(describe_control(x));controls.append(x)
        else:
            x['equivalence95']=interval(ds);x['reference_equivalent']=x['equivalence95']['absolute_bound']<=100 if kind==3 else None
            x['classification']=classification(x['equivalence95']);treatments.append(x)
    P.require(len(controls)==48*sum(p in phases for p in [1,3]),'control cell count')
    P.require(len(treatments)==(32 if 2 in phases else 0),'treatment cell count')
    failed=[x for x in controls if not x['passed']];cal=not failed
    result=dict(protocol=P.VERSION,record_origin=origin,scope=P.SCOPE,rows=len(rows),controls=len(controls),failed_controls=len(failed),calibration_passed=cal,
        pooled_failed_controls=sum(not x['pooled_gate_passed'] for x in controls),order_veto_failed_controls=sum(not x['order_veto_passed'] for x in controls),
        control_results=controls,treatments=treatments,resources=dict(resources),clock_observations=clocks,measurement_position_balance=balance,all_rows_retained=True,retries=0,
        public_api_qualified=False,fresh_long_Java_qualified=False)
    if 2 in phases:
        fu=[x for x in treatments if x['kind']==4];nf=[x for x in treatments if x['kind']==3]
        P.require(len(fu)==len(nf)==16,'complete eight-process effects')
        benefit=all(x['wall']['ci'][0]>=500 for x in fu)
        order_ok=all(v['mean']>0 for x in fu for v in x['order'].values())
        criteria=cal and benefit and order_ok and finalized
        result['decision']=dict(statistical_criteria_passed=criteria,native_mechanism_qualified=criteria and origin=='NATIVE_MEASUREMENT',
            benefit_passed=benefit,order_passed=order_ok,reference_equivalence_passed=all(x['reference_equivalent'] for x in nf),
            simultaneous_effects=32,critical=t32,df=11,zero_added_bytes=True,public_api_qualified=False,fresh_long_Java_qualified=False)
        result['factorial']=factorial(nf)
    return result

def factorial(nf):
    """Balanced2x2 with2 independent processes/cell. No block pseudoreplication."""
    output=[];critical=quantile(1-.05/(2*6),4)
    for wi in [0,1]:
        ys={x['worker']:x['wall']['mean'] for x in nf if x['work']==wi};P.require(set(ys)==set(P.WORKERS),'factorial process means')
        design={w:[1,2*P.factors(w)['load_reverse']-1,2*P.factors(w)['init_reverse']-1,(2*P.factors(w)['load_reverse']-1)*(2*P.factors(w)['init_reverse']-1)] for w in P.WORKERS}
        betas=[sum(design[w][j]*ys[w] for w in P.WORKERS)/8 for j in range(4)]
        residuals=[ys[w]-sum(design[w][j]*betas[j] for j in range(4)) for w in P.WORKERS]
        se=math.sqrt(sum(v*v for v in residuals)/4/8);effects={}
        for name,j,mult in [('load_high_minus_low',1,2),('init_high_minus_low',2,2),('interaction_difference_of_differences',3,4)]:
            estimate=mult*betas[j];half=critical*mult*se;effects[name]=dict(mean=estimate,ci=[estimate-half,estimate+half])
        output.append(dict(work=wi,process_means=ys,independent_units=8,residual_df=4,critical=critical,simultaneous_factor_effects=6,
            effects=effects,intercept=betas[0],residuals=residuals,scope='Conditional on these8 processes/one host; hardware cache/frequency mechanisms not uniquely identified.'))
    return output

RUNTIME_NAMES={'reset-study.c','reset-study.py','reset-score.py','reset_protocol.py','test_reset_mechanism.py','reset-invariants.c','backend-reset.patch','source-pins.json','tiny-zlib-mechanism.yml'}
CRITICAL_BINARIES={'build/stock/libz.a','build/reset-study','build/reset-check','build/reset-invariants','build/reset-invariants-asan',
    'build/S/reset-control.o','build/V/reset-control.o'}|{f'build/{name}/{file}' for name in ['N','S','V','NM','VM','NA','VA'] for file in ['libz.a','ng.so']}

def verify_artifacts(root):
    """Rehash real pinned input bytes and all recorded sources/build products.

    Before/after equality is also compared to the coordinator's in-memory
    snapshot; changing a hash file together with a binary cannot hide a change.
    """
    root=Path(root);m=json.loads((root/'manifest.json').read_text())
    P.validate_manifest(m,root)
    plans=read_csv(root/'schedule.tsv','\t');P.validate_schedule(plans)
    P.require(P.sha(root/'schedule.tsv')==P.SCHEDULE_SHA,'schedule hash')
    frozen=json.loads((root/'preregistered.json').read_text());P.require(P.sha(root/'manifest.json')==frozen['manifest_sha256'],'manifest changed')
    P.require(frozen['frozen_before_measurement'] is True and frozen['schedule_sha256']==P.SCHEDULE_SHA,'preregistration missing')
    P.require(set(frozen['files'])==RUNTIME_NAMES,'frozen runtime source set changed')
    for name,h in frozen['files'].items():P.require(P.sha(root/'source'/name)==h,'frozen source changed: '+name)
    P.require(P.sha(root/'source/backend-reset.patch')==P.PATCH and P.sha(root/'source/source-pins.json')==P.PINS,'reviewed backend/pins changed')
    expected_inputs=''.join(f"{x['id']}\t{x['path']}\n" for x in m['inputs'])
    expected_work=''.join('\t'.join(str(w[k]) for k in ['id','section','life','iterations','warm','quartets'])+'\t'+','.join(map(str,w['banks']))+'\n' for w in m['workloads'])
    P.require((root/'inputs.tsv').read_text()==expected_inputs,'native input index changed')
    P.require((root/'workloads.tsv').read_text()==expected_work,'native workload index changed')
    launch=json.loads((root/'launch.json').read_text());base=[str(root/'build/reset-study'),str(root/'build/N/ng.so'),str(root/'build/S/ng.so'),str(root/'inputs.tsv'),str(root/'workloads.tsv'),str(root/'schedule.tsv'),str(root)]
    P.require(launch['basecmd']==base and launch['libraries']=={name:str(root/f'build/{name}/ng.so') for name in ['N','S','V','NM','VM','NA','VA']},'native binary launch binding changed')
    identities=json.loads((root/'identities.json').read_text())
    actual={str(p.relative_to(root)):p for top in ['source','inputs','build'] for p in (root/top).rglob('*') if p.is_file()}
    P.require(set(identities)==set(actual) and CRITICAL_BINARIES<=set(actual),'input/source/binary inventory missing or changed')
    for rel,p in actual.items():
        record=identities[rel]
        P.require(not p.is_symlink() and record==dict(bytes=p.stat().st_size,sha256=P.sha(p)),'input/source/binary identity changed: '+rel)
    publication=None
    if m['record_origin']=='NATIVE_MEASUREMENT':
        publication=json.loads((root/'approved-publication.json').read_text())
        P.require(publication['repository']=='re-thc/openjdk-jdk27u' and publication['tag']=='diagnostic-tiny-zlib-mechanism-20261015-once' and publication['attempt']==1,'approved publication receipt missing or changed')
    return dict(version='artifact-provenance-v1',manifest_sha256=P.sha(root/'manifest.json'),
        schedule_sha256=P.SCHEDULE_SHA,preregistered_sha256=P.sha(root/'preregistered.json'),
        identities_sha256=P.sha(root/'identities.json'),launch_sha256=P.sha(root/'launch.json'),
        input_index_sha256=P.sha(root/'inputs.tsv'),workload_index_sha256=P.sha(root/'workloads.tsv'),
        publication_receipt_sha256=P.sha(root/'approved-publication.json') if publication else None,
        binary_count=len(CRITICAL_BINARIES),input_count=268,all_actual_files_verified=True)

def checked_provenance(root,finalized):
    root=Path(root);current=verify_artifacts(root)
    before=json.loads((root/'provenance-before.json').read_text())
    P.require(before==current,'before-measurement provenance mismatch')
    if finalized:
        after=json.loads((root/'provenance-after.json').read_text())
        P.require(after==before,'after-measurement provenance mismatch')
    return current

def score(root,phases,finalized=False):
    root=Path(root);proof=checked_provenance(root,finalized)
    m=json.loads((root/'manifest.json').read_text())
    refs={};hashes={};metadata={};checks={};rows=[];clocks=[]
    for w in P.WORKERS:
        metadata[w]=json.loads((root/f'worker-{w}-metadata.json').read_text())
        if finalized:checks[w]=json.loads((root/f'worker-{w}-checks.json').read_text())
        rows+=read_csv(root/f'worker-{w}.csv');clocks+=read_csv(root/f'empty-timer-{w}.csv')
        for wi in [0,1]:
            for i in set(m['workloads'][wi]['banks']):
                b=(root/f'compressed/w{w}-{wi}-{i}.bin').read_bytes();h=hashlib.sha256(b).hexdigest();key=wi,i
                P.require(key not in hashes or hashes[key]==h,'cross-worker output mismatch');hashes[key]=h;refs[w,wi,i]=len(b)
    rows.sort(key=lambda x:x['seq'])
    result=score_records(m,rows,clocks,metadata,checks,refs,phases,finalized,provenance_verified=True)
    result['artifact_provenance']=proof
    return result
def report(root,result):
    root=Path(root);decision=result.get('decision',{})
    lines=[P.VERSION+' '+result['record_origin'],P.SCOPE,
        f"Rows={result['rows']}; null cells={result['controls']}; failed={result['failed_controls']} (pooled={result['pooled_failed_controls']}, order veto={result['order_veto_failed_controls']}).",
        'All rows retained.100ns bound unchanged; prospective order veto additionally applies. No clock offsets or CPU substitution.',
        'N/F is an attribution response, not a null. F/U is same image/wrapper/stream. Fresh/long/Java/public API qualification is always false.']
    for x in result['control_results']:
        if x['passed']:continue
        description=describe_control(x)
        lines.append(f"FAILED control worker{x['worker']} work{x['work']} {x['name']}: {description['gate_classification']}; pooled={description['pooled_classification']} bound={x['wall']['absolute_bound']:.6f}ns")
        for order,value in x['order'].items():
            lines.append(f"  {order}: mean={value['mean']:.6f}ns CI={value['ci']} bound={value['absolute_bound']:.6f}ns classification={description['order_classifications'][order]}")
    for x in result['treatments']:lines.append(f"worker{x['worker']} work{x['work']} {x['name']} delta_ns={x['wall']['mean']:.6f} CI={x['wall']['ci']} reference_equivalent={x['reference_equivalent']}")
    if decision:lines.append('Decision='+json.dumps(decision,sort_keys=True))
    (root/'REPORT.txt').write_text('\n'.join(lines)+'\n')
def export(root):
    root=Path(root);files={}
    if not root.exists():print('No saved mechanism evidence.');return
    for p in sorted(root.rglob('*')):
        if not p.is_file():continue
        rel=p.relative_to(root)
        if rel.parts[0] in ['build','baseline','candidate','verify','inputs','compressed'] or rel.suffix=='.bin' or str(rel).startswith('untimed-'):continue
        b=p.read_bytes();files[str(rel)]=dict(bytes=len(b),sha256=hashlib.sha256(b).hexdigest(),base64=base64.b64encode(b).decode())
    b=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0);encoded=base64.b64encode(b).decode()
    if len(encoded)>4000000:print('MECHANISM_EXPORT_OVERSIZE_FULL_ARTIFACT_ONLY',len(encoded))
    else:
        print('MECHANISM_BEGIN',len(encoded),len(b),hashlib.sha256(b).hexdigest())
        for i in range(0,len(encoded),1000):print('MECHANISM_DATA',encoded[i:i+1000])
        print('MECHANISM_END')
    if (root/'REPORT.txt').exists():print((root/'REPORT.txt').read_text())
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--export-local',type=Path,required=True);a=p.parse_args();export(a.export_local)
