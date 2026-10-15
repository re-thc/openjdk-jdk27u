"""Frozen direct public N/S proposal. Planning never runs native code."""
from pathlib import Path
import collections,csv,hashlib,io,json,sys
sys.dont_write_bytecode=True
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent/'reset-only'))
import reset_protocol as B
VERSION='direct-public-ns-v1'
PIN,NG,PATCH,PINS=B.PIN,B.NG,B.PATCH,B.PINS
require,InvalidData,sha,dump=B.require,B.InvalidData,B.sha,B.dump
TAG='diagnostic-tiny-zlib-direct-reset-validation-20261015-once'
M=[0,7,3,4,5,2,6,1]
ROWS=28160;EPISODES=7040;COMMANDS=42240;CLOCKS=21120
SOURCES=['direct_protocol.py','direct_driver.c','direct_score.py','direct_study.py','test_direct.py','reset_proof.c','validate_local.py','synthetic_clock.c','build_support.py','repair_preflight.py','remove-duplicate-reset-check.patch','test_repair_preflight.py']
EF=['episode','phase','block','worker','companion','worker_slot','profile_slot','case_slot','work','kind','order']
RF=['seq','episode','phase','block','worker','worker_slot','profile_slot','case_slot','work','kind','order','position','label','arm']
CF=['command','worker','opcode','episode','row']
PF=['id','bytes','life','warm_work','prep','iterations']
def spec():
    return dict(version=VERSION,pin=PIN,ng=NG,patch=PATCH,pins=PINS,workers=8,resident_processes=9,main_blocks=32,guard_blocks=8,
      phase_rows={'1':8192,'2':4096,'3':7680,'4':8192},rows=ROWS,episodes=EPISODES,commands=COMMANDS,clock_rows=CLOCKS,
      warm=3328,tiny_iterations=512,predecessor=3072,measurement_seconds=900,startup_seconds=180,finish_seconds=180,retries=0,
      primary=dict(family=16,df=31,minimum_lower_ns=500,order_sign_veto=True),calibration=dict(critical=2.201,limit_ns=100,strata=['pooled','ABBA','BAAB']),
      guards=dict(family=280,df=7,absolute_profiles=[2,3,4,11],resolution_ns=100,resolution_percentage_points=1,
        ratio='mean of per-block100*(S-N)/N; finite strictly positive N required',consistent='all8 positive paired differences AND both order means positive',
        flags='calibration, precision, positive interval and consistency computed independently; failed calibration forbids demonstrated candidate slowdown',
        labels=['CLEAR_NONINCREASE','RESOLUTION_LIMITED_CLEAR','HOLD_SLOWDOWN','UNRESOLVED'],no_zero_regression_claim=True),
      stopping='All phases run regardless of statistics. Only protocol/correctness/provenance/deadline abort. No exclusions/retries/adaptation.',
      reset='R probes then two public resets on EACH persistent N/S stream; second S reset full fallback proven untimed.',
      guard_order='base=b%4, paired b+4 positions, first=bitcount_parity(b) XOR((worker+profile+case)%2)',
      qualification='Bounded fixed-host native evidence only; no stock/Java/shipping/merge/automatic follow-up authority.')
def fingerprint():return hashlib.sha256(json.dumps(spec(),sort_keys=True,separators=(',',':')).encode()).hexdigest()
def tsv(rows,fields):
    out=io.StringIO();w=csv.DictWriter(out,fieldnames=fields,delimiter='\t',lineterminator='\n');w.writeheader();w.writerows(rows);return out.getvalue().encode()
def canonical(root):
    definitions,data,groups=B.pinned_inputs();definitions=[dict(d) for d in definitions];data=list(data)
    def add(name,b):
        i=len(data);data.append(b);definitions.append(dict(id=i,name=name,bytes=len(b),sha256=hashlib.sha256(b).hexdigest()));return i
    short=[add(f'boundary63-{i}',data[132+i][:63]) for i in range(132)]
    over=[add(f'boundary65-{i}',data[132+i]+bytes([i])) for i in range(132)]
    text=[add(f'text4096-{i}',data[266][64*i:64*i+4096]) for i in range(8)]
    random=[add(f'random4096-{i}',data[267][4096*i:4096*i+4096]) for i in range(8)]
    ring=B.workloads(groups)[0]['banks'];small=list(ring);large=[i+132 for i in ring]
    short_ring=[short[i] for i in ring];over_ring=[over[i] for i in ring]
    profiles=[]
    banks=[small,large,short_ring,over_ring,large,text,random,[266],[267],text,random,large]
    sizes=[32,64,63,65,64,4096,4096,1048576,1048576,4096,4096,64]
    lives=[0,0,0,0,1,0,0,0,0,1,1,2]
    for i in range(12):
        background=i if i in [0,1,2,3,4,11] else 4 if lives[i]==1 else 1
        prep=0 if background==i else len(banks[i]);iterations=512 if i in [0,1,2,3,4,11] else 2 if i in [7,8] else 64
        profiles.append(dict(zip(PF,[i,sizes[i],lives[i],background,prep,iterations]),banks=banks[i]))
    inputs=[dict(d,path=str(Path(root).resolve()/'inputs'/f"{d['id']}.bin")) for d in definitions]
    require(len(inputs)==548,'input dimensions');return inputs,profiles,data
def plans():
    eps=[];rows=[];commands=[]
    def episode(phase,b,w,ws,ps,cs,work,kind,order):
        eid=len(eps);e=dict(zip(EF,[eid,phase,b,w,(w+4)%8,ws,ps,cs,work,kind,order]));eps.append(e)
        for op,owner in [(0,w),(1,(w+4)%8)]:commands.append(dict(zip(CF,[len(commands),owner,op,eid,-1])))
        for pos in range(4):
            label=order if pos in [0,3] else 1-order;arm=label if kind==2 else kind
            r=dict(zip(RF,[len(rows),eid,phase,b,w,ws,ps,cs,work,kind,order,pos,label,arm]));rows.append(r)
            commands.append(dict(zip(CF,[len(commands),w,2,eid,r['seq']])))
    for phase in [1,2,3,4]:
      for b in range(8 if phase==3 else 32):
        if phase==3:
          base=b%4;workers=list(range(4));workers=workers[base:]+workers[:base]
          for ws,w in enumerate(workers):
            shift=(base+w)%10;profiles=list(range(10));profiles=profiles[shift:]+profiles[:shift]
            for ps,p in enumerate(profiles):
              for cs in range(3):
                kind=(cs+base+w+p)%3;first=(b.bit_count()%2)^((w+p+kind)%2)
                for q in range(2):episode(phase,b,w,ws,ps,cs,p+2,kind,first^q)
        else:
          g,r=divmod(b,8);workers=list(range(8));workers=workers[r:]+workers[:r];n=2 if phase==2 else 4
          for ws,w in enumerate(workers):
            for cs in range(n):
              case=cs^(M[2*g+(w>>2)]&(n-1));work=case%2;kind=2 if phase==2 else case//2
              first=(g.bit_count()^r.bit_count()^w^case^(phase==4))&1
              for q in range(2):episode(phase,b,w,ws,0,cs,work,kind,first^q)
    require((len(eps),len(rows),len(commands))==(EPISODES,ROWS,COMMANDS),'fixed dimensions')
    return eps,rows,commands
def write_plan(root,origin='PLAN_ONLY_NOT_MEASURED'):
    root=Path(root).resolve();root.mkdir(parents=True,exist_ok=True);inputs,profiles,data=canonical(root);eps,rows,commands=plans()
    files={'episodes.tsv':tsv(eps,EF),'rows.tsv':tsv(rows,RF),'commands.tsv':tsv(commands,CF)}
    files['profiles.tsv']=tsv([dict((k,p[k]) for k in PF)|dict(banks=','.join(map(str,p['banks']))) for p in profiles],[*PF,'banks'])
    files['inputs.tsv']=''.join(f"{x['id']}\t{x['path']}\n" for x in inputs).encode()
    for name,b in files.items():(root/name).write_bytes(b)
    m=dict(protocol=spec(),fingerprint=fingerprint(),record_origin=origin,inputs=inputs,profiles=profiles,
        hashes={n:hashlib.sha256(b).hexdigest() for n,b in files.items()});dump(root/'manifest.json',m);return m
def validate_manifest(m,root=None):
    require(m['protocol']==spec() and m['fingerprint']==fingerprint(),'protocol changed')
    require(m['record_origin'] in ['PLAN_ONLY_NOT_MEASURED','SYNTHETIC_UNIT_TEST','NATIVE_MEASUREMENT','VALIDATION_ONLY_SYNTHETIC_CLOCK'],'origin')
    inputs,profiles,data=canonical(root or '/SYNTHETIC');require(m['profiles']==profiles and len(m['inputs'])==548,'canonical profiles/input count')
    for a,b in zip(m['inputs'],inputs):
        require(set(a)==set(b) and all(a[k]==b[k] for k in b if k!='path'),'canonical input definition')
        if root is not None:require(a==b and sha(Path(a['path']))==a['sha256'],'canonical input bytes/path')
    expected_profile=tsv([dict((k,p[k]) for k in PF)|dict(banks=','.join(map(str,p['banks']))) for p in profiles],[*PF,'banks'])
    expected_inputs=''.join(f"{x['id']}\t{x['path']}\n" for x in m['inputs']).encode()
    require(set(m['hashes'])=={'episodes.tsv','rows.tsv','commands.tsv','profiles.tsv','inputs.tsv'},'complete plan hashes')
    require(m['hashes']['profiles.tsv']==hashlib.sha256(expected_profile).hexdigest() and m['hashes']['inputs.tsv']==hashlib.sha256(expected_inputs).hexdigest(),'canonical native index')
    eps,rows,cmd=plans()
    for name,values,fields in [('episodes.tsv',eps,EF),('rows.tsv',rows,RF),('commands.tsv',cmd,CF)]:require(m['hashes'][name]==hashlib.sha256(tsv(values,fields)).hexdigest(),'frozen schedule hash')
    if root is not None:
        for name,h in m['hashes'].items():require(sha(Path(root)/name)==h,'plan/index bytes changed')
