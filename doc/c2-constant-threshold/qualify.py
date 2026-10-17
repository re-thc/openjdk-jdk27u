#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Prepare and qualify the fixed source pair. Default is a non-executing plan."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import re
import shutil
import signal
import subprocess
import sys
import tarfile
import time
import zipfile
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True
import screen
import storage

HERE = Path(__file__).resolve().parent
BASELINE = '2c3ecf578a57f2eb4d5ed30d395e537764e0fa99'
CANDIDATE = '57f567fcb9ad7dddbd7fb2b2d9b443309681fc0f'
CODEC = '6abf77e2f63b68cc9269d5823e206235ab254c04'
CODEC_URL = 'https://github.com/re-thc/jzstd.git'
CORPUS_HASH = 'dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9'
METHOD = 'dev.jzstd.internal.BlockDecoder decodeSequencesRolling ([BIILdev/jzstd/internal/BlockDecoder$EntropyState;Ldev/jzstd/internal/Workspace;II)I'
TARGET = 'dev.jzstd.internal.BlockDecoder::decodeSequencesRolling'
IR_TEST = 'test/hotspot/jtreg/compiler/c2/irTests/TestIfConstantThreshold.java'
OVERALL_SECONDS = 7 * 3600
MEASUREMENT_SECONDS = 30 * 60
FINAL_SECONDS = 10 * 60
MAX_LOG_BYTES = 1024 * 1024 * 1024
MIN_DISK_BYTES = storage.MIN_FREE_BYTES
VARIANTS = [('baseline-release', BASELINE, 'release'), ('candidate-release', CANDIDATE, 'release'),
            ('baseline-fastdebug', BASELINE, 'fastdebug'), ('candidate-fastdebug', CANDIDATE, 'fastdebug')]
FUNCTIONAL_EXCLUSIONS = '.*(?:GoalGateTest|ReferenceParityTest)'
RELATED = [
    'compiler/c2/TestDeadLoopSplitIfLoop.java', 'compiler/c2/TestFoldCompares.java',
    'compiler/c2/TestFoldCompares2.java', 'compiler/c2/TestFoldIfRemovesTopNode.java',
    'compiler/c2/TestIfWithDeadRegion.java', 'compiler/c2/irTests/CmpUWithZero.java',
    'compiler/c2/irTests/TestBackToBackIfs.java', 'compiler/c2/irTests/TestUnsignedComparison.java',
    'compiler/igvn/TestFoldComparesCleanup.java', 'compiler/integerArithmetic/TestIntegerComparison.java',
    'compiler/loopopts/PeelingZeroTripCount.java', 'compiler/loopopts/TestCountedLoopCastIV.java',
    'compiler/loopopts/TestCountedLoopZeroIter.java', 'compiler/loopopts/TestLostDependencyOnZeroTripGuard.java',
    'compiler/loopopts/TestNotifyOpaqueZeroTripGuardToCmpI.java',
    'compiler/loopopts/TestOpaqueZeroTripGuardPostLoopRemoval.java',
    'compiler/loopopts/TestZeroTripGuardShared.java', 'compiler/rangechecks/TestFoldCompares.java',
    'compiler/uncommontrap/FoldedIfNonDomMidIf.java',
]


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temp = path.with_name(path.name + '.tmp')
    temp.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')
    temp.replace(path)


def sha256(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def file_manifest(path):
    """Hash every entry and symlink target content, including directory symlinks."""
    path = Path(path)
    if not path.exists() and not path.is_symlink():
        raise ValueError('Missing input: ' + str(path))
    rows = []
    def visit(item, relative, ancestors):
        row = dict(path=relative, mode=item.lstat().st_mode & 0o7777)
        if item.is_symlink():
            row['symlink'] = os.readlink(item)
            if item.exists():
                row['target_mode'] = item.stat().st_mode & 0o7777
        if item.is_dir():
            row['kind'] = 'directory'
            resolved = item.resolve()
            if resolved in ancestors:
                raise ValueError('Directory symlink cycle: ' + str(item))
            rows.append(row)
            for child in sorted(item.iterdir()):
                visit(child, child.name if relative == '.' else relative + '/' + child.name,
                      ancestors | {resolved})
        elif item.is_file():
            row.update(bytes=item.stat().st_size, sha256=sha256(item), kind='file')
            rows.append(row)
        elif item.is_symlink():
            row['kind'] = 'broken-symlink'
            rows.append(row)
        else:
            raise ValueError('Unsupported input entry: ' + str(item))
    visit(path, '.', set())
    return rows


def capture_source(path):
    head = subprocess.check_output(['git', '-C', str(path), 'rev-parse', 'HEAD'], text=True).strip()
    if subprocess.check_output(['git', '-C', str(path), 'status', '--porcelain', '--untracked-files=no'], text=True):
        raise ValueError('Tracked source changed: ' + str(path))
    names = subprocess.check_output(['git', '-C', str(path), 'ls-files', '-z']).decode().split('\0')
    rows = []
    for name in sorted(n for n in names if n):
        rows.append(dict(path=name, files=file_manifest(path / name)))
    return dict(head=head, tracked_files=rows)


def freeze(state, path, kind='files'):
    path = Path(os.path.abspath(path))
    record = dict(path=str(path), kind=kind,
                  contents=capture_source(path) if kind == 'source' else file_manifest(path))
    target = state / (hashlib.sha256(str(path).encode()).hexdigest() + '.json')
    if target.exists() and json.loads(target.read_text()) != record:
        raise ValueError('Cannot replace frozen input after drift: ' + str(path))
    write_json(target, record)


def verify_frozen(state, within=None):
    failures = []
    records = sorted(state.glob('*.json'))
    if not records:
        raise ValueError('No input manifests were produced')
    for record in records:
        row = json.loads(record.read_text())
        path = Path(row['path'])
        if within is not None and not path.is_relative_to(within):
            continue
        try:
            now = capture_source(path) if row['kind'] == 'source' else file_manifest(path)
            if row['kind'] == 'source-snapshot':
                names = {x['path'] for x in row['contents']}
                now = [x for x in now if x['path'] in names]
            if row['contents'] != now:
                failures.append(str(path))
        except (OSError, subprocess.SubprocessError, ValueError) as exc:
            failures.append(str(path) + ': ' + str(exc))
    if failures:
        raise ValueError('Input drift: ' + '; '.join(failures))
    return len(records)


def dependencies():
    return json.loads((HERE / 'dependencies.json').read_text())['downloads']


def internal(argv):
    return [sys.executable, str(HERE / 'qualify.py'), '--internal'] + list(map(str, argv))


def build_plan(args):
    root = args.output.resolve()
    checkout = args.checkout.resolve()
    boot = args.boot_jdk.resolve()
    deps = root / 'deps'
    logs = root / 'logs'
    results = root / 'results'
    state = root / 'input-manifests'
    steps = []
    def add(stage, name, argv, timeout, cwd=None, expected=0):
        steps.append(dict(stage=stage, name=name, argv=list(map(str, argv)), timeout_seconds=timeout,
                          cwd=str(cwd or root), expected_exit=expected))
        if cwd is not None and Path(cwd).name in storage.NAMES and str(argv[0]) in ('make', 'bash'):
            steps[-1]['active_build'] = str(Path(cwd) / 'build/qualified')
    add('prepare', 'host-preflight', internal(['host', checkout, boot, root, *args.input_root]), 120)
    for row in dependencies():
        dest = deps / row['name']
        add('prepare', 'fetch-' + row['name'], ['curl', '--fail', '--location', '--retry', '0',
            '--connect-timeout', '20', '--max-time', '180', '--output', dest, row['url']], 185)
        add('prepare', 'verify-' + row['name'], internal(['download', dest, row['sha256'], row['bytes']]), 30)
    add('prepare', 'unpack-dependencies', internal(['unpack', root]), 120)
    add('prepare', 'codec-clone', ['git', 'clone', '--no-checkout', '--filter=blob:none', CODEC_URL, root / 'codec'], 180)
    add('prepare', 'codec-pin', ['git', 'checkout', '--detach', CODEC], 180, root / 'codec')
    # Four ordinary configurations: matched release measurements and matched debug graph evidence.
    common = ['--with-boot-jdk=' + str(boot), '--with-jobs=4', '--with-num-cores=4', '--with-memory-size=8192',
              '--with-jvm-variants=server', '--disable-javac-server', '--disable-precompiled-headers', '--with-native-debug-symbols=none',
              '--with-freetype=bundled', '--with-jtreg=' + str(deps / 'jtreg'),
              '--with-jmh=' + str(deps / 'jmh'), '--with-gtest=' + str(deps / 'gtest')] + args.configure_arg
    cand = root / 'candidate-fastdebug'
    base = root / 'baseline-release'
    image = lambda name: root / name / 'build/qualified/images/jdk'
    for name, source, debug in VARIANTS:
        tree = root / name
        add('build', name + '-clone', ['git', 'clone', '--shared', '--no-checkout', checkout, tree], 120)
        add('build', name + '-pin', ['git', 'checkout', '--detach', source], 120, tree)
        add('build', name + '-configure', ['bash', 'configure', '--with-conf-name=qualified',
            '--with-debug-level=' + debug] + common, 300, tree)
        add('build', name + '-images', ['make', 'CONF=qualified', 'JOBS=4', 'images'], 4500, tree)
        add('build', name + '-provenance', internal(['image', root, name, source, debug]), 180)
        if name == 'baseline-release':
            add('validate', 'jmh-build', ['make', 'CONF=qualified', 'JOBS=4', 'build-microbenchmark'], 600, base)
            add('validate', 'jmh-list', [image('baseline-release') / 'bin/java', '-Xmx256m', '-jar',
                base / 'build/qualified/images/test/micro/benchmarks.jar', '-l'], 30)
            add('validate', 'jmh-list-evidence', internal(['jmh-list', root]), 30)
        if name == 'candidate-fastdebug':
            add('validate', 'gtest-build', ['make', 'CONF=qualified', 'JOBS=4', 'test-image-hotspot-gtest'], 600, cand)
            add('validate', 'gtest', ['make', 'CONF=qualified', 'test-only', 'TEST=gtest:opto.constant_threshold_*'], 120, cand)
            add('validate', 'gtest-evidence', internal(['gtest', root]), 30)
        add('build', name + '-prune', internal(['prune-build', root, name]), 300)
    jtreg = [str(image('candidate-fastdebug') / 'bin/java'), '-Xmx512m', '-jar', str(deps / 'jtreg/lib/jtreg.jar'),
             '-jdk:' + str(image('candidate-fastdebug')), '-timeoutFactor:4', '-agentvm', '-conc:1']
    add('validate', 'threshold-ir', jtreg + ['-w:' + str(results / 'ir-work'), '-r:' + str(results / 'ir-report'), IR_TEST], 300, cand)
    add('validate', 'threshold-stress', jtreg + ['-javaoption:-XX:+UnlockDiagnosticVMOptions',
        '-javaoption:-XX:+StressIGVN', '-javaoption:-XX:StressSeed=8275202', '-javaoption:-XX:VerifyIterativeGVN=1110',
        '-w:' + str(results / 'stress-work'), '-r:' + str(results / 'stress-report'), IR_TEST], 300, cand)
    add('validate', 'nearby-regressions', jtreg + ['-w:' + str(results / 'related-work'),
        '-r:' + str(results / 'related-report')] + ['test/hotspot/jtreg/' + x for x in RELATED], 600, cand)
    add('validate', 'codec-source-and-corpus', internal(['codec-inputs', root]), 120)
    add('validate', 'reference-zstd-build', ['make', '-j4', 'zstd'], 180, deps / 'zstd')
    add('validate', 'codec-javac', [image('baseline-release') / 'bin/javac', '--add-modules', 'jdk.incubator.vector',
        '-encoding', 'UTF-8', '-cp', deps / 'junit-platform-console-standalone-1.11.4.jar', '-d', root / 'codec-classes',
        '@' + str(root / 'codec-sources.args')], 120)
    for cls in ('Bits', 'BlockDecoder'):
        add('validate', 'javap-' + cls, [image('baseline-release') / 'bin/javap', '-c', '-p', '-l', '-s',
            '-cp', root / 'codec-classes', 'dev.jzstd.internal.' + cls], 30)
    add('validate', 'prepare-reference-frames', internal(['frames', root]), 180)
    for side in ('baseline', 'candidate'):
        jdk = image(side + '-release')
        java = [str(jdk / 'bin/java')] + screen.COMMON + ['--add-modules', 'jdk.incubator.vector']
        junit = java[:1] + ['-Xms512m', '-Xmx4g', '-XX:ActiveProcessorCount=4', '--add-modules', 'jdk.incubator.vector',
                 '-jar', str(deps / 'junit-platform-console-standalone-1.11.4.jar'), 'execute',
                 '--class-path', str(root / 'codec-classes'), '--scan-class-path', '--include-package', 'dev.jzstd',
                 '--exclude-classname', FUNCTIONAL_EXCLUSIONS, '--fail-if-no-tests', '--details', 'summary',
                 '--reports-dir', str(results / ('junit-' + side))]
        add('validate', 'codec-functional-' + side, junit, 600, root / 'codec')
        add('validate', 'codec-destinations-' + side, java + ['-cp', str(root / 'codec-classes'),
            'DecodeOverlayCheck', str(root / 'corpus/manifest.tsv')], 90)
        for level in (1, 3, 9):
            add('validate', 'codec-encode-' + side + '-' + str(level), java + ['-Dprobe.checkOnly=true', '-cp',
                str(root / 'codec-classes'), 'CodecProbe', 'encode', str(root / 'corpus/source.bin'), str(level),
                str(results / f'{side}-l{level}.zst')], 60)
        for debug in ('release', 'fastdebug'):
            log = results / f'guard-{side}-{debug}.xml'
            flags = ['-Xbatch', '-XX:-TieredCompilation', '-XX:-UseOnStackReplacement', '-XX:+UnlockDiagnosticVMOptions',
                     '-XX:+LogCompilation', '-XX:LogFile=' + str(log), '-XX:+CITime',
                     '-XX:CompileCommand=inline,dev.jzstd.internal.Bits::mask64',
                     '-XX:CompileCommand=print,' + TARGET, '-XX:CompileCommand=PrintOptoAssembly,' + TARGET]
            if debug == 'fastdebug':
                flags += ['-XX:CompileCommand=PrintIdeal,' + TARGET]
            # Existing driver's bounded 2s warmup + five700ms windows. Rates are discarded.
            add('validate', 'guard-' + side + '-' + debug,
                [str(image(side + '-' + debug) / 'bin/java')] + screen.COMMON + ['--add-modules', 'jdk.incubator.vector'] +
                flags + ['-cp', str(root / 'codec-classes'), 'CodecProbe', 'decode', str(root / 'corpus/source.bin'),
                         '1', str(root / 'corpus/source-native-l1.zst')], 90)
    add('validate', 'codec-evidence', internal(['codec-evidence', root]), 120)
    add('validate', 'freeze-measurement-inputs', internal(['freeze-runtime', root]), 180)
    add('validate', 'pre-measurement-drift', internal(['verify', root]), 300)
    config = dict(vms={side:dict(jdk=str(image(side + '-release'))) for side in ('baseline', 'candidate')},
                  jmh_jar=str(base / 'build/qualified/images/test/micro/benchmarks.jar'))
    for item in screen.commands(config, results):
        stem = Path(item['result']).stem
        add('measure', stem, item['argv'], item['timeout_seconds'])
        steps[-1]['screen_record'] = item
    add('postprocess', 'paired-results', internal(['summarize', root]), 120)
    return dict(schema=2, execute=False, baseline=BASELINE, candidate=CANDIDATE, codec=CODEC,
                overall_seconds=OVERALL_SECONDS, measurement_seconds=MEASUREMENT_SECONDS,
                finalization_reserve_seconds=FINAL_SECONDS, build_jobs=4, min_disk_bytes=MIN_DISK_BYTES,
                peak_rss_planning_gib=12, max_log_bytes=MAX_LOG_BYTES,
                storage=dict(max_work_bytes=storage.MAX_WORK_BYTES, active_build_bytes=storage.MAX_ACTIVE_BUILD_BYTES,
                             per_source_bytes=storage.MAX_SOURCE_BYTES, per_image_bytes=storage.MAX_IMAGE_BYTES,
                             free_floor_bytes=storage.FREE_FLOOR_BYTES, peak_components_bytes=storage.peak_components(),
                             policy='One active build; only campaign-owned intermediates after verified last consumers'), commands=steps,
                final_step=internal(['verify', root]))


def group_exists(pid):
    try:
        os.killpg(pid, 0)
        return True
    except ProcessLookupError:
        return False


def cleanup(process):
    # Repeated cancellation must not interrupt TERM/KILL/reap for this owned group.
    handlers = {sig:signal.signal(sig, signal.SIG_IGN) for sig in (signal.SIGINT, signal.SIGTERM)}
    try:
        if group_exists(process.pid):
            try:
                os.killpg(process.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
            until = time.monotonic() + 3
            while group_exists(process.pid) and time.monotonic() < until:
                process.poll()
                time.sleep(.05)
            if group_exists(process.pid):
                try:
                    os.killpg(process.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
        process.wait(timeout=2)
    finally:
        for sig, handler in handlers.items():
            signal.signal(sig, handler)


def log_size(root):
    return sum(p.stat().st_size for name in ('logs', 'results') for p in (root / name).rglob('*') if p.is_file())


def check_and_record_storage(root, item, point):
    sample = storage.check_limits(root, item.get('active_build'))
    path = root / 'storage/usage.json'
    previous = json.loads(path.read_text()) if path.exists() else {}
    write_json(path, dict(maximum_sampled_work_bytes=max(previous.get('maximum_sampled_work_bytes', 0), sample['work_allocated_bytes']),
                         maximum_sampled_active_build_bytes=max(previous.get('maximum_sampled_active_build_bytes', 0), sample.get('active_build_allocated_bytes', 0)),
                         minimum_sampled_free_bytes=min(previous.get('minimum_sampled_free_bytes', sample['free_bytes']), sample['free_bytes']),
                         last_command=item['name'], point=point, last_sample=sample))
    return sample


def run_one(item, root, deadline, env=None, enforce_resources=True):
    started = time.monotonic()
    end = min(deadline, started + item['timeout_seconds'])
    if end <= started:
        raise RuntimeError('Campaign/stage deadline exhausted: ' + item['name'])
    process = None
    if enforce_resources:
        check_and_record_storage(root, item, 'before')
        if time.monotonic() >= end:
            raise RuntimeError('Command budget exhausted by storage preflight: ' + item['name'])
    try:
        with (root / 'logs' / (item['name'] + '.log')).open('wb') as stream:
            process = subprocess.Popen(item['argv'], cwd=item['cwd'], env=env,
                                       stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
            last_poll, last_storage = 0, time.monotonic()
            while process.poll() is None:
                now = time.monotonic()
                if now >= end:
                    raise RuntimeError('Timeout: ' + item['name'])
                if enforce_resources and now - last_poll > 2:
                    if log_size(root) > MAX_LOG_BYTES:
                        raise RuntimeError('1GiB log stop threshold exceeded')
                    if shutil.disk_usage(root).free < 2 * 1024**3:
                        raise RuntimeError('Less than2GiB disk free; stop')
                    last_poll = now
                if enforce_resources and item.get('active_build') and now - last_storage > 30:
                    check_and_record_storage(root, item, 'during-build')
                    last_storage = time.monotonic()
                time.sleep(.1)
            if process.returncode != item.get('expected_exit', 0):
                raise RuntimeError(f"{item['name']}: exit{process.returncode}; see private log")
            if group_exists(process.pid):
                raise RuntimeError('Launcher exited with children remaining: ' + item['name'])
            if enforce_resources:
                check_and_record_storage(root, item, 'after')
            if time.monotonic() > end or (enforce_resources and log_size(root) > MAX_LOG_BYTES):
                raise RuntimeError('Final command write/time exceeded budget: ' + item['name'])
    finally:
        if process is not None:
            cleanup(process)
    return dict(item, elapsed_seconds=time.monotonic() - started, returncode=process.returncode)


class Cancelled(BaseException):
    pass


def execute(args, plan):
    started = time.monotonic()
    end = started + OVERALL_SECONDS
    main_end = end - FINAL_SECONDS
    root = args.output.resolve()
    root.mkdir(parents=True, exist_ok=False)
    for sub in ('deps', 'logs', 'results', 'input-manifests', 'storage', 'tmp'):
        (root / sub).mkdir()
    write_json(root / 'plan.json', plan)
    write_json(root / 'campaign-owner.json', storage.create_owner(root, sha256(root / 'plan.json')))
    freeze(root / 'input-manifests', root / 'campaign-owner.json')
    records, failure, final_failure = [], None, None
    old_handlers = {}
    def cancel(signum, _frame):
        raise Cancelled('Cancelled by signal' + str(signum))
    for signum in (signal.SIGINT, signal.SIGTERM):
        old_handlers[signum] = signal.signal(signum, cancel)
    env = os.environ.copy()
    env['PYTHONDONTWRITEBYTECODE'] = '1'
    env['TMPDIR'] = str(root / 'tmp')
    env['PATH'] = str(root / 'deps/zstd/programs') + os.pathsep + env['PATH']
    measurement_start = None
    try:
        for item in plan['commands']:
            deadline = main_end
            if item['stage'] == 'measure':
                if measurement_start is None:
                    measurement_start = time.monotonic()
                deadline = min(deadline, measurement_start + MEASUREMENT_SECONDS)
            if item['stage'] == 'postprocess' and measurement_start is not None:
                # Postprocessing belongs to overall budget, outside measurement allowance.
                pass
            print(item['stage'] + ': ' + item['name'], flush=True)
            record = run_one(item, root, deadline, env)
            records.append(record)
            write_json(root / 'runs.json', records)
    except BaseException as exc:
        failure = type(exc).__name__ + ': ' + str(exc)
    finally:
        # A second TERM must not bypass descendant cleanup or the bounded final drift check.
        for signum in old_handlers:
            signal.signal(signum, signal.SIG_IGN)
        try:
            item = dict(name='final-input-drift', argv=internal(['verify', root]), cwd=str(root),
                        timeout_seconds=120 if failure else FINAL_SECONDS - 10)
            record = run_one(item, root, end - 5, env, enforce_resources=False)
            write_json(root / 'final-verification.json', record)
        except BaseException as exc:
            final_failure = type(exc).__name__ + ': ' + str(exc)
        write_json(root / 'outcome.json', dict(completed=failure is None and final_failure is None,
            failure=failure, final_verification_failure=final_failure, elapsed_seconds=time.monotonic() - started,
            measurement_elapsed_seconds=(sum(r['elapsed_seconds'] for r in records if r['stage'] == 'measure')),
            interpretation='Investigation screen only; review flags and exact codec guard evidence. No codec throughput or full-gap claim.'))
        for signum, handler in old_handlers.items():
            signal.signal(signum, handler)
    if failure or final_failure:
        raise RuntimeError(str(failure or final_failure))
    print('Completed bounded workflow. Review private reports; flags prevent an unexplained GO.')


def extract_archive(archive, destination):
    destination.mkdir(parents=True, exist_ok=True)
    if archive.suffix == '.zip':
        with zipfile.ZipFile(archive) as source:
            for entry in source.infolist():
                target = (destination / entry.filename).resolve()
                if not target.is_relative_to(destination.resolve()):
                    raise ValueError('Archive path escapes destination')
            source.extractall(destination)
            for entry in source.infolist():
                mode = entry.external_attr >> 16
                if mode and not entry.is_dir():
                    (destination / entry.filename).chmod(mode & 0o777)
    else:
        with tarfile.open(archive) as source:
            source.extractall(destination, filter='data')


def host_preflight(checkout, boot, root, extras):
    if platform.system() != 'Linux' or platform.machine() != 'x86_64':
        raise ValueError('This reviewed plan is Linux x86-64 only')
    if not sys.version_info >= (3, 12):
        raise ValueError('Python3.12+ required for safe archive extraction')
    for name in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS'):
        if os.environ.get(name):
            raise ValueError(name + ' must be unset')
    if shutil.disk_usage(root).free < MIN_DISK_BYTES:
        raise ValueError('Need20GiB free scratch for the staged campaign, including2GiB free-space floor')
    if not (boot / 'bin/java').is_file() or not (boot / 'bin/javac').is_file():
        raise ValueError('Supply a normal supported boot JDK26/27 via --boot-jdk')
    release = (boot / 'release').read_text()
    if not re.search(r'JAVA_VERSION="(?:26|27)(?:[.\-+"e])', release):
        raise ValueError('Boot JDK must match repository boot requirement26/27')
    for source in (BASELINE, CANDIDATE):
        subprocess.run(['git', '-C', str(checkout), 'cat-file', '-e', source + '^{commit}'], check=True)
    tools = {}
    for name in ('git', 'make', 'gcc', 'g++', 'as', 'ld', 'ar', 'objdump', 'autoconf', 'bash', 'curl', 'python3'):
        binary = shutil.which(name)
        if binary is None:
            raise ValueError('Normal JDK build prerequisite missing: ' + name)
        tools[name] = binary
        freeze(root / 'input-manifests', binary)
    freeze(root / 'input-manifests', boot)
    for path in sorted(HERE.iterdir()):
        if path.is_file():
            freeze(root / 'input-manifests', path)
    for path in extras:
        freeze(root / 'input-manifests', Path(path))
    write_json(root / 'host-inputs.json', dict(platform=platform.platform(), machine=platform.machine(),
        boot_release=release, executable_paths=tools, path=os.environ.get('PATH'),
        build_environment={k:v for k,v in os.environ.items() if k in (
            'CC', 'CXX', 'LD', 'AR', 'AS', 'NM', 'AUTOCONF', 'AUTOM4TE', 'M4', 'AUTOM4TE_CFG',
            'autom4te_perllibdir', 'AC_MACRODIR', 'trailer_m4', 'CONFIG_SITE', 'CFLAGS', 'CXXFLAGS', 'LDFLAGS')},
        note='Private host metadata. Normal OS development headers/libraries remain host prerequisites; --input-root hashes non-system toolchain/sysroot roots.'))


def unpack(root):
    deps = root / 'deps'
    for name, subdir in (('gtest.tar.gz', 'gtest'), ('zstd.tar.gz', 'zstd')):
        temp = deps / (subdir + '-unpacked')
        extract_archive(deps / name, temp)
        children = list(temp.iterdir())
        if len(children) != 1 or not children[0].is_dir():
            raise ValueError('Unexpected archive layout: ' + name)
        children[0].rename(deps / subdir)
        temp.rmdir()
    extract_archive(deps / 'jtreg.zip', deps)
    (deps / 'jmh').mkdir()
    for row in dependencies():
        if row['name'].startswith(('jmh-', 'jopt-', 'commons-math')):
            shutil.copy2(deps / row['name'], deps / 'jmh' / row['name'])
    freeze(root / 'input-manifests', deps / 'zstd', 'source-snapshot')
    for name in ('gtest', 'jtreg', 'jmh'):
        freeze(root / 'input-manifests', deps / name)


def image_provenance(root, name, source, debug):
    tree = root / name
    spec = tree / 'build/qualified/spec.gmk'
    contents = spec.read_text()
    if not re.search(r'^DEBUG_LEVEL\s*:?=\s*' + debug + r'\s*$', contents, re.M):
        raise ValueError('Configured debug level does not match plan: ' + name)
    source_record = capture_source(tree)
    if source_record['head'] != source:
        raise ValueError('Source pin mismatch: ' + name)
    freeze(root / 'input-manifests', tree, 'source')
    configure = tree / 'build/qualified/configure.log'
    spec_fields = [line for line in contents.splitlines() if re.match(
        r'^(CC|CXX|LD|AR|AS|NM|STRIP|OBJCOPY|COMPILER_VERSION|BOOT_JDK|JVM_VARIANTS|JVM_FEATURES|DEBUG_LEVEL|JVM_CFLAGS|JVM_LDFLAGS|EXTRA_CFLAGS|EXTRA_CXXFLAGS|EXTRA_LDFLAGS)\b', line)]
    image = tree / 'build/qualified/images/jdk'
    for path in (image, spec, configure):
        freeze(root / 'input-manifests', path)
    plan = json.loads((root / 'plan.json').read_text())
    configured = next(x['argv'] for x in plan['commands'] if x['name'] == name + '-configure')
    normalized = [x.replace(str(tree), '$SOURCE') for x in configured]
    write_json(root / 'results' / (name + '-build.json'), dict(source_commit=source,
        common_prerequisite=BASELINE, debug_level=debug, image=str(image),
        release=(image / 'release').read_text(), normalized_configure_arguments=normalized,
        spec_sha256=sha256(spec), configure_log_sha256=sha256(configure), spec_fields=spec_fields,
        libjvm_sha256=sha256(image / 'lib/server/libjvm.so')))
    # Keep actual complete config/spec alongside the private source/image manifest.
    shutil.copy2(spec, root / 'results' / (name + '-spec.gmk'))
    shutil.copy2(configure, root / 'results' / (name + '-configure.log'))


def prune_build(root, name):
    """After successful last consumers, verify and remove only this campaign's intermediates."""
    owner = storage.require_owner(root, sha256(root / 'plan.json'))
    if name not in storage.LAST_CONSUMERS:
        raise ValueError('Unknown prune variant')
    runs = json.loads((root / 'runs.json').read_text())
    completed = {r['name'] for r in runs if r.get('returncode') == 0}
    missing = set(storage.LAST_CONSUMERS[name]) - completed
    if missing:
        raise ValueError('Last consumers have not succeeded: ' + str(sorted(missing)))
    tree = root / name
    expected = next(source for variant, source, _ in VARIANTS if variant == name)
    if capture_source(tree)['head'] != expected:
        raise ValueError('Wrong source identity before pruning')
    state = root / 'input-manifests'
    # Every original source/image/config manifest must already exist and still match.
    build, targets = storage.deletion_targets(root, name)
    keepers = [tree, build / 'images/jdk', build / 'spec.gmk', build / 'configure.log']
    for keeper in keepers:
        manifest = state / (hashlib.sha256(str(keeper).encode()).hexdigest() + '.json')
        if not manifest.is_file():
            raise ValueError('Required original input manifest missing: ' + str(keeper))
    verify_frozen(state, within=tree)
    keepers = keepers[1:]
    if name == 'baseline-release':
        jar = build / 'images/test/micro/benchmarks.jar'
        freeze(state, jar)
        keepers.append(jar)
    if name == 'candidate-fastdebug':
        gtest = build / 'images/test/hotspot/gtest'
        freeze(state, gtest)
        keepers.append(gtest)
    # Preserve detailed normal build/test evidence before removing its generated container.
    evidence = root / 'results/build-evidence' / name
    evidence.mkdir(parents=True, exist_ok=False)
    for relative in ('build.log', 'build.log.old', 'configure-support', 'make-support/build-times', 'test-results'):
        source = build / relative
        if source.exists():
            destination = evidence / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            if source.is_dir():
                shutil.copytree(source, destination, symlinks=True)
            else:
                shutil.copy2(source, destination, follow_symlinks=False)
    keepers.append(evidence)
    storage.reject_live_references(keepers, targets)
    journal = root / 'storage' / (name + '-prune.json')
    record = dict(status='verified-before-removal', owner_token=owner['token'], source_commit=expected,
                  required_consumers=list(storage.LAST_CONSUMERS[name]),
                  allocated_build_before=storage.allocated_bytes(build),
                  targets=[str(p.relative_to(build)) for p in targets], removed=[])
    write_json(journal, record)
    for target in targets:
        storage.remove_generated(target)
        record['removed'].append(str(target.relative_to(build)))
        record['status'] = 'removing'
        write_json(journal, record)
    # Keep original path-based source/image/config manifests, with no retirement or replacement.
    verify_frozen(state, within=tree)
    freeze(state, evidence)
    record.update(status='complete', allocated_build_after=storage.allocated_bytes(build))
    write_json(journal, record)
    record['storage_after'] = storage.check_limits(root)
    write_json(journal, record)

def codec_inputs(root):
    codec = root / 'codec'
    record = capture_source(codec)
    if record['head'] != CODEC:
        raise ValueError('Codec source pin mismatch')
    freeze(root / 'input-manifests', codec, 'source')
    sources = sorted((codec / 'src/main/java').rglob('*.java'))
    corpus = b''.join(p.read_bytes() + b'\n' for p in sources)
    if len(sources) != 37 or len(corpus) != 764896 or hashlib.sha256(corpus).hexdigest() != CORPUS_HASH:
        raise ValueError('Pinned production source corpus changed')
    (root / 'corpus').mkdir()
    (root / 'corpus/source.bin').write_bytes(corpus)
    (root / 'codec-classes').mkdir()
    java = sources + sorted((codec / 'src/test/java').rglob('*.java')) + [
        codec / 'scripts/jdk27/CodecProbe.java', codec / 'scripts/jdk27/DecodeOverlayCheck.java']
    # javac argument files use double quotes; no shell interpolation occurs.
    def quote(path):
        return '"' + str(path).replace('\\', '\\\\').replace('"', '\\"') + '"'
    (root / 'codec-sources.args').write_text('\n'.join(quote(p) for p in java) + '\n')
    write_json(root / 'results/codec-source-provenance.json', dict(commit=CODEC,
        sources=[dict(path=str(p.relative_to(codec)), sha256=sha256(p)) for p in java],
        source_corpus=dict(files=len(sources), bytes=len(corpus), sha256=CORPUS_HASH),
        existing_generator='scripts/jdk27/run.py; sorted production files plus newline',
        existing_destinations='scripts/jdk27/check_overlays.py; same54-case generator, no overlays',
        functional_exclusions=['GoalGateTest', 'ReferenceParityTest'],
        exclusion_reason='Existing ratio/throughput gates are outside this compiler correctness screen; remaining functional tests are unchanged.'))


def reference_frames(root):
    zstd = root / 'deps/zstd/programs/zstd'
    corpus = root / 'corpus'
    original = (corpus / 'source.bin').read_bytes()
    # Exact existing check_overlays.py generator,54 cases; no new data patterns or levels.
    random_bytes = random.Random(27).randbytes(300000)
    rows, cases = [], []
    for size in (0, 7, 257, 131071, 131073, 300000):
        inputs = dict(random=random_bytes[:size], periodic=(random_bytes[:256] * 1172)[:size], source=original[:size])
        for name, data in inputs.items():
            source = corpus / f'{name}-{size}.bin'
            source.write_bytes(data)
            for level in (1, 3, 9):
                frame = corpus / f'{name}-{size}.l{level}.zst'
                subprocess.run([str(zstd), '-q', '-f', '--no-check', f'-{level}', str(source), '-o', str(frame)], check=True)
                rows.append(f'{source}\t{frame}')
                cases.append(dict(source=str(source), frame=str(frame), level=level, bytes=len(data),
                                  source_sha256=sha256(source), frame_sha256=sha256(frame)))
    for level in (1, 3, 9):
        subprocess.run([str(zstd), '-q', '-f', '--no-check', f'-{level}', str(corpus / 'source.bin'),
                        '-o', str(corpus / f'source-native-l{level}.zst')], check=True)
    (corpus / 'manifest.tsv').write_text('\n'.join(rows) + '\n')
    write_json(root / 'results/corpus-cases.json', cases)
    freeze(root / 'input-manifests', corpus)
    freeze(root / 'input-manifests', zstd)
    freeze(root / 'input-manifests', root / 'codec-classes')
    freeze(root / 'input-manifests', root / 'codec-sources.args')


def check_gtest(root):
    text = (root / 'logs/gtest.log').read_text(errors='replace')
    names = ('signed_int', 'unsigned_int', 'signed_long', 'unsigned_long')
    for name in names:
        if not re.search(r'\[\s*OK\s*\]\s+opto\.constant_threshold_' + name + r'\b', text):
            raise ValueError('Standard GTest harness did not pass opto.constant_threshold_' + name)
    write_json(root / 'results/gtest.json', dict(harness='normal make test-only gtest', passed=list(names),
                                                log_sha256=sha256(root / 'logs/gtest.log')))


def codec_evidence(root):
    from guard_evidence import evaluate
    report = evaluate(root, METHOD)
    for side in ('baseline', 'candidate'):
        log = (root / 'logs' / ('codec-destinations-' + side + '.log')).read_text()
        if 'decode overlay checks: 918 passed' not in log:
            raise ValueError('Existing54-frame /918 destination checks incomplete: ' + side)
        for level in (1, 3, 9):
            frame = root / 'results' / f'{side}-l{level}.zst'
            text = (root / 'logs' / f'codec-encode-{side}-{level}.log').read_text()
            if f'checked encode L{level} input=764896 frame=' not in text:
                raise ValueError('Check-only encoder driver did not consume source corpus')
            if side == 'candidate' and sha256(frame) != sha256(root / 'results' / f'baseline-l{level}.zst'):
                raise ValueError('VMs produced different frames at identical codec source/defaults')
            decoded = root / 'results' / f'{side}-l{level}.decoded'
            subprocess.run([str(root / 'deps/zstd/programs/zstd'), '-q', '-d', '-f', str(frame), '-o', str(decoded)], check=True)
            if sha256(decoded) != CORPUS_HASH:
                raise ValueError('Native decoder disagrees with encoder source corpus')
        reports = sorted((root / 'results' / ('junit-' + side)).glob('TEST-*.xml'))
        if not reports:
            raise ValueError('JUnit produced no functional reports')
        counts = dict(tests=0, failures=0, errors=0, skipped=0)
        for path in reports:
            tree = ET.parse(path).getroot()
            for key in counts:
                counts[key] += int(tree.get(key, '0'))
        if counts['tests'] < 30 or counts['failures'] or counts['errors'] or counts['skipped']:
            raise ValueError('Functional suite incomplete or skipped: ' + str(counts))
        report[side]['functional_junit'] = counts
    write_json(root / 'results/codec-qualification.json', report)


def freeze_runtime(root):
    state = root / 'input-manifests'
    for name, _, _ in VARIANTS:
        freeze(state, root / name / 'build/qualified/images/jdk')
        freeze(state, root / name / 'build/qualified/spec.gmk')
        freeze(state, root / name / 'build/qualified/configure.log')
    freeze(state, root / 'candidate-fastdebug/build/qualified/images/test/hotspot/gtest')
    freeze(state, root / 'baseline-release/build/qualified/images/test/micro/benchmarks.jar')
    for row in dependencies():
        freeze(state, root / 'deps' / row['name'])
    for debug in ('release', 'fastdebug'):
        a = json.loads((root / 'results' / ('baseline-' + debug + '-build.json')).read_text())
        b = json.loads((root / 'results' / ('candidate-' + debug + '-build.json')).read_text())
        if a['normalized_configure_arguments'] != b['normalized_configure_arguments']:
            raise ValueError('Build configurations differ in matched ' + debug + ' pair')


def summarize(root):
    records = [r['screen_record'] for r in json.loads((root / 'runs.json').read_text()) if 'screen_record' in r]
    if len(records) != 36:
        raise ValueError('The fixed36-run screen is incomplete')
    ratios = screen.summarize(records, root / 'results')
    screen.compilation_metrics(records, root / 'results', root / 'logs')
    sizes = json.loads((root / 'results/compilation-metrics.json').read_text())
    codec = json.loads((root / 'results/codec-qualification.json').read_text())
    investigate = any(x['investigate'] for x in ratios + sizes['comparisons'] + codec['code_size_comparisons'])
    write_json(root / 'results/review.json', dict(investigation_required=investigate,
        automatic_go=False, reason='Three pairs are an investigation screen, not a significance test. Review all flags and codec guard scopes.',
        codec_throughput_measured=False, explains_full_native_gap=False))


def internal_main(words):
    action, *words = words
    if action == 'host':
        checkout, boot, root, *extras = map(Path, words)
        host_preflight(checkout, boot, root, extras)
    elif action == 'download':
        path, expected, size = words
        if Path(path).stat().st_size != int(size) or sha256(path) != expected:
            raise ValueError('Pinned dependency hash/length mismatch: ' + path)
    elif action == 'unpack':
        unpack(Path(words[0]))
    elif action == 'image':
        image_provenance(Path(words[0]), *words[1:])
    elif action == 'prune-build':
        prune_build(Path(words[0]), words[1])
    elif action == 'jmh-list':
        root = Path(words[0])
        found = set((root / 'logs/jmh-list.log').read_text().splitlines())
        expected = {name for name, _ in screen.CONTROLS} | set(screen.COMPILER_CONTROLS)
        if not expected <= found:
            raise ValueError('Missing JMH controls: ' + str(expected - found))
    elif action == 'codec-inputs':
        codec_inputs(Path(words[0]))
    elif action == 'frames':
        reference_frames(Path(words[0]))
    elif action == 'gtest':
        check_gtest(Path(words[0]))
    elif action == 'codec-evidence':
        codec_evidence(Path(words[0]))
    elif action == 'freeze-runtime':
        freeze_runtime(Path(words[0]))
    elif action == 'verify':
        count = verify_frozen(Path(words[0]) / 'input-manifests')
        print('Verified unchanged input manifests:', count)
    elif action == 'summarize':
        summarize(Path(words[0]))
    else:
        raise ValueError('Unknown internal action: ' + action)


def main():
    if len(sys.argv) > 1 and sys.argv[1] == '--internal':
        internal_main(sys.argv[2:])
        return
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--checkout', type=Path, default=HERE.parents[1])
    parser.add_argument('--boot-jdk', type=Path, required=True, help='Normal JDK26/27 build prerequisite; no prebuilt candidate required')
    parser.add_argument('--output', type=Path, required=True, help='New private work/results directory; reserve20GiB for staged builds')
    parser.add_argument('--configure-arg', action='append', default=[], help='Same extra configure argument for every build; use = syntax')
    parser.add_argument('--input-root', type=Path, action='append', default=[], help='Hash an external non-system compiler/sysroot/tool root')
    parser.add_argument('--execute', action='store_true', help='Only after review/authorization: prepare, build and run the complete bounded workflow')
    args = parser.parse_args()
    protected = ('--with-conf-name', '--with-debug-level', '--with-boot-jdk', '--with-jobs', '--with-num-cores',
                 '--with-memory-size', '--with-gtest', '--without-gtest', '--with-jmh', '--with-jtreg')
    if any(x.startswith(protected) for x in args.configure_arg):
        parser.error('Extra configure arguments cannot override pinned inputs or paired resource/debug settings')
    if args.output.resolve().is_relative_to(args.checkout.resolve()):
        parser.error('Private output must be outside the source checkout')
    plan = build_plan(args)
    if not args.execute:
        print(json.dumps(plan, indent=2))
    else:
        execute(args, plan)


if __name__ == '__main__':
    main()
