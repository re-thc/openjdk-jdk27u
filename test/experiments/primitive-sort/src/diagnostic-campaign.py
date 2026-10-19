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

# Post-holdout diagnostic, policy unchanged: fixed two balanced pairs per mode.
import pathlib,subprocess,json,time
r=pathlib.Path(__file__).resolve().parent.parent
out=r/'evidence/postholdout-diagnostic';out.mkdir(exist_ok=True)
plan={'orders':['AB','BA'],'modes':{'tiered':[],'c2':['-XX:-TieredCompilation','-Xbatch'],'java':['-XX:+UnlockDiagnosticVMOptions','-XX:DisableIntrinsic=_arraySort,_arrayPartition']},'common':['-DwarmMixed=true','-DcaseWarmup=200','-DminWindowMillis=25','-Dwindows=5','-Dsizes=65536,1048573','-Dpatterns=random,sorted,skew','-Doffsets=3']}
(out/'plan.json').write_text(json.dumps(plan,indent=2))
for mode,opts in plan['modes'].items():
 for whole in ['false','true']:
  for pair,order in enumerate(plan['orders']):
   for v in order:
    image=r/('images/base'if v=='A'else'images/release-294bf944a5c')
    stem=out/f'{mode}-{whole}-{pair}-{v}'
    cmd=['taskset','-c','0,1,3,4',str(image/'bin/java'),'--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation',f'-XX:LogFile={stem}.xml','-cp',str(r/'build'),f'-Dwhole={whole}']+opts+plan['common']+['PublicBench']
    print(time.time(),stem.name,flush=True)
    with pathlib.Path(str(stem)+'.csv').open('w')as a,pathlib.Path(str(stem)+'.err').open('w')as b:subprocess.run(cmd,stdout=a,stderr=b,check=True)
