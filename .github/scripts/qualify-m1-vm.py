#!/usr/bin/env python3
"""Qualify the current debug VM with the previously qualified runtime libraries."""
import argparse
from pathlib import Path
import shutil
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--jdk', type=Path, required=True)
parser.add_argument('--bootjdk', required=True)
parser.add_argument('--jtreg', type=Path, required=True)
parser.add_argument('--profile', required=True)
parser.add_argument('--debug-level', choices=('release', 'fastdebug'), required=True)
args = parser.parse_args()
root = Path.cwd()
results = root / 'qualification'
results.mkdir(exist_ok=True)
command = ['bash', args.profile, '--with-conf-name=debug-check', '--with-debug-level=' + args.debug_level,
    '--with-boot-jdk=' + args.bootjdk, '--with-native-debug-symbols=none',
    '--disable-desktop', '--enable-headless-only',
    '--enable-jvm-feature-serialgc', '--enable-jvm-feature-g1gc', '--enable-jvm-feature-zgc',
    '--disable-jvm-feature-parallelgc', '--disable-jvm-feature-shenandoahgc',
    '--disable-jvm-feature-epsilongc', '--with-version-opt=zip-m1-dispatch']
subprocess.run(command, check=True)
with (results / 'debug-vm-build.log').open('w') as log:
    subprocess.run(['make', 'CONF=debug-check', 'hotspot', 'LOG=info'],
                   stdout=log, stderr=subprocess.STDOUT, check=True)
image = results / 'jdk'
shutil.copytree(args.jdk, image, dirs_exist_ok=True)
shutil.copy2(root / 'build/debug-check/jdk/lib/server/libjvm.dylib',
             image / 'lib/server/libjvm.dylib')
subprocess.run([str(image / 'bin/java'), '-version'], check=True)
for label, tests in (
        ('intrinsics', ['test/hotspot/jtreg/compiler/intrinsics/zip']),
        ('zip', ['test/jdk/java/util/zip', 'test/jdk/jdk/nio/zipfs'])):
    subprocess.run([str(image / 'bin/java'), '-jar', str(args.jtreg.resolve() / 'lib/jtreg.jar'),
        '-jdk:' + str(image), '-verbose:fail,error,time', '-timeoutFactor:4',
        '-w:' + str(results / (label + '-work')),
        '-r:' + str(results / (label + '-report')), *tests], check=True)
for gc in ('UseSerialGC', 'UseG1GC', 'UseZGC'):
    subprocess.run([str(image / 'bin/java'), '-jar', str(args.jtreg.resolve() / 'lib/jtreg.jar'),
        '-jdk:' + str(image), '-verbose:fail,error,time', '-timeoutFactor:4',
        '-javaoptions:-XX:+' + gc + ' -Xcheck:jni',
        '-w:' + str(results / (gc + '-work')),
        '-r:' + str(results / (gc + '-report')),
        'test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNG.java',
        'test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAdler32.java'], check=True)
