#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
"""Measure integer integration with matched flag controls on a native JDK."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shlex
import subprocess
import threading
import time
import urllib.request


DEPENDENCIES = {
    'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar':
        'dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3',
    'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar':
        '6a5604b5b804e0daca1145df1077609321687734a8b49387e49f10557c186c77',
    'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar':
        'df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28',
    'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar':
        '1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308',
}
EXPORT = '--add-exports=java.base/jdk.internal.util=ALL-UNNAMED'
BENCHMARK = 'org.openjdk.bench.java.lang.DecimalIntegerConversion'


def sha256(path):
    with path.open('rb') as source:
        return hashlib.file_digest(source, 'sha256').hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('jdk', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--pairs', type=int, default=3)
    parser.add_argument('--tiers', default='interpreter,utf16,c1,tiered,c2')
    parser.add_argument('--sizes', default='tiny,short,wide,mixed')
    parser.add_argument('--duration', default='500ms')
    parser.add_argument('--jtreg', type=Path, help='run focused jtreg checks before timing')
    parser.add_argument('--checks-only', action='store_true',
                        help='verify enabled defaults and run correctness checks without timing')
    args = parser.parse_args()
    if args.pairs < 1:
        parser.error('--pairs must be positive')
    if args.checks_only and not args.jtreg:
        parser.error('--checks-only requires --jtreg')
    tiers = args.tiers.split(',')
    sizes = args.sizes.split(',')
    if set(tiers) - {'interpreter', 'utf16', 'c1', 'tiered', 'c2'}:
        parser.error('unknown execution tier')
    if set(sizes) - {'tiny', 'short', 'wide', 'mixed'}:
        parser.error('unknown input size')

    root = Path(__file__).resolve().parents[2]
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    jdk = args.jdk.resolve()
    suffix = '.exe' if os.name == 'nt' else ''
    java = str(jdk / ('bin/java' + suffix))
    javac = str(jdk / ('bin/javac' + suffix))
    records = []

    def run(command, name, timeout=1800):
        print(name, shlex.join(command), flush=True)
        started = time.monotonic()
        with (output / (name + '.log')).open('w', encoding='utf-8') as log:
            result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT,
                                    timeout=timeout)
        records.append({'command': command, 'name': name, 'exit': result.returncode,
                        'seconds': time.monotonic() - started})
        (output / 'commands.json').write_text(json.dumps(records, indent=2) + '\n')
        if result.returncode:
            print((output / (name + '.log')).read_text(errors='replace')[-8000:], flush=True)
            raise SystemExit(f'{name} failed: {result.returncode}')

    resources = {'platform': platform.platform(), 'machine': platform.machine(),
                 'cpu_count': os.cpu_count()}
    prefix = []
    if hasattr(os, 'sched_getaffinity'):
        affinity = sorted(os.sched_getaffinity(0))
        resources['affinity'] = affinity
        prefix = ['taskset', '-c', str(max(affinity))]
    elif os.name == 'nt':
        import ctypes
        from ctypes import wintypes
        kernel = ctypes.WinDLL('kernel32', use_last_error=True)
        kernel.GetCurrentProcess.restype = wintypes.HANDLE
        kernel.GetProcessAffinityMask.argtypes = [wintypes.HANDLE,
                                                  ctypes.POINTER(ctypes.c_size_t),
                                                  ctypes.POINTER(ctypes.c_size_t)]
        kernel.SetProcessAffinityMask.argtypes = [wintypes.HANDLE, ctypes.c_size_t]
        process = kernel.GetCurrentProcess()
        process_mask, system_mask = ctypes.c_size_t(), ctypes.c_size_t()
        if not kernel.GetProcessAffinityMask(process, ctypes.byref(process_mask),
                                             ctypes.byref(system_mask)):
            raise ctypes.WinError(ctypes.get_last_error())
        resources['affinity_mask'] = process_mask.value
        resources['system_affinity_mask'] = system_mask.value
        # Child JVMs inherit this process's affinity, like taskset on Linux.
        selected_mask = 1 << (process_mask.value.bit_length() - 1)
        if not kernel.SetProcessAffinityMask(process, selected_mask):
            raise ctypes.WinError(ctypes.get_last_error())
        resources['measurement_affinity_mask'] = selected_mask
    else:
        resources['affinity'] = 'OS does not expose CPU pinning'
    if os.name != 'nt':
        import resource
        resources['process_limit'] = resource.getrlimit(resource.RLIMIT_NPROC)
        resources['file_limit'] = resource.getrlimit(resource.RLIMIT_NOFILE)
    for name in ['cpu.max', 'memory.max', 'pids.max', 'pids.current']:
        path = Path('/sys/fs/cgroup') / name
        if path.is_file():
            resources[name] = path.read_text().strip()
    (output / 'resources.json').write_text(json.dumps(resources, indent=2) + '\n')
    gate = threading.Event()
    threads = []
    try:
        for _ in range(4):
            thread = threading.Thread(target=gate.wait)
            thread.start()
            threads.append(thread)
    finally:
        gate.set()
        for thread in threads:
            thread.join()
    run([java, '-XX:ActiveProcessorCount=2', '-XX:+UseSerialGC', '-version'], 'startup', 30)
    if platform.system() == 'Darwin':
        cpu_command = ['sysctl', 'hw.model', 'hw.ncpu', 'hw.physicalcpu',
                       'hw.logicalcpu', 'hw.memsize']
    elif os.name == 'nt':
        cpu_command = ['pwsh', '-NoProfile', '-Command',
                       'Get-CimInstance Win32_Processor | '
                       'Select-Object Name,NumberOfCores,NumberOfLogicalProcessors | '
                       'ConvertTo-Json']
    else:
        cpu_command = ['lscpu']
    run(cpu_command, 'cpu', 30)
    run([java, '-XX:ActiveProcessorCount=2', '-XX:+PrintFlagsFinal', '-version'], 'flags', 30)
    run(['git', '-C', str(root), 'rev-parse', 'HEAD'], 'source-revision', 30)
    inputs = [root / 'test/micro/org/openjdk/bench/java/lang/DecimalIntegerConversion.java',
              root / 'src/hotspot/share/runtime/globals.hpp',
              root / 'src/hotspot/cpu/aarch64/templateInterpreterGenerator_aarch64.cpp',
              root / 'src/hotspot/cpu/x86/templateInterpreterGenerator_x86_64.cpp',
              jdk / 'lib/modules']
    jvm_library = {'Darwin': 'lib/server/libjvm.dylib',
                   'Windows': 'bin/server/jvm.dll'}.get(platform.system(),
                                                       'lib/server/libjvm.so')
    inputs.append(jdk / jvm_library)
    (output / 'sha256.json').write_text(json.dumps(
        {str(path): sha256(path) for path in inputs}, indent=2) + '\n')
    (output / 'release').write_bytes((args.jdk / 'release').read_bytes())
    for name in ['resources.json', 'sha256.json', 'release', 'startup.log',
                 'cpu.log', 'flags.log', 'source-revision.log']:
        print('JDK_EVIDENCE ' + json.dumps({'name': name,
              'content': (output / name).read_text()}), flush=True)

    deps = output / 'dependencies'
    deps.mkdir(exist_ok=True)
    for relative, expected in (DEPENDENCIES.items() if not args.checks_only else []):
        jar = deps / Path(relative).name
        if not jar.exists():
            with urllib.request.urlopen('https://repo.maven.apache.org/maven2/' + relative,
                                        timeout=60) as response:
                jar.write_bytes(response.read())
        if sha256(jar) != expected:
            raise SystemExit(f'JMH dependency checksum mismatch: {jar.name}')
    classes = output / 'classes'
    classes.mkdir(exist_ok=True)
    classpath = os.pathsep.join(str(path) for path in sorted(deps.glob('*.jar')))
    common = ['-Xms256m', '-Xmx256m', '-Xshare:off', '-XX:ActiveProcessorCount=2',
              '-XX:+UseG1GC', '-XX:+UnlockExperimentalVMOptions',
              '-XX:+UseFourByteObjectHeaders', EXPORT]
    if not args.checks_only:
        run([javac, EXPORT, '-cp', classpath, '-processorpath', classpath,
             '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', str(classes),
             str(inputs[0])], 'compile-benchmark', 120)
    run([javac, EXPORT, '-d', str(classes),
         str(root / 'test/jdk/jdk/internal/util/DecimalDigits/TestDecimalIntegers.java')],
        'compile-checks', 120)
    for compact in [True, False]:
        if args.checks_only:
            flags = [] if compact else ['-XX:-CompactStrings']
            name = f'defaults-compact-{compact}'
            run([java] + common + ['-Xint', '-XX:+PrintFlagsFinal'] + flags
                + ['-cp', str(classes), 'TestDecimalIntegers'], name, 180)
            log = (output / (name + '.log')).read_text(errors='replace')
            for flag in ['UseFastIntegerIntrinsics', 'UseZmijIntegerIntrinsics']:
                if not re.search(r'\b' + flag + r'\s*=\s*true\b[^\n]*\{default\}', log):
                    raise SystemExit(f'{flag} is not enabled by default in {name}')
            print('JDK_EVIDENCE ' + json.dumps({'name': name + '.log',
                  'content': log}), flush=True)
        for native in [False, True]:
            flags = [f'-XX:{"+" if native else "-"}UseFastIntegerIntrinsics',
                     f'-XX:{"+" if native else "-"}UseZmijIntegerIntrinsics']
            if not compact:
                flags.append('-XX:-CompactStrings')
            run([java] + common + ['-Xint'] + flags + ['-cp', str(classes),
                'TestDecimalIntegers'], f'checks-compact-{compact}-native-{native}', 180)
            print((output / f'checks-compact-{compact}-native-{native}.log').read_text(),
                  flush=True)

    if args.jtreg:
        tests = ['test/jdk/jdk/internal/util/DecimalDigits/TestDecimalIntegers.java',
                 'test/jdk/jdk/internal/math/ToDecimal/TestZmij.java',
                 'test/hotspot/jtreg/compiler/intrinsics/decimalinteger/'
                 'TestDecimalIntegerIntrinsics.java']
        try:
            run([java] + common + ['-jar', str(args.jtreg.resolve() / 'lib/jtreg.jar'),
                '-jdk:' + str(jdk), '-conc:1', '-timeoutFactor:4',
                '-vmoption:-XX:ActiveProcessorCount=2',
                '-vmoption:-XX:+UnlockExperimentalVMOptions',
                '-vmoption:-XX:+UseFourByteObjectHeaders',
                '-w:' + str(output / 'jtreg-work'), '-r:' + str(output / 'jtreg-report')]
                + [str(root / test) for test in tests], 'focused-jtreg', 1200)
        finally:
            for path in sorted((output / 'jtreg-work').rglob('*.jtr')):
                print('JDK_EVIDENCE ' + json.dumps({
                      'name': path.relative_to(output).as_posix(),
                      'content': path.read_text(errors='replace')}), flush=True)
        print((output / 'focused-jtreg.log').read_text(errors='replace'), flush=True)

    if args.checks_only:
        print('JDK_EVIDENCE ' + json.dumps({'name': 'commands.json',
              'content': (output / 'commands.json').read_text()}), flush=True)
        return

    profiles = {
        'interpreter': (['-Xint'], BENCHMARK, sizes),
        'utf16': (['-Xint', '-XX:-CompactStrings'], BENCHMARK + '.parse.*', sizes),
        'c1': (['-Xbatch', '-XX:TieredStopAtLevel=1'],
               BENCHMARK + '.(parseInt|parseLong|intString|longAppend)$', sizes[-1:]),
        'tiered': ([], BENCHMARK + '.(parseInt|parseLong|intString|longAppend)$', sizes[-1:]),
        'c2': (['-Xbatch', '-XX:-TieredCompilation'],
               BENCHMARK + '.(parseInt|parseLong|intString|longAppend)$', sizes[-1:]),
    }
    for pair in range(args.pairs):
        for tier in tiers:
            tier_flags, pattern, datasets = profiles[tier]
            for native in ([False, True] if pair % 2 == 0 else [True, False]):
                name = f'{tier}-pair-{pair}-native-{native}'
                flags = common + tier_flags + [
                    f'-XX:{"+" if native else "-"}UseFastIntegerIntrinsics',
                    f'-XX:{"+" if native else "-"}UseZmijIntegerIntrinsics']
                run(prefix + [java, '-XX:ActiveProcessorCount=2',
                     '-cp', str(classes) + os.pathsep + classpath,
                     'org.openjdk.jmh.Main', pattern, '-p', 'size=' + ','.join(datasets),
                     '-jvm', java, '-jvmArgsAppend', shlex.join(flags), '-f', '1', '-t', '1',
                     '-wi', '3', '-i', '3', '-w', args.duration, '-r', args.duration,
                     '-prof', 'gc', '-foe', 'true', '-rf', 'json', '-rff',
                     str(output / (name + '.json'))], name)
                for record in json.loads((output / (name + '.json')).read_text()):
                    print('JMH_RESULT ' + json.dumps({'sample': name, 'data': record}),
                          flush=True)
    print('JDK_EVIDENCE ' + json.dumps({'name': 'commands.json',
          'content': (output / 'commands.json').read_text()}), flush=True)


if __name__ == '__main__':
    main()
