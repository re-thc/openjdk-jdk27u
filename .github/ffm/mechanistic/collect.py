"""One bounded unchanged-image cohort. Inert unless --execute-mechanistic given."""
import argparse
import collections
import json
import math
import os
from pathlib import Path
import random
import statistics
import subprocess
import time

from prepare import check_context, native_hashes, save, sha
from verify import verify

PAYLOAD=Path(__file__).resolve().parent

def fixed_plan():
    rng=random.Random(20261016);plan=[]
    for block in range(12):
        labels=['base','control'];rng.shuffle(labels)
        start=len(plan)
        plan.extend(dict(index=start+i,block=block,label=label) for i,label in enumerate(labels))
    return plan

def gates(rows):
    results=[];rng=random.Random(20261016)
    for metric in ('wall_ns','cpu_ns'):
        paired=[]
        for block in range(12):
            pair={r['label']:r for r in rows if r['block']==block}
            if set(pair)!={'base','control'}:raise ValueError('Incomplete fixed pairs')
            paired.append(math.log(statistics.median(pair['base']['metrics'][metric])/statistics.median(pair['control']['metrics'][metric])))
        boot=sorted(math.exp(math.fsum(rng.choices(paired,k=12))/12) for _ in range(10_000))
        ratio=math.exp(math.fsum(paired)/12);lo,hi=boot[250],boot[9750]
        results.append(dict(metric=metric,n=12,ratio=ratio,lo=lo,hi=hi,
                            pass_gate=.95<=ratio<=1.05 and .90<=lo<=hi<=1.10))
    return results

def command(out,directory,modes,untimed=False,count=1_000_000):
    return ['taskset','-c','0',str(out/'images/base/bin/java'),'-Xms128m','-Xmx128m',
            '-XX:-TieredCompilation','-Xbatch','--enable-native-access=ALL-UNNAMED',
            '-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation','-XX:LogFile='+str(directory/'hotspot.xml'),
            '-XX:ErrorFile='+str(directory/'hs_err_pid%p.log'),
            '-agentpath:'+str(out/'libtrace_agent.so')+'=out='+str(directory/'events.jsonl')+',pc='+str(int(modes['pc']))+',pmu='+str(int(modes['pmu'])),
            '-Dsteady.mode=unbound','-Dsteady.count='+str(count),'-Dsteady.warm=30','-Dsteady.samples=10',
            '-Dsteady.library='+str(out/'libprobe.so'),'-Dtrace.untimed='+str(untimed).lower(),'-cp',str(out/'classes'),'Steady']

def bounded_sampling(window):
    if window is None:return None
    result=dict(window);throttle=dict(window['throttling'])
    throttle['transitions_count']=len(throttle['transitions'])
    throttle['transitions']=throttle['transitions'][:8]
    throttle['reported_throttled_spans_count']=len(throttle['reported_throttled_spans'])
    throttle['reported_throttled_spans']=throttle['reported_throttled_spans'][:8]
    result['throttling']=throttle
    return result

def bounded_summary(verified):
    totals=collections.defaultdict(lambda:dict(wall_outer_ns=0,cpu_outer_ns=0,pcs=0,nvcsw=0,nivcsw=0))
    for row in verified['phases']:
        if row['phase']=='warm_set':continue # avoid counting warm set and its members twice
        t=totals[row['phase']]
        for k in ('wall_outer_ns','cpu_outer_ns','nvcsw','nivcsw'):t[k]+=row[k]
        t['pcs']+=row['pc_samples']
    pc_candidates=collections.Counter()
    for row in verified['phases']:
        if row['phase'] in ('warm','sample_outer'):
            pc_candidates.update(row['pc_candidates'])
    return dict(valid=verified['valid'],modes=verified['selected_modes'],origin_bounds=verified['origin_bounds'],
                event_count=verified['event_count'],pc_count=verified['pc_count'],code_bytes=verified['code_bytes'],
                losses=verified['losses'],phases=dict(totals),
                throttle_records_preserved=verified['throttle_records_preserved'],
                perf_control_count=len(verified['perf_controls']),perf_controls=verified['perf_controls'][:16],
                sampling_windows=[dict(w,outer=bounded_sampling(w['outer']),roi=bounded_sampling(w['roi'])) for w in verified['sampling_windows']],
                sampling_limit=verified['sampling_limit'],
                pc_mapping_candidates=dict(pc_candidates.most_common(10)),
                sample_endpoints=verified['sample_endpoints'],
                iterations=[dict(phase=r['phase'],index=r['index'],mono_bounds=r['mono_bounds'],
                                 wall_outer_ns=r['wall_outer_ns'],cpu_outer_ns=r['cpu_outer_ns'],
                                 nvcsw=r['nvcsw'],nivcsw=r['nivcsw'],boundary_cpus=r['boundary_cpus'],
                                 pcs=r['pc_samples'],**({'pmu':r['pmu']} if 'pmu' in r else {}))
                                 | ({'sampling':bounded_sampling(r['sampling'])} if r['phase']=='warm' else {})
                            for r in verified['phases'] if r['phase'] in ('warm','sample_outer')],
                root_compilations=[dict(compile_id=e['attributes']['compile_id'],kind=e['attributes'].get('compile_kind','normal'),
                                        entry=e['attributes']['entry'],bounds=e['mono_bounds']) for e in verified['root_compilation_events']])

def one_fork(argv,directory,launch=subprocess.run):
    save(directory/'argv.json',argv)
    start=time.monotonic_ns()
    timed_out=False
    try:
        with (directory/'stdout.txt').open('x') as stdout,(directory/'stderr.txt').open('x') as stderr:
            r=launch(argv,stdout=stdout,stderr=stderr,timeout=180,check=False)
        code=r.returncode
    except subprocess.TimeoutExpired:
        code=None;timed_out=True
    end=time.monotonic_ns()
    record=dict(driver_launch_monotonic=start,driver_return_monotonic=end,returncode=code,timeout=timed_out,
                interval='parent before subprocess creation through wait/close; not pure JVM startup')
    save(directory/'process.json',record)
    if timed_out or code!=0:raise RuntimeError('Fork failed; no retry or mode downgrade')
    return record

def execute(out,launch=subprocess.run):
    modes=check_context(out)
    protocol=json.loads((out/'protocol.json').read_text())
    plan=fixed_plan()
    if plan!=protocol['plan']:raise RuntimeError('Plan differs from reviewed protocol')
    image=json.loads((out/'image.json').read_text())
    jdk=out/'images/base'
    inputs={str(p.relative_to(out)):sha(p) for p in [out/'libprobe.so',out/'libtrace_agent.so',
            *sorted((out/'classes').glob('*.class'))]}
    save(out/'execution-inputs.json',inputs)
    exports=[line.split() for line in (out/'native-symbols.log').read_text().splitlines() if line.split() and line.split()[-1]=='id_i']
    if len(exports)!=1:raise RuntimeError('Native leaf export missing/ambiguous')
    symbol_offset=int(exports[0][0],16)
    if native_hashes(jdk)!=image['native_hashes'] or sha(jdk/'lib/modules')!=image['modules_sha256']:
        raise RuntimeError('Baseline image changed before cohort')
    cohort=out/'cohort';cohort.mkdir();save(cohort/'plan.json',plan)
    rows=[];status=dict(status='COLLECTING',shipping_qualified=False,comparison_limit=24,
                        retries=0,exclusions=0,modes=modes,completed=0)
    failure=None
    try:
        with (cohort/'forks.jsonl').open('x') as stream:
            for item in plan:
                directory=cohort/('%02d-%s'%(item['index'],item['label']));directory.mkdir()
                save(directory/'native-identity.json',dict(path=str((out/'libprobe.so').resolve()),
                     sha256=inputs['libprobe.so'],symbol='id_i',symbol_offset=hex(symbol_offset),symbol_size=int(exports[0][1],16)))
                proc=one_fork(command(out,directory,modes),directory,launch)
                evidence=verify(directory,1_000_000,timed=True,pc=modes['pc'],pmu=modes['pmu'])
                # Both labels use the same image; native/method identity is checked each fork.
                module=evidence['symbol_mapping']
                if Path(module['path']).resolve()!= (out/'libprobe.so').resolve():raise RuntimeError('Unexpected controlled symbol library')
                if int(module['symbol_file_offset'],16)!=symbol_offset:raise RuntimeError('Native leaf export offset mismatch')
                save(directory/'verified.json',evidence)
                row=dict(**item,process=proc,metrics=json.loads((directory/'stdout.txt').read_text()),
                         diagnostics=bounded_summary(evidence))
                rows.append(row);stream.write(json.dumps(row)+'\n');stream.flush()
                status['completed']=len(rows)
                print(json.dumps(dict(stage='fork',**row)),flush=True)
        status['gates']=gates(rows)
        status['status']='MECHANISTIC_CONTROLS_PASSED' if all(r['pass_gate'] for r in status['gates']) else 'DIAGNOSTIC_CONTROL_FAILURE'
    except Exception as exc:
        failure=exc;status.update(status='STOPPED_FORK_OR_EVIDENCE_FAILURE',reason=str(exc))
    finally:
        after=native_hashes(jdk)
        save(cohort/'native-after.json',after)
        status['native_hashes_unchanged']=after==image['native_hashes']
        status['modules_hash_unchanged']=sha(jdk/'lib/modules')==image['modules_sha256']
        status['execution_inputs_unchanged']=inputs=={name:sha(out/name) for name in inputs}
        if not status['native_hashes_unchanged'] or not status['modules_hash_unchanged'] or not status['execution_inputs_unchanged']:
            status['status']='IMAGE_CHANGED';failure=RuntimeError('Image changed')
        save(cohort/'status.json',status)
        print(json.dumps(dict(stage='cohort',**status)),flush=True)
    if failure:raise failure

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',required=True);p.add_argument('--execute-mechanistic',action='store_true');a=p.parse_args()
    if not a.execute_mechanistic:print(json.dumps(dict(executed=False,plan=fixed_plan(),comparison_limit=24)))
    else:execute(Path(a.output).resolve())
