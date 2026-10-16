"""Offline producer/archive/consumer failures with inert tool and JDK payloads."""
import argparse
import contextlib
import copy
import fnmatch
import io
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
from unittest import mock
import zipfile

import yaml
import build_classifier_image as producer
import classifier_images as binding
import classifier_inputs as inputs
import verify_classifier_images as consumer_cli


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--native-metadata', type=Path)
    p.add_argument('--jtreg', type=Path)
    p.add_argument('--artifact-metadata', type=Path)
    a = p.parse_args()
    root = a.out.resolve()
    root.mkdir(parents=True, exist_ok=False)
    repo = Path(__file__).resolve().parents[2]
    real_pin = binding.pins()
    cases = []

    def passed(name):
        cases.append(name)

    def rejected(name, operation, match):
        try:
            operation()
        except (RuntimeError, subprocess.CalledProcessError) as error:
            assert match in str(error), (name, error)
            passed(name)
        else:
            raise AssertionError('Accepted invalid case: ' + name)

    source = binding.source_binding(repo, real_pin)
    passed('real reviewed source and explicit five-file product delta')
    for key, wrong in [('trees', {**real_pin['trees'], 'test':'0' * 40}),
            ('product_delta', []), ('product_patch_sha256', '0' * 64),
            ('configure_profile', dict(bytes=0, sha256='0' * 64))]:
        pin = copy.deepcopy(real_pin); pin[key] = wrong
        rejected('source rejects wrong ' + key, lambda: binding.source_binding(repo, pin),
                 {'trees':'tree differs', 'product_delta':'production delta',
                  'product_patch_sha256':'Product patch', 'configure_profile':'Configure profile'}[key])
    with mock.patch.dict(os.environ, {'GITHUB_SHA':'0' * 40}):
        rejected('no workflow-head spoofing', lambda: binding.source_binding(repo, real_pin), 'workflow head')
    if a.native_metadata:
        for level in ['release', 'fastdebug']:
            for filename, key in [('matched-build-plan.json','plan_canonical_sha256'),
                    ('matched-build-results.json','results_canonical_sha256')]:
                value = json.loads((a.native_metadata / level / filename).read_text())
                assert binding.canonical(value) == real_pin['historical'][level][key]
                passed('actual retained metadata pin: ' + level + '/' + filename)
    if a.artifact_metadata:
        document = json.loads(a.artifact_metadata.read_text())['artifact']
        path = root / 'jtreg-artifact-metadata.json'
        def check_metadata():
            with mock.patch.object(sys, 'argv', ['classifier_inputs.py','metadata',str(path),
                    '--artifact-id',str(document['id'])]):
                inputs.main()
        path.write_text(json.dumps(document)); check_metadata()
        passed('actual retained jtreg artifact metadata pin')
        for field, wrong, error in [('digest','sha256:' + '0' * 64,'metadata differs'),
                ('expired',True,'expired'), ('expires_at','2020-01-01T00:00:00Z','expired')]:
            value=copy.deepcopy(document); value[field]=wrong; path.write_text(json.dumps(value))
            rejected('rejects jtreg metadata ' + field,check_metadata,error)
    if a.jtreg:
        with mock.patch.object(sys, 'argv', ['classifier_inputs.py','jtreg',str(a.jtreg)]):
            inputs.main()
        passed('all seven already-preserved jtreg consumer JAR hashes')
        bad = root / 'bad-jtreg/lib'; bad.mkdir(parents=True); (bad/'jtreg.jar').write_text('wrong bytes')
        with mock.patch.object(sys, 'argv', ['classifier_inputs.py','jtreg',str(bad.parent)]):
            rejected('rejects corrupted or incomplete jtreg JAR payload',inputs.main,'JAR bytes')

    pin = copy.deepcopy(real_pin)
    controls, histories = {}, {}
    for level in ['release', 'fastdebug']:
        image, built = root / ('control-' + level), root / ('historical-' + level)
        built.mkdir()
        for name in binding.FILES:
            path = image / name; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('INERT NOT-A-JDK ' + level + ' ' + name + '\n')
        expected = pin['historical'][level]
        expected['image'] = {name:binding.record(image / name) for name in binding.FILES}
        plan = dict(level=level, execution='completed', toolchain_unchanged_after_each_build=True,
            source={'candidate':{'head':expected['build_head']}, 'rebuilt_b3':{
                'head':pin['control_head'], 'src_tree':expected['control_src_tree']}})
        results = {'candidate':{'image':{'fixture':'not used'}},
                   'rebuilt_b3':{'image':expected['image']}}
        (built / 'matched-build-plan.json').write_text(json.dumps(plan))
        (built / 'matched-build-results.json').write_text(json.dumps(results))
        expected.update(plan_canonical_sha256=binding.canonical(plan),
                        results_canonical_sha256=binding.canonical(results))
        controls[level], histories[level] = image, built

    tools = {}
    for name in binding.TOOLS:
        path = root / 'inert-tools' / name; path.parent.mkdir(exist_ok=True)
        path.write_text('INERT NOT-EXECUTABLE TOOL ' + name)
        tools[name] = path
    calls = []
    active = {}
    scaffold = root / 'inert-source'
    (scaffold / 'bin').mkdir(parents=True)
    (scaffold / 'bin/configure-dev').write_bytes((repo / 'bin/configure-dev').read_bytes())

    def fake_run(argv, cwd, env, logfile, timeout):
        argv = [str(x) for x in argv]
        assert timeout > 0
        calls.append(dict(level=active['level'], argv=argv, fixture_only=True))
        logfile.write_text('INERT FIXTURE; NO COMPILER OR JVM EXECUTED\n')
        if argv[0] == str(tools['make']):
            if active.get('failure'):
                raise RuntimeError('injected producer failure')
            lib = scaffold / 'build/native-candidate/support/modules_libs/java.base/server/libjvm.so'
            lib.parent.mkdir(parents=True)
            lib.write_text('INERT CANDIDATE VM ' + active['level'])
            (scaffold / 'build/native-candidate/spec.gmk').write_text('INERT_CONFIG=true\n')
        elif argv[0] == 'bash':
            assert argv[1].endswith('/bin/configure-dev')
        elif argv[-1] == '--version':
            assert Path(argv[0]) in tools.values()
        else:
            assert argv[-1] == '-version' and argv[0].endswith('/bin/java')

    workflow = yaml.safe_load((repo / '.github/workflows/vector-api-classifier-preflight.yml').read_text())
    build_job = workflow['jobs']['candidate-build']
    preflight = workflow['jobs']['preflight']
    assert build_job['timeout-minutes'] == 90 and preflight['timeout-minutes'] == 120
    assert build_job['strategy']['max-parallel'] == 1 and build_job['strategy']['fail-fast'] is True
    assert preflight['needs'] == 'candidate-build' and 'always()' not in preflight.get('if', '')
    branch = workflow['on']['push']['branches'][0]
    assert branch == 'codex/vector-api-classifier-preflight'
    for job in workflow['jobs'].values():
        assert 'github.run_attempt == 1' in job['if']
        for step in job['steps']:
            if 'run' in step:
                subprocess.run(['bash', '-n', '-c', step['run']], check=True)
                assert '--retry' not in step['run']
        assert any(step.get('if') == 'always()' and step.get('uses', '').startswith('actions/upload-artifact@')
                   for step in job['steps'])
    assert '80 * 60' in build_job['steps'][0]['run'] and '100 * 60' in preflight['steps'][0]['run']
    for old in ['vector-api-roundtrip-reduction.yml', 'vector-api-roundtrip-resume.yml',
                'vector-api-native-unroll.yml', 'vector-api-qualification.yml']:
        old_flow = yaml.safe_load((repo / '.github/workflows' / old).read_text())
        assert not any(fnmatch.fnmatchcase(branch, pattern) for pattern in old_flow['on']['push']['branches'])
    all_run = '\n'.join(step.get('run', '') for job in workflow['jobs'].values() for step in job['steps'])
    assert 'run_roundtrip_candidate.py' not in all_run and 'run_roundtrip_full.py' not in all_run
    assert '--historical-control --execute' in all_run and '12015894519' in all_run
    passed('workflow caps, capture deadlines, failure dependencies, no retries or old timing triggers')

    upload = next(step['with']['path'] for step in build_job['steps']
                  if step.get('uses', '').startswith('actions/upload-artifact@'))
    for level in ['release', 'fastdebug']:
        active.update(level=level, failure=False)
        out = root / level / 'backend-build'
        argv = ['build_classifier_image.py', '--source', str(scaffold), '--historical-built',str(histories[level]),
            '--template-jdk',str(controls[level]), '--boot-built',str(histories['release']),
            '--boot-jdk',str(controls['release']), '--out',str(out), '--level',level, '--execute']
        with mock.patch.object(sys, 'argv', argv), mock.patch.object(producer, 'pins', return_value=pin), \
             mock.patch.object(producer, 'source_binding', side_effect=lambda root, p: binding.source_binding(repo, p)), \
             mock.patch.object(producer.os, 'uname', return_value=type('Host', (), {'machine':'aarch64'})()), \
             mock.patch.object(producer, 'toolchain', return_value=tools), \
             mock.patch.object(producer, 'run_logged', side_effect=fake_run), contextlib.redirect_stdout(io.StringIO()):
            producer.main()
        shutil.rmtree(scaffold / 'build')
        # Exercise the actual workflow upload globs/common root and tar round-trip.
        metadata = out.parent / 'input-metadata'
        metadata.mkdir(); (metadata / 'inert.json').write_text('{"fixture_only":true}\n')
        capture = next(step['run'] for step in build_job['steps']
                       if step.get('name') == 'Capture available input metadata after producer exit')
        subprocess.run(['bash','-euo','pipefail','-c',capture],cwd=out.parent,check=True)
        selected = set()
        for pattern in upload.splitlines():
            for path in out.parent.glob(pattern):
                selected.update(path.rglob('*') if path.is_dir() else [path])
        selected = {path for path in selected if path.is_file()}
        archive = root / (level + '-WORKFLOW-FIXTURE.zip')
        with zipfile.ZipFile(archive, 'w') as z:
            for path in sorted(selected):
                z.write(path, path.relative_to(out).as_posix())
        consumer = root / ('consumer-' + level)
        with zipfile.ZipFile(archive) as z:
            assert all(name in z.namelist() for name in ['classifier-build.json',
                'classifier-jdk.tar.gz','input-metadata/inert.json'])
            z.extractall(consumer)
        image_root = root / ('image-' + level)
        with mock.patch.object(sys, 'argv', ['classifier_inputs.py', 'extract',
            str(consumer / 'classifier-jdk.tar.gz'), str(image_root)]):
            inputs.main()
        control = binding.historical_binding(histories[level], controls[level], level, pin)
        boot = binding.historical_binding(histories['release'], controls['release'], 'release', pin)
        image = image_root / 'classifier-jdk'
        verify = lambda: binding.verify_candidate(consumer, image, level, source, control, boot, pin)
        assert verify()['qualified'] is False
        cli_argv=['verify_classifier_images.py','--candidate-built',str(consumer),'--candidate',str(image),
            '--historical-built',str(histories[level]),'--control',str(controls[level]),
            '--boot-built',str(histories['release']),'--boot-jdk',str(controls['release']),'--level',level]
        with mock.patch.object(sys,'argv',cli_argv),mock.patch.object(consumer_cli,'pins',return_value=pin), \
                mock.patch.object(consumer_cli,'source_binding',return_value=source),contextlib.redirect_stdout(io.StringIO()):
            consumer_cli.main()
        passed(level + ': actual producer/workflow archive/independent consumer round-trip')
        document = consumer / 'classifier-build.json'
        original = json.loads(document.read_text())
        for field, wrong, error in [('status','building','Incomplete'), ('level','other','wrong-level'),
                ('source',{},'Candidate source'), ('historical_control',{},'control/template/boot'),
                ('boot',{},'control/template/boot'), ('new_control_builds',1,'build scope'),
                ('new_module_builds',1,'build scope'), ('same_toolchain_performance_pair',True,'mislabeled'),
                ('tools_after',{},'toolchain'), ('make',['make','images'],'make target')]:
            value = copy.deepcopy(original); value[field] = wrong; document.write_text(json.dumps(value))
            rejected(level + ': rejects ' + field, verify, error)
        document.write_text(json.dumps(original))
        lib = image / 'lib/server/libjvm.so'; saved = lib.read_bytes()
        lib.write_bytes((controls[level] / 'lib/server/libjvm.so').read_bytes())
        rejected(level + ': rejects stale control VM in candidate role', verify, 'Image bytes')
        lib.write_bytes(saved)
        log = consumer / 'candidate/build.log'; saved = log.read_bytes(); log.write_text('tampered')
        rejected(level + ': rejects altered build/link evidence', verify, 'evidence bytes')
        log.write_bytes(saved)
        hist_doc = histories[level] / 'matched-build-plan.json'; saved = hist_doc.read_bytes()
        value = json.loads(saved); value['source']['rebuilt_b3']['head'] = '0' * 40
        hist_doc.write_text(json.dumps(value))
        rejected(level + ': rejects historical source rewrite',
                 lambda: binding.historical_binding(histories[level], controls[level], level, pin), 'Historical build plan')
        hist_doc.write_bytes(saved)
        lib=controls[level]/'lib/server/libjvm.so'; saved=lib.read_bytes(); lib.write_text('wrong control VM')
        rejected(level + ': rejects corrupt historical control payload',
                 lambda: binding.historical_binding(histories[level],controls[level],level,pin),'Image bytes')
        lib.write_bytes(saved)
        assert verify()['same_toolchain_performance_pair'] is False

    active.update(level='release', failure=True)
    fail = root / 'failed-producer'
    argv = ['build_classifier_image.py','--source',str(scaffold),'--historical-built',str(histories['release']),
        '--template-jdk',str(controls['release']),'--boot-built',str(histories['release']),
        '--boot-jdk',str(controls['release']),'--out',str(fail),'--level','release','--execute']
    before = len(calls)
    with mock.patch.object(sys, 'argv', argv), mock.patch.object(producer, 'pins', return_value=pin), \
         mock.patch.object(producer, 'source_binding', side_effect=lambda root, p: binding.source_binding(repo, p)), \
         mock.patch.object(producer.os, 'uname', return_value=type('Host', (), {'machine':'aarch64'})()), \
         mock.patch.object(producer, 'toolchain', return_value=tools), \
         mock.patch.object(producer, 'run_logged', side_effect=fake_run):
        rejected('failed producer stops before smoke/archive/completed record', producer.main, 'injected producer failure')
    assert json.loads((fail / 'classifier-build.json').read_text())['status'] == 'failed'
    assert not (fail / 'classifier-jdk.tar.gz').exists() and len(calls) - before == 5
    # Real bounded helper, using only a Python sleeper; no compiler or JVM.
    try:
        producer.run_logged([sys.executable,'-c','import time; print("fixture",flush=True); time.sleep(5)'],
                           root, dict(os.environ), root / 'timeout.log', .1)
    except subprocess.TimeoutExpired:
        passed('real helper deadline preserves partial log and terminates child')
    else:
        raise AssertionError('Deadline did not fire')
    assert 'fixture' in (root / 'timeout.log').read_text()
    result = dict(passed=True, cases=cases, count=len(cases), native_CPP_builds=0, native_JVMs=0,
        compiler_or_JVM_processes_executed=0, producer_native_actions='Intercepted; inert files only',
        actual_retained_metadata_pins_checked=bool(a.native_metadata),
        source_binding=source, mocked_calls=calls, hosted_jobs=0, published=False)
    (root / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ['cases','mocked_calls','source_binding']},indent=2))


if __name__ == '__main__':
    main()
