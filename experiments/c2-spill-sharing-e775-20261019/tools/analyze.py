#!/usr/bin/env python3
"""Summarize all paired independent forks; retain order and uncertainty."""
import collections
import json
from pathlib import Path
import random
import statistics
import sys

directory = Path(sys.argv[1])
runs = json.loads((directory / 'runs.json').read_text())
cells = collections.defaultdict(lambda: collections.defaultdict(dict))
for run in runs:
    if run['exit_code'] != 0:
        raise RuntimeError('Failed run in experiment')
    data = json.loads((directory / Path(run['result']).name).read_text())
    assert len(data) == 1
    metric = data[0]['primaryMetric']
    values = metric['rawData'][0]
    assert len(values) == 5 and metric['scoreUnit'] == 'ops/s'
    run['samples'] = values
    run['median_ops_s'] = statistics.median(values)
    run['jmh_mean_ops_s'] = metric['score']
    cells[run['cell']][run['pair']][run['arm']] = run

summary = []
rng = random.Random(20261019)
for cell, pairs in cells.items():
    assert len(pairs) == 12, (cell, len(pairs))
    records = []
    for number, arms in sorted(pairs.items()):
        assert set(arms) == {'A', 'B'}
        a, b = arms['A'], arms['B']
        records.append(dict(pair=number, order=a['order'], baseline=a['median_ops_s'],
                            candidate=b['median_ops_s'], ratio=b['median_ops_s']/a['median_ops_s']))
    ratios = [x['ratio'] for x in records]
    bootstrap = sorted(statistics.median(rng.choices(ratios, k=len(ratios)))
                       for _ in range(20000))
    result = dict(cell=cell, pairs=len(records),
                  baseline_median=statistics.median(x['baseline'] for x in records),
                  candidate_median=statistics.median(x['candidate'] for x in records),
                  median_paired_ratio=statistics.median(x['ratio'] for x in records),
                  bootstrap95=[bootstrap[500], bootstrap[19499]],
                  order_medians={order: statistics.median(x['ratio'] for x in records if x['order']==order)
                                 for order in ('AB', 'BA')},
                  pairs_data=records)
    summary.append(result)
(directory / 'analysis.json').write_text(json.dumps(summary, indent=2)+'\n')
print(json.dumps(summary, indent=2))
