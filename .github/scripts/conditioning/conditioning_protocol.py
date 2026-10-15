"""Fixed null-only conditioning diagnosis. Pure planning; default never executes native code."""
from pathlib import Path
import collections,csv,hashlib,io,json,sys
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent/'reset-only'))
import reset_protocol as B
VERSION='conditioning-null-v1'
PIN=B.PIN;NG=B.NG;PATCH=B.PATCH;PINS=B.PINS
require=B.require;InvalidData=B.InvalidData;sha=B.sha;dump=B.dump
WORKERS=list(range(8));BLOCKS=64;WARM=[256,3328];TIMED=512;PREDECESSOR=3072
MASKS=[0,7,3,4,5,2,6,1]
MAX_ROWS=16384;MAX_EPISODES=4096;MAX_COMMANDS=24576
MEASUREMENT_SECONDS=900;STARTUP_SECONDS=180;FINISH_SECONDS=180
CAL_T=2.201;GATE_NS=100;RESIDUAL_MARGIN_NS=25;FAMILY=48
EPISODE_FIELDS=['episode','block','worker','companion','worker_slot','time_slot','work','condition','warm','order']
ROW_FIELDS=['seq','episode','block','worker','worker_slot','time_slot','work','condition','warm','order','position','label']
COMMAND_FIELDS=['command','worker','opcode','episode','row']
SOURCE_NAMES=['conditioning_protocol.py','conditioning_driver.c','conditioning_study.py','conditioning_score.py','test_conditioning.py']
SCOPE='Null-only setup diagnosis. No backend treatment, stock-relative, Java, PR6 or shipping qualification. Both fixed conditioning counts are retained regardless of100ns results. No adaptive warmup/exclusions/retries.'
def spec():
    return dict(version=VERSION,pin=PIN,ng=NG,patch_sha256=PATCH,pins_sha256=PINS,
      workers=8,coordinator=1,maximum_resident_processes=9,blocks=BLOCKS,warm_counts=WARM,
      timed_operations=TIMED,predecessor_operations=PREDECESSOR,sizes=[32,64],
      episodes=MAX_EPISODES,rows=MAX_ROWS,commands=MAX_COMMANDS,clock_rows=3*MAX_EPISODES,
      measurement_seconds=900,startup_seconds=180,finish_seconds=180,retries=0,
      design='block=8*group+worker_rotation; episode_mask=[0,7,3,4,5,2,6,1][group]; combo=time_slot XOR mask, bits=size,count,order. Full8x8 crossing; main factors and count*order are balanced against linear block time.',
      entry='Before EVERY quartet: target clock probes+full logical reset; fixed companion(target+4)%8 runs3072 opposite-size N finish/reset operations in canonical ring order; target then receives four M commands.',
      bookkeeping='Every M: resource snapshot; warm CPU0/MONO0, fixed warm loop,MONO1/CPU1; resource snapshot; timed CPU0/MONO0,512 operations,MONO1/CPU1; resource snapshot; verify/inflate/write/flush; ACK. Identical placement for both orders/counts.',
      inputs='Same pinned132 banks/eight equal families. Full256-entry ring; constant phase0 for every warm/timed/predecessor loop. Each warm covers1 or13 rings; timing2; predecessor12. No bank phase factor.',
      null='All labels call the same unchanged N deflate/reset entry, exact stream/state/output. Labels never select code.',
      analysis=dict(observations=64,df=63,primary_family=FAMILY,
        order_component='B_h=(delta_ABBA-delta_BAAB)/2 per block',
        conditioning_effect='R=B_short-B_long, paired within worker/block/size',
        intervals='One simultaneous95% Bonferroni family of16 R and32 B intervals;64 block units,df63.',
        residual_margin_ns=RESIDUAL_MARGIN_NS,
        diagnostic_rule='Report reduction if R lower bound>0 and B_short lower bound>0. Call residual small only if B_long simultaneous CI is inside+-25ns. This diagnostic margin is5% of the prior500ns benefit target and is not a replacement gate or backend qualification.',
        legacy_gate='Report unchanged abs(mean)+2.201*SEM<=100ns for pooled and each order, with64 block observations.2.201 is retained conservatively, not relabeled the df63 nominal95% quantile. It never stops this null-only protocol.'),scope=SCOPE)
def fingerprint():return hashlib.sha256(json.dumps(spec(),sort_keys=True,separators=(',',':')).encode()).hexdigest()
def plans():
    episodes=[];rows=[];commands=[]
    for block in range(BLOCKS):
      shift=block%8;mask=MASKS[block//8];order=WORKERS[shift:]+WORKERS[:shift]
      for slot,worker in enumerate(order):
       for time_slot in range(8):
        combo=time_slot^mask;work=combo&1;condition=(combo>>1)&1;label_order=(combo>>2)&1
        episode=len(episodes);ep=dict(zip(EPISODE_FIELDS,[episode,block,worker,(worker+4)%8,slot,time_slot,work,condition,WARM[condition],label_order]));episodes.append(ep)
        commands.append(dict(zip(COMMAND_FIELDS,[len(commands),worker,0,episode,-1])))
        commands.append(dict(zip(COMMAND_FIELDS,[len(commands),(worker+4)%8,1,episode,-1])))
        for pos,label in enumerate([0,1,1,0] if label_order==0 else [1,0,0,1]):
         seq=len(rows);rows.append(dict(zip(ROW_FIELDS,[seq,episode,block,worker,slot,time_slot,work,condition,WARM[condition],label_order,pos,label])))
         commands.append(dict(zip(COMMAND_FIELDS,[len(commands),worker,2,episode,seq])))
    require((len(episodes),len(rows),len(commands))==(MAX_EPISODES,MAX_ROWS,MAX_COMMANDS),'fixed plan dimensions')
    return episodes,rows,commands
def tsv(rows,fields):
    f=io.StringIO();w=csv.DictWriter(f,fieldnames=fields,delimiter='\t',lineterminator='\n');w.writeheader();w.writerows(rows);return f.getvalue().encode()
def balance(episodes):
    expected=plans()[0];require(episodes==expected,'episode plan changed')
    # Every complete factor combination occupies every GLOBAL time slot for each worker.
    joint=collections.Counter((e['worker'],e['worker_slot'],e['time_slot'],e['work'],e['condition'],e['order']) for e in episodes)
    require(len(joint)==8*8*8*8 and set(joint.values())=={1},'worker/global-slot/full-factor crossing')
    per_block=collections.Counter((e['worker'],e['block'],e['work'],e['condition'],e['order']) for e in episodes)
    require(len(per_block)==8*64*8 and set(per_block.values())=={1},'all combinations in every worker/block')
    by_position=collections.defaultdict(list)
    for e in episodes:by_position[e['worker'],e['worker_slot'],e['time_slot']].append(e)
    for worker in WORKERS:
      for slot in range(8):
       for time_slot in range(8):
        es=by_position[worker,slot,time_slot]
        for factor in ['work','condition','order','count_order']:
         values=[(e['block'],(e['condition']^e['order']) if factor=='count_order' else e[factor]) for e in es]
         require(sum(b for b,v in values if v==0)==sum(b for b,v in values if v==1),'linear-time factor alias')
    return dict(exact_full_factor_crossing=True,joint_cells=len(joint),observations_per_joint_cell=1,
      factor_levels_at_each_worker_global_slot_time_slot=4,all_combinations_in_every_worker_block=True,
      main_and_count_order_factors_linear_block_time_balanced=True,
      limit='Arbitrary time-varying position interactions and hardware causes are not identified by a finite fixed schedule.')
def canonical(out):
    definitions,data,groups=B.pinned_inputs();legacy=B.workloads(groups)
    inputs=[dict(x,path=str(Path(out).resolve()/'inputs'/f"{x['id']}.bin")) for x in definitions]
    works=[dict(id=i,bytes=32 if i==0 else 64,banks=legacy[i]['banks']) for i in [0,1]]
    for w in works:
      for count in [256,3328,512,3072]:
        require(collections.Counter(w['banks'][j%256] for j in range(count))==collections.Counter({k:v*(count//256) for k,v in collections.Counter(w['banks']).items()}),'complete ring coverage')
    return inputs,works,data
def write_plan(out,origin='PLAN_ONLY_NOT_MEASURED'):
    out=Path(out).resolve();out.mkdir(parents=True,exist_ok=True);eps,rows,cmd=plans();inputs,works,data=canonical(out)
    files={'episodes.tsv':tsv(eps,EPISODE_FIELDS),'rows.tsv':tsv(rows,ROW_FIELDS),'commands.tsv':tsv(cmd,COMMAND_FIELDS)}
    for name,b in files.items():(out/name).write_bytes(b)
    m=dict(protocol=spec(),protocol_fingerprint=fingerprint(),record_origin=origin,inputs=inputs,workloads=works,
      plan_hashes={k:hashlib.sha256(v).hexdigest() for k,v in files.items()},balance=balance(eps),scope=SCOPE)
    dump(out/'manifest.json',m);return m
def validate_manifest(m,root=None):
    require(m['protocol']==spec() and m['protocol_fingerprint']==fingerprint(),'protocol changed')
    require(m['record_origin'] in ['PLAN_ONLY_NOT_MEASURED','SYNTHETIC_UNIT_TEST','NATIVE_MEASUREMENT'],'record origin')
    inputs,works,data=canonical(root or '/SYNTHETIC')
    require(m['workloads']==works,'canonical workload coverage')
    require(len(m['inputs'])==268,'canonical input count')
    for actual,expected in zip(m['inputs'],inputs):
      require(set(actual)==set(expected) and all(actual[k]==expected[k] for k in expected if k!='path'),'canonical input definition')
      require(Path(actual['path']).is_absolute(),'input path')
      if root is not None:
        require(actual==expected,'canonical input path');p=Path(expected['path'])
        require(p.is_file() and p.stat().st_size==expected['bytes'] and sha(p)==expected['sha256'],'canonical input bytes')
    eps,rows,cmd=plans();hashes={name:hashlib.sha256(tsv(values,fields)).hexdigest() for name,values,fields in [('episodes.tsv',eps,EPISODE_FIELDS),('rows.tsv',rows,ROW_FIELDS),('commands.tsv',cmd,COMMAND_FIELDS)]}
    require(m['plan_hashes']==hashes and m['balance']==balance(eps),'plan hashes/balance')
    if root is not None:
      for name,h in hashes.items():require(sha(Path(root)/name)==h,'plan bytes changed')
