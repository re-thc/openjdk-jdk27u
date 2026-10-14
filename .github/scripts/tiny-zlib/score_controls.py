"""Fixed 100 ns A/A rule; all samples, with state and order diagnostics."""
import collections, csv, json, math, statistics, sys
from pathlib import Path

def interval(values):
    assert len(values) == 12
    mean = statistics.mean(values)
    half = 2.201 * statistics.stdev(values) / math.sqrt(12)
    return dict(block_means_ns=values, mean_delta_ns=mean,
                ci95_ns=[mean-half, mean+half], ci95_halfwidth_ns=half,
                absolute_error_bound_ns=abs(mean)+half, passed=abs(mean)+half<=100)

def score(path, mode):
    raw = [{k:(v if k=='cell' else int(v)) for k,v in row.items()}
           for row in csv.DictReader(Path(path).open())]
    assert len(raw) == 960
    groups = collections.defaultdict(dict)
    for row in raw:
        key=(row['cell'], row['block'], row['pair'])
        assert row['arm'] not in groups[key]
        groups[key][row['arm']]=row
    assert len(groups) == 480
    result=dict(mode=mode, rows=len(raw), pairs=len(groups), cells={},
                gate_rule='For each cell: abs(mean of 12 chronological block paired means)+2.201*SEM <=100 ns; no exclusions; wall time primary.',
                physical_rule='The same bound also describes fixed slot1-minus-slot0 when two states exist. It must be inspected alongside logical-arm results; block reversal can cancel a physical state effect in the logical mean.')
    for cell in ['reset','reuse']:
        block=collections.defaultdict(list); cpu=collections.defaultdict(list)
        physical=collections.defaultdict(list); physical_cpu=collections.defaultdict(list)
        order=collections.defaultdict(list); assignment=collections.defaultdict(list)
        for (c,b,p),arms in groups.items():
            if c != cell: continue
            assert set(arms)=={0,1}
            a,z=arms[0],arms[1]
            assert a['iterations']==z['iterations']==128
            assert {a['order'],z['order']}=={0,1}
            delta=(z['wall_ns']-a['wall_ns'])/128
            dcpu=(z['cpu_ns']-a['cpu_ns'])/128
            block[b].append(delta); cpu[b].append(dcpu)
            order['B_first' if z['order']==0 else 'B_second'].append(delta)
            assignment[f"A_slot{a['slot']}_B_slot{z['slot']}"].append(delta)
            expected_a=0 if mode=='shared-stream' else b%2 if mode=='two-states' else 0
            expected_b=0 if mode=='shared-stream' else 1-b%2 if mode=='two-states' else 1
            assert (a['slot'],z['slot'])==(expected_a,expected_b)
            if mode!='shared-stream':
                sign=1 if a['slot']==0 else -1
                physical[b].append(sign*delta); physical_cpu[b].append(sign*dcpu)
        assert set(block)==set(range(12)) and all(len(v)==20 for v in block.values())
        data=interval([statistics.mean(block[b]) for b in range(12)])
        data['cpu']=interval([statistics.mean(cpu[b]) for b in range(12)])
        data['order_mean_delta_ns']={k:statistics.mean(v) for k,v in order.items()}
        data['assignment_mean_delta_ns']={k:statistics.mean(v) for k,v in assignment.items()}
        data['physical_slot1_minus_slot0']=interval([statistics.mean(physical[b]) for b in range(12)]) if physical else None
        if physical:data['physical_slot1_minus_slot0']['cpu']=interval([statistics.mean(physical_cpu[b]) for b in range(12)])
        data['arms']={}
        for arm in [0,1]:
            rows=[r for r in raw if r['cell']==cell and r['arm']==arm]
            data['arms'][str(arm)]=dict(samples=len(rows),
                mean_wall_ns=statistics.mean(r['wall_ns']/128 for r in rows),
                mean_cpu_ns=statistics.mean(r['cpu_ns']/128 for r in rows),
                maximum_batch_wall_ns=max(r['wall_ns'] for r in rows),
                output_bytes=sorted({r['output_bytes'] for r in rows}),
                **{k:sum(r[k] for r in rows) for k in ['voluntary_ctx','involuntary_ctx','minor_faults','major_faults','throttled_periods','throttled_us']})
        result['cells'][cell]=data
    result['passed']=all(c['passed'] for c in result['cells'].values())
    result['physical_states_within_100ns']=all(c['physical_slot1_minus_slot0']['passed'] for c in result['cells'].values()) if mode!='shared-stream' else None
    return result

if __name__=='__main__':
    value=score(sys.argv[1],sys.argv[2])
    Path(sys.argv[1]).with_suffix('.gate.json').write_text(json.dumps(value,indent=2)+'\n')
    print(json.dumps(value,indent=2))
