"""Local untimed validation only. Does not call the 24-fork cohort runner."""
import argparse
import json
from pathlib import Path
import subprocess
import tempfile
import shutil

from collect import command, one_fork, bounded_summary
from prepare import preflight, check_context, compile_payload, native_hashes, sha, save
from verify import verify, Invalid

def validation(jdk,out):
    preflight(out)
    modes=check_context(out)
    (out/'images').mkdir();(out/'images/base').symlink_to(jdk,target_is_directory=True)
    image=out/'images/base'
    before=native_hashes(image)
    save(out/'local-image.json',dict(native_hashes=before,modules_sha256=sha(image/'lib/modules'),
                                    scope='Frozen local baseline image, untimed integration only'))
    compile_payload(image,out)
    tests=[('selected',modes),('phase-only',dict(pc=False,pmu=False))]
    summaries=[]
    exports=[s.split() for s in (out/'native-symbols.log').read_text().splitlines() if s.split() and s.split()[-1]=='id_i']
    assert len(exports)==1
    for name,mode in tests:
        directory=out/('untimed-'+name);directory.mkdir()
        save(directory/'native-identity.json',dict(path=str((out/'libprobe.so').resolve()),sha256=sha(out/'libprobe.so'),
             symbol='id_i',symbol_offset=hex(int(exports[0][0],16)),symbol_size=int(exports[0][1],16)))
        one_fork(command(out,directory,mode,untimed=True,count=250_000),directory)
        result=verify(directory,250_000,timed=False,pc=mode['pc'],pmu=mode['pmu'])
        save(directory/'verified.json',result)
        summaries.append(dict(name=name,**bounded_summary(result)))
    # Loss and mandatory-schema failures are injected into copied evidence, never
    # into a physical measurement stream. Every rejected copy stays temp-only.
    mutations=[('event_loss',lambda a:a[0].update(event_loss=1)),
               ('pc_loss',lambda a:a[0].update(pc_loss=1)),
               ('code_loss',lambda a:a[0].update(code_loss=1)),
               ('metadata_loss',lambda a:a[0].update(metadata_errors=1)),
               ('missing_sample',lambda a:a.__delitem__(next(i for i,e in enumerate(a) if e.get('kind')==8))),
               ('chosen_mode_changed',lambda a:a[0].update(pc_selected=not modes['pc'])),
               ('bad_checksum',lambda a:next(e for e in a if e.get('kind')==8).update(checksum=0)),
               ('bad_code_offset',lambda a:next(e for e in a if e.get('code_size',0)>0).update(code_offset=2**60))]
    rejected=[]
    for label,mutate in mutations:
        with tempfile.TemporaryDirectory() as temp:
            target=Path(temp)/'synthetic';shutil.copytree(out/'untimed-selected',target)
            data=[json.loads(s) for s in (target/'events.jsonl').read_text().splitlines()];mutate(data)
            (target/'events.jsonl').write_text(''.join(json.dumps(r)+'\n' for r in data))
            try:verify(target,250_000,timed=False,pc=modes['pc'],pmu=modes['pmu'])
            except Invalid as exc:rejected.append(dict(fixture=label,error=str(exc)))
            else:raise AssertionError('Corrupt fixture accepted: '+label)
    fixture_run=subprocess.run(['python3',str(Path(__file__).with_name('test_diagnostic.py'))],capture_output=True,text=True)
    (out/'fixtures.stdout.txt').write_text(fixture_run.stdout)
    (out/'fixtures.stderr.txt').write_text(fixture_run.stderr)
    if fixture_run.returncode:raise RuntimeError('Unit fixtures failed')
    # Original root bytecode verified by compile_payload; native files and image
    # are hashed again after both untimed invocations.
    save(out/'native-after.json',native_hashes(image))
    if before!=native_hashes(image):raise RuntimeError('Local native image changed')
    summary=dict(scope='Untimed local integration and fixtures only; no acceptance timing or hosted run',
                 comparisons_executed=0,hosted_jvms=0,local_untimed_jvms=2,
                 summaries=summaries,rejected_corrupt_fixtures=rejected,unit_fixtures_passed=True,
                 hardware_pmu_live_validated=modes['pmu'],source_hashes={n:sha(Path(__file__).with_name(n)) for n in
                 ('trace_agent.c','Steady.java','Trace.java','verify.py','collect.py','prepare.py','test_diagnostic.py','validate_local.py')})
    save(out/'validation-summary.json',summary)
    print(json.dumps(dict(scope=summary['scope'],unit_fixtures_passed=True,corrupt_fixtures_rejected=len(rejected),
                         counts=[dict(name=s['name'],events=s['event_count'],pcs=s['pc_count'],code_bytes=s['code_bytes'],losses=s['losses'],origin_bounds=s['origin_bounds']) for s in summaries])),flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--jdk',required=True);p.add_argument('--output',required=True)
    args=p.parse_args();validation(Path(args.jdk).resolve(),Path(args.output).resolve())
