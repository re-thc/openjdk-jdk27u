import argparse,itertools,json,math,os,statistics,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('output');p.add_argument('--blocks',type=int,default=120);a=p.parse_args()
root=Path('/workspace/common-intrinsics-evidence');cpus=sorted(os.sched_getaffinity(0));worker=cpus[0];os.sched_setaffinity(0,{cpus[1]})
variants={'master':('master',[]),'before-off':('before',['-XX:-UseCommonIntrinsics']),'before-on':('before',['-XX:+UseCommonIntrinsics']),'demand-off':('demand',['-XX:-UseCommonIntrinsics']),'demand-on':('demand',['-XX:+UseCommonIntrinsics'])}
orders=list(itertools.permutations(variants));flags=['-XX:ActiveProcessorCount=1','-XX:CICompilerCount=2','-XX:+UseSerialGC','-Xms32m','-Xmx256m','-XX:-UsePerfData','-XX:+DisableAttachMechanism','-Xrs'];results={}
def interval(x):
 m=statistics.mean(x);h=1.98*statistics.stdev(x)/math.sqrt(len(x));return dict(difference_ms=m,paired_95_ci_ms=[m-h,m+h])
for tier,mode in [('int',['-Xint']),('c1',['-Xbatch','-XX:TieredStopAtLevel=1']),('c2',['-Xbatch','-XX:-TieredCompilation'])]:
 for operation,bits in [('multiply',512),('modpow',512),('multiply',4096),('modpow',4096)]:
  raw=[];checksum=None
  for block in range(a.blocks+20):
   for label in orders[block%len(orders)]:
    image,extra=variants[label];command=['taskset','-c',str(worker),str(root/'images'/image/'bin/java'),*flags,*mode,*extra,'-cp',str(Path(__file__).parent),'FirstBigInteger',operation,str(bits)]
    start=time.perf_counter_ns();proc=subprocess.run(command,capture_output=True,text=True,check=True);wall=(time.perf_counter_ns()-start)/1e6;elapsed,value=map(int,proc.stdout.split())
    if checksum is None:checksum=value
    assert checksum==value,(label,operation,bits,checksum,value)
    raw.append(dict(block=block,label=label,call_ms=elapsed/1e6,wall_ms=wall,value=value,command=command))
  samples={label:[r for r in raw if r['block']>=20 and r['label']==label] for label in variants};summaries={}
  for metric in ['call_ms','wall_ms']:
   comparisons={}
   for left,right in [('master','demand-on'),('before-on','demand-on'),('before-off','demand-off'),('demand-off','demand-on')]:
    comparisons[left+'_'+right]=interval([y[metric]-x[metric] for x,y in zip(samples[left],samples[right])])
   summaries[metric]=dict(means={label:statistics.mean(r[metric] for r in rows) for label,rows in samples.items()},comparisons=comparisons)
  results[f'{tier}-{operation}-{bits}']=dict(summary=summaries,raw=raw)
  Path(a.output).write_text(json.dumps(dict(flags=flags,worker=worker,blocks=a.blocks,orders=orders,variants=variants,results=results),indent=2)+'\n')
  print(tier,operation,bits,json.dumps(summaries),flush=True)
