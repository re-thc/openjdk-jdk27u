#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Retain both six-round process blocks and every paired ratio."""
import argparse
import json
from pathlib import Path
import statistics as stats

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--output-prefix', type=Path, required=True)
p.add_argument('results', nargs=4, type=Path)
a = p.parse_args()
groups = {}
receipts = []
for path in a.results:
    receipt = json.loads(path.read_text())
    receipts.append(receipt)
    for result in receipt.get('results', [dict(receipt, workload='source-indexing')]):
        assert len(result['rounds']) == 6
        assert all(set(r) == {'original', 'enabled', 'disabled'} for r in result['rounds'])
        for control in ('original', 'disabled'):
            ratios = [r[control]['milliseconds'] / r['enabled']['milliseconds'] for r in result['rounds']]
            assert ratios == result['speedup'][control]
            assert stats.median(ratios) == result['paired_median_speedup'][control]
        groups.setdefault(result['workload'], []).append(result)
assert all(r['sources'] == receipts[0]['sources'] and r['image_hashes'] == receipts[0]['image_hashes'] for r in receipts)
summary = {'sources': receipts[0]['sources'], 'image_hashes': receipts[0]['image_hashes'],
           'inputs': [str(path) for path in a.results], 'workloads': {}}
lines = ['# Ordinary complete-process comparisons', '',
         'Two six-round blocks; all 12 paired ratios are retained. Ratios are control/enabled; above one favors enabled.',
         'Control times are medians across 12 runs in milliseconds. Ranges retain every paired round.', '',
         '| Workload | Original ms | Enabled ms | Disabled ms | O/E block 1; block 2 | O/E pooled [range] | D/E pooled [range] |',
         '|---|---:|---:|---:|---|---|---|']
for name in ('startup', 'javac', 'source-indexing'):
    blocks = groups[name]
    assert len(blocks) == 2
    rounds = [r for block in blocks for r in block['rounds']]
    ratios = {c: [r[c]['milliseconds'] / r['enabled']['milliseconds'] for r in rounds] for c in ('original', 'disabled')}
    medians = {c: stats.median(r[c]['milliseconds'] for r in rounds) for c in ('original', 'enabled', 'disabled')}
    block_medians = {c: [block['paired_median_speedup'][c] for block in blocks] for c in ratios}
    summary['workloads'][name] = {'control_median_ms': medians, 'rounds': rounds, 'speedup': ratios,
        'block_paired_median_speedup': block_medians, 'paired_median_speedup': {c: stats.median(v) for c, v in ratios.items()}}
    row = [name, *[f'{medians[c]:.3f}' for c in ('original', 'enabled', 'disabled')],
           '; '.join(f'{v:.4f}' for v in block_medians['original']),
           *[f'{stats.median(ratios[c]):.4f} [{min(ratios[c]):.4f}, {max(ratios[c]):.4f}]' for c in ('original', 'disabled')]]
    lines.append('| ' + ' | '.join(row) + ' |')
a.output_prefix.with_suffix('.json').write_text(json.dumps(summary, indent=2) + '\n')
a.output_prefix.with_suffix('.md').write_text('\n'.join(lines) + '\n')
print('\n'.join(lines))
