"""Read-only fixed-protocol scorer/exporter. Never executes measurements."""
from pathlib import Path
import argparse,base64,collections,csv,gzip,hashlib,json,math,statistics
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2)+'\n')
def interval(xs,t):
    assert len(xs)==12;m=statistics.mean(xs);h=t*statistics.stdev(xs)/math.sqrt(12)
    return dict(mean=m,ci=[m-h,m+h],absolute_bound=abs(m)+h,blocks=xs,df=11,observations=12,critical=t)
def t11_cdf(t):
    sign=1 if t>=0 else -1;theta=math.atan(abs(t)/math.sqrt(11));v=theta
    for n in range(2,11,2):v=math.sin(theta)*math.cos(theta)**(n-1)/n+(n-1)*v/n
    return .5+sign*math.exp(math.lgamma(6)-.5*math.log(math.pi)-math.lgamma(5.5))*v
def t11_quantile(p):
    assert .5<p<1;lo,hi=0.,100.
    for _ in range(100):
        mid=(lo+hi)/2
        if t11_cdf(mid)<p:lo=mid
        else:hi=mid
    return (lo+hi)/2
def score(root,phases):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());works=m['workloads'];plans=[{k:int(v) for k,v in x.items()} for x in csv.DictReader((root/'schedule.tsv').open(),delimiter='\t')];assert len(plans)==12480
    refs={};hashes={}
    for worker in [0,1]:
        for w in works:
            for i in set(w['banks']):
                b=(root/f'compressed/w{worker}-{w["id"]}-{i}.bin').read_bytes();refs[worker,w['id'],i]=len(b);digest=hashlib.sha256(b).hexdigest();key=w['id'],i
                if key in hashes:assert hashes[key]==digest
                hashes[key]=digest
    rows=[];resources=collections.Counter();addresses={}
    for worker in [0,1]:
        actual=[{k:int(v) for k,v in x.items()} for x in csv.DictReader((root/f'worker-{worker}.csv').open())];selected=[x for x in actual if x['phase'] in phases];want=[x for x in plans if x['worker']==worker and x['phase'] in phases];assert len(selected)==len(want)
        last=-1;persistent=collections.defaultdict(set);outs=set()
        for row,p in zip(selected,want):
            assert all(row[k]==v for k,v in p.items()),(row,p);w=works[row['work']];assert row['previous_work']==last;last=row['work'];n=w['iterations'];banks=w['banks'];ids=[banks[(row['offset']+k)%len(banks)] for k in range(n)]
            assert row['last_input']==ids[-1] and row['output_sum']==sum(refs[worker,w['id'],i] for i in ids) and row['output_bytes']==refs[worker,w['id'],ids[-1]]
            assert row['wall_ns']>0 and row['cpu_ns']>0 and row['window_ns']==row['end_ns']-row['begin_ns']
            if not w['section']:assert row['wall_ns']==row['window_ns']
            else:assert row['wall_ns']<=row['window_ns']
            assert row['stream'] and row['state'] and row['output'];outs.add(row['output'])
            if w['life']!=1:persistent[row['arm']!=0].add((row['stream'],row['state']))
            for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']:assert row[k]>=0;resources[k]+=row[k]
        assert len(outs)==1 and all(len(s)==1 for s in persistent.values());addresses[worker]={str(k):list(s)[0] for k,s in persistent.items()};rows+=selected
    groups=collections.defaultdict(list)
    for r in rows:groups[r['worker'],r['phase'],r['work'],r['kind'],r['block'],r['quartet']].append(r)
    cells=collections.defaultdict(dict)
    for key,rs in groups.items():
        rs.sort(key=lambda x:x['position']);assert [x['position'] for x in rs]==[0,1,2,3];labels=[x['label'] for x in rs];assert labels in [[0,1,1,0],[1,0,0,1]];w=works[key[2]];n=w['iterations']
        def avg(field,label):return statistics.mean(x[field]/n for x in rs if x['label']==label)
        a,b=avg('wall_ns',0),avg('wall_ns',1);cpu=avg('cpu_ns',0)-avg('cpu_ns',1)
        cells[key[:4]][key[4:]]=dict(delta=a-b,cpu=cpu,a=a,b=b,order='ABBA' if labels[0]==0 else 'BAAB')
    controls=[];comparisons=[];critical=t11_quantile(1-.05/(2*24))
    for (worker,phase,wi,kind),items in sorted(cells.items()):
        q=works[wi]['quartets'];assert set(items)=={(b,j) for b in range(12) for j in range(q)}
        ds=[statistics.mean(items[b,j]['delta'] for j in range(q)) for b in range(12)];cs=[statistics.mean(items[b,j]['cpu'] for j in range(q)) for b in range(12)]
        a=[statistics.mean(items[b,j]['a'] for j in range(q)) for b in range(12)];bb=[statistics.mean(items[b,j]['b'] for j in range(q)) for b in range(12)]
        x=dict(worker=worker,phase=phase,work=wi,kind=kind,wall=interval(ds,2.201 if phase!=2 else critical),cpu=interval(cs,2.201 if phase!=2 else critical),a_mean_ns=statistics.mean(a),b_mean_ns=statistics.mean(bb))
        if phase!=2:x['passed']=x['wall']['absolute_bound']<=100;controls.append(x)
        else:
            log=interval([math.log(y/z) for z,y in zip(a,bb)],critical);x['ratio']=dict(mean=math.exp(log['mean']),ci=[math.exp(v) for v in log['ci']],log_blocks=log['blocks']);x['order_means']={order:statistics.mean(v['delta'] for v in items.values() if v['order']==order) for order in ['ABBA','BAAB']};comparisons.append(x)
    expected_controls=60*sum(p in phases for p in [1,3]);assert len(controls)==expected_controls
    failed=[x for x in controls if not x['passed']];result=dict(rows=len(rows),controls=len(controls),failed_controls=len(failed),calibration_passed=bool(controls) and not failed,control_results=controls,comparisons=comparisons,resources=dict(resources),addresses=addresses,all_rows_retained=True,retries=0,scope=m['scope'])
    if 2 in phases:
        assert len(comparisons)==24
        primary=[x for x in comparisons if x['work']<2];boundary=[x for x in comparisons if x['work'] in [2,3]];fallback=[x for x in comparisons if x['work'] in [4,5,6,7]];mechanism=[x for x in comparisons if x['work']>=8]
        assert len(primary)==8 and len(boundary)==len(fallback)//2==len(mechanism)==4
        benefit=all(x['wall']['ci'][0]>=500 for x in primary);nonharm=all(x['wall']['ci'][0]>=-100 for x in boundary);guard=all(x['ratio']['ci'][1]<=1.01 for x in fallback);order=all(v>0 for x in primary for v in x['order_means'].values())
        empty=[]
        for worker in [0,1]:
            es=list(csv.DictReader((root/f'empty-timer-{worker}.csv').open()));assert len(es)==12 and {int(x['block']) for x in es}==set(range(12));empty+=es
        result['decision']=dict(passed=result['calibration_passed'] and benefit and nonharm and guard and order,primary_benefit_passed=benefit,boundary_nonharm_passed=nonharm,fresh_long_guard_passed=guard,order_passed=order,zero_added_bytes=True,simultaneous_estimates=24,critical=critical,df=11,component_intervals_are_not_complete_operation_gains=True,empty_timer_records=empty)
    return result
def report(root,result):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());lines=['Thin backend-only reset: native pilot',f'Rows={result["rows"]}; controls={result["controls"]}; failed={result["failed_controls"]}. No retries, exclusions, offsets, or changed100ns gate.',m['scope'],'Complete-operation and reset-only observations are separate; do not add component medians.','Primary scope is pooled equal-eight-family banks, not per-family or Java/whole-PR qualification.']
    for x in result['comparisons']:
        lines.append(f"worker{x['worker']} {m['workloads'][x['work']]['name']} kind{x['kind']} A_ns={x['a_mean_ns']:.6f} B_ns={x['b_mean_ns']:.6f} gain_ns={x['wall']['mean']:.6f} CI={x['wall']['ci']} ratio={x['ratio']}")
    if 'decision' in result:lines.append('Decision='+json.dumps({k:v for k,v in result['decision'].items() if k!='empty_timer_records'},sort_keys=True))
    (root/'REPORT.txt').write_text('\n'.join(lines)+'\n')
def export(root):
    root=Path(root);files={}
    if not root.exists():print('No saved thin-reset evidence; no measurement is executed by this exporter.');return
    for p in sorted(root.rglob('*')):
        if not p.is_file():continue
        rel=p.relative_to(root)
        if rel.parts[0] in ['build','baseline','candidate','verify','inputs','compressed'] or rel.suffix=='.bin' or str(rel).startswith('untimed-'):continue
        b=p.read_bytes();files[str(rel)]=dict(bytes=len(b),sha256=hashlib.sha256(b).hexdigest(),base64=base64.b64encode(b).decode())
    b=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0);encoded=base64.b64encode(b).decode();assert len(encoded)<3000000
    print('THIN_RESET_BEGIN',len(encoded),len(b),hashlib.sha256(b).hexdigest())
    for i in range(0,len(encoded),1000):print('THIN_RESET_DATA',encoded[i:i+1000])
    print('THIN_RESET_END')
    if (root/'REPORT.txt').exists():print((root/'REPORT.txt').read_text())
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--export-local',type=Path,required=True);a=p.parse_args();export(a.export_local)
