#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""One pinned native kqueue correctness run; no timing workloads."""
import argparse
from contextlib import contextmanager
import hashlib
import json
import os
from pathlib import Path
import re
import resource
import shutil
import signal
import subprocess
import sys
import tarfile
import threading
import time
import traceback

BASE = '8d030adbd245b19e6339e3ccd052eb7fe3635319'
RESET = 'a1d7a297b6a22d72bde8a051d6aa3a910cdcf77c'
ORIGINAL = '28a8b6162eaf5b4584e9b5d66c28359a336aa831'
CANDIDATE = 'cf218dc255de70fcd52903e5d85ef4aef11b564c'
RECIPE = '02e3c3be1bf529b0b682dc35dbd1fe67b58b6643'
BRANCH = 'refs/heads/qualify/native-kqueue-correctness-once'
REPOSITORY = 're-thc/openjdk-jdk27u'
TRANSFER_NAME = 'native-kqueue-clean-jtreg-20261024'
ARCHIVE_SHA = '3e6696fca570ec2d8d0781d4b4d550d0e30b8414300cd6a6f507a5f2eb8b8697'
MANIFEST_SHA = '78797074289179427d2522da5b199857c2db2645e6dd6423a8ecc2721ddf8dfb'
ARCHIVE_BYTES = 10214570
BOOT_URL = 'https://download.java.net/java/GA/jdk26/c3cc523845074aa0af4f5e1e1ed4151d/35/GPL/openjdk-26_macos-aarch64_bin.tar.gz'
BOOT_SHA = '254586bcd1bf6dcd125ad667ac32562cb1e2ab1abf3a61fb117b6fabb571e765'
BREW_VERSIONS = {'autoconf': '2.73', 'make': '4.4.1', 'm4': '1.4.21'}
PHASES = {'setup': 300, 'build': 2400, 'correctness': 1200}
MiB = 1024 * 1024
EXPORT_LIMIT = 128 * MiB
ROOT_RESULTS = ('job-start.json', 'collection.json', 'status.json', 'source-identities.json',
    'command-plan.json', 'harness-verification.json', 'toolchain.json', 'bootjdk.json',
    'image.json', 'candidate-version.json', 'test-results.json', 'helper-identities.json', 'native-results.json', 'runtime-source-hashes.json')
RUNTIME_SOURCES = ('controller.py', 'supervise.py', 'manifest_image.py', 'harness-manifest.json',
    'native/signal.c', 'native/mock/test.c', 'native/mock/sys/event.h',
    'native/stubs/jlong.h', 'native/stubs/jni_util.h', 'native/stubs/nio.h', 'native/stubs/nio_util.h')
SHARED = ['java/nio/channels/Selector/' + name + '.java' for name in (
    'ChangingInterests', 'LotsOfUpdatesTest', 'RaceUpdatesAndClose', 'RacyDeregister',
    'CloseThenRegister', 'RegAfterPreClose', 'SelectAndCancel', 'SelectAndClose',
    'Wakeup', 'WakeupNow', 'WakeupOverflow')]
SHARED += ['java/nio/channels/DatagramChannel/' + name + '.java' for name in ('Disconnect', 'AfterDisconnect')]
TESTS = [(name, '') for name in SHARED]
TESTS += [('java/nio/channels/vthread/SelectorOps.java#' + mode, '') for mode in ('default', 'poller-modes')]
TESTS += [('java/nio/channels/Selector/KQueueBatchUpdates.java', '-' + str(i)) for i in range(5)]
TESTS += [('sun/nio/ch/KQueueRegistration.java', '')]


class Failure(RuntimeError):
    pass


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, indent=2, allow_nan=False) + '\n')
    os.replace(temporary, path)


def sha256(path):
    value = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(MiB), b''):
            value.update(block)
    return value.hexdigest()


def git(repo, *args):
    return subprocess.check_output(['git', '-C', str(repo), *args], text=True, timeout=15).strip()


def start_identity(pid):
    return subprocess.check_output(['ps', '-p', str(pid), '-o', 'lstart='], text=True, timeout=3).strip()


def stop_group(pid):
    # Hold the supervisor until KILL so its PID/PGID cannot be reused mid-cleanup.
    for sig in (signal.SIGTERM, signal.SIGKILL):
        try:
            os.killpg(pid, sig)
        except ProcessLookupError:
            break
        if sig == signal.SIGTERM:
            time.sleep(.2)


def cleanup(output):
    registry = Path(output) / 'active-processes.json'
    results = []
    for row in json.loads(registry.read_text()) if registry.exists() else []:
        try:
            if start_identity(row['pid']) != row['start_identity']:
                raise Failure('Process identity changed; refusing to signal reused PID')
            stop_group(row['pid'])
            results.append({'pid': row['pid'], 'status': 'terminated'})
        except (subprocess.CalledProcessError, ProcessLookupError):
            results.append({'pid': row['pid'], 'status': 'already-exited'})
    write_json(Path(output) / 'cleanup.json', results)
    return results


class Runner:
    def __init__(self, output, supervisor, deadline):
        self.output, self.supervisor = Path(output), Path(supervisor)
        self.deadline = self.phase_deadline = deadline
        self.sequence = 0
        self.active = {}
        self.log_bytes = 0
        self.env = os.environ.copy()
        for key in list(self.env):
            if key.startswith(('JTREG_', 'JTHARNESS_', 'ASMTOOLS_', 'JUNIT_', 'TESTNG_', 'ANT_', 'JDK_JAVA_')) or key in (
                    'JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'CLASSPATH', 'JAVA_HOME', 'SDKROOT', 'CC', 'CXX',
                    'CFLAGS', 'CXXFLAGS', 'LDFLAGS', 'MAKE', 'MAKEFLAGS', 'M4', 'AUTOCONF', 'CONFIG_SITE'):
                self.env.pop(key)
        write_json(self.output / 'active-processes.json', [])

    @contextmanager
    def phase(self, name, cap):
        previous = self.phase_deadline
        start = time.monotonic()
        self.phase_deadline = min(self.deadline, start + cap)
        status = {'phase': name, 'cap_seconds': cap, 'status': 'running'}
        try:
            yield
            status['status'] = 'passed'
        except BaseException as exc:
            status.update(status='failed', error=repr(exc))
            raise
        finally:
            status['elapsed_seconds'] = time.monotonic() - start
            write_json(self.output / 'phases' / (name + '.json'), status)
            self.phase_deadline = previous

    def run(self, name, argv, *, cap, cwd=None):
        self.sequence += 1
        directory = self.output / 'commands' / f'{self.sequence:03d}-{name}'
        directory.mkdir(parents=True)
        receipt = directory / 'receipt.json'
        start = time.monotonic()
        limit = min(self.deadline, self.phase_deadline, start + cap)
        stream_cap = min((32 if name == 'build-image' else 8) * MiB,
                         max(0, (EXPORT_LIMIT - self.log_bytes) // 2))
        record = {'name': name, 'argv': [str(x) for x in argv], 'cwd': str(cwd or Path.cwd()),
                  'cap_seconds': cap, 'stream_cap_bytes': stream_cap, 'status': 'not-started'}
        process, pumps, totals = None, [], {}
        overflow = threading.Event()
        def pump(pipe, target, key):
            count = kept = 0
            try:
                with target.open('wb') as stream:
                    for data in iter(lambda: pipe.read(65536), b''):
                        count += len(data)
                        portion = data[:max(0, stream_cap - kept)]
                        stream.write(portion)
                        kept += len(portion)
                        if count > stream_cap:
                            overflow.set()
                totals[key] = {'observed_bytes': count, 'retained_bytes': kept, 'truncated': count > kept}
            except BaseException as exc:
                totals[key] = {'observed_bytes': count, 'retained_bytes': kept, 'error': repr(exc)}
                overflow.set()
            finally:
                pipe.close()
        write_json(directory / 'command.json', record)
        print(json.dumps({'command': name, 'event': 'start', 'cap_seconds': cap}), flush=True)
        try:
            if limit <= start or self.log_bytes >= EXPORT_LIMIT:
                raise Failure('Work deadline or aggregate log budget exhausted')
            process = subprocess.Popen([sys.executable, '-I', str(self.supervisor), str(receipt), *map(str, argv)],
                cwd=cwd, env=self.env, stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
            self.active[process.pid] = {'pid': process.pid, 'start_identity': start_identity(process.pid)}
            write_json(self.output / 'active-processes.json', list(self.active.values()))
            for key, pipe in (('output', process.stdout), ('stderr', process.stderr)):
                thread = threading.Thread(target=pump, args=(pipe, directory / (key + '.log'), key), daemon=True)
                thread.start()
                pumps.append(thread)
            record['status'] = 'running'
            last_progress = start
            while not receipt.exists():
                if overflow.is_set():
                    raise Failure('Command output limit exceeded')
                if time.monotonic() >= limit:
                    raise Failure('Command deadline exceeded')
                if time.monotonic() - last_progress >= 45:
                    print(json.dumps({'command': name, 'event': 'running', 'elapsed_seconds': time.monotonic() - start}), flush=True)
                    last_progress = time.monotonic()
                time.sleep(.05)
            result = json.loads(receipt.read_text())
            record.update(result)
            if result['returncode'] != 0:
                raise Failure(name + ' exited ' + str(result['returncode']))
            record['status'] = 'passed'
        except BaseException as exc:
            record.update(status='failed', error=repr(exc))
            raise
        finally:
            old_mask = signal.pthread_sigmask(signal.SIG_BLOCK, {signal.SIGTERM, signal.SIGINT})
            try:
                if process is not None:
                    stop_group(process.pid)
                    record['supervisor_exit'] = process.wait(timeout=10)
                    for thread in pumps:
                        thread.join(timeout=2)
                    self.active.pop(process.pid, None)
                    write_json(self.output / 'active-processes.json', list(self.active.values()))
                record['streams'] = totals
                self.log_bytes += sum(row['retained_bytes'] for row in totals.values())
                record['elapsed_seconds'] = time.monotonic() - start
                if overflow.is_set() or any(t.is_alive() for t in pumps):
                    record.update(status='failed', output_limit_or_drain_failure=True)
                write_json(directory / 'command.json', record)
                print(json.dumps({'command': name, 'event': record['status'], 'elapsed_seconds': record['elapsed_seconds']}), flush=True)
            finally:
                signal.pthread_sigmask(signal.SIG_SETMASK, old_mask)
        if record['status'] != 'passed':
            raise Failure('Incomplete command output: ' + name)
        return directory


def verify_transfer(directory, destination, committed_manifest):
    directory, destination = Path(directory), Path(destination)
    if {p.name for p in directory.iterdir()} != {'jtreg.tar.gz', 'jtreg-manifest.json'}:
        raise Failure('Transfer must contain exactly the pinned archive and manifest')
    package, metadata = directory / 'jtreg.tar.gz', directory / 'jtreg-manifest.json'
    if package.stat().st_size != ARCHIVE_BYTES or sha256(package) != ARCHIVE_SHA:
        raise Failure('Exact clean harness archive required')
    if sha256(metadata) != MANIFEST_SHA or sha256(committed_manifest) != MANIFEST_SHA:
        raise Failure('Exact clean source/file manifest required')
    manifest = json.loads(metadata.read_text())
    if manifest['source'] != '551e17adac0579859012c4c46318b8fa3cf2ff37' or manifest['validation'] != RECIPE:
        raise Failure('Harness provenance mismatch')
    if manifest['clean_source_release'] != ['JTREG_VERSION=8.3 1', 'BUILD_DATE=October 24, 2026', 'SOURCE=git:551e17adac05']:
        raise Failure('Expected clean harness source metadata')
    files = {row['path']: row for row in manifest['files']}
    if len(files) != 21 or len(files) != len(manifest['files']):
        raise Failure('Incomplete or duplicate file manifest')
    seen = set()
    with tarfile.open(package) as archive:
        for member in archive.getmembers():
            path = Path(member.name)
            if path.is_absolute() or '..' in path.parts or not path.parts or path.parts[0] != 'jtreg':
                raise Failure('Unsafe harness archive path')
            if member.isdir():
                continue
            name = str(path.relative_to('jtreg'))
            if not member.isfile() or name in seen or name not in files:
                raise Failure('Unexpected harness entry or link')
            seen.add(name)
            row = files[name]
            if member.size != row['size'] or member.size > 8 * MiB:
                raise Failure('Harness file size mismatch')
            if hashlib.sha256(archive.extractfile(member).read()).hexdigest() != row['sha256']:
                raise Failure('Harness file checksum mismatch')
        if seen != set(files):
            raise Failure('Incomplete harness archive')
        destination.mkdir(parents=True)
        archive.extractall(destination, filter='data')
    image = destination / 'jtreg'
    for name, row in files.items():
        if sha256(image / name) != row['sha256']:
            raise Failure('Extracted harness checksum mismatch')
    if (image / 'release').read_text().splitlines() != manifest['clean_source_release']:
        raise Failure('Extracted source metadata differs')
    return {'archive_sha256': ARCHIVE_SHA, 'manifest_sha256': MANIFEST_SHA,
            'source': manifest['source'], 'files_verified': len(files), 'version': manifest['version']}


def image_manifest(image, output, source):
    rows = []
    for path in sorted(Path(image).rglob('*')):
        if path.is_symlink():
            rows.append({'path': str(path.relative_to(image)), 'target': os.readlink(path)})
        elif path.is_file():
            rows.append({'path': str(path.relative_to(image)), 'size': path.stat().st_size,
                         'mode': oct(path.stat().st_mode & 0o777), 'sha256': sha256(path)})
    release = (Path(image) / 'release').read_text()
    if source[:12] not in release or not re.search(r'OS_ARCH="(?:aarch64|arm64)"', release):
        raise Failure('Candidate image source/architecture mismatch')
    write_json(output, {'source': source, 'release': release, 'files': rows,
        'image_tree_sha256': hashlib.sha256(json.dumps(rows, sort_keys=True).encode()).hexdigest()})


def build_command_plan(source, code, workspace, output, boot, jtreg, make, jobs):
    """The same fixed argv records are reviewed offline and executed on the runner."""
    source, code, workspace, output, boot, jtreg = map(Path, (source, code, workspace, output, boot, jtreg))
    image = workspace / 'image'
    helper = workspace / 'helper'
    native = workspace / 'native'
    conf = 'native-kqueue-fastdebug'
    rows = []
    def add(name, argv, cap, phase, cwd=None):
        rows.append({'name': name, 'argv': list(map(str, argv)), 'cap': cap, 'phase': phase,
                     'cwd': str(cwd) if cwd else None})
    add('configure', ['bash', 'configure', '--with-conf-name=' + conf, '--with-debug-level=fastdebug',
        '--with-boot-jdk=' + str(boot), '--with-jtreg=' + str(jtreg), '--with-jobs=' + str(jobs),
        '--with-version-opt=native-kqueue-correctness', '--with-native-debug-symbols=none'], 180, 'build', source)
    add('build-image', [make, 'CONF=' + conf, 'JOBS=' + str(jobs), 'images'], 2400, 'build', source)
    add('copy-image', ['cp', '-R', '-p', source / 'build' / conf / 'images/jdk', image], 120, 'build')
    add('hash-image', [sys.executable, '-I', code / 'manifest_image.py', image, output / 'image.json', CANDIDATE], 120, 'build')
    add('candidate-version', [image / 'bin/java', '-version'], 20, 'correctness')
    add('compile-pinner', ['xcrun', 'clang', '-dynamiclib', '-O2', '-I' + str(source / 'test/lib/native'),
        source / 'test/lib/jdk/test/lib/thread/libVThreadPinner.c', '-o', helper / 'libVThreadPinner.dylib'], 30, 'correctness')
    for number, (test, repeat) in enumerate(TESTS, 1):
        directory = workspace / 'tests' / f'{number:02d}'
        add('jtreg-' + f'{number:02d}', [boot / 'bin/java', '-jar', jtreg / 'lib/jtreg.jar',
            '-jdk:' + str(image), '-nativepath:' + str(helper), '-verbose:summary', '-timeoutFactor:1',
            '-javaoptions:-ea', '-javaoptions:-esa', '-concurrency:1', '-w:' + str(directory / 'work'),
            '-r:' + str(directory / 'report'), str(source / 'test/jdk' / test)], 180, 'correctness')
        rows[-1].update(test=test, repeat=repeat, result_directory=str(directory))
    add('generate-jni-header', [image / 'bin/javac', '--patch-module',
        'java.base=' + str(source / 'src/java.base/macosx/classes'), '-h', native, '-d', native,
        source / 'src/java.base/macosx/classes/sun/nio/ch/KQueue.java'], 45, 'correctness')
    includes = ['-I' + str(code / 'native/stubs'), '-I' + str(native),
        '-I' + str(source / 'src/java.base/macosx/native/libnio/ch'),
        '-I' + str(boot / 'include'), '-I' + str(boot / 'include/darwin')]
    for name in ('mock', 'signal'):
        extra = ['-I' + str(code / 'native/mock')] if name == 'mock' else []
        driver = code / ('native/mock/test.c' if name == 'mock' else 'native/signal.c')
        add('compile-native-' + name, ['xcrun', 'clang', '-std=c11', '-D_POSIX_C_SOURCE=200809L', '-D_DARWIN_C_SOURCE',
            '-Wall', '-Wextra', '-Werror', '-Wno-unused-parameter', '-O1', '-g', '-fsanitize=address,undefined',
            '-pthread', *extra, *includes, driver, '-o', native / name], 60, 'correctness')
        add('run-native-' + name, [native / name], 60, 'correctness')
    return rows


def collect_test_results(workspace, output):
    rows = []
    for number, (test, repeat) in enumerate(TESTS, 1):
        directory = Path(workspace) / 'tests' / f'{number:02d}'
        records = []
        for path in sorted((directory / 'work').rglob('*.jtr')):
            target = Path(output) / 'jtreg' / f'{number:02d}' / path.relative_to(directory / 'work')
            target.parent.mkdir(parents=True, exist_ok=True)
            if path.stat().st_size > 8 * MiB:
                raise Failure('JTR output limit exceeded: ' + path.name)
            shutil.copy2(path, target)
            text = path.read_text(errors='replace')
            match = re.search(r'^execStatus=(.*)$', text, re.M)
            records.append({'path': str(target.relative_to(output)), 'execStatus': match.group(1) if match else None})
        for summary in sorted((directory / 'report/text').glob('*.txt')):
            target = Path(output) / 'jtreg' / f'{number:02d}' / summary.name
            target.parent.mkdir(parents=True, exist_ok=True)
            if summary.stat().st_size > 8 * MiB:
                raise Failure('Jtreg text report exceeds output cap')
            shutil.copy2(summary, target)
        command_files = list((Path(output) / 'commands').glob('*-jtreg-' + f'{number:02d}' + '/command.json'))
        command = json.loads(command_files[0].read_text()) if command_files else {}
        rows.append({'invocation': number, 'test': test, 'repeat': repeat,
                     'command_status': command.get('status', 'not-started'), 'results': records})
    write_json(Path(output) / 'test-results.json', rows)
    return rows


class Qualification:
    def __init__(self, repo, output, transfer, expected):
        self.repo, self.output, self.transfer = map(lambda p: Path(p).resolve(), (repo, output, transfer))
        self.code = self.repo / '.github/native-polling/correctness'
        self.expected = expected
        self.workspace = self.output.parent / 'native-kqueue-correctness-build'
        self.source = self.workspace / 'source'
        self.deadline = json.loads((self.output / 'job-start.json').read_text())['monotonic'] + 75 * 60
        self.runner = Runner(self.output, self.code / 'supervise.py', self.deadline)
        self.jobs = min(os.cpu_count() or 1, 3)

    def out(self, name, argv, cap=20):
        return (self.runner.run(name, argv, cap=cap) / 'output.log').read_text().strip()

    def setup(self):
        with self.runner.phase('setup', PHASES['setup']):
            if not re.fullmatch(r'[0-9a-f]{40}', self.expected) or git(self.repo, 'rev-parse', 'HEAD') != self.expected:
                raise Failure('Exact validation source required')
            if git(self.repo, 'rev-parse', 'HEAD^') != CANDIDATE or git(self.repo, 'status', '--porcelain'):
                raise Failure('Expected clean CI-only child of candidate')
            for sha, parent in ((CANDIDATE, ORIGINAL), (ORIGINAL, RESET), (RESET, BASE)):
                if git(self.repo, 'rev-parse', sha + '^') != parent:
                    raise Failure('Candidate ancestry mismatch')
            changed = git(self.repo, 'diff', '--name-only', CANDIDATE, self.expected).splitlines()
            if not changed or any(not (p == '.github/workflows/main.yml' or p.startswith('.github/native-polling/correctness/')) for p in changed):
                raise Failure('Validation changes production sources')
            for path in ('src/java.base/linux', 'src/java.base/share/classes/sun/nio/ch/SelectionKeyImpl.java'):
                if git(self.repo, 'diff', '--name-only', BASE, CANDIDATE, '--', path):
                    raise Failure('Unexpected Linux or queue-deduplication changes')
            write_json(self.output / 'source-identities.json', {name: {'commit': sha, 'tree': git(self.repo, 'rev-parse', sha + '^{tree}')}
                for name, sha in (('base', BASE), ('reset', RESET), ('original', ORIGINAL), ('candidate', CANDIDATE), ('validation', self.expected))})
            if sys.platform != 'darwin' or os.uname().machine != 'arm64' or os.environ.get('GITHUB_REF') != BRANCH:
                raise Failure('Dedicated native Darwin arm64 branch required')
            if sys.version_info < (3, 12):
                raise Failure('Python3.12+ data-filtered extraction required')
            if os.environ.get('GITHUB_REPOSITORY') != REPOSITORY or os.environ.get('GITHUB_RUN_ATTEMPT') != '1':
                raise Failure('Expected repository and first run attempt')
            self.workspace.mkdir()
            verification = verify_transfer(self.transfer, self.workspace / 'jtreg', self.code / 'harness-manifest.json')
            verification.update(transfer_run_id=os.environ.get('JTREG_TRANSFER_RUN_ID'), artifact_name=TRANSFER_NAME)
            write_json(self.output / 'harness-verification.json', verification)
            self.jtreg = self.workspace / 'jtreg/jtreg'
            developer = Path('/Applications/Xcode_26.6.app/Contents/Developer')
            required = ('awk', 'basename', 'bash', 'brew', 'cat', 'chmod', 'cp', 'curl', 'cut', 'date',
                'diff', 'dirname', 'echo', 'expr', 'file', 'find', 'git', 'grep', 'gunzip', 'gzip',
                'head', 'ln', 'ls', 'make', 'mkdir', 'mktemp', 'mv', 'perl', 'printf', 'ps', 'rm',
                'rmdir', 'sed', 'sh', 'sort', 'sw_vers', 'tail', 'tar', 'tee', 'touch', 'tr', 'uname',
                'unzip', 'wc', 'xargs', 'xattr', 'xcodebuild', 'xcrun', 'zip', 'sysctl')
            missing = [p for p in required if not shutil.which(p)]
            if missing or not developer.is_dir() or shutil.disk_usage(self.workspace).free < 12 * 1024**3:
                raise Failure('Missing native tools/Xcode or less than12GiB free: ' + ','.join(missing))
            soft, hard = resource.getrlimit(resource.RLIMIT_NOFILE)
            if hard != resource.RLIM_INFINITY and hard < 2048:
                raise Failure('Open-file hard limit below upstream test requirement2048')
            target = 4096 if hard == resource.RLIM_INFINITY else min(4096, hard)
            resource.setrlimit(resource.RLIMIT_NOFILE, (soft if soft == resource.RLIM_INFINITY else max(soft, target), hard))
            self.runner.env['DEVELOPER_DIR'] = str(developer)
            xcode = self.out('xcode-version', ['xcodebuild', '-version'])
            sdk = self.out('sdk-version', ['xcrun', '--sdk', 'macosx', '--show-sdk-version'])
            if xcode.splitlines() != ['Xcode 26.6', 'Build version 17F113'] or sdk != '26.5':
                raise Failure('Pinned Xcode26.6(17F113)/SDK26.5 required')
            for tool in ('clang', 'clang++', 'ar', 'nm', 'strip', 'dsymutil', 'mig', 'SetFile', 'otool',
                         'install_name_tool', 'lipo', 'codesign'):
                self.out('find-' + tool, ['xcrun', '--find', tool], cap=10)
            for tool in ('metal', 'metallib'):
                self.out('check-' + tool, ['xcrun', '--sdk', 'macosx', tool, '--version'])
            self.runner.env.update(HOMEBREW_NO_AUTO_UPDATE='1', HOMEBREW_NO_INSTALL_CLEANUP='1', HOMEBREW_NO_INSTALL_UPGRADE='1')
            raw = self.out('brew-formulae', ['brew', 'info', '--json=v2', '--formula',
                *['homebrew/core/' + name for name in BREW_VERSIONS]])
            try:
                data, end = json.JSONDecoder().raw_decode(raw, raw.index('{'))
                if raw[end:].strip():
                    raise ValueError('Trailing Homebrew output')
                formulae = {row['name']: row for row in data['formulae']}
                if any(formulae[name]['tap'] != 'homebrew/core' or formulae[name]['versions']['stable'] != version for name, version in BREW_VERSIONS.items()):
                    raise ValueError('Formula version mismatch')
            except (ValueError, KeyError, TypeError) as exc:
                raise Failure('Expected official pinned Homebrew formulae') from exc
            self.runner.run('install-build-tools', ['brew', 'install', '--formula', 'homebrew/core/autoconf', 'homebrew/core/make'], cap=120)
            if self.out('brew-prefix', ['brew', '--prefix'], cap=10) != '/opt/homebrew':
                raise Failure('Native Homebrew prefix required')
            tools = {'autoconf': '/opt/homebrew/opt/autoconf/bin/autoconf',
                     'make': '/opt/homebrew/opt/make/bin/gmake', 'm4': '/opt/homebrew/opt/m4/bin/m4'}
            for name, program in tools.items():
                if not self.out(name + '-version', [program, '--version']).splitlines()[0].endswith(' ' + BREW_VERSIONS[name]):
                    raise Failure('Installed build tool version mismatch')
            self.make = tools['make']
            self.runner.env.update(AUTOCONF=tools['autoconf'], MAKE=self.make, M4=tools['m4'])
            self.runner.env['PATH'] = '/opt/homebrew/opt/make/libexec/gnubin:' + self.runner.env['PATH']
            write_json(self.output / 'toolchain.json', {'xcode': xcode, 'sdk': sdk, 'homebrew': BREW_VERSIONS,
                'macos': self.out('macos-version', ['sw_vers', '-productVersion']),
                'clang': self.out('clang-version', ['xcrun', 'clang', '--version']), 'jobs': self.jobs,
                'open_files': {'before_soft': soft, 'hard': hard, 'soft': resource.getrlimit(resource.RLIMIT_NOFILE)[0]}})
            package = self.workspace / 'bootjdk.tar.gz'
            self.runner.run('download-bootjdk', ['curl', '--fail', '--location', '--connect-timeout', '15',
                '--max-time', '90', '--output', package, BOOT_URL], cap=95)
            if sha256(package) != BOOT_SHA:
                raise Failure('BootJDK checksum mismatch')
            self.runner.run('extract-bootjdk', [sys.executable, '-I', '-c',
                "import sys,tarfile\nwith tarfile.open(sys.argv[1]) as a: a.extractall(sys.argv[2],filter='data')", package, self.workspace / 'bootjdk'], cap=30)
            root = self.workspace / 'bootjdk'
            homes = [p.parent for p in root.rglob('release') if p.is_file() and all((p.parent / 'bin' / n).is_file() and (p.parent / 'bin' / n).stat().st_mode & 0o111 for n in ('java', 'javac'))]
            if len(homes) != 1 or any(not (homes[0] / n).resolve().is_relative_to(root) for n in ('release', 'bin/java', 'bin/javac')):
                raise Failure('Expected one contained executable BootJDK home')
            self.boot = homes[0]
            fields = dict(re.findall(r'^([A-Z0-9_]+)="([^"\r\n]*)"\r?$', (self.boot / 'release').read_text(), re.M))
            if not re.fullmatch(r'26(?:[.+-].*)?', fields.get('JAVA_VERSION', '')) or fields.get('OS_NAME') != 'Darwin' or fields.get('OS_ARCH') not in ('arm64', 'aarch64'):
                raise Failure('Expected Java26 Darwin arm64 BootJDK')
            write_json(self.output / 'bootjdk.json', {'url': BOOT_URL, 'sha256': BOOT_SHA, 'home': str(self.boot.relative_to(root)),
                'version': fields['JAVA_VERSION'], 'os': fields['OS_NAME'], 'arch': fields['OS_ARCH']})
            self.runner.env['JAVA_HOME'] = str(self.boot)
            self.out('bootjdk-version', [self.boot / 'bin/java', '-version'])
            self.runner.run('harness-version', [self.boot / 'bin/java', '-jar', self.jtreg / 'lib/jtreg.jar', '-version'], cap=20)
            self.runner.run('candidate-worktree', ['git', '-C', self.repo, 'worktree', 'add', '--detach', self.source, CANDIDATE], cap=60)
            hashes = {}
            for name in RUNTIME_SOURCES:
                target = self.output / 'validation-source' / name
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(self.code / name, target)
                hashes[name] = sha256(target)
            write_json(self.output / 'runtime-source-hashes.json', hashes)
            self.runner.supervisor = self.output / 'validation-source/supervise.py'

    def execute(self):
        status = {'status': 'running', 'candidate': CANDIDATE, 'validation': self.expected}
        try:
            self.setup()
            plan = build_command_plan(self.source, self.code, self.workspace, self.output, self.boot, self.jtreg, self.make, self.jobs)
            write_json(self.output / 'command-plan.json', plan)
            for name in ('helper', 'native'):
                (self.workspace / name).mkdir()
            self.runner.env.update(ASAN_OPTIONS='halt_on_error=1:abort_on_error=1',
                                   UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
            for phase in ('build', 'correctness'):
                with self.runner.phase(phase, PHASES[phase]):
                    for row in plan:
                        if row['phase'] != phase:
                            continue
                        directory = self.runner.run(row['name'], row['argv'], cap=row['cap'], cwd=row['cwd'])
                        if row['name'] == 'candidate-version':
                            version = '\n'.join((directory / name).read_text() for name in ('output.log', 'stderr.log')).strip()
                            if not re.search(r'\bfastdebug\b', version):
                                raise Failure('Built VM does not identify itself as fastdebug')
                            write_json(self.output / 'candidate-version.json', {'source': CANDIDATE, 'fastdebug': True, 'version_output': version})
                        if row['name'] == 'build-image' and (git(self.source, 'rev-parse', 'HEAD') != CANDIDATE or git(self.source, 'status', '--porcelain')):
                            raise Failure('Build source changed')
            results = collect_test_results(self.workspace, self.output)
            if any(row['command_status'] != 'passed' or not any((r['execStatus'] or '').startswith('Passed.') for r in row['results']) for row in results):
                raise Failure('A jtreg invocation has no successful applicable test result')
            diagnostics = {}
            for name in ('mock', 'signal'):
                directories = list((self.output / 'commands').glob('*-run-native-' + name))
                text = (directories[0] / 'output.log').read_text().strip()
                if name == 'mock':
                    if not text.startswith('PASS: 6414 mock cases;'):
                        raise Failure('Unexpected deterministic diagnostic result')
                    diagnostics[name] = {'cases': 6414, 'verified': True}
                else:
                    value = json.loads(text)
                    if value.get('verified') is not True or value.get('cycles') != 2000 or value.get('signals', 0) <= 0:
                        raise Failure('Unexpected real kernel diagnostic result')
                    diagnostics[name] = value
            write_json(self.output / 'native-results.json', diagnostics)
            status['status'] = 'passed'
        except BaseException as exc:
            status.update(status='failed', error=repr(exc), traceback=traceback.format_exc())
            raise
        finally:
            try:
                try:
                    collect_test_results(self.workspace, self.output)
                    write_json(self.output / 'helper-identities.json', {str(p.relative_to(self.workspace)): sha256(p)
                        for p in (self.workspace / 'helper/libVThreadPinner.dylib', self.workspace / 'native/mock', self.workspace / 'native/signal') if p.is_file()})
                except BaseException as exc:
                    status.update(status='failed', collection_error=repr(exc))
            finally:
                try:
                    cleanup(self.output)
                except BaseException as exc:
                    status.update(status='failed', cleanup_error=repr(exc))
                finally:
                    status['work_deadline_exhausted'] = time.monotonic() >= self.deadline
                    if status['work_deadline_exhausted']:
                        status.update(status='failed', deadline_error='Global75-minute work deadline exhausted')
                    write_json(self.output / 'status.json', status)
        if status['status'] != 'passed':
            raise Failure('Correctness evidence or cleanup incomplete')


def export(output, destination):
    output, destination = Path(output), Path(destination)
    destination.mkdir(parents=True, exist_ok=True)
    if any(destination.iterdir()):
        raise Failure('Result destination must be empty')
    selected = [output / name for name in ROOT_RESULTS if (output / name).is_file()]
    for name in ('command.json', 'receipt.json', 'output.log', 'stderr.log'):
        selected += sorted((output / 'commands').glob('*/' + name))
    selected += [output / 'phases' / (name + '.json') for name in PHASES if (output / 'phases' / (name + '.json')).is_file()]
    selected += sorted((output / 'jtreg').rglob('*.jtr')) + sorted((output / 'jtreg').rglob('*.txt'))
    selected += [output / 'validation-source' / name for name in RUNTIME_SOURCES if (output / 'validation-source' / name).is_file()]
    manifest, omitted, total = [], [], 0
    for source in selected:
        relative = source.relative_to(output)
        if source.is_symlink():
            raise Failure('Unexpected result symlink')
        size = source.stat().st_size
        # Reserve manifest space and4KiB for the workflow's failure marker.
        if size > 32 * MiB or total + size > EXPORT_LIMIT - MiB:
            omitted.append({'path': str(relative), 'bytes': size})
            continue
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
        total += size
        manifest.append({'path': str(relative), 'size': size, 'sha256': sha256(target)})
    metadata = {'files': manifest, 'selected_file_bytes': total, 'limit_bytes': EXPORT_LIMIT, 'omitted': omitted}
    encoded = (json.dumps(metadata, indent=2, allow_nan=False) + '\n').encode()
    if len(encoded) > MiB - 4096:
        write_json(destination / 'artifact-manifest.json', {'error': 'Manifest output cap exceeded', 'files': len(manifest)})
        raise Failure('Artifact manifest output cap exceeded')
    (destination / 'artifact-manifest.json').write_bytes(encoded)
    actual_bytes = sum(p.stat().st_size for p in destination.rglob('*') if p.is_file())
    if actual_bytes > EXPORT_LIMIT - 4096:
        raise Failure('Final artifact size exceeded bounded allocation')
    if omitted:
        raise Failure('Artifact cap exceeded; omissions recorded')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--repo', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--transfer', type=Path)
    parser.add_argument('--expected-sha')
    parser.add_argument('--cleanup', action='store_true')
    parser.add_argument('--export', type=Path)
    args = parser.parse_args()
    if args.cleanup:
        cleanup(args.output)
    elif args.export:
        export(args.output, args.export)
    else:
        def interrupted(sig, frame):
            raise InterruptedError('Termination signal ' + str(sig))
        signal.signal(signal.SIGTERM, interrupted)
        signal.signal(signal.SIGINT, interrupted)
        Qualification(args.repo, args.output, args.transfer, args.expected_sha).execute()


if __name__ == '__main__':
    main()
