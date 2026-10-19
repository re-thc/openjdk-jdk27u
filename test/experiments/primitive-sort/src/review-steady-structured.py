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
r=pathlib.Path(__file__).resolve().parent.parent;o=r/'evidence/review-steady-structured';o.mkdir(exist_ok=False)
orders=['ABC','CBA','ACB','BCA'];images={'A':r/'images/base','B':r/'images/release-152455d13df','C':r/'images/release-152455d13df'}
(o/'plan.json').write_text(json.dumps({'orders':orders,'warmup':'10000 calls per pattern at32768, then400 at1Mi; methods/branches match measured Java merge paths. New identified experiment: previous small-call warm still changes large-input C2 profiles during its windows; warm400 same-size calls before measurement. Retain both prior campaigns.','measurement':'5windows10sorts/window','policy':'No product tuning, retain original+34%organ transition result.'},indent=2))
for pair,order in enumerate(orders):
 for v in order:
  print(time.time(),pair,v,flush=True)
  cmd=['taskset','-c','0,1,3,4',str(images[v]/'bin/java'),'--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation',f'-XX:LogFile={o}/{pair}-{v}.xml','-cp',str(r/'build')]+(['-Djdk.util.Arrays.disableNativeSort=true']if v=='C'else[])+['ReviewSteadyStructuredBench']
  with(o/f'{pair}-{v}.csv').open('w')as a,(o/f'{pair}-{v}.err').open('w')as b:subprocess.run(cmd,stdout=a,stderr=b,check=True)
print('COMPLETE')
