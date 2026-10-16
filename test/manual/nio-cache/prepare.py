# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Freeze locally built inputs; no compilation, download or JVM launch."""
import argparse
import json
import os
from pathlib import Path
from diagnostic import ROOT, digest, save


def prepare(jdk, classes, jars):
    jdk, classes, jars = (Path(x).resolve(strict=True) for x in (jdk, classes, jars))
    java = jdk / 'bin/java'
    if not java.is_file():
        raise ValueError('JDK bin/java required')
    for resource in ('META-INF/BenchmarkList', 'META-INF/CompilerHints'):
        if not (classes / resource).is_file():
            raise ValueError('annotation-processed JMH classes required')
    jar_names = ('commons-math3-3.6.1.jar', 'jopt-simple-5.0.4.jar',
                 'jmh-core-1.37.jar', 'jmh-generator-annprocess-1.37.jar')
    jar_paths = [jars / name for name in jar_names]
    if not all(p.is_file() for p in jar_paths):
        raise ValueError('repository recipe JMH 1.37 jars required')
    # -jvmArgs is split by JMH; reject paths whose quoting would be ambiguous.
    if any(any(c.isspace() for c in str(p)) for p in (ROOT, jdk, classes, jars)):
        raise ValueError('use paths without whitespace')
    if (ROOT / 'run').exists() or (ROOT / 'freeze.json').exists():
        raise ValueError('use a fresh checkout for each approved observation')
    out = ROOT / 'run'
    common = ['-Xms32m', '-Xmx256m', '-Xss512k', '-XX:ActiveProcessorCount=4',
              '-XX:CICompilerCount=2', '-XX:ParallelGCThreads=2', '-XX:ConcGCThreads=1',
              '-XX:+UseG1GC', '-Xshare:off', '--add-exports=java.base/sun.nio.ch=ALL-UNNAMED',
              '-XX:NativeMemoryTracking=off', '-XX:+UnlockDiagnosticVMOptions',
              '-XX:+LogCompilation', '-XX:LogFile=' + str(out / 'hotspot_%p.xml'),
              '-Xlog:gc*=info,safepoint=info:file=' + str(out / 'gc_%p.log') + ':uptimemillis,tags,level:filecount=0',
              '-Djmh.blackhole.autoDetect=false', '-Djmh.compilerhints.mode=FORCE_ON',
              '--sun-misc-unsafe-memory-access=allow']
    command = ['taskset', '-c', '0,1,2,3', str(java), '--sun-misc-unsafe-memory-access=allow',
               '-Xmx128m', '-XX:ActiveProcessorCount=1', '-Djava.home=' + str(jdk),
               '-Djmh.blackhole.autoDetect=false', '-Djmh.compilerhints.mode=FORCE_ON',
               '-cp', ':'.join(map(str, [classes] + jar_paths)), 'org.openjdk.jmh.Main',
               '^org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit$', '-f', '1', '-wf', '0',
               '-t', '1', '-wi', '5', '-i', '7', '-w', '1s', '-r', '1s', '-wbs', '1',
               '-bs', '1', '-bm', 'avgt', '-tu', 'ns', '-foe', 'true', '-rf', 'json',
               '-rff', str(out / 'result.json'), '-jvm', str(java), '-jvmArgs', ' '.join(common)]
    save(ROOT / 'command.json', command)
    directories = [str(jdk), str(classes), str(jars)]
    paths = [p for directory in directories for p in Path(directory).rglob('*') if p.is_file()]
    paths += [p for p in ROOT.iterdir() if p.suffix in ('.java', '.py', '.md') or p.name == 'command.json']
    files = {str(p): digest(p) for p in paths}
    save(ROOT / 'freeze.json', {'files': files, 'directories': directories,
         'environment': {'PATH': os.environ.get('PATH', os.defpath), 'LANG': 'C', 'LC_ALL': 'C'},
         'cpu_max': Path('/sys/fs/cgroup/cpu.max').read_text(),
         'benchmark_source_sha256': digest(ROOT / 'NioCachePaths.java')})


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk', required=True)
    parser.add_argument('--classes', required=True)
    parser.add_argument('--jars', required=True)
    args = parser.parse_args()
    prepare(args.jdk, args.classes, args.jars)
