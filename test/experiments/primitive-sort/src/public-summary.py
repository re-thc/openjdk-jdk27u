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

import pathlib,csv,statistics,collections,json,sys
root=pathlib.Path(sys.argv[1]);samples=collections.defaultdict(list)
for f in root.glob('[0-9]*-*.csv'):
 pair,variant=f.stem.split('-')
 for row in csv.DictReader(f.open()):
  key=tuple(row[x] for x in ('width','n','pattern','offset'))
  samples[(pair,variant,key)].append(int(row['nanos']))
meds={k:statistics.median(v) for k,v in samples.items()}
cells=collections.defaultdict(list)
for (pair,variant,key),v in meds.items():
 if variant=='A' or (pair,'A',key) not in meds:continue
 ref=meds[(pair,'A',key)]
 cells[(variant,)+key].append({'pair':int(pair),'reference_ns':ref,'candidate_ns':v,'change_pct':100*(v/ref-1),'speedup':ref/v})
result=[]
for key,values in sorted(cells.items()):
 change=statistics.median(x['change_pct'] for x in values)
 speed=statistics.median(x['speedup'] for x in values)
 result.append(dict(zip(('variant','width','n','pattern','offset'),key))|{'paired_change_pct':change,'paired_speedup':speed,'pairs':values})
(root/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
print('variant,width,n,pattern,offset,median_change_pct,median_speedup,pairs')
for x in result:
 print(x['variant'],x['width'],x['n'],x['pattern'],x['offset'],round(x['paired_change_pct'],2),round(x['paired_speedup'],3),len(x['pairs']),sep=',')
