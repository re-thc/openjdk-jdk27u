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

import os, shlex, subprocess
from pathlib import Path

root = Path('/workspace/openjdk-jdk27u')
base = [str(root/'build/cloud/jdk/bin/java'), '-XX:ActiveProcessorCount=1',
        '-XX:+UseSerialGC', '-XX:-UsePerfData', '-Djmh.blackhole.mode=FULL_DONTINLINE', '-Xshare:off', '-Xrs', '-Xms32m', '-Xmx32m']
tiers = {'interpreter':['-Xint'],
         'C1':['-XX:TieredStopAtLevel=1','-XX:CICompilerCount=1','-Xbatch'],
         'C2':['-XX:-TieredCompilation','-XX:CICompilerCount=1','-Xbatch','-XX:CompileThreshold=1000']}
cases = [(tier,calls,'miss',1,'error') for tier in tiers for calls in [8,9,10,16,32]]
cases += [(tier,9,'lastHit',1,'error') for tier in ['C1','C2']]
cases += [(tier,32,'alternating',1,'error') for tier in ['C1','C2']]
cases += [(tier,32,scenario,4,'error') for tier in ['C1','C2'] for scenario in ['miss','alternating']]
cases += [('C2',calls,'miss',1,'ssn') for calls in [9,32]]
env = dict(os.environ); env.pop('JAVA_TOOL_OPTIONS', None)
commands = []
for tier,calls,scenario,threads,expression in cases:
    for pair in range(3):
        for enabled in ([False,True] if pair % 2 == 0 else [True,False]):
            tag=f'{tier}-{calls}-{scenario}-{threads}-{expression}-{pair}-'+('on' if enabled else 'off')
            result=f'/tmp/regex-followup-stable-confirm-{tag}.json'
            cmd=base+tiers[tier]+([] if enabled else ['-XX:-UseRustRegex'])+[
                '-cp','/tmp/regex-followup-jmh:/workspace/toolchains/jmh/*',
                'org.openjdk.jmh.Main','RustRegexLifetime.lifetime',
                '-wi','2','-w','500ms','-i','5','-r','500ms','-f','0','-t','1','-foe','true',
                '-p','length=4096','-p',f'calls={calls}','-p',f'scenario={scenario}',
                '-p',f'threads={threads}','-p',f'expression={expression}','-rf','json','-rff',result]
            commands.append(shlex.join(cmd))
            Path('/tmp/regex-followup-stable-confirm-commands.txt').write_text('\n'.join(commands)+'\n')

            if Path(result).exists():
                import json
                try:
                    if len(json.loads(Path(result).read_text())) == 1:
                        print('Already completed',tag,flush=True)
                        continue
                except json.JSONDecodeError: pass
            print('Running',tag,flush=True)
            affinity=sorted(os.sched_getaffinity(0))[:threads]
            with open(f'/tmp/regex-followup-stable-confirm-{tag}.log','w') as log:
                subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT,check=True,
                               timeout=120,preexec_fn=lambda:os.sched_setaffinity(0,affinity))
print('All isolated lifetime confirmations completed',flush=True)
