"""One fixed, same-host native experiment; preserve every observation and failure."""
import hashlib, json, math, os, re, shutil, statistics, subprocess, traceback
import xml.etree.ElementTree as ET
from pathlib import Path

here = Path(__file__).resolve().parent
root = Path(os.environ['ARM_ROOT'])
evidence = root / 'evidence'
protocol = json.loads((here / 'protocol.json').read_text())
manifest = json.loads((root / 'manifest.json').read_text())
hardware = json.loads((evidence / 'hardware.json').read_text())
cpus = sorted(os.sched_getaffinity(0))
cpu = cpus[2] if len(cpus) > 2 else cpus[-1]
mode_flags = {'default': [], 'scalar': ['-XX:-UseSuperWord'], 'neon': ['-XX:UseSVE=0', '-XX:MaxVectorSize=16'],
              'sve128': ['-XX:UseSVE=1', '-XX:MaxVectorSize=16'], 'sve256': ['-XX:UseSVE=1', '-XX:MaxVectorSize=32'],
              'sve512': ['-XX:UseSVE=1', '-XX:MaxVectorSize=64']}
common = ['-Xms256m', '-Xmx256m', '-Xshare:off', '-XX:ActiveProcessorCount=1', '-Xbatch']
wbflags = ['-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(root / 'wb')]
result = {'protocol': protocol, 'hardware': hardware, 'selected_cpu': cpu, 'correctness': [], 'calibration': None, 'comparisons': [],
          'performance_qualified': False, 'wide_sve_hardware_qualified': hardware['maximum_sve_vl_bytes'] >= 32,
          'limitations': ['Release CI images: jtreg numeric checks run here; IR checks may be disabled in product builds. Saved actual C2 machine code is checked separately.',
                          'Hosted native runner; four independent pairs, uncertainty reported without selecting samples.',
                          'Identical build configuration/toolchain, except source-identity version tag. Full image differences are recorded.']}

def write(path, value): path.write_text(json.dumps(value, indent=2, allow_nan=False))
def sha(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda: f.read(1024 * 1024), b''): h.update(b)
    return h.hexdigest()
def image_hashes(name):
    image = Path(manifest[name]['jdk'])
    return {str(p.relative_to(image)): {'sha256': sha(p), 'bytes': p.stat().st_size} for p in sorted(image.rglob('*')) if p.is_file()}
def execute(cmd, folder, timeout=300):
    folder.mkdir(parents=True, exist_ok=True)
    write(folder / 'command.json', cmd)
    with (folder / 'stdout.log').open('w') as f:
        p = subprocess.run(list(map(str, cmd)), stdout=f, stderr=subprocess.STDOUT, timeout=timeout)
    (folder / 'exit-code.txt').write_text(str(p.returncode))
    if p.returncode: raise RuntimeError(f'{folder.name}: exit {p.returncode}; see preserved stdout.log')
    return (folder / 'stdout.log').read_text(errors='replace')
def java(name): return manifest[name]['jdk'] + '/bin/java'
def decode(folder):
    for binary in sorted(folder.rglob('*.bin')):
        p = subprocess.run(['objdump', '-D', '-b', 'binary', '-m', 'aarch64', str(binary)], text=True, capture_output=True)
        binary.with_suffix('.asm').write_text(p.stdout + p.stderr)
        if p.returncode: raise RuntimeError('Cannot decode actual AArch64 machine code')
def ci(values):
    mean = statistics.mean(values)
    half = protocol['calibration']['student_t_df3'] * statistics.stdev(values) / math.sqrt(len(values))
    return {'ratio_percent': 100 * math.expm1(mean), 'ci95_percent': [100 * math.expm1(mean - half), 100 * math.expm1(mean + half)],
            'independent_log_ratios': values, 'method': 'Paired log ratios, Student t, df=3'}
def timed(label, name, case):
    method, length, offset, mode = case
    folder = evidence / label
    folder.mkdir()
    flags = common + mode_flags[mode] + wbflags + ['-XX:+LogCompilation', '-XX:LogFile=' + str(folder / 'compilation.xml'),
        '-XX:+PrintCompilation', '-Darm.dir=' + str(folder)]
    cmd = ['taskset', '-c', str(cpu), java('candidate'), '-Xint', '-cp', manifest['classpath'], 'org.openjdk.jmh.Main',
        '^bench.MultiplyBench.' + method + '$', '-jvm', java(name), '-jvmArgs', ' '.join(flags),
        '-p', f'length={length}', '-p', f'offset={offset}', '-bm', 'avgt', '-tu', 'ns', '-t', '1', '-f', '1',
        '-wi', str(protocol['warmup_iterations']), '-i', str(protocol['measurement_iterations']), '-w', '1s', '-r', '1s',
        '-prof', 'gc', '-prof', 'arm.ArmObservation', '-rf', 'json', '-rff', str(folder / 'jmh.json'), '-foe', 'true']
    execute(cmd, folder, 180)
    entries = json.loads((folder / 'jmh.json').read_text())
    assert len(entries) == 1
    data = entries[0]
    score = data['primaryMetric']['score']
    assert math.isfinite(score) and score > 0
    measurements = sorted([json.loads(p.read_text()) for p in folder.glob('iteration-*.json')], key=lambda x: x['sequence'])
    measurements = [x for x in measurements if x['type'] == 'MEASUREMENT']
    faults, snapshots, alloc, cpu_times = [], [], [], []
    if len(measurements) != 5: faults.append(f'Expected 5 measurements, got {len(measurements)}')
    for record in measurements:
        before, after = record['before'], record['after']
        for stage in [before, after]:
            if 'error' in stage: faults.append(stage['error']); continue
            stub = stage['timed_stub']['normal']
            if not stub or stub['level'] != 4: faults.append('Timed normal C2 stub unavailable')
            else: snapshots.append((stub['compile_id'], stub['sha256']))
            if 'worker_error' in stage: faults.append('Worker thread not uniquely identified')
        if 'worker_allocated_bytes' in before and 'worker_allocated_bytes' in after:
            alloc.append((after['worker_allocated_bytes'] - before['worker_allocated_bytes']) / record['measured_operations'])
            cpu_times.append(after['worker_cpu_ns'] - before['worker_cpu_ns'])
    if len(set(snapshots)) != 1: faults.append('Measured timed stub changed')
    gc_count = data.get('secondaryMetrics', {}).get('gc.count', {}).get('score')
    if gc_count is None or not math.isfinite(gc_count) or gc_count != 0: faults.append('Measured GC count is not zero')
    try:
        tree = ET.parse(folder / 'compilation.xml')
        start = min(x['before']['uptime_ms'] for x in measurements) / 1000
        targets = set()
        for n in tree.iter('nmethod'):
            m = n.get('method', '')
            if ('bench.MultiplyBench ' + method + ' ') in m or (method + '_avgt_jmhStub ') in m:
                targets.add(n.get('compile_id'))
                if float(n.get('stamp', 0)) >= start: faults.append('Target compiled during measurement')
        for n in tree.iter():
            if n.tag in ['make_not_entrant', 'deoptimized'] and n.get('compile_id') in targets and float(n.get('stamp', 0)) >= start:
                faults.append('Target invalidated during measurement')
    except Exception as e: faults.append('Cannot verify compilation lifecycle: ' + str(e))
    decode(folder)
    out = {'label': label, 'image': name, 'case': case, 'score_ns_per_op': score,
           'raw_measurements_ns_per_op': data['primaryMetric']['rawData'], 'gc_count': gc_count,
           'worker_allocated_bytes_per_op': alloc, 'worker_cpu_ns': cpu_times,
           'code_integrity_errors': sorted(set(faults)), 'stable_timed_c2': not faults}
    write(folder / 'assessment.json', out)
    print(json.dumps(out), flush=True)
    return out

try:
    assert hardware['native']
    (evidence / 'cpu-affinity-topology.txt').write_text(subprocess.check_output(['lscpu', '-e'], text=True))
    for name in ['base', 'candidate']:
        hashes = image_hashes(name)
        write(evidence / (name + '-image-before.json'), hashes)
        execute([java(name), '-XshowSettings:vm', '-XX:+PrintFlagsFinal', '-version'], evidence / (name + '-flags'))
    before_base = json.loads((evidence / 'base-image-before.json').read_text())
    before_candidate = json.loads((evidence / 'candidate-image-before.json').read_text())
    write(evidence / 'image-differences.json', {n: {'base': before_base.get(n), 'candidate': before_candidate.get(n)}
         for n in sorted(before_base.keys() | before_candidate.keys()) if before_base.get(n) != before_candidate.get(n)})
    scenarios = [0]
    modes = ['default', 'neon']
    if hardware['sve']:
        scenarios.append(1); modes.append('sve128')
    if hardware['maximum_sve_vl_bytes'] >= 32:
        scenarios.append(2); modes.append('sve256')
    if hardware['maximum_sve_vl_bytes'] >= 64:
        scenarios.append(3); modes.append('sve512')
    result['supported_test_scenarios'] = scenarios
    result['unsupported_test_scenarios'] = sorted(set(range(4)) - set(scenarios))
    repo = Path(os.environ['GITHUB_WORKSPACE'])
    tests = ['compiler/c2/irTests/TestAArch64SVEMulVConstants.java', 'compiler/c2/irTests/TestLongVectorMultiplyReassociation.java']
    for name in ['base', 'candidate']:
        folder = evidence / (name + '-jtreg')
        args = [java(name), '-Xmx512m', '-jar', manifest['jtreg']['jar'], '-jdk:' + manifest[name]['jdk'], '-a', '-v:summary',
            '-w:' + str(folder / 'work'), '-r:' + str(folder / 'report'), '-timeoutFactor:3',
            '-javaoptions:-DScenarios=' + ','.join(map(str, scenarios)) + ' -DWarmup=2000' + (' -DVerifyIR=false' if name == 'base' else ''),
            *[str(repo / 'test/hotspot/jtreg' / x) for x in tests]]
        harness_options = args.index('-jar') + 2
        execute([*args[:harness_options], '-listTests', *args[harness_options:]],
                evidence / (name + '-jtreg-preflight'), 120)
        execute(args, folder, 1200)
        result['correctness'].append({'image': name, 'tests': tests, 'scenarios': scenarios, 'passed': True,
                                     'ir': 'Product build; see test logs for IR availability. Machine code separately retained.'})
        for tier, flags, warm in [('interpreter', ['-Xint'], '1'), ('c1', ['-XX:TieredStopAtLevel=1'], '500'), ('scalar-c2', ['-XX:-UseSuperWord'], '500')]:
            text = execute([java(name), *common, *flags, '-cp', root / 'classes', 'MultiplyLoops', warm], evidence / f'{name}-{tier}')
            assert 'checksum=3c84c971e300cb2c' in text, text
            result['correctness'].append({'image': name, 'tier': tier, 'checksum': '3c84c971e300cb2c', 'passed': True})
        for mode in modes:
            folder = evidence / f'codegen-{name}-{mode}'
            text = execute([java(name), *common, *mode_flags[mode], *wbflags, '-XX:-TieredCompilation', '-cp', root / 'classes',
                            'DumpMultiplyCode', folder], folder)
            assert text.count('checksum=3c84c971e300cb2c') == 2
            decode(folder)
            execute([java(name), *common, *mode_flags[mode], *wbflags, '-XX:-TieredCompilation',
                     '-XX:CompileCommand=exclude,BenchmarkCheck::check', '-cp', manifest['classpath'], 'BenchmarkCheck'],
                    evidence / f'benchmark-check-{name}-{mode}', 300)
            result['correctness'].append({'image': name, 'mode': mode, 'frozen_benchmark_arrays': 'passed', 'c2': True, 'reference': 'interpreted Java'})
    # Full upstream range regression, candidate only; unchanged baseline may contain that upstream bug.
    folder = evidence / 'candidate-range-jtreg'
    execute([java('candidate'), '-Xmx512m', '-jar', manifest['jtreg']['jar'], '-jdk:' + manifest['candidate']['jdk'], '-a', '-v:summary',
             '-w:' + str(folder / 'work'), '-r:' + str(folder / 'report'),
             str(repo / 'test/hotspot/jtreg/compiler/vectorapi/TestVectorMulLongToSignedUnsignedInt.java')], folder, 600)
    result['correctness'].append({'image': 'candidate', 'test': 'TestVectorMulLongToSignedUnsignedInt', 'passed': True})
    write(evidence / 'correctness-complete.json', result)
    blocks, calibration_forks = [], []
    for block in range(4):
        observations = []
        for slot, arm in enumerate('ABBA'):
            observation = timed(f'aa-{block}-{slot}-{arm}', 'base', protocol['calibration']['case'])
            observations.append(observation); calibration_forks.append(observation)
        a = statistics.mean(math.log(observations[x]['score_ns_per_op']) for x in [0, 3])
        b = statistics.mean(math.log(observations[x]['score_ns_per_op']) for x in [1, 2])
        blocks.append(b - a)
    calibration = ci(blocks)
    calibration['all_forks'] = calibration_forks
    calibration['passed'] = calibration['ci95_percent'][0] >= -5 and calibration['ci95_percent'][1] <= 5 and all(x['stable_timed_c2'] for x in calibration_forks)
    result['calibration'] = calibration
    write(evidence / 'calibration.json', calibration)
    print('CALIBRATION=' + json.dumps(calibration), flush=True)
    cases = protocol['comparison']['cases_always'] + protocol['comparison']['additional_if_sve256' if hardware['maximum_sve_vl_bytes'] >= 32 else 'fallback_if_no_sve256']
    for index, case in enumerate(cases):
        pairs, forks = [], []
        for pair, order in enumerate(protocol['comparison']['order']):
            observations = {}
            for arm in order:
                observation = timed(f'ab-{index}-{pair}-{arm}', 'base' if arm == 'A' else 'candidate', case)
                observations[arm] = observation; forks.append(observation)
            pairs.append(math.log(observations['B']['score_ns_per_op'] / observations['A']['score_ns_per_op']))
        comparison = {'case': case, **ci(pairs), 'all_forks': forks,
            'base_ns_per_op': statistics.geometric_mean(x['score_ns_per_op'] for x in forks if x['image'] == 'base'),
            'candidate_ns_per_op': statistics.geometric_mean(x['score_ns_per_op'] for x in forks if x['image'] == 'candidate')}
        comparison['integrity_passed'] = all(x['stable_timed_c2'] for x in forks)
        comparison['qualified'] = calibration['passed'] and comparison['integrity_passed']
        comparison['measured_improvement'] = comparison['qualified'] and comparison['ci95_percent'][1] < 0
        comparison['significant_regression_above_5_percent'] = comparison['ci95_percent'][0] > 5
        result['comparisons'].append(comparison)
        write(evidence / 'summary.json', result)
    result['completed_fixed_protocol'] = True
    controls = [x for x in result['comparisons'] if x['case'][0] == 'differentLongs' or x['case'][3] == 'scalar' or 'Broadcast' in x['case'][0] and x['case'][3] != 'sve256']
    result['performance_qualified'] = calibration['passed'] and all(x['integrity_passed'] for x in result['comparisons']) and not any(x['significant_regression_above_5_percent'] for x in controls)
except Exception:
    result['error'] = traceback.format_exc()
    print(result['error'], flush=True)
    raise
finally:
    for name in ['base', 'candidate']:
        try:
            after = image_hashes(name)
            write(evidence / (name + '-image-after.json'), after)
            result[name + '_image_unchanged'] = after == json.loads((evidence / (name + '-image-before.json')).read_text())
            if not result[name + '_image_unchanged']: result['performance_qualified'] = False
        except Exception as e:
            result[name + '_image_verification_error'] = str(e)
            result['performance_qualified'] = False
    write(evidence / 'summary.json', result)
    print('FINAL=' + json.dumps({k: v for k, v in result.items() if k not in ['comparisons', 'hardware', 'protocol', 'calibration']}), flush=True)
