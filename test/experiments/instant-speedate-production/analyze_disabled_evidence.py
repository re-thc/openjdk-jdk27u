#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Recompute statistics from retained CSVs only; never launch a workload."""
import csv
import hashlib
import statistics
from pathlib import Path

root=Path(__file__).resolve().parent/'retained-disabled'
rows=list(csv.DictReader((root/'measurements.csv').open()))
for name in ['measurements.csv','summary.csv','first.csv']:
    print('sha256',name,hashlib.sha256((root/name).read_bytes()).hexdigest())
print('retained_rows',len(rows),'fixed_warmup=400000, rounds=5x200000, discarded=round0')
print('compact,corpus,fork,baseline_ns,disabled_ns,loss_pct,baseline_spread,disabled_spread,baseline_tail_head,disabled_tail_head')
for compact in ['True','False']:
    for corpus in ['happy','mixed','invalid']:
        for fork in range(3):
            groups={}
            for route in ['baseline','disabled']:
                selected=[r for r in rows if (r['mode'],r['compact'],r['corpus'],int(r['fork']))==(route,compact,corpus,fork) and int(r['round'])>=1]
                groups[route]=[float(r['ns_per_op']) for r in selected]
            b,d=groups['baseline'],groups['disabled']
            med=lambda values:statistics.median(values)
            trend=lambda values:med(values[2:])/med(values[:2])
            print(f'{compact},{corpus},{fork},{med(b):.4f},{med(d):.4f},{(med(d)/med(b)-1)*100:.3f},'
                  f'{max(b)/min(b):.4f},{max(d)/min(d):.4f},{trend(b):.4f},{trend(d):.4f}')
print('compact,corpus,pooled_loss_pct,baseline_alloc,disabled_alloc')
for compact in ['True','False']:
    for corpus in ['happy','mixed','invalid']:
        groups={route:[r for r in rows if (r['mode'],r['compact'],r['corpus'])==(route,compact,corpus) and int(r['round'])>=1] for route in ['baseline','disabled']}
        median=lambda route,key:statistics.median(float(r[key]) for r in groups[route])
        print(f'{compact},{corpus},{(median("disabled","ns_per_op")/median("baseline","ns_per_op")-1)*100:.3f},'
              f'{median("baseline","bytes_per_op"):.4f},{median("disabled","bytes_per_op"):.4f}')
