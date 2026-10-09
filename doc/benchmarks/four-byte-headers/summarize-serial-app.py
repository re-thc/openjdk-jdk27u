#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
"""Summarize the balanced twelve-fork Serial application confirmation."""
import csv
import json
import math
from pathlib import Path
import statistics as stats
import sys
from scipy.stats import t

def comparison(baseline, candidate):
    a, b = [math.log(x) for x in baseline], [math.log(x) for x in candidate]
    va, vb = stats.variance(a) / len(a), stats.variance(b) / len(b)
    delta = stats.mean(b) - stats.mean(a)
    if va + vb == 0:
        margin = 0
    else:
        df = (va + vb) ** 2 / (va ** 2 / (len(a) - 1) + vb ** 2 / (len(b) - 1))
        margin = t.ppf(0.975, df) * math.sqrt(va + vb)
    return [(math.exp(x) - 1) * 100 for x in (delta, delta - margin, delta + margin)]

root = Path(sys.argv[1])
assert len(list(root.glob('app-*.json'))) == 36
rows=[]
for name in ['scrabble','scala-doku']:
    values={}
    for layout in ['baseline8','default8','four4']:
        values[layout]=[]
        for fork in range(1,13):
            result=json.loads((root/f'app-{layout}-Serial-{fork}.json').read_text())
            assert set(result['data']) == {'scrabble','scala-doku'}
            samples=result['data'][name]['results']
            assert len(samples)==10
            values[layout].append(stats.mean(x['duration_ns'] for x in samples[5:])/1e6)
    for layout in values:
        change=[0,0,0] if layout=='baseline8' else comparison(values['baseline8'],values[layout])
        rows.append(['Serial',name,layout,12,stats.mean(values[layout]),*change])
with (root/'app-summary.csv').open('w',newline='') as stream:
    writer=csv.writer(stream, lineterminator="\n")
    writer.writerow(['gc','workload','layout','forks','mean_ms','change_percent','change_95ci_low','change_95ci_high'])
    writer.writerows(rows)
for row in rows: print(row)
