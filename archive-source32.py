#!/usr/bin/env python3
"""Preserve the completed fixed source32 study before any refinement."""
import shutil, subprocess
from pathlib import Path
root=Path('/workspace/sz-evidence')
out=root/'source32'
out.mkdir(exist_ok=False)
files=['candidate-identity.json','baseline-identity.json','benchmark-identity.json',
    'qualification-start.json','qualification-run.log','qualify-all.sh',
    'tests-final.log','run-bench.py','bench_contract.py','summarize.py',
    'run-cold.py','ColdScans.java','summarize-cold.py','cold.json',
    'cold-summary.json','COLD-SUMMARY.md','classify-losses.py',
    'c2-loss-classification.json','C2-LOSS-CLASSIFICATION.md',
    'trace-fastpaths.py','trace-fastpaths-run.log','kernel-final-review.txt',
    'source32-image-identity.json','SOURCE32-ASSESSMENT.md']
for name in files: shutil.copy2(root/name,out/name)
for name in ['qualify','tier','trace-source32']:
    (root/name).rename(out/name)
shutil.copytree(root/'hints',out/'hints')
support=Path('/workspace/sz-candidate/build/scans/test-support')
jtrs=sorted(support.rglob('*.jtr'))
assert len(jtrs)==127,len(jtrs)
for source in jtrs:
    destination=out/'final-jtr'/source.relative_to(support)
    destination.parent.mkdir(parents=True,exist_ok=True)
    shutil.copy2(source,destination)
shutil.copy2('/workspace/sz-candidate/build/scans/test-results/test-summary.txt',out/'test-summary.txt')
patch=subprocess.check_output(['git','diff','7048d6f2..4aa7d23','--','src','test'],cwd='/workspace/sz-candidate')
(out/'candidate.patch').write_bytes(patch)
print('Archived complete source32 qualification and',len(jtrs),'jtreg reports')
