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

import pathlib,subprocess,os,re,json,time,csv
r=pathlib.Path(__file__).resolve().parent.parent;o=r/'evidence/review-final-metrics';o.mkdir(exist_ok=False)
image=r/'images/release-152455d13df';base=r/'images/base';lib=image/'lib/libprimitivesort.so'
def run(cmd,stem,env=None):
 print(time.time(),stem,flush=True)
 with(o/f'{stem}.out').open('w')as a,(o/f'{stem}.err').open('w')as b:subprocess.run([str(x)for x in cmd],stdout=a,stderr=b,env=env,check=True)
subprocess.run(['g++','-O3','-std=c++17','-fPIC','-shared','-march=x86-64-v3','-DHWY_WANT_AVX3_ZEN4',f'-I{r}/deps/highway',f'-I{image}/include',f'-I{image}/include/linux',str(r/'src/isa-probe.cpp'),'-ldl','-o',str(r/'build/libisaprobe.so')],check=True)
symbols=subprocess.check_output(['nm','-C',str(lib)],text=True).splitlines()
def off(name):return int(next(x.split()[0]for x in symbols if x.endswith(name)),16)
get=off('hwy::GetChosenTarget()');set_=off('hwy::SetSupportedTargetsForTest(long)');table=off('hwy::(anonymous namespace)::SortI64AscHighwayDispatchTable')
expected={x:off(f'hwy::{x}::(anonymous namespace)::SortI64Asc(long*, unsigned long)')for x in ['N_AVX3_ZEN4','N_AVX2']}
(o/'isa-offsets.json').write_text(json.dumps(dict(getter=get,setter=set_,table=table,expected=expected),indent=2))
common=['--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-cp',r/'build']
for pair,order in enumerate(['ZA','AZ']):
 for v in order:
  run(['taskset','-c','0,1,3,4',image/'bin/java']+common+[f'-Dprobe.lib={r}/build/libisaprobe.so']+(['-DforceAVX2=true']if v=='A'else[])+['NativeISA',hex(get),'0',hex(table),hex(set_)],f'isa-{pair}-{v}')
  s=(o/f'isa-{pair}-{v}.err').read_text();m=re.search('int64_entry_offset=0x([0-9a-f]+)',s)
  assert m and int(m[1],16)==expected['N_AVX2'if v=='A'else'N_AVX3_ZEN4'],s
for pair,order in enumerate(['AB','BA','AB','BA']):
 for v in order:
  run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+['-DwarmMixed=true','-Dwidths=8','-Dsizes=4096,65536,1048576','-Dpatterns=random','-Doffsets=17','-Dwindows=5','-DminWindowMillis=25',f'-Dprobe.lib={r}/build/libisaprobe.so']+(['-DforceAVX2=true']if v=='B'else[])+['NativeAVX2Bench',hex(set_),hex(get),hex(table),hex(expected['N_AVX2'])],f'avx2-{pair}-{v}')
for gc in ['G1','Serial','Z']:
 for v in ['A','B']:
  run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+[f'-XX:+Use{gc}GC','-Xlog:safepoint=info','-Dwidth=8','-Dn=1048576','SafepointBench'],f'safepoint-{gc}-{v}-8')
for pair,order in enumerate(['AB','BA','AB','BA']):
 for v in order:
  env=os.environ.copy();env['LD_PRELOAD']=str(r/'build/malloc-trace.so')
  run([(base if v=='A'else image)/'bin/java','--enable-native-access=ALL-UNNAMED','-Xms512m','-Xmx512m',f'-Dtrace.lib={r}/build/malloc-trace.so','-cp',r/'build','NativeMemory'],f'memory-{pair}-{v}',env)
with(o/'cold-long.csv').open('w')as f:
 w=csv.writer(f);w.writerow(['pair','variant','n','pattern','first_sort_ns'])
 for pair,order in enumerate(['AB','BA','AB','BA']):
  for n in [4096,1048576]:
   for p in ['random','sorted','skew']:
    for v in order:
     cmd=['taskset','-c','0,1,3,4',str((base if v=='A'else image)/'bin/java'),'--enable-native-access=ALL-UNNAMED','-Xms128m','-Xmx512m','-cp',str(r/'build'),'-Dwidth=8',f'-Dn={n}',f'-Dpattern={p}','PublicCold']
     x=subprocess.run(cmd,text=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE,check=True);w.writerow([pair,v,n,p,int(x.stdout.strip().split(',')[-1])]);f.flush()
print('COMPLETE',flush=True)
