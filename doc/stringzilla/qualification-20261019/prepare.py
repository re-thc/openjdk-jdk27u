#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Restore digest-bound independent originals and seal rebuilt candidates."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import tarfile
import urllib.request
import zipfile

SOURCE = 'b963d7525943c0540d7753c29f459bf5ad77e2eb'
PRODUCER = 'a677a179522428c24b85cf76dbf0895f3aa1825f'
ARTIFACTS = {
    'neon':(12168885783,'2ff97e0af5bee64f0fb410d9befc7afe9697dbcddc2476c7a293c968a3380099'),
    'msvc':(12167948109,'f6591b98c94e0b588bef474cbd41753da19b6874576337c3e0e7c17d9b0da752')}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('mode',choices=('restore','seal'))
    p.add_argument('--backend',choices=tuple(ARTIFACTS),required=True)
    a=p.parse_args()
    root=Path('pair')
    if a.mode=='restore':
        exclude=Path(subprocess.check_output(['git','rev-parse','--git-path','info/exclude'],text=True).strip())
        with exclude.open('a') as f:
            f.write('\n# Isolated qualification outputs; product sources remain tracked.\n')
            f.write('\n'.join('/'+n+'/' for n in ('.stringzilla-driver','pair','bootjdk','jtreg','validation','jtreg-evidence','paired-results','candidate-retained'))+'\n')
        root.mkdir(exist_ok=False)
        ident,digest=ARTIFACTS[a.backend]
        base='https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/'+str(ident)
        headers={'Authorization':'Bearer '+os.environ['GH_TOKEN'],'Accept':'application/vnd.github+json'}
        with urllib.request.urlopen(urllib.request.Request(base,headers=headers)) as response:
            meta=json.load(response)
        assert meta['id']==ident and meta['digest']=='sha256:'+digest and not meta['expired']
        assert meta['workflow_run']['id']==39204049909 and meta['workflow_run']['head_sha']==PRODUCER
        archive=root/'retained-pair.zip'
        with urllib.request.urlopen(urllib.request.Request(base+'/zip',headers=headers)) as src,archive.open('wb') as dst:
            shutil.copyfileobj(src,dst)
        assert hashlib.sha256(archive.read_bytes()).hexdigest()==digest
        with zipfile.ZipFile(archive) as z:
            assert set(z.namelist())=={'fork-jdk.tar.gz','original-jdk.tar.gz','fork-spec.gmk','original-spec.gmk',
                                      'fork-jdk.tar.gz.sha256','original-jdk.tar.gz.sha256','pair-receipt.json','pair-inventories.json'}
            z.extractall(root)
        receipt=json.loads((root/'pair-receipt.json').read_text())
        assert receipt['sources']=={'original':'416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda','fork':'6bb14f1ebb5a7b7c3669a85b3e6e5dec5551044d'}
        for control in ('original',):
            tar=root/(control+'-jdk.tar.gz')
            assert hashlib.sha256(tar.read_bytes()).hexdigest()==(root/(control+'-jdk.tar.gz.sha256')).read_text().split()[0]
            with tarfile.open(tar) as t:
                assert all(n==control or n.startswith(control+'/') for n in t.getnames())
                t.extractall(root,filter='data')
        (root/'reuse.json').write_text(json.dumps({'artifact':meta,'verified_zip_sha256':digest,
            'reuse':'Independent original image only; rebuild candidate from the exact product source',
            'product_target':SOURCE},indent=2)+'\n')
        ident=12150561563
        digest='bea9bcdcd407c1badace23cbad69aebd75f6d8478693738ea3b8e2b9ec52374d'
        base='https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/'+str(ident)
        with urllib.request.urlopen(urllib.request.Request(base,headers=headers)) as response:meta=json.load(response)
        assert meta['digest']=='sha256:'+digest and meta['name']=='bundles-jtreg-8.2.1+1' and not meta['expired']
        assert meta['workflow_run']['id']==39164738566
        archive=root/'jtreg.zip'
        with urllib.request.urlopen(urllib.request.Request(base+'/zip',headers=headers)) as src,archive.open('wb') as dst:
            shutil.copyfileobj(src,dst)
        assert hashlib.sha256(archive.read_bytes()).hexdigest()==digest
        with zipfile.ZipFile(archive) as z:
            assert 'lib/jtreg.jar' in z.namelist()
            assert all(not Path(n).is_absolute() and '..' not in Path(n).parts and '\\' not in n and ':' not in n for n in z.namelist())
            z.extractall('jtreg/installed')
        return
    spec=importlib.util.spec_from_file_location('support',Path('.github/scripts/stringzilla-performance.py'))
    support=importlib.util.module_from_spec(spec);spec.loader.exec_module(support)
    expected=json.loads((root/'pair-inventories.json').read_text())
    original=support.image(root/'original')
    assert original['files']==expected['original']['files']
    assert subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()==SOURCE
    assert subprocess.check_output(['git','status','--porcelain'],text=True).strip()==''
    assert support.read_spec(root/'original-spec.gmk')==support.read_spec(Path('build/perf/spec.gmk'))
    shutil.copytree('build/perf/images/jdk',root/'fork')
    shutil.copy('build/perf/spec.gmk',root/'fork-spec.gmk')
    fork=support.image(root/'fork')
    assert SOURCE[:12] in (root/'fork/release').read_text()
    commands=list(Path('build/perf').rglob('StringZillaKernels.'+('obj' if a.backend=='msvc' else 'o')+'.cmdline'))
    assert len(commands)==1,commands
    command=commands[0].read_text()
    assert (' -O2 ' if a.backend=='msvc' else ' -O3 ') in command and ' -O1 ' not in command and ' -Od ' not in command
    shutil.copy(commands[0],root/commands[0].name)
    shutil.copy(root/'pair-receipt.json',root/'parent-pair-receipt.json')
    receipt={'sources':{'original':support.BASE,'fork':SOURCE},'backend':a.backend,
        'spec':support.read_spec(root/'fork-spec.gmk'),
        'parent_receipt_sha256':support.sha(root/'parent-pair-receipt.json'),
        'image_hashes':{n:d['tree_sha256'] for n,d in [('original',original),('fork',fork)]},
        'release':{n:(root/n/'release').read_text() for n in ('original','fork')}}
    receipt['rebuild']={'source':SOURCE,'kernel_compile_command':command,
                    'source_trees':subprocess.check_output(['git','ls-tree','HEAD','bin','make','src','test'],text=True)}
    (root/'pair-inventories.json').write_text(json.dumps({'original':original,'fork':fork},separators=(',',':'))+'\n')
    (root/'pair-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    retained=Path('candidate-retained');retained.mkdir()
    with tarfile.open(retained/'fork-jdk.tar.gz','w:gz') as tar:tar.add(root/'fork',arcname='fork')
    for p in ('pair-inventories.json','pair-receipt.json','original-spec.gmk','fork-spec.gmk','reuse.json'):
        shutil.copy(root/p,retained/p)
    (retained/'fork-jdk.tar.gz.sha256').write_text(support.sha(retained/'fork-jdk.tar.gz')+'\n')


if __name__=='__main__':main()
