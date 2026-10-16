"""Add historical-control semantics to the unchanged mandatory candidate preflight."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys

from classifier_images import record, require
from jtreg83_harness import EXPERIMENT, inventory
import run_roundtrip_preflight


def verify_control_reports(reports):
    for test in ['TestFloatRoundTripReduction', 'TestFloatRoundTripReductionEdges']:
        text = reports[test].read_text()
        for mode, level in [('semantics',0),('semantics',1),('semantics',4),('cold',0)]:
            pattern = (r'ROUNDTRIP_REDUCTION_PASS mode=' + mode + r' [^\n]*required=' + str(level) +
                       r' actual=' + str(level) + r' after=' + str(level) + r'\b') if test.endswith('Reduction') else (
                       r'ROUNDTRIP_EDGES_PASS mode=' + mode + r' six_targets_level=' + str(level) + r'\b')
            require(re.search(pattern, text), 'Historical interpreter/C1/C2/cold execution evidence missing')


def control_commands(a):
    tests = ['TestFloatRoundTripReduction', 'TestFloatRoundTripReductionEdges', 'TestZeroSeedFPReduction']
    commands = []
    root = Path.cwd()
    for level, image in [('release', a.control_jdk), ('fastdebug', a.control_debug_jdk)]:
        for sve in ['default', '0']:
            label = level + '-sve' + sve
            # Historical VMs cannot satisfy the candidate's new compound-pattern IR assertion.
            # Disable that assertion only for these extra control semantics runs.
            # The original candidate runner below is unmodified and keeps all positive IR gates.
            options = ['-DVerifyIR=false'] + ([] if sve == 'default' else ['-XX:UseSVE=0'])
            argv = [str(a.release_jdk / 'bin/java'), '-XX:ActiveProcessorCount=2', '-Xmx512m',
                    '-jar', str(a.jtreg / 'lib/jtreg.jar'), '-jdk:' + str(image),
                    '-othervm', '-concurrency:1', '-timeoutFactor:2', '-verbose:summary',
                    '-javaoptions:' + ' '.join(options),
                    '-w:' + str(a.out.parent / (a.out.name + '-control-semantics') / (label + '-work')),
                    '-r:' + str(a.out.parent / (a.out.name + '-control-semantics') / (label + '-report'))]
            argv += [str(root / ('test/hotspot/jtreg/compiler/vectorapi/' + t + '.java')) for t in tests]
            commands.append(dict(label=label, argv=argv, tests=tests))
    return commands


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ['release-jdk','debug-jdk','control-jdk','control-debug-jdk','jtreg','frozen','out']:
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--historical-control', action='store_true')
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    commands = control_commands(a)
    if not a.execute:
        print(json.dumps(dict(experiment=EXPERIMENT, control_commands=commands,
            candidate_runner='run_roundtrip_preflight.py unchanged', executes=False), indent=2))
        return
    require(os.uname().machine == 'aarch64', 'Native AArch64 required')
    require(a.historical_control, 'Historical control attribution required')
    require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS')),
            'Inherited JVM options not admitted')
    before = inventory(a.jtreg)
    output = a.out.parent / (a.out.name + '-control-semantics')
    output.mkdir(parents=True, exist_ok=False)
    records = []
    for command in commands:
        log = output / (command['label'] + '.log')
        with log.open('w') as stream:
            status = subprocess.run(command['argv'], stdout=stream, stderr=subprocess.STDOUT, timeout=1200)
        records.append(dict(**command, exit_status=status.returncode, log=record(log)))
        (output / 'commands.json').write_text(json.dumps(records, indent=2) + '\n')
        require(status.returncode == 0, 'Historical-control semantics failed')
        work = output / (command['label'] + '-work')
        reports = {p.stem:p for p in work.rglob('*.jtr')}
        require(set(reports) == set(command['tests']), 'Missing/extra historical-control report')
        require(all('test result: Passed.' in p.read_text() for p in reports.values()),
                'Historical-control report did not pass')
        verify_control_reports(reports)
    # Preserve every candidate IR/semantics/stress/OSR/chain gate and its original arguments.
    run_roundtrip_preflight.main()
    require(inventory(a.jtreg) == before, 'Common harness mutated during candidate/control checks')
    (a.out / 'jtreg83-gate.json').write_text(json.dumps(dict(experiment=EXPERIMENT, passed=True,
        qualified=False, same_harness_consumer_jars=before, historical_control_ir_claim=False,
        candidate_gate='preflight-gate.json', control_semantics=str(output),
        interpretation='Correctness/IR preflight only. Native release assembly and paired performance remain required.'),
        indent=2) + '\n')


if __name__ == '__main__':
    main()
