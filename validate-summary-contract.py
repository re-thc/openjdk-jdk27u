#!/usr/bin/env python3
"""Synthetic four-label parser check in /tmp, never a performance result."""
import copy, json, shutil, subprocess, tempfile
from pathlib import Path
root=Path('/workspace/sz-evidence')
original=root/'source32/qualify/c2-avx2'
with tempfile.TemporaryDirectory(prefix='sz-summary-contract-') as temporary:
    fixture=Path(temporary)
    manifest=json.loads((original/'RUN.json').read_text())
    manifest['labels']=['base','candidate','old','off']
    (fixture/'RUN.json').write_text(json.dumps(manifest))
    for repeat in range(5):
        for label in ['base','candidate','off']:
            name=f'{repeat:02d}-{label}-all.json'
            shutil.copy2(original/name,fixture/name)
        data=json.loads((fixture/f'{repeat:02d}-candidate-all.json').read_text())
        for row in data:
            metric=row['primaryMetric']
            metric['rawData']=[[v*2 for v in fork] for fork in metric['rawData']]
        (fixture/f'{repeat:02d}-old-all.json').write_text(json.dumps(data))
    command=['python3',str(root/'summarize.py'),str(fixture)]
    result=subprocess.run(command,capture_output=True,text=True)
    assert result.returncode==0,result.stderr
    summary=json.loads((fixture/'summary.json').read_text())
    assert len(summary)==154
    assert all(row['rounds']==5 and row['paired_old_speedup']==2 for row in summary)
    for row in summary:
        assert row['paired_old_range']==[2,2]
        assert row['ns']['old']==2*row['ns']['candidate']
    print('Synthetic four-label check:154rows, five rounds; old/candidate direction2x exactly')
    missing=fixture/'04-old-all.json'
    saved=missing.read_bytes(); missing.unlink()
    assert subprocess.run(command,capture_output=True).returncode!=0
    missing.write_bytes(saved)
    print('Missing fourth-control file rejected')
    data=json.loads(missing.read_text()); data.append(copy.deepcopy(data[0]))
    missing.write_text(json.dumps(data))
    result=subprocess.run(command,capture_output=True,text=True)
    assert result.returncode!=0 and 'duplicate' in result.stderr
    print('Duplicate fourth-control row rejected')
command=['python3',str(root/'run-bench.py'),'--phase','screen','--config','c2-avx2','--rounds','1']
result=subprocess.run(command,capture_output=True,text=True)
assert result.returncode!=0 and 'Refusing to replace existing study' in result.stderr
print('Existing retained study cannot be overwritten by runner')
