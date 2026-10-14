#!/usr/bin/env python3
"""One fixed native experiment. Calibration failure permanently skips candidate execution."""
import hashlib
import json
import math
import os
import re
import shutil
import statistics
import subprocess
import sys
import time
import xml.etree.ElementTree as ET
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = Path(os.environ['DIAGNOSTIC_ROOT']).resolve()
OUT = ROOT / 'evidence'
OUT.mkdir(parents=True, exist_ok=True)
PROTOCOL = json.loads((HERE / 'protocol.json').read_text())
BOOT = ROOT / 'boot'
SOURCE = ROOT / 'source'
BASE = ROOT / 'images/base'
CANDIDATE = ROOT / 'images/candidate'
CP = ':'.join([str(ROOT / 'benchmark')] + [str(ROOT / 'jmh' / name) for name in
    ['jmh-generator-annprocess-1.37.jar', 'jmh-core-1.37.jar', 'jopt-simple-5.0.4.jar', 'commons-math3-3.6.1.jar']])


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def save(name, data):
    (OUT / name).write_text(json.dumps(data, indent=2) + '\n')


def run(command, log):
    with (OUT / log).open('w') as stream:
        result = subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT)
    if result.returncode:
        raise RuntimeError(f'{log}: exit {result.returncode}')


def manifest(image):
    return {str(p.relative_to(image)): {'bytes': p.stat().st_size, 'sha256': sha(p)}
            for p in sorted(image.rglob('*')) if p.is_file()}


def host():
    paths = ['/proc/stat', '/proc/loadavg', '/proc/pressure/cpu', '/sys/fs/cgroup/cpu.stat', '/sys/fs/cgroup/cpu.max']
    return {'time_epoch': time.time(), 'affinity': sorted(os.sched_getaffinity(0)),
            'files': {p: Path(p).read_text() for p in paths if Path(p).exists()}}


def verify_benchmark():
    expected = {'bench/MultiplyBench.class': PROTOCOL['benchmark_class_sha256'],
                'bench/jmh_generated/MultiplyBench_intBroadcast_jmhTest.class': PROTOCOL['timed_stub_class_sha256'],
                'META-INF/CompilerHints': PROTOCOL['compiler_hints_sha256']}
    for name, digest in expected.items():
        assert sha(ROOT / 'benchmark' / name) == digest, name
    return {name: sha(ROOT / 'benchmark' / name) for name in expected}


def diagnostic_inputs():
    files = list(HERE.glob('*')) + list((ROOT / 'jmh').glob('*.jar'))
    return {str(p): sha(p) for p in sorted(files) if p.is_file()}


def invoke(label, image, diagnostic=False):
    flags = list(PROTOCOL['target_flags'])
    directory = OUT / label
    directory.mkdir()
    args = ['-prof', 'gc']
    if diagnostic:
        flags += ['-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI',
                  '-Xbootclasspath/a:' + str(ROOT / 'wb'), '--add-opens=java.base/java.lang=ALL-UNNAMED',
                  '-javaagent:' + str(ROOT / 'capture-agent.jar'),
                  '-Ddiagnostic.dir=' + str(directory), '-XX:+LogCompilation',
                  '-XX:LogFile=' + str(directory / 'compilation-%p.xml'),
                  '-Xlog:gc,safepoint:file=' + str(directory / 'events-%p.log') + ':uptimemillis,pid,tid']
        args += ['-prof', 'diagnostic.DiagnosticProfiler']
    classpath = CP + (':' + str(ROOT / 'profiler') if diagnostic else '')
    command = ['taskset', '-c', str(PROTOCOL['cpu']), str(BOOT / 'bin/java'), '-Xint', '-XX:ActiveProcessorCount=1',
               '-cp', classpath, 'org.openjdk.jmh.Main', '^' + PROTOCOL['benchmark'].replace('.', r'\.') + '$',
               '-p', 'length=17', '-p', 'offset=1', '-f', '1', '-wi', '5', '-i', '5', '-w', '1s', '-r', '1s',
               '-jvm', str(image / 'bin/java'), '-jvmArgs', ' '.join(flags), *args,
               '-rf', 'json', '-rff', str(directory / 'jmh.json')]
    record = {'label': label, 'diagnostic_only': diagnostic, 'command': command, 'before': host()}
    save(label + '-command.json', record)
    run(command, label + '.log')
    record['after'] = host()
    record['exit_code'] = 0
    save(label + '-command.json', record)
    rows = json.loads((directory / 'jmh.json').read_text())
    assert len(rows) == 1, label
    assert rows[0]['jvm'] == str(image / 'bin/java'), label
    assert rows[0]['params'] == {'length': '17', 'offset': '1'}, label
    return rows[0]


def calibration_integrity(labels):
    issues = []
    for label in labels:
        row = json.loads((OUT / label / 'jmh.json').read_text())[0]
        if any(v != 0 for v in row['secondaryMetrics']['gc.count']['rawData'][0]):
            issues.append(label + ': measured GC')
        log = (OUT / (label + '.log')).read_text().splitlines()
        first = next((i for i, line in enumerate(log) if re.match(r'Iteration\s+1:', line)), None)
        if first is None:
            issues.append(label + ': missing measurement boundary')
            continue
        target = ['MultiplyBench::intBroadcast', 'intBroadcast_avgt_jmhStub']
        if any(any(t in line for t in target) and re.search(r'\d+\s+\d+', line) for line in log[first:]):
            issues.append(label + ': target compilation/invalidation in measured phase')
        if not any('intBroadcast_avgt_jmhStub' in line and re.search(r'\s4\s', line) for line in log[:first]):
            issues.append(label + ': no Tier 4 timed stub before measurement')
    return issues


def paired_interval(pairs):
    pair_logs = [math.log(b / a) for a, b in pairs]
    assert len(pair_logs) == 8
    values = [statistics.mean(pair_logs[i:i + 2]) for i in range(0, 8, 2)]
    center = statistics.mean(values)
    half = PROTOCOL['calibration']['student_t_df3'] * statistics.stdev(values) / math.sqrt(len(values))
    percent = lambda x: 100 * math.expm1(x)
    return {'runtime_change_percent': percent(center), 'paired_95_interval_percent': [percent(center - half), percent(center + half)],
            'paired_fork_means_ns': pairs, 'block_log_contrasts': values, 'degrees_of_freedom': 3}


def replay_analysis(label):
    directory = OUT / label
    records = [json.loads(p.read_text()) for p in sorted(directory.glob('iteration-*.json'))]
    measured = [r for r in records if r['type'] == 'MEASUREMENT']
    problems = []
    if len(measured) != 5:
        problems.append(f'expected 5 measured records, found {len(measured)}')
    metrics = []
    for r in measured:
        before, after = r['before'], r['after']
        for phase in [before, after]:
            if ('error' in phase or len(phase.get('arrays', {})) != 4 or
                    'schedstat' not in phase or phase.get('worker_cpu_ns', -1) < 0):
                problems.append(f'iteration {r["sequence"]}: incomplete observations')
            normal = phase.get('timed_stub', {}).get('normal')
            if not normal or normal['level'] != 4:
                problems.append(f'iteration {r["sequence"]}: missing actual normal Tier 4 timed stub')
        if before.get('timed_stub', {}).get('normal') != after.get('timed_stub', {}).get('normal'):
            # File names encode before/after; compare nmethod identity and contents instead.
            keys = ['level', 'compile_id', 'entry_address', 'code_begin', 'sha256']
            a = before.get('timed_stub', {}).get('normal') or {}
            b = after.get('timed_stub', {}).get('normal') or {}
            if any(a.get(k) != b.get(k) for k in keys):
                problems.append(f'iteration {r["sequence"]}: timed stub changed')
        ops = r['measured_operations']
        cpu = after.get('worker_cpu_ns', -1) - before.get('worker_cpu_ns', -1)
        a = [int(x) for x in before.get('schedstat', '0 0 0').split()]
        b = [int(x) for x in after.get('schedstat', '0 0 0').split()]
        metrics.append({'sequence': r['sequence'], 'wall_ns_per_op': r['score_ns_per_op'],
                        'worker_cpu_ns_per_op': cpu / ops if ops and cpu >= 0 else None,
                        'sched_runtime_ns_per_op': (b[0] - a[0]) / ops if ops else None,
                        'runnable_delay_ns_per_op': (b[1] - a[1]) / ops if ops else None,
                        'arrays': after.get('arrays'), 'normal_stub': after.get('timed_stub', {}).get('normal')})
    inlining = []
    for path in directory.glob('compilation-*.xml'):
        tree = ET.parse(path)
        for task in tree.iter('task'):
            if 'intBroadcast_avgt_jmhStub' not in task.get('method', ''):
                continue
            klasses = {k.get('id'): k.get('name') for k in task.iter('klass')}
            targets = {m.get('id') for m in task.iter('method') if m.get('name') == 'intBroadcast' and klasses.get(m.get('holder')) == 'bench.MultiplyBench'}
            for parent in task.iter():
                current = None
                for child in parent:
                    if child.tag == 'call': current = child.get('method')
                    elif child.tag in ['inline_success', 'inline_fail'] and current in targets:
                        inlining.append({'compile_id': task.get('compile_id'), 'result': child.tag, 'reason': child.get('reason')})
    actual_ids = {str(phase['timed_stub']['normal']['compile_id'])
                  for record in measured for phase in [record['before'], record['after']]
                  if phase.get('timed_stub', {}).get('normal')}
    successful_ids = {r['compile_id'] for r in inlining if r['result'] == 'inline_success'}
    if not actual_ids or not actual_ids <= successful_ids:
        problems.append('Missing benchmark inlining proof for an observed actual normal timed stub')
    audits = [json.loads(p.read_text()) for p in directory.glob('agent-*.json')]
    if (len(audits) != 1 or audits[0].get('transformed_class') != 'org/openjdk/jmh/runner/BenchmarkHandler' or
            audits[0].get('method') != 'startProfilers' or not audits[0].get('benchmark_and_stub_unchanged')):
        problems.append('Missing or unexpected replay agent transformation audit')
    for blob in directory.glob('stub-*.bin'):
        run(['objdump', '-D', '-b', 'binary', '-m', 'i386:x86-64', '-M', 'intel', str(blob)], str(blob.relative_to(OUT)) + '.asm')
    result = {'diagnostic_only': True, 'observations_complete': not problems, 'problems': problems, 'inlining': inlining, 'measurements': metrics}
    save(label + '-analysis.json', result)
    return result


def main():
    assert PROTOCOL['cpu'] in os.sched_getaffinity(0), 'CPU 2 is unavailable; affinity is not changed'
    save('predeclared-protocol.json', PROTOCOL)
    save('input-hashes.json', verify_benchmark())
    harness_inputs = diagnostic_inputs()
    save('diagnostic-input-hashes-before.json', harness_inputs)
    save('host-before.json', host())
    frozen = manifest(BASE)
    save('base-manifest-before.json', frozen)
    labels, pairs = [], []
    for block in range(4):
        scores = []
        for position, tag in enumerate(PROTOCOL['order']):
            label = f'aa-{block}-{position}-{tag}'
            labels.append(label)
            row = invoke(label, BASE)
            scores.append(row['primaryMetric']['score'])
        pairs += [(scores[0], scores[1]), (scores[3], scores[2])]
    result = paired_interval(pairs)
    issues = calibration_integrity(labels)
    current = manifest(BASE)
    save('base-manifest-after-aa.json', current)
    if current != frozen: issues.append('baseline image changed')
    if verify_benchmark() != json.loads((OUT / 'input-hashes.json').read_text()): issues.append('benchmark input changed')
    lo, hi = result['paired_95_interval_percent']
    result.update(passed=not issues and lo >= -5 and hi <= 5, integrity_issues=issues, criteria=PROTOCOL['calibration'])
    save('aa-calibration.json', result)
    print('A/A CALIBRATION:', json.dumps(result), flush=True)
    replays = []
    for i in range(2):
        label = f'replay-baseline-{i}'
        invoke(label, BASE, True)
        replays.append(replay_analysis(label))
    candidate_run = False
    comparison = None
    if result['passed']:
        run(['bash', str(HERE / 'build.sh'), 'candidate'], 'build-candidate.log')
        candidate_frozen = manifest(CANDIDATE)
        save('candidate-manifest-before.json', candidate_frozen)
        changed = [name for name in sorted(set(frozen) | set(candidate_frozen))
                   if frozen.get(name) != candidate_frozen.get(name)]
        assert changed == ['lib/server/libjvm.debuginfo', 'lib/server/libjvm.so'], f'unexpected candidate image delta: {changed}'
        pairs = []
        comparison_labels = []
        for block in range(4):
            scores = []
            for position, tag in enumerate(PROTOCOL['order']):
                label = f'ab-{block}-{position}-{tag}'
                comparison_labels.append(label)
                row = invoke(label, BASE if tag == 'A' else CANDIDATE)
                scores.append(row['primaryMetric']['score'])
            pairs += [(scores[0], scores[1]), (scores[3], scores[2])]
        comparison = paired_interval(pairs)
        comparison['integrity_issues'] = calibration_integrity(comparison_labels)
        save('ab-comparison.json', comparison)
        for i in range(2):
            label = f'replay-candidate-{i}'
            invoke(label, CANDIDATE, True)
            replays.append(replay_analysis(label))
        after = manifest(CANDIDATE)
        save('candidate-manifest-after.json', after)
        assert after == candidate_frozen, 'candidate image changed'
        candidate_run = True
    else:
        print('Candidate build/execution/comparison skipped: calibration failed. No retry.', flush=True)
    after = manifest(BASE)
    save('base-manifest-final.json', after)
    assert after == frozen, 'baseline image changed'
    verify_benchmark()
    inputs_after = diagnostic_inputs()
    save('diagnostic-input-hashes-after.json', inputs_after)
    assert inputs_after == harness_inputs, 'diagnostic inputs changed'
    save('host-after.json', host())
    save('outcome.json', {'calibrated': result['passed'], 'candidate_executed': candidate_run, 'comparison': comparison,
                          'all_replay_observations_complete': all(r['observations_complete'] for r in replays),
                          'performance_qualified': False, 'note': 'Diagnostic evidence only. PR18 remains draft/unqualified.'})


if __name__ == '__main__':
    main()
