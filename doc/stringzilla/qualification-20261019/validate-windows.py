#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Run existing Java and production-native contracts on the rebuilt MSVC image."""
import importlib.util
import json
from pathlib import Path
import subprocess

root=Path.cwd()
out=root/'validation'
out.mkdir(exist_ok=False)
spec=importlib.util.spec_from_file_location('support',root/'.github/scripts/stringzilla-performance.py')
support=importlib.util.module_from_spec(spec);spec.loader.exec_module(support)
support.msvc_baseline_probe(out,root)
java=root/'pair/fork/bin/java.exe'
javac=root/'pair/original/bin/javac.exe'
classes=out/'classes';classes.mkdir()
test=root/'test/jdk/java/lang/String'
support.command([javac,'-d',classes,*[test/(n+'.java') for n in ('StringZillaSearch','StringZillaBounded','StringZillaKernelsTest')]])
includes=[root/'pair/fork/include',root/'pair/fork/include/win32',root/'src/hotspot/share/include',
          root/'src/hotspot/os/windows/include',root/'src/java.base/share/native/libjava',
          root/'src/java.base/share/native/libjava/stringzilla']
argv=['cl.exe','/nologo','/std:c11','/O2','/LD',*['/I'+str(p) for p in includes],
      str(test/'libStringZillaKernelsTest.c'),'/Fo'+str(out/'kernels.obj'),'/Fe'+str(out/'StringZillaKernelsTest.dll')]
compile_argv=argv.copy()
batch=out/'compile.cmd'
batch.write_text('@echo off\ncall "C:\\Program Files\\Microsoft Visual Studio\\18\\Enterprise\\vc\\auxiliary\\build\\vcvars64.bat" -vcvars_ver=14.44\nif errorlevel 1 exit /b %errorlevel%\n'+subprocess.list2cmdline(argv)+'\n')
with (out/'native-build.log').open('w') as log:
    subprocess.run(['cmd.exe','/d','/c',str(batch)],stdout=log,stderr=subprocess.STDOUT,check=True)
records=[]
disable='_stringzillaEqualsRange,_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16,_indexOfL,_indexOfU,_indexOfUL,_indexOfIL,_indexOfIU,_indexOfIUL,_indexOfL_char,_indexOfU_char,_equalsL'
for name,flags in [('interpreter',['-Xint']),('c1',['-Xbatch','-XX:TieredStopAtLevel=1']),
                   ('c2',['-Xbatch','-XX:-TieredCompilation']),('jni',['-Xbatch','-XX:+UnlockDiagnosticVMOptions','-XX:DisableIntrinsic='+disable]),
                   ('disabled',['-Xbatch','-XX:-UseStringZillaIntrinsics']),('noncompact',['-Xbatch','-XX:-CompactStrings'])]:
    for cls in ('StringZillaSearch','StringZillaBounded'):
        argv=[str(java),'-XX:ActiveProcessorCount=2','-Xshare:off',*flags,'-cp',str(classes),cls]
        with (out/(name+'-'+cls+'.log')).open('w') as log:
            subprocess.run(argv,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=300)
        records.append({'name':name,'test':cls,'command':argv,'passed':True})
support.command([java,'--add-opens=java.base/java.lang=ALL-UNNAMED','-Djava.library.path='+str(out),'-cp',classes,'StringZillaKernelsTest'])
(out/'receipt.json').write_text(json.dumps({'java':records,'native':{'passed':True,'compiler_args':compile_argv},
    'hashes':{str(p.relative_to(out)):support.sha(p) for p in out.rglob('*') if p.is_file()}},indent=2)+'\n')
