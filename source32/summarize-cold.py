#!/usr/bin/env python3
import json, statistics
from pathlib import Path

root = Path('/workspace/sz-evidence')
data = json.loads((root / 'cold.json').read_text())
operations = ['trim', 'strip', 'stripLeading', 'stripTrailing', 'isBlank',
              'linesCount', 'linesFirst']
labels = ['base', 'candidate', 'off']
expected = {(repeat, operation, case, label) for repeat in range(9)
            for operation in operations for case in ['empty', 'long'] for label in labels}
rows = {}
for item in data:
    key = tuple(item[k] for k in ['repeat', 'operation', 'case', 'label'])
    if key in rows:
        raise ValueError('duplicate cold row: ' + str(key))
    if any(not isinstance(item[k], int) or item[k] <= 0
           for k in ['operation_ns', 'process_ns']):
        raise ValueError('invalid cold timing: ' + str(key))
    if item['process_ns'] < item['operation_ns'] or item['stderr']:
        raise ValueError('unexpected cold process result: ' + str(key))
    rows[key] = item
if set(rows) != expected:
    raise ValueError('missing or unexpected cold rows: ' + str(set(rows) ^ expected))

summary = []
for operation in operations:
    for case in ['empty', 'long']:
        entry = dict(operation=operation, case=case, rounds=9)
        for metric in ['operation_ns', 'process_ns']:
            stats = {}
            for label in labels:
                samples = [rows[(r, operation, case, label)][metric] for r in range(9)]
                stats[label] = dict(median=statistics.median(samples),
                                    minimum=min(samples), maximum=max(samples))
            ratios = [rows[(r, operation, case, 'base')][metric] /
                      rows[(r, operation, case, 'candidate')][metric] for r in range(9)]
            stats['paired_speedup'] = statistics.median(ratios)
            stats['paired_range'] = [min(ratios), max(ratios)]
            entry[metric] = stats
        summary.append(entry)
(root / 'cold-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
lines = ['# Fresh-process first-call measurements', '',
         'Nine alternating baseline/candidate/off repeats. Input creation and operation dispatch precede the timer; result consumption follows it. Operation and full process medians are retained separately. These are first-call measurements with ordinary OS caches, not isolated initialization or cold-disk startup. Ratios are median same-round baseline/candidate ratios; ranges are minima and maxima, not confidence intervals.', '',
         '| Operation | Input | Base call us | Candidate call us | Off call us | Paired speedup | Paired range | Base process ms | Candidate process ms | Off process ms |',
         '|---|---|---:|---:|---:|---:|---:|---:|---:|---:|']
for row in summary:
    op = row['operation_ns']; process = row['process_ns']
    lo, hi = op['paired_range']
    lines.append(f"| {row['operation']} | {row['case']} | " +
                 ' | '.join(f"{op[label]['median']/1000:.2f}" for label in labels) +
                 f" | {op['paired_speedup']:.3f} | {lo:.3f}..{hi:.3f} | " +
                 ' | '.join(f"{process[label]['median']/1e6:.2f}" for label in labels) + ' |')
(root / 'COLD-SUMMARY.md').write_text('\n'.join(lines) + '\n')
print('Validated', len(data), 'cold rows and', len(summary), 'summary rows')
