"""Read saved evidence only; all uncertainty uses12 chronological blocks."""
from pathlib import Path
import argparse,base64,collections,csv,gzip,hashlib,json,math,statistics

N=128
def dump(path,value):Path(path).write_text(json.dumps(value,indent=2)+'\n')
def digest(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def bounds(blocks,critical):
    assert len(blocks)==12
    mean=statistics.mean(blocks);half=critical*statistics.stdev(blocks)/math.sqrt(12)
    return dict(mean=mean,ci=[mean-half,mean+half],absolute_bound=abs(mean)+half,blocks=blocks,observations=12,df=11,critical=critical)
def t11_cdf(t):
    # For df11, substitution t=sqrt(11)*tan(theta) integrates cos(theta)^10.
    sign=1 if t>=0 else -1;theta=math.atan(abs(t)/math.sqrt(11));integral=theta
    for n in range(2,11,2):integral=math.sin(theta)*math.cos(theta)**(n-1)/n+(n-1)*integral/n
    constant=math.exp(math.lgamma(6)-.5*math.log(math.pi)-math.lgamma(5.5))
    return .5+sign*constant*integral
def t11_quantile(p):
    assert .5<p<1
    lo,hi=0.,100.
    for _ in range(100):
        mid=(lo+hi)/2
        if t11_cdf(mid)<p:lo=mid
        else:hi=mid
    return (lo+hi)/2

def sizes(root):
    root=Path(root);manifest=json.loads((root/'manifest.json').read_text());lookup={};allrows=[]
    for path in sorted(root.glob('sizes-w*-*.csv')):
        for raw in csv.DictReader(path.open()):
            row={k:(v if k in ['phase','path'] else int(v)) for k,v in raw.items()}
            data=Path(row['path']).read_bytes();assert len(data)==row['bytes']
            row['sha256']=hashlib.sha256(data).hexdigest();row['input_sha256']=manifest['families'][row['family']]['banks'][row['bank']]['sha256']
            key=(row['family'],row['bank'],row['level'])
            identity=(row['bytes'],row['sha256'])
            if key in lookup:assert lookup[key]==identity
            lookup[key]=identity;allrows.append(row)
    assert len(lookup)==264
    deltas=[]
    for family in manifest['families']:
        for bank in family['banks']:
            a=lookup[family['id'],bank['id'],1][0];b=lookup[family['id'],bank['id'],6][0]
            deltas.append(dict(family=family['id'],bank=bank['id'],ng1=a,ng6=b,delta_bytes=a-b,ratio=a/b,input_sha256=bank['sha256']))
    return dict(outputs=allrows,payloads=deltas,passed=all(x['delta_bytes']<=8 for x in deltas),maximum_delta_bytes=max(x['delta_bytes'] for x in deltas))

def score(root,phases):
    root=Path(root);manifest=json.loads((root/'manifest.json').read_text())
    plans=[{k:int(v) for k,v in row.items()} for row in csv.DictReader((root/'schedule.tsv').open(),delimiter='\t')]
    assert len(plans)==30720 and [x['seq'] for x in plans]==list(range(30720))
    planned={x['seq']:x for x in plans};selected=[];addresses={}
    size=sizes(root);size_lookup={(x['family'],x['bank'],x['level']):x['bytes'] for x in size['outputs']}
    for worker in [0,1]:
        prior=6 if worker==0 else 1;seen=[];states=set();streams=set();outputs=set();bases=set()
        for raw in csv.DictReader((root/f'worker-{worker}.csv').open()):
            row={k:int(v) for k,v in raw.items()};plan=planned[row['seq']]
            assert all(row[k]==v for k,v in plan.items()) and row['worker']==worker
            assert row['previous']==prior and row['switched']==int(prior!=row['level']);prior=row['level']
            assert row['wall_ns']==row['wall_end_ns']-row['wall_start_ns'] and row['wall_ns']>0 and row['cpu_ns']>0
            count=len(manifest['families'][row['family']]['banks']);offset=row['offset']
            assert [row['warm'+str(j)] for j in range(8)]==[(offset-8+j)%count for j in range(8)]
            want=sum(size_lookup[row['family'],(offset+k)%count,row['level']] for k in range(128))
            assert row['total_bytes']==want
            last=(offset+127)%count;assert row['last_bank']==last and row['output_bytes']==size_lookup[row['family'],last,row['level']]
            assert row['state'] and row['stream'] and row['output'] and row['input_first']
            states.add(row['state']);streams.add(row['stream']);outputs.add(row['output']);bases.add(row['input_first']-64*offset-row['family']*32*64)
            seen.append(row['seq'])
            if row['phase'] in phases:selected.append(row)
        assert len(seen)==len(set(seen)) and seen==sorted(seen)
        expected=[x['seq'] for x in plans if x['worker']==worker and x['phase'] in phases]
        assert [seq for seq in seen if planned[seq]['phase'] in phases]==expected
        assert all(len(s)==1 for s in [states,streams,outputs,bases])
        addresses[str(worker)]=dict(state=list(states)[0],stream=list(streams)[0],output=list(outputs)[0],input_array_base=list(bases)[0])
    assert len(selected)==sum(x['phase'] in phases for x in plans)
    quartets=collections.defaultdict(list)
    strata=collections.defaultdict(list)
    for row in selected:
        key=tuple(row[k] for k in ['worker','phase','family','kind','block','quartet']);quartets[key].append(row)
        strata[row['worker'],row['phase'],row['family'],row['kind'],row['level'],row['previous']].append(row)
    grouped=collections.defaultdict(dict)
    for key,rows in quartets.items():
        rows.sort(key=lambda x:x['position']);assert [x['position'] for x in rows]==[0,1,2,3]
        labels=[x['label'] for x in rows];assert labels in [[0,1,1,0],[1,0,0,1]]
        assert all(sum(x['label']==label for x in rows)==2 for label in [0,1])
        def contrast(field):return (sum(x[field]/N for x in rows if x['label']==0)-sum(x[field]/N for x in rows if x['label']==1))/2
        worker,phase,family,kind,block,quartet=key
        grouped[worker,phase,family,kind][block,quartet]=dict(delta=contrast('wall_ns'),cpu=contrast('cpu_ns'),order='ABBA' if labels[0]==0 else 'BAAB')
    results=[]
    for key,items in sorted(grouped.items()):
        assert set(items)=={(b,q) for b in range(12) for q in range(8)}
        worker,phase,family,kind=key
        blocks=[statistics.mean(items[b,q]['delta'] for q in range(8)) for b in range(12)]
        cpus=[statistics.mean(items[b,q]['cpu'] for q in range(8)) for b in range(12)]
        row=dict(worker=worker,phase=phase,family=family,kind=kind,delta_ns=bounds(blocks,2.201),cpu_delta_ns=bounds(cpus,2.201),quartet_deltas_by_block=[[items[b,q]['delta'] for q in range(8)] for b in range(12)],order_block_means={order:[statistics.mean(items[b,q]['delta'] for q in range(8) if items[b,q]['order']==order) for b in range(12)] for order in ['ABBA','BAAB']})
        if phase!=2:row['passed']=row['delta_ns']['absolute_bound']<=100
        results.append(row)
    expected_cells=32*int(1 in phases)+16*int(2 in phases)+32*int(3 in phases)
    assert len(results)==expected_cells
    controls=[x for x in results if x['phase']!=2]
    failed=[x for x in controls if not x['passed']]
    predecessor=[]
    for key,rows in sorted(strata.items()):
        worker,phase,family,kind,target,previous=key
        predecessor.append(dict(worker=worker,phase=phase,family=family,kind=kind,target=target,previous=previous,switched=previous!=target,batch_rows=len(rows),streams=len(rows)*128,mean_wall_ns=statistics.mean(x['wall_ns']/N for x in rows),mean_cpu_ns=statistics.mean(x['cpu_ns']/N for x in rows),per_block_counts=[sum(x['block']==b for x in rows) for b in range(12)],note='Descriptive only; retained in main estimates. Not a correction or proof of predecessor independence.'))
    result=dict(phases=phases,rows=len(selected),cells=len(results),controls=len(controls),failed_controls=len(failed),calibration_passed=bool(controls) and not failed,results=results,predecessor_strata=predecessor,addresses=addresses,sizes=size,uncertainty='Only12 chronological block contrasts per estimate; eight quartet contrasts averaged within each block. Batch rows are not uncertainty observations.')
    if 2 in phases:
        q=1-.05/(2*18);critical=t11_quantile(q);estimates=[];orders={}
        comparison={(x['worker'],x['family']):x for x in results if x['phase']==2}
        assert len(comparison)==16
        for worker in [0,1]:
            for family in range(8):
                estimates.append(dict(worker=worker,family=family,type='family',benefit_ns=bounds(comparison[worker,family]['delta_ns']['blocks'],critical)))
            aggregate=[statistics.mean(comparison[worker,f]['delta_ns']['blocks'][b] for f in range(8)) for b in range(12)]
            estimates.append(dict(worker=worker,type='aggregate',benefit_ns=bounds(aggregate,critical)))
            orders[str(worker)]={order:statistics.mean(comparison[worker,f]['order_block_means'][order][b] for f in range(8) for b in range(12)) for order in ['ABBA','BAAB']}
        assert len(estimates)==18
        benefit=all(x['benefit_ns']['ci'][0]>=500 for x in estimates if x['type']=='aggregate')
        nonharm=all(x['benefit_ns']['ci'][0]>=-100 for x in estimates if x['type']=='family')
        order_guard=all(v>0 for row in orders.values() for v in row.values())
        result['decision']=dict(passed=result['calibration_passed'] and benefit and nonharm and order_guard and size['passed'],benefit_passed=benefit,family_nonharm_passed=nonharm,order_guard_passed=order_guard,bytes_passed=size['passed'],estimates=estimates,order_strata_aggregate_means=orders,simultaneous_adjustment=dict(name='two-sided Bonferroni Student-t',df=11,estimates=18,quantile=q,critical=critical,family_alpha=.05),scope='Fixed eight-warm-stream recipe, complete64-byte wrapped native reuse only. No predecessor-independence, Java, stock-relative, fresh-stream or larger-input claim.')
    return result

def report(root,result,status):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());names={x['id']:x['name'] for x in m['families']}
    lines=['# Native reuse64: one fixed experiment','',f'Status: {status}. Rows {result["rows"]}; cells {result["cells"]}; failed A/A controls {result["failed_controls"]}/{result["controls"]}.','', 'Both workers stay resident and block without spinning. Order: P0 pre, P1 pre, global gate, P0 comparison, P1 comparison, P1 post, P0 post. No retries, exclusions, offsets or changed thresholds.','', 'A quartet contrasts the mean of two A batch times/128 against two B batch times/128. Eight quartets make one block. Only12 chronological block observations enter each interval. A/A uses2.201 and100ns. Benefit/family estimates use the declared two-sided Bonferroni Student-t quantile1-0.05/(2*18), df11.','', '| Worker | Phase | Family | A/A level | Mean ns | Absolute bound ns |','|---:|---:|---|---:|---:|---:|']
    for row in result['results']:
        if row.get('passed') is False:lines.append(f"|{row['worker']}|{row['phase']}|{names[row['family']]}|{row['kind']}|{row['delta_ns']['mean']:.6f}|{row['delta_ns']['absolute_bound']:.6f}|")
    lines+=['',f"Maximum compressed byte delta ng1-minus-ng6: {result['sizes']['maximum_delta_bytes']}; limit8 per payload.",'']
    if 'decision' in result:
        d=result['decision'];lines+=['| Worker | Estimate | Mean benefit ns | Simultaneous lower | Simultaneous upper |','|---:|---|---:|---:|---:|']
        for x in d['estimates']:
            b=x['benefit_ns'];label=names[x['family']] if x['type']=='family' else 'equal-family aggregate';lines.append(f"|{x['worker']}|{label}|{b['mean']:.6f}|{b['ci'][0]:.6f}|{b['ci'][1]:.6f}|")
        lines+=['',f"Criteria: benefit={d['benefit_passed']}, family nonharm={d['family_nonharm_passed']}, order guard={d['order_guard_passed']}, bytes={d['bytes_passed']}."]
    lines+=['','Every batch retains actual predecessor level, switched/unchanged status and all eight warm banks. The claim is limited to this preparation recipe; no predecessor independence is presumed. Native setup/parameter selection/eight warm streams are outside timed reset+finish. Java1 in PR6 selects physical ng2; this is not a qualified Java or shipping improvement. Stock-relative benefit, fresh lifecycle, broader tiny/raw coverage, larger-input cost/bytes and actual Java qualification remain separate mandatory gates.','', 'All output sums/final lengths and final compressed bytes are checked natively. Before/after all-bank fresh-versus-reuse outputs are stock-inflated. A representative final output per quartet is inflated outside timing; not every timed stream is inflated. Full source/build identities, raw rows, addresses, compressed outputs and correctness logs are retained.']
    (root/'REPORT.md').write_text('\n'.join(lines)+'\n')

def export_local(root):
    root=Path(root);files={}
    for path in sorted(root.rglob('*')):
        if not path.is_file():continue
        rel=path.relative_to(root)
        if rel.parts[0] in ['src','build']:continue
        data=path.read_bytes();files[str(rel)]=dict(sha256=hashlib.sha256(data).hexdigest(),bytes=len(data),base64=base64.b64encode(data).decode())
    packed=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0);encoded=base64.b64encode(packed).decode()
    assert len(encoded)<3000000
    print('REUSE64_BEGIN',len(encoded),len(packed),hashlib.sha256(packed).hexdigest())
    for i in range(0,len(encoded),1000):print('REUSE64_DATA',encoded[i:i+1000])
    print('REUSE64_END')
    if (root/'REPORT.md').exists():print((root/'REPORT.md').read_text())
    elif (root/'status.json').exists():print((root/'status.json').read_text())

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--export-local',type=Path,required=True);a=p.parse_args();export_local(a.export_local)
