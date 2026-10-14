import collections,csv,json,math,statistics

def score(path):
    raw=list(csv.DictReader(open(path)));pairs=collections.defaultdict(dict)
    for row in raw:
        x={k:(v if k=='mode' else int(v)) for k,v in row.items()};pairs[x['block'],x['pair']][x['arm']]=x
    block_delta=collections.defaultdict(list);block_log=collections.defaultdict(list);all_delta=[];outputs=collections.defaultdict(set)
    for (block,pair),arms in pairs.items():
        assert set(arms)=={0,1}
        a,b=arms[0],arms[1];assert a['iterations']==b['iterations']
        d=(b['wall_ns']-a['wall_ns'])/a['iterations'];all_delta.append(d);block_delta[block].append(d);block_log[block].append(math.log(b['wall_ns']/a['wall_ns']))
        for k,x in arms.items():outputs[k].add(x['output_bytes'])
    ds=[statistics.mean(v) for v in block_delta.values()];ls=[statistics.mean(v) for v in block_log.values()];assert len(ds)==6
    # Six independent chronological blocks; no trimming or outlier exclusion.
    t=2.571;mean=statistics.mean(ds);half=t*statistics.stdev(ds)/math.sqrt(6);lm=statistics.mean(ls);lh=t*statistics.stdev(ls)/math.sqrt(6)
    return dict(pairs=len(pairs),mean_B_minus_A_ns=mean,ci95_delta_ns=[mean-half,mean+half],paired_geomean_B_over_A=math.exp(lm),ci95_ratio=[math.exp(lm-lh),math.exp(lm+lh)],block_mean_delta_ns=ds,block_mean_log_ratio=ls,output_bytes={str(k):sorted(v) for k,v in outputs.items()},minor_faults=sum(int(x['minor_faults']) for x in raw),major_faults=sum(int(x['major_faults']) for x in raw),context_switches=sum(int(x['voluntary_ctx'])+int(x['involuntary_ctx']) for x in raw),throttled_periods=sum(int(x['throttled_periods']) for x in raw),throttled_us=sum(int(x['throttled_us']) for x in raw))
