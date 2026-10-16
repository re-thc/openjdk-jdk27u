#!/usr/bin/env python3
"""Initial native gate for the pinned, unmerged JDK-8392077 proposal."""
import argparse
import itertools
import json
import math
import os
import pathlib
import random
import statistics
import subprocess
import xml.etree.ElementTree as ET

from assembly_cohorts import cohorts
from run_release_causal import EXPECTED, HEADER, BASE, B3, interval, record, rows

CONTROLLER = {
    'FixedVectorProbe.class': '5945f0e3503b90e58884d9ceb5dd7c9368177f8136fe89b66b9b6d784dc67499',
    'ProbeControllerPrimer.class': '4291318c4e190947894cbe0bd8fe64a95d83483812dd6a81f1a9898370a564c4',
}
PROPOSAL = 'Cumulative unqualified6d zero-seed lowering plus narrow grouping; not isolated grouping attribution'
SELECTED_STAGE = 'all'
SOURCE_PAIR = False
SPECS = [{'subject': 'candidate', 'reference': 'base87', 'condition': ['legacy', 'default', 'default', 'conversion'], 'stage': 'recovery'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', 'default', 'default', 'conversion'], 'stage': 'recovery'}, {'subject': 'candidate', 'reference': 'base87', 'condition': ['legacy', '0', 'default', 'conversion'], 'stage': 'recovery'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', '0', 'default', 'conversion'], 'stage': 'recovery'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', 'default', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', 'default', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', 'default', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', '0', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', '0', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['legacy', '0', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', 'default', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', 'default', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', 'default', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', 'default', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', '0', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', '0', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', '0', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['four', '0', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', 'default', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', 'default', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', 'default', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', 'default', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', '0', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', '0', 'default', 'rawBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', '0', 'default', 'directBits'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'rebuilt_b3', 'condition': ['eight', '0', 'default', 'arithmetic'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'base87', 'condition': ['four', 'default', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'base87', 'condition': ['four', '0', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'base87', 'condition': ['eight', 'default', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'candidate', 'reference': 'base87', 'condition': ['eight', '0', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'rebuilt_b3', 'reference': 'b3', 'condition': ['legacy', 'default', 'default', 'conversion'], 'stage': 'retention'}, {'subject': 'rebuilt_b3', 'reference': 'b3', 'condition': ['legacy', '0', 'default', 'conversion'], 'stage': 'retention'}]


def comparisons():
    return [dict(x) for x in SPECS if SELECTED_STAGE == 'all' or x['stage'] == SELECTED_STAGE]


def finish_timing_gate(out, paired, specs):
    summaries = []
    for comparison in specs:
        subject, reference, condition = (comparison[k] for k in ['subject', 'reference', 'condition'])
        group = [r for r in paired if r['comparison'] == comparison]
        logs = [math.log(r['results'][subject]['ns_per_op'] / r['results'][reference]['ns_per_op']) for r in group]
        ci = interval(logs)
        allocation = max(r['results'][subject]['B_per_op'] for r in group)
        primary = subject == 'candidate' and condition[2] == 'default' and not (
            reference == 'b3' and condition[0] == 'legacy' and condition[3] == 'conversion')
        summary = {'comparison': comparison, 'pairs': len(group),
                   'ratio_subject_vs_reference': math.exp(statistics.mean(logs)), 'paired_95_ratio': ci,
                   'subject_ns': statistics.mean(r['results'][subject]['ns_per_op'] for r in group),
                   'reference_ns': statistics.mean(r['results'][reference]['ns_per_op'] for r in group),
                   'subject_max_B_per_op': allocation, 'primary_performance_condition': primary,
                   'passes_initial_gate': (ci[1] <= 1.02 and allocation <= 0.01 and
                       (ci[1] < 1.0 if reference == 'base87' and condition[0] in ['four', 'eight'] else True)) if primary else None,
                   'comparison_role': 'toolchain drift observation' if subject == 'rebuilt_b3'
                       else 'same-toolchain cumulative patch contrast (zero-seed plus grouping)' if reference == 'rebuilt_b3' else 'fresh original-baseline source contrast' if SOURCE_PAIR else 'archived-image contrast'}
        summaries.append(summary)
        print('BACKEND_PAIR_SUMMARY_JSON=' + json.dumps(summary), flush=True)
    (out / 'summary.json').write_text(json.dumps(summaries, indent=2) + '\n')
    gate = {'scope': 'Cumulative patch screen only; individual intervals are not simultaneous proof of zero regressions; qualification remains pending',
            'margin': '2% non-inferiority margin; not literal zero regression or a user-accepted tradeoff',
            'passes': all(r['passes_initial_gate'] for r in summaries if r['primary_performance_condition']),
            'failed_conditions': [r['comparison'] for r in summaries if r['passes_initial_gate'] is False],
            'required_before_qualification': ['focused native semantics and actual IR checks',
                'explicit decoded ordinary-entry assembly review', 'toolchain drift assessment',
                'full Vector API suites and remaining phase qualification'],
            'candidate_qualified': False}
    (out / 'initial-gate.json').write_text(json.dumps(gate, indent=2) + '\n')
    print('BACKEND_INITIAL_GATE_JSON=' + json.dumps(gate), flush=True)
    if not gate['passes']:
        raise SystemExit(2)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ['base', 'b3', 'rebuilt-b3', 'candidate']:
        p.add_argument('--' + name + '-jdk', type=pathlib.Path, required=name!='base')
    p.add_argument('--frozen', type=pathlib.Path, required=True)
    p.add_argument('--controller', type=pathlib.Path, required=True)
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--source', type=pathlib.Path, default=pathlib.Path('.'))
    p.add_argument('--stage', choices=['recovery', 'retention', 'assembly'], required=True)
    p.add_argument('--mode', choices=['timing', 'assembly'], required=True)
    p.add_argument('--pairs', type=int, default=12)
    p.add_argument('--source-input-manifest', type=pathlib.Path)
    p.add_argument('--platform', choices=['linux','mac'], default='linux')
    p.add_argument('--assembly-pair-only', action='store_true')
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    if a.assembly_pair_only and (a.mode!='assembly' or not a.source_input_manifest):p.error('Pair-only assembly requires explicit source inputs and assembly mode')
    if not a.assembly_pair_only and a.base_jdk is None:p.error('Original baseline is required for complete comparisons')
    global SELECTED_STAGE, SPECS, SOURCE_PAIR, PROPOSAL
    expected_kernels, expected_controllers = EXPECTED, CONTROLLER
    if a.source_input_manifest:
        from source_inputs import verify
        binding = verify(a.source_input_manifest, a.frozen, a.controller, a.source)
        require_source_scope = binding.get('scope','complete')
        if require_source_scope!='complete' and not (require_source_scope=='assembly' and a.assembly_pair_only and a.mode=='assembly'):p.error('Non-performance inputs cannot enter timings')
        SOURCE_PAIR = True
        PROPOSAL = 'Source-built classifier ' + binding['source_head']
        expected_kernels, expected_controllers = binding['kernel_classes'], binding['controller_classes']
        SPECS = [x for x in SPECS if x['subject'] == 'candidate' and (a.platform!='mac' or x['condition'][1]=='0')]
    SELECTED_STAGE = 'all' if a.stage == 'assembly' else a.stage
    if (a.mode == 'assembly') != (a.stage == 'assembly'):
        p.error('Assembly stage and mode must agree')
    if a.pairs != 12:
        p.error('The reviewed plan requires exactly twelve balanced adjacent pairs')
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    classes = (a.frozen / 'qualification/classes').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    controller = a.controller.resolve()
    for directory, expected in [(classes, expected_kernels), (controller, expected_controllers)]:
        for name, sha in expected.items():
            if record(directory / name)['sha256'] != sha:
                p.error('Byte-identical input required: ' + name)
    images = {'b3': a.b3_jdk.resolve(),
              'rebuilt_b3': a.rebuilt_b3_jdk.resolve(),
              'candidate': a.candidate_jdk.resolve()}
    if a.base_jdk is not None:images['base87']=a.base_jdk.resolve()
    source = a.source.resolve()
    product_files = ['src/hotspot/cpu/aarch64/aarch64.ad',
                     'src/hotspot/cpu/aarch64/aarch64_vector.ad',
                     'src/hotspot/cpu/aarch64/aarch64_vector_ad.m4']
    if a.source_input_manifest:
        product_files = binding['product_files']
    if a.platform=='mac' and not a.source_input_manifest: p.error('Mac requires a separate source-built experiment')
    cpu = min(os.sched_getaffinity(0)) if a.platform=='linux' else None
    plan = {
        'scope': 'Cumulative zero-seed plus grouping screen; no isolated grouping effect claim; no PR14 publication',
        'assembly_pair_only': a.assembly_pair_only, 'original_baseline': None if a.assembly_pair_only else BASE, 'pr14': B3, 'proposal_head': PROPOSAL,
        'candidate_commit': subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip(),
        'candidate_product_files': [record(source / rel) for rel in product_files],
        'pairs_per_comparison': a.pairs, 'comparisons': comparisons(), 'cpu': cpu,
        'controller_primer': {'cached_controller_passes': 1, 'calls_per_primer_window': 10000,
                             'total_primer_kernel_calls': 61001, 'zero_call_metrics_windows': 1000},
        'qualified_history': {'warmup_calls': 10000, 'calibration_calls': 1000,
                              'windows': 5, 'calls_per_window': 100000},
        'classes': [record(f) for f in sorted(classes.glob('*.class'))],
        'controllers': [record(controller / f) for f in expected_controllers],
        'source_input_manifest': record(a.source_input_manifest) if a.source_input_manifest else None,
        'images': {k: {s: record(v / s) for s in ['bin/java', 'lib/server/libjvm.dylib' if a.platform=='mac' else 'lib/server/libjvm.so', 'lib/modules', 'release']}
                   for k, v in images.items()},
        'diagnostic_criteria_before_results': {
            'margin_label': '2% non-inferiority margin; not literal zero regression or a user-accepted tradeoff',
            'legacy_default_upper_paired_95_ratio_vs_original_baseline': 1.02,
            'compact_and_controls_default_upper_paired_95_ratio_vs_b3': 1.02,
            'candidate_default_upper_paired_95_ratio_vs_same_toolchain_rebuilt_b3': 1.02,
            'rebuilt_vs_archived_b3_legacy': 'Separately observe drift; no patch-causality claim from archived contrast alone',
            'candidate_max_B_per_op': 0.01,
            'uncertainty_unit': 'adjacent JVM process pair; geometric ratio; 20000 pair bootstraps',
            'no_pooling_headers_ISAs_kernels': True,
            'diagnostic_unroll_controls_do_not_substitute_for_default': True},
        'platform': a.platform, 'historical_linux_recovery_claim': False if a.platform=='mac' else None,
        'mode': a.mode, 'stage': a.stage, 'bootstrap_seed': 8392004, 'shuffle_seed': 8392077,
        'timings': 'No graph/assembly/compilation logs or WhiteBox observations; zero compilation_ms required',
        'assembly': 'Separate fresh observed processes; timing values excluded',
        'qualification_prerequisites': ['focused semantics and actual IR checks',
            'explicit decoded ordinary-entry review of removed zero-add and retained accumulator addition',
            'toolchain drift assessment', 'remaining full qualification'],
    }
    (out / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    print('BACKEND_PLAN_JSON=' + json.dumps(plan), flush=True)
    if not a.execute:
        return
    if os.uname().machine not in (('arm64','aarch64') if a.platform=='mac' else ('aarch64',)):
        p.error('Native AArch64 required')
    if os.uname().sysname != ('Darwin' if a.platform=='mac' else 'Linux'): p.error('OS does not match experiment platform')
    if any(os.environ.get(name) for name in ['JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS']):
        p.error('Unplanned inherited JVM options')
    if os.environ.get('GITHUB_SHA') and plan['candidate_commit'] != os.environ['GITHUB_SHA']:
        p.error('Source head differs from the workflow event')

    def launch(image, condition, name, diagnostic=False):
        header, sve, unroll, kernel = condition
        calls = 1000 if diagnostic else 100000
        argv = ([] if a.platform=='mac' else ['taskset','-c',str(cpu)]) + [str(images[image] / 'bin/java'), '-Xms256m', '-Xmx512m',
                '-XX:ActiveProcessorCount=2', '--add-modules=jdk.incubator.vector', '-DvectorBits=128',
                '-DmeasureCalls=' + str(calls), '-Xbatch', '-XX:-TieredCompilation',
                '-XX:CompileCommand=dontinline,FixedVectorProbe::invoke',
                '-XX:CompileCommand=dontinline,PhaseVectorKernels::' + kernel, *HEADER[header]]
        if sve == '0':
            argv += ['-XX:UseSVE=0']
        if unroll != 'default':
            argv += ['-XX:LoopMaxUnroll=' + unroll]
        if diagnostic:
            argv += ['-DobserveCompilation=true', '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI',
                     '-Xbootclasspath/a:' + str(wb), '-XX:+LogCompilation',
                     '-XX:LogFile=' + str(out / (name + '.xml')),
                     '-XX:CompileCommand=print,PhaseVectorKernels::' + kernel, '-XX:+PrintFlagsFinal']
        argv += ['-cp', str(controller) + os.pathsep + str(classes) + os.pathsep + str(wb),
                 'ProbeControllerPrimer', kernel, 'c2']
        raw = out / (name + '.out')
        with raw.open('w') as f:
            run = subprocess.run(argv, stdout=f, stderr=subprocess.STDOUT, cwd=out, timeout=180)
        status = {'argv': argv, 'exit_status': run.returncode, 'diagnostic': diagnostic, 'output': record(raw)}
        (out / (name + '.status.json')).write_text(json.dumps(status, indent=2) + '\n')
        if run.returncode:
            raise RuntimeError(name + ' exited ' + str(run.returncode))
        windows = [r for r in rows(raw) if r['phase'].startswith('measure')]
        if len(windows) != 5 or any(int(r['calls']) != calls for r in windows):
            raise RuntimeError('Fixed workload mismatch: ' + name)
        if not diagnostic and any(int(r['compilation_ms']) != 0 for r in windows):
            raise RuntimeError('Compilation in qualified window: ' + name)
        if diagnostic and any(int(r['normal_before']) != 4 or int(r['normal_after']) != 4 for r in windows):
            raise RuntimeError('Ordinary C2 installation missing: ' + name)
        return {'name': name, 'windows': windows, 'checksum': windows[0]['checksum'],
                'ns_per_op': statistics.mean(int(r['nanoseconds']) / int(r['calls']) for r in windows),
                'B_per_op': max(int(r['allocated_bytes']) / int(r['calls']) for r in windows)}

    if a.mode == 'assembly':
        observed = cohorts(a.platform,a.assembly_pair_only)
        index = []
        expected = len(observed)
        status_path = out / 'assembly-run-status.json'
        status_path.write_text(json.dumps({'expected_methods': expected, 'completed_methods': 0, 'complete': False}) + '\n')
        for condition, image in observed:
            name = 'assembly-' + image + '-' + '-'.join(condition)
            launch(image, condition, name, True)
            kernel = condition[3]
            normal = [n.attrib for n in ET.parse(out / (name + '.xml')).findall('.//nmethod')
                      if n.get('method') == 'PhaseVectorKernels ' + kernel + ' (I)J'
                      and n.get('compile_kind') != 'osr']
            if not normal:
                raise RuntimeError('No separately attributed ordinary entry: ' + name)
            index.append({'name': name, 'condition': condition, 'image': image,
                          'ordinary_entry_nmethods': normal, 'output': record(out / (name + '.out'))})
            (out / 'assembly-index.json').write_text(json.dumps(index, indent=2) + '\n')
            status_path.write_text(json.dumps({'expected_methods': expected, 'completed_methods': len(index),
                                               'complete': len(index) == expected}) + '\n')
        print('BACKEND_ASSEMBLY_INDEX_JSON=' + json.dumps(index), flush=True)
        return

    paired = []
    rng = random.Random(8392077)
    for pair in range(a.pairs):
        shuffled = comparisons()
        rng.shuffle(shuffled)
        for comparison in shuffled:
            subject, reference, condition = (comparison[k] for k in ['subject', 'reference', 'condition'])
            order = [reference, subject] if pair % 2 == 0 else [subject, reference]
            key = subject + '-vs-' + reference + '-' + '-'.join(condition)
            result = {image: launch(image, condition, 'pair%02d-%s-%s' % (pair, image, key)) for image in order}
            if result[reference]['checksum'] != result[subject]['checksum']:
                raise RuntimeError('Scalar checksums differ: ' + key)
            row = {'comparison': comparison, 'pair': pair, 'order': order, 'results': result}
            paired.append(row)
            with (out / 'pairs.jsonl').open('a') as f:
                f.write(json.dumps(row) + '\n')
        print('PAIR_COMPLETED=' + str(pair), flush=True)
    finish_timing_gate(out, paired, comparisons())


if __name__ == '__main__':
    main()
