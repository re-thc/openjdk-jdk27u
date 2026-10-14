#!/usr/bin/env python3
"""Focused execution and IR checks, separate from measured JVM processes."""
import argparse
import json
import os
import pathlib
import subprocess

from run_release_causal import record


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--release-jdk', type=pathlib.Path, required=True)
    p.add_argument('--debug-jdk', type=pathlib.Path, required=True)
    p.add_argument('--base-jdk', type=pathlib.Path, required=True)
    p.add_argument('--b3-jdk', type=pathlib.Path, required=True)
    p.add_argument('--rebuilt-b3-jdk', type=pathlib.Path, required=True)
    p.add_argument('--jtreg', type=pathlib.Path, required=True)
    p.add_argument('--frozen', type=pathlib.Path, required=True)
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    source = pathlib.Path('.').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    classes = out / 'classes'
    classes.mkdir()
    test = 'compiler.vectorapi.TestZeroSeedFPReduction'
    java_file = source / 'test/hotspot/jtreg/compiler/vectorapi/TestZeroSeedFPReduction.java'
    if a.execute:
        if os.uname().machine != 'aarch64':
            p.error('Native AArch64 required for candidate execution')
        subprocess.run([str(a.release_jdk.resolve() / 'bin/javac'), '--add-modules=jdk.incubator.vector',
                        '-cp', str(wb), '-d', str(classes), str(java_file)], check=True)
    records = []

    def run(name, argv):
        if not a.execute:
            records.append({'name': name, 'argv': argv, 'planned': True})
            (out / 'plan.json').write_text(json.dumps(records, indent=2) + '\n')
            return
        logfile = out / (name + '.log')
        with logfile.open('w') as f:
            result = subprocess.run(argv, stdout=f, stderr=subprocess.STDOUT, timeout=900)
        status = {'name': name, 'argv': argv, 'exit_status': result.returncode, 'log': record(logfile)}
        records.append(status)
        (out / 'status.json').write_text(json.dumps(records, indent=2) + '\n')
        if result.returncode:
            print(logfile.read_text()[-16000:], flush=True)
            raise RuntimeError('Focused test failure: ' + name)
        print('BACKEND_TEST_STATUS_JSON=' + json.dumps(status), flush=True)

    def semantic_argv(jdk, sve, level):
        args = [str(jdk.resolve() / 'bin/java'), '--add-modules=jdk.incubator.vector',
                '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
                '-DverifyLevels=true', '-XX:CompileCommand=exclude,' + test + '::scalarFloatOracle',
                '-XX:CompileCommand=exclude,' + test + '::scalarDoubleOracle']
        if sve == '0':
            args += ['-XX:UseSVE=0']
        args += {0: ['-Xint', '-Dwarmup=100'], 1: ['-Xbatch', '-XX:TieredStopAtLevel=1'],
                 4: ['-Xbatch', '-XX:-TieredCompilation']}[level]
        return args + ['-cp', str(classes), test, str(level)]

    for label, jdk in [('release', a.release_jdk), ('fastdebug', a.debug_jdk)]:
        for sve in ['default', '0']:
            for level in [0, 1, 4]:
                run(label + '-sve' + sve + '-level' + str(level), semantic_argv(jdk, sve, level))

    # Record before/after special values on archived and freshly rebuilt references.
    for label, jdk in [('base87', a.base_jdk), ('b3', a.b3_jdk), ('rebuilt_b3', a.rebuilt_b3_jdk)]:
        for sve in ['default', '0']:
            run(label + '-sve' + sve + '-level4', semantic_argv(jdk, sve, 4))

    # Stress is outside performance windows and uses actual ordinary C2 checks.
    for sve in ['default', '0']:
        for seed in [17, 8392077]:
            argv = semantic_argv(a.debug_jdk, sve, 4)
            argv[1:1] = ['-XX:+UnlockDiagnosticVMOptions', '-XX:+StressIGVN', '-XX:+StressGCM',
                         '-XX:+StressLCM', '-XX:StressSeed=' + str(seed)]
            run('stress-sve' + sve + '-seed' + str(seed), argv)

    tests = ['test/hotspot/jtreg/compiler/vectorapi/TestZeroSeedFPReductionIR.java',
             'test/hotspot/jtreg/compiler/vectorapi/TestVectorAddMulReduction.java']
    for sve in ['default', '0']:
        argv = [str(a.release_jdk.resolve() / 'bin/java'), '-jar', str(a.jtreg.resolve() / 'lib/jtreg.jar'),
                '-jdk:' + str(a.debug_jdk.resolve()),
                '-w:' + str(out / ('ir-work-sve' + sve)), '-r:' + str(out / ('ir-report-sve' + sve)), *tests]
        if sve == '0':
            argv.insert(3, '-javaoptions:-XX:UseSVE=0')
        run('ir-sve' + sve, argv)
        if a.execute:
            reports = list((out / ('ir-work-sve' + sve)).rglob('*.jtr'))
            if len(reports) != len(tests) or any('IR verification disabled' in r.read_text()
                    or '-DShouldDoIRVerification=true' not in r.read_text() for r in reports):
                raise RuntimeError('IR verification did not run: sve=' + sve)
    coverage = {
        'execution': 'passed' if a.execute else 'pending',
        'interpreter_C1_C2_verified_by_WhiteBox': a.execute,
        'float_bits': [64, 128, 256, 512], 'double_bits': [128, 256, 512],
        'exceptional_values': ['positive/negative zero', 'positive/negative quiet NaN',
                               'signaling NaN', 'infinity', 'cancellation'],
        'loops': ['loop-carried scalar additions', 'independent outputs', 'tails', 'strict scalar order'],
        'wide_SVE_hardware_coverage': 'Only if MaxVectorSize >= 32; N2 128-bit SVE cannot qualify wider native SVE',
        'scope': 'Focused initial checks; release/fastdebug Vector API suites and cold phase qualification remain required',
    }
    (out / 'coverage.json').write_text(json.dumps(coverage, indent=2) + '\n')
    print('BACKEND_TEST_COVERAGE_JSON=' + json.dumps(coverage), flush=True)


if __name__ == '__main__':
    main()
