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

from run_release_causal import EXPECTED, HEADER, BASE, B3, interval, record, rows

CONTROLLER = {
    'FixedVectorProbe.class': '5945f0e3503b90e58884d9ceb5dd7c9368177f8136fe89b66b9b6d784dc67499',
    'ProbeControllerPrimer.class': '4291318c4e190947894cbe0bd8fe64a95d83483812dd6a81f1a9898370a564c4',
}
PROPOSAL = '1281953c5ca1492f214e90522190a7ba46c39811'


def comparisons():
    result = []
    for sve, unroll in itertools.product(['default', '0'], ['default', '1', '2', '4']):
        result.append({'reference': 'base87', 'condition': ['legacy', sve, unroll, 'conversion']})
    for sve in ['default', '0']:
        result.append({'reference': 'b3', 'condition': ['legacy', sve, 'default', 'conversion']})
    for header, sve in itertools.product(['four', 'eight'], ['default', '0']):
        result.append({'reference': 'b3', 'condition': [header, sve, 'default', 'conversion']})
    for header, sve, kernel in itertools.product(['legacy', 'four', 'eight'], ['default', '0'],
                                                ['rawBits', 'directBits', 'arithmetic']):
        result.append({'reference': 'b3', 'condition': [header, sve, 'default', kernel]})
    for comparison in result:
        comparison['subject'] = 'candidate'
    for header, sve, kernel in itertools.product(['legacy', 'four', 'eight'], ['default', '0'],
                                                ['conversion', 'rawBits', 'directBits', 'arithmetic']):
        result.append({'subject': 'candidate', 'reference': 'rebuilt_b3',
                       'condition': [header, sve, 'default', kernel]})
    for sve in ['default', '0']:
        result.append({'subject': 'rebuilt_b3', 'reference': 'b3',
                       'condition': ['legacy', sve, 'default', 'conversion']})
    return result


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
                   'passes_initial_gate': (ci[1] <= 1.02 and allocation <= 0.01) if primary else None,
                   'comparison_role': 'toolchain drift observation' if subject == 'rebuilt_b3'
                       else 'same-toolchain patch contrast' if reference == 'rebuilt_b3' else 'archived-image contrast'}
        summaries.append(summary)
        print('BACKEND_PAIR_SUMMARY_JSON=' + json.dumps(summary), flush=True)
    (out / 'summary.json').write_text(json.dumps(summaries, indent=2) + '\n')
    gate = {'scope': 'Initial performance/allocation screening only; candidate qualification remains pending',
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
        p.add_argument('--' + name + '-jdk', type=pathlib.Path, required=True)
    p.add_argument('--frozen', type=pathlib.Path, required=True)
    p.add_argument('--controller', type=pathlib.Path, required=True)
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--source', type=pathlib.Path, default=pathlib.Path('.'))
    p.add_argument('--mode', choices=['timing', 'assembly'], required=True)
    p.add_argument('--pairs', type=int, default=12)
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    if a.pairs < 12 or a.pairs % 2:
        p.error('At least twelve balanced adjacent pairs required')
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()):
        p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    classes = (a.frozen / 'qualification/classes').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    controller = a.controller.resolve()
    for directory, expected in [(classes, EXPECTED), (controller, CONTROLLER)]:
        for name, sha in expected.items():
            if record(directory / name)['sha256'] != sha:
                p.error('Byte-identical input required: ' + name)
    images = {'base87': a.base_jdk.resolve(), 'b3': a.b3_jdk.resolve(),
              'rebuilt_b3': a.rebuilt_b3_jdk.resolve(),
              'candidate': a.candidate_jdk.resolve()}
    source = a.source.resolve()
    product_files = ['src/hotspot/cpu/aarch64/aarch64_vector.ad',
                     'src/hotspot/cpu/aarch64/aarch64_vector_ad.m4']
    cpu = min(os.sched_getaffinity(0))
    plan = {
        'scope': 'Initial diagnostic gate; unmerged backend proposal, no PR14 publication',
        'original_baseline': BASE, 'pr14': B3, 'proposal_head': PROPOSAL,
        'candidate_commit': subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip(),
        'candidate_product_files': [record(source / rel) for rel in product_files],
        'pairs_per_comparison': a.pairs, 'comparisons': comparisons(), 'cpu': cpu,
        'controller_primer': {'cached_controller_passes': 1, 'calls_per_primer_window': 10000,
                             'total_primer_kernel_calls': 61001, 'zero_call_metrics_windows': 1000},
        'qualified_history': {'warmup_calls': 10000, 'calibration_calls': 1000,
                              'windows': 5, 'calls_per_window': 100000},
        'classes': [record(f) for f in sorted(classes.glob('*.class'))],
        'controllers': [record(controller / f) for f in CONTROLLER],
        'images': {k: {s: record(v / s) for s in ['bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release']}
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
        'mode': a.mode,
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
    if os.uname().machine != 'aarch64':
        p.error('Native AArch64 required')

    def launch(image, condition, name, diagnostic=False):
        header, sve, unroll, kernel = condition
        calls = 1000 if diagnostic else 100000
        argv = ['taskset', '-c', str(cpu), str(images[image] / 'bin/java'), '-Xms256m', '-Xmx512m',
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
                'B_per_op': statistics.mean(int(r['allocated_bytes']) / int(r['calls']) for r in windows)}

    if a.mode == 'assembly':
        conditions = [r['condition'] for r in comparisons() if r['reference'] == 'base87']
        for header, sve, kernel in itertools.product(['legacy', 'four', 'eight'], ['default', '0'], ['rawBits']):
            conditions.append([header, sve, 'default', kernel])
        for header, sve in itertools.product(['four', 'eight'], ['default', '0']):
            conditions.append([header, sve, 'default', 'conversion'])
        index = []
        expected = sum(4 if c[0] == 'legacy' and c[3] == 'conversion' else 3 for c in conditions)
        status_path = out / 'assembly-run-status.json'
        status_path.write_text(json.dumps({'expected_methods': expected, 'completed_methods': 0, 'complete': False}) + '\n')
        for condition in conditions:
            image_names = images if condition[0] == 'legacy' and condition[3] == 'conversion' else ['b3', 'rebuilt_b3', 'candidate']
            for image in image_names:
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
