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

import pathlib,subprocess,os,json,time
r=pathlib.Path(__file__).resolve().parent.parent
base=pathlib.Path(os.environ.get('JDK_BASE',r/'images/base'))
common=['--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2',f'-Dbackend.lib={r}/build/libbackends.so',f'-cp',f'{r}/build','-Dsizes=4095,4096,4097,16384,65535,65536,65537,1048576','-Dpatterns=random,two,low,equal,sorted,reverse,nearly,runs,organ,saw,skew,extremes,stagger,prefix','-Doffsets=17','-Dwindows=5']
variants={'A':[], 'H':[f'--patch-module=java.base={r}/patch','-Djdk.util.Arrays.backend=1','-Djdk.util.Arrays.backendCopy=true'], 'I':[f'--patch-module=java.base={r}/patch','-Djdk.util.Arrays.backend=3','-Djdk.util.Arrays.backendCopy=true'], 'R':[f'--patch-module=java.base={r}/patch','-Djdk.util.Arrays.backend=4','-Djdk.util.Arrays.backendCopy=true']}
orders=['AHIR','RIHA','ARIH','HIRA']
out=r/'evidence/public-screen';out.mkdir(exist_ok=False)
(out/'plan.json').write_text(json.dumps({'orders':orders,'common':common,'variants':variants},indent=2))
for pair,order in enumerate(orders):
 for variant in order:
  cmd=['taskset','-c','0,1,3,4',str(base/'bin/java')]+variants[variant]+common+['PublicBench']
  stem=out/f'{pair}-{variant}'
  print(time.time(),pair,variant,flush=True)
  with open(str(stem)+'.csv','w') as stdout,open(str(stem)+'.err','w') as stderr:
   subprocess.run(cmd,stdout=stdout,stderr=stderr,check=True)
print('COMPLETE',flush=True)
