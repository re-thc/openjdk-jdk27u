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

"""The fixed 36-process JMH screen and paired result analysis."""
import json
import math
from pathlib import Path
import re
import shlex
import statistics

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


def commands(config, output):
    result = []
    def add(kind, case, side, pair, argv, timeout, score=None):
        result.append(dict(kind=kind, case=case, side=side, pair=pair, argv=argv,
                           timeout_seconds=timeout, result=str(score) if score else None))
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


def compilation_metrics(records, output, logs_output):
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
        human_log = (logs_output / (stem + '.log')).read_text(errors='replace')
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

