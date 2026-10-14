#!/usr/bin/env python3
import json,pathlib,subprocess,sys
root=pathlib.Path.cwd();qual=root/'qualification';out=root/'self-results'
counts={f'{h}/128/c2/{k}/':200_000 for h in ['four','legacy'] for k in ['conversion','rawBits']}
path=out/'fixed-counts.json';path.write_text(json.dumps(counts,indent=2)+'\n')
images=root/'self-images'
for label,base,patched in [('rebuild-control',root/'verified-image',images/'rebuilt-b3/image'),('fallback-identity',images/'rebuilt-b3/image',images/'fallback-identity/image'),('intrinsic-view',images/'rebuilt-b3/image',images/'intrinsic-view/image')]:
    command=[sys.executable,str(qual/'run_matrix_self.py'),'--base',str(base),'--patched',str(patched),'--classes',str(qual/'classes'),'--whitebox',str(qual/'whitebox'),'--out',str(out/label),'--cohort','tiers','--pairs','12','--headers','four,legacy','--observations','observed','--modes','c2','--kernels','conversion,rawBits','--counts',str(path),'--common-flag=-Xshare:off','--native-arm']
    subprocess.run(command,check=True)
