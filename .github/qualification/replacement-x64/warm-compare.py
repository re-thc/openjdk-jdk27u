import argparse,json,os,subprocess
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('output');a=p.parse_args()
root=Path('/workspace/common-intrinsics-evidence');out=Path(a.output);out.mkdir(exist_ok=True)
cpus=sorted(os.sched_getaffinity(0));worker=cpus[0];os.sched_setaffinity(0,{cpus[1]})
cp=':'.join(str(root/'jmh'/p) for p in ['benchmarks.jar','jmh-core.jar','jopt-simple.jar','commons-math3.jar'])
flags=['-XX:ActiveProcessorCount=1','-XX:CICompilerCount=2','-XX:+UseSerialGC','-Xms128m','-Xmx256m','-XX:-UsePerfData','-XX:+DisableAttachMechanism','-Xrs','--add-exports=java.base/jdk.internal.util=ALL-UNNAMED']
tiers=[('int',['-Xint']),('c1',['-Xbatch','-XX:TieredStopAtLevel=1']),('c2',['-Xbatch','-XX:-TieredCompilation'])]
cases=[('hash','CommonSmallIntrinsics.hashBytes',['-p','length=1,32,65537']),('scalar','CommonSmallIntrinsics.bitCount',['-p','length=1']),('multiply','CommonBigIntegerCalls.multiply',['-p','bits=512,4096']),('modpow','CommonBigIntegerCalls.modPow',['-p','bits=512'])]
records=[]
for tier,mode in tiers:
 for pair in range(3):
  order=['master','before','demand'] if pair%2==0 else ['demand','before','master']
  for image in order:
   java=str(root/'images'/image/'bin/java')
   for case,pattern,params in cases:
    name=f'{tier}-{case}-{image}-{pair}';file=out/(name+'.json')
    command=['taskset','-c',str(worker),java,*flags,'-cp',cp,'org.openjdk.jmh.Main',pattern,*params,'-f','1','-wi','3','-i','5','-w','1s','-r','1s','-t','1','-foe','true','-rf','json','-rff',str(file),'-jvm',java,'-jvmArgs',' '.join(flags+mode)]
    print(name,flush=True)
    with(out/(name+'.log')).open('w') as log:subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,check=True)
    records.append(dict(name=name,tier=tier,pair=pair,image=image,command=command,result=json.loads(file.read_text())))
    (out/'manifest.json').write_text(json.dumps(dict(worker=worker,flags=flags,classpath=cp,runs=records),indent=2)+'\n')
