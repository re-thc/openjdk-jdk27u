"""Sequential randomized image comparisons; never run during builds/tests.

Fork is the statistical unit. 'control' uses the same image as base and detects
environment drift. Child user+system CPU is captured alongside elapsed time.
"""
import argparse, json, random, resource, subprocess, time
from pathlib import Path

p=argparse.ArgumentParser()
p.add_argument('--images',default='/workspace/ffm-images')
p.add_argument('--out',required=True)
p.add_argument('--rounds',type=int,default=12)
p.add_argument('--variants',default='base,control,b,a')
p.add_argument('--tiers',default='int,c1,tiered,c2')
p.add_argument('--shapes',default='empty,i')
p.add_argument('--cds',default='off')
p.add_argument('--steady',action='store_true')
p.add_argument('--count',type=int,default=100_000)
p.add_argument('--tier-counts',default='',help='Explicit per-tier count overrides, e.g. int=10000,c2=1000000')
p.add_argument('--warm',type=int,default=20)
p.add_argument('--samples',type=int,default=10)
a=p.parse_args()
counts={k:int(v) for k,v in (s.split('=') for s in a.tier_counts.split(',') if s)}
root=Path(__file__).resolve().parent
flags={'int':['-Xint'],'c1':['-XX:TieredStopAtLevel=1'],
       'c13':['-XX:TieredStopAtLevel=3'],'tiered':[],
       'c2':['-XX:-TieredCompilation','-Xbatch']}
rng=random.Random(20261014)
cases=[(t,s) for t in a.tiers.split(',') for s in a.shapes.split(',')]
out=Path(a.out); out.parent.mkdir(parents=True,exist_ok=True)
if out.exists(): raise SystemExit('Preserve existing raw data: choose a new output')
with out.open('w') as f:
    for block in range(a.rounds):
        rng.shuffle(cases)
        for tier,shape in cases:
            variants=a.variants.split(','); rng.shuffle(variants)
            for variant in variants:
                image='base' if variant=='control' else variant
                cmd=['taskset','-c','0',str(Path(a.images)/image/'bin/java'),
                     '-Xms128m','-Xmx128m','--enable-native-access=ALL-UNNAMED',*flags[tier]]
                if a.cds=='off': cmd.append('-Xshare:off')
                elif a.cds!='default': raise ValueError(a.cds)
                if a.steady:
                    cmd += ['-Dsteady.mode='+shape,'-Dsteady.count='+str(counts.get(tier,a.count)),
                            '-Dsteady.warm='+str(a.warm),'-Dsteady.samples='+str(a.samples),
                            '-Dsteady.library='+str(root/'libprobe.so'),
                            '-cp',str(root/'classes'),'Steady']
                else:
                    cmd += ['-cp',str(root/'classes'),'Probe',shape,str(root/'libprobe.so')]
                before=resource.getrusage(resource.RUSAGE_CHILDREN)
                start=time.perf_counter_ns()
                result=subprocess.run(cmd,text=True,capture_output=True)
                elapsed=time.perf_counter_ns()-start
                after=resource.getrusage(resource.RUSAGE_CHILDREN)
                cpu=(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)*1e9
                row={'block':block,'variant':variant,'tier':tier,'shape':shape,'cds':a.cds,
                     'command':cmd,'wall_ns':elapsed,'process_cpu_ns':round(cpu),
                     'returncode':result.returncode,'stdout':result.stdout,'stderr':result.stderr}
                if result.returncode==0:
                    row['metrics']=json.loads(result.stdout.splitlines()[-1])
                f.write(json.dumps(row)+'\n');f.flush()
                if result.returncode: raise RuntimeError(row)
        print('block',block,'complete',flush=True)
