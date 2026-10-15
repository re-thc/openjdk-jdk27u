"""One fixed quiet C1/C2 comparison. Never retries or qualifies shipping."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import random
import statistics
import subprocess
import time

HERE = Path(__file__).resolve().parent


def save(path, value):
    with path.open('x') as stream:
        json.dump(value, stream, indent=2)
        stream.write('\n')


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def plan():
    value = json.loads((HERE / 'plan.json').read_text())
    slots = value['slots']
    if len(slots) != 72 or [s['index'] for s in slots] != list(range(72)):
        raise ValueError('Expected exactly 72 unique fixed slots')
    if any(set(s) != {'index', 'block', 'tier', 'label'} for s in slots):
        raise ValueError('Unexpected slot fields')
    for block in range(12):
        for tier in ('c1', 'c2'):
            labels = [s['label'] for s in slots if s['block'] == block and s['tier'] == tier]
            if sorted(labels) != ['a', 'base', 'control']:
                raise ValueError('Missing/duplicate tier/block label')
    return value


def verify_inputs():
    inputs = json.loads((HERE / 'inputs.json').read_text())
    for name, expected in inputs.items():
        if sha(HERE.parent / name) != expected:
            raise ValueError('Payload changed: ' + name)
    return inputs


def native():
    if platform.system() != 'Linux' or platform.machine() != 'x86_64' or os.getuid() == 0:
        raise ValueError('Requires ordinary-user native Linux x86_64')
    if 0 not in os.sched_getaffinity(0):
        raise ValueError('CPU0 unavailable; no alternate CPU/host')
    cpu = Path('/proc/cpuinfo').read_text()
    if 'GenuineIntel' not in cpu and 'AuthenticAMD' not in cpu:
        raise ValueError('Requires first assigned Intel/AMD x86_64 VM')
    if os.environ.get('GITHUB_RUN_ATTEMPT', '1') != '1':
        raise ValueError('Only one run attempt is authorized')
    for name in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'LD_PRELOAD'):
        if os.environ.get(name):
            raise ValueError('Unexpected process options: ' + name)


def preflight(out):
    out.mkdir()
    native()
    value = plan()
    inputs = verify_inputs()
    save(out / 'quiet-plan.json', value)
    save(out / 'payload-hashes.json', inputs)
    (out / 'runner-cpuinfo.txt').write_text(Path('/proc/cpuinfo').read_text())
    save(out / 'quiet-preflight.json', dict(uname=list(platform.uname()),
         cpu_affinity=sorted(os.sched_getaffinity(0)), uid=os.getuid(),
         boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
         run_id=os.environ.get('GITHUB_RUN_ID'), attempt=os.environ.get('GITHUB_RUN_ATTEMPT'),
         expected_forks=len(value['slots']), measurement_started=False))


def validate_metrics(metrics, tier, value):
    count = value['calls_per_batch'][tier]
    if metrics.get('mode') != 'unbound' or metrics.get('count') != count or metrics.get('warm') != 30:
        raise ValueError('Unexpected case/count/warmup')
    if metrics.get('sink') != count * (count - 1) // 2:
        raise ValueError('Checksum mismatch')
    for name in ('wall_ns', 'cpu_ns'):
        samples = metrics.get(name)
        if not isinstance(samples, list) or len(samples) != 10:
            raise ValueError('Missing samples')
        if any(type(x) is not int or x <= 0 for x in samples):
            raise ValueError('Invalid/nonpositive sample')


def ratio(left, right):
    logs = [math.log(x / y) for x, y in zip(left, right)]
    rng = random.Random(20261016)
    boot = sorted(math.exp(math.fsum(rng.choices(logs, k=12)) / 12) for _ in range(10000))
    return dict(n=12, ratio=math.exp(math.fsum(logs) / 12), lo=boot[250], hi=boot[9750],
                left_median=statistics.median(left), right_median=statistics.median(right),
                pairs=[dict(block=b, left=x, right=y, ratio=x/y) for b, (x, y) in enumerate(zip(left, right))])


def assess(rows, value):
    if len(rows) != 72:
        raise ValueError('Incomplete cohort; no exclusions or partial qualification')
    groups = {}
    for expected, row in zip(value['slots'], rows):
        if any(row.get(k) != v for k, v in expected.items()) or row.get('returncode') != 0:
            raise ValueError('Wrong slot/order or failed fork')
        validate_metrics(row['metrics'], row['tier'], value)
        groups[row['tier'], row['label'], row['block']] = row['metrics']
    controls, candidates, signals = [], [], []
    for tier in ('c1', 'c2'):
        for metric in ('wall_ns', 'cpu_ns'):
            data = {label: [statistics.median(groups[tier, label, b][metric]) /
                           value['calls_per_batch'][tier] for b in range(12)]
                    for label in ('base', 'control', 'a')}
            control = dict(tier=tier, metric=metric, **ratio(data['base'], data['control']))
            control['pass_gate'] = (0.95 <= control['ratio'] <= 1.05 and
                                    0.90 <= control['lo'] <= control['hi'] <= 1.10)
            controls.append(control)
            comparisons = [dict(tier=tier, metric=metric, comparator=label,
                                **ratio(data[label], data['a'])) for label in ('base', 'control')]
            candidates.extend(comparisons)
            slower = [b for b in range(12) if data['a'][b] > data['base'][b] and data['a'][b] > data['control'][b]]
            below = [r['comparator'] for r in comparisons if r['hi'] < 1]
            if below or len(slower) >= 9:
                signals.append(dict(tier=tier, metric=metric, intervals_entirely_below_one=below,
                                    jointly_slower_blocks=slower, effect_size_threshold=None))
    failed = [r for r in controls if not r['pass_gate']]
    uncertain = [r for r in candidates if r['ratio'] < 1 or r['lo'] <= 1 <= r['hi']]
    status = ('STOPPED_CONTROL_FAILURE' if failed else 'HELD_CANDIDATE_SLOWDOWN' if signals else
              'INCONCLUSIVE_REVIEW_REQUIRED' if uncertain else 'CONTROLS_PASSED_REVIEW_REQUIRED')
    return dict(status=status, forks=72, controls=controls, candidate_comparisons=candidates,
                control_failures=failed, consistent_slowdown_signals=signals,
                uncertainty_comparisons=uncertain, shipping_qualified=False,
                interpretation='No acceptable-loss margin. Any consistent slowdown holds A. No equivalence from a crossing interval.',
                bootstrap=dict(seed=20261016, resamples=10000, unit='paired fork medians', reset_each_comparison=True))


def collect(out):
    native()
    value = plan()
    if verify_inputs() != json.loads((out / 'payload-hashes.json').read_text()):
        raise ValueError('Inputs changed since preflight')
    if json.loads((out / 'quiet-plan.json').read_text()) != value:
        raise ValueError('Plan changed since preflight')
    context = json.loads((out / 'quiet-preflight.json').read_text())
    if context['boot_id'] != Path('/proc/sys/kernel/random/boot_id').read_text().strip():
        raise ValueError('VM changed since preflight')
    images = json.loads((out / 'images.json').read_text())
    if set(images) != {'base', 'a'} or images['base']['native_hashes'] != images['a']['native_hashes']:
        raise ValueError('Unmatched base/A images')
    if len(images['base']['native_hashes']) != 39:
        raise ValueError('Native profile changed')
    before = {}
    for label in ('base', 'a'):
        image = out / 'images' / label
        java = (image / 'bin/java').read_bytes()
        if java[:6] != b'\x7fELF\x02\x01' or int.from_bytes(java[18:20], 'little') != 62:
            raise ValueError('JVM launcher is not native ELF64 x86_64')
        before[label] = {'modules': sha(image / 'lib/modules'), **{
            name: sha(image / name) for name in images[label]['native_hashes']}}
        if before[label]['modules'] != images[label]['modules_sha256']:
            raise ValueError('Module image changed after build')
        if any(before[label][n] != h for n, h in images[label]['native_hashes'].items()):
            raise ValueError('Native image changed after build')
    root = out / 'quiet72'
    root.mkdir()
    save(root / 'images-before.json', before)
    save(root / 'execution-inputs-before.json', {name: sha(out / name) for name in
         ('Steady.java', 'native.c', 'classes/Steady.class', 'libprobe.so')})
    rows = []
    with (root / 'retained.jsonl').open('x') as stream:
        for slot in value['slots']:
            directory = root / ('%02d-%s-%s' % (slot['index'], slot['tier'], slot['label']))
            directory.mkdir()
            image = out / 'images' / ('base' if slot['label'] == 'control' else slot['label'])
            command = ['taskset', '-c', '0', str(image / 'bin/java'), *value['common_flags'],
                       *value['tier_flags'][slot['tier']], '-Dsteady.mode=unbound',
                       '-Dsteady.count=' + str(value['calls_per_batch'][slot['tier']]),
                       '-Dsteady.warm=30', '-Dsteady.samples=10',
                       '-Dsteady.library=' + str(out / 'libprobe.so'),
                       '-cp', str(out / 'classes'), 'Steady']
            save(directory / 'argv.json', command)
            row = dict(slot, command=command)
            start = time.monotonic_ns()
            try:
                result = subprocess.run(command, capture_output=True, text=True, timeout=180)
                row.update(returncode=result.returncode, stdout=result.stdout, stderr=result.stderr)
                if result.returncode == 0:
                    row['metrics'] = json.loads(result.stdout.splitlines()[-1])
                    validate_metrics(row['metrics'], slot['tier'], value)
            except subprocess.TimeoutExpired as error:
                def decoded(text):
                    return text.decode(errors='replace') if isinstance(text, bytes) else text
                row.update(error=repr(error), stdout=decoded(error.stdout), stderr=decoded(error.stderr))
            except Exception as error:
                row.update(error=repr(error))
            row['process_outer_wall_ns'] = time.monotonic_ns() - start
            save(directory / 'result.json', row)
            stream.write(json.dumps(row) + '\n'); stream.flush()
            rows.append(row)
            print(json.dumps(dict(stage='quiet_fork', **slot, result=row)), flush=True)
            if row.get('returncode') != 0 or 'error' in row:
                raise RuntimeError('Failed/invalid fork; preserve evidence, no retry')
    for label in ('base', 'a'):
        image = out / 'images' / label
        if before[label] != {'modules': sha(image / 'lib/modules'), **{
                name: sha(image / name) for name in images[label]['native_hashes']}}:
            raise ValueError('Image changed during collection')
    prior = json.loads((root / 'execution-inputs-before.json').read_text())
    if prior != {name: sha(out / name) for name in prior}:
        raise ValueError('Harness/native library changed during collection')
    report = assess(rows, value)
    save(root / 'status.json', report)
    print(json.dumps(dict(stage='quiet_status', **report)), flush=True)
    if report['control_failures']:
        raise SystemExit('Failed controls; qualification stopped, no additional experiments')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('phase', choices=['preflight', 'collect'])
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    (preflight if args.phase == 'preflight' else collect)(args.output.resolve())
