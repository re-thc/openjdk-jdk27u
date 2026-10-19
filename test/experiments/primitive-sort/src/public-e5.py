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
base=r/'images/base';leaf=r/'images/leaf'
common=['--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2',f'-Dbackend.lib={r}/build/libbackends.so','-cp',f'{r}/build','-Dwidths=4','-DwarmMixed=true','-Dsizes=4095,4096,16384,65536,65537,1048576','-Dpatterns=random,low,sorted,reverse,skew,prefix','-Doffsets=17','-Dwindows=5']
variants={'A':(base,0,False),'H':(base,1,True),'V':(leaf,1,False),'I':(leaf,3,False),'R':(leaf,4,False)}
orders=['AHVIR','RIVHA','ARIVH','HVIRA']
out=r/'evidence/public-e5';out.mkdir(exist_ok=False)
(out/'plan.json').write_text(json.dumps({'orders':orders,'common':common,'variants':{k:(str(v[0]),v[1],v[2])for k,v in variants.items()}},indent=2))
for pair,order in enumerate(orders):
 for variant in order:
  image,backend,copy=variants[variant];env=os.environ.copy()
  opts=[]
  if backend:
   opts=[f'--patch-module=java.base={r}/patch',f'-Djdk.util.Arrays.backend={backend}',f'-Djdk.util.Arrays.backendCopy={str(copy).lower()}']
  if image==leaf:
   env.update(PRIMITIVE_BACKEND=str(backend),BASE_SIMDSORT=str(base/'lib/libsimdsort.so'),PRIMITIVE_COUNT='1')
  cmd=['taskset','-c','0,1,3,4',str(image/'bin/java')]+opts+common+['PublicBench'];stem=out/f'{pair}-{variant}'
  print(time.time(),pair,variant,flush=True)
  with open(str(stem)+'.csv','w') as stdout,open(str(stem)+'.err','w') as stderr:subprocess.run(cmd,stdout=stdout,stderr=stderr,env=env,check=True)
print('COMPLETE',flush=True)
