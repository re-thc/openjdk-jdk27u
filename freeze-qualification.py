#!/usr/bin/env python3
"""Capture post-test identities and freeze the exact final study inputs."""
import hashlib, json, subprocess, time
from pathlib import Path
root=Path('/workspace/sz-evidence')
checkout=Path('/workspace/sz-candidate')
subprocess.run(['git','diff','--exit-code','--','src','test'],cwd=checkout,check=True)
commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()
tree=subprocess.check_output(['git','rev-parse','HEAD:src'],cwd=checkout,text=True).strip()
assert commit=='c881f89fb5cde1a5ec20fcf22adb0faa849303f6'
testlog=(root/'tests-outline.log').read_text()
assert 'TEST SUCCESS' in testlog and 'Finished building target' in testlog
assert '98    98     0     0' in testlog and '31    29     0     0     2' in testlog
names=['bin/java','lib/modules','lib/libjava.so','lib/server/libjvm.so','release']
def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def identity(path):
    return dict(image=str(path),files_sha256={name:digest(path/name) for name in names},
                release_text=(path/'release').read_text())
old=identity(Path('/workspace/sz-image-source32'))
receipt=json.loads((root/'source32-image-identity.json').read_text())
assert old['files_sha256']==receipt['files_sha256']
base=identity(Path('/workspace/sz-scans/build/scans/images/jdk'))
before=json.loads((root/'baseline-identity.json').read_text())
assert all(base['files_sha256'][name]==before['files_sha256'][name] for name in names if name!='release')
candidate=identity(checkout/'build/scans/images/jdk')
candidate.update(captured_at=time.time(),commit=commit,source_tree=tree)
(root/'candidate-identity.json').write_text(json.dumps(candidate,indent=2)+'\n')
benchmark=json.loads((root/'benchmark-identity.json').read_text())
assert digest(checkout/'test/micro/org/openjdk/bench/java/lang/StringZillaScans.java')==benchmark['benchmark_sha256']
for hint in ['base','candidate']:
    assert digest(root/'hints'/f'{hint}.commands')==benchmark['hints_sha256']
for jar,sha in benchmark['jmh_jars_sha256'].items(): assert digest(root/'jmh'/jar)==sha
frozen=dict(time=time.time(),candidate_commit=commit,source_tree=tree,
    tests='98 String + 29 intrinsic descriptions passed, 2 inapplicable',
    benchmark=benchmark,base=base,candidate=candidate,old=old,
    design='C2 five alternating base/candidate/old/off rounds, full154cases; C1/Xint five base/candidate/off rounds each77cases; nine fresh-process first-call repeats')
(root/'qualification-start.json').write_text(json.dumps(frozen,indent=2)+'\n')
print('Post-test image, source, benchmark, hint, dependency and preserved-control identities verified')
