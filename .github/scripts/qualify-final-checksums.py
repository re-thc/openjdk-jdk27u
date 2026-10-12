import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import urllib.request

ROOT=Path.cwd()
OUT=ROOT/'validation/results'
OUT.mkdir(parents=True,exist_ok=True)
NEW=ROOT/'validation/new-jdk'
DEBUG=ROOT/'validation/debug-jdk'
OLD=ROOT/'validation/old-jdk'
TIERS={'int':['-Xint'],'c1':['-XX:TieredStopAtLevel=1','-Xbatch'],
       'c2':['-XX:-TieredCompilation','-Xbatch']}
BASE=['-Xshare:off','-XX:+UnlockDiagnosticVMOptions','-XX:ActiveProcessorCount=2']
def run(name,args):
    print(name,flush=True)
    with (OUT/(name+'.log')).open('w') as f:
        p=subprocess.run([str(x) for x in args],stdout=f,stderr=subprocess.STDOUT)
    if p.returncode:
        print((OUT/(name+'.log')).read_text()[-10000:],flush=True)
        raise RuntimeError(name)

def unpack():
    for kind,target in [('release',NEW),('debug',DEBUG),('old',OLD)]:
        directory=ROOT/'validation'/kind
        archive=next(directory.glob('jdk-*.tar.gz'))
        subprocess.run(['tar','-xf',str(archive),'-C',str(directory)],check=True)
        release=next(directory.rglob('release'))
        shutil.move(str(release.parent),target)
    print((NEW/'release').read_text(),flush=True)

def tests():
    jtreg=next((ROOT/'jtreg/installed').rglob('jtreg.jar'))
    names=['TestAdler32Paths.java','TestZlibNGCRC32.java','TestFpRegsABI.java',
           'TestZlibNGAdler32.java','TestZlibNGAOT.java','TestCRC32.java','TestCRC32C.java']
    for kind,jdk in [('release',NEW),('debug',DEBUG)]:
        run('jtreg-'+kind,[jdk/'bin/java','-XX:ActiveProcessorCount=2','-jar',jtreg,
            '-jdk:'+str(jdk),'-conc:2','-timeoutFactor:3',
            '-w:'+str(OUT/('work-'+kind)),'-r:'+str(OUT/('report-'+kind)),
            *[ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip'/name for name in names]])
    classes=ROOT/'validation/classes'
    classes.mkdir(exist_ok=True)
    names=['TestAdler32Paths.java','TestZlibNGAdler32.java','TestFpRegsABI.java']
    run('compile-gc',[NEW/'bin/javac','-d',classes,
        *[ROOT/'test/hotspot/jtreg/compiler/intrinsics/zip'/name for name in names]])
    for tier,flags in TIERS.items():
        for gc in ['Serial','Parallel','G1','Z','Shenandoah']:
            for cls in ['TestZlibNGAdler32','compiler.intrinsics.zip.TestFpRegsABI']:
                for mode in (['default','avx2'] if os.uname().machine=='x86_64' else ['default']):
                    extra=['-XX:UseAVX=2'] if mode=='avx2' else []
                    run(f'gc-{tier}-{gc}-{mode}-{cls}',[DEBUG/'bin/java',*BASE,*flags,*extra,
                        '-Xmx128m','-XX:+Use'+gc+'GC','-XX:+VerifyOops','-cp',classes,cls])
    (OUT/'qualification-passed.txt').write_text('Release/debug jtreg, all tiers, five collectors and register checks passed\n')

def bench():
    jars=ROOT/'validation/jmh';jars.mkdir(exist_ok=True)
    for path in ['org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
                 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
                 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
                 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar']:
        urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/'+path,jars/Path(path).name)
    classes=ROOT/'validation/bench-classes';classes.mkdir(exist_ok=True)
    cp=os.pathsep.join(str(p) for p in jars.glob('*.jar'))
    run('compile-jmh',[NEW/'bin/javac','-proc:full','-cp',cp,'-d',classes,
        ROOT/'test/micro/org/openjdk/bench/java/util/zip/ChecksumPaths.java'])
    cp+=os.pathsep+str(classes)
    os.sched_setaffinity(0,{max(os.sched_getaffinity(0))})
    for tier,flags in TIERS.items():
        for order in range(2):
            routes=[('old',OLD,[]),('default',NEW,[]),('jni',NEW,
                ['-XX:-UseAdler32Intrinsics','-XX:-UseCRC32Intrinsics'])]
            if order:routes.reverse()
            for route,jdk,extra in routes:
                name=f'final-{tier}-{route}-{order}'
                run(name,[NEW/'bin/java','-cp',cp,'org.openjdk.jmh.Main',
                    'ChecksumPaths.(adler|crc32)(Byte|Heap|Direct)',
                    '-p','size=1,64,1024,65536','-f','3','-wi','3','-w','500ms',
                    '-i','5','-r','500ms','-jvm',jdk/'bin/java',
                    '-jvmArgsAppend',' '.join(BASE+flags+extra),'-foe','true',
                    '-rf','json','-rff',OUT/(name+'.json')])
                rows=json.loads((OUT/(name+'.json')).read_text())
                for row in rows:
                    m=row['primaryMetric']
                    print('FINAL_SCORE',json.dumps({'route':name,'method':row['benchmark'].split('.')[-1],
                        'size':row.get('params',{}).get('size','scalar'),'ns':m['score'],'error':m['scoreError']}),flush=True)

{'unpack':unpack,'tests':tests,'bench':bench}[sys.argv[1]]()
