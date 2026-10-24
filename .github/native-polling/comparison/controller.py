#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""One source-matched release comparison, with separate untimed syscall probes."""
import argparse
from contextlib import contextmanager
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import re
import resource
import shutil
import signal
import statistics
import subprocess
import sys
import time
import traceback

sys.dont_write_bytecode = True
CODE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('qualified_controller', CODE.parent / 'correctness/controller.py')
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
Failure, write_json, sha256, git = common.Failure, common.write_json, common.sha256, common.git
BOOT_URL, BOOT_SHA, BREW_VERSIONS = common.BOOT_URL, common.BOOT_SHA, common.BREW_VERSIONS
BASELINE = 'a1d7a297b6a22d72bde8a051d6aa3a910cdcf77c'
CANDIDATE = 'cf218dc255de70fcd52903e5d85ef4aef11b564c'
PREVIOUS = '1146404ae7f532458d7fe60daa74af5b8df04a42'
BRANCH = 'refs/heads/qualify/native-kqueue-comparison-once'
CASES = ('stable', 'single', 'bulk', 'backpressure', 'construct')
CONF = 'native-kqueue-comparison-release'
PHASES = {'setup': 300, 'baseline-build': 2100, 'candidate-build': 600, 'reach': 300, 'measurement': 2160}
SOURCES = ('controller.py', 'supervise.py', 'NativePollingBench.java', 'KeventReach.java',
           'kevent_reach.c', 'source-pins.json', 'PLAN.md')


class Runner(common.Runner):
    @contextmanager
    def phase(self, name, cap):
        with super().phase(name, cap):
            remaining = min(self.deadline, self.phase_deadline) - time.monotonic()
            if remaining <= 0:
                raise Failure('Phase/global deadline exhausted before ' + name)
            old_timer = signal.getitimer(signal.ITIMER_REAL)
            start = time.monotonic()
            signal.setitimer(signal.ITIMER_REAL, remaining)
            try:
                yield
                if time.monotonic() >= min(self.deadline, self.phase_deadline):
                    raise Failure('Phase/global deadline exhausted during ' + name)
            finally:
                elapsed = time.monotonic() - start
                signal.setitimer(signal.ITIMER_REAL,
                    max(.001, old_timer[0] - elapsed) if old_timer[0] else 0, old_timer[1])


def validate_sources(repo, expected):
    if not re.fullmatch(r'[0-9a-f]{40}', expected or '') or git(repo, 'rev-parse', 'HEAD') != expected:
        raise Failure('Exact validation source required')
    if git(repo, 'rev-parse', 'HEAD^') != PREVIOUS or git(repo, 'status', '--porcelain'):
        raise Failure('Expected clean comparison child of qualified correctness controller')
    changed = git(repo, 'diff', '--name-only', PREVIOUS, expected).splitlines()
    if not changed or any(not (p == '.github/workflows/main.yml' or p.startswith('.github/native-polling/comparison/')) for p in changed):
        raise Failure('Comparison commit changes unrelated sources')
    pins = json.loads((CODE / 'source-pins.json').read_text())
    if sha256(CODE.parent / 'correctness/controller.py') != pins['shared_controller_sha256']:
        raise Failure('Qualified process controller changed')
    for arm, commit in (('baseline', BASELINE), ('candidate', CANDIDATE)):
        row = pins[arm]
        if row['commit'] != commit:
            raise Failure('Product commit pin changed')
        for field, path in (('product_src_tree', 'src'), ('hotspot_tree', 'src/hotspot'), ('make_tree', 'make')):
            if git(repo, 'rev-parse', commit + ':' + path) != row[field]:
                raise Failure('Product tree identity changed')
        manifest = subprocess.check_output(['git', '-C', str(repo), 'ls-tree', '-rz', commit, '--', 'src'], timeout=15)
        if hashlib.sha256(manifest).hexdigest() != row['product_manifest_sha256']:
            raise Failure('Product source manifest changed')
        for path, digest in row['target_files'].items():
            data = subprocess.check_output(['git', '-C', str(repo), 'show', commit + ':' + path], timeout=15)
            if hashlib.sha256(data).hexdigest() != digest:
                raise Failure('Target source bytes changed')
    if set(git(repo, 'diff', '--name-only', BASELINE, CANDIDATE, '--', 'src').splitlines()) != set(pins['candidate']['target_files']):
        raise Failure('Unexpected product change outside native kqueue scope')
    return {'validation': expected, 'pins': pins}


def schedule(workspace):
    """Pure: exactly 12 independent pairs per case, six AB and six BA."""
    workspace = Path(workspace)
    rows = []
    for round_number in range(12):
        for offset in range(len(CASES)):
            case = CASES[(offset + round_number) % len(CASES)]
            arms = ('baseline', 'candidate') if round_number % 2 == 0 else ('candidate', 'baseline')
            for position, arm in enumerate(arms):
                rows.append({'case': case, 'pair': round_number + 1, 'arm': arm,
                    'position': position + 1, 'order': 'AB' if round_number % 2 == 0 else 'BA',
                    'cap': 12 if case == 'construct' else 18,
                    'argv': java_command(workspace, arm, case, False)})
    return rows


def java_command(workspace, arm, case, trace):
    workspace = Path(workspace)
    flags = ['-Xms256m', '-Xmx256m', '-Xss512k', '-XX:ReservedCodeCacheSize=128m',
             '-XX:-CreateCoredumpOnCrash', '-XX:ErrorFile=' + str(workspace / ('hs_err_' + arm + '_%p.log'))]
    if trace:
        flags += ['--add-opens=java.base/sun.nio.ch=ALL-UNNAMED',
                  '-Dnative.polling.trace=' + str(workspace / 'helper/libKeventReach.dylib')]
    return list(map(str, [workspace / 'images' / arm / 'bin/java', *flags,
        '-cp', workspace / 'helper', 'NativePollingBench', case, '100' if trace else '2000', '200' if trace else '4000']))


def observation(directory, arm, case, trace):
    command = json.loads((directory / 'command.json').read_text())
    lines = (directory / 'output.log').read_text().splitlines()
    values = [json.loads(line.removeprefix('NATIVE_POLLING_RESULT ')) for line in lines if line.startswith('NATIVE_POLLING_RESULT ')]
    phases = [json.loads(line.removeprefix('NATIVE_POLLING_PHASE ')) for line in lines if line.startswith('NATIVE_POLLING_PHASE ')]
    if len(values) != 1 or [p['phase'] for p in phases] != ['warmup', 'measurement']:
        raise Failure('Missing or duplicate complete phase/result records')
    value = values[0]
    if value.get('case') != case or value.get('instrumented') is not trace or value.get('verified') is not True:
        raise Failure('Unexpected workload identity')
    if Path(value['java_home']) != directory.parents[1].parent / 'native-kqueue-comparison-build/images' / arm:
        raise Failure('Unexpected image in workload')
    if value['warmup_ms'] != (100 if trace else 2000) or value['measure_ms'] != (200 if trace else 4000):
        raise Failure('Workload duration changed')
    if value['buffers_before'] != value['buffers_after']:
        raise Failure('Socket buffer sizes changed within process')
    for phase, record in zip(('warmup', 'measurement'), phases):
        stats = value[phase]
        if record['case'] != case or record['stats'] != stats:
            raise Failure('Inconsistent phase records')
        if stats['operations'] <= 0 or stats['wall_ns'] <= 0 or stats['cpu_ns'] <= 0 or stats['allocated_main_thread_bytes'] < 0:
            raise Failure('Invalid per-process metrics')
        if stats['units'] != stats['operations'] * (1 if case == 'construct' else value['payload_bytes']):
            raise Failure('Work unit identity mismatch')
        changes = stats['logical_filter_transitions']
        if case in ('single', 'bulk'):
            multiplier = 2 if case == 'single' else 4
            if changes != multiplier * stats['operations'] or stats['operations'] != value['connections'] * stats['rounds']:
                raise Failure('Registration work not fixed per completed exchange')
        if case == 'stable' and changes != 0:
            raise Failure('Stable interest control changed filters')
        if case == 'backpressure' and min(stats['zero_writes'], stats['partial_writes'], changes) <= 0:
            raise Failure('Backpressure path not reached')
        counts = stats['registration_trace']
        if not trace:
            if counts is not None:
                raise Failure('Timing process contains trace counters')
            continue
        if not isinstance(counts, list) or len(counts) != 16 or any(type(n) is not int or n < 0 for n in counts):
            raise Failure('Invalid kernel reach counters')
        if counts[5] <= 0 or any(counts[i] for i in (11, 15)):
            raise Failure('Interposer inactive or observed kernel error')
        if counts[12] or counts[13]:
            raise Failure('Interrupted reach probe needs separate interpretation; stop before timing')
        if case == 'construct':
            if counts[0] != stats['operations'] or counts[1] != stats['operations'] or counts[4] != counts[1] or counts[14] != 1:
                raise Failure('Constructor wakeup registration path not verified')
        elif case == 'stable':
            if counts[1] != 0 or counts[2] != 0:
                raise Failure('Stable control made registration syscalls')
        else:
            if counts[2] != changes or sum(counts[6:10]) != changes:
                raise Failure('Logical and submitted kernel changes differ')
            if arm == 'baseline':
                if counts[1] != changes or counts[4] != counts[1] or counts[3] or counts[14] != 1:
                    raise Failure('Baseline scalar registration path not verified')
            elif counts[3] != counts[1] or counts[4] or counts[10] != changes or counts[14] > 64:
                raise Failure('Candidate receipt registration path not verified')
            if case == 'single' and (counts[1] != changes or counts[14] != 1):
                raise Failure('Single-change control batched unrelated work')
            if case == 'bulk' and arm == 'candidate' and (counts[14] <= 1 or counts[1] >= changes):
                raise Failure('Candidate bulk path did not reduce syscall submissions')
    if command.get('peak_rss_unit') != 'bytes' or command.get('peak_rss_native_units', 0) > 1536 * 1024**2:
        raise Failure('Missing Darwin RSS identity or process RSS exceeds1.5GiB')
    value['process'] = {key: command[key] for key in ('child_start_ns', 'child_end_ns',
        'child_user_cpu_seconds', 'child_system_cpu_seconds', 'peak_rss_native_units', 'peak_rss_unit')}
    return value


def validate_pair_inputs(a, b):
    for field in ('buffers_before', 'buffers_after', 'connections', 'payload_bytes', 'requested_buffer_bytes',
                  'java_vm_version', 'processors', 'max_heap_bytes', 'peer_pause_ms', 'tcp_nodelay'):
        if a[field] != b[field]:
            raise Failure('Matched process inputs differ: ' + field)


def summarize(rows):
    result = {}
    for case in CASES:
        pairs = []
        for number in range(1, 13):
            values = {r['arm']: r for r in rows if r['case'] == case and r['pair'] == number}
            if set(values) != {'baseline', 'candidate'}:
                raise Failure('Incomplete pair; no pooled partial study')
            a, b = (values[k]['observation'] for k in ('baseline', 'candidate'))
            validate_pair_inputs(a, b)
            x, y = a['measurement'], b['measurement']
            pairs.append({'pair': number, 'order': values['baseline']['order'],
                'throughput_ratio_candidate_over_baseline': (y['units'] / y['wall_ns']) / (x['units'] / x['wall_ns']),
                'cpu_per_unit_ratio_candidate_over_baseline': (y['cpu_ns'] / y['units']) / (x['cpu_ns'] / x['units']),
                'allocation_per_unit_baseline': x['allocated_main_thread_bytes'] / x['units'],
                'allocation_per_unit_candidate': y['allocated_main_thread_bytes'] / y['units'],
                'p99_upper_ns_baseline': x['latency_p99_upper_ns'], 'p99_upper_ns_candidate': y['latency_p99_upper_ns']})
        ratios = [p['throughput_ratio_candidate_over_baseline'] for p in pairs]
        result[case] = {'independent_process_pairs': 12, 'pairs': pairs, 'throughput_ratio_median': statistics.median(ratios),
            'throughput_ratio_geomean': math.exp(statistics.mean(map(math.log, ratios))),
            'order_geomeans': {order: math.exp(statistics.mean(math.log(p['throughput_ratio_candidate_over_baseline'])
                for p in pairs if p['order'] == order)) for order in ('AB', 'BA')}}
    return {'cases': result, 'build_pairs': 1, 'hosts': 1,
        'scope': 'Fixed-window loopback observations. Each JVM is independent; messages/phases share a process. All pairs share one host/build pair. No general steady-state or application-throughput inference.'}


class Comparison:
    def __init__(self, repo, output, expected):
        self.repo, self.output = Path(repo).resolve(), Path(output).resolve()
        self.expected = expected
        self.workspace = self.output.parent / 'native-kqueue-comparison-build'
        self.source = self.workspace / 'source'
        self.deadline = json.loads((self.output / 'job-start.json').read_text())['monotonic'] + 100 * 60
        self.runner = Runner(self.output, CODE / 'supervise.py', self.deadline)
        for key in list(self.runner.env):
            if key.startswith('DYLD_') or key == 'NATIVE_KQUEUE_TRACE_DYLIB':
                self.runner.env.pop(key)
        self.jobs = min(os.cpu_count() or 1, 3)

    def out(self, name, argv, cap=20):
        return (self.runner.run(name, argv, cap=cap) / 'output.log').read_text().strip()

    def storage(self):
        # An observed guard, not a filesystem quota; never run during a timing process.
        total = sum(p.stat().st_size for p in self.workspace.rglob('*') if p.is_file() and not p.is_symlink())
        if total > 10 * 1024**3 or shutil.disk_usage(self.workspace).free < 2 * 1024**3:
            raise Failure('Workspace storage exceeds10GiB or less than2GiB free')
        return total

    def setup(self):
        with self.runner.phase('setup', PHASES['setup']):
            write_json(self.output / 'source-identities.json', validate_sources(self.repo, self.expected))
            if sys.platform != 'darwin' or os.uname().machine != 'arm64' or os.environ.get('GITHUB_REF') != BRANCH:
                raise Failure('Dedicated Darwin arm64 comparison branch required')
            if sys.version_info < (3, 12) or os.environ.get('GITHUB_REPOSITORY') != common.REPOSITORY or os.environ.get('GITHUB_RUN_ATTEMPT') != '1':
                raise Failure('Python3.12+, expected repository and first run attempt required')
            self.workspace.mkdir()
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
            sdk_path = Path(self.out('sdk-path', ['xcrun', '--sdk', 'macosx', '--show-sdk-path']))
            if any(not (sdk_path / 'usr/include' / name).is_file() for name in ('sys/event.h', 'mach-o/dyld-interposing.h')):
                raise Failure('Required public kqueue/dyld SDK headers unavailable')
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
                'sdk_headers': ['sys/event.h', 'mach-o/dyld-interposing.h'],
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
            self.runner.run('baseline-worktree', ['git', '-C', self.repo, 'worktree', 'add', '--detach', self.source, BASELINE], cap=60)
            for name in SOURCES:
                target = self.output / 'validation-source' / name
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(CODE / name, target)
            common_target = self.output / 'validation-source/qualified-controller.py'
            shutil.copy2(CODE.parent / 'correctness/controller.py', common_target)
            write_json(self.output / 'runtime-source-hashes.json', {str(p.relative_to(self.output / 'validation-source')): sha256(p)
                for p in (self.output / 'validation-source').rglob('*') if p.is_file()})

    def build(self, arm):
        commit = BASELINE if arm == 'baseline' else CANDIDATE
        image = self.workspace / 'images' / arm
        image.parent.mkdir(exist_ok=True)
        with self.runner.phase(arm + '-build', PHASES[arm + '-build']):
            if arm == 'baseline':
                self.runner.run('configure', ['bash', 'configure', '--with-conf-name=' + CONF, '--with-debug-level=release',
                    '--with-boot-jdk=' + str(self.boot), '--with-jobs=' + str(self.jobs),
                    '--with-version-opt=native-kqueue-comparison', '--with-native-debug-symbols=none'], cap=180, cwd=self.source)
            else:
                self.runner.run('candidate-checkout', ['git', '-C', self.source, 'checkout', '--detach', CANDIDATE], cap=30)
            spec_file = self.source / 'build' / CONF / 'spec.gmk'
            if not re.search(r'^DEBUG_LEVEL\s*:=\s*release\s*$', spec_file.read_text(), re.M):
                raise Failure('Release configuration required')
            spec_sha = sha256(spec_file)
            self.runner.run('build-image', [self.make, 'CONF=' + CONF, 'JOBS=' + str(self.jobs), 'images'],
                            cap=1680 if arm == 'baseline' else 360, cwd=self.source)
            if git(self.source, 'rev-parse', 'HEAD') != commit or git(self.source, 'status', '--porcelain') or sha256(spec_file) != spec_sha:
                raise Failure('Build source/configuration changed unexpectedly')
            self.runner.run('copy-' + arm, ['cp', '-R', '-p', self.source / 'build' / CONF / 'images/jdk', image], cap=90)
            self.runner.run('hash-' + arm, [sys.executable, '-I', self.repo / '.github/native-polling/correctness/manifest_image.py',
                image, self.output / (arm + '-image.json'), commit], cap=90)
            self.runner.run(arm + '-version', [image / 'bin/java', '-version'], cap=20)
            write_json(self.output / (arm + '-configuration.json'), {'spec_sha256': spec_sha, 'debug_level': 'release',
                'source': commit, 'image_bytes': sum(p.stat().st_size for p in image.rglob('*') if p.is_file() and not p.is_symlink()),
                'workspace_file_bytes': self.storage()})

    def image_gates(self):
        a = json.loads((self.output / 'baseline-image.json').read_text())
        b = json.loads((self.output / 'candidate-image.json').read_text())
        self.runner.run('rehash-baseline', [sys.executable, '-I', self.repo / '.github/native-polling/correctness/manifest_image.py',
            self.workspace / 'images/baseline', self.output / 'baseline-image-recheck.json', BASELINE], cap=30)
        if a != json.loads((self.output / 'baseline-image-recheck.json').read_text()):
            raise Failure('Baseline image changed during incremental candidate build')
        if json.loads((self.output / 'baseline-configuration.json').read_text())['spec_sha256'] != json.loads((self.output / 'candidate-configuration.json').read_text())['spec_sha256']:
            raise Failure('Release build configuration differs')
        files = [{p['path']: p for p in v['files']} for v in (a, b)]
        for path, equal in (('lib/server/libjvm.dylib', True), ('lib/libnio.dylib', False), ('lib/modules', False)):
            if (files[0][path]['sha256'] == files[1][path]['sha256']) is not equal:
                raise Failure('Image product matching gate failed: ' + path)
        write_json(self.output / 'image-comparison.json', {'same_vm_binary': True, 'different_libnio_and_modules': True,
            'baseline_immutable': True, 'baseline_tree_sha256': a['image_tree_sha256'], 'candidate_tree_sha256': b['image_tree_sha256']})

    def reach(self):
        with self.runner.phase('reach', PHASES['reach']):
            self.image_gates()
            helper = self.workspace / 'helper'
            helper.mkdir()
            candidate = self.workspace / 'images/candidate'
            self.runner.run('compile-workload', [candidate / 'bin/javac', '-h', helper, '-d', helper,
                CODE / 'NativePollingBench.java', CODE / 'KeventReach.java'], cap=30)
            self.runner.run('compile-reach', ['xcrun', 'clang', '-std=c11', '-Wall', '-Wextra', '-Werror', '-O2', '-dynamiclib',
                '-I' + str(helper), '-I' + str(candidate / 'include'), '-I' + str(candidate / 'include/darwin'),
                CODE / 'kevent_reach.c', '-o', helper / 'libKeventReach.dylib'], cap=30)
            write_json(self.output / 'helper-identities.json', {p.name: sha256(p) for p in helper.iterdir() if p.is_file()})
            values = []
            self.runner.env['NATIVE_KQUEUE_TRACE_DYLIB'] = str(helper / 'libKeventReach.dylib')
            try:
                for case in CASES:
                    for arm in ('baseline', 'candidate'):
                        directory = self.runner.run('reach-' + case + '-' + arm, java_command(self.workspace, arm, case, True), cap=15)
                        value = observation(directory, arm, case, True)
                        values.append({'case': case, 'arm': arm, 'observation': value})
                        write_json(self.output / 'reach-results.json', values)
            finally:
                self.runner.env.pop('NATIVE_KQUEUE_TRACE_DYLIB', None)
            self.storage()

    def measurements(self):
        with self.runner.phase('measurement', PHASES['measurement']):
            # Fixed settle time is part of the phase budget, outside every measurement JVM.
            self.runner.run('settle', [sys.executable, '-I', '-c', 'import time; time.sleep(30)'], cap=32)
            rows = []
            for row in schedule(self.workspace):
                directory = self.runner.run('pair-%02d-%s-%s' % (row['pair'], row['case'], row['arm']), row['argv'], cap=row['cap'])
                row['observation'] = observation(directory, row['arm'], row['case'], False)
                rows.append(row)
                write_json(self.output / 'timing-results.json', rows)
                if len(rows) % 2 == 0:
                    first, second = rows[-2:]
                    if (first['case'], first['pair']) != (second['case'], second['pair']):
                        raise Failure('Adjacent arms are not one matched pair')
                    validate_pair_inputs(first['observation'], second['observation'])
            write_json(self.output / 'paired-summary.json', summarize(rows))
            self.storage()

    def execute(self):
        status = {'status': 'running', 'validation': self.expected, 'baseline': BASELINE, 'candidate': CANDIDATE}
        try:
            self.setup()
            write_json(self.output / 'timing-command-plan.json', schedule(self.workspace))
            self.build('baseline')
            self.build('candidate')
            self.reach()
            self.measurements()
            status['status'] = 'passed'
        except BaseException as exc:
            status.update(status='failed', error=repr(exc), traceback=traceback.format_exc())
            raise
        finally:
            try:
                common.cleanup(self.output)
            except BaseException as exc:
                status.update(status='failed', cleanup_error=repr(exc))
            finally:
                if time.monotonic() >= self.deadline:
                    status.update(status='failed', deadline_error='Global100-minute work cap exhausted')
                write_json(self.output / 'status.json', status)
        if status['status'] != 'passed':
            raise Failure('Comparison or cleanup incomplete')


def export(output, destination):
    output, destination = Path(output), Path(destination)
    destination.mkdir(parents=True, exist_ok=True)
    if any(destination.iterdir()):
        raise Failure('Export destination must be empty')
    selected = sorted(output.glob('*.json'))
    selected += sorted((output / 'phases').glob('*.json'))
    for name in ('command.json', 'receipt.json', 'output.log', 'stderr.log'):
        selected += sorted((output / 'commands').glob('*/' + name))
    selected += sorted(p for p in (output / 'validation-source').rglob('*') if p.is_file())
    rows, omitted, total = [], [], 0
    for source in selected:
        relative = source.relative_to(output)
        size = source.stat().st_size
        if source.is_symlink() or size > 32 * common.MiB or total + size > common.EXPORT_LIMIT - common.MiB:
            omitted.append(str(relative))
            continue
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
        total += size
        rows.append({'path': str(relative), 'bytes': size, 'sha256': sha256(target)})
    write_json(destination / 'artifact-manifest.json', {'files': rows, 'omitted': omitted, 'selected_bytes': total,
        'limit_bytes': common.EXPORT_LIMIT, 'retention_days': 5})
    if omitted or sum(p.stat().st_size for p in destination.rglob('*') if p.is_file()) > common.EXPORT_LIMIT:
        raise Failure('Artifact cap exceeded; omissions retained')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--repo', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--expected-sha')
    parser.add_argument('--cleanup', action='store_true')
    parser.add_argument('--export', type=Path)
    parser.add_argument('--plan-only', action='store_true')
    args = parser.parse_args()
    if args.cleanup:
        common.cleanup(args.output)
    elif args.export:
        export(args.output, args.export)
    elif args.plan_only:
        write_json(args.output, schedule(Path('/comparison/workspace')))
    else:
        def interrupted(sig, frame):
            raise InterruptedError('Termination signal ' + str(sig))
        signal.signal(signal.SIGTERM, interrupted)
        signal.signal(signal.SIGINT, interrupted)
        signal.signal(signal.SIGALRM, interrupted)
        Comparison(args.repo, args.output, args.expected_sha).execute()


if __name__ == '__main__':
    main()
