import json, os, statistics, time
from pathlib import Path
import sys
java=sys.argv[1]
cpu=sys.argv[2]
results={}
for tier,flag in [('int','-Xint'),('c1','-XX:TieredStopAtLevel=1'),('c2','-XX:-TieredCompilation')]:
    pairs=[]
    for pair in range(25):
        sample={}
        for state in (['off','on'] if pair%2==0 else ['on','off']):
            args=['taskset','-c',cpu,java,flag,'-XX:'+('+' if state=='on' else '-')+'UseCommonIntrinsics','-Xms32m','-Xmx32m','-XX:ActiveProcessorCount=1','-XX:CICompilerCount=1','-XX:+UseSerialGC','-XX:-UsePerfData','-XX:+DisableAttachMechanism','-Xrs','-version']
            before=time.perf_counter_ns()
            pid=os.fork()
            if pid==0:
                fd=os.open(os.devnull,os.O_WRONLY);os.dup2(fd,1);os.dup2(fd,2);os.execvp(args[0],args)
            _,status,usage=os.wait4(pid,0)
            if os.waitstatus_to_exitcode(status):raise RuntimeError('startup failed')
            sample[state]=dict(ms=(time.perf_counter_ns()-before)/1e6,rss_kib=usage.ru_maxrss,jvm_args=args[4:])
        pairs.append(sample)
    results[tier]=pairs
Path('qualification/startup.json').write_text(json.dumps(results,indent=2)+'\n')
