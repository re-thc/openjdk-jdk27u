"""Plan only by default. The staged null-only native run requires separate approval."""
from pathlib import Path
import argparse,importlib.util,json,os,resource,shutil,subprocess,time
import conditioning_protocol as P
HERE=Path(__file__).resolve().parent
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
L=module('legacy_study',HERE.parent/'reset-only/reset-study.py')
PipePeer=L.PipePeer;DeadlineExpired=L.DeadlineExpired;remaining=L.remaining
TAG='diagnostic-tiny-zlib-conditioning-20261015-once'
def scorer():return module('conditioning_scorer',HERE/'conditioning_score.py')
def authorize(environment,event,head):
    e=environment;ref='refs/tags/'+TAG
    P.require(e.get('GITHUB_ACTIONS')=='true' and e.get('GITHUB_EVENT_NAME')=='push','approved tag push required')
    P.require(e.get('GITHUB_REPOSITORY')==event['repository']['full_name']=='re-thc/openjdk-jdk27u','repository mismatch')
    P.require(e.get('GITHUB_RUN_ATTEMPT')=='1' and e.get('GITHUB_REF_TYPE')=='tag' and e.get('GITHUB_REF')==event['ref']==ref,'one fixed tag/attempt only')
    P.require(event.get('created') is True and event.get('deleted') is False and event.get('forced') is False and event.get('before')=='0'*40,'fresh lightweight tag only')
    P.require(len(head)==40 and all(c in '0123456789abcdef' for c in head) and e.get('GITHUB_SHA')==head==event.get('after'),'checkout must equal event SHA')
    return dict(repository=e['GITHUB_REPOSITORY'],tag=TAG,commit=head,run_id=e.get('GITHUB_RUN_ID'),attempt=1,
      contract='Operational one-run guard. Verify absence before separately authorized creation; leave tag intact. Deletion/recreation requires separate authorization.')
def check_tag_absent():
    r=subprocess.run(['git','ls-remote','--exit-code','--refs','--tags','https://github.com/re-thc/openjdk-jdk27u.git','refs/tags/'+TAG],capture_output=True,text=True,timeout=30,env=dict(os.environ,GIT_TERMINAL_PROMPT='0'))
    P.require(r.returncode==2 and not r.stdout.strip(),'tag exists or absence query failed; never delete/recreate to retry')
    return dict(tag=TAG,absent=True,creation_authorized=False)
def prepare(a):
    """Reuse frozen build/correctness preparation; its timed coordinator is NEVER called."""
    out=L.prepare(a);past=out/'preparation';past.mkdir()
    for name in ['manifest.json','schedule.tsv','workloads.tsv','preregistered.json','launch.json','identities.json']:
      shutil.move(out/name,past/name)
    shutil.move(out/'source',out/'legacy-source')
    P.write_plan(out,'NATIVE_MEASUREMENT');m=json.loads((out/'manifest.json').read_text())
    (out/'workloads.tsv').write_text(''.join(f"{w['id']}\t"+','.join(map(str,w['banks']))+'\n' for w in m['workloads']))
    (out/'source').mkdir()
    for name in P.SOURCE_NAMES:shutil.copyfile(HERE/name,out/'source'/name)
    shutil.copyfile(HERE.parents[1]/'workflows/tiny-zlib-conditioning.yml',out/'source/tiny-zlib-conditioning.yml')
    sources={str(p.relative_to(out)):P.sha(p) for top in ['source','legacy-source'] for p in (out/top).iterdir() if p.is_file()}
    P.dump(out/'preregistered.json',dict(manifest_sha256=P.sha(out/'manifest.json'),sources=sources,frozen_before_conditioning_build=True))
    stock=out/'baseline/src/java.base/share/native/libzip/zlib';lib=out/'build/stock/libz.a';commands=[]
    def run(argv,log,env=None):
      commands.append(dict(argv=list(map(str,argv)),environment={k:env.get(k) for k in ['ASAN_OPTIONS','UBSAN_OPTIONS']} if env else None))
      P.dump(out/'conditioning-build-commands.json',commands)
      with (out/log).open('w') as f:subprocess.run(list(map(str,argv)),stdout=f,stderr=subprocess.STDOUT,cwd=out,env=env,check=True)
    driver=out/'build/conditioning-driver';common=['gcc-14','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stock,out/'source/conditioning_driver.c',lib,'-ldl']
    run([*common,'-O2','-o',driver],'build/conditioning-driver.log')
    asan=out/'build/conditioning-driver-asan';run([*common,'-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined','-o',asan],'build/conditioning-driver-asan.log')
    base=[str(driver),str(out/'build/N/ng.so'),str(out/'inputs.tsv'),str(out/'workloads.tsv'),str(out/'episodes.tsv'),str(out/'commands.tsv'),str(out)]
    for worker in P.WORKERS:
      tmp=out/f'untimed-conditioning-{worker}';tmp.mkdir();(tmp/'compressed').mkdir();cmd=base.copy();cmd[6]=str(tmp)
      run([*cmd,str(worker),P.VERSION,'--untimed-only'],f'untimed-conditioning-{worker}.log')
    tmp=out/'untimed-conditioning-asan';tmp.mkdir();(tmp/'compressed').mkdir();cmd=base.copy();cmd[0]=str(asan);cmd[1]=str(out/'build/NA/ng.so');cmd[6]=str(tmp)
    run([*cmd,'0',P.VERSION,'--untimed-only'],'untimed-conditioning-asan.log',dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1'))
    P.dump(out/'launch.json',dict(basecmd=base))
    P.dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for top in ['source','legacy-source','inputs','build'] for p in (out/top).rglob('*') if p.is_file()})
    return out
def coordinate(out,factory,score,clock=time.monotonic):
    out=Path(out);peers={};completed=0;status={}
    def event(name,**kw):
      with (out/'coordination.jsonl').open('a') as f:f.write(json.dumps(dict(event=name,monotonic_seconds=clock(),**kw))+'\n')
    try:
      before=score.inventory(out);P.dump(out/'provenance-before.json',before);event('PROVENANCE_BEFORE')
      startup=clock()+P.STARTUP_SECONDS
      for w in P.B.LAUNCH_ORDER:remaining(startup,clock);peers[w]=factory(w)
      for w in P.B.LAUNCH_ORDER:peers[w].expect(f'READY {w}',startup)
      remaining(startup,clock);start=clock();deadline=start+P.MEASUREMENT_SECONDS;event('MEASUREMENT_START',cap_seconds=900)
      for command in P.plans()[2]:
        remaining(deadline,clock);w=command['worker'];cid=command['command']
        peers[w].send(f'X {cid}\n',deadline);peers[w].expect(f'DONE {cid}',deadline);remaining(deadline,clock)
        if command['opcode']==2:completed+=1
        if cid%6==5:event('QUARTET_COMPLETE',episode=command['episode'],rows=completed)
      remaining(deadline,clock);elapsed=clock()-start;event('MEASUREMENT_COMPLETE',rows=completed,seconds=elapsed)
      finish=clock()+P.FINISH_SECONDS
      for w in P.B.LAUNCH_ORDER:peers[w].send('Q\n',finish)
      for w in P.B.LAUNCH_ORDER:peers[w].expect(f'QUIT {w}',finish);peers[w].finish(finish)
      after=score.inventory(out);P.require(after==before,'artifact changed during run');P.dump(out/'provenance-after.json',after)
      result=score.score(out);P.dump(out/'score.json',result);score.report(out,result)
      status=dict(status='NULL_DIAGNOSIS_COMPLETE',record_origin=result['record_origin'],rows=completed,measurement_seconds=elapsed,measurement_cap_seconds=900,
        failed_legacy_controls=result['failed_legacy_controls'],diagnostic_support_count=result['diagnostic_support_count'],
        no_treatment_phase=True,backend_performance_qualified=False,retries=0)
    except DeadlineExpired as e:status=dict(status='INCOMPLETE_TIMEOUT',rows=completed,error=str(e),retries=0)
    except (P.InvalidData,OSError,ValueError,KeyError,TypeError) as e:status=dict(status='INVALID_DATA_OR_PROTOCOL',rows=completed,error=type(e).__name__+': '+str(e),retries=0)
    finally:
      for peer in peers.values():peer.close()
      if status:P.dump(out/'status.json',status)
    return status
def execute(out):
    out=Path(out).resolve();P.require((out/'STARTED').is_file() and not (out/'coordination.jsonl').exists(),'single run already claimed/started')
    env=json.loads((out/'environment.json').read_text());os.sched_setaffinity(0,{env['cpu_pin']})
    launch=json.loads((out/'launch.json').read_text());return coordinate(out,lambda w:PipePeer([*launch['basecmd'],str(w),P.VERSION],out/f'worker-{w}-stderr.log'),scorer())
def main():
    p=argparse.ArgumentParser();p.add_argument('--root',type=Path);p.add_argument('--out',type=Path)
    mode=p.add_mutually_exclusive_group();mode.add_argument('--execute-once',action='store_true');mode.add_argument('--check-tag-absent',action='store_true');a=p.parse_args()
    if a.check_tag_absent:print(json.dumps(check_tag_absent()));return 0
    P.require(a.out is not None,'--out required')
    if not a.execute_once:
      P.require(not a.out.exists() or not any(a.out.iterdir()),'fresh plan directory only');P.write_plan(a.out);print('PLAN_ONLY:8 workers+coordinator;16384 rows;900s maximum; no native build/execution.');return 0
    P.require(a.root is not None,'--root required');event=json.loads(Path(os.environ['GITHUB_EVENT_PATH']).read_text())
    head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=a.root,text=True).strip();publication=authorize(os.environ,event,head)
    L.claim_once(a.out,os.environ);resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    try:out=prepare(a);P.dump(out/'approved-publication.json',publication);status=execute(out)
    except Exception as e:P.dump(a.out/'status.json',dict(status='PREPARATION_FAILED_NO_MEASUREMENT',error=repr(e),retries=0));raise
    return 0 if status['status']=='NULL_DIAGNOSIS_COMPLETE' else 2
if __name__=='__main__':raise SystemExit(main())
