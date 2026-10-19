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

import pathlib,subprocess,os,json,time,sys
r=pathlib.Path(__file__).resolve().parent.parent
stage=sys.argv[1] if len(sys.argv)>1 else 'core'
experiment=os.environ.get('SORT_EXPERIMENT','e6')
if stage=='holdout' and (r/'pause-holdout').exists() and os.environ.get('ALLOW_HOLDOUT')!='1':
 print('Holdout not run: candidate dispatch revision pending.',flush=True)
 sys.exit(2)
candidate=pathlib.Path(os.environ.get('SORT_CANDIDATE_IMAGE',str(r/f'images/candidate-{experiment}')))
images={'A':r/'images/base','B':candidate,'C':candidate}
common=['--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-cp',str(r/'build'),'-DwarmMixed=true','-Dwindows=5']
if stage=='scope':
 common+=['-Dsizes=4095,4096,65536,65537,1048576,1048577','-Dpatterns=random,low,reverse,skew,prefix','-Doffsets=17','-DminWindowMillis=10']
 orders=['ABC','CBA','ACB','BCA']
elif stage=='core':
 common+=['-Dsizes=64,257,4095,4096,4097,16384,65536,65537,1048576,1048577','-Doffsets=0,17']
 orders=['ABC','CBA','ACB','BCA']
elif stage=='holdout':
 common+=['-Dsizes=4093,8191,32769,65521,131071,262147,1048573','-Doffsets=3,33']
 orders=['AB','BA','AB','BA']
elif stage=='verification':
 common+=['-Dsizes=5101,16381,49157,98299,524287,1048549','-Doffsets=5,29','-DinputSeed=2026101909']
 orders=['AB','BA','AB','BA']
elif stage=='protected':
 common+=['-Dsizes=4095,65536,1048576,1048577','-Dpatterns=random,sorted,reverse,skew','-Doffsets=17','-DminWindowMillis=25']
 orders=['ABC','CBA','ACB','BCA']
elif stage=='memory':
 common+=['-Dsizes=16777216','-Dpatterns=random,reverse,skew','-Doffsets=0','-Dwindows=3','-DcaseWarmup=1']
 orders=['AB','BA','AB','BA']
elif stage=='whole':
 common+=['-Dsizes=4096,65536,1048576','-Dpatterns=random,sorted,reverse,skew,prefix','-Doffsets=0','-Dwhole=true']
 orders=['AB','BA','AB','BA']
else:raise ValueError(stage)
out=r/f'evidence/{"final" if experiment=="e6" else experiment}-{stage}';out.mkdir(exist_ok=False)
(out/'plan.json').write_text(json.dumps({'orders':orders,'common':common,'images':{k:str(v)for k,v in images.items()}},indent=2))
for pair,order in enumerate(orders):
 for variant in order:
  opts=['-Djdk.util.Arrays.disableNativeSort=true'] if variant=='C' else []
  cmd=['taskset','-c','0,1,3,4',str(images[variant]/'bin/java')]+common+opts+['PublicBench'];stem=out/f'{pair}-{variant}'
  print(time.time(),pair,variant,flush=True)
  with open(str(stem)+'.csv','w')as stdout,open(str(stem)+'.err','w')as stderr:subprocess.run(cmd,stdout=stdout,stderr=stderr,check=True)
print('COMPLETE',flush=True)
