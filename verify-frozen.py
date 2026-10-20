#!/usr/bin/env python3
"""Prove post-study files still match the post-test frozen inputs."""
import hashlib, json, subprocess, time
from pathlib import Path
root=Path('/workspace/sz-evidence')
frozen=json.loads((root/'qualification-start.json').read_text())
checked={}
for label in ['base','candidate','old']:
    entry=frozen[label]; image=Path(entry['image'])
    actual={name:hashlib.sha256((image/name).read_bytes()).hexdigest()
            for name in entry['files_sha256']}
    assert actual==entry['files_sha256'],label
    checked[label]=actual
checkout=Path('/workspace/sz-candidate')
subprocess.run(['git','diff','--exit-code','--','src','test'],cwd=checkout,check=True)
tree=subprocess.check_output(['git','rev-parse','HEAD:src'],cwd=checkout,text=True).strip()
assert tree==frozen['source_tree']
for name,expected in [('test/micro/org/openjdk/bench/java/lang/StringZillaScans.java',frozen['benchmark']['benchmark_sha256'])]:
    assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==expected
for label in ['base','candidate']:
    assert hashlib.sha256((root/'hints'/f'{label}.commands').read_bytes()).hexdigest()==frozen['benchmark']['hints_sha256']
for name,expected in frozen['benchmark']['jmh_jars_sha256'].items():
    assert hashlib.sha256((root/'jmh'/name).read_bytes()).hexdigest()==expected
receipt=dict(checked_at=time.time(),source_tree=tree,images=checked,
             benchmark_hints_and_dependencies_unchanged=True)
(root/'qualification-finish.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('All frozen images, source, benchmark and hints still match')
