"""Exact source and independent historical-control bindings for classifier preflight."""
import hashlib
import json
import os
from pathlib import Path
import subprocess

FILES = ('bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release')
TOOLS = ('gcc-16', 'g++-16', 'mold', 'ld.mold', 'make', 'as', 'ar', 'ld', 'cc1', 'cc1plus')


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def record(path):
    path = Path(path)
    with path.open('rb') as stream:
        return dict(bytes=path.stat().st_size, sha256=hashlib.file_digest(stream, 'sha256').hexdigest())


def canonical(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def bare(value):
    return {key: value[key] for key in ('bytes', 'sha256')}


def pins():
    return json.loads(Path(__file__).with_name('classifier-provenance.json').read_text())


def git(root, *args):
    return subprocess.check_output(['git', '-C', str(root), *args], text=True).strip()


def source_binding(root, pin):
    head = git(root, 'rev-parse', 'HEAD')
    require(not os.environ.get('GITHUB_SHA') or os.environ['GITHUB_SHA'] == head,
            'Checkout differs from executing workflow head')
    require(git(root, 'merge-base', pin['product_head'], head) == pin['product_head'],
            'Classifier product head is not an ancestor')
    trees = {name: git(root, 'rev-parse', 'HEAD:' + name) for name in pin['trees']}
    require(trees == pin['trees'], 'Product/test/make/bin tree differs from reviewed classifier')
    require(not git(root, 'status', '--porcelain', '--', 'src', 'test', 'make', 'bin', 'configure'),
            'Uncommitted product or test changes')
    paths = ('src', 'make', 'bin', 'configure')
    delta = git(root, 'diff', '--name-only', pin['control_head'], 'HEAD', '--', *paths).splitlines()
    require(delta == pin['product_delta'], 'Unexpected classifier production delta')
    patch = subprocess.check_output(['git', '-C', str(root), 'diff', '--binary',
        pin['control_head'], 'HEAD', '--', *paths])
    require(hashlib.sha256(patch).hexdigest() == pin['product_patch_sha256'], 'Product patch differs')
    require(record(Path(root) / 'bin/configure-dev') == pin['configure_profile'], 'Configure profile differs')
    return dict(workflow_head=head, product_head=pin['product_head'], trees=trees,
                product_patch_sha256=pin['product_patch_sha256'])


def verify_image(directory, expected):
    require(set(expected) == set(FILES), 'Incomplete image fingerprint')
    actual = {name: record(Path(directory) / name) for name in FILES}
    require(actual == {key: bare(value) for key, value in expected.items()}, 'Image bytes differ')
    return actual


def historical_binding(built, image, level, pin):
    expected = pin['historical'][level]
    plan = json.loads((Path(built) / 'matched-build-plan.json').read_text())
    results = json.loads((Path(built) / 'matched-build-results.json').read_text())
    require(canonical(plan) == expected['plan_canonical_sha256'], 'Historical build plan differs')
    require(canonical(results) == expected['results_canonical_sha256'], 'Historical build results differ')
    require(plan['level'] == level and plan['execution'] == 'completed' and
            plan['toolchain_unchanged_after_each_build'] is True, 'Incomplete/wrong-level historical build')
    require(plan['source']['candidate']['head'] == expected['build_head'] and
            plan['source']['rebuilt_b3']['head'] == pin['control_head'] and
            plan['source']['rebuilt_b3']['src_tree'] == expected['control_src_tree'],
            'Historical source binding differs')
    require(set(results) == {'candidate', 'rebuilt_b3'}, 'Historical image roles differ')
    require({k: bare(v) for k, v in results['rebuilt_b3']['image'].items()} == expected['image'],
            'Historical control role was replaced')
    verify_image(image, expected['image'])
    return dict(level=level, head=pin['control_head'], src_tree=expected['control_src_tree'],
        build_head=expected['build_head'], run_id=expected['run_id'], artifact_id=expected['artifact_id'],
        plan_canonical_sha256=expected['plan_canonical_sha256'],
        results_canonical_sha256=expected['results_canonical_sha256'], image=expected['image'])


def configure_arguments(level, boot):
    return ['--with-conf-name=native-candidate', '--with-debug-level=' + level,
            '--with-boot-jdk=' + str(boot), '--with-native-debug-symbols=none', '--with-jobs=1']


def verify_candidate(built, image, level, source, control, boot, pin):
    built = Path(built)
    result = json.loads((built / 'classifier-build.json').read_text())
    require(json.loads((built / 'classifier-provenance.json').read_text()) == pin,
            'Candidate provenance snapshot differs')
    require(result['schema'] == 1 and result['status'] == 'completed' and result['level'] == level,
            'Incomplete/wrong-level classifier build')
    require(result['source'] == source, 'Candidate source does not match this workflow checkout')
    require(result['historical_control'] == control and result['boot'] == boot,
            'Candidate control/template/boot binding differs')
    require(result['new_hotspot_builds'] == 1 and result['new_control_builds'] == 0 and
            result['new_module_builds'] == 0, 'Unexpected build scope')
    require(result['configure'][2:] == configure_arguments(level, result['boot_image_root']) and
            result['configure'][:1] == ['bash'] and result['configure'][1].endswith('/bin/configure-dev'),
            'Unexpected candidate configure command')
    require(result['make'][1:] == ['CONF=native-candidate', 'hotspot'], 'Unexpected make target')
    require(set(result['tool_paths']) == set(TOOLS) and result['make'][0] == result['tool_paths']['make'] and
            result['compiler_env'] == {'CC':result['tool_paths']['gcc-16'], 'CXX':result['tool_paths']['g++-16']},
            'Compiler/tool path binding differs')
    require(set(result['tools_before']) == set(TOOLS) and
            result['tools_before'] == result['tools_after'], 'Incomplete or changed toolchain')
    require(result['same_toolchain_performance_pair'] is False, 'Historical controls mislabeled as matched')
    actual = verify_image(image, result['image'])
    for name in ('bin/java', 'lib/modules', 'release'):
        require(actual[name] == control['image'][name], 'Java template/module changed')
    require(actual['lib/server/libjvm.so'] != control['image']['lib/server/libjvm.so'],
            'Candidate still contains the historical control VM')
    evidence = result['evidence']
    require(all(name in evidence for name in ('candidate/configure.log', 'candidate/build.log',
        'candidate/java-version.txt', 'candidate/spec.gmk')), 'Required build/link/smoke evidence missing')
    for name, expected in evidence.items():
        path = built / name
        require(path.resolve().is_relative_to(built.resolve()), 'Evidence path escapes build output')
        require(record(path) == expected, 'Build evidence bytes differ: ' + name)
    return dict(candidate_source=source, historical_control=control, level=level,
        candidate_image=actual, same_toolchain_performance_pair=False, qualified=False)
