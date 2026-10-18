# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Fixed balanced Linux comparison of complete HexFormat calls; no acceptance gate."""
import argparse,csv,hashlib,json,os,subprocess,time
from pathlib import Path
ORDERS=[['baseline','enabled','disabled'],['enabled','disabled','baseline'],['disabled','baseline','enabled'],['baseline','disabled','enabled'],['disabled','enabled','baseline'],['enabled','baseline','disabled']]
DEFAULT_CASES='encode:0,encode:32,encode:1023,encode:1024,encode:4096,encode:65536,encode:1048576,decode:0,decode:32,decode:128,decode:512,decode:65536,decode:1048576,mixed:65536,charsequence:65536,decorated-encode:4096,decorated-decode:4096,upper:4096,appendable:4096,offset-encode:4096,offset-decode:65536,early-invalid:65536,late-invalid:65536,utf16-invalid:65536,sha256:65536'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,x):p.write_text(json.dumps(x,indent=2)+'\n')
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for name in ['baseline','candidate','classes','output']:p.add_argument('--'+name,type=Path,required=True)
 p.add_argument('--rounds',type=int,choices=[3,6],default=6);p.add_argument('--gc',choices=['G1','Serial','Z'],default='G1');p.add_argument('--cases',default=DEFAULT_CASES);p.add_argument('--cold',action='store_true');p.add_argument('--candidate-revision',required=True)
 a=p.parse_args();a.baseline=a.baseline.resolve();a.candidate=a.candidate.resolve();a.classes=a.classes.resolve();a.output=a.output.resolve();a.output.mkdir();(a.output/'logs').mkdir();cases=a.cases.split(',');cpus=','.join(map(str,sorted(os.sched_getaffinity(0))[:2]));env=os.environ.copy()
 for key in ['JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS','JAVA_OPTS','LD_PRELOAD','DYLD_INSERT_LIBRARIES']:env.pop(key,None)
 files=[Path(__file__).resolve(),Path(__file__).with_name('PracticalHex.java'),*a.classes.glob('*.class')]
 for image in [a.baseline,a.candidate]:
  files += [image/'release',image/'bin/java',image/'lib/modules',image/'lib/server/libjvm.so',image/'lib/libjava.so']
 files.append(a.candidate/'lib/libhexsimd.so');hashes={str(f):sha(f) for f in set(files)}
 save(a.output/'plan.json',{'candidate_revision':a.candidate_revision,'baseline_revision':'89885a6288e7aaabd01678a704a586272c0f96e3','baseline':str(a.baseline),'candidate':str(a.candidate),'cases':cases,'gc':a.gc,'orders':ORDERS[:a.rounds],'warmup_ms':400,'sample_ms':80,'samples':5,'compact_strings':True,'affinity':cpus,'heap_MiB':512,'sha256':hashes,'policy':'Keep all observations; paired medians, directions and spread, no numerical pass/retry gates; blocking subprocess wait'})
 records=[]
 def run(round,state,mode,case=None):
  image=a.baseline if state=='baseline' else a.candidate
  args=['taskset','-c',cpus,str(image/'bin/java'),'-Xms512m','-Xmx512m','-XX:ActiveProcessorCount=2','-XX:+Use'+a.gc+'GC','-XX:+CompactStrings','-XX:-UsePerfData','--add-exports','java.base/jdk.internal.util=ALL-UNNAMED']
  if state!='enabled':args+=['-Djdk.hexFormat.useNative=false']
  if mode=='cold':args+=['-Xlog:library=info']
  args+=['-cp',str(a.classes),'PracticalHex',mode,*([case] if mode=='cold' else [str(round*7),a.cases])]
  label=f'{mode}-r{round}-{state}'+('-'+case if case else '');f=a.output/'logs'/label;entry={'label':label,'kind':'cold' if mode=='cold' else 'steady','round':round,'state':state,'gc':a.gc,'compact':True,'cases':cases,'mode':case,'argv':args};records.append(entry);save(a.output/'commands.json',records)
  with f.with_suffix('.stdout').open('w') as so,f.with_suffix('.stderr').open('w') as se:
   start=time.perf_counter_ns();result=subprocess.run(args,stdout=so,stderr=se,env=env);wall=time.perf_counter_ns()-start
  entry.update(returncode=result.returncode,wall_ns=wall,stdout=str(f.with_suffix('.stdout')),stderr=str(f.with_suffix('.stderr')));save(a.output/'commands.json',records)
  if result.returncode:raise RuntimeError(label+' failed; retained without retry')
  if mode=='steady':
   txt=f.with_suffix('.stdout').read_text();rows=list(csv.DictReader(l for l in txt.splitlines() if not l.startswith('#')));assert len(rows)==5*len(cases);assert '# nativeAvailableAfter='+str(state=='enabled').lower() in txt
  save(a.output/'progress.json',{'completed':len(records),'last':label})
 for round,order in enumerate(ORDERS[:a.rounds],1):
  for state in order:run(round,state,'steady')
 if a.cold:
  for round,order in enumerate(ORDERS,1):
   for case in ['empty','tiny','encode','decode','encode64','decode64','session','early-invalid']:
    for state in order:run(round,state,'cold',case)
 assert all(sha(Path(f))==h for f,h in hashes.items())
 save(a.output/'complete.json',{'completed':len(records),'inputs_unchanged':True})
if __name__=='__main__':main()
