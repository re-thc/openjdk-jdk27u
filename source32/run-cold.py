import json, subprocess, time
from pathlib import Path
root=Path('/workspace/sz-evidence')
rows=[]
for repeat in range(9):
    for op in ['trim','strip','stripLeading','stripTrailing','isBlank','linesCount','linesFirst']:
        for case in ['empty','long']:
            for label in (['base','candidate','off'] if repeat%2==0 else ['off','candidate','base']):
                path='/workspace/sz-scans' if label=='base' else '/workspace/sz-candidate'
                cmd=['taskset','-c','1',path+'/build/scans/images/jdk/bin/java','-Xms64m','-Xmx64m','-XX:+UseSerialGC','-XX:UseAVX=2']
                if label=='off': cmd += ['-XX:-UseStringZillaIntrinsics']
                cmd += ['-cp',str(root/'classes'),'ColdScans',op,case]
                start=time.perf_counter_ns()
                result=subprocess.run(cmd,text=True,capture_output=True,check=True)
                rows.append(dict(repeat=repeat,operation=op,case=case,label=label,operation_ns=int(result.stdout),process_ns=time.perf_counter_ns()-start,stderr=result.stderr))
    print('cold round',repeat+1,flush=True)
    (root/'cold.json').write_text(json.dumps(rows,indent=2)+'\n')
