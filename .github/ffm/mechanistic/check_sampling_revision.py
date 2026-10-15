"""Offline synthetic validation of the sampling revision. Never launches a JVM/perf."""
import argparse
import json
from pathlib import Path
import shutil
import tempfile

from verify import verify, perf_stream

def check(source, native_records):
    native=[json.loads(s) for s in Path(native_records).read_text().splitlines()]
    pcs=[e for e in native if e['record']=='pc']
    controls=[e for e in native if e['record']=='perf_control']
    assert perf_stream(native[0],native[-1],pcs,controls)
    assert [(e['type'],e['time'],e['id'],e['stream_id']) for e in controls]==[
        (5,100,'0x1122334455667788','0x8877665544332211'),
        (6,140,'0x1122334455667788','0x8877665544332211')]
    with tempfile.TemporaryDirectory() as temp:
        target=Path(temp)/'synthetic-v2';shutil.copytree(source,target)
        data=[json.loads(s) for s in (target/'events.jsonl').read_text().splitlines()]
        data[0].update(version=2,throttle_records_preserved=True,control_loss=0)
        marks={(e['phase'],e['index'],e['edge']):e for e in data if e.get('kind')==7}
        samples=[e for e in data if e.get('kind')==8]
        # Synthetic one-nanosecond ROI fixtures: never retained as measurements.
        for s in samples:
            a=marks[(7,s['index'],0)]
            s.update(timed=True,wall0=a['mono1']+1,wall1=a['mono1']+2,cpu0=1,cpu1=2)
        records=[e for e in data if e['record']=='pc']
        assert not any(s['wall0']<=p['time']<s['wall1'] for s in samples for p in records)
        t=samples[0]['wall0']
        controls=[dict(record='perf_control',seq=i+1,type=kind,time=t+i,id='0x1',stream_id='0x1')
                  for i,kind in enumerate((5,6))]
        for i,e in enumerate(sorted(records+controls,key=lambda e:e['time'])):e['stream_seq']=i+1
        data[-1].update(controls=2,perf_records=len(records)+2)
        data[-1:-1]=controls
        (target/'events.jsonl').write_text(''.join(json.dumps(e)+'\n' for e in data))
        stdout=json.loads((target/'stdout.txt').read_text())
        stdout.update(timed=True,wall_ns=[1]*10,cpu_ns=[1]*10)
        (target/'stdout.txt').write_text(json.dumps(stdout)+'\n')
        result=verify(target,250000,timed=True,pc=True)
        assert all(w['roi']['availability']=='zero_samples_uncertain' for w in result['sampling_windows'])
        assert result['sampling_windows'][0]['roi']['throttling']['reported_throttled_ns']==1
        assert not any(w['roi']['uninterrupted_sampler_usability_proven'] for w in result['sampling_windows'])
    with tempfile.TemporaryDirectory() as temp:
        target=Path(temp)/'synthetic-no-pcs';shutil.copytree(source,target)
        data=[json.loads(s) for s in (target/'events.jsonl').read_text().splitlines()]
        data=[e for e in data if e['record']!='pc'];data[-1]['pcs']=0
        (target/'events.jsonl').write_text(''.join(json.dumps(e)+'\n' for e in data))
        result=verify(target,250000,timed=False,pc=True)
        assert all(w['outer']['availability']=='zero_samples_uncertain' for w in result['sampling_windows'])
    return dict(synthetic=True,checks_passed=['native throttle serialization and order',
                'full v2 verification with ten zero-sample exact ROIs and throttle overlap',
                'full verification with no lifetime PCs and per-window uncertainty'],
                new_jvm_runs=0,new_perf_runs=0,settings_changes=False)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--source',required=True);p.add_argument('--native-records',required=True)
    a=p.parse_args();print(json.dumps(check(a.source,a.native_records)))
