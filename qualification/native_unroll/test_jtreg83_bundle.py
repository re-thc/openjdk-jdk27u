"""Offline migration checks: no JVM, compiler, network, or workflow launch."""
import argparse
import copy
import json
import os
from pathlib import Path
import subprocess
import tempfile
from types import SimpleNamespace
from unittest import mock
import zipfile

import yaml
import jtreg83_harness as harness
from classifier_images import record, source_binding, pins
from run_classifier83_preflight import control_commands, verify_control_reports


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    a = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    cases = []
    def reject(name, callback):
        try:
            callback()
        except RuntimeError:
            cases.append(name)
        else:
            raise AssertionError('Accepted: ' + name)

    original = harness.pins()['preserved_experiment']
    assert record(root / 'qualification/native_unroll/classifier-provenance.json') == original['pin_record']
    cases.append('old experiment pins preserved byte for byte')
    source_binding(root, pins())
    cases.append('unchanged product/test/make/bin trees and exact executed-input binding')
    real = harness.verify_installed('/workspace/toolchains/jtreg83')
    cases.append('actual installed jtreg83 exact seven-JAR inventory and version')
    with tempfile.TemporaryDirectory(prefix='jtreg83-offline-') as tmp:
        t = Path(tmp)
        image = t / 'image'
        (image / 'lib').mkdir(parents=True)
        for name in real:
            p = image / name
            if p.name == 'jtreg.jar':
                with zipfile.ZipFile(p, 'w') as z:
                    z.writestr('META-INF/MANIFEST.MF', 'jtreg-VersionString: 8.3-dev+1\n')
            else:
                p.write_bytes(b'INERT NOT A JAR')
        pin = copy.deepcopy(harness.pins())
        pin['installed']['consumer_jars'] = {name:record(image / name) for name in real}
        with mock.patch.object(harness, 'pins', return_value=pin):
            actual = harness.verify_installed(image)
            cases.append('fixture valid pinned inventory accepted')
            jar = image / 'lib/asmtools.jar'
            saved = jar.read_bytes()
            jar.write_bytes(saved + b'changed')
            reject('changed JAR bytes rejected', lambda:harness.verify_installed(image))
            jar.write_bytes(saved)
            extra = image / 'extra.jar'; extra.write_bytes(b'extra')
            reject('extra JAR outside lib rejected', lambda:harness.inventory(image))
            extra.unlink()
            jar.unlink()
            reject('missing JAR rejected', lambda:harness.inventory(image))
            target = t / 'external.jar'; target.write_bytes(saved); jar.symlink_to(target)
            reject('JAR symlink rejected', lambda:harness.inventory(image))
            jar.unlink(); jar.write_bytes(saved)
            identity = dict(GITHUB_SHA='a'*40, GITHUB_RUN_ID='123', GITHUB_RUN_ATTEMPT='1')
            receipt = dict(experiment=harness.EXPERIMENT, source_commit=harness.SOURCE, ci=identity,
                status='completed',source_clean=True,consumer_jars=actual,
                dependency_endpoints=pin['ci']['dependency_endpoints'],
                recipe_version_numbers=pin['ci']['recipe_version_numbers'])
            path = t / 'receipt.json'; path.write_text(json.dumps(receipt))
            with mock.patch.dict(os.environ, identity, clear=True):
                harness.verify_ci(image,path)
                cases.append('same-run source-built harness receipt accepted without claiming installed-byte identity')
                for key,value in [('source_commit','b'*40),('experiment','old-experiment'),
                                  ('source_clean',False),('status','partial'),('consumer_jars',{})]:
                    bad=copy.deepcopy(receipt);bad[key]=value;path.write_text(json.dumps(bad))
                    reject('CI receipt rejects '+key, lambda:harness.verify_ci(image,path))
                path.write_text(json.dumps(receipt))
            with mock.patch.dict(os.environ,{**identity,'GITHUB_RUN_ATTEMPT':'2'},clear=True):
                reject('rerun attempt rejected',lambda:harness.verify_ci(image,path))
            with mock.patch.dict(os.environ,{**identity,'GITHUB_SHA':'b'*40},clear=True):
                reject('different workflow head rejected',lambda:harness.verify_ci(image,path))
        with mock.patch.object(harness.subprocess,'run',side_effect=AssertionError('Execution during planning')):
            assert not harness.smoke(image,t/'jdk',t/'smoke')['executes']
            assert not harness.build_ci(t/'source',t/'jdk',t/'receipt')['executes']
            cases.append('smoke and source-build planning cannot launch tools or JVMs')
        # Exercise producer admission without running any build command.
        src=t/'source';(src/'make/build-support').mkdir(parents=True)
        versions=pin['ci']['recipe_version_numbers']
        recipe=src/'make/build-support/version-numbers'
        recipe.write_text('\n'.join(k+'='+v for k,v in versions.items())+'\n')
        with mock.patch.object(harness,'git',return_value='wrong'), \
             mock.patch.object(harness.subprocess,'run',side_effect=AssertionError('Build launched on wrong source')):
            reject('wrong source commit rejected before build',lambda:harness.build_ci(src,t/'jdk',t/'r.json',True))
        recipe.write_text(recipe.read_text().replace('JTREG_VERSION=8.3','JTREG_VERSION=8.2.1'))
        with mock.patch.object(harness,'git',side_effect=lambda root,*args:harness.SOURCE if args[0]=='rev-parse' else ''), \
             mock.patch.object(harness.subprocess,'run',side_effect=AssertionError('Build launched on wrong recipe')):
            reject('wrong dependency recipe rejected before build',lambda:harness.build_ci(src,t/'jdk',t/'r.json',True))
        arguments = SimpleNamespace(control_jdk=t/'control-release',control_debug_jdk=t/'control-debug',
            release_jdk=t/'candidate-release',jtreg=image,out=t/'preflight')
        commands=control_commands(arguments)
        assert len(commands)==4 and all('-DVerifyIR=false' in ' '.join(c['argv']) for c in commands)
        assert sum('UseSVE=0' in ' '.join(c['argv']) for c in commands)==2
        cases.append('four added control semantic configurations; no candidate IR relaxation')
        reports={}
        for name in ['TestFloatRoundTripReduction','TestFloatRoundTripReductionEdges']:
            path=t/(name+'.jtr');reports[name]=path
            rows=[]
            for mode,level in [('semantics',0),('semantics',1),('semantics',4),('cold',0)]:
                rows.append(('ROUNDTRIP_REDUCTION_PASS mode='+mode+' checked_method=x required='+str(level)+
                    ' actual='+str(level)+' after='+str(level)) if name.endswith('Reduction') else
                    'ROUNDTRIP_EDGES_PASS mode='+mode+' six_targets_level='+str(level)+' checks=1')
            path.write_text('\n'.join(rows))
        verify_control_reports(reports)
        cases.append('actual interpreter/C1/C2/cold marker forms accepted')
        path=reports['TestFloatRoundTripReductionEdges'];path.write_text(path.read_text().replace('mode=cold','mode=wrong'))
        reject('missing cold execution rejected',lambda:verify_control_reports(reports))

    w=yaml.safe_load((root/'.github/workflows/vector-api-classifier-jtreg83.yml').read_text())
    assert w['on']=={'push':{'branches':['codex/vector-api-classifier-jtreg83']}}
    assert w['permissions']=={'contents':'read','actions':'read'}
    assert w['concurrency']['cancel-in-progress'] is False
    build=w['jobs']['candidate-build'];pre=w['jobs']['preflight']
    assert build['timeout-minutes']==90 and pre['timeout-minutes']==120
    assert build['strategy']['max-parallel']==1 and build['strategy']['fail-fast'] is True
    assert pre['needs']=='candidate-build'
    for job in w['jobs'].values():
        assert 'github.run_attempt == 1' in job['if']
        assert "refs/heads/codex/vector-api-classifier-jtreg83" in job['if']
        for step in job['steps']:
            assert step['timeout-minutes']>0
            if 'uses' in step:assert '@' in step['uses'] and len(step['uses'].split('@')[1])==40
            if 'run' in step:
                subprocess.run(['bash','-n'],input=step['run'],text=True,check=True)
    text=json.dumps(w)
    assert '12015894519' not in text and '38813879807' not in text and 'adoptium' not in text.lower()
    assert 'run_classifier83_preflight.py' in text and 'jtreg83_harness.py verify-ci' in text
    assert sum('build-ci' in s.get('run','') for s in pre['steps'])==1
    assert 'remaining=1200' in text and '100 * 60' in text and '80 * 60' in text
    assert 'preflight-control-semantics' in pre['steps'][-1]['with']['path']
    for job in w['jobs'].values():
        for s in job['steps']:
            if s.get('uses','').startswith('actions/upload-artifact@'):
                assert '.jtreg83-source' not in s['with']['path']
    cases.append('new branch/first-attempt/read-only permissions/timeouts/partial capture preserved; shell syntax checked')
    cases.append('one runner-local source harness, no Adoptium or old input, no harness binary/source uploads')
    a.out.mkdir(parents=True,exist_ok=False)
    (a.out/'results.json').write_text(json.dumps(dict(passed=True,cases=cases,count=len(cases),
        JVMs=0,builds=0,network_calls=0,workflow_runs=0),indent=2)+'\n')
    print(json.dumps(dict(passed=True,count=len(cases),results=str(a.out/'results.json'))))


if __name__=='__main__':main()
