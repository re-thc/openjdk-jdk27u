#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
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

"""Paired, serial JMH comparisons against the same JDK's Java-only backend."""

import argparse
import hashlib
import itertools
import json
import math
import os
import platform
from pathlib import Path
import subprocess
import time


def classpath_files(classpath):
    files = set()
    for entry in classpath.split(os.pathsep):
        if not entry:
            raise ValueError('classpath entries must be explicit')
        path = Path(entry)
        if path.name == '*':
            selected = [p for p in sorted(path.parent.glob('*'))
                        if p.is_file() and p.suffix.lower() == '.jar']
            if not selected:
                raise ValueError('classpath wildcard contains no jars: ' + entry)
        elif path.is_dir():
            selected = [p for p in sorted(path.rglob('*')) if p.is_file()]
        elif path.is_file():
            selected = [path]
        else:
            raise ValueError('classpath entry is missing: ' + entry)
        files.update(p.resolve() for p in selected)
    return sorted(files)


def control_order(controls, pair):
    return list(controls) if pair % 2 == 0 else list(reversed(controls))


def worker_count(params):
    for parameter in params:
        if parameter.startswith('threads='):
            value = parameter.split('=', 1)[1]
            if ',' in value or int(value) < 1:
                raise ValueError('worker counts require separate positive cohorts')
            return int(value)
    return 1


def qualification_experiments(tiers):
    experiments = []
    for tier in tiers:
        for shape in ['prefix', 'digits', 'email', 'alternation', 'unsupported', 'unicode']:
            experiments.append(('state-' + shape, tier, 'RustRegexState.match$',
                                ['shape=' + shape, 'length=16,32,64,256,257,4096',
                                 'position=miss,early,late,full', 'endFlags=false,true']))
        fixed = [('tiny', '4,8', 'miss,partial'), ('width', '11', 'miss,full,partial'),
                 ('sizes', '16,32,64,256,4096', 'miss,early,late,partial')]
        for label, lengths, positions in fixed:
            params = ['shape=ssn', 'length=' + lengths, 'position=' + positions, 'endFlags=false,true']
            experiments.append(('state-ssn-' + label, tier, 'RustRegexState.match$', params))
            experiments.append(('anchored-ssn-' + label, tier,
                                'RustRegexState.(matches|lookingAt)$', params))
        for shape in ['prefix', 'email', 'alternation']:
            experiments.append(('anchored-' + shape, tier, 'RustRegexState.(matches|lookingAt)$',
                                ['shape=' + shape, 'length=16,4096',
                                 'position=miss,early,late,full', 'endFlags=false,true']))
        for shape in ['uncaptured', 'prefix', 'alternation']:
            experiments.append(('candidates-' + shape, tier, 'RustRegexCandidates.match',
                                ['shape=' + shape, 'length=16,32,64,256,257,4096',
                                 'position=firstChars,literalMiss,late', 'endFlags=false,true']))
        experiments.append(('routing-boundaries', tier, 'RustRegexNative.match',
                            ['regexType=prefix', 'length=9,15,17,31,32,33,255,256,257',
                             'scenario=miss,hit,lateHit,fullHit', 'operation=find']))
        experiments.append(('state-email-boundaries', tier, 'RustRegexState.match$',
                            ['shape=email', 'length=31,32,33',
                             'position=miss,early,late,full', 'endFlags=false,true']))
        experiments.append(('continuation-ssn', tier, 'RustRegexState.continueAfterFind$',
                            ['shape=ssn', 'length=11,16,256,4096',
                             'position=miss,partialEarly,partialLate,overlap', 'endFlags=false,true']))
        experiments.append(('fallback-all', tier, 'JavaFallbackCosts.match$',
                            ['shape=digits,word,space,dot,backref', 'length=16,4096',
                             'position=miss,early,late,full', 'endFlags=false,true']))
        experiments.append(('digitForms-all', tier, 'JavaDigitFallbackCosts.match$',
                            ['shape=range,digit,unicodeDigit,bitClass,bounded,reluctant,possessive,suffix,backtrack,named',
                             'length=4096', 'position=late,full', 'endFlags=false,true']))
        experiments.append(('fallbackCandidates-all', tier, 'JavaFallbackCandidates.match$',
                            ['shape=digits,word,space,dot,backref', 'length=16,4096',
                             'position=firstChars,literalMiss,denseLate', 'endFlags=false,true']))
    return experiments


def expected_rows(benchmark, params):
    count = 2 if '(matches|lookingAt)' in benchmark else 1
    for parameter in params:
        count *= len(parameter.split('=', 1)[1].split(','))
    return count


def validate_rows(benchmark, params, rows):
    axes = dict(parameter.split('=', 1) for parameter in params)
    prefix, method = benchmark.rsplit('.', 1)
    method = method.removesuffix('$')
    methods = method[1:-1].split('|') if method.startswith('(') else [method]
    keys = sorted(axes)
    expected = {(name, values) for name in methods
                for values in itertools.product(*(axes[key].split(',') for key in keys))}
    actual = []
    for row in rows:
        score = row['primaryMetric']['score']
        if type(score) not in (int, float) or not math.isfinite(score) or score <= 0:
            raise ValueError('invalid primary measurement')
        name = row['benchmark'].rsplit('.', 1)[-1]
        full_name = row['benchmark']
        if (full_name != prefix + '.' + name and not full_name.endswith('.' + prefix + '.' + name)) \
                or set(row['params']) != set(keys):
            raise ValueError('unexpected benchmark or parameter axes')
        actual.append((name, tuple(row['params'][key] for key in keys)))
    if len(actual) != len(expected) or set(actual) != expected:
        raise ValueError('missing, duplicate or unexpected benchmark cases')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java', required=True, type=Path)
    parser.add_argument('--reference-java', type=Path,
                        help='Separate upstream Java image; never receives Rust VM flags')
    parser.add_argument('--include-jni', action='store_true',
                        help='Also measure the native backend with intrinsics disabled')
    parser.add_argument('--cpus', nargs='+', type=int,
                        help='Fixed worker CPU set, checked in each child before execution')
    parser.add_argument('--classpath', required=True,
                        help='Compiled JMH benchmarks and JMH dependency jars')
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--resume', action='store_true',
                        help='Resume an interrupted run with identical commands and JDK')
    parser.add_argument('--pairs', type=int, default=3)
    parser.add_argument('--process-timeout', type=int, default=900,
                        help='Maximum seconds per child JVM, including version probes')
    parser.add_argument('--time-budget', type=int, default=7200,
                        help='Total seconds, including hashing and gaps across resume')
    parser.add_argument('--tiers', nargs='+', choices=['interpreter', 'C1', 'C2'],
                        default=['interpreter', 'C1', 'C2'])
    parser.add_argument('--suite', choices=['short', 'tiny', 'plans', 'lifetime', 'review', 'all',
                                           'qualification'], default='all')
    args = parser.parse_args()
    if args.pairs < 1:
        parser.error('--pairs must be positive')
    if args.process_timeout < 1 or args.time_budget < 1:
        parser.error('timeouts must be positive')
    if args.cpus and (min(args.cpus) < 0 or len(set(args.cpus)) != len(args.cpus)):
        parser.error('--cpus must contain distinct nonnegative CPU indices')
    records = args.output / 'results.jsonl'
    if records.exists() and not args.resume:
        parser.error('--output already contains results; choose a new directory')
    args.output.mkdir(parents=True, exist_ok=True)
    java = str(args.java.resolve())
    reference = str(args.reference_java.resolve()) if args.reference_java else None
    if reference == java:
        parser.error('--reference-java must identify a separate upstream image')
    available_cpus = sorted(args.cpus) if args.cpus else (
        sorted(os.sched_getaffinity(0)) if hasattr(os, 'sched_getaffinity') else None)
    if args.cpus and not hasattr(os, 'sched_setaffinity'):
        parser.error('--cpus requires CPU affinity support')
    failure = args.output / 'failure.json'
    if failure.exists():
        parser.error('a failed attempt cannot be resumed or replaced in this output directory')
    clock_file = args.output / 'clock.json'
    boot_file = Path('/proc/sys/kernel/random/boot_id')
    boot = boot_file.read_text().strip() if boot_file.is_file() else None
    policy = {'java': java, 'reference': reference, 'jni': args.include_jni,
              'pairs': args.pairs, 'tiers': args.tiers, 'suite': args.suite,
              'classpath': args.classpath, 'process_timeout': args.process_timeout,
              'time_budget': args.time_budget, 'worker_cpus': available_cpus}
    if clock_file.exists():
        if not args.resume:
            parser.error('an attempt already exists; choose a new output directory')
        clock = json.loads(clock_file.read_text())
        if boot is None or clock['boot'] != boot or clock['policy'] != policy:
            parser.error('resume host or execution policy differs')
    else:
        if records.exists() or (args.output / 'metadata.json').exists():
            parser.error('legacy output without a bounded session cannot be resumed')
        clock = {'started': time.monotonic(), 'boot': boot, 'policy': policy}
        with clock_file.open('x') as destination:
            destination.write(json.dumps(clock, indent=2) + '\n')
    if time.monotonic() < clock['started']:
        parser.error('monotonic clock changed')
    deadline = clock['started'] + args.time_budget

    def run(command, **kwargs):
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            failure.write_text(json.dumps({'reason': 'total time budget exhausted'}) + '\n')
            raise TimeoutError('total benchmark time budget exhausted')
        try:
            return subprocess.run(command, check=True,
                                  timeout=min(args.process_timeout, remaining), **kwargs)
        except (subprocess.SubprocessError, OSError) as error:
            failure.write_text(json.dumps({'command': command, 'error': str(error)}) + '\n')
            raise

    def digest(path):
        sha = hashlib.sha256()
        with path.open('rb') as source:
            for chunk in iter(lambda: source.read(1024 * 1024), b''):
                sha.update(chunk)
        return sha.hexdigest()

    def runtime_metadata(executable):
        home = Path(executable).parent.parent
        binaries = [Path(executable), home / 'lib/modules']
        for directory in ('bin', 'lib'):
            binaries.extend(p for p in sorted((home / directory).rglob('*'))
                            if p.is_file() and p.suffix.lower() in ('.so', '.dylib', '.dll'))
        configuration = [home / 'release'] + [p for p in sorted((home / 'conf').rglob('*')) if p.is_file()]
        return {'binary_sha256': {str(p): digest(p) for p in binaries if p.is_file()},
                'configuration_sha256': {str(p): digest(p) for p in configuration if p.is_file()},
                'version': run([executable, '-version'], capture_output=True, text=True).stderr}

    try:
        benchmark_files = classpath_files(args.classpath)
    except ValueError as error:
        parser.error(str(error))
    host = '-'.join((platform.system(), platform.release(), platform.machine()))
    metadata = {'java': java, 'platform': host, 'worker_cpus': available_cpus, **runtime_metadata(java),
                'classpath_sha256': {str(p): digest(p) for p in benchmark_files}}
    if reference:
        metadata['reference'] = {'java': reference, **runtime_metadata(reference)}
    metadata_file = args.output / 'metadata.json'
    if args.resume and metadata_file.exists() and json.loads(metadata_file.read_text()) != metadata:
        parser.error('resume runtime differs')
    metadata_file.write_text(json.dumps(metadata, indent=2) + '\n')
    controls = {'disabled': java, 'native': java}
    if reference:
        controls = {'original': reference, **controls}
    if args.include_jni:
        controls['jni'] = java
    tiers = {'interpreter': ['-Xint'],
             'C1': ['-XX:TieredStopAtLevel=1', '-XX:CICompilerCount=1', '-Xbatch'],
             'C2': ['-XX:-TieredCompilation', '-XX:CICompilerCount=1', '-Xbatch',
                    '-XX:CompileThreshold=1000']}
    experiments = []
    for tier in args.tiers:
        # Keep different regex shapes in separate JVMs, so one shape cannot
        # make another shape's Java matcher type profiles megamorphic.
        for shape in ['prefix', 'digits', 'ssn', 'alternation', 'email']:
            experiments.append(('short-' + shape, tier, 'RustRegexNative.match',
                                ['length=16,64,256,4096', 'regexType=' + shape,
                                 'scenario=miss,hit', 'operation=find']))
        for shape in ['prefix', 'digits']:
            experiments.append(('tiny-' + shape, tier, 'RustRegexNative.match',
                                ['length=4,8', 'regexType=' + shape,
                                 'scenario=miss', 'operation=find']))
    if 'C2' in args.tiers:
        for expression in ['error', 'ssn', 'alternation', 'email']:
            for reuse in ['shared', 'cold']:
                for workers in [1, 4]:
                    suffix = '-contended' if workers == 4 else ''
                    experiments.append(('lifetime-' + expression + '-' + reuse + suffix, 'C2',
                                        'RustRegexLifetime.lifetime',
                                        ['length=16,4096', 'expression=' + expression,
                                         'calls=1,8,9,10,16,32', 'scenario=miss,lastHit,alternating',
                                         'threads=' + str(workers), 'reuse=' + reuse]))
    if args.suite == 'review':
        experiments = []
        for tier in args.tiers:
            for shape, lengths, scenarios in [
                    ('prefix', '8,16,64,4096', 'miss,hit'),
                    ('digits', '16,4096', 'miss,hit'),
                    ('email', '16,32,64,4096', 'miss,hit')]:
                experiments.append(('review-' + shape, tier, 'RustRegexNative.match',
                                    ['length=' + lengths, 'regexType=' + shape,
                                     'scenario=' + scenarios, 'operation=find']))
        if 'C2' in args.tiers:
            for expression in ['error', 'email']:
                for reuse in ['shared', 'cold']:
                    experiments.append(('lifetime-' + expression + '-' + reuse, 'C2',
                                        'RustRegexLifetime.lifetime',
                                        ['length=16,4096', 'expression=' + expression,
                                         'calls=1,8,9,10,16,32',
                                         'scenario=miss,lastHit,alternating', 'threads=1',
                                         'reuse=' + reuse]))
                    experiments.append(('lifetime-' + expression + '-' + reuse + '-contended', 'C2',
                                        'RustRegexLifetime.lifetime',
                                        ['length=16,4096', 'expression=' + expression,
                                         'calls=1,8,9,10,16,32',
                                         'scenario=miss,lastHit,alternating', 'threads=4',
                                         'reuse=' + reuse]))
    elif args.suite == 'qualification':
        experiments += qualification_experiments(args.tiers)
    completed = {}
    if records.exists():
        for line in records.read_text().splitlines():
            row = json.loads(line)
            control = row.get('control', 'native' if row['enabled'] else 'disabled')
            key = (row['suite'], row['tier'], row['pair'], control)
            completed[key] = completed.get(key, 0) + 1
    for suite, tier, benchmark, params in experiments:
        family = suite.split('-')[0]
        if args.suite == 'plans':
            if suite not in ['short-prefix', 'short-digits', 'tiny-prefix', 'tiny-digits']:
                continue
        elif args.suite not in ['all', 'review', 'qualification'] and family != args.suite:
            continue
        for pair in range(args.pairs):
            for control in control_order(controls, pair):
                enabled = {'native': True, 'disabled': False}.get(control)
                label = {'native': 'on', 'disabled': 'off'}.get(control, control)
                tag = f'{suite}-{tier}-{pair}-' + label
                result = args.output / (tag + '.json')
                workers = worker_count(params)
                if available_cpus is not None and len(available_cpus) < workers:
                    parser.error('requested worker CPUs are unavailable')
                cpus = available_cpus[:workers] if available_cpus is not None else None
                active = len(cpus) if cpus is not None else workers
                command = [controls[control], f'-XX:ActiveProcessorCount={active}', '-XX:+UseSerialGC',
                           '-XX:-UsePerfData', '-Xrs', '-Xshare:off', '-Xms32m', '-Xmx128m',
                           '-Djmh.blackhole.mode=FULL_DONTINLINE',
                           '--add-opens=java.base/java.util.regex=ALL-UNNAMED']
                if family == 'lifetime':
                    command += ['-Dbench.rust.regex.checkBackend=true',
                                f'-Dbench.rust.regex.expectedNative={str(control in ("native", "jni")).lower()}']
                command += tiers[tier]
                if control == 'disabled':
                    command.append('-XX:-UseRustRegex')
                elif control == 'jni':
                    command.append('-XX:-UseRustRegexIntrinsics')
                window = '200ms' if args.suite == 'qualification' else '300ms'
                iterations = ['-wi', '2', '-w', window, '-i', '3', '-r', window]
                if family == 'lifetime':
                    if 'reuse=cold' in params:
                        iterations = ['-bm', 'ss', '-wi', '10', '-i', '20', '-bs', '1']
                    else:
                        iterations += ['-bm', 'avgt']
                command += ['-cp', args.classpath, 'org.openjdk.jmh.Main', benchmark] + iterations
                command += ['-f', '0', '-t', '1', '-foe', 'true', '-rf', 'json', '-rff', str(result)]
                for param in params:
                    command += ['-p', param]
                command_file = args.output / (tag + '-command.json')
                if args.resume and command_file.exists() and json.loads(command_file.read_text()) != command:
                    parser.error('resume command differs for ' + tag)
                if (suite, tier, pair, control) in completed:
                    stored = json.loads(result.read_text())
                    validate_rows(benchmark, params, stored)
                    if completed[(suite, tier, pair, control)] != len(stored):
                        parser.error('incomplete stored records for ' + tag)
                    continue
                command_file.write_text(json.dumps(command, indent=2) + '\n')
                print('Running ' + tag, flush=True)

                def pin_cpu():
                    os.sched_setaffinity(0, set(cpus))
                    if set(os.sched_getaffinity(0)) != set(cpus):
                        raise RuntimeError('requested worker CPU affinity is unavailable')

                with (args.output / (tag + '.log')).open('w') as log:
                    run(command, stdout=log, stderr=subprocess.STDOUT,
                        preexec_fn=pin_cpu if cpus is not None else None)
                rows = json.loads(result.read_text())
                try:
                    validate_rows(benchmark, params, rows)
                except (KeyError, ValueError) as error:
                    failure.write_text(json.dumps({'tag': tag, 'error': str(error)}) + '\n')
                    raise
                with records.open('a') as out:
                    for row in rows:
                        out.write(json.dumps({'suite': suite, 'tier': tier, 'pair': pair,
                                              'enabled': enabled, 'control': control, 'result': row}) + '\n')
                print(f'Finished {tag}: {len(rows)} cases', flush=True)


if __name__ == '__main__':
    main()
