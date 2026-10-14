from pathlib import Path
import csv,json,collections,statistics,math,sys
p=Path(sys.argv[1]);r=list(csv.DictReader(p.open()));g=collections.defaultdict(dict)
for x in r:
 x={k:(v if k=='cell' else int(v)) for k,v in x.items()};g[x['cell'],x['block'],x['pair']][x['arm']]=x
rows=[]
for key,a in g.items():
 assert len(a)==2
 rows.append(dict(cell=key[0],block=key[1],pair=key[2],wall_delta_ns=(a[1]['wall_ns']-a[0]['wall_ns'])/a[0]['iterations'],cpu_delta_ns=(a[1]['cpu_ns']-a[0]['cpu_ns'])/a[0]['iterations'],ratio=a[1]['wall_ns']/a[0]['wall_ns']))
result={'gate_rule':'For both cells: absolute mean of 12 block paired means plus t(11,0.975)=2.201 times their SEM must be <=100 ns; no outlier exclusion. Wall time is primary.','rows':len(r),'pairs':len(rows),'cells':{}}
for cell in ['reset','reuse']:
 v=[x for x in rows if x['cell']==cell];b=collections.defaultdict(list)
 for x in v:b[x['block']].append(x['wall_delta_ns'])
 means=[statistics.mean(x) for x in b.values()];mean=statistics.mean(means);half=2.201*statistics.stdev(means)/math.sqrt(len(means));ratio=[x['ratio'] for x in v]
 result['cells'][cell]=dict(block_paired_means_ns=means,mean_delta_ns=mean,ci95_halfwidth_ns=half,ci95_ns=[mean-half,mean+half],absolute_error_bound_ns=abs(mean)+half,passed=abs(mean)+half<=100,median_pair_delta_ns=statistics.median(x['wall_delta_ns'] for x in v),mean_cpu_delta_ns=statistics.mean(x['cpu_delta_ns'] for x in v),ratio_range=[min(ratio),max(ratio)],ratio_median=statistics.median(ratio),context_switches=sum(int(x['voluntary_ctx'])+int(x['involuntary_ctx']) for x in r if x['cell']==cell),minor_faults=sum(int(x['minor_faults']) for x in r if x['cell']==cell),major_faults=sum(int(x['major_faults']) for x in r if x['cell']==cell),throttled_periods=sum(int(x['throttled_periods']) for x in r if x['cell']==cell),throttled_us=sum(int(x['throttled_us']) for x in r if x['cell']==cell))
result['passed']=all(x['passed'] for x in result['cells'].values());p.with_suffix('.gate.json').write_text(json.dumps(result,indent=2));p.with_suffix('.pairs.json').write_text(json.dumps(rows,indent=2));print(json.dumps(result,indent=2))
