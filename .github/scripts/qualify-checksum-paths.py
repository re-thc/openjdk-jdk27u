"""Diagnostic-only checksum qualification; never part of the production PR."""
import json
import shutil
import platform
import os
from pathlib import Path
import subprocess
import sys
import urllib.request

ROOT=Path.cwd()
OUT=ROOT/'validation/results'
OUT.mkdir(parents=True,exist_ok=True)
NEW=ROOT/'validation/new-jdk'
DEBUG=ROOT/'validation/debug-jdk'
def run(name,args):
    print(name,flush=True)
    with (OUT/(name+'.log')).open('w') as f:
        p=subprocess.run([str(x) for x in args],stdout=f,stderr=subprocess.STDOUT)
    if p.returncode:
        print((OUT/(name+'.log')).read_text()[-12000:],flush=True)
        raise RuntimeError(name)

def image():
    old=ROOT/'validation/old-jdk'
    extracted=ROOT/'validation/java-base'
    run('extract-java-base',[old/'bin/jmod','extract','--dir',extracted,old/'jmods/java.base.jmod'])
    source=ROOT/'validation/patch-src/java/util/zip'
    source.mkdir(parents=True,exist_ok=True)
    shutil.copy2(ROOT/'src/java.base/share/classes/java/util/zip/Adler32.java',source/'Adler32.java')
    patch=ROOT/'validation/patch-classes'
    run('compile-adler-annotation',[old/'bin/javac','--patch-module',
        'java.base='+str(ROOT/'validation/patch-src'),'-d',patch,source/'Adler32.java'])
    shutil.copy2(patch/'java/util/zip/Adler32.class',
                 extracted/'classes/java/util/zip/Adler32.class')
    shutil.copy2(ROOT/'build/zip-checksums/support/modules_libs/java.base/libzip.so',extracted/'lib/libzip.so')
    shutil.copy2(ROOT/'build/zip-checksums/support/modules_libs/java.base/server/libjvm.so',extracted/'lib/server/libjvm.so')
    jmods=ROOT/'validation/jmods';shutil.copytree(old/'jmods',jmods)
    (jmods/'java.base.jmod').unlink()
    args=[old/'bin/jmod','create','--target-platform','linux-'+('amd64' if platform.machine()=='x86_64' else 'aarch64')]
    for flag,dirname in [('--class-path','classes'),('--libs','lib'),('--cmds','bin'),('--config','conf'),('--legal-notices','legal')]:
        if (extracted/dirname).exists():args += [flag,extracted/dirname]
    run('create-java-base',args+[jmods/'java.base.jmod'])
    run('link-image',[old/'bin/jlink','--module-path',jmods,'--add-modules','ALL-MODULE-PATH','--output',NEW])

def prepare():
    jars=ROOT/'validation/jmh';jars.mkdir(parents=True,exist_ok=True)
    for path in ['org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
                 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
                 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
                 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar']:
        urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/'+path,jars/Path(path).name)
    classes=ROOT/'validation/bench-classes';classes.mkdir(exist_ok=True)
    cp=os.pathsep.join(str(p) for p in jars.glob('*.jar'))
    run('compile-benchmark',[NEW/'bin/javac','-proc:full','-cp',cp,'-d',classes,
        ROOT/'test/micro/org/openjdk/bench/java/util/zip/ChecksumPaths.java'])
    (OUT/'jmh-classpath.txt').write_text(cp+os.pathsep+str(classes))

TIERS={'int':['-Xint'], 'c1':['-XX:TieredStopAtLevel=1','-Xbatch'],
       'c2':['-XX:-TieredCompilation','-Xbatch']}
BASE=['-Xshare:off','-XX:+UnlockDiagnosticVMOptions']
def tests():
    jtreg=next((ROOT/'jtreg/installed').rglob('jtreg.jar'))
    for kind,jdk in [('release',NEW),('debug',DEBUG)]:
        run('jtreg-'+kind,[jdk/'bin/java','-jar',jtreg,'-jdk:'+str(jdk),'-conc:2',
            '-w:'+str(OUT/('jtreg-work-'+kind)),'-r:'+str(OUT/('jtreg-report-'+kind)),
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestAdler32Paths.java',
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAdler32.java',
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAOT.java',
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestFpRegsABI.java',
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestCRC32.java',
            ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestCRC32C.java'])
    classes=ROOT/'validation/test-classes';classes.mkdir(exist_ok=True)
    sources=[ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip'/f for f in
             ['TestAdler32Paths.java','TestFpRegsABI.java','TestCRC32.java']]
    run('compile-gc-checks',[NEW/'bin/javac','-d',classes,*sources])
    for tier,flags in TIERS.items():
        for gc in ['Serial','Parallel','G1','Z','Shenandoah']:
            for cls in ['TestAdler32Paths','TestFpRegsABI']:
                run(f'gc-{tier}-{gc}-{cls}',[DEBUG/'bin/java',*BASE,*flags,
                    '-XX:+UseZlibNGCRC32','-XX:Adler32Kernel=2',
                    '-XX:+Use'+gc+'GC','-XX:+VerifyOops','-cp',classes,
                    'compiler.intrinsics.zip.'+cls])
    # Fresh images contain the new intrinsic annotation. AOT must restore the external C addresses.
    run('aot-record',[DEBUG/'bin/java','-XX:AOTMode=record',
        '-XX:AOTConfiguration='+str(OUT/'checksums.aotconf'),'-cp',classes,
        'compiler.intrinsics.zip.TestAdler32Paths'])
    run('aot-create',[DEBUG/'bin/java','-XX:AOTMode=create',
        '-XX:AOTConfiguration='+str(OUT/'checksums.aotconf'),
        '-XX:AOTCache='+str(OUT/'checksums.aot'),'-cp',classes])
    run('aot-use',[DEBUG/'bin/java','-XX:AOTMode=on',
        '-XX:AOTCache='+str(OUT/'checksums.aot'),'-cp',classes,
        'compiler.intrinsics.zip.TestAdler32Paths'])

def bench():
    classes=ROOT/'validation/smoke-classes'
    classes.mkdir(exist_ok=True)
    run('compile-smoke',[NEW/'bin/javac','-d',classes,
        ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestAdler32Paths.java',
        ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip/TestFpRegsABI.java'])
    for tier,flags in TIERS.items():
        for cls in ['TestAdler32Paths','TestFpRegsABI']:
            run('smoke-'+tier+'-'+cls,[NEW/'bin/java',*BASE,*flags,
                '-XX:+UseZlibNGCRC32','-XX:Adler32Kernel=2','-Xmx128m',
                '-cp',classes,'compiler.intrinsics.zip.'+cls])
    prepare()
    cp=(OUT/'jmh-classpath.txt').read_text()
    for tier,tierflags in TIERS.items():
        for route in ['kernel','jni','ng']:
            flags=[*BASE,*tierflags]
            if route=='jni': flags+=['-XX:-UseAdler32Intrinsics','-XX:-UseCRC32Intrinsics']
            elif route=='kernel':
                flags+=['-XX:Adler32Kernel=1'] if tier=='c2' else ['-XX:-UseAdler32Intrinsics']
            else: flags+=['-XX:+UseZlibNGCRC32','-XX:Adler32Kernel=2']
            name=f'explore-{tier}-{route}'
            run(name,[NEW/'bin/java','-cp',cp,'org.openjdk.jmh.Main',
                'ChecksumPaths.(adler|crc32)(Byte|Heap|Direct)',
                '-p','size=0,1,64,256,1024,4096,65536,1048576',
                '-f','2','-wi','2','-w','300ms','-i','3','-r','300ms',
                '-jvm',NEW/'bin/java','-jvmArgsAppend',' '.join(flags),
                '-foe','true','-rf','json','-rff',OUT/(name+'.json')])
    # CRC32C uses a different polynomial; its Java fallback is a control, not zlib-ng.
    for tier,tierflags in TIERS.items():
        for route,flags in [('kernel',[]),('java',['-XX:-UseCRC32CIntrinsics'])]:
            name=f'crc32c-{tier}-{route}'
            run(name,[NEW/'bin/java','-cp',cp,'org.openjdk.jmh.Main',
                'ChecksumPaths.crc32c(Byte|Heap|Direct)','-p','size=64,1024,65536',
                '-f','2','-wi','2','-w','300ms','-i','3','-r','300ms',
                '-jvm',NEW/'bin/java','-jvmArgsAppend',' '.join(BASE+tierflags+flags),
                '-foe','true','-rf','json','-rff',OUT/(name+'.json')])

if __name__=='__main__':
    {'image':image,'prepare':prepare,'tests':tests,'bench':bench}[sys.argv[1]]()
