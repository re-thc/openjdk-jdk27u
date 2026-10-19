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

import pathlib,subprocess,time,csv,os
r=pathlib.Path(__file__).resolve().parent.parent
with (r/f'evidence/cold-{os.environ.get("SORT_EXPERIMENT","e8")}.csv').open('w')as h:
 out=csv.writer(h);out.writerow(['pair','variant','width','n','pattern','first_sort_ns','process_wall_ns_including_oracle'])
 for pair,order in enumerate(['AB','BA','AB','BA']):
  for width in [4,8]:
   for n in [4096,1048576]:
    for pattern in ['random','sorted','skew']:
     for v in order:
      image=r/'images/base' if v=='A' else pathlib.Path(os.environ.get('SORT_CANDIDATE_IMAGE',r/'images/candidate-e8'))
      cmd=['taskset','-c','0,1,3,4',str(image/'bin/java'),'--enable-native-access=ALL-UNNAMED','-Xms128m','-Xmx512m','-cp',str(r/'build'),f'-Dwidth={width}',f'-Dn={n}',f'-Dpattern={pattern}','PublicCold']
      start=time.perf_counter_ns();p=subprocess.run(cmd,text=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE,check=True);wall=time.perf_counter_ns()-start
      first=int(p.stdout.strip().split(',')[-1]);out.writerow([pair,v,width,n,pattern,first,wall]);h.flush()
with(r/f'evidence/startup-{os.environ.get("SORT_EXPERIMENT","e8")}.csv').open('w')as h:
 out=csv.writer(h);out.writerow(['pair','variant','process_wall_ns'])
 for pair,order in enumerate(['AB','BA']*4):
  for v in order:
   image=r/'images/base' if v=='A' else pathlib.Path(os.environ.get('SORT_CANDIDATE_IMAGE',r/'images/candidate-e8'));start=time.perf_counter_ns()
   subprocess.run([str(image/'bin/java'),'-version'],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
   out.writerow([pair,v,time.perf_counter_ns()-start]);h.flush()
