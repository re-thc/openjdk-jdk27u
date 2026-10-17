#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Prepare every Rust regex qualification class using pinned JMH dependencies.

This prepares inputs only; it never starts Java, a benchmark, or a CI workflow.
It invokes javac, so executing it requires compilation authorization.
"""

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time


ROOT = Path(__file__).resolve().parents[2]
DEPENDENCIES = (
    ('dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3',
     'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar'),
    ('6a5604b5b804e0daca1145df1077609321687734a8b49387e49f10557c186c77',
     'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar'),
    ('df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28',
     'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar'),
    ('1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308',
     'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar'),
)
REPOSITORIES = ('https://repo.maven.apache.org/maven2', 'https://repo1.maven.org/maven2')
BENCHMARKS = ('RustRegexNative', 'RustRegexLifetime', 'RustRegexState',
              'RustRegexCandidates', 'RustRegexEndFlags', 'RustRegexCosts',
              'JavaFallbackCosts', 'JavaDigitFallbackCosts', 'JavaFallbackCandidates')
HELPERS = tuple('make/scripts/' + name + '.java' for name in
                ('RustRegexProbe', 'RustRegexLatency', 'RustRegexRouteProbe', 'RustRegexFirstUse')) + (
    'test/jdk/java/util/regex/RustRegexContinuation.java',
    'test/jdk/java/util/regex/RustRegexStateSequences.java',
)


def sha256(path):
    digest = hashlib.sha256()
    with path.open('rb') as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def prepare(java_home, output, time_budget=600):
    started = time.monotonic()
    deadline = started + time_budget
    java_home, output = java_home.resolve(), output.resolve()
    javac = java_home / 'bin' / ('javac.exe' if os.name == 'nt' else 'javac')
    if not javac.is_file():
        raise ValueError('JDK has no javac: ' + str(javac))
    output.mkdir(parents=True, exist_ok=True)
    receipt_file = output / 'preparation.json'
    if receipt_file.exists():
        raise ValueError('preparation attempt already exists; choose a new output directory')
    receipt = {'status': 'preparing', 'dependencies': [], 'commands': []}
    with receipt_file.open('x') as destination:
        destination.write(json.dumps(receipt) + '\n')

    def run(command):
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError('total preparation time budget exhausted')
        receipt['commands'].append(command)
        return subprocess.run(command, check=True, timeout=remaining, cwd=ROOT)

    def check(path, expected):
        if sha256(path) != expected:
            raise ValueError('checksum mismatch for benchmark dependency ' + path.name)

    try:
        receipt['preparer_sha256'] = sha256(Path(__file__))
        receipt['javac_sha256'] = sha256(javac)
        lib, classes, generated = (output / name for name in ('lib', 'classes', 'generated'))
        for directory in (lib, classes, generated):
            directory.mkdir(exist_ok=True)
        if any(classes.iterdir()) or any(generated.iterdir()):
            raise ValueError('classes/generated must be empty; do not mix preparation attempts')
        names = {Path(path).name for _, path in DEPENDENCIES}
        if any(path.name not in names for path in lib.iterdir()):
            raise ValueError('unexpected dependency input in lib directory')
        sources = [ROOT / 'test/micro/org/openjdk/bench/java/util/regex' / (name + '.java')
                   for name in BENCHMARKS] + [ROOT / name for name in HELPERS]
        receipt['source_sha256'] = {str(path.relative_to(ROOT)): sha256(path) for path in sources}
        for checksum, coordinate in DEPENDENCIES:
            archive = lib / Path(coordinate).name
            entry = {'coordinate': coordinate, 'sha256': checksum, 'reused': archive.exists()}
            if archive.exists():
                check(archive, checksum)
            else:
                partial = archive.with_suffix(archive.suffix + '.part')
                try:
                    for repository in REPOSITORIES:
                        partial.unlink(missing_ok=True)
                        # Preserve the reviewed HTTP404 retry/fallback policy. A
                        # checksum mismatch is terminal, never a mirror retry.
                        command = ['curl', '--fail', '--location', '--silent', '--show-error',
                                   '--proto', '=https', '--proto-redir', '=https',
                                   '--retry', '2', '--retry-all-errors', '--retry-delay', '1',
                                   '--retry-max-time', '30', '--connect-timeout', '10',
                                   '--max-time', '20', repository + '/' + coordinate,
                                   '--output', str(partial)]
                        try:
                            run(command)
                        except subprocess.CalledProcessError:
                            continue
                        check(partial, checksum)
                        partial.replace(archive)
                        entry['repository'] = repository
                        break
                    else:
                        raise RuntimeError('unable to download verified benchmark dependency ' + coordinate)
                finally:
                    partial.unlink(missing_ok=True)
            receipt['dependencies'].append(entry)
        processor = os.pathsep.join(str(lib / name) for name in
                                    ('jmh-generator-annprocess-1.37.jar', 'jmh-core-1.37.jar'))
        run([str(javac), '-cp', str(lib / '*'), '-processorpath', processor,
             '-processor', 'org.openjdk.jmh.generators.BenchmarkProcessor',
             '-d', str(classes), '-s', str(generated)] + [str(path) for path in sources[:len(BENCHMARKS)]])
        run([str(javac), '-d', str(classes)] + [str(path) for path in sources[len(BENCHMARKS):]])
        required = [classes / 'META-INF' / 'BenchmarkList', classes / 'META-INF' / 'CompilerHints']
        required += [classes / 'org/openjdk/bench/java/util/regex' / (name + '.class') for name in BENCHMARKS]
        required += [classes / (Path(name).stem + '.class') for name in HELPERS]
        if any(not path.is_file() or path.stat().st_size == 0 for path in required):
            raise ValueError('javac did not produce complete qualification inputs')
        receipt['classpath_sha256'] = {str(path.relative_to(output)): sha256(path)
                                       for base in (lib, classes) for path in sorted(base.rglob('*'))
                                       if path.is_file()}
        if time.monotonic() > deadline:
            raise TimeoutError('total preparation time budget exhausted')
        receipt['status'] = 'prepared'
    except Exception as error:
        receipt.update(status='failed', error=str(error))
        raise
    finally:
        receipt['elapsed_seconds'] = time.monotonic() - started
        receipt_file.write_text(json.dumps(receipt, indent=2) + '\n')
    return receipt


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java-home', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--time-budget', type=int, default=600)
    args = parser.parse_args()
    if args.time_budget <= 0:
        parser.error('--time-budget must be positive')
    prepare(args.java_home, args.output, args.time_budget)


if __name__ == '__main__':
    main()
