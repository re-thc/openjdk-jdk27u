"""Score saved batches only. Never execute a measurement from this module."""
from pathlib import Path
import base64,collections,csv,gzip,hashlib,io,json,math,os,statistics,urllib.request,zipfile
CONFIGS=['stock6','ng6','ng1-quick','ng2-fast']
def dump(path,value):Path(path).write_text(json.dumps(value,indent=2)+'\n')
def bounds(values,t):
    mean=statistics.mean(values);half=t*statistics.stdev(values)/math.sqrt(len(values))
    return dict(mean=mean,ci95=[mean-half,mean+half],absolute_bound=abs(mean)+half,blocks=values)
def score(root,phases):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());cells={x['id']:x for x in m['cells']};cases={x['id']:x for x in m['cases']};sizes={}
    for name in ['sizes-calibration.csv','sizes-tiny.csv']:
        if (root/name).exists():
            for row in csv.DictReader((root/name).open()):sizes[tuple(int(row[k]) for k in ['case','bank','raw','config'])]=int(row['bytes'])
    results=[];rowcount=0
    def finish_cell(layout,cid,pairs):
        c=cells[cid];assert len(pairs)==c['blocks']*c['pairs'];assert len({(x['a']['block'],x['a']['pair']) for x in pairs})==len(pairs);assert all(sum(x['a']['block']==i for x in pairs)==c['pairs'] for i in range(c['blocks']));t=2.571 if c['phase']==2 else 2.201
        def b(key):return bounds([statistics.mean(x[key] for x in pairs if x['a']['block']==i) for i in range(c['blocks'])],t)
        delta=b('delta');physical=None if c['control']==0 else b('physical');created=b('created') if c['mode']==2 or c['control']!=0 else None;lr=b('lr')
        out=dict(**c,layout=layout,load_reverse=(layout>>2)&1,swap_slots=(layout>>1)&1,init_reverse=layout&1,delta_ns=delta,cpu_delta_ns=b('cpu'),physical_slot1_minus_slot0_ns=physical,created_later_minus_earlier_ns=created,ratio=math.exp(lr['mean']),ratio_ci95=list(map(math.exp,lr['ci95'])),arm_means_ns={k:statistics.mean(x[k]['wall_ns']/c['iterations'] for x in pairs) for k in ['a','b']},order_mean_delta_ns={str(o):statistics.mean(x['delta'] for x in pairs if x['b']['order']==o) for o in [0,1]},counters={k:{field:sum(x[k][field] for x in pairs) for field in ['voluntary_ctx','involuntary_ctx','minor_faults','major_faults','throttled_periods','throttled_us']} for k in ['a','b']})
        out['state_summary']={k:dict(first_state_examples=sorted({x[k]['first_state'] for x in pairs})[:4],distinct_first_states=len({x[k]['first_state'] for x in pairs}),per_block_first_state=[next(x[k]['first_state'] for x in pairs if x[k]['block']==i) for i in range(c['blocks'])],per_block_first_init=[next(x[k]['first_init'] for x in pairs if x[k]['block']==i) for i in range(c['blocks'])],per_block_slot=[next(x[k]['slot'] for x in pairs if x[k]['block']==i) for i in range(c['blocks'])],image=pairs[0][k]['image']) for k in ['a','b']}
        if c['phase']!=2:out['passed']=delta['absolute_bound']<=100 and (physical is None or physical['absolute_bound']<=100)
        results.append(out)
    for layout in range(8):
        pairs=[];last=None
        with (root/f'worker-{layout}.csv').open() as f:
            reader=iter(csv.DictReader(f))
            for left in reader:
                right=next(reader);aa={k:int(v) for k,v in left.items()};bb={k:int(v) for k,v in right.items()};assert aa['order']==0 and bb['order']==1
                assert all(aa[k]==bb[k] for k in ['layout','phase','cell','block','pair','iterations']);assert aa['layout']==layout
                c=cells[aa['cell']];assert c['phase']==aa['phase']
                if c['phase'] not in phases:continue
                arms={aa['arm']:aa,bb['arm']:bb};assert set(arms)=={0,1};a,b=arms[0],arms[1];assert a['order']==(a['block']+a['pair'])%2
                assert a['iterations']==b['iterations']==c['iterations'];case=cases[c['case']]
                for arm,r in arms.items():
                    assert 0<=r['block']<c['blocks'] and 0<=r['pair']<c['pairs']
                    swap=(layout>>1)&1;load=(layout>>2)&1;slot=swap if c['control']==0 else swap^arm^((r['block']&1) if c['control']==1 else 0)
                    assert r['slot']==slot;cfg=c['ca'] if arm==0 else c['cb'];assert r['config']==cfg
                    copy=(load^swap) if c['control'] in [0,1] else arm if c['control']==2 else c['copy']
                    assert r['image']==(2 if cfg else 0)+copy
                    assert r['first_state'] and r['last_state']
                    if c['mode']==2:assert r['last_init']-r['first_init']==c['iterations']-1
                    else:assert r['first_init']==r['last_init'] and r['first_state']==r['last_state']
                    bank=((r['block']*c['pairs']+r['pair'])*c['iterations']+c['iterations']-1)%len(case['banks']);assert r['last_bank']==bank
                    assert r['output_bytes']==(sizes[c['case'],bank,c['raw'],cfg] if c['mode'] else 0)
                    want=sum(sizes[c['case'],((r['block']*c['pairs']+r['pair'])*c['iterations']+k)%len(case['banks']),c['raw'],cfg] for k in range(c['iterations'])) if c['mode'] else 0
                    assert r['total_bytes']==want
                n=c['iterations'];d=(b['wall_ns']-a['wall_ns'])/n;physical=d*(1 if a['slot']==0 else -1);created=d*(1 if b['first_init']>a['first_init'] else -1)
                key=a['cell']
                if last is not None and key!=last:finish_cell(layout,last,pairs);pairs=[]
                last=key;pairs.append(dict(a=a,b=b,delta=d,physical=physical,created=created,cpu=(b['cpu_ns']-a['cpu_ns'])/n,lr=math.log(b['wall_ns']/a['wall_ns'])));rowcount+=2
        if pairs:finish_cell(layout,last,pairs)
    expected=sum(8*c['blocks']*c['pairs']*2 for c in m['cells'] if c['phase'] in phases);assert rowcount==expected
    assert len(results)==8*sum(c['phase'] in phases for c in m['cells'])
    assert {(x['layout'],x['id']) for x in results}=={(i,c['id']) for i in range(8) for c in m['cells'] if c['phase'] in phases}
    controls=[x for x in results if x['phase']!=2];qualified=bool(controls) and all(x['passed'] for x in controls)
    result=dict(phases=phases,rows=rowcount,pairs=rowcount//2,cells=len(results),controls=len(controls),failed_controls=sum(not x['passed'] for x in controls),qualified=qualified,results=results,audit='Every row, balanced pair, slot/image/config, initialization ordinal, output byte sum and final output length checked; all samples kept.')
    return result

def sizes_report(root):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());cases={x['id']:x for x in m['cases']};rows=[]
    for name in ['sizes-calibration.csv','sizes-tiny.csv']:
        if (root/name).exists():
            for r in csv.DictReader((root/name).open()):
                r={k:(int(v) if k not in ['path'] else v) for k,v in r.items()};b=Path(r['path']).read_bytes();assert len(b)==r['bytes'];r.update(sha256=hashlib.sha256(b).hexdigest(),input_sha256=cases[r['case']]['banks'][r['bank']]['sha256'],input_bytes=cases[r['case']]['size'],family=cases[r['case']]['family']);rows.append(r)
    lookup={(r['case'],r['bank'],r['raw'],r['config']):r for r in rows}
    for r in rows:
        for cfg,label in [(0,'stock6'),(1,'ng6')]:
            base=lookup[r['case'],r['bank'],r['raw'],cfg]['bytes'];r['delta_'+label+'_bytes']=r['bytes']-base;r['ratio_'+label]=r['bytes']/base
        if not r['raw']:
            raw=lookup[r['case'],r['bank'],1,r['config']];assert r['bytes']-raw['bytes']==6;assert Path(r['path']).read_bytes()[2:-4]==Path(raw['path']).read_bytes()
    dump(root/'size-results.json',rows);return rows

def report(root,result,status):
    root=Path(root);m=json.loads((root/'manifest.json').read_text());cases={x['id']:x for x in m['cases']};failed=[x for x in result['results'] if x['phase']!=2 and not x['passed']]
    lines=['# Fixed order calibration and conditional tiny comparison','',f"Status: {status}. Rows {result['rows']}, cells {result['cells']}, failed controls {len(failed)}/{result['controls']}.",'','The100ns criterion, full schedule and order reversals were declared before execution. No offset subtraction, exclusions, retry or default/PR6 change. Whole inputs are known before FINISH. Current Java1 still maps to native ng2.','', '| Layout | Phase | Cell | Config | Input | Format | Mode | Control | Logical bound ns | Physical bound ns |','|---:|---:|---:|---|---|---|---|---|---:|---:|']
    for x in failed:
        case=cases[x['case']];ph=x['physical_slot1_minus_slot0_ns'];lines.append(f"| {x['layout']} | {x['phase']} | {x['id']} | {CONFIGS[x['ca']]} | {case['family']}-{case['size']} | {x['raw']} | {x['mode']} | {x['control']} | {x['delta_ns']['absolute_bound']:.3f} | {ph['absolute_bound'] if ph else ''} |")
    lines+=['','All cell/block intervals, CPU measurements, order strata and counters are in scored JSON. Image identities, actual bases/function/state/buffer addresses and initialization ordinals are in the raw logs. Same-image copy selection, physical-slot reversals and creation/priming-order reversals stay separate. In create/end, actual creation order and batch execution order coincide; priming order is a separate controlled factor and does not identify them independently. Default internal allocations are not hooked.','', 'A calibration failure skips the entire tiny phase. If initial calibration passes, every predefined tiny cell and post bracket executes once; a post failure makes all tiny timing unqualified. A repeated-byte stock6/ng1 tie remains a possible outcome, not a failure to be rerun.']
    (root/'REPORT.md').write_text('\n'.join(lines)+'\n')
    # All eight layout observations, not a selected favorable layout.
    groups=collections.defaultdict(list)
    for x in result['results']:
        if x['phase']!=2:groups[x['phase'],x['case'],x['raw'],x['mode'],x['ca'],x['control']].append(x)
    factorial=[]
    for key,rows in groups.items():
        assert len(rows)==8
        factorial.append(dict(key=list(key),logical_means_by_layout={str(x['layout']):x['delta_ns']['mean'] for x in rows},physical_means_by_layout={str(x['layout']):x['physical_slot1_minus_slot0_ns']['mean'] if x['physical_slot1_minus_slot0_ns'] else None for x in rows},created_means_by_layout={str(x['layout']):x['created_later_minus_earlier_ns']['mean'] if x['created_later_minus_earlier_ns'] else None for x in rows},factor_stratum_means={factor:{str(bit):statistics.mean(x['delta_ns']['mean'] for x in rows if x[factor]==bit) for bit in [0,1]} for factor in ['load_reverse','swap_slots','init_reverse']}))
    address=json.loads((root/'address-summary.json').read_text()) if (root/'address-summary.json').exists() else {'images':[]}
    image_rows={(int(x['layout']),int(x['id'])):x for x in address['images']}
    for item in factorial:
        rows=groups[tuple(item['key'])];control=item['key'][-1];mode=item['key'][3]
        item['balanced_logical_mean_ns']=statistics.mean(x['delta_ns']['mean'] for x in rows)
        item['balanced_physical_mean_ns']=statistics.mean(x['physical_slot1_minus_slot0_ns']['mean'] for x in rows) if control!=0 else None
        item['balanced_created_later_mean_ns']=statistics.mean(x['created_later_minus_earlier_ns']['mean'] for x in rows) if mode==2 or control!=0 else None
        item['creation_order_note']='Actual creation order coincides with batch execution order' if mode==2 else 'Two simultaneously live states; setup initialization rank independently reversed'
        if control==2:
            item['balanced_imageB_minus_imageA_mean_ns']=item['balanced_logical_mean_ns']
            item['balanced_later_loaded_minus_earlier_loaded_mean_ns']=statistics.mean(x['delta_ns']['mean']*(1 if x['load_reverse']==0 else -1) for x in rows)
            family=2 if item['key'][4] else 0
            item['balanced_higher_deflate_address_minus_lower_mean_ns']=statistics.mean(x['delta_ns']['mean']*(1 if int(image_rows[x['layout'],family+1]['deflate'],16)>int(image_rows[x['layout'],family]['deflate'],16) else -1) for x in rows) if image_rows else None
        item['qualification_use']='Descriptive identification matrix only. Never cancels or overrides any failed100ns cell.'
    dump(root/'order-associations.json',factorial)


def export_shard():
    """Read the current completed core artifact, with no measurement execution."""
    import tempfile
    class StripAuth(urllib.request.HTTPRedirectHandler):
        def redirect_request(self,req,fp,code,msg,headers,newurl):
            r=super().redirect_request(req,fp,code,msg,headers,newurl)
            if r is not None:r.remove_header('Authorization')
            return r
    opener=urllib.request.build_opener(StripAuth());api='https://api.github.com/repos/'+os.environ['GITHUB_REPOSITORY'];run=os.environ['GITHUB_RUN_ID']
    def get(path):
        with opener.open(urllib.request.Request(api+path,headers={'Authorization':'Bearer '+os.environ['GH_TOKEN'],'User-Agent':'fixed-order-evidence'}),timeout=120) as r:return r.read()
    artifacts=json.loads(get('/actions/runs/'+run+'/artifacts'))['artifacts'];found=[a for a in artifacts if a['name']=='zlib-order-evidence-'+run];assert len(found)==1;a=found[0]
    archive=get('/actions/artifacts/'+str(a['id'])+'/zip');assert hashlib.sha256(archive).hexdigest()==a['digest'].removeprefix('sha256:')
    names=['address-summary.json','manifest.json','preregistered.json','environment.json','identities.json','calibration-score.json','final-score.json','size-results.json','order-associations.json','REPORT.md','status.json']
    with zipfile.ZipFile(io.BytesIO(archive)) as z:files={name:z.read(name).decode() for name in names if name in z.namelist()}
    packed=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0);encoded=base64.b64encode(packed).decode();part=int(os.environ['EVIDENCE_PART']);split=(len(encoded)+3)//4;chunk=encoded[part*split:(part+1)*split];assert len(chunk)<3000000
    print('ORDER_EVIDENCE_BEGIN',part,len(encoded),len(packed),hashlib.sha256(packed).hexdigest(),a['id'],a['digest'])
    for i in range(0,len(chunk),1000):print('ORDER_EVIDENCE_DATA',part,chunk[i:i+1000])
    print('ORDER_EVIDENCE_END',part)
    print(files.get('REPORT.md','No report'))
if __name__=='__main__':export_shard()
