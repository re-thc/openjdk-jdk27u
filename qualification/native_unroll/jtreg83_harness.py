"""Separate jtreg83 experiment; planning and byte verification never start a JVM."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import zipfile

from classifier_images import canonical, git, record, require

EXPERIMENT = 'pr14-classifier-jtreg83-v1'
SOURCE = '551e17adac0579859012c4c46318b8fa3cf2ff37'
VERSION = '8.3-dev+1'


def pins():
    return json.loads(Path(__file__).with_name('jtreg83-provenance.json').read_text())


def inventory(image):
    image = Path(image)
    require(image.is_dir() and not image.is_symlink(), 'Harness directory must be real')
    jars = sorted(image.rglob('*.jar'))
    require(all(not p.is_symlink() and p.resolve().is_relative_to(image.resolve()) for p in jars),
            'Harness JAR symlink/escape')
    actual = {p.relative_to(image).as_posix(): record(p) for p in jars}
    require(set(actual) == set(pins()['installed']['consumer_jars']), 'Seven-JAR inventory differs')
    with zipfile.ZipFile(image / 'lib/jtreg.jar') as z:
        manifest = z.read('META-INF/MANIFEST.MF').decode()
    require('jtreg-VersionString: ' + VERSION + '\r\n' in manifest.replace('\r\n', '\n').replace('\n', '\r\n'),
            'Harness version differs')
    return actual


def verify_installed(image):
    actual = inventory(image)
    require(actual == pins()['installed']['consumer_jars'], 'Installed jtreg83 bytes differ')
    return actual


def ci_identity():
    keys = ('GITHUB_SHA', 'GITHUB_RUN_ID', 'GITHUB_RUN_ATTEMPT')
    require(all(os.environ.get(k) for k in keys), 'Missing CI identity')
    require(os.environ['GITHUB_RUN_ATTEMPT'] == '1', 'Only first CI attempt is admitted')
    return {k: os.environ[k] for k in keys}


def verify_ci(image, receipt):
    receipt = json.loads(Path(receipt).read_text())
    require(receipt['experiment'] == EXPERIMENT and receipt['source_commit'] == SOURCE and
            receipt['ci'] == ci_identity() and receipt['status'] == 'completed', 'CI harness provenance differs')
    require(receipt['source_clean'] is True and receipt['dependency_endpoints'] == pins()['ci']['dependency_endpoints'],
            'CI source/endpoint provenance differs')
    require(receipt['recipe_version_numbers'] == pins()['ci']['recipe_version_numbers'], 'CI dependency versions differ')
    actual = inventory(image)
    require(actual == receipt['consumer_jars'], 'CI harness changed since producer verification')
    return receipt


def smoke(image, jdk, out, execute=False):
    image, jdk, out = map(lambda p: Path(p).resolve(), (image, jdk, out))
    commands = [
        [str(jdk / 'bin/java'), '-jar', str(image / 'lib/jtreg.jar'), '-version'],
        [str(jdk / 'bin/java'), '-jar', str(image / 'lib/jtreg.jar'), '-jdk:' + str(jdk),
         '-othervm', '-concurrency:1', '-timeoutFactor:2', '-verbose:summary',
         '-w:' + str(out / 'work'), '-r:' + str(out / 'report'), str(out / 'suite/HarnessSmoke.java')]]
    plan = dict(experiment=EXPERIMENT, commands=commands, maximum_seconds=180,
                required_minimum='8.2.1+1', executes=execute)
    if not execute:
        return plan
    require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS')),
            'Inherited JVM options not admitted')
    out.mkdir(parents=True, exist_ok=False)
    (out / 'suite').mkdir()
    (out / 'suite/TEST.ROOT').write_text('requiredVersion=8.2.1+1\n')
    (out / 'suite/HarnessSmoke.java').write_text(
        '/* @test\n * @run main/othervm HarnessSmoke\n */\n'
        'public class HarnessSmoke { public static void main(String[] a) { '
        'System.out.println("HARNESS_MINIMUM_SMOKE_OK"); } }\n')
    for i, cmd in enumerate(commands):
        with (out / (str(i) + '.log')).open('w') as stream:
            status = subprocess.run(cmd, stdout=stream, stderr=subprocess.STDOUT, timeout=90)
        require(status.returncode == 0, 'Harness smoke command failed')
    require(VERSION in (out / '0.log').read_text(), 'Runtime harness version differs')
    reports = list((out / 'work').rglob('HarnessSmoke.jtr'))
    require(len(reports) == 1 and 'test result: Passed.' in reports[0].read_text() and
            'HARNESS_MINIMUM_SMOKE_OK' in reports[0].read_text(), 'Minimum smoke did not execute/pass')
    plan['passed'] = True
    (out / 'result.json').write_text(json.dumps(plan, indent=2) + '\n')
    return plan


def build_ci(source, jdk, receipt, execute=False):
    source, jdk, receipt = map(lambda p: Path(p).resolve(), (source, jdk, receipt))
    pin = pins()['ci']
    plan = dict(experiment=EXPERIMENT, source_commit=SOURCE, maximum_seconds=1200,
                command=['bash', 'make/build.sh', '--jdk', str(jdk)],
                dependency_endpoints=pin['dependency_endpoints'], executes=execute)
    if not execute:
        return plan
    require(git(source, 'rev-parse', 'HEAD') == SOURCE and not git(source, 'status', '--porcelain'),
            'Unreviewed/dirty jtreg83 source')
    require(not (source / 'build').exists(), 'Fresh CI harness build required')
    versions = {}
    for line in (source / 'make/build-support/version-numbers').read_text().splitlines():
        if '=' in line and not line.startswith('#'):
            k, v = line.split('=', 1)
            versions[k] = v
    require(versions == pin['recipe_version_numbers'], 'Tagged dependency recipe differs')
    env = {k:v for k,v in os.environ.items() if k in ('PATH','HOME','LANG','TMPDIR','HTTPS_PROXY','HTTP_PROXY',
        'ALL_PROXY','NO_PROXY','https_proxy','http_proxy','all_proxy','no_proxy')}
    env.update(JAVA_HOME=str(jdk), JTREG_BUILD_MILESTONE='dev', JTREG_BUILD_NUMBER='1', MAKE_ARGS='-j2',
               CODE_TOOLS_URL_BASE=pin['dependency_endpoints']['code_tools'],
               MAVEN_REPO_URL_BASE=pin['dependency_endpoints']['maven'],
               ANT_ARCHIVE_URL_BASE=pin['dependency_endpoints']['ant'],
               WGET='/usr/bin/wget', WGET_OPTIONS='--tries=1 --timeout=45 --max-redirect=10',
               CURL='/usr/bin/curl', CURL_OPTIONS='--fail --location --retry 0 --connect-timeout 20 --max-time 60')
    receipt.parent.mkdir(parents=True, exist_ok=True)
    identity = ci_identity()
    tools = {name:record(Path(shutil.which(name))) for name in ('bash','make','wget','curl')}
    before = {str(p.relative_to(source)): record(p) for p in sorted((source / 'make').rglob('*')) if p.is_file()}
    with receipt.with_suffix('.log').open('w') as stream:
        result = subprocess.run(plan['command'], cwd=source, env=env, stdout=stream,
                                stderr=subprocess.STDOUT, timeout=1100)
    require(result.returncode == 0, 'jtreg83 source build failed; no fallback or retry')
    image = source / 'build/images/jtreg'
    actual = inventory(image)
    require(git(source, 'rev-parse', 'HEAD') == SOURCE and
            git(source, 'status', '--porcelain', '--untracked-files=no') == '', 'Build changed tracked harness source')
    require(tools == {name:record(Path(shutil.which(name))) for name in tools}, 'Build tools changed during harness build')
    archives = {str(p.relative_to(source)): record(p) for p in sorted((source / 'build/deps').rglob('*'))
                if p.is_file() and p.suffix in ('.zip', '.jar', '.gz')}
    licenses = {str(p.relative_to(image)): record(p) for p in sorted(image.rglob('*'))
                if p.is_file() and (p.name in ('LICENSE','COPYRIGHT') or 'legal' in p.parts)}
    value = dict(experiment=EXPERIMENT, status='completed', source_commit=SOURCE, source_clean=True,
        ci=identity, recipe_version_numbers=versions, dependency_endpoints=pin['dependency_endpoints'],
        recipe_files=before, dependency_archives=archives, installed_notices=licenses, build_tools=tools,
        build_jdk={name:record(jdk / name) for name in ('bin/java','bin/javac','release')},
        consumer_jars=actual, consumer_inventory_sha256=canonical(actual),
        installed_distribution_byte_equivalence=False, binary_publication=False)
    receipt.write_text(json.dumps(value, indent=2) + '\n')
    return value


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('operation', choices=['verify-installed','verify-ci','smoke','build-ci'])
    p.add_argument('--image', type=Path)
    p.add_argument('--jdk', type=Path)
    p.add_argument('--source', type=Path)
    p.add_argument('--receipt', type=Path)
    p.add_argument('--out', type=Path)
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    if a.operation == 'verify-installed':
        value = verify_installed(a.image)
    elif a.operation == 'verify-ci':
        value = verify_ci(a.image, a.receipt)
    elif a.operation == 'smoke':
        value = smoke(a.image, a.jdk, a.out, a.execute)
    else:
        value = build_ci(a.source, a.jdk, a.receipt, a.execute)
    print('JTREG83_RESULT=' + json.dumps(value, sort_keys=True))


if __name__ == '__main__':
    main()
