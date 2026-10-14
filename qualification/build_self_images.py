#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# GPL version 2 only. Full OpenJDK image packaging from verified unchanged VM.
import hashlib,json,os,pathlib,re,shutil,subprocess
root=pathlib.Path.cwd(); evidence=root/'self-results'; evidence.mkdir(exist_ok=True)
boot=root/'verified-image'; output=root/'self-images'; output.mkdir(exist_ok=True)
commands=[]; manifests={}
def run(label,cmd):
    r=subprocess.run([str(x) for x in cmd],capture_output=True,timeout=180)
    (evidence/(label+'.stdout')).write_bytes(r.stdout);(evidence/(label+'.stderr')).write_bytes(r.stderr)
    commands.append({'label':label,'command':[str(x) for x in cmd],'returncode':r.returncode})
    (evidence/'build-commands.json').write_text(json.dumps(commands,indent=2)+'\n')
    if r.returncode:
        print(r.stdout.decode(errors='replace'));print(r.stderr.decode(errors='replace'))
        raise SystemExit('Failed '+label)
    return r.stdout.decode()
def digest(file): return hashlib.file_digest(file.open('rb'),'sha256').hexdigest()
module='jdk.incubator.vector'; original=root/'src'/module/'share/classes'
assert digest(boot/'lib/server/libjvm.so')=='2ea2db99d951082ddc60a9c2baf106544260934b39e3c5b84649d929ef6f1eab'
description=run('original-module-describe',[boot/'bin/jmod','describe',boot/'jmods'/(module+'.jmod')])
version=description.splitlines()[0].partition('@')[2]
platform=next((line.split(' ',1)[1] for line in description.splitlines() if line.startswith('platform ')),None)
for variant in ['rebuilt-b3','typed-self','identity-intrinsic']:
    target=output/variant;target.mkdir()
    source=target/'source'/module;source.parent.mkdir()
    shutil.copytree(original,source)
    if variant!='rebuilt-b3':
        proposal=root/'qualification/typed-self-files'
        for name in ['Short','Int','Long','Float','Double']:
            dest=source/'jdk/incubator/vector'/(name+'Vector.java')
            shutil.copyfile(proposal/dest.name,dest)
            if variant=='identity-intrinsic':
                text=dest.read_text();method='reinterpretAs'+name+'s'
                pattern=r'(public final '+name+r'Vector '+method+r'\(\) \{)\s*return this;\s*\}'
                body='''
        Class<?> vectorType = vspecies().vectorType();
        int vectorLength = length();
        return VectorSupport.convert(VectorSupport.VECTOR_OP_REINTERPRET,
                vectorType, LANE_TYPE_ORDINAL, vectorLength,
                vectorType, LANE_TYPE_ORDINAL, vectorLength,
                this, vspecies(), (vector, species) -> vector);
    }'''
                text,count=re.subn(pattern,lambda m:m.group(1)+body,text)
                assert count==1,(name,count)
                dest.write_text(text)
        template=source/'jdk/incubator/vector/X-Vector.java.template'
        shutil.copyfile(proposal/template.name,template)
        if variant=='identity-intrinsic':
            text,count=re.subn(r'(public final \$abstractvectortype\$ reinterpretAs\$Type\$s\(\) \{)\s*return this;\s*\}',lambda m:m.group(1)+body,template.read_text())
            assert count==1,count
            template.write_text(text)
    classes=target/'classes'
    run(variant+'-javac',[boot/'bin/javac','-g','-Xlint:none','--module-source-path',target/'source','-d',classes,'-m',module])
    jmods=target/'jmods';shutil.copytree(boot/'jmods',jmods)
    (jmods/(module+'.jmod')).unlink()
    create=[boot/'bin/jmod','create','--class-path',classes/module]
    if version:create+=['--module-version',version]
    if platform:create+=['--target-platform',platform]
    run(variant+'-vector-jmod',create+[jmods/(module+'.jmod')])
    base=target/'base-extracted'
    run(variant+'-extract-base',[boot/'bin/jmod','extract','--dir',base,jmods/'java.base.jmod'])
    run(variant+'-remove-stale-hashes',[boot/'bin/java',root/'qualification/StripModuleHashes.java',base/'classes/module-info.class'])
    (jmods/'java.base.jmod').unlink()
    create=[boot/'bin/jmod','create']
    for directory,flag in [('classes','--class-path'),('bin','--cmds'),('conf','--config'),('include','--header-files'),('legal','--legal-notices'),('lib','--libs'),('man','--man-pages')]:
        if (base/directory).is_dir():create += [flag,base/directory]
    if version:create+=['--module-version',version]
    if platform:create+=['--target-platform',platform]
    create+=['--module-path',jmods,'--hash-modules','.*',jmods/'java.base.jmod']
    run(variant+'-base-jmod',create)
    image=target/'image'
    run(variant+'-jlink',[boot/'bin/jlink','--module-path',jmods,'--add-modules','ALL-MODULE-PATH','--output',image])
    shutil.copytree(jmods,image/'jmods')
    assert digest(image/'lib/server/libjvm.so')==digest(boot/'lib/server/libjvm.so')
    run(variant+'-version',[image/'bin/java','-version'])
    manifests[variant]={'sources':{str(p.relative_to(source)):digest(p) for p in sorted(source.rglob('*')) if p.is_file()},'image':{rel:digest(image/rel) for rel in ['bin/java','lib/modules','lib/server/libjvm.so','release']},'native_vm_unchanged':True}
    (evidence/'images.json').write_text(json.dumps(manifests,indent=2)+'\n')
print('Built and linked three complete images; native VM byte-identical to verified b3')
