"""Read only completed run 38584091569. Never builds or runs a benchmark."""
from pathlib import Path
import base64,gzip,hashlib,io,json,os,tempfile,urllib.request,zipfile
API='https://api.github.com/repos/re-thc/openjdk-jdk27u'
RUN=38584091569;ARTIFACT=11903564980
COMMIT='1b8cf85c4faee4a83ebb41388167416c1269cfa8'
SHA='fd5436467d10a7c16c3558ba2a7a534b3db81f4deee1e9fc9c2020ea259cbc43'
class StripAuth(urllib.request.HTTPRedirectHandler):
    def redirect_request(self,req,fp,code,msg,headers,newurl):
        r=super().redirect_request(req,fp,code,msg,headers,newurl)
        if r is not None:r.remove_header('Authorization')
        return r
opener=urllib.request.build_opener(StripAuth())
def get(path):
    req=urllib.request.Request(API+path,headers={'Authorization':'Bearer '+os.environ['GH_TOKEN'],'Accept':'application/vnd.github+json','User-Agent':'fixed-zlib-evidence-reader'})
    with opener.open(req,timeout=90) as response:return response.read()
r=json.loads(get('/actions/runs/'+str(RUN)))
assert r['status']=='completed' and r['run_attempt']==1 and r['head_sha']==COMMIT
meta=json.loads(get('/actions/artifacts/'+str(ARTIFACT)))
assert meta['workflow_run']['id']==RUN and meta['size_in_bytes']==9568042 and meta['digest']=='sha256:'+SHA
raw=get('/actions/artifacts/'+str(ARTIFACT)+'/zip')
assert len(raw)==9568042 and hashlib.sha256(raw).hexdigest()==SHA
TEMP=tempfile.TemporaryDirectory();ROOT=Path(TEMP.name)
with zipfile.ZipFile(io.BytesIO(raw)) as z:
    for item in z.infolist():
        rel=Path(item.filename)
        assert not rel.is_absolute() and '..' not in rel.parts
        if item.is_dir():continue
        if item.filename=='manifest.json' or (rel.parts[0]=='evidence' and rel.suffix in ['.json','.csv','.md','.log']):
            out=ROOT/'recovered'/rel;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(z.read(item))
from pathlib import Path
import collections,csv,json,math,statistics
P=ROOT
E=P/'recovered/evidence'
m=json.loads((P/'recovered/manifest.json').read_text());cells={c['id']:c for c in m['cells']}
sizes=json.loads((E/'size-results.json').read_text());lengths={(r['input'],r['format'],r['library'],r['level']):r['bytes'] for r in sizes}
scored=json.loads((E/'timing-results.json').read_text());original={c['id']:c for c in scored['results']}
groups=collections.defaultdict(dict);rows=0
for raw in csv.DictReader((E/'timing.csv').open()):
 r={k:int(v) for k,v in raw.items()};c=cells[r['cell']];assert r['category']==c['category'];assert r['iterations']==c['iterations'];arm=r['arm'];assert arm in [0,1]
 slot=0 if c['category'] and c['control']==0 else (1-arm if c['category'] and c['control']==1 and r['block']%2 else arm)
 assert r['slot']==slot
 lib=c['al'] if arm==0 else c['bl'];level=c['an'] if arm==0 else c['bn'];library=['stock','ng','ng-control'][lib]
 if library=='ng-control':library='ng'
 assert r['output_bytes']==(0 if c['mode']=='reset' else lengths[c['input'],c['format'],library,level])
 assert r['first_state'] and r['last_state']
 if c['mode']=='create':assert r['last_init']-r['first_init']==r['iterations']-1
 else:assert r['first_state']==r['last_state'] and r['first_init']==r['last_init']
 key=r['cell'],r['block'],r['pair'];assert arm not in groups[key];groups[key][arm]=r;rows+=1
assert rows==343008 and len(groups)==171504
bycell=collections.defaultdict(list)
for (cell,block,pair),arms in groups.items():
 assert set(arms)=={0,1};a,b=arms[0],arms[1];assert {a['order'],b['order']}=={0,1};assert a['order']==((block+pair)%2);assert b['order']==1-a['order']
 n=cells[cell]['iterations'];d=(b['wall_ns']-a['wall_ns'])/n
 bycell[cell].append({'block':block,'pair':pair,'delta':d,'physical':d*(1 if a['slot']==0 else -1),'cpu':(b['cpu_ns']-a['cpu_ns'])/n,'lr':math.log(b['wall_ns']/a['wall_ns'])})
checked=0;failed=[]
for cid,pairs in bycell.items():
 c=cells[cid];o=original[cid];assert len(pairs)==c['blocks']*c['pairs'];t=2.201 if c['category'] else 2.571
 for key,out in [('delta','delta_ns'),('cpu','cpu_delta_ns'),('physical','physical_slot1_minus_slot0_ns'),('lr',None)]:
  if key=='physical' and not(c['category'] and c['control']==1):continue
  block_means=[statistics.mean(x[key] for x in pairs if x['block']==i) for i in range(c['blocks'])]
  assert all(sum(x['block']==i for x in pairs)==c['pairs'] for i in range(c['blocks']))
  mean=statistics.mean(block_means);h=t*statistics.stdev(block_means)/math.sqrt(c['blocks'])
  if key=='lr':
   assert math.isclose(math.exp(mean),o['ratio'],rel_tol=1e-12)
   assert all(math.isclose(a,b,rel_tol=1e-12) for a,b in zip(map(math.exp,[mean-h,mean+h]),o['ratio_ci95']))
  else:
   assert math.isclose(mean,o[out]['mean'],abs_tol=1e-8);assert all(math.isclose(a,b,abs_tol=1e-8) for a,b in zip([mean-h,mean+h],o[out]['ci95']))
   assert math.isclose(abs(mean)+h,o[out]['absolute_bound'],abs_tol=1e-8)
 if c['category']:
  passes=o['delta_ns']['absolute_bound']<=100 and (c['control']!=1 or o['physical_slot1_minus_slot0_ns']['absolute_bound']<=100)
  assert passes==o['passed']
  if not passes:failed.append(cid)
 checked+=1
assert checked==4356 and scored['qualified']==(not failed)
result={'rows':rows,'pairs':len(groups),'cells_recomputed':checked,'all_balanced_orders_verified':True,'all_slots_lifecycles_and_lengths_verified':True,'all_score_means_intervals_and_ratios_recomputed':True,'AA_total':72,'AA_failed':len(failed),'failed_cells':failed,'timing_qualified':not failed}
(P/'independent-audit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))

# Compact summaries preserve every cell and interval; full raw pairs remain in
# the exact original artifact already retained in Library. Keep log size bounded.
fields=['id','category','input','format','mode','label','group','control','al','an','bl','bn','blocks','pairs','iterations','passed','ratio','ratio_ci95','arm_means_ns','order_mean_delta_ns','counters']
summary=[]
for cell in scored['results']:
    row={k:cell[k] for k in fields if k in cell}
    for key in ['delta_ns','cpu_delta_ns','physical_slot1_minus_slot0_ns']:
        row[key]=cell[key]
    summary.append(row)
files={name:(E/name).read_text() for name in ['size-results.csv','environment.json','algorithm-map.json','current-Java-requested1.json','REPORT.md','identities.json']}
files['manifest.json']=(ROOT/'recovered/manifest.json').read_text()
files['independent-audit.json']=(ROOT/'independent-audit.json').read_text()
files['timing-results.json']=json.dumps({'qualified':scored['qualified'],'criterion':scored['criterion'],'results':summary},separators=(',',':'))
files['reader-provenance.json']=json.dumps({'run_id':RUN,'commit':COMMIT,'artifact_id':ARTIFACT,'artifact_bytes':len(raw),'artifact_sha256':SHA,'raw_pairs_independently_audited':True,'measurements_executed':False},indent=2)
packed=gzip.compress(json.dumps(files,separators=(',',':')).encode(),mtime=0)
encoded=base64.b64encode(packed).decode()
assert len(encoded)<3000000,('Reader log size bound exceeded',len(encoded))
print('LEVEL_READER_BEGIN',hashlib.sha256(packed).hexdigest(),len(packed))
for i in range(0,len(encoded),1000):print('LEVEL_READER_DATA',encoded[i:i+1000])
print('LEVEL_READER_END')
print((E/'REPORT.md').read_text())
TEMP.cleanup()
