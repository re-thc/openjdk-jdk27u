#!/usr/bin/env python3
"""Build candidate and exact-b3 release HotSpot with one native toolchain."""
import argparse
import json
import os
import pathlib
import shutil
import subprocess
import tarfile

from run_release_causal import B3, record

PRODUCT_DELTA = ['src/hotspot/cpu/aarch64/aarch64_vector.ad',
                 'src/hotspot/cpu/aarch64/aarch64_vector_ad.m4']


def git(root, *args):
    return subprocess.check_output(['git', '-C', str(root), *args], text=True).strip()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--candidate-source', type=pathlib.Path, default=pathlib.Path('.'))
    p.add_argument('--control-source', type=pathlib.Path)
    p.add_argument('--template-jdk', type=pathlib.Path, required=True)
    p.add_argument('--boot-jdk', type=pathlib.Path, required=True)
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--level', choices=['release', 'fastdebug'], required=True)
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    candidate = a.candidate_source.resolve()
    production = ['src', 'make', 'bin', 'configure']
    delta = git(candidate, 'diff', '--name-only', B3, 'HEAD', '--', *production).splitlines()
    if sorted(delta) != PRODUCT_DELTA or git(candidate, 'status', '--porcelain', '--', *production):
        p.error('Candidate production delta must be exactly the two clean backend files')
    sources = {'candidate': candidate}
    if a.level == 'release':
        if not a.control_source:
            p.error('Release requires exact-b3 control checkout')
        control = a.control_source.resolve()
        if git(control, 'rev-parse', 'HEAD') != B3 or git(control, 'status', '--porcelain', '--', *production):
            p.error('Control checkout must be clean exact b3 production')
        if git(control, 'rev-parse', 'HEAD:src') != git(candidate, 'rev-parse', B3 + ':src'):
            p.error('Control production source tree differs from b3')
        if (control / 'bin/configure-dev').read_bytes() != (candidate / 'bin/configure-dev').read_bytes():
            p.error('Configure profiles differ')
        sources = {'rebuilt_b3': control, **sources}
    template, boot = a.template_jdk.resolve(), a.boot_jdk.resolve()
    args = ['--with-conf-name=native-candidate', '--with-debug-level=' + a.level,
            '--with-boot-jdk=' + str(boot), '--with-native-debug-symbols=none', '--with-jobs=4']
    plan = {'scope': 'Native isolated HotSpot overlays, unchanged b3 Java modules',
            'level': a.level, 'archived_b3': B3, 'same_native_job': True,
            'configure_arguments_identical': args, 'make_arguments_identical': ['CONF=native-candidate', 'hotspot'],
            'template': {s: record(template / s) for s in ['bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release']},
            'boot': {s: record(boot / s) for s in ['bin/java', 'lib/modules', 'release']},
            'source': {k: {'path': str(v), 'head': git(v, 'rev-parse', 'HEAD'),
                           'src_tree': git(v, 'rev-parse', 'HEAD:src'),
                           'configure_profile': record(v / 'bin/configure-dev')}
                       for k, v in sources.items()},
            'candidate_production_delta': delta,
            'execution': 'requested' if a.execute else 'pending'}
    (out / 'matched-build-plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    (out / 'backend-provenance.json').write_bytes((candidate / 'qualification/native_unroll/backend-provenance.json').read_bytes())
    (out / 'product.patch').write_text(git(candidate, 'diff', B3, 'HEAD', '--', 'src') + '\n')
    if not a.execute:
        print('MATCHED_BUILD_PLAN_JSON=' + json.dumps(plan)); return
    if os.uname().machine != 'aarch64':
        p.error('Native AArch64 required')
    tool_paths = {}
    for name in ['gcc-16', 'g++-16', 'mold', 'ld.mold', 'make', 'as', 'ar', 'ld']:
        path = shutil.which(name)
        if not path:
            p.error('Missing native tool: ' + name)
        tool_paths[name] = pathlib.Path(path).resolve()
    for label, compiler, program in [('cc1', 'gcc-16', 'cc1'), ('cc1plus', 'g++-16', 'cc1plus')]:
        name = subprocess.check_output([str(tool_paths[compiler]), '-print-prog-name=' + program], text=True).strip()
        path = pathlib.Path(name) if pathlib.Path(name).is_absolute() else pathlib.Path(shutil.which(name) or name)
        tool_paths[label] = path.resolve()
    tools = {k: record(v) for k, v in tool_paths.items()}
    env = {**os.environ, 'CC': str(tool_paths['gcc-16']), 'CXX': str(tool_paths['g++-16'])}
    for name in ['gcc-16', 'g++-16', 'mold']:
        (out / (name + '-version.txt')).write_text(subprocess.check_output([str(tool_paths[name]), '--version'], text=True))
    plan['toolchain_before_builds'] = tools
    (out / 'matched-build-plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    results = {}
    for label, source in sources.items():
        image_name = 'rebuilt-b3-jdk' if label == 'rebuilt_b3' else 'candidate-jdk'
        image = out / image_name
        shutil.copytree(template, image, symlinks=True)
        logs = out / label
        logs.mkdir()
        configure = ['bash', str(source / 'bin/configure-dev'), *args]
        make = [str(tool_paths['make']), 'CONF=native-candidate', 'hotspot']
        commands = {'configure': configure, 'make': make,
                    'compiler_env': {k: env[k] for k in ['CC', 'CXX']}, 'cwd': str(source)}
        (logs / 'commands.json').write_text(json.dumps(commands, indent=2) + '\n')
        for operation, argv in [('configure', configure), ('build', make)]:
            with (logs / (operation + '.log')).open('w') as f:
                subprocess.run(argv, cwd=source, env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
        lib = source / 'build/native-candidate/support/modules_libs/java.base/server/libjvm.so'
        shutil.copy2(lib, image / 'lib/server/libjvm.so')
        for spec in (source / 'build/native-candidate').glob('*spec.gmk'):
            shutil.copy2(spec, logs / spec.name)
        with (logs / 'java-version.txt').open('w') as f:
            subprocess.run([str(image / 'bin/java'), '-version'], stdout=f, stderr=subprocess.STDOUT, check=True)
        image_records = {s: record(image / s) for s in ['bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release']}
        for s in ['bin/java', 'lib/modules', 'release']:
            if image_records[s]['sha256'] != plan['template'][s]['sha256']:
                raise RuntimeError('Java module/template changed: ' + label + ' ' + s)
        results[label] = {'commands': commands, 'image': image_records,
                          'configs': [record(f) for f in sorted(logs.glob('*spec.gmk'))]}
        (out / 'matched-build-results.json').write_text(json.dumps(results, indent=2) + '\n')
        with tarfile.open(out / (image_name + '.tar.gz'), 'w:gz') as tf:
            tf.add(image, arcname=image_name)
        if {k: record(v)['sha256'] for k, v in tool_paths.items()} != {k: v['sha256'] for k, v in tools.items()}:
            raise RuntimeError('Toolchain bytes changed between matched builds')
    plan['execution'] = 'completed'
    plan['toolchain_unchanged_after_each_build'] = True
    (out / 'matched-build-plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    print('MATCHED_BUILD_RESULT_JSON=' + json.dumps({'plan': plan, 'results': results}), flush=True)


if __name__ == '__main__':
    main()
