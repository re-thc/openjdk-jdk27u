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

import json, os, shlex, subprocess
from pathlib import Path

root = Path('/workspace/openjdk-jdk27u')
java = str(root / 'build/cloud/jdk/bin/java')
base = [java, '-XX:ActiveProcessorCount=1', '-XX:+UseSerialGC', '-XX:-UsePerfData',
        '-Xshare:off', '-Xrs', '-Xms64m', '-Xmx128m']
tiers = {'interpreter': ['-Xint'],
         'C1': ['-XX:TieredStopAtLevel=1', '-XX:CICompilerCount=1', '-Xbatch'],
         'C2': ['-XX:-TieredCompilation', '-XX:CICompilerCount=1', '-Xbatch', '-XX:CompileThreshold=1000']}
experiments = [('single-error', 'error', '2048,4096,32768', '1', list(tiers)),
               ('single-ssn', 'ssn', '4096,32768', '1', ['C1','C2']),
               ('shared-error', 'error', '4096,32768', '4', ['C1','C2'])]
env = dict(os.environ)
env.pop('JAVA_TOOL_OPTIONS', None)
commands = []
for label, expression, lengths, threads, modes in experiments:
    for tier in modes:
        for enabled in [False, True]:
            name = f'{label}-{tier}-' + ('on' if enabled else 'off')
            result = f'/tmp/regex-followup-lifetime-{name}.json'
            cmd = base + tiers[tier] + ([] if enabled else ['-XX:-UseRustRegex']) + [
                '-cp', '/tmp/regex-followup-jmh:/workspace/toolchains/jmh/*',
                'org.openjdk.jmh.Main', 'RustRegexLifetime.lifetime',
                '-wi', '2', '-w', '200ms', '-i', '3', '-r', '200ms',
                '-f', '0', '-t', '1', '-foe', 'true', '-p', f'length={lengths}',
                '-p', 'calls=8,9,10,16,32', '-p', 'scenario=miss,lastHit,alternating',
                '-p', f'expression={expression}', '-p', f'threads={threads}',
                '-rf', 'json', '-rff', result]
            commands.append(shlex.join(cmd))
            Path('/tmp/regex-followup-lifetime-commands.txt').write_text('\n'.join(commands)+'\n')
            print('Running', name, flush=True)
            affinity = sorted(os.sched_getaffinity(0))[:int(threads)]
            with open(f'/tmp/regex-followup-lifetime-{name}.log', 'w') as log:
                subprocess.run(cmd, env=env, stdout=log, stderr=subprocess.STDOUT, check=True,
                               timeout=600, preexec_fn=lambda: os.sched_setaffinity(0, affinity))
            records = json.loads(Path(result).read_text())
            print(name, len(records), 'complete Pattern lifetimes measured', flush=True)
