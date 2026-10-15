"""Frozen mechanism-v2 protocol. Pure planning/validation; no native execution."""
from pathlib import Path
import base64,collections,csv,hashlib,io,json

VERSION='mechanism-v2'
PIN='3f71d03f3297f94e8c2cc34160262a880be337fc'
NG='88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0'
PATCH='db471660e1faf92aa71bca6b1f2ab178b4ca259343f5a0fc22713094f355e8c2'
PINS='6dfceaab5c67f2fe169c26dc18558af7899b89eb348db4b922a6a69c68584ebd'
SCHEDULE_SHA='0cf422f7370aaf92370664eafdf41daf86e60b9f4f073c9896be63f65ba3f051'
FIELDS=['seq','worker','phase','block','work','kind','quartet','position','label','arm','offset']
ARMS={0:[0,0],1:[2,2],2:[3,3],3:[0,2],4:[2,3]}
NAMES={0:'N/N',1:'F/F',2:'U/U',3:'N/F attribution',4:'F/U mechanism'}
WORKERS=list(range(8));BLOCKS=12;ITERATIONS=512;WARM=256
LAUNCH_ORDER=[0,3,5,6,7,4,2,1]
PHASE_ROWS={1:4608,2:3072,3:4608};MAX_ROWS=12288
MEASUREMENT_SECONDS=900;STARTUP_SECONDS=180;FINISH_SECONDS=180
CAL_T=2.201;GATE_NS=100;BENEFIT_NS=500;ALPHA=.05
SCOPE=('Finite pooled132-bank/eight-family native complete32/64-byte FINISH+reset mechanism and '
       'load/init attribution only. Public N/S, stock-relative, fresh, boundary, ordinary/long, '
       'Java/JNI/intrinsic and shipping qualification remain unresolved. Original run38712372600 '
       'remains failed23/60, unchanged. No offsets, row exclusions, CPU substitution or retries.')

class InvalidData(ValueError):pass
def require(x,message):
    if not x:raise InvalidData(message)
def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def dump(path,value):Path(path).write_text(json.dumps(value,indent=2,allow_nan=False)+'\n')
def factors(w):return dict(worker=w,replicate=w>>2,load_reverse=(w>>1)&1,init_reverse=w&1)
def spec():
    return json.loads(json.dumps(dict(version=VERSION,pin=PIN,ng=NG,patch_sha256=PATCH,pins_sha256=PINS,
        workers=[factors(w) for w in WORKERS],launch_order=LAUNCH_ORDER,blocks=BLOCKS,
        schedule_revision='cyclic-within-phase-cell-slot-balance-v1',
        worker_order_rule='rotate0..7 by block%8; reverse all post-phase orders only',
        position_balance='Each load/init cell visits each slot3 times per phase; each factor level6; each process has6 even and6 odd slots.',
        iterations=ITERATIONS,warm=WARM,quartets=2,timed_work_ids=[0,1],sizes=[32,64],
        arms=ARMS,control_names=NAMES,phase_rows=PHASE_ROWS,max_rows=MAX_ROWS,
        measurement_seconds=MEASUREMENT_SECONDS,startup_seconds=STARTUP_SECONDS,
        finish_seconds=FINISH_SECONDS,retries=0,gate_ns=GATE_NS,calibration_t=CAL_T,
        true_nulls=[0,1,2],treatments=[3,4],benefit_ns=BENEFIT_NS,
        calibration_rule='The original pooled abs(mean)+2.201*SEM<=100ns rule is retained. '
            'A new prospective order veto additionally requires the same bound for each '
            '12-observation ABBA and BAAB stratum. Neither changes the old run.',
        treatment_family=32,factorial_response_kind=3,factorial_family=6,
        factorial_units='8 independent process means; residual df4, not96 block observations',
        reference_rule='N/F is differing code/state, not a null. Its nominal100ns equivalence '
            'band is always reported; failure bars baseline equivalence, not the distinct F/U '
            'mechanism contrast. Public API qualification is always false in this scope.',
        clock_observations=dict(types=['mono_pair','legacy_nested','empty_batch'],
            records=288,collection='all8 workers before the first pre-control in every block',
            subtraction=False,wall_scope='one outer MONOTONIC pair, CPU reads outside',
            cpu_scope='enclosing CPU pair includes MONOTONIC reads; diagnostic only'),
        scope=SCOPE)))
def fingerprint():return hashlib.sha256(json.dumps(spec(),sort_keys=True,separators=(',',':')).encode()).hexdigest()
def schedule():
    rows=[]
    for phase in [1,2,3]:
        for block in range(BLOCKS):
            order=WORKERS[block%8:]+WORKERS[:block%8]
            if phase==3:order.reverse()
            for worker in order:
                works=[0,1] if (block+worker+phase)%2==0 else [1,0]
                for work in works:
                    kinds=[3,4] if phase==2 else [(block+worker+work+j)%3 for j in range(3)]
                    if phase==2 and (block+worker+work)%2:kinds.reverse()
                    for kind in kinds:
                        for q in range(2):
                            labels=[0,1,1,0] if (block+worker+q)%2==0 else [1,0,0,1]
                            for pos,label in enumerate(labels):
                                rows.append(dict(zip(FIELDS,[len(rows),worker,phase,block,work,kind,q,pos,label,ARMS[kind][label],(128*block+8*q)%256])))
    require(len(rows)==MAX_ROWS,'plan length')
    return rows
def schedule_bytes():
    out=io.StringIO();w=csv.DictWriter(out,fieldnames=FIELDS,delimiter='\t',lineterminator='\n')
    w.writeheader();w.writerows(schedule());return out.getvalue().encode()
def validate_schedule(rows):
    require(rows==schedule(),'schedule is not the exact frozen12288-row plan')
    require(hashlib.sha256(schedule_bytes()).hexdigest()==SCHEDULE_SHA,'schedule fingerprint')
    position_balance(rows,[1,2,3])
def position_balance(rows,phases):
    """Exact per-phase cell/slot and factor/parity audit; no measured values used."""
    audit=[]
    for phase in phases:
        worker_counts={w:[0]*8 for w in WORKERS}
        cell_counts={(l,a):[0]*8 for l in [0,1] for a in [0,1]}
        level_counts={(name,v):[0]*8 for name in ['load_reverse','init_reverse'] for v in [0,1]}
        orders=[]
        for b in range(BLOCKS):
            order=list(dict.fromkeys(r['worker'] for r in rows if r['phase']==phase and r['block']==b))
            require(len(order)==8 and set(order)==set(WORKERS),'incomplete serialized worker slots')
            orders.append(order)
            for slot,w in enumerate(order):
                f=factors(w);worker_counts[w][slot]+=1;cell_counts[f['load_reverse'],f['init_reverse']][slot]+=1
                for name in ['load_reverse','init_reverse']:level_counts[name,f[name]][slot]+=1
        require(all(v==[3]*8 for v in cell_counts.values()),'load/init cell-by-slot imbalance')
        require(all(v==[6]*8 for v in level_counts.values()),'factor-level slot imbalance')
        require(all(sum(v[::2])==sum(v[1::2])==6 for v in worker_counts.values()),'worker slot-parity imbalance')
        require(all(min(v)==1 and max(v)==2 and sorted(v)==[1]*4+[2]*4 for v in worker_counts.values()),'worker slot coverage imbalance')
        audit.append(dict(phase=phase,block_worker_orders=orders,worker_slot_counts=worker_counts,
            cell_slot_counts={f'L{l}A{a}':v for (l,a),v in cell_counts.items()},
            factor_slot_counts={f'{name}={v}':counts for (name,v),counts in level_counts.items()},
            worker_parity_counts={w:[sum(v[::2]),sum(v[1::2])] for w,v in worker_counts.items()},exact_balance=True))
    return audit

def pinned_inputs():
    """Canonical definitions and bytes, reconstructed solely from the reviewed pins."""
    path=Path(__file__).resolve().parent/'source-pins.json'
    require(sha(path)==PINS,'source pins changed')
    pins=json.loads(path.read_text());require(pins['head']==PIN and pins['ng']==NG and pins['patch_sha256']==PATCH,'source pin identifiers')
    originals=[];groups=[]
    for family in pins['tiny_families']:
        group=[]
        for bank in family['banks']:
            data=base64.b64decode(bank['base64'],validate=True)
            require(len(data)==64 and hashlib.sha256(data).hexdigest()==bank['sha256'],'pinned bank bytes')
            group.append(len(originals));originals.append(data)
        groups.append(group)
    require(len(originals)==132 and len(groups)==8,'canonical bank/family coverage')
    data=[(f'tiny{n}-{i}',v[:n]) for n in [32,64] for i,v in enumerate(originals)]
    data += [('empty',b''),('fallback65',hashlib.shake_256(b'tiny-finish-v1:random:65').digest(65))]
    n=1048576;unit=b'alpha beta alpha gamma: the small bird crossed the garden. '
    data += [('long-text',(unit*((n+len(unit)-1)//len(unit)))[:n]),('long-random',hashlib.shake_256(b'tiny-finish-v1:random:1048576').digest(n))]
    definitions=[dict(id=i,name=name,bytes=len(value),sha256=hashlib.sha256(value).hexdigest()) for i,(name,value) in enumerate(data)]
    return definitions,[value for name,value in data],groups

def validate_manifest(manifest,root=None):
    require(manifest['protocol']==spec() and manifest['protocol_fingerprint']==fingerprint(),'manifest protocol changed')
    defs,data,groups=pinned_inputs()
    require(manifest['workloads']==workloads(groups),'canonical timed workload or untimed coverage changed')
    inputs=manifest['inputs'];require(len(inputs)==268,'canonical input coverage count')
    for actual,expected in zip(inputs,defs):
        require(set(actual)==set(expected)|{'path'} and {k:actual[k] for k in expected}==expected,'canonical input definition changed')
        require(isinstance(actual['path'],str) and Path(actual['path']).is_absolute(),'input path must be absolute')
        if root is not None:
            p=Path(root).resolve()/'inputs'/f"{expected['id']}.bin"
            require(actual['path']==str(p),'canonical input path changed')
            require(p.is_file() and not p.is_symlink() and p.stat().st_size==expected['bytes'] and sha(p)==expected['sha256'],'canonical input bytes changed')
    return defs
def workloads(groups):
    rings=[[base+groups[f][b%len(groups[f])] for b in range(32) for f in range(8)] for base in [0,132]]
    works=[]
    for name,section,life,banks in [('reuse32',0,0,rings[0]),('reuse64',0,0,rings[1]),('reuse0-eligible-boundary',0,0,[264]),('reuse65-full-fallback',0,0,[265]),('fresh32',0,1,rings[0]),('fresh64',0,1,rings[1]),('long-text-prefix64',0,2,[266]),('long-random-prefix64',0,2,[267]),('reset-only32',1,0,rings[0]),('reset-only64',1,0,rings[1])]:
        wi=len(works);long=life==2
        works.append(dict(id=wi,name=name,section=section,life=life,
            iterations=ITERATIONS if wi<2 else 8 if long else 128,
            warm=WARM if wi<2 else 1 if long else 8,quartets=1 if long else 2,banks=banks))
    for w in works[:2]:
        counts=[collections.Counter(w['banks'][(off+k)%256] for k in range(ITERATIONS)) for off in [0,8,128,136]]
        require(all(x==counts[0] for x in counts),'input multiset differs by order offset')
    return works
def write_plan(out,works=None,inputs=None,origin='NATIVE_MEASUREMENT'):
    out=Path(out);out.mkdir(parents=True,exist_ok=True)
    if inputs is None:
        definitions,data,groups=pinned_inputs()
        inputs=[dict(d,path=str(out.resolve()/'inputs'/f"{d['id']}.bin")) for d in definitions]
    b=schedule_bytes();require(hashlib.sha256(b).hexdigest()==SCHEDULE_SHA,'fixed schedule bytes')
    (out/'schedule.tsv').write_bytes(b)
    m=dict(protocol=spec(),protocol_fingerprint=fingerprint(),schedule_sha256=SCHEDULE_SHA,
           record_origin=origin,workloads=works or [],inputs=inputs or [],scope=SCOPE)
    dump(out/'manifest.json',m);return m
