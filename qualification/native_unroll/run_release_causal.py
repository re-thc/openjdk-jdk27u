#!/usr/bin/env python3
"""Fixed, adjacent process pairs and separately attributed release assembly."""
import argparse, csv, hashlib, itertools, json, math, os, pathlib, random, re
import statistics, subprocess, time, xml.etree.ElementTree as ET

EXPECTED = {'PhaseVectorKernels.class': 'ae574d88e5a124ae3c10e8dc7980454621b34fa836c079275f3604272e79f71c',
            'PhaseVectorProbe.class': 'd73b7723df01c54660c8e3f8336f4bec83fa2126a2278b3d5b9d39c43b1a3675'}
HEADER = {'legacy': ['-XX:-UseCompactObjectHeaders'], 'four': [], 'eight': ['-XX:-UseFourByteObjectHeaders']}
BASE = '87edd79d3104ff502f7befec034716b081436f49'
B3 = 'b3ce67e362c3b1678fcf3d18ee714182b2395c86'

def record(p):
    return {'path': str(p), 'bytes': p.stat().st_size, 'sha256': hashlib.file_digest(p.open('rb'), 'sha256').hexdigest()}

def interval(log_ratios):
    rng = random.Random(8392004)
    n = len(log_ratios)
    samples = sorted(math.exp(statistics.mean(rng.choices(log_ratios, k=n))) for _ in range(20000))
    return [samples[499], samples[19499]]

def rows(path):
    text = path.read_text().split('MEASURED_PASS_BEGIN' + chr(10))[-1]
    data = [line for line in text.splitlines() if line.startswith(('kernel,phase,', 'conversion,', 'rawBits,', 'directBits,', 'arithmetic,'))]
    return list(csv.DictReader(data))

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--base-jdk', type=pathlib.Path, required=True)
    p.add_argument('--patched-jdk', type=pathlib.Path, required=True)
    p.add_argument('--frozen', type=pathlib.Path, required=True)
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--primer-classes', type=pathlib.Path, default=pathlib.Path('controller-classes'))
    p.add_argument('--pairs', type=int, default=12)
    p.add_argument('--calls', type=int, default=100000)
    p.add_argument('--execute', action='store_true')
    p.add_argument('--diagnostics-only', action='store_true')
    p.add_argument('--timings-only', action='store_true')
    a = p.parse_args()
    if a.pairs < 12 or a.pairs % 2: p.error('At least twelve balanced pairs required')
    if a.calls != 100000: p.error('Frozen fixed common workload is 100000 calls/window')
    out = a.out.resolve()
    if out.exists() and any(out.iterdir()): p.error('Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    classes = (a.frozen / 'qualification/classes').resolve()
    wb = (a.frozen / 'qualification/whitebox').resolve()
    for name, sha in EXPECTED.items():
        if record(classes / name)['sha256'] != sha: p.error('Frozen class mismatch: ' + name)
    primer = a.primer_classes.resolve()
    if not (primer / 'ProbeControllerPrimer.class').is_file(): p.error('Missing compiled controller primer')
    images = {'base87': a.base_jdk.resolve(), 'b3': a.patched_jdk.resolve()}
    # Primary: legacy conversion under both ISAs and default/1/2/4 unroll.
    conditions = list(itertools.product(['legacy'], ['default', '0'], ['default', '1', '2', '4'], ['conversion']))
    # Compact-header gains and raw/direct/arithmetic controls remain separate.
    conditions += list(itertools.product(['four', 'eight'], ['default', '0'], ['default'], ['conversion']))
    conditions += list(itertools.product(['legacy', 'four', 'eight'], ['default', '0'], ['default'], ['rawBits', 'directBits', 'arithmetic']))
    cpu = min(os.sched_getaffinity(0))
    plan = {'scope': 'Release causal diagnostic, no compiler policy changes', 'base': BASE, 'patched': B3,
            'pairs': a.pairs, 'controller_primer': {'frozen_probe_passes': 1, 'calls_per_primer_window': 10000, 'total_primer_kernel_calls': 61001, 'zero_call_metrics_windows': 1000, 'class': record(primer / 'ProbeControllerPrimer.class')}, 'warmup_calls': 10000, 'calibration_calls': 1000, 'windows': 5,
            'calls_per_window': a.calls, 'conditions': conditions, 'cpu': cpu,
            'controller': record(primer / 'FixedVectorProbe.class'), 'diagnostics_only': a.diagnostics_only, 'timings_only': a.timings_only,
            'classes': [record(f) for f in sorted(classes.glob('*.class'))],
            'whitebox': [record(f) for f in sorted(wb.rglob('*.class'))],
            'images': {k: {s: record(v / s) for s in ['bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release']} for k,v in images.items()},
            'acceptance_before_results': {'candidate_legacy_upper_paired_95_ratio_vs_base': 1.02,
              'candidate_compact_and_controls_upper_paired_95_ratio_vs_b3': 1.02,
              'candidate_no_new_allocation_B_per_op': 0.01,
              'no_pooling_headers_ISAs_kernels': True,
              'uncertainty_unit': 'adjacent process pair; geometric mean of paired ratios, 20000 pair bootstraps'},
            'timings': 'No graph printing, assembly printing, compilation logs or WhiteBox observation',
            'assembly': 'Separate fresh observed processes; all timing outputs excluded'}
    (out / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    if not a.execute:
        print('PLAN_JSON=' + json.dumps(plan)); return
    if os.uname().machine != 'aarch64': p.error('Native AArch64 required')

    def launch(image, condition, name, diagnostic=False):
        header, sve, unroll, kernel = condition
        argv = ['taskset', '-c', str(cpu), str(images[image] / 'bin/java'), '-Xms256m', '-Xmx512m',
                '-XX:ActiveProcessorCount=2', '--add-modules=jdk.incubator.vector', '-DvectorBits=128',
                '-DmeasureCalls=' + str(1000 if diagnostic else a.calls), '-Xbatch', '-XX:-TieredCompilation',
                '-XX:CompileCommand=dontinline,FixedVectorProbe::invoke',
                '-XX:CompileCommand=dontinline,PhaseVectorKernels::' + kernel, *HEADER[header]]
        if sve == '0': argv += ['-XX:UseSVE=0']
        if unroll != 'default': argv += ['-XX:LoopMaxUnroll=' + unroll]
        if diagnostic:
            argv += ['-DobserveCompilation=true', '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI',
                     '-Xbootclasspath/a:' + str(wb), '-XX:+LogCompilation', '-XX:LogFile=' + str(out / (name + '.xml')),
                     '-XX:CompileCommand=print,PhaseVectorKernels::' + kernel, '-XX:+PrintFlagsFinal']
        argv += ['-cp', str(primer) + os.pathsep + str(classes) + os.pathsep + str(wb), 'ProbeControllerPrimer', kernel, 'c2']
        raw = out / (name + '.out')
        with raw.open('w') as f:
            r = subprocess.run(argv, stdout=f, stderr=subprocess.STDOUT, cwd=out, timeout=180)
        status = {'argv': argv, 'exit_status': r.returncode, 'output': record(raw), 'diagnostic': diagnostic}
        (out / (name + '.status.json')).write_text(json.dumps(status, indent=2) + '\n')
        if r.returncode: raise RuntimeError(name + ' failed ' + str(r.returncode))
        measurements = [r for r in rows(raw) if r['phase'].startswith('measure')]
        if len(measurements) != 5: raise RuntimeError(name + ' missing fixed windows')
        if any(int(r['calls']) != (1000 if diagnostic else a.calls) for r in measurements): raise RuntimeError('Workload mismatch')
        if diagnostic and any(int(r['normal_before']) != 4 or int(r['normal_after']) != 4 for r in measurements): raise RuntimeError('Ordinary C2 missing')
        if not diagnostic and any(int(r['compilation_ms']) != 0 for r in measurements): raise RuntimeError('Compilation occurred in window ' + name)
        return {'ns_per_op': statistics.mean(int(r['nanoseconds']) / int(r['calls']) for r in measurements),
                'B_per_op': statistics.mean(int(r['allocated_bytes']) / int(r['calls']) for r in measurements),
                'checksum': measurements[0]['checksum'], 'windows': measurements, 'name': name}

    if a.diagnostics_only:
        assembly = []
        for cond in conditions[:12]:
            for image in images:
                name = 'assembly-' + image + '-' + '-'.join(cond)
                launch(image, cond, name, True)
                tree = ET.parse(out / (name + '.xml'))
                normal = [n.attrib for n in tree.findall('.//nmethod') if n.get('method') == 'PhaseVectorKernels conversion (I)J' and n.get('compile_kind') != 'osr']
                if not normal: raise RuntimeError('Missing ordinary-entry nmethod ' + name)
                assembly.append({'name': name, 'condition': cond, 'image': image, 'ordinary_entry_nmethods': normal,
                                 'assembly_output': record(out / (name + '.out'))})
        (out / 'assembly-index.json').write_text(json.dumps(assembly, indent=2))
        print('ASSEMBLY_INDEX_JSON=' + json.dumps(assembly), flush=True)
        return

    paired = []
    rng = random.Random(8384963)
    for pair in range(a.pairs):
        shuffled = conditions.copy(); rng.shuffle(shuffled)
        for cond in shuffled:
            key = '-'.join(cond)
            order = ['base87', 'b3'] if pair % 2 == 0 else ['b3', 'base87']
            result = {image: launch(image, cond, 'pair%02d-%s-%s' % (pair, image, key)) for image in order}
            if result['base87']['checksum'] != result['b3']['checksum']: raise RuntimeError('Pair scalar checksums differ')
            row = {'condition': cond, 'pair': pair, 'order': order, 'results': result}
            paired.append(row)
            with (out / 'pairs.jsonl').open('a') as f: f.write(json.dumps(row) + '\n')
        print('PAIR_COMPLETED=' + str(pair), flush=True)
    summaries = []
    for cond in conditions:
        group = [r for r in paired if r['condition'] == cond]
        logs = [math.log(r['results']['b3']['ns_per_op'] / r['results']['base87']['ns_per_op']) for r in group]
        summary = {'condition': cond, 'pairs': len(group), 'ratio_b3_vs_base': math.exp(statistics.mean(logs)), 'paired_95_ratio': interval(logs),
          'base_ns': statistics.mean(r['results']['base87']['ns_per_op'] for r in group),
          'b3_ns': statistics.mean(r['results']['b3']['ns_per_op'] for r in group),
          'base_B': statistics.mean(r['results']['base87']['B_per_op'] for r in group),
          'b3_B': statistics.mean(r['results']['b3']['B_per_op'] for r in group)}
        summaries.append(summary); print('RELEASE_PAIR_SUMMARY_JSON=' + json.dumps(summary), flush=True)
    (out / 'summary.json').write_text(json.dumps(summaries, indent=2) + '\n')
    if a.timings_only: return
    # Assembly twins use the identical frozen kernel and compiler flags. WhiteBox checks installation.
    assembly = []
    for cond in conditions[:12]:
        for image in images:
            name = 'assembly-' + image + '-' + '-'.join(cond)
            launch(image, cond, name, True)
            tree = ET.parse(out / (name + '.xml'))
            normal = [n.attrib for n in tree.findall('.//nmethod') if n.get('method') == 'PhaseVectorKernels conversion (I)J' and n.get('compile_kind') != 'osr']
            if not normal: raise RuntimeError('Missing ordinary-entry nmethod ' + name)
            assembly.append({'name': name, 'condition': cond, 'image': image, 'ordinary_entry_nmethods': normal,
                             'assembly_output': record(out / (name + '.out'))})
    (out / 'assembly-index.json').write_text(json.dumps(assembly, indent=2))
    print('ASSEMBLY_INDEX_JSON=' + json.dumps(assembly), flush=True)

if __name__ == '__main__': main()
