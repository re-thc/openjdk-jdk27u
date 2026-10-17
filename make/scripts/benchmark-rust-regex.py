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
import collections
import hashlib
import itertools
import json
import math
import os
import platform
from pathlib import Path
import subprocess
import time

SUITES = ('short', 'tiny', 'plans', 'lifetime', 'review', 'all', 'qualification')


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


def digest_file(path):
    digest = hashlib.sha256()
    with path.open('rb') as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def attempt_tag(suite, tier, pair, control):
    label = {'native': 'on', 'disabled': 'off'}.get(control, control)
    return f'{suite}-{tier}-{pair}-{label}'


def benchmark_command(policy, control, tier, benchmark, params, result):
    iterations = ['-wi', '2', '-w', '200ms' if policy['suite'] == 'qualification' else '300ms',
                  '-i', '3', '-r', '200ms' if policy['suite'] == 'qualification' else '300ms']
    if benchmark.startswith('RustRegexLifetime.'):
        iterations = ['-bm', 'ss', '-wi', '10', '-i', '20', '-bs', '1'] if 'reuse=cold' in params \
            else iterations + ['-bm', 'avgt']
    command = [controls_for(policy)[control]] + jvm_arguments(control, tier, params)
    command += ['-cp', policy['classpath'], 'org.openjdk.jmh.Main', benchmark] + iterations
    command += ['-f', '0', '-t', '1', '-foe', 'true', '-rf', 'json', '-rff', str(result)]
    for parameter in params:
        command += ['-p', parameter]
    return command


def strict_json(text):
    def object_fields(items):
        result = {}
        for key, value in items:
            if key in result:
                raise ValueError('duplicate JSON field: ' + key)
            result[key] = value
        return result

    def finite_float(value):
        number = float(value)
        if not math.isfinite(number):
            raise ValueError('nonfinite JSON number')
        return number

    def invalid_constant(value):
        raise ValueError('nonstandard JSON constant: ' + value)

    return json.loads(text, object_pairs_hook=object_fields, parse_float=finite_float,
                      parse_constant=invalid_constant)


def read_records(path):
    return [strict_json(line) for line in path.read_text().splitlines()]


def finite_number(value, *, positive=False):
    if type(value) not in (int, float):
        return False
    try:
        return math.isfinite(value) and (value > 0 if positive else value >= 0)
    except OverflowError:
        return False


def is_sha256(value):
    return isinstance(value, str) and len(value) == 64 and all(ch in '0123456789abcdef' for ch in value)


def result_protocol(benchmark, params, suite):
    name = benchmark.split('.')[-2]
    cold = name == 'RustRegexLifetime' and 'reuse=cold' in params
    window = '200 ms' if suite == 'qualification' else '300 ms'
    return {'jmhVersion': '1.37', 'mode': 'ss' if cold else 'avgt',
            'threads': 1, 'forks': 0,
            'warmupIterations': 10 if cold else 2,
            'warmupTime': 'single-shot' if cold else window, 'warmupBatchSize': 1,
            'measurementIterations': 20 if cold else 3,
            'measurementTime': 'single-shot' if cold else window, 'measurementBatchSize': 1}


def jvm_arguments(control, tier, params):
    arguments = [f'-XX:ActiveProcessorCount={worker_count(params)}', '-XX:+UseSerialGC',
                 '-XX:-UsePerfData', '-Xrs', '-Xshare:off', '-Xms32m', '-Xmx128m',
                 '-Djmh.blackhole.mode=FULL_DONTINLINE',
                 '--add-opens=java.base/java.util.regex=ALL-UNNAMED']
    if any(parameter.startswith('reuse=') for parameter in params):
        arguments += ['-Dbench.rust.regex.checkBackend=true',
                      f'-Dbench.rust.regex.expectedNative={str(control in ("native", "jni")).lower()}']
    arguments += {'interpreter': ['-Xint'],
                  'C1': ['-XX:TieredStopAtLevel=1', '-XX:CICompilerCount=1', '-Xbatch'],
                  'C2': ['-XX:-TieredCompilation', '-XX:CICompilerCount=1', '-Xbatch',
                         '-XX:CompileThreshold=1000']}[tier]
    if control == 'disabled':
        arguments.append('-XX:-UseRustRegex')
    elif control == 'jni':
        arguments.append('-XX:-UseRustRegexIntrinsics')
    return arguments


def validate_rows(benchmark, params, rows, *, suite='qualification', java=None, jvm_args=None):
    if not isinstance(rows, list) or not rows:
        raise ValueError('JMH output must be a nonempty result array')
    axes = dict(parameter.split('=', 1) for parameter in params)
    prefix, method = benchmark.rsplit('.', 1)
    prefix = 'org.openjdk.bench.java.util.regex.' + prefix
    method = method.removesuffix('$')
    methods = method[1:-1].split('|') if method.startswith('(') else [method]
    keys = sorted(axes)
    expected = {(prefix + '.' + name, values) for name in methods
                for values in itertools.product(*(axes[key].split(',') for key in keys))}
    protocol = result_protocol(benchmark, params, suite)
    unit = 'us/op' if prefix.endswith('.RustRegexLifetime') else 'ns/op'
    actual = []
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError('JMH result must be an object')
        for key, value in protocol.items():
            if type(row.get(key)) is not type(value) or row[key] != value:
                raise ValueError('unexpected JMH metadata: ' + key)
        for key in ('jvm', 'jdkVersion', 'vmName', 'vmVersion'):
            if not isinstance(row.get(key), str) or not row[key].strip():
                raise ValueError('missing or invalid JMH metadata: ' + key)
        arguments = row.get('jvmArgs')
        if not isinstance(arguments, list) or any(not isinstance(arg, str) or not arg for arg in arguments):
            raise ValueError('missing or invalid JMH metadata: jvmArgs')
        if java is not None and Path(row['jvm']).resolve() != Path(java).resolve():
            raise ValueError('JMH JVM does not match the selected control')
        if jvm_args is not None:
            # JMH 1.37 includes @Fork jvmArgsAppend in this descriptive field
            # even with -f 0. These benchmarks append only this module opening.
            suffix = arguments[len(jvm_args):]
            if arguments[:len(jvm_args)] != jvm_args or any(
                    arg != '--add-opens=java.base/java.util.regex=ALL-UNNAMED' for arg in suffix):
                raise ValueError('JMH JVM arguments do not match the selected policy')
        if not isinstance(row.get('secondaryMetrics'), dict):
            raise ValueError('missing or invalid JMH secondaryMetrics')
        metric = row.get('primaryMetric')
        if not isinstance(metric, dict):
            raise ValueError('missing or invalid primary metric')
        score = metric.get('score')
        if not finite_number(score, positive=True):
            raise ValueError('invalid primary measurement')
        if metric.get('scoreUnit') != unit:
            raise ValueError('unexpected or missing primary scoreUnit')
        samples = metric.get('rawData')
        # Each invocation is one non-forked JVM, with the exact requested
        # number of measurement iterations. Never count inner samples as JVMs.
        if not isinstance(samples, list) or len(samples) != 1 or not isinstance(samples[0], list) \
                or len(samples[0]) != protocol['measurementIterations']:
            raise ValueError('missing, empty or incomplete primary rawData')
        if any(not finite_number(sample) for sample in samples[0]):
            raise ValueError('nonfinite or invalid primary rawData sample')
        if not isinstance(row.get('params'), dict) or set(row['params']) != set(keys) \
                or any(not isinstance(value, str) for value in row['params'].values()) \
                or not isinstance(row.get('benchmark'), str):
            raise ValueError('unexpected benchmark or parameter axes')
        actual.append((row['benchmark'], tuple(row['params'][key] for key in keys)))
    if len(actual) != len(expected) or set(actual) != expected:
        raise ValueError('missing, duplicate or unexpected benchmark cases')


def controls_for(policy):
    if policy.get('suite') not in SUITES or not isinstance(policy.get('tiers'), list) \
            or not policy['tiers'] or any(tier not in ('interpreter', 'C1', 'C2') for tier in policy['tiers']) \
            or len(set(policy['tiers'])) != len(policy['tiers']):
        raise ValueError('invalid result experiment policy')
    if type(policy.get('pairs')) is not int or policy['pairs'] < 1 or type(policy.get('jni')) is not bool \
            or not isinstance(policy.get('java'), str) or not policy['java'] \
            or policy.get('reference') is not None and (
                not isinstance(policy['reference'], str) or not policy['reference']):
        raise ValueError('invalid result control/pair policy')
    controls = {'disabled': policy['java'], 'native': policy['java']}
    if policy.get('reference'):
        controls = {'original': policy['reference'], **controls}
    if policy.get('jni'):
        controls['jni'] = policy['java']
    return controls


def policy_identity(policy):
    return hashlib.sha256(json.dumps(policy, sort_keys=True, allow_nan=False).encode()).hexdigest()


def validate_records(rows, policy, metadata_sha256):
    """Validate every stored process before any resume or paired summary."""
    if not is_sha256(metadata_sha256):
        raise ValueError('missing verified metadata identity')
    controls = controls_for(policy)
    plan = {(suite, tier): (benchmark, params)
            for suite, tier, benchmark, params in experiments_for(policy['suite'], policy['tiers'])}
    if not plan:
        raise ValueError('no experiments for the selected suite and tiers')
    groups = collections.defaultdict(list)
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError('stored record must be an object')
        if row.get('metadata_sha256') != metadata_sha256:
            raise ValueError('stored record metadata identity differs')
        if not is_sha256(row.get('command_sha256')):
            raise ValueError('stored record has no valid command identity')
        control = row.get('control')
        pair = row.get('pair')
        if control not in controls or type(pair) is not int or not 0 <= pair < policy['pairs']:
            raise ValueError('stored record is outside the control/pair policy')
        enabled = {'native': True, 'disabled': False}.get(control)
        if type(row.get('enabled')) is not type(enabled) or row.get('enabled') != enabled:
            raise ValueError('stored enabled metadata disagrees with control')
        key = (row['suite'], row['tier'])
        if key not in plan:
            raise ValueError('stored record is outside the experiment policy')
        groups[(*key, pair, control)].append(row['result'])
    for (suite, tier, _, control), results in groups.items():
        benchmark, params = plan[(suite, tier)]
        validate_rows(benchmark, params, results, suite=policy['suite'], java=controls[control],
                      jvm_args=jvm_arguments(control, tier, params))
    return dict(groups)


def frozen_metadata(output, clock):
    expected = clock.get('metadata_sha256')
    path = output / 'metadata.json'
    if not is_sha256(expected) or not path.is_file() \
            or digest_file(path) != expected:
        raise ValueError('original verified metadata is missing or changed')
    metadata = strict_json(path.read_text())
    if metadata.get('execution_policy_sha256') != policy_identity(clock['policy']):
        raise ValueError('original execution policy identity differs')
    return metadata


def load_completed(output, policy, metadata_sha256):
    records = output / 'results.jsonl'
    rows = read_records(records) if records.exists() else []
    groups = validate_records(rows, policy, metadata_sha256)
    plan = {(suite, tier): (benchmark, params)
            for suite, tier, benchmark, params in experiments_for(policy['suite'], policy['tiers'])}
    hashes = {}
    for (suite, tier, pair, control), results in groups.items():
        tag = attempt_tag(suite, tier, pair, control)
        result = output / (tag + '.json')
        command_file = output / (tag + '-command.json')
        benchmark, params = plan[(suite, tier)]
        original_result = Path(policy['output']) / (tag + '.json')
        expected = benchmark_command(policy, control, tier, benchmark, params, original_result)
        if not command_file.is_file() or strict_json(command_file.read_text()) != expected:
            raise ValueError('original command receipt is missing or mismatched: ' + tag)
        hashes[(suite, tier, pair, control)] = digest_file(command_file)
        stored = strict_json(result.read_text())
        validate_rows(benchmark, params, stored, suite=policy['suite'], java=controls_for(policy)[control],
                      jvm_args=jvm_arguments(control, tier, params))
        if results != stored:
            raise ValueError('stored records differ from validated result for ' + tag)
    for row in rows:
        key = (row['suite'], row['tier'], row['pair'], row['control'])
        if row['command_sha256'] != hashes[key]:
            raise ValueError('stored record command identity differs')
    completed_tags = {attempt_tag(*key) for key in groups}
    known_files = {tag + suffix for tag in completed_tags for suffix in ('.json', '-command.json', '.log')}
    known_files.update(('metadata.json', 'clock.json', 'failure.json'))
    for path in output.iterdir():
        if path.suffix in ('.json', '.log') and path.name not in known_files:
            raise ValueError('unrecorded prior attempt cannot be rerun: ' + path.name)
    return rows, groups


def session_summaries(output):
    clock = strict_json((output / 'clock.json').read_text())
    metadata = frozen_metadata(output, clock)
    rows, groups = load_completed(output, clock['policy'], clock['metadata_sha256'])
    expected = len(experiments_for(clock['policy']['suite'], clock['policy']['tiers'])) \
        * clock['policy']['pairs'] * len(controls_for(clock['policy']))
    summaries = paired_summaries(rows, clock['policy'], clock['metadata_sha256'])
    return [{'record': 'runtime', 'metadata': metadata, 'suite': clock['policy']['suite'],
             'tiers': clock['policy']['tiers'], 'pairs': clock['policy']['pairs'],
             'controls': list(controls_for(clock['policy'])), 'completedProcesses': len(groups),
             'expectedProcesses': expected, 'completeCampaign': len(groups) == expected}] + summaries


def paired_summaries(rows, policy, metadata_sha256):
    """Require the ingestion contract before reporting complete process groups."""
    groups = validate_records(rows, policy, metadata_sha256)
    cases = collections.defaultdict(lambda: collections.defaultdict(dict))
    for (suite, tier, pair, control), results in groups.items():
        for result in results:
            metric = result['primaryMetric']
            key = (suite, tier, result['benchmark'], metric['scoreUnit'],
                   tuple(sorted(result['params'].items())))
            cases[key][control][pair] = {'pair': pair, 'score': metric['score'],
                                         'samples': metric['rawData']}
    summaries = []
    for (suite, tier, benchmark, unit, params), controls in sorted(cases.items()):
        ratios = {}
        for control in ('original', 'disabled', 'jni'):
            common = controls.get(control, {}).keys() & controls.get('native', {}).keys()
            paired = []
            for pair in sorted(common):
                ratio = controls[control][pair]['score'] / controls['native'][pair]['score']
                if not math.isfinite(ratio) or ratio <= 0:
                    raise ValueError('nonfinite or invalid paired ratio')
                paired.append({'pair': pair, 'ratio': ratio})
            ratios[control + '/native'] = paired
        summaries.append({'record': 'paired-summary', 'suite': suite, 'tier': tier,
                          'benchmark': benchmark, 'unit': unit, 'params': dict(params),
                          'processes': {control: sorted(pairs.values(), key=lambda row: row['pair'])
                                        for control, pairs in controls.items()},
                          'pairedRatios': ratios})
    return summaries


def experiments_for(suite, tiers):
    experiments = []
    for tier in tiers:
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
    if 'C2' in tiers:
        for expression in ['error', 'ssn', 'alternation', 'email']:
            for reuse in ['shared', 'cold']:
                for workers in [1, 4]:
                    suffix = '-contended' if workers == 4 else ''
                    experiments.append(('lifetime-' + expression + '-' + reuse + suffix, 'C2',
                                        'RustRegexLifetime.lifetime',
                                        ['length=16,4096', 'expression=' + expression,
                                         'calls=1,8,9,10,16,32', 'scenario=miss,lastHit,alternating',
                                         'threads=' + str(workers), 'reuse=' + reuse]))
    if suite == 'review':
        experiments = []
        for tier in tiers:
            for shape, lengths, scenarios in [
                    ('prefix', '8,16,64,4096', 'miss,hit'),
                    ('digits', '16,4096', 'miss,hit'),
                    ('email', '16,32,64,4096', 'miss,hit')]:
                experiments.append(('review-' + shape, tier, 'RustRegexNative.match',
                                    ['length=' + lengths, 'regexType=' + shape,
                                     'scenario=' + scenarios, 'operation=find']))
        if 'C2' in tiers:
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
    elif suite == 'qualification':
        experiments += qualification_experiments(tiers)
    if suite == 'plans':
        experiments = [case for case in experiments
                       if case[0] in ['short-prefix', 'short-digits', 'tiny-prefix', 'tiny-digits']]
    elif suite not in ['all', 'review', 'qualification']:
        experiments = [case for case in experiments if case[0].split('-')[0] == suite]
    return experiments


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
    parser.add_argument('--suite', choices=SUITES, default='all')
    args = parser.parse_args()
    args.output = args.output.resolve()
    if len(set(args.tiers)) != len(args.tiers):
        parser.error('--tiers must be distinct')
    if args.pairs < 1:
        parser.error('--pairs must be positive')
    if args.process_timeout < 1 or args.time_budget < 1:
        parser.error('timeouts must be positive')
    experiments = experiments_for(args.suite, args.tiers)
    if not experiments:
        parser.error('no experiments for the selected suite and tiers')
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
    metadata_file = args.output / 'metadata.json'
    if args.resume and not clock_file.is_file():
        failure.write_text(json.dumps({'error': 'original session receipt is missing'}) + '\n')
        raise ValueError('original session receipt is missing')
    boot_file = Path('/proc/sys/kernel/random/boot_id')
    boot = boot_file.read_text().strip() if boot_file.is_file() else None
    policy = {'java': java, 'reference': reference, 'jni': args.include_jni,
              'pairs': args.pairs, 'tiers': args.tiers, 'suite': args.suite,
              'output': str(args.output),
              'classpath': args.classpath, 'process_timeout': args.process_timeout,
              'time_budget': args.time_budget, 'worker_cpus': available_cpus}
    if clock_file.exists():
        if not args.resume:
            parser.error('an attempt already exists; choose a new output directory')
        clock = strict_json(clock_file.read_text())
        if boot is None or clock['boot'] != boot or clock['policy'] != policy:
            parser.error('resume host or execution policy differs')
    else:
        if records.exists() or (args.output / 'metadata.json').exists():
            parser.error('legacy output without a bounded session cannot be resumed')
        clock = {'started': time.monotonic(), 'boot': boot, 'policy': policy}
        with clock_file.open('x') as destination:
            destination.write(json.dumps(clock, indent=2) + '\n')
    completed = {}
    original_metadata = None
    if args.resume:
        try:
            original_metadata = frozen_metadata(args.output, clock)
            _, completed = load_completed(args.output, policy, clock['metadata_sha256'])
        except (KeyError, ValueError, TypeError, OSError) as error:
            failure.write_text(json.dumps({'error': str(error)}) + '\n')
            raise
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

    def runtime_metadata(executable):
        home = Path(executable).parent.parent
        binaries = [Path(executable), home / 'lib/modules']
        for directory in ('bin', 'lib'):
            binaries.extend(p for p in sorted((home / directory).rglob('*'))
                            if p.is_file() and p.suffix.lower() in ('.so', '.dylib', '.dll'))
        configuration = [home / 'release'] + [p for p in sorted((home / 'conf').rglob('*')) if p.is_file()]
        return {'binary_sha256': {str(p): digest_file(p) for p in binaries if p.is_file()},
                'configuration_sha256': {str(p): digest_file(p) for p in configuration if p.is_file()},
                'version': run([executable, '-version'], capture_output=True, text=True).stderr}

    try:
        benchmark_files = classpath_files(args.classpath)
    except ValueError as error:
        parser.error(str(error))
    host = '-'.join((platform.system(), platform.release(), platform.machine()))
    metadata = {'java': java, 'platform': host, 'worker_cpus': available_cpus, **runtime_metadata(java),
                'execution_policy_sha256': policy_identity(policy),
                'runner_sha256': digest_file(Path(__file__)),
                'classpath_sha256': {str(p): digest_file(p) for p in benchmark_files}}
    if reference:
        metadata['reference'] = {'java': reference, **runtime_metadata(reference)}
    if args.resume:
        if original_metadata != metadata:
            failure.write_text(json.dumps({'error': 'resume input contents differ'}) + '\n')
            raise ValueError('resume input contents differ; original metadata retained')
    else:
        with metadata_file.open('x') as destination:
            destination.write(json.dumps(metadata, indent=2) + '\n')
        clock['metadata_sha256'] = digest_file(metadata_file)
        clock_file.write_text(json.dumps(clock, indent=2) + '\n')
    controls = controls_for(policy)
    for suite, tier, benchmark, params in experiments:
        for pair in range(args.pairs):
            for control in control_order(controls, pair):
                enabled = {'native': True, 'disabled': False}.get(control)
                tag = attempt_tag(suite, tier, pair, control)
                result = args.output / (tag + '.json')
                workers = worker_count(params)
                if available_cpus is not None and len(available_cpus) < workers:
                    parser.error('requested worker CPUs are unavailable')
                cpus = available_cpus[:workers] if available_cpus is not None else None
                vm_args = jvm_arguments(control, tier, params)
                command = benchmark_command(policy, control, tier, benchmark, params, result)
                command_file = args.output / (tag + '-command.json')
                if (suite, tier, pair, control) in completed:
                    continue
                if result.exists() or command_file.exists() or (args.output / (tag + '.log')).exists():
                    failure.write_text(json.dumps({'tag': tag, 'error': 'unrecorded prior attempt'}) + '\n')
                    raise ValueError('unrecorded prior attempt cannot be rerun: ' + tag)
                with command_file.open('x') as destination:
                    destination.write(json.dumps(command, indent=2) + '\n')
                command_sha256 = digest_file(command_file)
                print('Running ' + tag, flush=True)

                def pin_cpu():
                    os.sched_setaffinity(0, set(cpus))
                    if set(os.sched_getaffinity(0)) != set(cpus):
                        raise RuntimeError('requested worker CPU affinity is unavailable')

                with (args.output / (tag + '.log')).open('w') as log:
                    run(command, stdout=log, stderr=subprocess.STDOUT,
                        preexec_fn=pin_cpu if cpus is not None else None)
                try:
                    if digest_file(command_file) != command_sha256:
                        raise ValueError('command receipt changed during attempt')
                    frozen_metadata(args.output, clock)
                    rows = strict_json(result.read_text())
                    validate_rows(benchmark, params, rows, suite=args.suite,
                                  java=controls[control], jvm_args=vm_args)
                except (KeyError, ValueError, TypeError, OSError) as error:
                    failure.write_text(json.dumps({'tag': tag, 'error': str(error)}) + '\n')
                    raise
                with records.open('a') as out:
                    for row in rows:
                        out.write(json.dumps({'suite': suite, 'tier': tier, 'pair': pair,
                                              'enabled': enabled, 'control': control,
                                              'metadata_sha256': clock['metadata_sha256'],
                                              'command_sha256': command_sha256, 'result': row}, allow_nan=False) + '\n')
                print(f'Finished {tag}: {len(rows)} cases', flush=True)


if __name__ == '__main__':
    main()
