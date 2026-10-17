#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Run the remaining per-source jtreg selections against retained JDKs only."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess


def command(boot, jtreg, source, image, root, label, gc, test):
    if gc not in ('Serial', 'G1', 'Z') or label not in ('base', 'candidate'):
        raise ValueError('Unexpected protected test group')
    identity = test.removeprefix('test/jdk/').replace('/', '_').removesuffix('.java')
    work = root / 'test-work' / f'{label}-{gc}' / identity
    report = root / 'results' / f'{label}-{gc}-test-results' / identity
    # Match the saved make-driven invocation per source, including option order.
    # The selected Linux tests do not consume a separate native test image.
    args = [str(boot / 'bin/java'), '-Xmx768m', '-Djava.io.tmpdir=' + str(root / 'tmp'),
            '-jar', str(jtreg / 'lib/jtreg.jar'),
            '-vmoption:-Xmx768m', '-agentvm', '-verbose:fail,error,summary',
            '-retain:fail,error', '-concurrency:2', '-vmoption:-XX:MaxRAMPercentage=12.5',
            '-vmoption:-Dtest.boot.jdk=' + str(boot),
            '-vmoption:-Djava.io.tmpdir=' + str(work / 'tmp'), '-ignore:quiet', '-automatic',
            '-javaoption:-XX:+Use' + gc + 'GC', '-javaoption:-Xmx128m',
            '-javaoption:-Djava.io.tmpdir=' + str(root / 'tmp'), '-ea', '-esa',
            '-exclude:' + str(source / 'test/jdk/ProblemList.txt'), '-timeoutFactor:4',
            '-testjdk:' + str(image), '-dir:' + str(source),
            '-reportDir:' + str(report), '-workDir:' + str(work), '-report:files', test]
    return args, work, report


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('source', type=Path)
    parser.add_argument('image', type=Path)
    parser.add_argument('root', type=Path)
    parser.add_argument('label', choices=('base', 'candidate'))
    parser.add_argument('gc', choices=('Serial', 'G1', 'Z'))
    parser.add_argument('tests')
    args = parser.parse_args()
    tests = args.tests.split(' ')
    if (len(tests) != (6 if args.label == 'base' else 21)
            or len(set(tests)) != len(tests)
            or any(not name or '\n' in name or '\r' in name for name in tests)):
        raise ValueError('TEST must be the normalized complete protected selection')
    boot, jtreg = Path(os.environ['BOOT_JDK']), Path(os.environ['JTREG_HOME'])
    log_dir = args.root / 'results' / f'{args.label}-{args.gc}-jtreg-logs'
    log_dir.mkdir(exist_ok=False)
    results = []
    for index, test in enumerate(tests):
        if not (args.source / test).is_file():
            raise ValueError('Missing selected test: ' + test)
        argv, work, report = command(boot, jtreg, args.source, args.image, args.root,
                                     args.label, args.gc, test)
        work.mkdir(parents=True, exist_ok=False)
        (work / 'tmp').mkdir()
        report.mkdir(parents=True, exist_ok=False)
        (log_dir / f'{index:02d}-command.json').write_text(json.dumps(argv, indent=2) + '\n')
        log = log_dir / f'{index:02d}.log'
        with log.open('w') as output:
            result = subprocess.run(argv, cwd=work, stdout=output, stderr=subprocess.STDOUT)
        text = log.read_text()
        print(text, end='', flush=True)
        result.check_returncode()
        if not re.search(r'^Test results: passed: 1\s*$', text, re.MULTILINE):
            raise RuntimeError('Selected test was skipped, excluded or did not pass: ' + test)
        results.append(dict(test=test, exit_code=0, log=str(log.relative_to(args.root))))
        (log_dir / 'passed.json').write_text(json.dumps(results, indent=2) + '\n')
    print('TEST SUCCESS', flush=True)


if __name__ == '__main__':
    main()
