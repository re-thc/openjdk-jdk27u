import json, pathlib, re
import sys
p=pathlib.Path(sys.argv[1] if len(sys.argv)>1 else 'release-causal')
for name,marker in [('plan.json','RELEASE_PLAN_JSON'),('summary.json','RELEASE_SUMMARIES_JSON'),('assembly-index.json','RELEASE_ASSEMBLY_INDEX_JSON')]:
    f=p/name
    if f.exists(): print(marker+'='+json.dumps(json.loads(f.read_text())))
    else: print('MISSING_RELEASE_FILE='+name)
for f in sorted(p.glob('assembly-*.out')):
    text=f.read_text()
    # Preserve complete conversion-only assembly output, including ordinary versus OSR IDs.
    pieces=re.split(r'(?=Compiled method \(c2\))',text)
    for piece in pieces:
        if piece.startswith('Compiled method') and 'PhaseVectorKernels::conversion' in piece.split('\n')[0]:
            piece=piece.split('kernel,phase,')[0]
            piece=re.split(r'^conversion,',piece,1,flags=re.M)[0]
            print('RELEASE_ASSEMBLY_TEXT_JSON='+json.dumps({'file':f.name,'text':piece}))
