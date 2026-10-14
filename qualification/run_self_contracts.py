#!/usr/bin/env python3
import json,pathlib,subprocess
root=pathlib.Path.cwd();qual=root/'qualification';out=root/'self-results/contracts';out.mkdir()
records=[]
for variant in ['rebuilt-b3','fallback-identity','intrinsic-view']:
    image=root/'self-images'/variant/'image';classes=out/variant;classes.mkdir()
    sources=[root/'test/lib/jtreg/SkippedException.java']+[root/'test/jdk/jdk/incubator/vector'/n for n in ['ReinterpretContracts.java','SelfReinterpretAllocation.java']]
    subprocess.run([str(root/'verified-image/bin/javac'),'--add-modules','jdk.incubator.vector','-d',str(classes),*[str(s) for s in sources]],check=True)
    for name,flags in [('four',[]),('int',['-Xint']),('c1',['-XX:TieredStopAtLevel=1']),('c2',['-XX:-TieredCompilation','-Xbatch']),('eight',['-XX:-UseFourByteObjectHeaders']),('legacy',['-XX:-UseCompactObjectHeaders']),('fallback',['-XX:+UnlockDiagnosticVMOptions','-XX:DisableIntrinsic=_VectorConvert'])]:
        for test in ['ReinterpretContracts','SelfReinterpretAllocation']:
            command=[str(image/'bin/java'),'-Xms128m','-Xmx512m','-XX:ActiveProcessorCount=2','-Xshare:off','--add-modules','jdk.incubator.vector',*flags,'-cp',str(classes),test]
            r=subprocess.run(command,capture_output=True,timeout=180)
            stem=out/(variant+'-'+name+'-'+test)
            stem.with_suffix('.stdout').write_bytes(r.stdout);stem.with_suffix('.stderr').write_bytes(r.stderr)
            records.append({'variant':variant,'configuration':name,'test':test,'command':command,'returncode':r.returncode})
            (out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
            print(variant,name,test,r.returncode,r.stdout.decode(errors='replace').strip(),flush=True)
            if r.returncode:raise SystemExit('Contract failed: '+str(stem))
