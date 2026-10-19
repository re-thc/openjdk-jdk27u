#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

import csv, sys, statistics, collections
rows=[]
for f in sys.argv[1:]:
    with open(f) as h:
        for r in csv.DictReader(h):
            if r.get('phase','steady')!='steady':continue
            r['file']=f
            rows.append(r)
groups=collections.defaultdict(lambda:collections.defaultdict(list))
for r in rows:
    key=tuple(r[k] for k in ('width','n','pattern','offset'))
    groups[key][r.get('algo',r['file'])].append(int(r['nanos']))
ratios=collections.defaultdict(list)
for key,algos in sorted(groups.items()):
    ref='jdk' if 'jdk' in algos else sorted(algos)[0]
    for name,vals in algos.items():
        if name==ref:continue
        ratio=statistics.median(algos[ref])/statistics.median(vals)
        ratios[(key[0],key[1],name)].append(ratio)
print('width,n,algo,cells,median_speedup,min,max,winning_cells')
for key,vals in sorted(ratios.items()):
    print(*key,len(vals),round(statistics.median(vals),3),round(min(vals),3),round(max(vals),3),sum(x>1 for x in vals),sep=',')
