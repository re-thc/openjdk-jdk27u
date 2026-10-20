#!/usr/bin/env python3
import json, statistics, sys
from pathlib import Path
root=Path(sys.argv[1])
from bench_contract import expected, load
manifest=json.loads((root/'RUN.json').read_text())
phase=manifest['phase']; rounds=manifest['rounds']
labels=manifest.get('labels',['base','candidate','off'])
if set(labels) not in ({'base','candidate','off'},{'base','candidate','old','off'}): raise ValueError('wrong study labels')
if len(labels)!=len(set(labels)): raise ValueError('duplicate study labels')
if phase!='screen' and rounds<5: raise ValueError('qualification requires at least five paired rounds')
groups=['all'] if phase=='qualify' else ['white','lines']
rows={}
expected_files=set()
for repeat in range(rounds):
    for label in labels:
        for group in groups:
            p=root/f'{repeat:02d}-{label}-{group}.json'
            expected_files.add(p.name)
            for key,value in load(p,expected(phase,group)).items():
                target=rows.setdefault(key,{}).setdefault(repeat,{})
                if label in target: raise ValueError(f'duplicate {key}, round {repeat}, {label}')
                target[label]=value
actual_files={p.name for p in root.glob('*.json')} - {'RUN.json','summary.json'}
if actual_files!=expected_files:
    raise ValueError(f'unexpected or missing files: {actual_files ^ expected_files}')
result=[]
for key,runs in sorted(rows.items()):
    if any(set(run)!=set(labels) for run in runs.values()):
        raise ValueError(f'Incomplete {key}')
    stats={label:statistics.median([run[label] for run in runs.values()]) for label in labels}
    speedups=[run['base']/run['candidate'] for run in runs.values()]
    off_speedups=[run['off']/run['candidate'] for run in runs.values()]
    result.append(dict(operation=key[0],workload=key[1],rounds=len(runs),ns=stats,
        paired_speedup=statistics.median(speedups),paired_range=[min(speedups),max(speedups)],
        paired_off_speedup=statistics.median(off_speedups),
        paired_delta_ns=statistics.median([run['candidate']-run['base'] for run in runs.values()]),
        per_round=runs))
    if 'old' in labels:
        old_speedups=[run['old']/run['candidate'] for run in runs.values()]
        result[-1].update(paired_old_speedup=statistics.median(old_speedups),
            paired_old_range=[min(old_speedups),max(old_speedups)],
            paired_candidate_minus_old_ns=statistics.median([run['candidate']-run['old'] for run in runs.values()]))
(root/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
lines=['# '+root.name,'','Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.','','| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |','|---|---|---:|---:|---:|---:|---:|---:|---:|']
for row in result:
    v=row['ns']; lo,hi=row['paired_range']
    lines.append(f"| {row['operation']} | {row['workload']} | {row['rounds']} | {v['base']:.2f} | {v['candidate']:.2f} | {v['off']:.2f} | {row['paired_speedup']:.3f} | {lo:.3f}..{hi:.3f} | {row['paired_off_speedup']:.3f} |")
lines+=['','## Every measured paired loss','']
for row in sorted(result,key=lambda r:r['paired_speedup']):
    if row['paired_speedup'] < 1:
        lines.append(f"- {row['operation']}/{row['workload']}: {row['paired_speedup']:.3f}x, paired candidate delta {row['paired_delta_ns']:+.2f} ns/op.")
if 'old' in labels:
    lines+=['','## Direct comparison with the preserved pre-refinement candidate','','Old/candidate greater than 1 favors the refinement. Every row and every loss remain visible.','','| Operation | Workload | Old ns | Candidate ns | Paired old/candidate | Paired range | Candidate minus old ns |','|---|---|---:|---:|---:|---:|---:|']
    for row in result:
        lo,hi=row['paired_old_range']
        lines.append(f"| {row['operation']} | {row['workload']} | {row['ns']['old']:.2f} | {row['ns']['candidate']:.2f} | {row['paired_old_speedup']:.3f} | {lo:.3f}..{hi:.3f} | {row['paired_candidate_minus_old_ns']:+.2f} |")
    lines+=['','### Every measured loss against the pre-refinement candidate','']
    for row in sorted(result,key=lambda r:r['paired_old_speedup']):
        if row['paired_old_speedup']<1:
            lines.append(f"- {row['operation']}/{row['workload']}: {row['paired_old_speedup']:.3f}x, paired candidate delta {row['paired_candidate_minus_old_ns']:+.2f} ns/op.")
(root/'SUMMARY.md').write_text('\n'.join(lines)+'\n')
print(len(result),'complete rows; losses',sum(r['paired_speedup']<1 for r in result))
for r in sorted(result,key=lambda r:r['paired_speedup'])[:12]:
    print(r['operation'],r['workload'],round(r['paired_speedup'],3),round(r['paired_delta_ns'],2))
print('largest speedups:')
for r in sorted(result,key=lambda r:r['paired_speedup'],reverse=True)[:12]:
    print(r['operation'],r['workload'],round(r['paired_speedup'],3))
