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

import pathlib,subprocess,os,time,re,json
r=pathlib.Path(__file__).resolve().parent.parent
out=pathlib.Path(os.environ.get('SORT_AUX_OUT',r/'evidence/post-new'))
out.mkdir(exist_ok=False)
def run(cmd,stem,env=None):
 print(time.time(),stem,flush=True)
 with (out/f'{stem}.out').open('w')as stdout,(out/f'{stem}.err').open('w')as stderr:subprocess.run([str(x)for x in cmd],stdout=stdout,stderr=stderr,env=env,check=True)
image=pathlib.Path(os.environ.get('SORT_CANDIDATE_IMAGE',r/'images/candidate-e8'));base=r/'images/base';lib=image/'lib/libprimitivesort.so'
# Match the product target mask in the test-only ChosenTarget inline helper.
subprocess.run(['g++','-O3','-std=c++17','-fPIC','-shared','-march=x86-64-v3','-DHWY_WANT_AVX3_ZEN4',f'-I{r}/deps/highway',f'-I{image}/include',f'-I{image}/include/linux',str(r/'src/isa-probe.cpp'),'-ldl','-o',str(r/'build/libisaprobe.so')],check=True)
symbols=subprocess.check_output(['nm','-C',str(lib)],text=True).splitlines()
def offset(name,optional=False):
 matches=[x.split()[0]for x in symbols if x.endswith(name)]
 if not matches and optional:return 0
 return int(matches[0],16)
getter=offset('hwy::GetChosenTarget()');setter=offset('hwy::SetSupportedTargetsForTest(long)')
t32=offset('hwy::(anonymous namespace)::SortI32AscHighwayDispatchTable',True);t64=offset('hwy::(anonymous namespace)::SortI64AscHighwayDispatchTable')
expected={}
for target in ['N_AVX3_ZEN4','N_AVX2']:
 expected[target]=[offset(f'hwy::{target}::(anonymous namespace)::SortI32Asc(int*, unsigned long)',True),offset(f'hwy::{target}::(anonymous namespace)::SortI64Asc(long*, unsigned long)')]
(out/'isa-symbol-offsets.json').write_text(json.dumps({'getter':getter,'setter':setter,'table32':t32,'table64':t64,'expected':expected},indent=2))
common=['--enable-native-access=ALL-UNNAMED','-Xms1g','-Xmx2g','-XX:CICompilerCount=2','-cp',r/'build']
for pair,order in enumerate(['ZA','AZ','ZA','AZ']):
 for v in order:
  opts=[f'-Dprobe.lib={r}/build/libisaprobe.so']+(['-DforceAVX2=true']if v=='A'else[])
  stem=f'isa-{pair}-{v}'
  run(['taskset','-c','0,1,3,4',image/'bin/java']+common+opts+['NativeISA',hex(getter),hex(t32),hex(t64),hex(setter)],stem)
  text=(out/f'{stem}.err').read_text();m=re.search(r'int32_entry_offset=0x([0-9a-f]+) int64_entry_offset=0x([0-9a-f]+)',text)
  if not m or [int(m[1],16),int(m[2],16)]!=expected['N_AVX2'if v=='A'else'N_AVX3_ZEN4']:raise AssertionError(text)
if os.environ.get('ISA_ONLY')=='1':raise SystemExit(0)
for pair,order in enumerate(['AB','BA','AB','BA']):
 for v in order:
  run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+['UnaffectedBench'],f'unaffected-{pair}-{v}')
run(['taskset','-c','0,1,2,3',base/'bin/java','-Xms1g','-Xmx3g','-XX:ActiveProcessorCount=4','-Djava.util.concurrent.ForkJoinPool.common.parallelism=3',f'-Dparallel.lib={r}/build/libparallel.so','-cp',r/'build','ParallelBench'],'parallel')
subprocess.run(['python3',str(r/'src/cold-campaign.py')],check=True)
for v in ['A','B']:
 env=os.environ.copy();env['LD_PRELOAD']=str(r/'build/malloc-trace.so')
 run([(base if v=='A'else image)/'bin/java','--enable-native-access=ALL-UNNAMED','-Xms512m','-Xmx512m',f'-Dtrace.lib={r}/build/malloc-trace.so','-cp',r/'build','NativeMemory'],f'memory-allocation-{v}',env)
for gc in ['G1','Serial','Z']:
 for v in ['A','B']:
  for width in [4,8]:
   run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+[f'-XX:+Use{gc}GC','-Xlog:safepoint=info',f'-Dwidth={width}','-Dn=1048576','SafepointBench'],f'safepoint-{gc}-{v}-{width}')
if os.environ.get('SORT_EXPERIMENT')=='e10':
 subprocess.run([str(image/'bin/javac'),'-cp',str(r/'build'),'-d',str(r/'build'),str(r/'src/NativeAVX2Bench.java')],check=True)
 fixed=['-DwarmMixed=true','-Dwidths=8','-Dsizes=4096,65536,1048576','-Dpatterns=random,low,reverse,skew','-Doffsets=17','-Dwindows=5','-DminWindowMillis=10']
 for pair,order in enumerate(['AB','BA','AB','BA']):
  for v in order:
   opts=[f'-Dprobe.lib={r}/build/libisaprobe.so']+(['-DforceAVX2=true']if v=='B'else[])
   run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+fixed+opts+['NativeAVX2Bench',hex(setter),hex(getter),hex(t64),hex(expected['N_AVX2'][1])],f'avx2-{pair}-{v}')
if os.environ.get('SORT_EXPERIMENT')=='e10':
 for v in ['A','B']:
  opts=['-XX:+CITime','-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation',f'-XX:LogFile={out}/compiler-{v}.xml']
  fixed=['-DwarmMixed=true','-Dsizes=65536,1048576','-Dpatterns=random,sorted,reverse,skew','-Doffsets=17','-Dwindows=5','-DminWindowMillis=25']
  run(['taskset','-c','0,1,3,4',(base if v=='A'else image)/'bin/java']+common+opts+fixed+['PublicBench'],f'compiler-{v}')
print('COMPLETE',flush=True)
