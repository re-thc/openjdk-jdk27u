# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
"""Summarize six-fork confirmations for Serial map lookup and ZGC stored hashes."""
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
assert len(list(root.glob('read-*.json'))) == 36
rows=[]
for gc, benchmark in [('Serial','identityMapLookup'),('Z','storedHash')]:
    values={}
    for layout in ['baseline8','default8','four4']:
        values[layout]=[]
        for fork in range(1,7):
            result=json.loads((root/f'read-{benchmark}-{layout}-{gc}-{fork}.json').read_text())
            assert len(result)==1 and result[0]['benchmark'].endswith('.'+benchmark)
            samples=result[0]['primaryMetric']['rawData']
            assert len(samples)==1 and len(samples[0])==5
            values[layout].append(stats.mean(samples[0]))
    for layout in values:
        change=[0,0,0] if layout=='baseline8' else comparison(values['baseline8'],values[layout])
        rows.append([gc,benchmark,layout,6,stats.mean(values[layout]),*change])
with (root/'read-summary.csv').open('w',newline='') as stream:
    writer=csv.writer(stream)
    writer.writerow(['gc','benchmark','layout','forks','mean_ns','change_percent','change_95ci_low','change_95ci_high'])
    writer.writerows(rows)
for row in rows: print(row)
