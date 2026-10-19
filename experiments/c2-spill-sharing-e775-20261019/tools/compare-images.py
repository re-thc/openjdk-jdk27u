#!/usr/bin/env python3
"""Compare complete release runtimes and all extracted module entries."""
from pathlib import Path
import hashlib
import json
import subprocess
import argparse

root = Path('/workspace/work/spill-sharing')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--baseline', type=Path, default=root/'images/master-baseline-release')
parser.add_argument('--candidate', type=Path, default=root/'images/master-candidate-release')
parser.add_argument('--output', type=Path, default=root/'module-compare/current-master')
args = parser.parse_args()
out = args.output
out.mkdir(parents=True, exist_ok=False)
images = {'baseline':args.baseline, 'candidate':args.candidate}
def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024*1024),b''): h.update(chunk)
    return h.hexdigest()
def inventory(directory):
    return {str(p.relative_to(directory)): sha(p) for p in directory.rglob('*')
            if p.is_file()}
inventories = {}
runtime = {arm:inventory(image) for arm,image in images.items()}
for arm,image in images.items():
    subprocess.run(['/workspace/toolchains/jdk27/bin/jimage','extract','--dir',
                    str(out/arm),str(image/'lib/modules')], check=True)
    inventories[arm] = inventory(out/arm)
def comparison(pair):
    a,b = pair['baseline'], pair['candidate']
    return {'identical':sum(a[p]==b[p] for p in a.keys()&b.keys()),
            'different':[{'path':p,'baseline':a[p],'candidate':b[p]}
                         for p in sorted(a.keys()&b.keys()) if a[p]!=b[p]],
            'baseline_only':sorted(a.keys()-b.keys()),
            'candidate_only':sorted(b.keys()-a.keys())}
result = {'runtime':comparison(runtime),'module_entries':comparison(inventories)}
(out/'comparison.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
