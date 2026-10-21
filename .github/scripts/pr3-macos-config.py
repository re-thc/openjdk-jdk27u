# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Run four untimed PR3 interpreter configurations using one pinned CI image."""
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import sys
import tarfile
import urllib.error
import urllib.request
import zipfile

REPO = 're-thc/openjdk-jdk27u'
SOURCE = '9185bfbff87f9aadf572ea9ff751c92e3a1181fa'
TEST = 'test/jdk/jdk/internal/util/DecimalDigits/TestDecimalIntegers.java'
TEST_SHA = 'a31ec6120d058fc390be51b43bdd06362b2bcea87a09216ef15ee37d0cd7d64d'
RUN = 39415360083
IMAGE_HEAD = '5f51698fe9cae780ff696773a98345a87ffc2d43'
IMAGE_MERGE = '96ede7075cf9c09fd0f5890d8b682c67f25224b9'
BUILD_JOB = 119131138972
ARTIFACT = 12283824547
ZIP_SHA = '18a6f5230611232013b66321faee8ed331a0125616070aba34d9e5bb89b83f94'
FLAGS = ('UseFastIntegerIntrinsics', 'UseZmijIntegerIntrinsics')
EXPORT = '--add-exports=java.base/jdk.internal.util=ALL-UNNAMED'
CASES = (('defaults-compact', True, False), ('defaults-utf16', False, False),
         ('optout-compact', True, True), ('optout-utf16', False, True))


def digest(path):
    with path.open('rb') as source:
        return hashlib.file_digest(source, 'sha256').hexdigest()


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def validate_flags(text, compact, disabled):
    for name, expected in [(flag, not disabled) for flag in FLAGS] + [('CompactStrings', compact)]:
        match = re.search(r'^\s*bool\s+' + name + r'\s*=\s*(true|false)\b([^\n]*)$', text, re.M)
        if not match or (match[1] == 'true') != expected:
            raise ValueError('Unexpected flag value: ' + name)
        if name in FLAGS and not disabled and '{default}' not in match[2]:
            raise ValueError('Integer flag was not an unforced default: ' + name)
    if '460184 integer parsing/formatting assertions passed' not in text:
        raise ValueError('Full correctness fixture did not finish')


def execute_matrix(jdk, source, output):
    classes = output / 'classes'
    classes.mkdir()
    evidence = output / 'evidence'
    records = []
    env = os.environ.copy()
    for key in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'GH_TOKEN'):
        env.pop(key, None)

    def run(name, command, limit):
        record = {'name': name, 'command': list(map(str, command))}
        with (evidence / (name + '.log')).open('w') as log:
            try:
                record['exit'] = subprocess.run(record['command'], stdout=log,
                        stderr=subprocess.STDOUT, timeout=limit, env=env).returncode
            except subprocess.TimeoutExpired:
                record['exit'] = 124
                log.write('\nController timeout; this configuration is not retried.\n')
        records.append(record)
        save(evidence / 'commands.json', records)
        return record

    compile_result = run('compile-test', [jdk / 'bin/javac', '-J-XX:ActiveProcessorCount=2',
                         EXPORT, '-encoding', 'UTF-8', '-d', classes, source], 45)
    if compile_result['exit'] != 0:
        raise RuntimeError('Test compilation failed')
    common = [jdk / 'bin/java', '-Xint', '-Xshare:off', '-Xms64m', '-Xmx256m',
              '-XX:ActiveProcessorCount=2', '-XX:+UseG1GC', '-XX:+UnlockExperimentalVMOptions',
              '-XX:+UseFourByteObjectHeaders', '-XX:+PrintFlagsFinal', EXPORT]
    for name, compact, disabled in CASES:
        flags = ['-XX:' + ('+' if compact else '-') + 'CompactStrings']
        if disabled:
            flags += ['-XX:-' + flag for flag in FLAGS]
        result = run(name, common + flags + ['-cp', classes, 'TestDecimalIntegers'], 60)
        try:
            if result['exit'] != 0:
                raise ValueError('JVM/test exited ' + str(result['exit']))
            validate_flags((evidence / (name + '.log')).read_text(), compact, disabled)
            result['passed'] = True
        except ValueError as error:
            result.update(passed=False, error=str(error))
        save(evidence / 'commands.json', records)
    passed = len(records) == 5 and all(r.get('passed') for r in records[1:])
    save(evidence / 'result.json', {'passed': passed, 'configuration_count': len(records) - 1})
    print('FOUR_CONFIGURATIONS_PASS' if passed else 'CONFIGURATION_FAILURE', flush=True)
    return passed


def main():
    if platform.system() != 'Darwin' or platform.machine() != 'arm64':
        raise RuntimeError('A native macOS ARM64 host is required')
    output = Path(sys.argv[1]).resolve()
    output.mkdir()
    evidence = output / 'evidence'
    evidence.mkdir()
    headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'],
               'Accept': 'application/vnd.github+json'}
    api = 'https://api.github.com/repos/' + REPO + '/'

    def get(path):
        with urllib.request.urlopen(urllib.request.Request(api + path, headers=headers), timeout=20) as r:
            return json.load(r)

    artifact, run, job = get(f'actions/artifacts/{ARTIFACT}'), get(f'actions/runs/{RUN}'), get(f'actions/jobs/{BUILD_JOB}')
    pr = get('pulls/3')
    save(evidence / 'bindings.json', {'artifact': artifact, 'run': run, 'build_job': job,
         'test_source': SOURCE, 'test_sha256': TEST_SHA, 'expected_image_merge': IMAGE_MERGE,
         'current_pr_head': pr['head']['sha'],
         'probe_commit': os.environ['GITHUB_SHA'], 'run_attempt': os.environ['GITHUB_RUN_ATTEMPT']})
    if pr['head']['sha'] != SOURCE:
        raise ValueError('PR3 head changed; the approved probe binding must be reviewed')
    if (artifact['id'], artifact['name'], artifact['digest'], artifact['expired'],
        artifact['workflow_run']['id'], artifact['workflow_run']['head_sha']) != (
        ARTIFACT, 'bundles-macos-aarch64', 'sha256:' + ZIP_SHA, False, RUN, IMAGE_HEAD):
        raise ValueError('Retained artifact identity changed')
    if (run['head_sha'], run['conclusion'], job['run_id'], job['conclusion']) != (IMAGE_HEAD, 'success', RUN, 'success'):
        raise ValueError('Retained successful build/run binding changed')

    class NoRedirect(urllib.request.HTTPRedirectHandler):
        def redirect_request(self, request, response, code, message, response_headers, new_url):
            return None
    try:
        urllib.request.build_opener(NoRedirect()).open(
            urllib.request.Request(api + f'actions/artifacts/{ARTIFACT}/zip', headers=headers), timeout=20)
        raise ValueError('Expected artifact redirect')
    except urllib.error.HTTPError as response:
        if response.code != 302:
            raise
        location = response.headers['Location']
    if not location.startswith('https://'):
        raise ValueError('Artifact redirect is not HTTPS')
    archive = output / 'image.zip'
    # The signed storage request receives no GitHub Authorization header.
    with urllib.request.urlopen(location, timeout=120) as response, archive.open('wb') as target:
        shutil.copyfileobj(response, target)
    if digest(archive) != ZIP_SHA:
        raise ValueError('Artifact ZIP digest mismatch')
    package = output / 'jdk.tar.gz'
    with zipfile.ZipFile(archive) as z:
        matches = [name for name in z.namelist() if Path(name).name == 'jdk-macos-aarch64.tar.gz']
        if len(matches) != 1:
            raise ValueError('Expected exactly one release JDK bundle')
        with z.open(matches[0]) as origin, package.open('wb') as target:
            shutil.copyfileobj(origin, target)
    image = output / 'image'
    image.mkdir()
    with tarfile.open(package) as t:
        t.extractall(image, filter='data')
    homes = [p.parent for p in image.rglob('release') if (p.parent / 'bin/java').is_file()]
    if len(homes) != 1:
        raise ValueError('Expected one retained JDK home')
    jdk = homes[0]
    release = (jdk / 'release').read_text()
    if IMAGE_MERGE not in release or 'OS_ARCH="aarch64"' not in release:
        raise ValueError('Release source/architecture binding mismatch')
    source = output / 'TestDecimalIntegers.java'
    with urllib.request.urlopen(f'https://raw.githubusercontent.com/{REPO}/{SOURCE}/{TEST}', timeout=20) as response:
        source.write_bytes(response.read())
    if digest(source) != TEST_SHA:
        raise ValueError('Pinned correctness source digest mismatch')
    paths = ['bin/java', 'bin/javac', 'lib/server/libjvm.dylib', 'lib/modules', 'release']
    identities = {name: digest(jdk / name) for name in paths}
    save(evidence / 'image-sha256.json', identities)
    (evidence / 'release').write_text(release)
    shutil.copyfile(source, evidence / source.name)
    passed = execute_matrix(jdk, source, output)
    if identities != {name: digest(jdk / name) for name in paths}:
        raise ValueError('Retained JDK image changed during the checks')
    if not passed:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
