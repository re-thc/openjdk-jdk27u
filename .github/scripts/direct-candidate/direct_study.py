"""Plan by default. Full campaign requires a separately approved fresh tag event."""
from pathlib import Path
import argparse,importlib.util,json,os,resource,shutil,subprocess,sys,time
sys.dont_write_bytecode=True
import direct_protocol as P
import direct_score as S
import build_support
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('legacy_preparation',HERE.parent/'reset-only/reset-study.py');L=importlib.util.module_from_spec(spec);spec.loader.exec_module(L)
PipePeer,DeadlineExpired,remaining=L.PipePeer,L.DeadlineExpired,L.remaining

def authorize(env,event,head):
    P.require(env.get('GITHUB_ACTIONS')=='true' and env.get('GITHUB_EVENT_NAME')=='push','approved tag push only')
    P.require(env.get('GITHUB_REPOSITORY')==event['repository']['full_name']=='re-thc/openjdk-jdk27u','repository')
    P.require(env.get('GITHUB_REF_TYPE')=='tag' and env.get('GITHUB_REF')==event['ref']=='refs/tags/'+P.TAG and env.get('GITHUB_RUN_ATTEMPT')=='1','one fixed tag/attempt')
    P.require(event.get('created') is True and event.get('deleted') is False and event.get('forced') is False and event.get('before')=='0'*40,'fresh lightweight tag only')
    P.require(len(head)==40 and all(c in '0123456789abcdef' for c in head) and env.get('GITHUB_SHA')==head==event.get('after'),'exact checkout/event SHA')
    return dict(repository=env['GITHUB_REPOSITORY'],tag=P.TAG,commit=head,run_id=env.get('GITHUB_RUN_ID'),attempt=1,guard='Verify tag absent before approved creation; leave tag intact. Never delete/recreate to retry.')

def prepare(a):
    out=L.prepare(a);past=out/'preparation';past.mkdir()
    for n in ['manifest.json','schedule.tsv','workloads.tsv','preregistered.json','launch.json','identities.json']:shutil.move(out/n,past/n)
    shutil.move(out/'source',out/'legacy-source');P.write_plan(out,'NATIVE_MEASUREMENT');inputs,profiles,data=P.canonical(out)
    for x,b in zip(inputs,data):
        p=Path(x['path'])
        if p.exists():P.require(p.read_bytes()==b,'existing pinned input changed')
        else:p.write_bytes(b)
    (out/'source').mkdir()
    for n in P.SOURCES:shutil.copyfile(HERE/n,out/'source'/n)
    shutil.copyfile(HERE.parents[1]/'workflows/tiny-zlib-direct-ns.yml',out/'source/tiny-zlib-direct-ns.yml')
    P.dump(out/'preregistered.json',dict(manifest=P.sha(out/'manifest.json'),before_build=True,sources={str(p.relative_to(out)):P.sha(p) for top in ['source','legacy-source'] for p in (out/top).iterdir() if p.is_file()}))
    build_support.complete(out,HERE)
    P.dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for top in ['source','legacy-source','inputs','build'] for p in (out/top).rglob('*') if p.is_file()})
    return out

def coordinate(out,factory,scorer=S,clock=time.monotonic):
    out=Path(out);peers={};count=0;status={}
    def event(name,**data):
        with (out/'coordination.jsonl').open('a') as f:f.write(json.dumps(dict(event=name,monotonic_seconds=clock(),**data))+'\n')
    try:
        before=scorer.inventory(out);P.dump(out/'provenance-before.json',before);startup=clock()+180
        for w in P.B.LAUNCH_ORDER:remaining(startup,clock);peers[w]=factory(w)
        for w in P.B.LAUNCH_ORDER:peers[w].expect(f'READY {w}',startup)
        remaining(startup,clock);start=clock();deadline=start+900;event('MEASUREMENT_START',cap_seconds=900)
        for cmd in P.plans()[2]:
            remaining(deadline,clock);peer=peers[cmd['worker']];i=cmd['command'];peer.send(f'X {i}\n',deadline);peer.expect(f'DONE {i}',deadline);remaining(deadline,clock)
            if cmd['opcode']==2:count+=1
            if i%6==5:event('QUARTET_COMPLETE',episode=cmd['episode'],rows=count)
        remaining(deadline,clock);elapsed=clock()-start;event('MEASUREMENT_COMPLETE',rows=count,seconds=elapsed);finish=clock()+180
        for w in P.B.LAUNCH_ORDER:peers[w].send('Q\n',finish)
        for w in P.B.LAUNCH_ORDER:peers[w].expect(f'QUIT {w}',finish);peers[w].finish(finish)
        after=scorer.inventory(out);P.require(after==before,'provenance changed');P.dump(out/'provenance-after.json',after)
        result=scorer.score(out);P.dump(out/'score.json',result);scorer.report(out,result)
        status=dict(status='DIRECT_COMPARISON_COMPLETE',record_origin=result['record_origin'],rows=count,measurement_seconds=elapsed,measurement_cap_seconds=900,retries=0,bounded_native_criteria_passed=result['bounded_native_criteria_passed'],shipping_qualified=False)
    except DeadlineExpired as e:status=dict(status='INCOMPLETE_TIMEOUT',rows=count,error=str(e),retries=0)
    except (P.InvalidData,OSError,ValueError,KeyError,TypeError) as e:status=dict(status='INVALID_DATA_OR_PROTOCOL',rows=count,error=repr(e),retries=0)
    finally:
        for peer in peers.values():peer.close()
        if status:P.dump(out/'status.json',status)
    return status

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--root',type=Path);parser.add_argument('--out',type=Path,required=True);parser.add_argument('--execute-once',action='store_true');a=parser.parse_args()
    if not a.execute_once:
        P.require(not a.out.exists() or not any(a.out.iterdir()),'fresh plan only');P.write_plan(a.out);print('PLAN ONLY: 28160 rows, 9 resident processes, 900-second cap; no native execution.');return 0
    P.require(a.root is not None,'root required');e=json.loads(Path(os.environ['GITHUB_EVENT_PATH']).read_text());head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=a.root,text=True).strip();receipt=authorize(os.environ,e,head)
    L.claim_once(a.out,os.environ);resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    try:
        out=prepare(a);P.dump(out/'approved-publication.json',receipt);os.sched_setaffinity(0,{json.loads((out/'environment.json').read_text())['cpu_pin']});launch=json.loads((out/'launch.json').read_text())
        P.require(not (out/'coordination.jsonl').exists(),'attempt already started');status=coordinate(out,lambda w:PipePeer([*launch['basecmd'],str(w),P.VERSION],out/f'worker-{w}-stderr.log'))
    except Exception as e:P.dump(a.out/'status.json',dict(status='PREPARATION_FAILED_NO_MEASUREMENT',error=repr(e),retries=0));raise
    return 0 if status['status']=='DIRECT_COMPARISON_COMPLETE' else 2
if __name__=='__main__':raise SystemExit(main())
