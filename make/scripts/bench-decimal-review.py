#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Compare original and current JDKs with alternating forks and GC profiling."""
import argparse
import csv
import glob
import hashlib
import json
import os
from pathlib import Path
import shlex
import subprocess
import sys

TIERS = {
    'interpreter': ['-Xint'],
    'c1': ['-Xbatch', '-XX:TieredStopAtLevel=1'],
    'c2': ['-Xbatch', '-XX:-TieredCompilation'],
}
DEFAULT_BENCHMARKS = (
    'org.openjdk.bench.java.lang.(ZmijFormatting.'
    '(doubleRandom|floatRandom|doubleConcat|floatConcat|doubleAppend|floatAppend|'
    'bigDecimalValueOf|decimalFormatDecimal|formatterGeneral)|'
    'FastFloatParsing.(parseDoubleShortInput|parseFloatShortInput|parseDoubleDecimal|'
    'parseFloatDecimal|decimalFormatDigits))$'
)


def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path, help='unmodified JDK image, without new flags')
    parser.add_argument('head', type=Path, help='current PR-head JDK image')
    parser.add_argument('jmh_classpath', help='JMH core/processor and dependencies')
    parser.add_argument('output', type=Path, help='new results directory')
    parser.add_argument('--original-commit', required=True)
    parser.add_argument('--head-commit', required=True)
    parser.add_argument('--tiers', nargs='+', choices=TIERS, default=['c2'])
    parser.add_argument('--cpu', type=int, help='pin controller and forks to one allowed CPU')
    parser.add_argument('--rounds', type=int, default=3, help='fresh forks per variant')
    parser.add_argument('--benchmarks', default=DEFAULT_BENCHMARKS)
    args = parser.parse_args()
    if args.rounds < 3:
        parser.error('use at least three alternating rounds')
    if args.cpu is not None:
        if not hasattr(os, 'sched_setaffinity'):
            parser.error('--cpu requires OS affinity support')
        os.sched_setaffinity(0, {args.cpu})
    root = Path(__file__).resolve().parents[2]
    images = {'original': args.original.resolve(), 'head': args.head.resolve()}
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    classes = output / 'classes'
    classes.mkdir()
    sources = [root / 'test/micro/org/openjdk/bench/java/lang' / (name + '.java')
               for name in ('ZmijFormatting', 'FastFloatParsing')]
    common = ['--add-modules=jdk.incubator.vector',
              '--add-exports=java.base/jdk.internal.math=ALL-UNNAMED',
              '-Xshare:off', '-Xms256m', '-Xmx256m']
    jars = []
    for entry in args.jmh_classpath.split(os.pathsep):
        jars.extend(glob.glob(entry) if '*' in entry else [entry])
    jars = [str(Path(jar).resolve()) for jar in jars]
    classpath = os.pathsep.join(jars)
    metadata = {
        'source_commits': {'original': args.original_commit, 'head': args.head_commit},
        'source_sha256': {str(path.relative_to(root)): digest(path) for path in sources},
        'jmh_sha256': {jar: digest(Path(jar)) for jar in jars},
        'platform': sys.platform, 'cpu': args.cpu, 'tiers': args.tiers,
        'commands': [], 'images': {},
    }
    for label, image in images.items():
        libraries = [path for path in image.rglob('*')
                     if path.name in ('libjvm.so', 'libjvm.dylib', 'jvm.dll')]
        metadata['images'][label] = {
            'java': str(image / 'bin/java'),
            'sha256': {str(path.relative_to(image)): digest(path)
                       for path in [image / 'bin/java', image / 'bin/javac', *libraries]},
            'release': (image / 'release').read_text(),
            'version': subprocess.check_output([str(image / 'bin/java'), '-version'],
                                              stderr=subprocess.STDOUT, text=True),
        }

    def run(command, log):
        metadata['commands'].append(command)
        (output / 'environment.json').write_text(json.dumps(metadata, indent=2) + '\n')
        with (output / log).open('w') as stream:
            subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT, check=True)

    run([str(images['head'] / 'bin/javac'), *common[:2], '-cp', classpath,
         '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor',
         '-d', str(classes), *map(str, sources)], 'compile.log')
    variants = {
        'original': ('original', []),
        'default': ('head', []),
        'optout': ('head', ['-XX:-UseFastFloatIntrinsics', '-XX:-UseZmijIntrinsics']),
        'jni': ('head', ['-XX:+UnlockDiagnosticVMOptions',
                        '-XX:DisableIntrinsic=_parseFastFloat,_parseFastFloatDigits,'
                        '_formatZmij,_decimalZmij']),
    }
    names = list(variants)
    observations = {}
    for tier in args.tiers:
        for round_number in range(args.rounds):
            # Rotating order distributes host drift across variants.
            order = names[round_number % len(names):] + names[:round_number % len(names)]
            for variant in order:
                label, flags = variants[variant]
                image = images[label]
                prefix = f'{tier}-{variant}-{round_number}'
                command = [str(image / 'bin/java'), '-cp',
                           str(classes) + os.pathsep + classpath,
                           'org.openjdk.jmh.Main', args.benchmarks,
                           '-jvm', str(image / 'bin/java'),
                           '-jvmArgsAppend', shlex.join(common + TIERS[tier] + flags),
                           '-f', '1', '-wi', '3', '-i', '3', '-w', '1s', '-r', '1s',
                           '-prof', 'gc', '-foe', 'true', '-rf', 'json',
                           '-rff', str(output / (prefix + '.json'))]
                run(command, prefix + '.log')
                for item in json.loads((output / (prefix + '.json')).read_text()):
                    key = (tier, item['benchmark'], json.dumps(item['params'], sort_keys=True)
                           if 'params' in item else '{}')
                    observations.setdefault(key, {}).setdefault(variant, []).append(item)
    header = ('tier,benchmark,params,original_ns,default_ns,original_over_default,'
              'original_B_per_op,default_B_per_op,optout_ns,jni_ns')
    with (output / 'summary.csv').open('w', newline='') as stream:
        writer = csv.writer(stream)
        writer.writerow(header.split(','))
        for (tier, benchmark, params), samples in sorted(observations.items()):
            def mean(variant, metric='primaryMetric'):
                values = [(item['primaryMetric'] if metric == 'primaryMetric'
                           else item.get('secondaryMetrics', {}).get(metric, {})).get('score')
                          for item in samples[variant]]
                return sum(values) / len(values) if all(v is not None for v in values) else ''
            original, default = mean('original'), mean('default')
            writer.writerow([tier, benchmark, params, original, default, original / default,
                             mean('original', 'gc.alloc.rate.norm'),
                             mean('default', 'gc.alloc.rate.norm'),
                             mean('optout'), mean('jni')])
    print(output / 'summary.csv')


if __name__ == '__main__':
    main()
