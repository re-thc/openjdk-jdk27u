import json, sys
from pathlib import Path
import xml.etree.ElementTree as E

path=Path(sys.argv[1])
root=E.parse(path).getroot()
out=[]
for task in root.iter('task'):
    owner=task.get('method','')
    if not any(n in owner for n in ['panama_identity','SimpleDowncall invokeI','Steady calls']): continue
    classes={e.get('id'):e.get('name') for e in task.iter('klass')}
    methods={e.get('id'):(classes.get(e.get('holder'),'')+'.'+e.get('name','')) for e in task.iter('method')}
    decisions=[]
    current=''
    for e in task.iter():
        if e.tag=='call': current=methods.get(e.get('method'),e.get('method'))
        elif e.tag in ('inline_success','inline_fail','intrinsic','failure'):
            decisions.append({'callee':current,'decision':e.tag,**e.attrib})
    out.append({'compile_id':task.get('compile_id'),'method':owner,'compile_kind':task.get('compile_kind'),'stamp':task.get('stamp'),'decisions':decisions})
Path(str(path)+'.inlining.json').write_text(json.dumps(out,indent=2)+'\n')
for task in out:
    relevant=[d for d in task['decisions'] if any(s in d.get('callee','') for s in ['SimpleDowncall','NativeMethodHandle','linkToNative','invokeBasic'])]
    print(task['compile_id'],task['method'],relevant)
