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
import json
import os
from pathlib import Path
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java', required=True, type=Path)
    parser.add_argument('--classpath', required=True,
                        help='Compiled JMH benchmarks and JMH dependency jars')
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--resume', action='store_true',
                        help='Resume an interrupted run with identical commands and JDK')
    parser.add_argument('--pairs', type=int, default=3)
    parser.add_argument('--tiers', nargs='+', choices=['interpreter', 'C1', 'C2'],
                        default=['interpreter', 'C1', 'C2'])
    parser.add_argument('--suite', choices=['short', 'tiny', 'plans', 'lifetime', 'all'], default='all')
    args = parser.parse_args()
    if args.pairs < 1:
        parser.error('--pairs must be positive')
    records = args.output / 'results.jsonl'
    if records.exists() and not args.resume:
        parser.error('--output already contains results; choose a new directory')
    args.output.mkdir(parents=True, exist_ok=True)
    java = str(args.java.resolve())
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
                experiments.append(('lifetime-' + expression + '-' + reuse, 'C2',
                                    'RustRegexLifetime.lifetime',
                                    ['length=16,4096', 'expression=' + expression,
                                     'calls=1,8,32', 'scenario=alternating', 'threads=1',
                                     'reuse=' + reuse]))
    cpu = min(os.sched_getaffinity(0)) if hasattr(os, 'sched_getaffinity') else None
    completed = {}
    if records.exists():
        for line in records.read_text().splitlines():
            row = json.loads(line)
            key = (row['suite'], row['tier'], row['pair'], row['enabled'])
            completed[key] = completed.get(key, 0) + 1
    for suite, tier, benchmark, params in experiments:
        family = suite.split('-')[0]
        if args.suite == 'plans':
            if suite not in ['short-prefix', 'short-digits', 'tiny-prefix', 'tiny-digits']:
                continue
        elif args.suite != 'all' and family != args.suite:
            continue
        for pair in range(args.pairs):
            for enabled in ([False, True] if pair % 2 == 0 else [True, False]):
                tag = f'{suite}-{tier}-{pair}-' + ('on' if enabled else 'off')
                result = args.output / (tag + '.json')
                command = [java, '-XX:ActiveProcessorCount=1', '-XX:+UseSerialGC',
                           '-XX:-UsePerfData', '-Xrs', '-Xshare:off', '-Xms32m', '-Xmx128m',
                           '-Djmh.blackhole.mode=FULL_DONTINLINE',
                           '--add-opens=java.base/java.util.regex=ALL-UNNAMED']
                if family == 'lifetime':
                    command += ['-Dbench.rust.regex.checkBackend=true',
                                f'-Dbench.rust.regex.expectedNative={str(enabled).lower()}']
                command += tiers[tier]
                if not enabled:
                    command.append('-XX:-UseRustRegex')
                command += ['-cp', args.classpath, 'org.openjdk.jmh.Main', benchmark,
                            '-wi', '2', '-w', '300ms', '-i', '3', '-r', '300ms',
                            '-f', '0', '-t', '1', '-foe', 'true', '-rf', 'json', '-rff', str(result)]
                for param in params:
                    command += ['-p', param]
                command_file = args.output / (tag + '-command.json')
                if args.resume and command_file.exists() and json.loads(command_file.read_text()) != command:
                    parser.error('resume command differs for ' + tag)
                if (suite, tier, pair, enabled) in completed:
                    if completed[(suite, tier, pair, enabled)] != len(json.loads(result.read_text())):
                        parser.error('incomplete stored records for ' + tag)
                    continue
                command_file.write_text(json.dumps(command, indent=2) + '\n')
                print('Running ' + tag, flush=True)

                def pin_cpu():
                    os.sched_setaffinity(0, {cpu})

                with (args.output / (tag + '.log')).open('w') as log:
                    subprocess.run(command, stdout=log, stderr=subprocess.STDOUT,
                                   check=True, preexec_fn=pin_cpu if cpu is not None else None)
                rows = json.loads(result.read_text())
                with records.open('a') as out:
                    for row in rows:
                        out.write(json.dumps({'suite': suite, 'tier': tier, 'pair': pair,
                                              'enabled': enabled, 'result': row}) + '\n')
                print(f'Finished {tag}: {len(rows)} cases', flush=True)


if __name__ == '__main__':
    main()
