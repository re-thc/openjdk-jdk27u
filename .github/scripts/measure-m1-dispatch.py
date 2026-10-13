#!/usr/bin/env python3
"""Measure the selected paths against JNI in the same qualified image."""
import ctypes
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import urllib.request

root = Path.cwd()
results = root / 'qualification' / 'benchmarks'
results.mkdir(parents=True, exist_ok=True)
jdk = Path(sys.argv[1]).resolve()
java = jdk / 'bin' / ('java.exe' if os.name == 'nt' else 'java')
javac = jdk / 'bin' / ('javac.exe' if os.name == 'nt' else 'javac')
if os.name == 'nt':
    kernel = ctypes.windll.kernel32
    kernel.GetCurrentProcess.restype = ctypes.c_void_p
    process = kernel.GetCurrentProcess()
    allowed = ctypes.c_size_t()
    system = ctypes.c_size_t()
    kernel.GetProcessAffinityMask(ctypes.c_void_p(process), ctypes.byref(allowed), ctypes.byref(system))
    chosen = allowed.value & -allowed.value
    if chosen and not kernel.SetProcessAffinityMask(ctypes.c_void_p(process), ctypes.c_size_t(chosen)):
        raise RuntimeError('Cannot pin benchmark process')
    cpu = subprocess.check_output(['powershell', '-NoProfile', '-Command',
        'Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | ConvertTo-Json'], text=True)
else:
    cpu = subprocess.check_output(['sysctl', '-n', 'machdep.cpu.brand_string', 'hw.model', 'hw.ncpu'], text=True)
(results / 'cpu.txt').write_text(cpu)
(results / 'source.txt').write_text(subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True))
jars = root / 'qualification' / 'jmh'
jars.mkdir(exist_ok=True)
dependencies = {
    'jmh-core.jar': 'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
    'jmh-generator.jar': 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
    'jopt-simple.jar': 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
    'commons-math3.jar': 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar',
}
manifest = {}
for name, location in dependencies.items():
    target = jars / name
    urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + location, target)
    manifest[name] = hashlib.sha256(target.read_bytes()).hexdigest()
(results / 'dependencies.json').write_text(json.dumps(manifest, indent=2))
classes = root / 'qualification' / 'classes'
classes.mkdir(exist_ok=True)
classpath = os.pathsep.join(str(jars / name) for name in dependencies)
source = root / 'test/micro/org/openjdk/bench/java/util/zip'
subprocess.run([str(javac), '-cp', classpath, '-processorpath', classpath,
    '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', str(classes),
    *[str(source / (name + '.java')) for name in ('ChecksumPaths', 'ZipBackend', 'ZipBufferCalls', 'ZipStreamCalls')]], check=True)
classpath = str(classes) + os.pathsep + classpath
tiers = {'interpreter': ['-Xint'], 'c1': ['-XX:TieredStopAtLevel=1'], 'c2': ['-XX:-TieredCompilation']}
paths = {
    'selected': [],
    'jni': ['-XX:-UseZipIntrinsics', '-XX:+UnlockDiagnosticVMOptions',
            '-XX:-UseAdler32Intrinsics', '-XX:-UseCRC32Intrinsics'],
}
cases = {
    'checksum': ('ChecksumPaths.(adlerHeap|adlerDirect|crc32Heap|crc32Direct)', ['-p', 'size=64,1024,4096,65536,1048576']),
    'scalar': ('ChecksumPaths.adlerByte', []),
}

images = {'selected': jdk, 'jni': jdk}
commands = []
for batch, order in enumerate((list(paths), list(reversed(paths)))):
    for tier, tier_args in tiers.items():
        for path in order:
            path_args = paths[path]
            image_java = images[path] / 'bin' / ('java.exe' if os.name == 'nt' else 'java')
            for case, (pattern, parameters) in cases.items():
                output = results / (str(batch) + '-' + tier + '-' + path + '-' + case + '.json')
                vm_args = ['-Xshare:off', '-Xms256m', '-Xmx256m', '-XX:+UseSerialGC',
                           '-XX:ActiveProcessorCount=2', '-Xbatch', *tier_args, *path_args]
                command = [str(image_java), '-cp', classpath, 'org.openjdk.jmh.Main', pattern,
                    '-f', '3', '-wi', '3', '-w', '300ms', '-i', '5', '-r', '300ms',
                    '-t', '1', '-jvmArgs', ' '.join(vm_args), '-rf', 'json', '-rff', str(output),
                    *parameters]
                commands.append(command)
                with output.with_suffix('.log').open('w') as log:
                    subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
                data = json.loads(output.read_text())
                if not data:
                    raise RuntimeError('No JMH results in ' + str(output))
                for row in data:
                    metric = row['primaryMetric']
                    print('SCORE ' + json.dumps({'batch': batch, 'tier': tier, 'route': path,
                        'method': row['benchmark'], 'params': row.get('params', {}),
                        'score': metric['score'], 'error': metric['scoreError'],
                        'raw': metric['rawData']}), flush=True)
(results / 'commands.json').write_text(json.dumps(commands, indent=2))
