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

"""Bounded future qualification. Default: print commands; never build or install."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shlex
import signal
import statistics
import subprocess
import time

BASELINE = '2c3ecf578a57f2eb4d5ed30d395e537764e0fa99'
CONTROLS = [
    ('org.openjdk.bench.vm.compiler.UnsignedComparison.intConDirect', []),
    ('org.openjdk.bench.vm.compiler.UnsignedComparison.longConDirect', []),
    ('org.openjdk.bench.vm.compiler.IfMinMax.testReductionInt', []),
    ('org.openjdk.bench.java.util.HashMapBench.put', ['size=16384', 'mapType=HASH_MAP']),
]
COMPILER_CONTROLS = [
    'org.openjdk.bench.vm.compiler.overhead.SimpleRepeatCompilation.mixHashCode_baseline',
    'org.openjdk.bench.vm.compiler.overhead.SimpleRepeatCompilation.mixHashCode_repeat_c2',
]
COMMON = ['-Xms512m', '-Xmx512m', '-XX:ReservedCodeCacheSize=128m', '-XX:ActiveProcessorCount=4']
MAX_SECONDS = 1800
MAX_OUTPUT_BYTES = 512 * 1024 * 1024


def digest(path):
    path = Path(path)
    if path.is_file():
        h = hashlib.sha256()
        with path.open('rb') as stream:
            for chunk in iter(lambda: stream.read(1024 * 1024), b''):
                h.update(chunk)
        return h.hexdigest()
    if path.is_dir():
        h = hashlib.sha256()
        for item in sorted(p for p in path.rglob('*') if p.is_file()):
            h.update(str(item.relative_to(path)).encode() + b'\0')
            h.update(bytes.fromhex(digest(item)))
        return h.hexdigest()
    raise ValueError(f'Missing input: {path}')


def validate(config):
    errors = []
    for key in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS'):
        if os.environ.get(key):
            errors.append(key + ' must be unset so inherited options cannot change the paired VMs')
    manifests = {}
    expected = {'baseline': BASELINE, 'candidate': config['candidate_source_commit']}
    for side in ('baseline', 'candidate'):
        vm = config['vms'][side]
        jdk = Path(vm['jdk'])
        try:
            manifest = json.loads(Path(vm['build_manifest']).read_text())
            manifests[side] = manifest
            if manifest['source_commit'] != expected[side] or not re.fullmatch(r'[0-9a-f]{40}', expected[side]):
                raise ValueError('source commit does not match the reviewed pin')
            if manifest['debug_level'] != 'release':
                raise ValueError('matched release VMs required; fastdebug evidence is not a throughput result')
            if manifest['common_prerequisite'] != BASELINE:
                raise ValueError('missing common GCC prerequisite identity')
            if digest(jdk / 'lib/server/libjvm.so') != manifest['libjvm_sha256']:
                raise ValueError('libjvm hash mismatch')
            if not os.access(jdk / 'bin/java', os.X_OK):
                raise ValueError('java launcher missing or not executable')
        except (OSError, KeyError, ValueError) as exc:
            errors.append(f'{side} VM: {exc}')
    if len(manifests) == 2:
        for key in ('compiler', 'normalized_configure_arguments', 'boot_jdk'):
            if manifests['baseline'].get(key) != manifests['candidate'].get(key) or not manifests['baseline'].get(key):
                errors.append(f'Builds need identical, nonempty {key}')
    try:
        head = subprocess.check_output(['git', '-C', config['codec_repo'], 'rev-parse', 'HEAD'],
                                       text=True, stderr=subprocess.DEVNULL).strip()
        if head != config['codec_source_commit']:
            raise ValueError('codec source SHA mismatch')
        if subprocess.check_output(['git', '-C', config['codec_repo'], 'status', '--porcelain'], text=True).strip():
            raise ValueError('codec checkout must be clean')
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        errors.append(f'Unchanged codec source: {exc}')
    for item in config['pinned_inputs']:
        try:
            if digest(item['path']) != item['sha256']:
                raise ValueError('SHA-256 mismatch')
        except (OSError, ValueError) as exc:
            errors.append(f"Pinned input {item['path']}: {exc}")
    pinned = {Path(item['path']).resolve() for item in config['pinned_inputs']}
    required = [config['jmh_jar']] + config['codec_classpath'].split(os.pathsep)
    for path in required:
        if Path(path).resolve() not in pinned:
            errors.append(f'Classpath/JMH input is not pinned: {path}')
    try:
        corpus = json.loads(Path(config['corpus_manifest']).read_text())
        if not corpus or not config['corpus_coverage'] or 'REPLACE' in str(config['corpus_coverage']):
            raise ValueError('existing corpus and its actual coverage must be explicit')
        if sum(Path(item['path']).stat().st_size for item in corpus) > 64 * 1024 * 1024:
            raise ValueError('existing encoded corpus exceeds 64 MiB plan limit')
        if not 0 < config['corpus_max_decoded_bytes'] <= 512 * 1024 * 1024:
            raise ValueError('decoded corpus must fit the declared 512 MiB limit')
        for item in corpus:
            if digest(item['path']) != item['sha256']:
                raise ValueError(f"corpus hash mismatch: {item['path']}")
    except (OSError, KeyError, ValueError) as exc:
        errors.append(f'Existing correctness corpus: {exc}')
    for key in ('guard_main_args', 'correctness_main_args'):
        if not config[key] or any('REPLACE' in str(x) for x in config[key]):
            errors.append(f'{key}: supply the existing driver command, without rewriting Java')
    if not config.get('correctness_success_regex') or 'REPLACE' in config['correctness_success_regex']:
        errors.append('Specify the existing corpus driver success marker; exit zero alone can hide skipped work')
    if not any('decodeSequencesRolling' in arg for arg in config['guard_vm_args']):
        errors.append('Guard VM arguments must print the existing decodeSequencesRolling compilation')
    if not config.get('guard_method') or 'REPLACE' in config['guard_method']:
        errors.append('Pin the exact existing codec guard owner/name/JVM descriptor')
    for key in ('guard_vm_args', 'correctness_vm_args'):
        if any(arg.startswith(('-Xmx', '-Xms', '-XX:ReservedCodeCacheSize', '-XX:ActiveProcessorCount',
                               '-XX:MaxRAM', '-XX:InitialRAM', '-XX:MaxHeapSize', '-XX:InitialHeapSize')) for arg in config[key]):
            errors.append(key + ': memory/processor bounds belong to the shared plan, not per-driver overrides')
    if errors:
        raise ValueError('\n'.join(errors))
    return manifests


def commands(config, output):
    result = []
    def add(kind, case, side, pair, argv, timeout, score=None):
        result.append(dict(kind=kind, case=case, side=side, pair=pair, argv=argv,
                           timeout_seconds=timeout, result=str(score) if score else None))
    for kind in ('guard', 'correctness'):
        for side in ('baseline', 'candidate'):
            java = str(Path(config['vms'][side]['jdk']) / 'bin/java')
            vm_args = list(config[kind + '_vm_args'])
            if kind == 'guard':
                vm_args += ['-XX:+UnlockDiagnosticVMOptions', '-XX:+LogCompilation',
                            '-XX:LogFile=' + str(output / f'guard-{side}-%p.xml')]
            argv = [java] + COMMON + vm_args + ['-cp', config['codec_classpath']] + config[kind + '_main_args']
            add(kind, 'existing-jzstd', side, 0, argv, 90 if kind == 'guard' else 180)
    cases = [('throughput', name, params) for name, params in CONTROLS]
    cases += [('compiler', name, []) for name in COMPILER_CONTROLS]
    for kind, name, params in cases:
        # Three fresh paired forks. Alternate order to expose drift.
        for pair, order in enumerate((('baseline', 'candidate'), ('candidate', 'baseline'), ('baseline', 'candidate'))):
            for side in order:
                java = str(Path(config['vms'][side]['jdk']) / 'bin/java')
                stem = f'{kind}-{name.rsplit(".", 1)[-1]}-{pair}-{side}'
                log = output / (stem + '-compile-%p.xml')
                score = output / (stem + '.json')
                child_flags = COMMON + ['-XX:+UnlockDiagnosticVMOptions', '-XX:+LogCompilation', '-XX:LogFile=' + str(log)]
                if kind == 'compiler':
                    child_flags += ['-XX:+CITime']
                argv = [java, '-Xmx256m', '-jar', config['jmh_jar'], '^' + re.escape(name) + '$',
                        '-jvm', java, '-f', '1', '-wf', '0', '-t', '1', '-foe', 'true',
                        '-rf', 'json', '-rff', str(score), '-jvmArgsAppend', shlex.join(child_flags)]
                if kind == 'throughput':
                    argv += ['-bm', 'thrpt', '-tu', 's', '-wi', '3', '-w', '1s', '-i', '5', '-r', '1s']
                else:
                    # Zero warmup is essential: RepeatCompilation cost occurs on first invocation.
                    argv += ['-bm', 'ss', '-tu', 'ms', '-wi', '0', '-i', '1']
                for value in params:
                    argv += ['-p', value]
                add(kind, name, side, pair, argv, 35 if kind == 'throughput' else 45, score)
    return result


def output_size(output):
    return sum(p.stat().st_size for p in output.rglob('*') if p.is_file())


def group_exists(pid):
    try:
        os.killpg(pid, 0)
        return True
    except ProcessLookupError:
        return False


def clean_group(process):
    # Own only the process group created for this command, including JMH forks.
    if group_exists(process.pid):
        try:
            os.killpg(process.pid, signal.SIGTERM)
        except ProcessLookupError:
            pass
        limit = time.monotonic() + 3
        while group_exists(process.pid) and time.monotonic() < limit:
            process.poll()
            time.sleep(0.05)
        if group_exists(process.pid):
            try:
                os.killpg(process.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
    try:
        process.wait(timeout=3)
    except subprocess.TimeoutExpired:
        pass


def run_one(item, output, deadline):
    label = f"{item['kind']}-{item['case'].rsplit('.', 1)[-1]}-{item['pair']}-{item['side']}"
    start = time.monotonic()
    timeout = min(item['timeout_seconds'], deadline - start)
    if timeout <= 0:
        raise RuntimeError('Global 30-minute budget exhausted; no automatic continuation')
    if output_size(output) >= MAX_OUTPUT_BYTES:
        raise RuntimeError('Output budget already exhausted; no command launched')
    process = None
    failure = None
    try:
        with (output / (label + '.log')).open('wb') as stream:
            process = subprocess.Popen(item['argv'], stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
            while process.poll() is None:
                if time.monotonic() - start > timeout:
                    failure = 'command/global timeout'
                elif output_size(output) > MAX_OUTPUT_BYTES:
                    failure = '512 MiB output stop threshold exceeded'
                if failure:
                    break
                time.sleep(0.2)
            if process.poll() is not None and group_exists(process.pid):
                failure = 'launcher exited with child processes remaining'
    finally:
        # Also cover Ctrl-C, output/stat errors, and an exited launcher with live forks.
        if process is not None:
            clean_group(process)
    # A fast final write can exceed the threshold between polls.
    if output_size(output) > MAX_OUTPUT_BYTES:
        failure = '512 MiB output stop threshold exceeded'
    if time.monotonic() - start > timeout:
        failure = failure or 'command/global timeout'
    record = dict(item, returncode=process.returncode, elapsed_seconds=time.monotonic() - start, failure=failure)
    if failure or process.returncode:
        raise RuntimeError(json.dumps(record))
    return record


def summarize(records, output):
    groups = {}
    for item in records:
        if not item['result']:
            continue
        data = json.loads(Path(item['result']).read_text())
        if len(data) != 1 or data[0]['benchmark'] != item['case']:
            raise ValueError('Expected exactly the selected JMH result')
        metric = data[0]['primaryMetric']
        groups.setdefault((item['kind'], item['case']), {}).setdefault(item['pair'], {})[item['side']] = metric
    report = []
    for (kind, case), pairs in groups.items():
        ratios = []
        for sides in pairs.values():
            a, b = sides['baseline'], sides['candidate']
            if a['scoreUnit'] != b['scoreUnit'] or any(not math.isfinite(x['score']) or x['score'] <= 0 for x in (a, b)):
                raise ValueError('Invalid paired score/unit')
            ratios.append(b['score'] / a['score'])
        median = statistics.median(ratios)
        flag = median < 0.97 if kind == 'throughput' else median > 1.05
        report.append(dict(kind=kind, case=case, paired_candidate_over_baseline=ratios,
                           median_ratio=median, investigate=flag))
    (output / 'ratios.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def compilation_metrics(records, output):
    metrics = []
    for item in records:
        if not item['result']:
            continue
        stem = Path(item['result']).stem
        logs = list(output.glob(stem + '-compile-*.xml'))
        if len(logs) != 1:
            raise ValueError(f'Expected one fresh-fork compilation log: {stem}')
        text = logs[0].read_text(errors='replace')
        owner, method = item['case'].rsplit('.', 1)
        package, simple = owner.rsplit('.', 1)
        prefixes = (owner + ' ' + method + ' ',
                    package + '.jmh_generated.' + simple + '_' + method + '_jmhTest ')
        if item['kind'] == 'compiler':
            prefixes += (owner + ' mixHashCode ',)
        selected = {}
        for tag in re.findall(r'<nmethod\b[^>]*>', text):
            attrs = dict(re.findall(r"([\w_]+)='([^']*)'", tag))
            signature = attrs.get('method', '')
            if attrs.get('compiler') == 'c2' and attrs.get('compile_kind') != 'osr' and signature.startswith(prefixes):
                selected[signature] = dict(compile_id=attrs['compile_id'], nmethod_total_bytes=int(attrs['size']))
        human_log = (output / (stem + '.log')).read_text(errors='replace')
        c2_time = re.findall(r'C2 Compile Time:\s+([0-9.]+) s', human_log)
        if item['case'].endswith('mixHashCode_repeat_c2'):
            if not any(key.startswith(owner + ' mixHashCode ') for key in selected):
                raise ValueError('RepeatCompilation target mixHashCode did not compile with C2')
            accepted = any('CompileCommand:' in line and 'RepeatCompilation' in line and
                           'mixHashCode' in line and re.search(r'\b500\b', line)
                           for line in human_log.splitlines())
            if not accepted:
                raise ValueError('No accepted RepeatCompilation=500 directive in fork output')
        if item['kind'] == 'compiler' and not c2_time:
            raise ValueError('CITime C2 timer missing from compiler control: ' + stem)
        metrics.append(dict(kind=item['kind'], case=item['case'], side=item['side'], pair=item['pair'],
                            c2_seconds=float(c2_time[-1]) if c2_time else None, regular_c2_nmethods=selected))
    comparisons = []
    for item in metrics:
        if item['side'] != 'baseline':
            continue
        other = next(m for m in metrics if (m['case'], m['pair'], m['side']) ==
                     (item['case'], item['pair'], 'candidate'))
        a, b = item['regular_c2_nmethods'], other['regular_c2_nmethods']
        common = sorted(set(a) & set(b))
        ratios = {name: b[name]['nmethod_total_bytes'] / a[name]['nmethod_total_bytes'] for name in common}
        cost = (other['c2_seconds'] / item['c2_seconds']
                if item['c2_seconds'] and other['c2_seconds'] is not None else None)
        comparisons.append(dict(case=item['case'], pair=item['pair'],
                                matching_regular_c2_nmethod_ratios=ratios,
                                c2_time_ratio=cost,
                                compilation_set_changed=set(a) != set(b),
                                incomplete_code_size_control=item['kind'] == 'throughput' and not common,
                                incomplete_compiler_cost=item['kind'] == 'compiler' and cost is None,
                                investigate=(set(a) != set(b) or (item['kind'] == 'throughput' and not common) or
                                             (item['kind'] == 'compiler' and cost is None) or
                                             any(r > 1.03 for r in ratios.values()) or
                                             (cost is not None and cost > 1.05))))
    (output / 'compilation-metrics.json').write_text(json.dumps(dict(runs=metrics, comparisons=comparisons), indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('config', type=Path)
    parser.add_argument('--output', type=Path, default=Path('qualification-private-results'))
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--check', action='store_true', help='Check supplied inputs only; run no Java/benchmarks')
    mode.add_argument('--execute', action='store_true', help='Run the bounded plan only after separate execution authorization')
    args = parser.parse_args()
    config = json.loads(args.config.read_text())
    plan = commands(config, args.output.resolve())
    if not args.check and not args.execute:
        print(json.dumps(dict(executed=False, global_budget_seconds=MAX_SECONDS,
                              max_output_bytes=MAX_OUTPUT_BYTES, commands=plan), indent=2))
        return
    manifests = validate(config)
    if args.check:
        print('Input preflight passed. No qualification command executed.')
        return
    args.output.mkdir(parents=True, exist_ok=False)
    (args.output / 'inputs.json').write_text(json.dumps(dict(config=config, manifests=manifests), indent=2) + '\n')
    deadline = time.monotonic() + MAX_SECONDS
    records = []
    for item in plan:
        record = run_one(item, args.output, deadline)
        records.append(record)
        (args.output / 'runs.json').write_text(json.dumps(records, indent=2) + '\n')
        if item['kind'] == 'guard':
            logs = list(args.output.glob('guard-' + item['side'] + '-*.xml'))
            if len(logs) != 1:
                raise ValueError('Expected one codec guard compilation log')
            tags = [dict(re.findall(r"([\w_]+)='([^']*)'", tag))
                    for tag in re.findall(r'<nmethod\b[^>]*>', logs[0].read_text(errors='replace'))]
            selected = [tag for tag in tags if tag.get('compiler') == 'c2' and tag.get('method') == config['guard_method']]
            if not selected:
                raise ValueError('No C2 compilation of the exact codec method/descriptor; do not infer guard removal')
            (args.output / ('guard-' + item['side'] + '-compilations.json')).write_text(
                json.dumps([dict(compile_id=tag['compile_id'], method=tag['method'],
                                 compile_kind=tag.get('compile_kind', 'regular')) for tag in selected], indent=2) + '\n')
        if item['kind'] == 'correctness':
            label = f"correctness-existing-jzstd-0-{item['side']}.log"
            if not re.search(config['correctness_success_regex'], (args.output / label).read_text(errors='replace')):
                raise ValueError('Existing corpus success marker missing')
    summarize(records, args.output)
    compilation_metrics(records, args.output)
    print('Bounded runs completed. Review targeted guard, matching C2 code sizes and compiler logs before any GO claim.')


if __name__ == '__main__':
    main()
