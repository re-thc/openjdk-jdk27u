"""Paired fork-level geometric ratios with deterministic bootstrap intervals."""
import argparse,json,math,random,statistics
from collections import defaultdict
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('raw');p.add_argument('--out');a=p.parse_args()
groups=defaultdict(dict)
for line in open(a.raw):
    row=json.loads(line)
    if row['returncode']==0:
        groups[row['tier'],row['shape'],row['variant']][row['block']]=row
def metrics(row):
    out={}
    for k,v in row['metrics'].items():
        if k in ['link_ns','first_ns','early_ns','main_ns'] and isinstance(v,int):out[k]=v
        if k in ['cpu_ns','wall_ns'] and isinstance(v,list):
            out['steady_'+k]=statistics.median(v)/row['metrics']['count']
    return out
rng=random.Random(20261014);records=[]
lines=['Fork-level medians; speed ratio = base / candidate (above 1 is faster).',
       '95% paired bootstrap intervals use forks as independent observations.',
       '', '| Tier | Shape | Variant | Metric | Forks | Base | Candidate | Ratio [95% CI] |',
       '|---|---|---|---|---:|---:|---:|---:|']
for tier,shape in sorted({k[:2] for k in groups}):
    for variant in sorted({k[2] for k in groups if k[:2]==(tier,shape)}-{'base'}):
        base=groups[tier,shape,'base'];cand=groups[tier,shape,variant]
        blocks=sorted(base.keys()&cand.keys())
        for metric in metrics(base[blocks[0]]):
            pairs=[(metrics(base[b])[metric],metrics(cand[b])[metric]) for b in blocks]
            if not all(x>0 and y>0 for x,y in pairs):continue
            ratios=[math.log(x/y) for x,y in pairs]
            boot=sorted(math.exp(math.fsum(rng.choices(ratios,k=len(ratios)))/len(ratios)) for _ in range(10_000))
            bm=statistics.median(x for x,y in pairs);cm=statistics.median(y for x,y in pairs)
            ratio=math.exp(math.fsum(ratios)/len(ratios));lo=boot[250];hi=boot[9750]
            records.append(dict(tier=tier,shape=shape,variant=variant,metric=metric,n=len(pairs),base=bm,candidate=cm,ratio=ratio,lo=lo,hi=hi))
            unit='ns/call' if metric.startswith('steady_') else 'ms'
            scale=1 if unit=='ns/call' else 1e6
            lines.append(f'| {tier} | {shape} | {variant} | {metric} ({unit}) | {len(pairs)} | {bm/scale:.3f} | {cm/scale:.3f} | {ratio:.3f} [{lo:.3f}, {hi:.3f}] |')
text='\n'.join(lines)+'\n'
if a.out:
    Path(a.out).write_text(text)
    Path(a.out+'.json').write_text(json.dumps(records,indent=2)+'\n')
else:print(text)
