"""Exact source and independent historical-control bindings for classifier preflight."""
import hashlib
import json
import os
from pathlib import Path
import stat
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


def payload_manifest(root):
    """Hash every entry without following symlinks; include directories and modes."""
    root = Path(root)
    manifest = {}
    def visit(path):
        info = path.lstat()
        entry = dict(mode=stat.S_IMODE(info.st_mode))
        if stat.S_ISLNK(info.st_mode):
            entry.update(type='symlink', target=os.readlink(path))
        elif stat.S_ISREG(info.st_mode):
            entry.update(type='file', **record(path))
        elif stat.S_ISDIR(info.st_mode):
            entry.update(type='directory')
        else:
            raise RuntimeError('Unsupported payload entry: ' + str(path))
        manifest[path.relative_to(root).as_posix()] = entry
        if entry['type'] == 'directory':
            for child in sorted(path.iterdir()):
                visit(child)
    require(root.is_dir() and not root.is_symlink(), 'Payload root must be a real directory')
    visit(root)
    return manifest


def verify_overlay(template, candidate):
    intended = 'lib/server/libjvm.so'
    require(set(template) == set(candidate), 'Overlay entry set differs')
    require(template[intended]['type'] == candidate[intended]['type'] == 'file' and
            template[intended]['mode'] == candidate[intended]['mode'], 'Overlay libjvm type/mode differs')
    require({k:v for k,v in template.items() if k != intended} ==
            {k:v for k,v in candidate.items() if k != intended}, 'Unexpected overlay payload delta')
    require(template[intended] != candidate[intended], 'Candidate still contains the historical control VM')


def frozen_binding(root, pin):
    actual = {name:payload_manifest(Path(root) / name) for name in pin['frozen_payloads']}
    # Retained native records pin class bytes, not original archive permissions.
    # Record all consumer modes, but do not invent historical mode fingerprints.
    content = {name:{path:{k:v for k,v in entry.items() if k != 'mode'}
                    for path,entry in payload.items()} for name,payload in actual.items()}
    require(content == pin['frozen_payloads'], 'Frozen WhiteBox/classes payload differs')
    return actual


def executed_binding(root):
    """Bind checked-out workflow/qualification bytes to this exact Git HEAD."""
    paths = ('.github/workflows', 'qualification')
    require(not git(root, 'status', '--porcelain', '--untracked-files=all', '--', *paths),
            'Uncommitted executed workflow/harness input')
    require(not git(root, 'ls-files', '--others', '--', *paths),
            'Untracked or ignored executed workflow/harness input')
    rows = subprocess.check_output(['git', '-C', str(root), 'ls-tree', '-rz', 'HEAD', '--', *paths])
    manifest = {}
    for row in rows.split(b'\0'):
        if not row:
            continue
        metadata, name = row.split(b'\t', 1)
        mode, kind, oid = metadata.decode().split()
        name = name.decode(); path = Path(root) / name
        require(kind == 'blob', 'Unexpected executed input kind')
        info = path.lstat()
        if mode == '120000':
            require(stat.S_ISLNK(info.st_mode), 'Executed input symlink changed: ' + name)
            data = os.readlink(path).encode()
        else:
            require(mode in ('100644', '100755') and stat.S_ISREG(info.st_mode) and
                    bool(info.st_mode & stat.S_IXUSR) == (mode == '100755'),
                    'Executed input type/mode changed: ' + name)
            data = path.read_bytes()
        digest = hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        require(digest == oid, 'Executed input bytes differ from HEAD: ' + name)
        manifest[name] = dict(git_mode=mode, worktree_mode=stat.S_IMODE(info.st_mode),
            blob=oid, bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
    return dict(trees={name:git(root, 'rev-parse', 'HEAD:' + name) for name in paths},
                manifest=manifest)


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
                product_patch_sha256=pin['product_patch_sha256'], executed_inputs=executed_binding(root))


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
        results_canonical_sha256=expected['results_canonical_sha256'], image=expected['image'],
        payload=payload_manifest(image))


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
    payload = payload_manifest(image)
    require(payload == result['candidate_payload'], 'Candidate full payload manifest differs')
    verify_overlay(control['payload'], payload)
    evidence = result['evidence']
    require(all(name in evidence for name in ('candidate/configure.log', 'candidate/build.log',
        'candidate/java-version.txt', 'candidate/spec.gmk')), 'Required build/link/smoke evidence missing')
    for name, expected in evidence.items():
        path = built / name
        require(path.resolve().is_relative_to(built.resolve()), 'Evidence path escapes build output')
        require(record(path) == expected, 'Build evidence bytes differ: ' + name)
    return dict(candidate_source=source, historical_control=control, level=level,
        candidate_image=actual, candidate_payload=payload,
        same_toolchain_performance_pair=False, qualified=False)
