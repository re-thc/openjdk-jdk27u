"""Score all fixed samples; canonical comparisons stay separate by layout."""
import collections,csv,json,math,statistics,sys
from pathlib import Path

def score(raw_path,manifest):
    cells={x['id']:x for x in manifest['cells']};groups=collections.defaultdict(dict)
    for r in csv.DictReader(Path(raw_path).open()):
        x={k:(v if k=='phase' else int(v)) for k,v in r.items()}
        key=(x['layout'],x['phase'],x['cell'],x['block'],x['pair'])
        assert x['arm'] not in groups[key];groups[key][x['arm']]=x
    assert len(groups)==86640
    aggregate=collections.defaultdict(list)
    for (layout,phase,cell,block,pair),arms in groups.items():
        assert set(arms)=={0,1};a,b=arms[0],arms[1]
        assert {a['order'],b['order']}=={0,1} and a['iterations']==b['iterations']
        shared=phase.endswith('_shared')
        assert a['role']==0 and b['role']==(0 if shared else 1)
        comparative=phase=='campaign';sign=-1 if comparative and layout else 1
        assert a['iterations']==(cells[cell]['iterations'] if comparative else 128)
        if comparative and cells[cell]['category']=='tree':assert a['checksum']==b['checksum']
        aggregate[layout,phase,cell].append(dict(block=block,pair=pair,
            delta=sign*(b['wall_ns']-a['wall_ns'])/a['iterations'],
            cpu=sign*(b['cpu_ns']-a['cpu_ns'])/a['iterations'],
            lr=sign*math.log(b['wall_ns']/a['wall_ns']),arms=arms))
    results=[]
    for (layout,phase,cell),pairs in sorted(aggregate.items()):
        aa=phase!='campaign';blocks=12 if aa else 6;per_block=20 if aa else 10;t=2.201 if aa else 2.571
        assert len(pairs)==blocks*per_block
        means=[];logs=[];cpus=[]
        for block in range(blocks):
            p=[x for x in pairs if x['block']==block];assert len(p)==per_block and {x['pair'] for x in p}==set(range(per_block))
            means.append(statistics.mean(x['delta'] for x in p));logs.append(statistics.mean(x['lr'] for x in p));cpus.append(statistics.mean(x['cpu'] for x in p))
        mean=statistics.mean(means);half=t*statistics.stdev(means)/math.sqrt(blocks);lm=statistics.mean(logs);lh=t*statistics.stdev(logs)/math.sqrt(blocks)
        item=dict(layout=layout,phase=phase,cell=cell,pairs=len(pairs),mean_delta_ns=mean,ci95_delta_ns=[mean-half,mean+half],absolute_bound_ns=abs(mean)+half,
            ratio=math.exp(lm),ci95_ratio=[math.exp(lm-lh),math.exp(lm+lh)],cpu_mean_delta_ns=statistics.mean(cpus),block_means_ns=means,
            order_mean_delta_ns={str(order):statistics.mean(p['delta'] for p in pairs if p['arms'][1]['order']==order) for order in [0,1]},
            output_bytes={str(arm):sorted({p['arms'][arm]['output_bytes'] for p in pairs}) for arm in [0,1]},
            counters={str(arm):{k:sum(p['arms'][arm][k] for p in pairs) for k in ['voluntary_ctx','involuntary_ctx','minor_faults','major_faults','throttled_periods','throttled_us']} for arm in [0,1]})
        if aa:item.update(mode=['reset','reuse','create'][cell],passed=item['absolute_bound_ns']<=100)
        else:item.update(cells[cell])
        results.append(item)
    assert len(results)==1372
    brackets=[x for x in results if x['phase']!='campaign'];assert len(brackets)==24
    all_aa=all(x['passed'] for x in brackets)
    screens={}
    for v in ['v1','v2','v3']:
        tiny=[x for x in results if x['phase']=='campaign' and x['reference']==v and x['comparator']=='stock']
        ordinary=[x for x in results if x['phase']=='campaign' and x['reference']=='baseline' and x['comparator']==v and x['category']=='ordinary']
        trees=[x for x in results if x['phase']=='campaign' and x['reference']=='baseline' and x['comparator']==v and x['category']=='tree']
        assert len(tiny)==28 and len(ordinary)==96 and len(trees)==256
        screens[v]=dict(all_brackets_passed=all_aa,tiny_parity_all_layouts=all(x['ci95_delta_ns'][0]>=-100 for x in tiny),ordinary_long_guard_all_layouts=all(x['ci95_ratio'][1]<=1.01 for x in ordinary),
            tiny_failing=[dict(layout=x['layout'],payload=x['payload_name'],mode=x['mode'],ci=x['ci95_delta_ns']) for x in tiny if x['ci95_delta_ns'][0]<-100],
            ordinary_unresolved_or_regressing=[dict(layout=x['layout'],payload=x['payload_name'],level=x['level'],mode=x['mode'],ratio=x['ratio'],ci=x['ci95_ratio']) for x in ordinary if x['ci95_ratio'][1]>1.01],
            tree_latency_losses=[dict(layout=x['layout'],kind=x['kind'],leaves=x['leaves'],order=x['order'],domain=x['domain'],ratio=x['ratio'],ci=x['ci95_ratio']) for x in trees if x['ci95_ratio'][0]>1])
    return dict(status='COMPLETED_ALL_BRACKETS_PASSED' if all_aa else 'INCONCLUSIVE_BRACKET_FAILED',all_brackets_passed=all_aa,rows=2*len(groups),pairs=len(groups),brackets=brackets,screening=screens,results=results,
        interpretation='Canonical comparator-minus-reference and comparator/reference; layouts remain separate. No offset subtraction. Tiny bound 100 ns, ordinary/long upper ratio 1.01. Unit-tree latency is separate; instruction counts are warnings. Any failed A/A bracket prevents winner qualification. No patched-JDK claim.')

def report(value):
    lines=['# Fixed candidate campaign','',value['status'],'','## A/A brackets','', '| Layout | Phase | Mode | B-A ns | 95% CI ns | Absolute bound ns | Pass |','|---|---|---|---:|---|---:|---|']
    for x in value['brackets']:lines.append(f"| {x['layout']} | {x['phase']} | {x['mode']} | {x['mean_delta_ns']:.2f} | {x['ci95_delta_ns']} | {x['absolute_bound_ns']:.2f} | {x['passed']} |")
    lines+=['','## Original 64-byte level-6 prefixes','', '| Layout | Reference | Comparator | Payload | Mode | Comparator-reference ns (95% CI) | Ratio (95% CI) | Physical A/B bytes |','|---|---|---|---|---|---|---|---|']
    for x in value['results']:
        if x['phase']=='campaign' and x['category']=='core':lines.append(f"| {x['layout']} | {x['reference']} | {x['comparator']} | {x['payload_name']} | {x['mode']} | {x['mean_delta_ns']:.2f} {x['ci95_delta_ns']} | {x['ratio']:.5f} {x['ci95_ratio']} | {x['output_bytes']} |")
    lines+=['','## Fixed screening','', '```json',json.dumps(value['screening'],indent=2),'```','',value['interpretation'],'','Full ordinary/long and all 128 tree input cells per prototype/layout, raw rows, ownership/address records and identities are retained. All samples are included. Prior failed calibration remains failed; this run cannot retroactively qualify it.']
    return '\n'.join(lines)+'\n'

if __name__=='__main__':
    result=score(sys.argv[1],json.loads(Path(sys.argv[2]).read_text()));Path(sys.argv[3]).write_text(json.dumps(result,indent=2)+'\n');Path(sys.argv[3]).with_suffix('.md').write_text(report(result));print(result['status'])
