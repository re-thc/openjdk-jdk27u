#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Restore verified complete images for distinct remaining-loss comparisons."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import sys
import tarfile
import urllib.request
import zipfile

sys.dont_write_bytecode=True
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--backend',choices=('neon','msvc'),required=True)
a=p.parse_args()
spec=importlib.util.spec_from_file_location('prepare',Path(__file__).with_name('prepare.py'))
prepare=importlib.util.module_from_spec(spec);spec.loader.exec_module(prepare)
subprocess.run([sys.executable,str(Path(__file__).with_name('prepare.py')),'images','--backend',a.backend],check=True)
root=Path('pair')
artifacts={
 'neon':(12390007148,'7776e5276322a84132016c562c80fb6fad3c2fce095b5f3b08ad6f22c58635cf'),
 'msvc':(12390855995,'f517f7b4b7c299fa4909a44d014b55c4cfe51c348c1928b148f4916feb64ad9f')}
ident,digest=artifacts[a.backend]
base='https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/'+str(ident)
headers={'Authorization':'Bearer '+os.environ['GH_TOKEN'],'Accept':'application/vnd.github+json'}
with prepare.OPEN(urllib.request.Request(base,headers=headers)) as response:meta=json.load(response)
assert meta['id']==ident and meta['digest']=='sha256:'+digest and not meta['expired']
assert meta['workflow_run']['id']==39693198974
assert meta['workflow_run']['head_sha']=='55bc356f76c79a9a3445d312537a0e68860cd1de'
archive=root/'candidate.zip'
with prepare.OPEN(urllib.request.Request(base+'/zip',headers=headers)) as src,archive.open('wb') as dst:
 shutil.copyfileobj(src,dst)
assert hashlib.sha256(archive.read_bytes()).hexdigest()==digest
dest=root/'candidate-artifact'
with zipfile.ZipFile(archive) as z:
 assert all(not Path(n).is_absolute() and '..' not in Path(n).parts and chr(92) not in n and ':' not in n for n in z.namelist())
 z.extractall(dest)
metadata=dest if a.backend=='neon' else dest/'candidate-retained'
receipt=json.loads((metadata/'pair-receipt.json').read_text())
assert receipt['sources']=={'original':'416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda','fork':prepare.SOURCE}
assert receipt['rebuild']['source']==prepare.SOURCE and receipt['rebuild']['checkout_clean']
compiler=json.loads((metadata/'compiler-identity.json').read_text())
assert compiler['full_identity_matches_original']
if a.backend=='neon':
 tar=dest/'fork-jdk.tar.gz'
 assert hashlib.sha256(tar.read_bytes()).hexdigest()==(dest/'fork-jdk.tar.gz.sha256').read_text().split()[0]
 with tarfile.open(tar) as t:
  assert all(n=='fork' or n.startswith('fork/') for n in t.getnames())
  t.extractall(dest,filter='data')
image=dest/('fork' if a.backend=='neon' else 'build/perf/images/jdk')
spec=importlib.util.spec_from_file_location('support',Path('.github/scripts/stringzilla-performance.py'))
support=importlib.util.module_from_spec(spec);spec.loader.exec_module(support)
reference=json.loads((root/'reference.json').read_text())
controls={
 'original':{'image':str((root/'original').resolve()),'spec':str((root/'original-spec.gmk').resolve()),'source':support.BASE},
 'prior':{'image':reference['image'],'spec':reference['spec'],'source':prepare.REFERENCE},
 'candidate':{'image':str(image.resolve()),'spec':str((metadata/'fork-spec.gmk').resolve()),'source':prepare.SOURCE}}
expected={
 'original':json.loads((root/'pair-inventories.json').read_text())['original'],
 'prior':json.loads(Path(reference['inventory']).read_text())['fork'],
 'candidate':json.loads((metadata/'pair-inventories.json').read_text())['fork']}
inventories={n:support.image(Path(c['image'])) for n,c in controls.items()}
for n,c in controls.items():
 assert inventories[n]['files']==expected[n]['files'],n
 c['expected_tree_sha256']=inventories[n]['tree_sha256']
settings={n:support.read_spec(Path(c['spec'])) for n,c in controls.items()}
assert all(s==settings['original'] for s in settings.values())
assert inventories['candidate']['tree_sha256']==receipt['image_hashes']['fork']
assert inventories['original']['tree_sha256']==receipt['image_hashes']['original']
controls['disabled']={**controls['candidate'],'flags':['-XX:-UseStringZillaIntrinsics']}
assert subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()==prepare.SOURCE
assert not subprocess.check_output(['git','status','--porcelain'],text=True).strip()
(root/'controls.json').write_text(json.dumps(controls,indent=2)+'\n')
(root/'followup-reuse.json').write_text(json.dumps({'candidate_artifact':meta,'verified_sha256':digest,
 'source':prepare.SOURCE,'original_source':support.BASE,'prior_source':prepare.REFERENCE,
 'receipt':receipt,'compiler_identity':compiler,'matched_settings':settings,'inventories':inventories,
 'platform':platform.platform(),'builds':0,'purpose':'Distinct uncovered minimum-overlap, dense-suffix, equality and boundary controls; no primary case is repeated'},indent=2)+'\n')
print(json.dumps({'source':prepare.SOURCE,'backend':a.backend,'verified_images':{n:v['tree_sha256'] for n,v in inventories.items()},'builds':0}))
