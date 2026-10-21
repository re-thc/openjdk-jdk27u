#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""Read-only admission check for the explicitly selected follow-up jobs."""
import json
import os
from pathlib import Path
import platform
import sys
import urllib.request

REPO = 're-thc/openjdk-jdk27u'
PRODUCT = '2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1'
PINS = {
 'full': [(39602216233,12347874804,'pr43-comparison-images-39602216233-1','1795c9eba9766cb46b56694c34ebea8201dc03adbf1070c30db7f122cf22327c','9368efa7513ffc337563eaaa737cdfc069f90731')],
 'sve': [(39266688701,12194059473,'bundles-linux-aarch64-debug','b25f7a24708dea4147028dd5520d4ba09cce9b82bcedb28e652890a5f1d6857e',PRODUCT),
         (39266688701,12192388544,'bundles-jtreg-8.2.1+1','204a593fc22cb7f3b4f635848816c4aa4d196cc3b5b203c9604ec6d95085a088',PRODUCT)]}
def get(path):
    req=urllib.request.Request('https://api.github.com/repos/'+REPO+'/'+path,
        headers={'Authorization':'Bearer '+os.environ['GITHUB_TOKEN'],'Accept':'application/vnd.github+json'})
    with urllib.request.urlopen(req,timeout=30) as response: return json.load(response)
def main():
    mode=sys.argv[1]
    out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
    assert os.environ['GITHUB_REPOSITORY']==REPO
    assert os.environ['GITHUB_REF']=='refs/heads/codex/pr43-macos-qualification'
    assert os.environ['GITHUB_EVENT_NAME']=='workflow_dispatch'
    assert os.environ['GITHUB_RUN_ATTEMPT']=='1'
    assert platform.machine()=='aarch64' and platform.system()=='Linux'
    inputs=json.load(open(os.environ['GITHUB_EVENT_PATH']))['inputs']
    assert str(inputs.get('pr43_full_parser_sve')).lower()=='true'
    for other in ['pr43_native_comparison','pr43_native_parser_probe']:
        assert str(inputs.get(other,False)).lower()=='false'
    pr=get('pulls/43')
    assert pr['head']['sha']==PRODUCT and pr['state']=='open' and not pr['merged']
    records={'product':PRODUCT,'diagnostic_sha':os.environ['GITHUB_SHA'],'mode':mode,'pr':pr,'artifacts':[]}
    for run,artifact,name,digest,head in PINS[mode]:
        ci=get(f'actions/runs/{run}')
        a=get(f'actions/artifacts/{artifact}')
        assert ci['head_sha']==head and ci['conclusion']=='success' and ci['status']=='completed' and ci['run_attempt']==1
        assert a['id']==artifact and a['name']==name and not a['expired'] and a['digest']=='sha256:'+digest
        assert a['workflow_run']['id']==run and a['workflow_run']['head_sha']==head
        records['artifacts'].append({'run':ci,'artifact':a})
    if mode=='sve':
        commit=get('git/commits/f09e3bcdd4ab29af3270136ca02bc12674b337e1')
        assert commit['tree']['sha']=='7e9be0fb61d956b8982a01d1d12279d9e1faad6b'
        assert [p['sha'] for p in commit['parents']]==['e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4',PRODUCT]
        records['image_commit']=commit
    (out/'binding.json').write_text(json.dumps(records,indent=2)+'\n')
    print('PR43_FOLLOWUP_BOUND',mode,PRODUCT,os.environ['GITHUB_SHA'])
if __name__=='__main__':main()
