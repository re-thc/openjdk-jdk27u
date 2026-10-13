import argparse,itertools,json,math,os,statistics,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('master');p.add_argument('modified');p.add_argument('output');p.add_argument('--blocks',type=int,default=600);a=p.parse_args()
cpus=sorted(os.sched_getaffinity(0)); worker=cpus[0];os.sched_setaffinity(0,{cpus[1]})
flags=['-XX:ActiveProcessorCount=1','-XX:CICompilerCount=2','-XX:+UseSerialGC','-Xms32m','-Xmx256m','-XX:-UsePerfData','-XX:+DisableAttachMechanism','-Xrs']
orders=list(itertools.permutations(['master','off','on'])); results={}
for tier,mode in [('int',['-Xint']),('c1',['-XX:TieredStopAtLevel=1']),('c2',['-XX:-TieredCompilation'])]:
    samples={label:[] for label in orders[0]}
    for block in range(a.blocks+18):
        for label in orders[block%len(orders)]:
            extra=[] if label=='master' else ['-XX:'+('+' if label=='on' else '-')+'UseCommonIntrinsics']
            command=['taskset','-c',str(worker),a.master if label=='master' else a.modified,*flags,*mode,*extra,'-version']
            start=time.perf_counter_ns();subprocess.run(command,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True);elapsed=(time.perf_counter_ns()-start)/1e6
            if block>=18:samples[label].append(elapsed)
    comparisons={}
    for baseline,updated in [('master','on'),('master','off'),('off','on')]:
        diffs=[b-a for a,b in zip(samples[baseline],samples[updated])];mean=statistics.mean(diffs);half=1.964*statistics.stdev(diffs)/math.sqrt(a.blocks)
        comparisons[baseline+'_'+updated]=dict(difference_ms=mean,paired_95_ci_ms=[mean-half,mean+half])
    results[tier]=dict(means_ms={k:statistics.mean(v) for k,v in samples.items()},comparisons=comparisons,samples=samples)
    print(json.dumps({tier:{k:v for k,v in results[tier].items() if k!='samples'}}),flush=True)
Path(a.output).write_text(json.dumps(dict(master=a.master,modified=a.modified,blocks=a.blocks,worker_cpu=worker,vm_flags=flags,orders=orders,results=results),indent=2)+'\n')
