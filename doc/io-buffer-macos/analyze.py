#!/usr/bin/env python3
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

import collections
import csv
import json
import pathlib
import random
import statistics as s
import sys

root = pathlib.Path(__file__).resolve().parents[2] / "build/io-20261030"
label = sys.argv[1]
rows = [json.loads(l) for l in (root / label / "raw.jsonl").read_text().splitlines()]
groups = collections.defaultdict(lambda: collections.defaultdict(lambda: collections.defaultdict(list)))
for r in rows:
    groups[r['case']][r['pair']][r['variant']].append(r)
metrics = ['ns', 'cpu_ns', 'alloc_B', 'total_alloc_B']
results = []
rng = random.Random(20261030)
for case, pairs in sorted(groups.items()):
    complete = [(p, v) for p, v in sorted(pairs.items()) if set(v) == {'A', 'B'}]
    if not complete: continue
    out = {'case': case, 'pairs': len(complete)}
    for metric in metrics:
        a = [s.median(r[metric] for r in v['A']) for _, v in complete]
        b = [s.median(r[metric] for r in v['B']) for _, v in complete]
        out[metric+'_A'] = s.median(a)
        out[metric+'_B'] = s.median(b)
        out[metric+'_paired_delta'] = s.median(y-x for x,y in zip(a,b))
        if min(a) > 0:
            ratios = [y/x-1 for x,y in zip(a,b)]
            boot = sorted(s.median(rng.choices(ratios, k=len(ratios))) for _ in range(10000))
            out[metric+'_paired_pct'] = 100*s.median(ratios)
            out[metric+'_ci95_pct'] = [100*boot[249], 100*boot[9749]]
            out[metric+'_adverse'] = sum(v > 0 for v in ratios)
            out[metric+'_adverse_3pct'] = sum(v > .03 for v in ratios)
            out[metric+'_worst_pct'] = 100*max(ratios)
            out[metric+'_pair_pcts'] = [100*x for x in ratios]
    results.append(out)
(root / label / 'summary.json').write_text(json.dumps(results, indent=2)+'\n')
fields = [k for k in results[0] if not k.endswith('_pair_pcts')] if results else []
if fields:
    with (root / label / 'summary.csv').open('w') as f:
        w=csv.DictWriter(f, fields, extrasaction='ignore');w.writeheader();w.writerows(results)
for r in results:
    print(f"{r['case']:45s} n={r['pairs']} A={r['ns_A']:.1f} B={r['ns_B']:.1f} ns "
          f"paired={r.get('ns_paired_pct', 0):+.2f}% {r.get('ns_ci95_pct')} "
          f"adverse={r.get('ns_adverse', 0)}/{r['pairs']} >3%={r.get('ns_adverse_3pct', 0)} "
          f"CPU={r.get('cpu_ns_paired_pct', 0):+.2f}% "
          f"B/op={r['alloc_B_A']:.1f}->{r['alloc_B_B']:.1f}")
