import argparse,json,subprocess
from pathlib import Path

p=argparse.ArgumentParser();p.add_argument('image');p.add_argument('selection',choices=['release','debug']);a=p.parse_args()
root=Path('/workspace/openjdk-jdk27u');evidence=Path(__file__).parent;old=evidence.parent/'recovered/.github/qualification'
flags=['-XX:ActiveProcessorCount=1','-XX:CICompilerCount=2','-XX:+UseSerialGC','-Xms32m','-Xmx256m','-Dseed=42']
sets=[('hotspot',old.joinpath('hotspot-tests.txt').read_text().splitlines(),[]),('jdk',old.joinpath('jdk-tests.txt').read_text().splitlines(),[])]
math=['test/jdk/java/math/BigInteger/BigIntegerTest.java','test/jdk/java/math/BigInteger/ModPow.java','test/jdk/java/math/BigDecimal/SquareRootTests.java']
sets.extend(('c1-math-'+str(level),math,['-Xbatch','-XX:TieredStopAtLevel='+str(level)]) for level in [1,3])
if a.selection=='debug':
 sets=[('common',['test/hotspot/jtreg/compiler/intrinsics/common'],['-XX:+UnlockDiagnosticVMOptions','-XX:+CheckUnhandledOops','-XX:+VerifyOops']),
       ('aot',['test/hotspot/jtreg/runtime/cds/appcds/aotCache/HelloAOTCache.java','test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeCPUFeatureIncompatibilityTest.java','test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeCompressedOopsTest.java','test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeTest.java','test/hotspot/jtreg/compiler/codecache/OverflowCodeCacheTest.java'],[]),
       ('flagless',['test/hotspot/jtreg/runtime/cds/MetaspaceAllocGaps.java'],[]),
       ('determinism',['test/hotspot/jtreg/runtime/cds/FourByteHeaderArchiveDeterminism.java'],[])]
records=[]
for name,tests,extra in sets:
 name='demand-'+a.selection+'-'+name
 vmflags=flags+extra
 if a.selection=='debug' and not name.endswith('-common'):vmflags=[] if name.endswith('-flagless') else ['-XX:ActiveProcessorCount=1','-XX:CICompilerCount=2']
 command=['/workspace/toolchains/jdk27/bin/java','-Xint','-XX:ActiveProcessorCount=1','-XX:+UseSerialGC','-jar','/workspace/toolchains/jtreg83/lib/jtreg.jar','-jdk:'+a.image,'-othervm','-conc:1','-timeoutFactor:4','-nativepath:/workspace/openjdk-jdk27u/build/cloud-gcc16/support/test/hotspot/jtreg/native/lib','-vmoptions:'+' '.join(vmflags),'-w:'+str(evidence/(name+'-work')),'-r:'+str(evidence/(name+'-report')),*tests]
 print(name+' running',flush=True)
 with(evidence/(name+'.log')).open('w') as log:code=subprocess.run(command,cwd=root,stdout=log,stderr=subprocess.STDOUT).returncode
 summary=evidence/(name+'-report/text/summary.txt')
 records.append(dict(name=name,command=command,exit_code=code,summary=summary.read_text() if summary.exists() else ''))
 (evidence/('regressions-'+a.selection+'.json')).write_text(json.dumps(records,indent=2)+'\n')
 print(name+' exit '+str(code),flush=True)
 if code:raise SystemExit(code)
