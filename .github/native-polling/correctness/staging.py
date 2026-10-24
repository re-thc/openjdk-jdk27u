#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Build qualified clean harness sources and bind one same-run transfer."""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import tarfile
import time
import traceback

sys.dont_write_bytecode = True
CODE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('correctness_controller', CODE / 'controller.py')
c = importlib.util.module_from_spec(spec)
spec.loader.exec_module(c)


def context(expected):
    if not re.fullmatch(r'[0-9a-f]{40}', expected or ''):
        raise c.Failure('Full validation identity required')
    run_id = os.environ.get('GITHUB_RUN_ID', '')
    if (not re.fullmatch(r'[1-9][0-9]*', run_id) or os.environ.get('GITHUB_RUN_ATTEMPT') != '1'
            or os.environ.get('GITHUB_REPOSITORY') != c.REPOSITORY or os.environ.get('GITHUB_REF') != c.BRANCH):
        raise c.Failure('Dedicated first-attempt workflow run required')
    return {'schema': 1, 'repository': c.REPOSITORY, 'run_id': run_id, 'run_attempt': '1', 'validation': expected}


def source_states(inputs, pins):
    result = {}
    for name, pin in pins['sources'].items():
        source = inputs / name
        detached = subprocess.run(['git', '-C', str(source), 'symbolic-ref', '-q', 'HEAD'],
                                  capture_output=True, timeout=15).returncode == 1
        clean = not c.git(source, 'status', '--porcelain', '--untracked-files=all')
        commit = c.git(source, 'rev-parse', 'HEAD')
        if commit != pin['commit'] or not clean or not detached:
            raise c.Failure('Expected clean detached pinned source: ' + name)
        result[name] = {'commit': commit, 'tree': c.git(source, 'rev-parse', 'HEAD^{tree}'),
                        'clean': clean, 'detached': detached}
    return result


def build_plan(inputs, build, output):
    rows = [{'name': 'build-make-version', 'cap': 20, 'argv': ['make', '--version']}]
    for index, row in enumerate(json.loads((CODE / 'downloads.json').read_text()), 1):
        rows.append({'name': f'download-{index:02d}', 'cap': row['seconds'] + 5,
            'argv': ['curl', '--fail', '--location', '--connect-timeout', '15',
                     '--max-time', str(row['seconds']), '--max-filesize', str(row['max_bytes']),
                     '--output', str(inputs / row['path']), row['url']], 'download': row})
    rows.append({'name': 'build-clean-harness', 'cap': 480,
                 'argv': ['bash', str(CODE / 'prepare-clean-jtreg.sh'), str(inputs), str(build)]})
    return rows


def finish_plan(inputs, build, transfer, output, home, expected):
    rows = [
        {'name': 'build-jdk-version', 'cap': 20, 'argv': [home / 'bin/java', '-version']},
        {'name': 'build-ant-version', 'cap': 20, 'argv': [build / 'ant/apache-ant-1.10.15/bin/ant', '-version']},
        {'name': 'built-harness-version', 'cap': 30, 'argv': [home / 'bin/java', '-jar', build / 'jtreg/images/jtreg/lib/jtreg.jar', '-version']},
        {'name': 'package-verify-harness', 'cap': 60, 'argv': [sys.executable, '-I', CODE / 'staging.py', '--package',
            inputs, build, transfer, output, expected]}]
    for row in rows:
        row['argv'] = list(map(str, row['argv']))
    return rows


def combined_log(output, name):
    paths = list((output / 'commands').glob('*-' + name))
    if len(paths) != 1:
        raise c.Failure('Expected one command record: ' + name)
    return '\n'.join((paths[0] / n).read_text() for n in ('output.log', 'stderr.log')).strip()


def package(inputs, build, transfer, output, expected):
    qualified, pins = c.qualified_inputs(CODE)
    states = source_states(inputs, pins)
    initial = json.loads((build / 'input-identities.json').read_text())
    built = json.loads((build / 'output-identities.json').read_text())
    if initial['pins'] != pins or initial['recipe_sha256'] != c.RECIPE_SHA or initial['clean_sources_verified'] is not True or built['inputs'] != pins:
        raise c.Failure('Build did not use the qualified clean recipe')
    jdk_homes = [p.parent for p in (build / 'jdk17').rglob('release') if (p.parent / 'bin/javac').is_file()]
    if len(jdk_homes) != 1:
        raise c.Failure('Expected one pinned build JDK')
    home = jdk_homes[0]
    fields = dict(re.findall(r'^([A-Z0-9_]+)="([^"\r\n]*)"\r?$', (home / 'release').read_text(), re.M))
    selected = {k: fields.get(k) for k in ('IMPLEMENTOR', 'IMPLEMENTOR_VERSION', 'JAVA_RUNTIME_VERSION', 'JAVA_VERSION', 'OS_NAME', 'OS_ARCH')}
    tools = {'archives': pins['archives'], 'jdk_release': selected,
             'java_sha256': c.sha256(home / 'bin/java'), 'javac_sha256': c.sha256(home / 'bin/javac'),
             'java_version': combined_log(output, 'build-jdk-version'),
             'ant_version': combined_log(output, 'build-ant-version'),
             'make_version': combined_log(output, 'build-make-version'), 'host_python': sys.version.split()[0],
             'jtreg_version': combined_log(output, 'built-harness-version')}
    if not tools['jtreg_version'].startswith('jtreg 8.3-dev+1\n'):
        raise c.Failure('Built harness version execution did not match')
    image = build / 'jtreg/images/jtreg'
    if any(p.is_symlink() for p in image.rglob('*')):
        raise c.Failure('Unexpected harness output link')
    files = [{'path': str(p.relative_to(image)), 'size': p.stat().st_size, 'sha256': c.sha256(p)}
             for p in sorted(image.rglob('*')) if p.is_file()]
    if files != built['files']:
        raise c.Failure('Distribution changed after recipe verification')
    common = {**context(expected), 'recipe_origin_commit': c.RECIPE,
              'recipe_sha256': c.RECIPE_SHA, 'input_pins_sha256': c.INPUTS_SHA}
    manifest = {**common, 'version': '8.3-dev+1', 'inputs': pins, 'source_states': states,
                'tools': tools, 'release': built['release'], 'files': files}
    transfer.mkdir()
    with tarfile.open(transfer / 'jtreg.tar.gz', 'w:gz') as archive:
        archive.add(image, arcname='jtreg')
    c.write_json(transfer / 'jtreg-manifest.json', manifest)
    archive_sha = c.sha256(transfer / 'jtreg.tar.gz')
    manifest_sha = c.sha256(transfer / 'jtreg-manifest.json')
    receipt = {**common, 'source_commits': {n: p['commit'] for n, p in pins['sources'].items()},
               'tool_archives': pins['archives'], 'archive_sha256': archive_sha, 'manifest_sha256': manifest_sha}
    c.write_json(transfer / 'build-receipt.json', receipt)
    receipt_sha = c.sha256(transfer / 'build-receipt.json')
    verification = c.verify_transfer(transfer, build / 'transfer-verified', CODE, expected,
        common['run_id'], archive_sha, manifest_sha, receipt_sha)
    c.write_json(output / 'harness-verification.json', verification)
    c.write_json(output / 'staging-identities.json', {'inputs': pins, 'sources': states, 'tools': tools,
        'recipe_sha256': c.RECIPE_SHA, 'archive_bytes': (transfer / 'jtreg.tar.gz').stat().st_size})
    shutil.copy2(transfer / 'jtreg-manifest.json', output / 'staging-manifest.json')
    shutil.copy2(transfer / 'build-receipt.json', output / 'build-receipt.json')


def prepare(repo, inputs, output, transfer, expected):
    deadline = json.loads((output / 'job-start.json').read_text())['monotonic'] + 600
    runner = c.Runner(output, CODE / 'supervise.py', deadline)
    status = {'stage': 'staging', 'status': 'running', 'validation': expected}
    build = output.parent / 'native-kqueue-harness-build'
    def deadline_reached(sig, frame):
        raise c.Failure('Global 10-minute staging work deadline exhausted')
    signal.signal(signal.SIGALRM, deadline_reached)
    signal.setitimer(signal.ITIMER_REAL, max(.001, deadline - time.monotonic()))
    try:
        with runner.phase('staging', 600):
            context(expected)
            c.write_json(output / 'source-identities.json', c.validate_sources(repo, expected))
            qualified, pins = c.qualified_inputs(CODE)
            if sys.platform != 'linux' or os.uname().machine != 'x86_64' or sys.version_info < (3, 12):
                raise c.Failure('Native Linux x86_64 and Python 3.12+ required')
            required = ('bash', 'git', 'make', 'curl', 'sha1sum', 'tar', 'unzip', 'zip', 'sed', 'awk',
                'grep', 'find', 'which', 'sh', 'env', 'cat', 'cp', 'mv', 'rm', 'mkdir', 'chmod',
                'ln', 'dirname', 'basename', 'date', 'cut', 'tr', 'uname', 'head', 'sort', 'xargs', 'wc', 'gzip')
            if any(not shutil.which(n) for n in required) or shutil.disk_usage(output).free < 4 * 1024**3:
                raise c.Failure('Missing ordinary build tools or 4 GiB free disk')
            source_states(inputs, pins)
            (inputs / 'runtime').mkdir()
            plan = build_plan(inputs, build, output)
            c.write_json(output / 'command-plan.json', plan)
            downloads = []
            for row in plan:
                runner.run(row['name'], row['argv'], cap=row['cap'])
                if row['name'] == 'build-make-version' and not re.match(r'GNU Make 4\.', combined_log(output, row['name'])):
                    raise c.Failure('Ordinary Linux GNU make 4.x required')
                if 'download' in row:
                    pin = row['download']
                    path = inputs / pin['path']
                    actual = c.sha256(path)
                    downloads.append({**pin, 'bytes': path.stat().st_size, 'actual_sha256': actual})
                    c.write_json(output / 'download-identities.json', downloads)
                    if actual != pin['sha256'] or path.stat().st_size > pin['max_bytes']:
                        raise c.Failure('Pinned prerequisite checksum/size mismatch')
            homes = [p.parent for p in (build / 'jdk17').rglob('release') if (p.parent / 'bin/javac').is_file()]
            if len(homes) != 1:
                raise c.Failure('Expected one extracted build JDK')
            home = homes[0]
            runner.env['JAVA_HOME'] = str(home)
            runner.env['ANT_HOME'] = str(build / 'ant/apache-ant-1.10.15')
            final = finish_plan(inputs, build, transfer, output, home, expected)
            c.write_json(output / 'command-plan.json', plan + final)
            for row in final:
                runner.run(row['name'], row['argv'], cap=row['cap'])
            hashes = {}
            for name in c.RUNTIME_SOURCES:
                target = output / 'validation-source' / name
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(CODE / name, target)
                hashes[name] = c.sha256(target)
            c.write_json(output / 'runtime-source-hashes.json', hashes)
            verification = json.loads((output / 'harness-verification.json').read_text())
            if time.monotonic() >= deadline:
                raise c.Failure('Preparation work deadline exhausted')
            with Path(os.environ['GITHUB_OUTPUT']).open('a') as stream:
                for name in ('archive_sha256', 'manifest_sha256', 'receipt_sha256'):
                    stream.write(name + '=' + verification[name] + '\n')
            status['status'] = 'passed'
    except BaseException as exc:
        status.update(status='failed', error=repr(exc), traceback=traceback.format_exc())
        raise
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        try:
            c.cleanup(output)
        except BaseException as exc:
            status.update(status='failed', cleanup_error=repr(exc))
        finally:
            status['work_deadline_exhausted'] = time.monotonic() >= deadline
            if status['work_deadline_exhausted']:
                status['status'] = 'failed'
            c.write_json(output / 'status.json', status)
    if status['status'] != 'passed':
        raise c.Failure('Staging cleanup or deadline incomplete')


def main():
    if len(sys.argv) > 1 and sys.argv[1] == '--package':
        package(*map(Path, sys.argv[2:6]), sys.argv[6])
        return
    parser = argparse.ArgumentParser()
    for name in ('repo', 'inputs', 'output', 'transfer'):
        parser.add_argument('--' + name, required=True, type=Path)
    parser.add_argument('--expected-sha', required=True)
    args = parser.parse_args()
    def interrupted(sig, frame):
        raise InterruptedError('Termination signal ' + str(sig))
    signal.signal(signal.SIGTERM, interrupted)
    signal.signal(signal.SIGINT, interrupted)
    prepare(args.repo.resolve(), args.inputs.resolve(), args.output.resolve(), args.transfer.resolve(), args.expected_sha)


if __name__ == '__main__':
    main()
