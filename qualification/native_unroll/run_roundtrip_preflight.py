"""Mandatory native matching/correctness gate; never a performance workload."""
import argparse
import json
import os
import pathlib
import re
import statistics
import subprocess
import xml.etree.ElementTree as ET

from run_release_causal import record

PACKAGE = 'compiler.vectorapi.'
CONTROLS = PACKAGE + 'TestFloatRoundTripCompileControls'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ['release-jdk', 'debug-jdk', 'control-jdk', 'control-debug-jdk', 'jtreg', 'frozen', 'out']:
        p.add_argument('--' + name, type=pathlib.Path, required=True)
    p.add_argument('--execute', action='store_true')
    p.add_argument('--historical-control', action='store_true',
                   help='Label reused controls as compiler diagnostics, without matched-toolchain attribution')
    a = p.parse_args()
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    if a.execute and os.uname().machine != 'aarch64':
        p.error('Native AArch64 required')
    if a.execute and any(os.environ.get(n) for n in ['JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS']):
        p.error('Unplanned inherited JVM options')
    root = pathlib.Path('.').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    classes = out / 'classes'
    classes.mkdir()
    if a.execute and a.historical_control:
        from classifier_images import frozen_binding, pins, source_binding
        pin = pins()
        binding = dict(source=source_binding(root, pin), frozen=frozen_binding(a.frozen, pin))
        (out / 'classifier-input-binding.json').write_text(json.dumps(binding, indent=2) + '\n')
    records = []

    def run(name, argv, timeout=1200):
        status = dict(name=name, argv=[str(x) for x in argv], planned=not a.execute)
        logfile = out / (name + '.log')
        if a.execute:
            with logfile.open('w') as stream:
                result = subprocess.run(status['argv'], stdout=stream, stderr=subprocess.STDOUT, timeout=timeout)
            status.update(exit_status=result.returncode, log=record(logfile))
        records.append(status)
        (out / 'commands-status.json').write_text(json.dumps(records, indent=2) + '\n')
        print('ROUNDTRIP_PREFLIGHT_STATUS_JSON=' + json.dumps(status), flush=True)
        if a.execute and result.returncode:
            raise RuntimeError('Preflight failed: ' + name)
        return logfile.read_text() if a.execute else ''

    tests = ['TestFloatRoundTripReduction', 'TestFloatRoundTripReductionEdges',
             'TestZeroSeedFPReduction', 'TestZeroSeedFPReductionIR', 'TestZeroSeedFPReductionStrictIR']
    for label, jdk in [('release', a.release_jdk), ('debug', a.debug_jdk)]:
        for sve in ['default', '0']:
            flags = [] if sve == 'default' else ['-XX:UseSVE=0']
            flag_text = run(label + '-flags-sve' + sve,
                            [jdk / 'bin/java', *flags, '-XX:+PrintFlagsFinal', '-version'])
            if a.execute and sve == '0':
                if not re.search(r'\bUseSVE\s*:?=\s*0\b', flag_text) or not re.search(
                        r'\bMaxVectorSize\s*:?=\s*(16|32|64|128|256)\b', flag_text):
                    raise RuntimeError('Essential NEON positive configuration unavailable')
            chosen = tests if label == 'debug' else tests[:3]
            work = out / (label + '-work-sve' + sve)
            argv = [a.release_jdk / 'bin/java', '-XX:ActiveProcessorCount=2', '-Xmx512m',
                    '-jar', a.jtreg / 'lib/jtreg.jar', '-jdk:' + str(jdk.resolve()),
                    '-concurrency:1', '-timeoutFactor:2', '-verbose:summary', '-othervm',
                    '-w:' + str(work), '-r:' + str(out / (label + '-report-sve' + sve))]
            if flags:
                argv += ['-javaoptions:' + ' '.join(flags)]
            argv += [root / ('test/hotspot/jtreg/compiler/vectorapi/' + test + '.java') for test in chosen]
            run(label + '-tests-sve' + sve, argv)
            if a.execute:
                reports = {x.stem: x for x in work.rglob('*.jtr')}
                if set(reports) != set(chosen):
                    raise RuntimeError('Missing/extra test report')
                for test in chosen:
                    text = reports[test].read_text()
                    if 'test result: Passed.' not in text:
                        raise RuntimeError('Unsuccessful report: ' + test)
                    if label == 'debug' and test != 'TestZeroSeedFPReduction':
                        if '-DShouldDoIRVerification=true' not in text or 'IR verification disabled due' in text:
                            raise RuntimeError('IR assertions did not execute: ' + test)
                    if label == 'debug' and sve == '0':
                        positive = {'TestFloatRoundTripReduction': 'carried128',
                                    'TestFloatRoundTripReductionEdges': 'reversed'}.get(test)
                        if positive and re.search(r'Disabling IR matching for rule 1 of \d+ in ' + positive + ':', text):
                            raise RuntimeError('Essential compound positive assertion skipped')

    source = root / 'test/hotspot/jtreg/compiler/vectorapi/TestFloatRoundTripCompileControls.java'
    run('compile-controls-javac', [a.release_jdk / 'bin/javac', '--add-modules=jdk.incubator.vector',
        '-cp', wb, '-sourcepath', str(root / 'test/hotspot/jtreg') + os.pathsep + str(root / 'test/lib'),
        '-d', classes, source])
    javap = run('compile-controls-javap', [a.release_jdk / 'bin/javap', '-c', '-p', '-cp', classes, CONTROLS])
    if a.execute:
        method = javap.split('public static float osrNegative(', 1)[1].split('public static float chain1(', 1)[0]
        if not re.search(r'\bgoto\s+2\b', method):
            raise RuntimeError('OSR loop BCI changed')
    chain_records = []
    for sve in ['default', '0']:
        flags = [] if sve == 'default' else ['-XX:UseSVE=0']
        for count in [1, 8, 32, 64]:
            for sample in range(3):
                order = [('candidate', a.debug_jdk), ('control', a.control_debug_jdk)]
                if sample % 2:
                    order.reverse()
                for label, jdk in order:
                    name = label + '-chains-sve' + sve + '-n' + str(count) + '-sample' + str(sample)
                    xml = out / (name + '.xml')
                    argv = [jdk / 'bin/java', '--add-modules=jdk.incubator.vector', *flags,
                            '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
                            '-DchainLength=' + str(count), '-XX:-TieredCompilation', '-XX:+LogCompilation', '-XX:LogFile=' + str(xml),
                            '-cp', str(classes) + os.pathsep + str(wb)]
                    text = run(name, argv + [CONTROLS, 'chains'], timeout=480)
                    if a.execute:
                        rows = re.findall(r'ROUNDTRIP_CHAIN count=(\d+) round=(\d+) enqueue_to_install_ns=(\d+) actual=4', text)
                        if len(rows) != 1 or int(rows[0][0]) != count or 'ROUNDTRIP_CHAIN_PASS' not in text:
                            raise RuntimeError('Long-chain coverage/ordinary C2 missing')
                        task_rows = []
                        tree = ET.parse(xml)
                        for task in tree.findall('.//task'):
                            match = re.match(re.escape(CONTROLS.replace('.', '/')) + r' chain(1|8|32|64) ', task.get('method', '').replace('.', '/'))
                            if not match or int(match.group(1)) != count or task.get('compile_kind') == 'osr':
                                continue
                            done = task.find('task_done')
                            if done is None or done.get('success') != '1':
                                raise RuntimeError('Long-chain compiler bailout')
                            duration = float(done.get('stamp')) - float(task.get('stamp'))
                            if duration < 0 or duration > 30:
                                raise RuntimeError('Long-chain compiler task exceeded30s budget')
                            task_rows.append(dict(count=int(match.group(1)), seconds=duration))
                        if not task_rows:
                            raise RuntimeError('No attributed compiler task durations')
                        chain_records.append(dict(image=label, sve=sve, count=count, sample=sample, samples=rows, compiler_tasks=task_rows,
                            interpretation=('Bounded chains1/8/32/64, one forced compilation per fresh JVM, three process repetitions per length; diagnostic compile work, not runtime performance. '
                                + ('Historical correctness controls; not a newly matched-toolchain performance pair.' if a.historical_control
                                   else 'Recurrence walk remains potentially quadratic; report scaling for review.'))))
        # Graph printing is excluded from all48compile-cost processes above.
        # Each observed matching VM is separate, and its elapsed values are excluded.
        for count in [1, 8, 32, 64]:
            name = 'candidate-chain-match-sve' + sve + '-n' + str(count)
            directives = out / (name + '-directives.json')
            directives.write_text(json.dumps([dict(match=CONTROLS + '::chain' + str(count),
                PrintIdeal=True, PrintIdealPhase='MATCHING')]) + '\n')
            text = run(name, [a.debug_jdk / 'bin/java', '--add-modules=jdk.incubator.vector', *flags,
                '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
                '-XX:-TieredCompilation', '-DchainLength=' + str(count),
                '-XX:CompilerDirectivesFile=' + str(directives), '-cp', str(classes) + os.pathsep + str(wb),
                CONTROLS, 'chains'], timeout=120)
            if a.execute:
                configured = (out / ('debug-flags-sve' + sve + '.log')).read_text()
                applies = sve == '0' or re.search(r'\bUseSVE\s*:?=\s*0\b', configured) or re.search(r'\bMaxVectorSize\s*:?=\s*16\b', configured)
                found = text.count('convF2I2F_reduce_acc4F_neon')
                if 'ROUNDTRIP_CHAIN_PASS' not in text or not re.search(r'AFTER:\s*MATCHING\b', text):
                    raise RuntimeError('Long-chain matching phase missing')
                if (applies and found < count) or (not applies and found != 0):
                    raise RuntimeError('Long-chain match/fallback disagrees with width applicability')
        # Explicit OSR compilation must never select the compound pattern.
        name = 'candidate-osr-sve' + sve
        directives = out / (name + '-directives.json')
        directives.write_text(json.dumps([dict(match=CONTROLS + '::osrNegative',
            PrintIdeal=True, PrintIdealPhase='MATCHING')]) + '\n')
        text = run(name, [a.debug_jdk / 'bin/java', '--add-modules=jdk.incubator.vector', *flags,
            '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
            '-XX:-TieredCompilation', '-XX:+TraceOnStackReplacement',
            '-XX:CompilerDirectivesFile=' + str(directives), '-XX:+LogCompilation',
            '-XX:LogFile=' + str(out / (name + '.xml')), '-cp', str(classes) + os.pathsep + str(wb),
            CONTROLS, 'osr'], timeout=120)
        if a.execute:
            if 'ROUNDTRIP_OSR_NEGATIVE_PASS ordinary=0 osr=4 bci=2' not in text or not re.search(
                    r'OSR entry @ pc:.*TestFloatRoundTripCompileControls::osrNegative', text):
                raise RuntimeError('Actual isolated OSR entry missing')
            if 'convF2I2F_reduce_acc4F_neon' in text or not re.search(r'AFTER:\s*MATCHING\b', text):
                raise RuntimeError('OSR compound exclusion not established')
    scaling = []
    if a.execute:
        for sve in ['default', '0']:
            for count in [1, 8, 32, 64]:
                medians = {}
                for image in ['candidate', 'control']:
                    processes = [x for x in chain_records if x['sve'] == sve and x['count'] == count and x['image'] == image]
                    if len(processes) != 3:
                        raise RuntimeError('Missing fresh-process compilation repetitions')
                    medians[image] = statistics.median(statistics.mean(t['seconds'] for t in x['compiler_tasks']) for x in processes)
                ratio_key = 'candidate_vs_historical_control_diagnostic' if a.historical_control else 'candidate_vs_matched_b3'
                scaling.append(dict(sve=sve, count=count, median_task_seconds=medians,
                    **{ratio_key: medians['candidate'] / medians['control'] if medians['control'] else None}))
    (out / 'chain-compilation-results.json').write_text(json.dumps(dict(processes=chain_records, scaling=scaling,
        review_required=('Historical controls are correctness controls. Compiler-task values are diagnostic and do not establish matched-toolchain performance or linear wall-time complexity.'
            if a.historical_control else 'The predicate can do quadratic recurrence walks. These bounded measurements do not prove linear complexity or isolated grouping cost.')), indent=2) + '\n')
    # Stress has separate flags and cannot substitute for clean IR assertions.
    for sve in ['default', '0']:
        flags = [] if sve == 'default' else ['-XX:UseSVE=0']
        run('stress-sve' + sve, [a.release_jdk / 'bin/java', '-jar', a.jtreg / 'lib/jtreg.jar',
            '-jdk:' + str(a.debug_jdk.resolve()), '-concurrency:1', '-timeoutFactor:2',
            '-javaoptions:' + ' '.join(flags + ['-XX:+UnlockDiagnosticVMOptions', '-XX:+StressLCM',
                '-XX:+StressGCM', '-XX:+StressIGVN', '-XX:+StressCCP', '-XX:StressSeed=8392077']),
            '-w:' + str(out / ('stress-work-sve' + sve)), '-r:' + str(out / ('stress-report-sve' + sve)),
            root / 'test/hotspot/jtreg/compiler/vectorapi/TestFloatRoundTripReductionEdges.java'])
    (out / 'preflight-gate.json').write_text(json.dumps(dict(passed=a.execute,
        scope='Matching, semantics and bounded compiler checks only; release installed assembly gate still required before timing.',
        qualified=False, cumulative_patch=True, isolated_grouping_attribution=False), indent=2) + '\n')


if __name__ == '__main__':
    main()
