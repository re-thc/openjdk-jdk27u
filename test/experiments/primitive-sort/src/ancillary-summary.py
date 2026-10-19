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

import csv,pathlib,statistics,re,json,collections,sys,os
r=pathlib.Path(sys.argv[1])if len(sys.argv)>1 else pathlib.Path(__file__).resolve().parent.parent/'evidence';out={}
for name,pattern in [('tiny','tiny-*-*.csv'),('unaffected','unaffected-*-*.out')]:
 d=collections.defaultdict(list);fields=('width','n','pattern','offset')
 for f in r.glob(pattern):
  _,pair,v=f.stem.split('-')
  for row in csv.DictReader(f.open()):d[(pair,v,tuple(row[x]for x in fields))].append(int(row['nanos']))
 med={k:statistics.median(a)for k,a in d.items()};cells=collections.defaultdict(list)
 for (pair,v,k),val in med.items():
  if v=='B':cells[k].append({'pair':pair,'base_ns':med[(pair,'A',k)],'candidate_ns':val,'change_pct':100*(val/med[(pair,'A',k)]-1)})
 out[name]=[dict(zip(fields,k))|{'change_pct':statistics.median(p['change_pct']for p in v),'pairs':v}for k,v in sorted(cells.items())]
for name in ['cold-'+os.environ.get('SORT_EXPERIMENT','e8'),'startup-'+os.environ.get('SORT_EXPERIMENT','e8')]:
 d={}
 file=r/(name+'.csv')
 if not file.exists():file=r.parent/(name+'.csv')
 if not file.exists():continue
 for row in csv.DictReader(file.open()):
  key=tuple((k,v)for k,v in row.items()if k not in ['pair','variant','first_sort_ns','process_wall_ns_including_oracle','process_wall_ns'])
  d[(row['pair'],row['variant'],key)]=int(row.get('first_sort_ns',row.get('process_wall_ns')))
 cells=collections.defaultdict(list)
 for (pair,v,k),val in d.items():
  if v=='B':cells[k].append((d[(pair,'A',k)],val))
 out[name]=[dict(k)|{'base_ns':statistics.median(p[0]for p in v),'candidate_ns':statistics.median(p[1]for p in v),'paired_change_pct':statistics.median(100*(p[1]/p[0]-1)for p in v),'paired_observations':v}for k,v in cells.items()]
out['safepoints']=[]
for f in sorted(r.glob('safepoint-*.out')):
 gc,v,w=f.stem.split('-')[1:];names={'G1':['G1CollectFull'],'Serial':['SerialGCCollect'],'Z':['ZMarkStart','ZMarkEnd','ZRelocateStart']}[gc]
 vals=[int(m[2])for m in re.finditer(r'Safepoint "([^\"]+)".*?Reaching safepoint: (\d+) ns',f.read_text())if any(m[1].startswith(n)for n in names)]
 out['safepoints'].append({'gc':gc,'variant':v,'width':w,'events':len(vals),'median_us':statistics.median(vals)/1000,'max_us':max(vals)/1000,'observations_ns':vals})
p=collections.defaultdict(list)
for row in csv.DictReader((r/'parallel.out').open()):p[tuple(row[x]for x in ['width','n','pattern','algo'])].append(int(row['nanos']))
out['parallel']=[dict(zip(['width','n','pattern','algo'],k))|{'median_ns':statistics.median(v),'rounds_ns':v}for k,v in p.items()]
(r/'ancillary-summary.json').write_text(json.dumps(out,indent=2)+'\n')
