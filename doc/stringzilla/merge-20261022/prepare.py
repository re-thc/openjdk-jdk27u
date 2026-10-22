#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Restore digest-bound independent originals and seal rebuilt candidates."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tarfile
import urllib.request
import urllib.parse
import zipfile

SOURCE = '15da3c455ba3f15993f581150c775bb7a941fccd'
PRODUCER = 'a677a179522428c24b85cf76dbf0895f3aa1825f'
ARTIFACTS = {
    'neon':(12168885783,'2ff97e0af5bee64f0fb410d9befc7afe9697dbcddc2476c7a293c968a3380099'),
    'msvc':(12167948109,'f6591b98c94e0b588bef474cbd41753da19b6874576337c3e0e7c17d9b0da752')}


class ArtifactRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        redirected=super().redirect_request(req,fp,code,msg,headers,newurl)
        if redirected is not None and urllib.parse.urlsplit(req.full_url).netloc != urllib.parse.urlsplit(newurl).netloc:
            redirected.remove_header('Authorization')
        return redirected


OPEN=urllib.request.build_opener(ArtifactRedirect()).open


REFERENCE = 'c17c5cb06297e25681b4dab2eddbd60ceffe0300'
REFERENCE_PRODUCER = 'dcec0a8a4fc4bea9b35cd371dab7d5b640b34d04'
REFERENCES = {"neon":[12423679741,"276425f80926671adb17eda213ea803c71bd8acb0e62bd855e3f23e0b9479a08","007c080f5f2cc63ad2cc79f6d36131e8b81331193937fdfd8d77640a6f0dfbd3"],"msvc":[12425635274,"0a4712a17de1a1a2581f47c1b9397715efc44eec44443a9d1b70122fa3c12670","8069110c0ea772379d959c8c3dccbc806da22e6bce0f1c76ff9fcccec729c4ac"]}


def restore_reference(root, backend, headers):
    ident, digest, tree = REFERENCES[backend]
    base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(ident)
    with OPEN(urllib.request.Request(base, headers=headers)) as response:
        meta = json.load(response)
    assert meta['id'] == ident and meta['digest'] == 'sha256:' + digest and not meta['expired']
    assert meta['workflow_run']['id'] == 39773440813
    assert meta['workflow_run']['head_sha'] == REFERENCE_PRODUCER
    archive = root / 'reference.zip'
    with OPEN(urllib.request.Request(base + '/zip', headers=headers)) as src, archive.open('wb') as dst:
        shutil.copyfileobj(src, dst)
    assert hashlib.sha256(archive.read_bytes()).hexdigest() == digest
    dest = root / 'reference-artifact'
    with zipfile.ZipFile(archive) as z:
        assert all(not Path(n).is_absolute() and '..' not in Path(n).parts
                   and chr(92) not in n and ':' not in n for n in z.namelist())
        z.extractall(dest)
    metadata = dest if backend == 'neon' else dest / 'candidate-retained'
    receipt = json.loads((metadata / 'pair-receipt.json').read_text())
    assert receipt['sources'] == {'original': '416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda', 'fork': REFERENCE}
    assert receipt['image_hashes']['fork'] == tree
    if backend == 'neon':
        tar = dest / 'fork-jdk.tar.gz'
        assert hashlib.sha256(tar.read_bytes()).hexdigest() == (dest / 'fork-jdk.tar.gz.sha256').read_text().split()[0]
        with tarfile.open(tar) as t:
            assert all(n == 'fork' or n.startswith('fork/') for n in t.getnames())
            t.extractall(dest, filter='data')
    image = dest / ('fork' if backend == 'neon' else 'build/perf/images/jdk')
    (root / 'reference.json').write_text(json.dumps({'artifact': meta, 'verified_zip_sha256': digest,
        'source': REFERENCE, 'image': str(image.resolve()), 'spec': str((metadata/'fork-spec.gmk').resolve()),
        'tree_sha256': tree, 'inventory': str((metadata/'pair-inventories.json').resolve())}, indent=2) + chr(10))


def verify_toolchain(root, backend):
    text = Path('build/perf/configure.log').read_text(errors='replace')
    boot = 'openjdk version "26" 2026-03-17 OpenJDK Runtime Environment (build 26+35-2893) OpenJDK 64-Bit Server VM (build 26+35-2893, mixed mode, sharing)'
    assert boot in text, 'Boot JDK identity changed from the independent original'
    if backend == 'neon':
        for compiler in ('gcc', 'g++'):
            expected = compiler + '-16 (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]'
            assert expected in text, 'Full Ubuntu compiler package/trunk identity differs from original'
    else:
        specs = [root/'original-spec.gmk', root/'fork-spec.gmk', Path(json.loads((root/'reference.json').read_text())['spec'])]
        versions = []
        for spec in specs:
            raw = spec.read_text()
            toolset = sorted(set(re.findall(r'(?i)MSVC[\\/]([0-9.]+)', raw)))
            sdk = sorted(set(re.findall(r'(?i)Include[\\/](10[.][0-9.]+)', raw)))
            assert toolset and sdk, 'Missing full Windows toolset/SDK identity'
            versions.append({'toolset':toolset, 'sdk':sdk})
        assert versions[0] == versions[1] == versions[2], versions
    selected = [line for line in text.splitlines() if any(key in line for key in
                ('Boot JDK version...', 'compiler version', 'Visual Studio', 'Windows Kit', 'SDK version'))]
    (root/'compiler-identity.json').write_text(json.dumps({'full_identity_matches_original':True,
        'configure_lines':selected}, indent=2) + chr(10))


def verify_release_source(release_text, specification, backend):
    release_source=re.findall(r'^SOURCE="(.*)"$',release_text,re.M)
    embedded=bool(release_source and SOURCE[:12] in release_source[0])
    if not embedded:
        assert backend=='msvc' and release_source in ([],[''])
        assert re.findall(r'^GIT[ \t]*:?=[ \t]*(.*)$',specification,re.M)==['']
    return embedded


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('mode',choices=('restore','images','seal'))
    p.add_argument('--backend',choices=tuple(ARTIFACTS),required=True)
    a=p.parse_args()
    root=Path('pair')
    if a.mode in ('restore','images'):
        exclude=Path(subprocess.check_output(['git','rev-parse','--git-path','info/exclude'],text=True).strip())
        with exclude.open('a') as f:
            f.write('\n# Isolated qualification outputs; product sources remain tracked.\n')
            f.write('\n'.join('/'+n+'/' for n in ('.stringzilla-driver','pair','bootjdk','jtreg','validation','jtreg-evidence','paired-results','candidate-retained'))+'\n')
        root.mkdir(exist_ok=False)
        ident,digest=ARTIFACTS[a.backend]
        base='https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/'+str(ident)
        headers={'Authorization':'Bearer '+os.environ['GH_TOKEN'],'Accept':'application/vnd.github+json'}
        with OPEN(urllib.request.Request(base,headers=headers)) as response:
            meta=json.load(response)
        assert meta['id']==ident and meta['digest']=='sha256:'+digest and not meta['expired']
        assert meta['workflow_run']['id']==39204049909 and meta['workflow_run']['head_sha']==PRODUCER
        archive=root/'retained-pair.zip'
        with OPEN(urllib.request.Request(base+'/zip',headers=headers)) as src,archive.open('wb') as dst:
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
        restore_reference(root, a.backend, headers)
        if a.mode == 'images':
            return
        ident=12150561563
        digest='bea9bcdcd407c1badace23cbad69aebd75f6d8478693738ea3b8e2b9ec52374d'
        base='https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/'+str(ident)
        with OPEN(urllib.request.Request(base,headers=headers)) as response:meta=json.load(response)
        assert meta['digest']=='sha256:'+digest and meta['name']=='bundles-jtreg-8.2.1+1' and not meta['expired']
        assert meta['workflow_run']['id']==39164738566
        archive=root/'jtreg.zip'
        with OPEN(urllib.request.Request(base+'/zip',headers=headers)) as src,archive.open('wb') as dst:
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
    verify_toolchain(root, a.backend)
    fork=support.image(root/'fork')
    release_text=(root/'fork/release').read_text()
    # Minimal MSYS lacks configure-time Git. The clean checkout and the shipped
    # class/build-output comparison below still bind that complete image.
    embedded=verify_release_source(release_text,(root/'fork-spec.gmk').read_text(),a.backend)
    exe='.exe' if a.backend=='msvc' else ''
    shipped=root/'shipped-class-check'
    class_hashes={}
    for name in ('String', 'StringLatin1', 'StringUTF16', 'StringZilla'):
        subprocess.run([str(root/'fork'/('bin/jimage'+exe)),'extract',
            '--include','glob:**/java/lang/'+name+'.class','--dir',str(shipped),
            str(root/'fork/lib/modules')],check=True)
        built=Path('build/perf/jdk/modules/java.base/java/lang')/(name+'.class')
        extracted=shipped/'java.base/java/lang'/(name+'.class')
        assert support.sha(built)==support.sha(extracted)
        class_hashes[name]=support.sha(extracted)
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
                    'source_trees':subprocess.check_output(['git','ls-tree','HEAD','bin','make','src','test'],text=True),
                    'embedded_revision_available':embedded,'shipped_classes_sha256':class_hashes,
                    'shipped_class_matches_build_output':True,'checkout_clean':True}
    reference=json.loads((root/'reference.json').read_text())
    prior=support.image(Path(reference['image']))
    assert prior['tree_sha256']==reference['tree_sha256']
    assert prior['files']==json.loads(Path(reference['inventory']).read_text())['fork']['files']
    assert support.read_spec(Path(reference['spec']))==support.read_spec(root/'original-spec.gmk')
    controls={
        'original':{'image':str((root/'original').resolve()),'spec':str((root/'original-spec.gmk').resolve()),'source':support.BASE,'expected_tree_sha256':original['tree_sha256']},
        'prior':{'image':reference['image'],'spec':reference['spec'],'source':REFERENCE,'expected_tree_sha256':prior['tree_sha256']},
        'candidate':{'image':str((root/'fork').resolve()),'spec':str((root/'fork-spec.gmk').resolve()),'source':SOURCE,'expected_tree_sha256':fork['tree_sha256']},
        'disabled':{'image':str((root/'fork').resolve()),'spec':str((root/'fork-spec.gmk').resolve()),'source':SOURCE,'expected_tree_sha256':fork['tree_sha256'],'flags':['-XX:-UseStringZillaIntrinsics']}}
    (root/'controls.json').write_text(json.dumps(controls,indent=2)+'\n')
    (root/'pair-inventories.json').write_text(json.dumps({'original':original,'fork':fork},separators=(',',':'))+'\n')
    (root/'pair-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    retained=Path('candidate-retained');retained.mkdir()
    if a.backend!='msvc':
        with tarfile.open(retained/'fork-jdk.tar.gz','w:gz') as tar:tar.add(root/'fork',arcname='fork')
    for p in ('pair-inventories.json','pair-receipt.json','original-spec.gmk','fork-spec.gmk','reuse.json','reference.json','compiler-identity.json','controls.json'):
        shutil.copy(root/p,retained/p)
    if a.backend!='msvc':
        (retained/'fork-jdk.tar.gz.sha256').write_text(support.sha(retained/'fork-jdk.tar.gz')+'\n')


if __name__=='__main__':main()
