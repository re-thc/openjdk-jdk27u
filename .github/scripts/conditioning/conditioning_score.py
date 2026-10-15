"""Strict null-only scorer. Computes conditioning effects even if legacy gates fail."""
from pathlib import Path
import argparse,base64,collections,csv,hashlib,json,lzma,math,statistics as S
import conditioning_protocol as P
def read_csv(path,delimiter=','):
    with Path(path).open() as f:
      out=[]
      for r in csv.DictReader(f,delimiter=delimiter):
        P.require(None not in r and all(v is not None for v in r.values()),'malformed CSV')
        try:out.append({k:(v if k=='kind' else int(v)) for k,v in r.items()})
        except ValueError as e:raise P.InvalidData('noninteger observation') from e
      return out
def quantile(p,df=63):
    P.require(df==63 and .5<p<1,'fixed df63 quantile')
    def cdf(x):
      theta=math.atan(x/math.sqrt(df));v=theta
      for n in range(2,df,2):v=math.sin(theta)*math.cos(theta)**(n-1)/n+(n-1)*v/n
      return .5+math.exp(math.lgamma((df+1)/2)-.5*math.log(math.pi)-math.lgamma(df/2))*v
    a,b=0.,100.
    for _ in range(100):
      mid=(a+b)/2
      if cdf(mid)<p:a=mid
      else:b=mid
    return (a+b)/2
def interval(v,t):
    P.require(len(v)==64 and all(math.isfinite(x) for x in v),'64 finite block units')
    mean=S.mean(v);half=t*S.stdev(v)/8
    return dict(mean=mean,half=half,ci=[mean-half,mean+half],absolute_bound=abs(mean)+half,blocks=v,observations=64,df=63,critical=t)
def classification(x):
    lo,hi=x['ci'];m=x['mean']
    return ('equivalent_within_100ns' if x['absolute_bound']<=100 else 'interval_entirely_outside_100ns' if lo>100 or hi < -100 else 'point_outside_100ns_with_uncertainty' if abs(m)>100 else 'uncertainty_crosses_100ns')
def score_records(m,rows,events,clocks,metadata,checks,refs,provenance_verified=False):
    P.validate_manifest(m);origin=m['record_origin'];P.require(origin!='PLAN_ONLY_NOT_MEASURED','plan is not evidence')
    P.require(origin!='NATIVE_MEASUREMENT' or provenance_verified,'native provenance missing')
    eps,plan,commands=P.plans();P.require(len(rows)==P.MAX_ROWS and len(events)==P.MAX_COMMANDS,'missing/extra rows or commands')
    P.require(set(metadata)==set(P.WORKERS) and set(checks)==set(P.WORKERS),'worker proofs missing')
    works=m['workloads'];sums={}
    for w in P.WORKERS:
      x=metadata[w];P.require(x['protocol']==P.VERSION and x['worker']==w and x['image']=='unchanged-N','worker/image identity')
      P.require(x['sizeof_stream']==112 and x['allocator_trace'] is False and x['before_checks']==264,'layout/allocation/correctness')
      P.require(x['timer_layout']=='CPU0,MONO0,operations,MONO1,CPU1','timer placement')
      P.require(x['mono_resolution_ns']>0 and x['cpu_resolution_ns']>0,'clock resolution')
      for key in ['stream','state','output','def_entry','reset_entry']:P.require(isinstance(x[key],int) and x[key]>0,'missing address')
      P.require(x['stream']%64==x['state']%64==0,'stream/state alignment')
      proof=checks[w];P.require(proof==dict(worker=w,before_checks=264,after_checks=264,all_outputs_equal=True,batches=2048,resets=512,prefixes=512),'final correctness/counts')
      for wi in [0,1]:sums[w,wi]=sum(refs[w,i] for i in works[wi]['banks'])
    last_end=0;event_map={}
    for e,c in zip(events,commands):
      P.require(all(e[k]==c[k] for k in ['command','worker','opcode','episode']),'command schedule mismatch')
      ep=eps[e['episode']];w=e['worker'];meta=metadata[w];work=ep['work']^(e['opcode']==1);ops=0 if e['opcode']==0 else 3072 if e['opcode']==1 else 512
      P.require(e['work']==work and e['operations']==ops,'predecessor/target recipe')
      P.require(e['output_sum']==sums[w,work]*(ops//256),'command length accounting')
      P.require(e['begin_ns']>=last_end and e['end_ns']>e['begin_ns'],'command overlap/order');last_end=e['end_ns']
      P.require(e['cpu_end_ns']>e['cpu_begin_ns'],'command CPU interval')
      P.require(e['cpu_before']==e['cpu_after']==meta['cpu_pin'],'CPU affinity changed')
      for key in ['stream','state','output','def_entry','reset_entry']:P.require(e[key]==meta[key],'event image/stream changed')
      event_map[e['command']]=e
    grouped=collections.defaultdict(list);resources=collections.Counter()
    row_commands={c['row']:c['command'] for c in commands if c['opcode']==2}
    for r,p in zip(rows,plan):
      P.require(all(r[k]==v for k,v in p.items()),'row plan/label/count mismatch')
      w=r['worker'];meta=metadata[w];P.require(r['command']==row_commands[r['seq']],'row command')
      ev=event_map[r['command']]
      for key in ['stream','state','output','def_entry','reset_entry']:P.require(r[key]==meta[key],'row image/stream changed')
      P.require(r['operations']==512 and r['bank_phase']==r['extra']==0,'fixed ring/operation count')
      P.require(ev['begin_ns']<=r['warm_begin_ns']<r['warm_end_ns']<=r['begin_ns']<r['end_ns']<=ev['end_ns'],'warm/timed bookkeeping placement')
      P.require(r['wall_ns']==r['end_ns']-r['begin_ns'] and r['warm_wall_ns']==r['warm_end_ns']-r['warm_begin_ns'],'wall timestamp interval')
      P.require(r['cpu_ns']==r['cpu_end_ns']-r['cpu_begin_ns']>0 and r['warm_cpu_ns']==r['warm_cpu_end_ns']-r['warm_cpu_begin_ns']>0,'CPU timestamp interval')
      P.require(ev['cpu_begin_ns']<=r['warm_cpu_begin_ns']<r['warm_cpu_end_ns']<=r['cpu_begin_ns']<r['cpu_end_ns']<=ev['cpu_end_ns'],'warm/timed CPU nesting')
      last=works[r['work']]['banks'][-1]
      P.require(r['last_input']==last and r['output_bytes']==refs[w,last] and r['output_sum']==2*sums[w,r['work']] and r['warm_sum']==(r['warm']//256)*sums[w,r['work']],'row output/warm accounting')
      for prefix in ['','w_']:
       for key in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']:
        P.require(r[prefix+key]>=0,'negative resource observation');resources[prefix+key]+=r[prefix+key]
      grouped[r['episode']].append(r)
    P.require(len(clocks)==3*P.MAX_EPISODES,'clock observation count');seen=set();clock_groups=collections.defaultdict(list)
    for c in clocks:
      ep=eps[c['episode']];key=c['episode'],c['kind'];P.require(key not in seen,'duplicate clock observation');seen.add(key)
      reset_command=6*c['episode'];ev=event_map[reset_command]
      P.require(c['command']==reset_command and c['worker']==ep['worker'] and c['kind'] in ['mono_pair','legacy_nested','empty_batch'],'clock recipe')
      P.require(c['operations']==(512 if c['kind']=='empty_batch' else 128),'clock operations')
      P.require(ev['begin_ns']<=c['begin_ns']<c['end_ns']<=ev['end_ns'],'clock must precede fixed companion')
      P.require(c['outer_wall_ns']==c['end_ns']-c['begin_ns'] and 0<=c['wall_ns']<=c['outer_wall_ns'] and c['cpu_ns']>0,'clock interval')
      clock_groups[c['episode']].append(c)
    P.require(seen=={(e['episode'],k) for e in eps for k in ['mono_pair','legacy_nested','empty_batch']},'clock keys')
    for e in eps:
      cs=clock_groups[e['episode']]
      P.require([c['kind'] for c in cs]==['mono_pair','legacy_nested','empty_batch'] and all(a['end_ns']<=b['begin_ns'] for a,b in zip(cs,cs[1:])),'clock type order')
    deltas={};positions={}
    for episode,rs in grouped.items():
      P.require([r['position'] for r in rs]==[0,1,2,3],'quartet completeness')
      e=eps[episode];key=e['worker'],e['block'],e['work'],e['condition'],e['order']
      P.require([r['label'] for r in rs]==([0,1,1,0] if e['order']==0 else [1,0,0,1]),'quartet orientation')
      deltas[key]={metric:S.mean(r[metric]/512 for r in rs if r['label']==0)-S.mean(r[metric]/512 for r in rs if r['label']==1) for metric in ['wall_ns','cpu_ns']}
      positions[key]=[r['wall_ns']/512 for r in rs]
    controls=[];effects=[];critical=quantile(1-.05/(2*P.FAMILY))
    for worker in P.WORKERS:
      for work in [0,1]:
        components={}
        for condition in [0,1]:
          orders={order:[deltas[worker,b,work,condition,order]['wall_ns'] for b in range(64)] for order in [0,1]}
          pooled=[(a+b)/2 for a,b in zip(orders[0],orders[1])];bias=[(a-b)/2 for a,b in zip(orders[0],orders[1])];components[condition]=bias
          wall=interval(pooled,P.CAL_T);order_intervals={name:interval(orders[order],P.CAL_T) for name,order in [('ABBA',0),('BAAB',1)]}
          pg=wall['absolute_bound']<=100;og=all(x['absolute_bound']<=100 for x in order_intervals.values())
          controls.append(dict(worker=worker,work=work,condition=condition,warm=P.WARM[condition],wall=wall,order=order_intervals,pooled_gate_passed=pg,order_gate_passed=og,passed=pg and og,
            pooled_classification=classification(wall),order_classifications={k:classification(v) for k,v in order_intervals.items()},
            gate_classification='equivalence_established_all_required_strata' if pg and og else 'equivalence_not_established_by_order_bound' if pg else 'equivalence_not_established_by_pooled_bound',
            order_component=interval(bias,critical),position_means={name:[S.mean(positions[worker,b,work,condition,order][p] for b in range(64)) for p in range(4)] for name,order in [('ABBA',0),('BAAB',1)]}))
        reduction=interval([a-b for a,b in zip(components[0],components[1])],critical);short=interval(components[0],critical);long=interval(components[1],critical)
        evidence=reduction['ci'][0]>0 and short['ci'][0]>0;small=long['ci'][0]>=-25 and long['ci'][1]<=25
        effects.append(dict(worker=worker,work=work,short_order_component=short,long_order_component=long,paired_reduction=reduction,
          reduction_supported=evidence,residual_equivalent_within_25ns=small,diagnostic_support=evidence and small,
          interpretation='conditioning reduces the signed order component and residual is within the prespecified diagnostic margin' if evidence and small else 'reduction supported; residual precision/size remains unresolved' if evidence else 'conditioning reduction not established'))
    return dict(protocol=P.VERSION,record_origin=origin,rows=len(rows),commands=len(events),episodes=len(eps),diagnosis_complete=True,
      controls=controls,failed_legacy_controls=sum(not x['passed'] for x in controls),all_rows_retained=True,resources=dict(resources),
      conditioning_effects=effects,simultaneous_family=48,critical=critical,df=63,diagnostic_support_count=sum(x['diagnostic_support'] for x in effects),
      analysis_independent_of_100ns_gate=True,backend_performance_qualified=False,public_api_qualified=False,scope=P.SCOPE,
      assumptions='Student intervals use64 block contrasts; independence/symmetry are assumptions, not established by this fixed one-host schedule. All vectors are retained. No nonsignificance-is-removal claim.')

def inventory(root):
    root=Path(root).resolve();m=json.loads((root/'manifest.json').read_text());P.validate_manifest(m,root)
    frozen=json.loads((root/'preregistered.json').read_text());P.require(frozen['manifest_sha256']==P.sha(root/'manifest.json'),'manifest changed')
    source_names={'source/'+x for x in [*P.SOURCE_NAMES,'tiny-zlib-conditioning.yml']}|{'legacy-source/'+x for x in ['reset-study.c','reset-study.py','reset-score.py','reset_protocol.py','test_reset_mechanism.py','reset-invariants.c','backend-reset.patch','source-pins.json','tiny-zlib-mechanism.yml']}
    P.require(set(frozen['sources'])==source_names and frozen['frozen_before_conditioning_build'] is True,'complete preregistered source set required')
    for rel,h in frozen['sources'].items():P.require(P.sha(root/rel)==h,'frozen source changed')
    prior=json.loads((root/'preparation/preregistered.json').read_text())
    P.require(prior['frozen_before_measurement'] is True and set(prior['files'])=={Path(x).name for x in source_names if x.startswith('legacy-source/')},'legacy preregistration missing')
    for name,h in prior['files'].items():P.require(P.sha(root/'legacy-source'/name)==h,'legacy build source changed')
    P.require(P.sha(root/'legacy-source/backend-reset.patch')==P.PATCH and P.sha(root/'legacy-source/source-pins.json')==P.PINS,'backend/pins changed')
    ids=json.loads((root/'identities.json').read_text());actual={str(p.relative_to(root)):p for top in ['source','legacy-source','inputs','build'] for p in (root/top).rglob('*') if p.is_file()}
    required={'build/'+x for x in ['conditioning-driver','conditioning-driver-asan','reset-study','reset-check','reset-invariants','reset-invariants-asan','stock/libz.a','S/reset-control.o','V/reset-control.o']}
    required|={'build/'+variant+'/'+name for variant in ['N','S','V','NM','VM','NA','VA'] for name in ['ng.so','libz.a']}
    P.require(set(ids)==set(actual) and required<=set(ids),'source/input/binary inventory missing')
    P.require({x for x in actual if x.startswith(('source/','legacy-source/'))}==source_names,'unexpected source inventory')
    for rel,p in actual.items():P.require(not p.is_symlink() and ids[rel]==dict(bytes=p.stat().st_size,sha256=P.sha(p)),'binary/input/source identity changed')
    launch=json.loads((root/'launch.json').read_text());expected=[str(root/'build/conditioning-driver'),str(root/'build/N/ng.so'),str(root/'inputs.tsv'),str(root/'workloads.tsv'),str(root/'episodes.tsv'),str(root/'commands.tsv'),str(root)]
    P.require(launch['basecmd']==expected,'only unchanged N driver may launch')
    P.require((root/'inputs.tsv').read_text()==''.join(f"{x['id']}\t{x['path']}\n" for x in m['inputs']),'input index')
    P.require((root/'workloads.tsv').read_text()==''.join(f"{w['id']}\t"+','.join(map(str,w['banks']))+'\n' for w in m['workloads']),'workload index')
    publication=json.loads((root/'approved-publication.json').read_text())
    P.require(publication['repository']=='re-thc/openjdk-jdk27u' and publication['tag']=='diagnostic-tiny-zlib-conditioning-20261015-once' and publication['attempt']==1,'publication guard receipt')
    return dict(manifest=P.sha(root/'manifest.json'),preregistered=P.sha(root/'preregistered.json'),legacy_preregistered=P.sha(root/'preparation/preregistered.json'),identities=P.sha(root/'identities.json'),launch=P.sha(root/'launch.json'),inputs=P.sha(root/'inputs.tsv'),workloads=P.sha(root/'workloads.tsv'),publication=P.sha(root/'approved-publication.json'),environment=P.sha(root/'environment.json'),legacy_build_commands=P.sha(root/'build-commands.json'),conditioning_build_commands=P.sha(root/'conditioning-build-commands.json'),all_actual_files_verified=True)
def observed_order(worker,rows,events,clocks):
    eps,plan,commands=P.plans()
    P.require([x['seq'] for x in rows]==[x['seq'] for x in plan if x['worker']==worker],'observed worker row order')
    P.require([x['command'] for x in events]==[x['command'] for x in commands if x['worker']==worker],'observed worker event order')
    P.require([(x['episode'],x['kind']) for x in clocks]==[(x['episode'],k) for x in eps if x['worker']==worker for k in ['mono_pair','legacy_nested','empty_batch']],'observed worker clock order')
def score(root):
    root=Path(root);proof=inventory(root)
    P.require(json.loads((root/'provenance-before.json').read_text())==proof==json.loads((root/'provenance-after.json').read_text()),'before/after provenance changed')
    m=json.loads((root/'manifest.json').read_text());rows=[];events=[];clocks=[];metas={};checks={};refs={};hashes={}
    for w in P.WORKERS:
      wr=read_csv(root/f'worker-{w}.csv');we=read_csv(root/f'events-{w}.csv');wc=read_csv(root/f'clocks-{w}.csv')
      observed_order(w,wr,we,wc)
      rows+=wr;events+=we;clocks+=wc
      metas[w]=json.loads((root/f'worker-{w}-metadata.json').read_text());checks[w]=json.loads((root/f'worker-{w}-checks.json').read_text())
      for i in range(264):
        b=(root/f'compressed/w{w}-{i}.bin').read_bytes();h=hashlib.sha256(b).hexdigest();P.require(i not in hashes or hashes[i]==h,'cross-worker bytes changed');hashes[i]=h;refs[w,i]=len(b)
    rows.sort(key=lambda r:r['seq']);events.sort(key=lambda r:r['command'])
    result=score_records(m,rows,events,clocks,metas,checks,refs,True);result['artifact_provenance']=proof;return result
def report(root,result):
    lines=[P.VERSION+' '+result['record_origin'],P.SCOPE,f"Complete null rows={result['rows']}; failed legacy100ns cells={result['failed_legacy_controls']}. No treatment exists.",
      'Conditioning effects are reported regardless of the legacy gate. Residual25ns is a diagnostic margin, not a replacement gate or backend qualification.']
    for x in result['conditioning_effects']:lines.append(f"worker{x['worker']} size{32 if x['work']==0 else 64}: reduction={x['paired_reduction']['mean']:.6f}ns CI={x['paired_reduction']['ci']}; residual={x['long_order_component']['ci']}; {x['interpretation']}")
    (Path(root)/'REPORT.txt').write_text('\n'.join(lines)+'\n')
def export(root):
    root=Path(root);files={}
    if not root.exists():print('No conditioning evidence.');return
    for p in sorted(root.rglob('*')):
      if not p.is_file():continue
      rel=p.relative_to(root)
      if rel.parts[0] in ['build','baseline','candidate','verify','inputs','compressed'] or rel.suffix=='.bin' or 'untimed' in rel.parts[0]:continue
      b=p.read_bytes();files[str(rel)]=dict(bytes=len(b),sha256=hashlib.sha256(b).hexdigest(),base64=base64.b64encode(b).decode())
    b=lzma.compress(json.dumps(files,separators=(',',':')).encode(),preset=6);encoded=base64.b64encode(b).decode()
    if len(encoded)>6000000:print('CONDITIONING_EXPORT_FULL_ARTIFACT_ONLY',len(encoded))
    else:
      print('CONDITIONING_XZ_BEGIN',len(encoded),len(b),hashlib.sha256(b).hexdigest())
      for i in range(0,len(encoded),1000):print('CONDITIONING_DATA',encoded[i:i+1000])
      print('CONDITIONING_END')
    if (root/'REPORT.txt').exists():print((root/'REPORT.txt').read_text())
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--export-local',type=Path,required=True);a=p.parse_args();export(a.export_local)
