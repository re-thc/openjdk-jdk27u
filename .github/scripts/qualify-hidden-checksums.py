#!/usr/bin/env python3
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tarfile
import urllib.request

p = argparse.ArgumentParser()
p.add_argument('--bundles', type=Path, required=True)
p.add_argument('--bootjdk', type=Path, required=True)
args = p.parse_args()
root = Path.cwd()
out = root / 'qualification'
out.mkdir(exist_ok=True)
for path in args.bundles.rglob('*.tar.gz'):
    with tarfile.open(path) as archive:
        java = next((m.name for m in archive.getmembers() if m.name.endswith('/bin/javac')), None)
        if java:
            target = root / 'work/runtime'
            archive.extractall(target, filter='data')
            jdk = target / Path(java).parent.parent
            break
else:
    raise RuntimeError('No JDK image in the bundles')
if hasattr(os, 'sched_getaffinity'):
    os.sched_setaffinity(0, {min(os.sched_getaffinity(0))})
(out / 'cpu.txt').write_text(subprocess.check_output(['lscpu'], text=True))
(out / 'source.txt').write_text(subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True))
with (out / 'vm.txt').open('w') as log:
    subprocess.run([str(jdk / 'bin/java'), '-Xlog:os+cpu=info', '-version'],
                   stdout=log, stderr=subprocess.STDOUT, check=True)
base_src = root / 'work/patch-source'
base = out / 'base'
sources = []
for name in ('java/util/zip/CRC32.java', 'jdk/internal/access/SharedSecrets.java',
             'jdk/internal/access/JavaUtilZipAccess.java'):
    target = base_src / name
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(root / 'src/java.base/share/classes' / name, target)
    sources.append(str(target))
subprocess.run([str(jdk / 'bin/javac'), '--patch-module', 'java.base=' + str(base_src),
                '-d', str(base), *sources], check=True)
security = out / 'security'
security_src = root / 'work/security-source'
security_file = security_src / 'sun/security/krb5/internal/crypto/crc32.java'
security_file.parent.mkdir(parents=True, exist_ok=True)
shutil.copy2(root / 'src/java.security.jgss/share/classes/sun/security/krb5/internal/crypto/crc32.java',
             security_file)
exports = ['--add-exports=java.base/jdk.internal.access=java.security.jgss',
           '--add-exports=java.security.jgss/sun.security.krb5.internal.crypto=ALL-UNNAMED']
base_args = ['--patch-module', 'java.base=' + str(base)]
subprocess.run([str(jdk / 'bin/javac'), *base_args, *exports,
    '--patch-module', 'java.security.jgss=' + str(security_src),
    '-d', str(security), str(security_file)], check=True)
patch_args = [*base_args, '--patch-module', 'java.security.jgss=' + str(security), *exports]
classes = out / 'classes'
classes.mkdir(exist_ok=True)
subprocess.run([str(jdk / 'bin/javac'), *patch_args, '-d', str(classes),
               'test/jdk/sun/security/krb5/RawCRC32.java'], check=True)
for flags in (['-Xint'], ['-XX:TieredStopAtLevel=1', '-Xbatch'],
              ['-XX:-TieredCompilation', '-Xbatch'],
              ['-XX:+UnlockDiagnosticVMOptions', '-XX:-UseCRC32Intrinsics']):
    subprocess.run([str(jdk / 'bin/java'), '-Xshare:off', *patch_args, *flags,
                    '-cp', str(classes), 'RawCRC32'], check=True)
# The full bootstrap image provides java.desktop for the PNG client tests.
desktop = out / 'desktop'
desktop_src = root / 'work/desktop-source'
desktop_file = desktop_src / 'com/sun/imageio/plugins/png/PNGImageWriter.java'
desktop_file.parent.mkdir(parents=True, exist_ok=True)
shutil.copy2(root / 'src/java.desktop/share/classes/com/sun/imageio/plugins/png/PNGImageWriter.java',
             desktop_file)
subprocess.run([str(args.bootjdk / 'bin/javac'), '--patch-module',
    'java.desktop=' + str(desktop_src), '-d', str(desktop),
    str(desktop_file)], check=True)
subprocess.run([str(args.bootjdk / 'bin/javac'), '-d', str(classes),
    'test/jdk/javax/imageio/plugins/png/PNGChunkCRC32.java'], check=True)
for flags in (['-Xint'], ['-XX:TieredStopAtLevel=1'], ['-XX:-TieredCompilation']):
    subprocess.run([str(args.bootjdk / 'bin/java'), '--patch-module', 'java.desktop=' + str(desktop),
        '-Djava.awt.headless=true', *flags, '-cp', str(classes), 'PNGChunkCRC32'], check=True)
jars = out / 'jmh'
jars.mkdir(exist_ok=True)
dependencies = {
    'jmh-core.jar': 'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
    'jmh-generator.jar': 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
    'jopt-simple.jar': 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
    'commons-math3.jar': 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar',
}
manifest = {}
for name, location in dependencies.items():
    path = jars / name
    urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + location, path)
    manifest[name] = hashlib.sha256(path.read_bytes()).hexdigest()
(out / 'dependencies.json').write_text(json.dumps(manifest, indent=2))
cp = os.pathsep.join(str(jars / name) for name in dependencies)
subprocess.run([str(jdk / 'bin/javac'), *patch_args, '-cp', cp, '-processorpath', cp,
    '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', str(classes),
    '.github/scripts/HiddenChecksums.java'], check=True)
cp = str(classes) + os.pathsep + cp
tiers = {'interpreter': ['-Xint'], 'c1': ['-XX:TieredStopAtLevel=1'], 'c2': ['-XX:-TieredCompilation']}
routes = {'selected': [], 'jni': ['-XX:+UnlockDiagnosticVMOptions', '-XX:-UseCRC32Intrinsics']}
commands = []
for batch, order in enumerate((list(routes), list(reversed(routes)))):
    for tier, flags in tiers.items():
        for route in order:
            for case, pattern, size in (
                    ('bulk', 'HiddenChecksums.(pngOld|pngNew|rawOld|rawNew)', '16,32,64,1024,65536'),
                    ('scalar', 'HiddenChecksums.(pngScalarOld|pngScalarNew)', '1')):
                output = out / (str(batch) + '-' + tier + '-' + route + '-' + case + '.json')
                vm = ['-Xshare:off', '-Xms256m', '-Xmx256m', '-XX:+UseSerialGC',
                      '-XX:ActiveProcessorCount=2', '-Xbatch', *patch_args, *flags, *routes[route]]
                command = [str(jdk / 'bin/java'), *patch_args, '-cp', cp, 'org.openjdk.jmh.Main',
                    pattern, '-p', 'size=' + size, '-f', '3', '-wi', '3', '-w', '300ms',
                    '-i', '5', '-r', '300ms', '-t', '1', '-jvmArgs', ' '.join(vm),
                    '-rf', 'json', '-rff', str(output)]
                commands.append(command)
                with output.with_suffix('.log').open('w') as log:
                    subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
                rows = json.loads(output.read_text())
                if not rows:
                    raise RuntimeError('Missing JMH measurements')
                for row in rows:
                    metric = row['primaryMetric']
                    print('SCORE ' + json.dumps({'batch': batch, 'tier': tier, 'route': route,
                        'method': row['benchmark'], 'params': row.get('params', {}),
                        'score': metric['score'], 'error': metric['scoreError'],
                        'raw': metric['rawData']}), flush=True)
(out / 'commands.json').write_text(json.dumps(commands, indent=2))
