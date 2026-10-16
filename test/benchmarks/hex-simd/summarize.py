#!/usr/bin/env python3
"""Print paired medians, ranges and Java allocation from the complete-call CSV."""
import csv
from pathlib import Path
import statistics
import sys

for name in sys.argv[1:]:
    rows = {}
    with Path(name).open() as source:
        for row in csv.DictReader(line for line in source if not line.startswith('#')):
            rows.setdefault((int(row['bytes']), row['operation']), []).append(row)
    print(name)
    print('| decoded bytes | operation | JDK ns (range) | selected ns (range) | ratio | Java B/call JDK / selected |')
    print('|---:|:---|---:|---:|---:|---:|')
    def values(group, key):
        return [float(r[key]) for r in group]
    def timing(group):
        v = values(group, 'ns_per_call')
        return f'{statistics.median(v):.2f} ({min(v):.2f}–{max(v):.2f})'
    for (n, op), ref in sorted(rows.items()):
        if not op.endswith('-jdk'):
            continue
        candidate = rows.get((n, op[:-4] + '-native'))
        if not candidate:
            continue
        ratio = statistics.median(values(ref, 'ns_per_call')) / statistics.median(values(candidate, 'ns_per_call'))
        a = statistics.median(values(ref, 'java_bytes_per_call'))
        b = statistics.median(values(candidate, 'java_bytes_per_call'))
        print(f'| {n} | {op[:-4]} | {timing(ref)} | {timing(candidate)} | {ratio:.2f}× | {a:g} / {b:g} |')
