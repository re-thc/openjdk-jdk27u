"""Size facts are unconditional; all latency stays gated and uncertainty is kept."""
from pathlib import Path
import argparse,collections,csv,hashlib,json,math,statistics
a=argparse.ArgumentParser();a.add_argument('--out',type=Path,default=Path(__file__).resolve().parent);a.add_argument('--sizes-only',action='store_true');args=a.parse_args();OUT=args.out.resolve();E=OUT/'evidence';m=json.loads((OUT/'manifest.json').read_text());inputs={x['id']:x for x in m['inputs']};cells={x['id']:x for x in m['cells']}
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2)+'\n')
sizes=[];lookup={}
for row in csv.DictReader((E/'sizes.csv').open()):
    x={**row,'input':int(row['input']),'level':int(row['level']),'bytes':int(row['bytes'])};data=Path(x['path']).read_bytes();assert len(data)==x['bytes'];x['sha256']=hashlib.sha256(data).hexdigest();lookup[x['input'],x['format'],x['library'],x['level']]=x;sizes.append(x)
assert len(sizes)==1512
for x in sizes:
    inp=inputs[x['input']];stock=lookup[x['input'],x['format'],'stock',6]['bytes'];ng=lookup[x['input'],x['format'],'ng',6]['bytes'];x.update(corpus=inp['corpus'],input_bytes=inp['size'],input_sha256=inp['sha256'],delta_stock6_bytes=x['bytes']-stock,ratio_stock6=x['bytes']/stock,delta_ng6_bytes=x['bytes']-ng,ratio_ng6=x['bytes']/ng)
wrapper=[]
for x in sizes:
    if x['format']!='wrapped':continue
    raw=lookup[x['input'],'raw',x['library'],x['level']];w=Path(x['path']).read_bytes();r=Path(raw['path']).read_bytes();wrapper.append(dict(input=x['input'],library=x['library'],level=x['level'],wrapper_bytes=x['bytes']-raw['bytes'],same_deflate_payload=w[2:-4]==r))
dump(E/'size-results.json',sizes);dump(E/'wrapper-accounting.json',wrapper)
with (E/'size-results.csv').open('w') as f:
    keys=['corpus','input_bytes','format','library','level','bytes','delta_stock6_bytes','ratio_stock6','delta_ng6_bytes','ratio_ng6','input_sha256','sha256'];w=csv.DictWriter(f,keys,extrasaction='ignore');w.writeheader();w.writerows(sizes)
timing=[];all_aa=False
if not args.sizes_only and (E/'timing.csv').exists():
    groups=collections.defaultdict(dict)
    for r in csv.DictReader((E/'timing.csv').open()):
        x={k:int(v) for k,v in r.items()};key=(x['cell'],x['block'],x['pair']);assert x['arm'] not in groups[key];groups[key][x['arm']]=x
    assert len(groups)==171504
    data=collections.defaultdict(list)
    for (cell,block,pair),arms in groups.items():
        assert set(arms)=={0,1};aa,bb=arms[0],arms[1];c=cells[cell];assert {aa['order'],bb['order']}=={0,1};assert aa['iterations']==bb['iterations']==c['iterations']
        d=(bb['wall_ns']-aa['wall_ns'])/c['iterations'];cpu=(bb['cpu_ns']-aa['cpu_ns'])/c['iterations'];sign=1 if aa['slot']==0 else -1
        data[cell].append(dict(block=block,pair=pair,delta=d,cpu=cpu,physical=sign*d,lr=math.log(bb['wall_ns']/aa['wall_ns']),a=aa,b=bb))
    for cell,pairs in sorted(data.items()):
        c=cells[cell];nb=c['blocks'];np=c['pairs'];t=2.201 if c['category'] else 2.571;assert len(pairs)==nb*np
        def bounds(key):
            b=[statistics.mean(p[key] for p in pairs if p['block']==i) for i in range(nb)];assert all(sum(p['block']==i for p in pairs)==np for i in range(nb));v=statistics.mean(b);h=t*statistics.stdev(b)/math.sqrt(nb);return dict(mean=v,ci95=[v-h,v+h],absolute_bound=abs(v)+h,blocks=b)
        delta=bounds('delta');physical=bounds('physical') if c['category'] and c['control']==1 else None;lr=bounds('lr')
        item=dict(**c,delta_ns=delta,cpu_delta_ns=bounds('cpu'),physical_slot1_minus_slot0_ns=physical,ratio=math.exp(lr['mean']),ratio_ci95=list(map(math.exp,lr['ci95'])),arm_means_ns={k:statistics.mean(p[k]['wall_ns']/c['iterations'] for p in pairs) for k in ['a','b']},order_mean_delta_ns={str(o):statistics.mean(p['delta'] for p in pairs if p['b']['order']==o) for o in [0,1]},counters={k:{name:sum(p[k][name] for p in pairs) for name in ['voluntary_ctx','involuntary_ctx','minor_faults','major_faults','throttled_periods','throttled_us']} for k in ['a','b']})
        if c['category']:item['passed']=delta['absolute_bound']<=100 and (physical is None or physical['absolute_bound']<=100)
        timing.append(item)
    assert len(timing)==4356;aa=[x for x in timing if x['category']];assert len(aa)==72;all_aa=all(x['passed'] for x in aa)
    dump(E/'timing-results.json',dict(qualified=all_aa,criterion=m['criterion'],results=timing))
by_case={(x['input'],x['format'],x['mode'],x['label']):x for x in timing if not x['category']}
pareto=[]
for inp in m['inputs']:
    for fmt in ['wrapped','raw']:
        for mode in ['reuse','create']:
            choices=[]
            for level in range(1,7):
                x=lookup[inp['id'],fmt,'ng',level];t=by_case.get((inp['id'],fmt,mode,'stock6-v-ng'+str(level)));n=by_case.get((inp['id'],fmt,mode,'ng6-v-ng'+str(level)))
                choices.append(dict(level=level,bytes=x['bytes'],delta_stock6_bytes=x['delta_stock6_bytes'],delta_ng6_bytes=x['delta_ng6_bytes'],ratio_stock6=x['ratio_stock6'],ratio_ng6=x['ratio_ng6'],observed_mean_ns=t['arm_means_ns']['b'] if t else None,stock6_latency_delta_ns=t['delta_ns'] if t else None,ng6_latency_delta_ns=n['delta_ns'] if n else {'mean':0,'ci95':[0,0]},qualified_faster_than_ng6=bool(all_aa and n and n['delta_ns']['ci95'][1]<-100)))
            frontier=[x['level'] for x in choices if x['observed_mean_ns'] is not None and not any(y['bytes']<=x['bytes'] and y['observed_mean_ns']<=x['observed_mean_ns'] and (y['bytes']<x['bytes'] or y['observed_mean_ns']<x['observed_mean_ns']) for y in choices)]
            pareto.append(dict(corpus=inp['corpus'],size=inp['size'],format=fmt,mode=mode,timing_qualified=all_aa,choices=choices,exploratory_point_pareto=frontier,qualified_fastest=None,ranking_note='Mean Pareto is descriptive. No direct pairwise lower-level contrasts; overlapping or unpaired rankings and crossover can remain unknown. Failed A/A forbids a fastest-policy recommendation.'))
dump(E/'pareto-by-corpus-size.json',pareto)

requested=[]
for inp in m['inputs']:
    for fmt in ['wrapped','raw']:
        stock=lookup[inp['id'],fmt,'stock',1];ng=lookup[inp['id'],fmt,'ng',2];quick=lookup[inp['id'],fmt,'ng',1]
        requested.append(dict(corpus=inp['corpus'],size=inp['size'],format=fmt,requested_level=1,stock_physical_level=1,ng_physical_level=2,stock_bytes=stock['bytes'],ng_bytes=ng['bytes'],delta_bytes=ng['bytes']-stock['bytes'],ratio=ng['bytes']/stock['bytes'],native_ng1_bytes=quick['bytes'],native_ng1_extra_vs_current_ng2=quick['bytes']-ng['bytes'],note='Current Java request1 mapping; distinct from stock6 comparisons and prospective requested6 policies.'))
dump(E/'current-Java-requested1.json',requested)

lines=['# Whole-input level tradeoffs','',f"Timing qualification: {'ALL A/A PASSED' if all_aa else 'UNQUALIFIED / NOT AVAILABLE'}",'', 'Stock1–6 and ng physical1–6 are explicit, unchanged. Current Java requested1 uses ng2; this is distinct from prospective requested6 reductions. Every input is complete before FINISH. No default or requested-level semantics were changed.','','## Verified size facts','',f'{len(sizes)} compressed configurations; each stock/ng output inflated by pinned stock. A second unmodified ng namespace also round-trips and matches ng bytes:2268 untimed round trips. All input/output hashes and byte differences/ratios are in size-results.csv/json.','',f"Wrapper overhead values: {sorted({x['wrapper_bytes'] for x in wrapper})} bytes; raw payload identical to wrapped[2:-4] in {sum(x['same_deflate_payload'] for x in wrapper)}/{len(wrapper)} cases.",'','Worst and best byte differences below are actual bytes versus stock6 across nine fixed corpora; they are not timing or an accepted policy.','','| Input B | ng1 delta B | ng2 delta B | ng3 delta B | ng4 delta B | ng5 delta B | ng6 delta B |','|---|---|---|---|---|---|---|']
for n in [32,64,128,256,512,1024,4096]:
    values=[]
    for level in range(1,7):
        v=[x['delta_stock6_bytes'] for x in sizes if x['library']=='ng' and x['level']==level and x['input_bytes']==n and x['format']=='wrapped'];values.append(f'{min(v):+d} to {max(v):+d}')
    lines.append('| '+str(n)+' | '+' | '.join(values)+' |')
lines+=['','## Timing and uncertainty','',m['criterion'],'',m['samples'],'']
if timing:
    failed=[x for x in timing if x['category'] and not x['passed']];lines.append(f"{len(failed)} of72 A/A cells failed. Every row remains included. No offset was subtracted and no run was repeated.")
    lines+=['','| Phase | Control | Input | Format | Mode | Mean B-A ns | Absolute bound ns | Physical bound ns |','|---|---|---|---|---|---:|---:|---:|']
    for x in failed[:24]:
        inp=inputs[x['input']];p=x['physical_slot1_minus_slot0_ns'];lines.append(f"| {x['category']} | {x['label']} | {inp['corpus']}-{inp['size']} | {x['format']} | {x['mode']} | {x['delta_ns']['mean']:.2f} | {x['delta_ns']['absolute_bound']:.2f} | {p['absolute_bound'] if p else ''} |")
lines+=['','Full Pareto-style choices, byte sacrifices versus stock6 AND ng6, pairwise latency intervals, variability and unresolved rankings are in pareto-by-corpus-size.json. Raw/wrapped, reuse/create, primary stock6 contrasts, equal-level contrasts, ng6-relative contrasts and current requested1 behavior stay separate. No algorithmic or cost monotonicity is assumed.','', ('No narrow level policy is recommended from unqualified local timing.' if not all_aa else 'No default was selected; inspect paired effects and counterexamples before choosing a policy.')+' Output-size equality on a few nearly incompressible64B prefixes cannot establish a general size threshold. Size counterexamples and fixed wrapper overhead remain valid even if timing fails. This is native evidence, not a Java/JNI speed qualification.']
(E/'REPORT.md').write_text('\n'.join(lines)+'\n');print('\n'.join(lines[:23]));print('SIZE_AND_TIMING_ANALYSIS_SAVED',len(sizes),len(timing),'AA_passed',all_aa)
