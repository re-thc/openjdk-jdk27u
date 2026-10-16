"""Full suites and phase/gap controls after the cumulative performance screen."""
import argparse
import itertools
import json
import os
import pathlib
import re
import subprocess

from run_release_causal import EXPECTED, HEADER, record, rows



def suite_counts(work):
    counts = {'Passed':0,'Not run':0,'Failed':0,'Error':0}
    details = []
    for path in sorted(pathlib.Path(work).rglob('*.jtr')):
        match = re.search(r'test result:\s*([^\n]+)', path.read_text())
        if not match:
            raise RuntimeError('Suite report has no terminal status: ' + str(path))
        status = match.group(1).split('.',1)[0]
        if status not in counts:
            raise RuntimeError('Unknown suite status: ' + status)
        counts[status] += 1
        details.append(dict(path=str(path),status=match.group(1)))
    if counts['Passed'] == 0 or counts['Failed'] or counts['Error']:
        raise RuntimeError('Suite did not execute successful tests exclusively: ' + str(counts))
    return dict(counts=counts,reports=details)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ['release-jdk', 'debug-jdk', 'jtreg', 'frozen', 'out']:
        p.add_argument('--' + name, type=pathlib.Path, required=True)
    p.add_argument('--source-input-manifest', type=pathlib.Path)
    p.add_argument('--platform', choices=['linux','mac'], default='linux')
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    if a.execute and os.uname().machine not in (('arm64','aarch64') if a.platform=='mac' else ('aarch64',)):
        p.error('Native AArch64 required')
    if a.execute and os.uname().sysname != ('Darwin' if a.platform=='mac' else 'Linux'): p.error('OS does not match experiment platform')
    if a.execute and any(os.environ.get(n) for n in ['JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS']):
        p.error('Unplanned inherited JVM options')
    root = pathlib.Path('.').resolve()
    classes = (a.frozen / 'qualification/classes').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    expected_kernels = EXPECTED
    if a.source_input_manifest:
        from source_inputs import verify
        expected_kernels = verify(a.source_input_manifest, a.frozen)['kernel_classes']
    if a.execute:
        for name, sha in expected_kernels.items():
            if record(classes / name)['sha256'] != sha:
                p.error('Frozen input mismatch')
    records = []

    def run(name, argv, timeout=3600):
        status = dict(name=name, argv=[str(x) for x in argv], planned=not a.execute)
        log = out / (name + '.log')
        if a.execute:
            with log.open('w') as stream:
                result = subprocess.run(status['argv'], stdout=stream, stderr=subprocess.STDOUT, timeout=timeout)
            status.update(exit_status=result.returncode, log=record(log))
        records.append(status)
        (out / 'status.json').write_text(json.dumps(records, indent=2) + '\n')
        print('ROUNDTRIP_FULL_STATUS_JSON=' + json.dumps(status), flush=True)
        if a.execute and result.returncode:
            raise RuntimeError('Full qualification failed: ' + name)
        return log

    suite_evidence = {}
    for label, jdk in [('release', a.release_jdk), ('fastdebug', a.debug_jdk)]:
        for sve in (['0'] if a.platform=='mac' else ['default','0']):
            flags = [] if sve == 'default' else ['-XX:UseSVE=0']
            for suite, path in [('compiler', 'test/hotspot/jtreg/compiler/vectorapi'),
                                ('jdk', 'test/jdk/jdk/incubator/vector')]:
                name = label + '-sve' + sve + '-' + suite
                argv = [a.release_jdk / 'bin/java', '-Xmx512m', '-jar', a.jtreg / 'lib/jtreg.jar',
                        '-jdk:' + str(jdk.resolve()), '-concurrency:1', '-timeoutFactor:2', '-verbose:summary',
                        '-w:' + str(out / (name + '-work')), '-r:' + str(out / (name + '-report'))]
                if flags:
                    argv += ['-javaoptions:' + ' '.join(flags)]
                run(name, argv + [root / path], timeout=9000)
                if a.execute:
                    suite_evidence[name] = suite_counts(out / (name + '-work'))
                    (out / 'suite-counts.json').write_text(json.dumps(suite_evidence, indent=2) + '\n')
            for header, kernel, mode in itertools.product(HEADER,
                    ['conversion', 'rawBits', 'directBits', 'arithmetic'], ['int', 'c1', 'cold']):
                name = label + '-sve' + sve + '-' + header + '-' + kernel + '-' + mode
                argv = [jdk / 'bin/java', '--add-modules=jdk.incubator.vector', *flags, *HEADER[header],
                        '-XX:ActiveProcessorCount=2', '-Xms128m', '-Xmx512m',
                        '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
                        '-DobserveCompilation=true', '-DvectorBits=128', '-DmeasureCalls=100',
                        '-XX:CompileCommand=dontinline,PhaseVectorProbe::invoke',
                        '-XX:CompileCommand=dontinline,PhaseVectorKernels::' + kernel]
                argv += {'int': ['-Xint'], 'c1': ['-Xbatch', '-XX:TieredStopAtLevel=1'], 'cold': []}[mode]
                log = run(name, argv + ['-cp', classes, 'PhaseVectorProbe', kernel, mode], timeout=300)
                if a.execute:
                    selected = [x for x in rows(log) if x['phase'].startswith('measure') or
                                (mode == 'cold' and x['phase'] == 'first')]
                    required = 1 if mode == 'c1' else 0
                    if len(selected) != (1 if mode == 'cold' else 5) or any(
                            int(x['normal_before']) != required or int(x['normal_after']) != required for x in selected):
                        raise RuntimeError('Actual phase target level missing: ' + name)
    # Separate gap audits preserve unresolved allocations; they never count as timing contrasts.
    gapclasses = out / 'gap-classes'
    gapclasses.mkdir()
    run('gap-javac', [a.release_jdk / 'bin/javac', '--add-modules=jdk.incubator.vector',
        '-cp', str(classes) + os.pathsep + str(wb), '-d', gapclasses,
        root / 'qualification/src/ProfiledOsrDiagnostic.java', root / 'qualification/src/VectorInsertAllocationProbe.java'])
    for label, jdk in [('release', a.release_jdk), ('fastdebug', a.debug_jdk)]:
        for sve in (['0'] if a.platform=='mac' else ['default','0']):
            flags = [] if sve == 'default' else ['-XX:UseSVE=0']
            common = [jdk / 'bin/java', '--add-modules=jdk.incubator.vector', *flags,
                      '-XX:ActiveProcessorCount=2', '-Xms128m', '-Xmx512m',
                      '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb)]
            cp = str(gapclasses) + os.pathsep + str(classes) + os.pathsep + str(wb)
            for kernel, bits in [('conversion', 512), ('signatureArgs', 128)]:
                run('gap-' + label + '-sve' + sve + '-' + kernel,
                    common + ['-Xbatch', '-XX:-TieredCompilation', '-DobserveCompilation=true',
                        '-DvectorBits=' + str(bits), '-DmeasureCalls=100',
                        '-XX:CompileCommand=dontinline,PhaseVectorKernels::' + kernel,
                        '-XX:CompileCommand=dontinline,PhaseVectorKernels::vectorArguments',
                        '-cp', cp, 'PhaseVectorProbe', kernel, 'c2'], timeout=300)
            run('gap-' + label + '-sve' + sve + '-insert', common + ['-Xbatch', '-XX:-TieredCompilation',
                '-XX:CompileCommand=dontinline,VectorInsertAllocationProbe::kernel',
                '-cp', cp, 'VectorInsertAllocationProbe'], timeout=300)
            if label == 'fastdebug':
                log = run('gap-osr-sve' + sve, common + ['-XX:-TieredCompilation',
                    '-XX:+TraceOnStackReplacement', '-DobserveCompilation=true', '-DvectorBits=128',
                    '-DosrIterations=200000', '-XX:CompileCommand=dontinline,PhaseVectorKernels::osrAccumulator',
                    '-cp', cp, 'ProfiledOsrDiagnostic'], timeout=300)
                if a.execute and len(re.findall(r'OSR entry @ pc:.*PhaseVectorKernels::osrAccumulator', log.read_text())) != 8:
                    raise RuntimeError('Mixed-heap OSR trace missing')
    (out / 'full-result.json').write_text(json.dumps(dict(passed=a.execute,platform=a.platform,
        suites=4 if a.platform=='mac' else 8, phase_processes=72 if a.platform=='mac' else 144, gap_processes=7 if a.platform=='mac' else 14,
        candidate_qualified=False,
        scope='Review all compile-cost, code and confidence results before any qualification/PR change. Individual95%intervals do not establish simultaneous zero regressions. Wider OSR/call/fallback gaps remain separate.'), indent=2) + '\n')


if __name__ == '__main__':
    main()
