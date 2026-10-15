"""Bounded local native correctness and synthetic-clock handlers, never a campaign."""
from pathlib import Path
import argparse,csv,hashlib,json,os,resource,subprocess,sys,time
sys.dont_write_bytecode=True
import direct_protocol as P
import direct_score as S
import direct_study as C
HERE=Path(__file__).resolve().parent

def validate(root,local):
    root=Path(root).resolve();local=Path(local).resolve();P.require(not root.exists(),'fresh local validation directory only');root.mkdir();(root/'build').mkdir()
    commands=[]
    def run(argv,name,env=None):
        commands.append(dict(argv=list(map(str,argv)),sanitizer={k:env[k] for k in ['ASAN_OPTIONS','UBSAN_OPTIONS']} if env else None));P.dump(root/'commands.json',commands)
        with (root/(name+'.log')).open('w') as f:subprocess.run(list(map(str,argv)),stdout=f,stderr=subprocess.STDOUT,env=env,check=True,timeout=180)
    env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1');cpu=max(os.sched_getaffinity(0));os.sched_setaffinity(0,{cpu});resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    data=root/'data';manifest=P.write_plan(data,'VALIDATION_ONLY_SYNTHETIC_CLOCK');inputs,profiles,bytes_=P.canonical(data);(data/'inputs').mkdir()
    for x,b in zip(inputs,bytes_):Path(x['path']).write_bytes(b)
    P.validate_manifest(manifest,data)
    stock=Path('/workspace/scratch/zlib-conditioning-local-validation-20261015/frozen/baseline/src/java.base/share/native/libzip/zlib');lib=local/'stock/libz.a'
    for name,src,wrapped in [('driver','direct_driver.c',False),('smoke','direct_driver.c',True),('reset-proof','reset_proof.c',False)]:
      for san in [False,True]:
        binary=root/'build'/(name+('-asan' if san else ''));flags=['-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined'] if san else ['-O2']
        run(['gcc-14','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stock,HERE/src,*flags,*([HERE/'synthetic_clock.c','-Wl,--wrap=clock_gettime'] if wrapped else []),lib,'-ldl','-o',binary],binary.name+'-build')
    baseline={};all_results=[]
    def refs_at(out,w):return {(p['id'],i):hashlib.sha256((out/f"compressed/w{w}-p{p['id']}-i{i}.bin").read_bytes()).hexdigest() for p in profiles for i in set(p['banks'])}
    for san,n,s,v in [(False,'N','S','V'),(True,'NA','SA','VA')]:
        suffix='-asan' if san else '';run([root/'build'/('reset-proof'+suffix),local/f'{n}/ng.so',local/f'{s}/ng.so',local/f'{v}/ng.so',root/('second-reset-proof'+suffix+'.json')],'second-reset-proof'+suffix,env if san else None)
        proof=json.loads((root/('second-reset-proof'+suffix+'.json')).read_text());P.require(proof['cases']==66 and proof['second_public_reset_full_every_case'],'real reset fallback proof')
        def argv(binary,out,w,commands_path):return [str(binary),str(local/f'{n}/ng.so'),str(local/f'{s}/ng.so'),str(data/'inputs.tsv'),str(data/'profiles.tsv'),str(data/'episodes.tsv'),str(commands_path),str(out),str(w),P.VERSION]
        out=root/('untimed'+suffix);out.mkdir();(out/'compressed').mkdir();run([*argv(root/'build'/('driver'+suffix),out,0,data/'commands.tsv'),'--untimed-only'],'untimed'+suffix,env if san else None)
        checks=json.loads((out/'worker-0-checks.json').read_text());P.require(checks==dict(worker=0,before_checks=1652,after_checks=1652,all_bytes_equal=True,batches=0,resets=0,prefixes=0),'untimed actual proof')
        if not baseline:baseline=refs_at(out,0)
        else:P.require(refs_at(out,0)==baseline,'normal/sanitized public bytes')
        eps,rows,plan=P.plans();selected=[];seen=set()
        for e in eps:
            key=e['phase'],e['worker'],e['work'],e['kind'],e['order']
            if e['worker'] in [0,3] and key not in seen:seen.add(key);selected.append(e['episode'])
        selected=set(selected);P.require(len(selected)==160,'bounded160 quartet smoke')
        modified=[dict(c,worker=c['worker'] if c['episode'] in selected else 1) for c in plan];path=data/('smoke-commands'+suffix+'.tsv');path.write_bytes(P.tsv(modified,P.CF));P.require(P.sha(path)!=manifest['hashes']['commands.tsv'],'smoke cannot be measurement plan')
        out=root/('smoke'+suffix);out.mkdir();(out/'compressed').mkdir();peers={};transcript=[];active=[0,3,4,5,6,7]
        oldenv=dict(os.environ)
        try:
            if san:os.environ.update(ASAN_OPTIONS=env['ASAN_OPTIONS'],UBSAN_OPTIONS=env['UBSAN_OPTIONS'])
            for w in active:peers[w]=C.PipePeer(argv(root/'build'/('smoke'+suffix),out,w,path),out/f'worker-{w}-stderr.log')
        finally:os.environ.clear();os.environ.update(oldenv)
        try:
            for w in active:peers[w].expect(f'READY {w}',time.monotonic()+90);transcript.append(dict(worker=w,received=f'READY {w}'))
            counts={w:[0,0,0] for w in active}
            for c in modified:
                if c['episode'] not in selected:continue
                w=c['worker'];cid=c['command'];peers[w].send(f'X {cid}\n',time.monotonic()+90);peers[w].expect(f'DONE {cid}',time.monotonic()+90);transcript.append(dict(worker=w,sent=f'X {cid}',received=f'DONE {cid}'));counts[w][c['opcode']]+=1
                P.require(len(S.read_csv(out/f'events-{w}.csv'))==sum(counts[w]),'events flushed before ACK')
                if c['opcode']==0:P.require(len(S.read_csv(out/f'clocks-{w}.csv'))==3*counts[w][0],'clocks flushed before ACK')
                if c['opcode']==2:P.require(len(S.read_csv(out/f'worker-{w}.csv'))==counts[w][2],'rows flushed before ACK')
            for w in active:peers[w].send('Q\n',time.monotonic()+90)
            for w in active:peers[w].expect(f'QUIT {w}',time.monotonic()+90);peers[w].finish(time.monotonic()+90);transcript.append(dict(worker=w,sent='Q',received=f'QUIT {w}'))
        finally:
            for peer in peers.values():peer.close()
        P.dump(out/'ACK-transcript.json',transcript);raw=[];events=[];clocks=[]
        for w in active:
            P.require(refs_at(out,w)==baseline,'all public bytes across workers/variants');proof=json.loads((out/f'worker-{w}-checks.json').read_text())
            P.require(proof==dict(worker=w,before_checks=1652,after_checks=1652,all_bytes_equal=True,batches=counts[w][2],resets=counts[w][0],prefixes=counts[w][1]),'smoke finalization proof')
            raw+=S.read_csv(out/f'worker-{w}.csv');events+=S.read_csv(out/f'events-{w}.csv');clocks+=S.read_csv(out/f'clocks-{w}.csv')
        raw.sort(key=lambda r:r['seq']);events.sort(key=lambda r:r['command']);expected_rows=[r for r in rows if r['episode'] in selected]
        P.require((len(raw),len(events),len(clocks))==(640,960,480),'bounded smoke output dimensions')
        row_command={c['row']:c['command'] for c in plan if c['opcode']==2};event_map={e['command']:e for e in events}
        for r,p in zip(raw,expected_rows):
            P.require(len(r)==54 and all(r[k]==v for k,v in p.items()),'actual54-column row/plan')
            profile=profiles[r['work']];warm=profiles[profile['warm_work']];w=r['worker'];a='N_' if r['arm']==0 else 'S_';meta=json.loads((out/f'worker-{w}-metadata.json').read_text())
            P.require(r['wall_ns']==r['warm_wall_ns']==1000 and r['cpu_ns']==r['warm_cpu_ns']==3000,'synthetic-clock-only values')
            P.require(r['command']==row_command[r['seq']],'row command ownership')
            for stem in ['', 'warm_']:
                P.require(r[stem+'wall_ns']==r[stem+'end_ns']-r[stem+'begin_ns'] and r[stem+'cpu_ns']==r[stem+'cpu_end_ns']-r[stem+'cpu_begin_ns'],'time columns')
            ev=event_map[r['command']]
            P.require(ev['begin_ns']<=r['warm_begin_ns']<r['warm_end_ns']<=r['begin_ns']<r['end_ns']<=ev['end_ns'],'wall nesting')
            P.require(ev['cpu_begin_ns']<=r['warm_cpu_begin_ns']<r['warm_cpu_end_ns']<=r['cpu_begin_ns']<r['cpu_end_ns']<=ev['cpu_end_ns'],'CPU nesting')
            P.require(r['stream']==meta[a+('fresh_stream' if profile['life']==1 else 'stream')] and r['state']>0,'actual public stream path')
            P.require(profile['life']==1 or r['state']==meta[a+'state'],'persistent state identity')
            P.require(r['def_entry']==meta[a+'def'] and r['reset_entry']==meta[a+'reset'] and r['output']==meta['output'],'actual public entries/output')
            lengths=lambda work:sum((out/f"compressed/w{w}-p{work['id']}-i{i}.bin").stat().st_size for i in work['banks'])
            P.require((r['operations'],r['warm_operations'],r['prep_operations'],r['warm_work'],r['bank_phase'])==(profile['iterations'],3328,profile['prep'],profile['warm_work'],0),'fixed operation columns')
            P.require((r['output_sum'],r['warm_sum'],r['prep_sum'])==(lengths(profile)*(profile['iterations']//len(profile['banks'])),lengths(warm)*(3328//len(warm['banks'])),lengths(profile)*(profile['prep']//len(profile['banks']))),'actual byte accounting')
            P.require(r['last_input']==profile['banks'][-1] and r['output_bytes']==(out/f"compressed/w{w}-p{profile['id']}-i{r['last_input']}.bin").stat().st_size,'final input/length')
            for pre in ['','w_']:
                for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']:P.require(r[pre+k]>=0,'resource column')
        for ev,c in zip(events,[c for c in plan if c['episode'] in selected]):
            P.require(len(ev)==14 and all(ev[k]==c[k] for k in ['command','worker','opcode','episode']),'actual14-column event/ACK mapping')
            P.require(ev['cpu_before']==ev['cpu_after']==cpu and ev['end_ns']>ev['begin_ns'],'event affinity/interval')
            e=eps[ev['episode']];work=(1 if e['phase']==3 else e['work']^1) if ev['opcode']==1 else e['work'];profile=profiles[work]
            ops=0 if ev['opcode']==0 else 3072 if ev['opcode']==1 else profile['iterations'];w=ev['worker']
            total=sum((out/f"compressed/w{w}-p{work}-i{i}.bin").stat().st_size for i in profile['banks'])*(ops//len(profile['banks']))
            P.require((ev['work'],ev['operations'],ev['output_sum'],ev['reset_calls'])==(work,ops,total,4 if ev['opcode']==0 else 0),'actual event recipe/output/two resets')
            P.require(ev['cpu_end_ns']>ev['cpu_begin_ns'],'event CPU interval')
        for eid in selected:
            cs=[c for c in clocks if c['episode']==eid];P.require([c['kind'] for c in cs]==['mono_pair','legacy_nested','empty_batch'],'actual clock handler order')
            for c in cs:
                ev=event_map[c['command']];P.require(c['worker']==ev['worker'] and c['command']==6*eid and c['operations']==(512 if c['kind']=='empty_batch' else 128),'clock command/recipe')
                P.require(ev['begin_ns']<=c['begin_ns']<c['end_ns']<=ev['end_ns'] and c['outer_wall_ns']==c['end_ns']-c['begin_ns'] and 0<=c['wall_ns']<=c['outer_wall_ns'] and c['cpu_ns']>0,'clock interval')
            P.require(all(a['end_ns']<=b['begin_ns'] for a,b in zip(cs,cs[1:])),'clock timestamps order')
        result=dict(origin='VALIDATION_ONLY_SYNTHETIC_CLOCK',quartets=160,rows=640,commands=960,clocks=480,all54_row_columns_checked=True,all_rows_flushed_before_ACK=True,public_bytes_match=True,second_reset_proven=True,all_phases_profiles_kinds_orders_covered=True,measurement_qualification=False,active_workers=active,target_workers=[0,3],inactive_owner=1)
        P.dump(out/'VALIDATION-NOT-MEASUREMENT.json',result);all_results.append(result)
    for name in ['N','S','SA']:
        symbols=subprocess.check_output(['nm','-D',local/name/'ng.so'],text=True);P.require('jdk_ng_test_' not in symbols and 'reset_control' not in symbols,'public library contains probe/wrapper');(root/f'public-symbols-{name}.txt').write_text(symbols)
    result=dict(status='LOCAL_VALIDATION_PASSED',cases=all_results,untimed_before_after_checks_each=3304,public_output_references=826,native_campaign=False,hosted_action=False,source_sha256=P.sha(HERE/'direct_driver.c'),backend_patch_sha256=P.PATCH)
    P.dump(root/'RESULT.json',result);print(json.dumps(result,indent=2));return result
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--out',type=Path,required=True);parser.add_argument('--local-libraries',type=Path,required=True);a=parser.parse_args();validate(a.out,a.local_libraries)
