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

import pathlib,subprocess,json,time
r=pathlib.Path(__file__).resolve().parent.parent;o=r/'evidence/review-large';o.mkdir(exist_ok=False)
orders=['ABC','CBA','ACB','BCA'];images={'A':r/'images/base','B':r/'images/release-c32df6ec35b','C':r/'images/release-c32df6ec35b'}
(o/'plan.json').write_text(json.dumps({'orders':orders,'images':{k:str(v)for k,v in images.items()},'warmup_calls':{'1048577':40,'16777216':8},'measurement_windows':5,'calls_per_window':{'1048577':4,'16777216':1},'policy':'Fixed adequately warmed protected-path control, not threshold tuning; both sizes exceed native cap.'},indent=2))
for pair,order in enumerate(orders):
 for v in order:
  print(time.time(),pair,v,flush=True)
  cmd=['taskset','-c','0,1,3,4',str(images[v]/'bin/java'),'--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-cp',str(r/'build')]+(['-Djdk.util.Arrays.disableNativeSort=true']if v=='C'else[])+['ReviewLargeBench']
  with(o/f'{pair}-{v}.csv').open('w')as a,(o/f'{pair}-{v}.err').open('w')as b:subprocess.run(cmd,stdout=a,stderr=b,check=True)
print('COMPLETE')
