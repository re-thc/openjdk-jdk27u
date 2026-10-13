import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import urllib.request

ROOT = Path.cwd()
OUT = ROOT / 'validation/results'
OUT.mkdir(parents=True, exist_ok=True)
NEW = ROOT / 'build/review/images/jdk'
STATIC = ROOT / 'build/review/images/static-jdk'
DEBUG = ROOT / 'validation/debug-jdk'
OLD = ROOT / 'validation/old-jdk'
ZIP = ROOT / 'test/hotspot/jtreg/compiler/intrinsics/zip'
TIERS = {'int': ['-Xint'], 'c1': ['-XX:TieredStopAtLevel=1', '-Xbatch'],
         'c2': ['-XX:-TieredCompilation', '-Xbatch']}
BASE = ['-Xshare:off', '-XX:+UnlockDiagnosticVMOptions', '-XX:ActiveProcessorCount=2']

def run(name, args):
    print(name, flush=True)
    logfile = OUT / (name + '.log')
    with logfile.open('w') as f:
        result = subprocess.run([str(x) for x in args], stdout=f, stderr=subprocess.STDOUT)
    if name.startswith('jtreg-') or result.returncode:
        print(logfile.read_text()[-12000:], flush=True)
    if result.returncode:
        raise RuntimeError(name)

def static():
    archive = ROOT / 'build/review/images/static-libs/lib/libzlibng.a'
    assert archive.is_file(), archive
    symbols = subprocess.check_output(['nm', '--defined-only', str(archive)], text=True)
    for symbol in ['jdk_ng_deflate', 'jdk_ng_inflate', 'jdk_ng_adler32', 'jdk_ng_crc32']:
        assert any(line.endswith(' ' + symbol) for line in symbols.splitlines()), symbol
    metadata = ROOT / 'build/review/support/modules_static-libs/java.base/module-included-libs.txt'
    assert 'zlibng' in metadata.read_text().split(), metadata
    flags = ROOT / 'build/review/support/native/java.base/libzip/static/libzip.a.lib-flags.txt'
    assert 'zlib-ng' not in flags.read_text(), flags.read_text()
    if sys.argv[2] == 'bundled':
        jli = ROOT / 'build/review/images/static-libs/lib/libjli.a'
        symbols = subprocess.check_output(['nm', '--defined-only', str(jli)], text=True)
        assert any(line.endswith(' inflate') for line in symbols.splitlines())
    run('static-version', [STATIC / 'bin/java', '-version'])
    classes = ROOT / 'validation/static-classes'
    classes.mkdir(exist_ok=True)
    names = ['TestZlibNG.java', 'TestAdler32Paths.java', 'TestZlibNGAdler32.java', 'TestFpRegsABI.java']
    run('static-compile', [NEW / 'bin/javac', '-d', classes, *[ZIP / n for n in names]])
    for tier, flags in TIERS.items():
        for cls in ['TestZlibNG', 'compiler.intrinsics.zip.TestAdler32Paths',
                    'TestZlibNGAdler32', 'compiler.intrinsics.zip.TestFpRegsABI']:
            run('static-' + tier + '-' + cls, [STATIC / 'bin/java', *BASE, *flags,
                '-Xmx128m', '-cp', classes, cls])
    run('static-jni', [STATIC / 'bin/java', *BASE, '-Xcheck:jni', '-XX:-UseZipIntrinsics',
        '-XX:-UseAdler32Intrinsics', '-Xmx128m', '-cp', classes, 'TestZlibNG'])
    (OUT / 'static-passed.txt').write_text('Static launcher, exported archive and all-tier ZIP/checksum tests passed\n')

def debug():
    shutil.copytree(NEW, DEBUG)
    shutil.copy2(ROOT / 'build/review-debug/support/modules_libs/java.base/server/libjvm.so',
                 DEBUG / 'lib/server/libjvm.so')

def tests():
    jtreg = next((ROOT / 'jtreg/installed').rglob('jtreg.jar'))
    names = ['TestAdler32Paths.java', 'TestZlibNGAdler32.java', 'TestFpRegsABI.java',
             'TestZlibNGCRC32.java', 'TestCRC32.java', 'TestCRC32C.java',
             'TestZlibNG.java', 'TestZlibNGSmallStreams.java', 'TestZlibNGAOT.java']
    for kind, jdk in [('release', NEW), ('debug', DEBUG)]:
        run('jtreg-' + kind, [jdk / 'bin/java', '-XX:ActiveProcessorCount=2', '-jar', jtreg,
            '-jdk:' + str(jdk), '-conc:2', '-timeoutFactor:4', '-verbose:fail,error,summary',
            '-w:' + str(OUT / ('work-' + kind)), '-r:' + str(OUT / ('report-' + kind)),
            *[ZIP / name for name in names],
            ROOT / 'test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeCPUFeatureIncompatibilityTest.java'])
    run('jtreg-zip', [NEW / 'bin/java', '-XX:ActiveProcessorCount=2', '-jar', jtreg,
        '-jdk:' + str(NEW), '-conc:2', '-timeoutFactor:4', '-verbose:fail,error,summary',
        '-w:' + str(OUT / 'work-zip'), '-r:' + str(OUT / 'report-zip'),
        ROOT / 'test/jdk/java/util/zip', ROOT / 'test/jdk/jdk/nio/zipfs'])
    classes = ROOT / 'validation/static-classes'
    modes = ['default', 'avx0', 'avx1'] if os.uname().machine == 'x86_64' else ['default']
    for tier, flags in TIERS.items():
        for gc in ['Serial', 'G1', 'Z']:
            for mode in modes:
                extra = [] if mode == 'default' else ['-XX:UseAVX=' + mode[-1]]
                for cls in ['TestZlibNGAdler32', 'compiler.intrinsics.zip.TestFpRegsABI']:
                    run('gc-' + tier + '-' + gc + '-' + mode + '-' + cls,
                        [DEBUG / 'bin/java', *BASE, *flags, *extra, '-Xmx128m',
                         '-XX:+Use' + gc + 'GC', '-XX:+VerifyOops', '-cp', classes, cls])
    (OUT / 'qualification-passed.txt').write_text('Release/debug jtreg, ZIP/zipfs, Serial/G1/Z and register tests passed\n')

def bench():
    old_bundle = next((ROOT / 'validation/old').glob('jdk-*.tar.gz'))
    unpack = ROOT / 'validation/unpacked'
    unpack.mkdir(exist_ok=True)
    subprocess.run(['tar', '-xf', str(old_bundle), '-C', str(unpack)], check=True)
    shutil.move(str(next(unpack.rglob('release')).parent), OLD)
    jars = ROOT / 'validation/jmh'
    jars.mkdir(exist_ok=True)
    for path in ['org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
                 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
                 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
                 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar']:
        urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + path, jars / Path(path).name)
    classes = ROOT / 'validation/bench-classes'
    classes.mkdir(exist_ok=True)
    cp = os.pathsep.join(str(p) for p in jars.glob('*.jar'))
    run('compile-jmh', [NEW / 'bin/javac', '-proc:full', '-cp', cp, '-d', classes,
        ROOT / 'test/micro/org/openjdk/bench/java/util/zip/ChecksumPaths.java'])
    cp += os.pathsep + str(classes)
    os.sched_setaffinity(0, {max(os.sched_getaffinity(0))})
    for order in range(2):
        routes = [('old', OLD, []), ('default', NEW, []),
                  ('jni', NEW, ['-XX:-UseAdler32Intrinsics'])]
        if order:
            routes.reverse()
        for route, jdk, extra in routes:
            name = 'adler-c1-' + route + '-' + str(order)
            run(name, [NEW / 'bin/java', '-cp', cp, 'org.openjdk.jmh.Main',
                'ChecksumPaths.adler(Heap|Direct)', '-p',
                'size=1,64,1024,16384,32768,65535,65536,65537,131072,1048576',
                '-f', '3', '-wi', '3', '-w', '500ms', '-i', '5', '-r', '500ms',
                '-jvm', jdk / 'bin/java', '-jvmArgsAppend', ' '.join(BASE + TIERS['c1'] + extra),
                '-foe', 'true', '-rf', 'json', '-rff', OUT / (name + '.json')])
            for row in json.loads((OUT / (name + '.json')).read_text()):
                metric = row['primaryMetric']
                print('REVIEW_SCORE', json.dumps({'route': name,
                    'method': row['benchmark'].split('.')[-1], 'size': row['params']['size'],
                    'ns': metric['score'], 'error': metric['scoreError'],
                    'raw': metric['rawData']}), flush=True)

{'static': static, 'debug': debug, 'tests': tests, 'bench': bench}[sys.argv[1]]()
