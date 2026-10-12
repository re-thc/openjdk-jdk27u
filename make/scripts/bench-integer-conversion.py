#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
"""Compare decimal integers using alternating JDK forks and allocation profiling."""
import argparse
import glob
import hashlib
import json
import os
from pathlib import Path
import shlex
import subprocess

TIERS = {
    'interpreter': ['-Xint'],
    'c1': ['-Xbatch', '-XX:TieredStopAtLevel=1'],
    'c2': ['-Xbatch', '-XX:-TieredCompilation'],
}

def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('original', type=Path)
parser.add_argument('head', type=Path)
parser.add_argument('jmh_classpath')
parser.add_argument('output', type=Path)
parser.add_argument('--original-commit', required=True)
parser.add_argument('--head-commit', required=True)
parser.add_argument('--tiers', choices=TIERS, nargs='+', default=list(TIERS))
parser.add_argument('--variants', choices=['original', 'default', 'optout'], nargs='+',
                    default=['original', 'default', 'optout'])
parser.add_argument('--sizes', choices=['short', 'wide', 'mixed', *('d' + str(n) for n in range(4, 20))], nargs='+', default=['short', 'wide'])
parser.add_argument('--benchmarks', default='org.openjdk.bench.java.lang.DecimalIntegerConversion.*')
parser.add_argument('--cpu', type=int, default=1)
parser.add_argument('--rounds', type=int, default=3)
parser.add_argument('--duration', default='500ms', help='duration of each qualification warmup/measurement')
parser.add_argument('--screen', action='store_true', help='short prototype screen, not qualification')
parser.add_argument('--no-compact-strings', action='store_true', help='measure native-endian UTF16 String inputs')
args = parser.parse_args()
if args.rounds < 3 and not args.screen:
    parser.error('qualification requires at least three alternating rounds')
os.sched_setaffinity(0, {args.cpu})
root = Path(__file__).resolve().parents[2]
output = args.output.resolve()
output.mkdir(parents=True, exist_ok=False)
classes = output / 'classes'
classes.mkdir()
source = root / 'test/micro/org/openjdk/bench/java/lang/DecimalIntegerConversion.java'
jars = []
for entry in args.jmh_classpath.split(os.pathsep):
    jars.extend(glob.glob(entry) if '*' in entry else [entry])
classpath = os.pathsep.join(str(Path(jar).resolve()) for jar in jars)
images = {'original': args.original.resolve(), 'head': args.head.resolve()}
common = ['--add-exports=java.base/jdk.internal.util=ALL-UNNAMED',
          '-Xshare:off', '-Xms256m', '-Xmx256m']
if args.no_compact_strings:
    common.append('-XX:-CompactStrings')
metadata = {
    'source_commits': {'original': args.original_commit, 'head': args.head_commit},
    'screen_only': args.screen, 'cpu': args.cpu, 'tiers': args.tiers, 'sizes': args.sizes,
    'source_sha256': digest(source), 'jmh_sha256': {jar: digest(Path(jar)) for jar in jars},
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'cpu_details': subprocess.check_output(['lscpu'], text=True), 'commands': [], 'images': {},
}
for label, image in images.items():
    metadata['images'][label] = {
        'directory': str(image), 'release': (image / 'release').read_text(),
        'sha256': {name: digest(image / name) for name in
                   ('bin/java', 'bin/javac', 'lib/modules', 'lib/server/libjvm.so', 'lib/libjava.so')},
    }

def run(command, log):
    metadata['commands'].append(command)
    (output / 'environment.json').write_text(json.dumps(metadata, indent=2) + '\n')
    with (output / log).open('w') as stream:
        subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT, check=True)

run([str(images['head'] / 'bin/javac'), common[0], '-cp', classpath,
     '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor',
     '-d', str(classes), str(source)], 'compile.log')
variants = {
    'original': ('original', []), 'default': ('head', []),
    'optout': ('head', ['-XX:-UseFastIntegerIntrinsics', '-XX:-UseZmijIntegerIntrinsics']),
}
for tier in args.tiers:
    for round_number in range(args.rounds):
        names = args.variants
        order = names[round_number % len(names):] + names[:round_number % len(names)]
        for variant in order:
            label, flags = variants[variant]
            image = images[label]
            prefix = f'{tier}-{variant}-{round_number}'
            timing = ['-wi', '1', '-i', '2', '-w', '200ms', '-r', '200ms'] if args.screen else [
                '-wi', '3', '-i', '3', '-w', args.duration, '-r', args.duration]
            run([str(image / 'bin/java'), '-cp', str(classes) + os.pathsep + classpath,
                 'org.openjdk.jmh.Main', args.benchmarks, '-p', 'size=' + ','.join(args.sizes),
                 '-jvm', str(image / 'bin/java'),
                 '-jvmArgsAppend', shlex.join(common + TIERS[tier] + flags),
                 '-f', '1', *timing, '-prof', 'gc', '-foe', 'true',
                 '-rf', 'json', '-rff', str(output / (prefix + '.json'))], prefix + '.log')
print(output)
