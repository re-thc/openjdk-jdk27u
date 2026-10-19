#!/usr/bin/env python3
"""Retain every balanced cost observation and summarize paired medians."""
import json
from pathlib import Path
import random
import re
import statistics
import sys

directory = Path(sys.argv[1])
runs = json.loads((directory/'runs.json').read_text())
rng = random.Random(20261019)
for run in runs:
    assert run['exit_code'] == 0
    stem = f'{run["cell"]}-pair{run["pair"]:02d}-{run["position"]}-{run["arm"]}'
    log = (directory/(stem+'.log')).read_text()
    if run['cell'] == 'compiler':
        match = re.search(r'Total compilation time\s+:\s+([\d.]+) s', log)
        assert match, stem
        run['compiler_seconds'] = float(match[1])
        count = re.search(r'Total compiled methods\s+:\s+(\d+)', log)
        run['compiled_methods'] = int(count[1]) if count else None
    run['cpu_seconds'] = run['resource']['user_s'] + run['resource']['system_s']

summary = []
for cell in ('startup', 'compiler'):
    observations = [run for run in runs if run['cell'] == cell]
    metrics = ['elapsed_s', 'cpu_seconds', 'resource.max_rss_kib']
    if cell == 'compiler': metrics += ['compiler_seconds']
    for metric in metrics:
        def value(run):
            if metric.startswith('resource.'): return run['resource'][metric.split('.')[1]]
            return run[metric]
        pairs = []
        for pair in range(12):
            arms = {run['arm']: run for run in observations if run['pair'] == pair}
            assert set(arms) == {'A', 'B'}
            a, b = value(arms['A']), value(arms['B'])
            assert a > 0 and b > 0
            pairs.append(dict(pair=pair, order=arms['A']['order'], baseline=a, candidate=b, ratio=b/a))
        ratios = [pair['ratio'] for pair in pairs]
        bootstrap = sorted(statistics.median(rng.choices(ratios,k=12)) for _ in range(20000))
        summary.append(dict(cell=cell, metric=metric,
            baseline_median=statistics.median(pair['baseline'] for pair in pairs),
            candidate_median=statistics.median(pair['candidate'] for pair in pairs),
            median_paired_ratio=statistics.median(ratios), bootstrap95=[bootstrap[500],bootstrap[19499]],
            pairs_data=pairs))
(directory/'annotated-runs.json').write_text(json.dumps(runs,indent=2)+'\n')
(directory/'analysis.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps([{k:v for k,v in row.items() if k!='pairs_data'} for row in summary],indent=2))
