"""Fixed unbound diagnostic experiment, with code snapshots after timing.

This experiment diagnoses compiler/code-placement states. It cannot establish
global performance qualification. No retries, pruning, or broadening the plan.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import random
import subprocess

p = argparse.ArgumentParser()
p.add_argument('--output', required=True)
a = p.parse_args()
root = Path(a.output).resolve()
raw = root / 'unbound-snapshot'
raw.mkdir()
images = root / 'images'
environment = json.loads((root / 'environment.json').read_text())
assert 'AMD EPYC 9V74' in environment['cpu_model'], 'Different runner CPU: preserve setup evidence and stop'
assert 0 in os.sched_getaffinity(0)
records = json.loads((root / 'images.json').read_text())
assert set(records) == {'base', 'a'}
assert records['base']['native_hashes'] == records['a']['native_hashes']
flags = {'c1': ['-XX:TieredStopAtLevel=1'], 'c2': ['-XX:-TieredCompilation', '-Xbatch']}
counts = {'c1': 100_000, 'c2': 1_000_000}
rng = random.Random(20261016)
plan = []
tiers = ['c1', 'c2']
for block in range(12):
    rng.shuffle(tiers)
    for tier in tiers:
        variants = ['base', 'control', 'a']
        rng.shuffle(variants)
        plan.extend((block, tier, variant) for variant in variants)
(raw / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
with (raw / 'retained.jsonl').open('x') as output:
    for index, (block, tier, variant) in enumerate(plan):
        directory = raw / ('%02d-%s-%s' % (index, tier, variant))
        directory.mkdir()
        image = images / ('base' if variant == 'control' else variant)
        command = ['taskset', '-c', '0', str(image / 'bin/java'),
                   '-Xms128m', '-Xmx128m', '--enable-native-access=ALL-UNNAMED', *flags[tier],
                   '-XX:+UnlockDiagnosticVMOptions', '-XX:+LogCompilation',
                   '-XX:LogFile=' + str(directory / 'compilation.xml'),
                   '-Dsteady.mode=unbound', '-Dsteady.count=' + str(counts[tier]),
                   '-Dsteady.warm=30', '-Dsteady.samples=10',
                   '-Dsteady.library=' + str(root / 'libprobe.so'),
                   '-Dsteady.dump.library=' + str(root / 'libnative_code_dump.so'),
                   '-Dsteady.dump.prefix=' + str(directory / 'nep'),
                   '-cp', str(root / 'classes'), 'Steady']
        (directory / 'argv.json').write_text(json.dumps(command, indent=2) + '\n')
        result = subprocess.run(command, capture_output=True, text=True, timeout=180)
        (directory / 'stdout.txt').write_text(result.stdout)
        (directory / 'stderr.txt').write_text(result.stderr)
        row = {'index': index, 'block': block, 'tier': tier, 'variant': variant,
               'shape': 'unbound', 'cds': 'default', 'command': command,
               'returncode': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr}
        if result.returncode == 0:
            row['metrics'] = json.loads(result.stdout.splitlines()[-1])
            assert len(row['metrics']['cpu_ns']) == len(row['metrics']['wall_ns']) == 10
            assert row['metrics']['sink'] == counts[tier] * (counts[tier] - 1) // 2
            assert (directory / 'nep-0.bin').is_file()
            assert list(directory.glob('nep-compiled-*.bin'))
        output.write(json.dumps(row) + '\n')
        output.flush()
        if result.returncode:
            raise RuntimeError('Diagnostic fork failed; no retry: ' + str(directory))
        print('snapshot', index, block, tier, variant, flush=True)
subprocess.run(['python3', str(root / 'analyze_retained_snapshot.py'), str(raw / 'retained.jsonl'),
                '--out', str(raw / 'retained-table.md')], check=True)
table = json.loads((raw / 'retained-table.md.json').read_text())
controls = [row for row in table if row['variant'] == 'control' and row['metric'] in ('steady_cpu_ns', 'steady_wall_ns')]
assert len(controls) == 4
failures = [row for row in controls if not (0.95 <= row['ratio'] <= 1.05
    and 0.90 <= row['lo'] <= row['hi'] <= 1.10)]
status = {'kind': 'diagnostic only; global qualification remains false',
          'forks': len(plan), 'control_failures': failures,
          'status': 'DIAGNOSTIC_CONTROL_FAILURE' if failures else 'DIAGNOSTIC_CONTROLS_PASSED',
          'no_retries_or_exclusions': True, 'startup_measurements': False,
          'native_dump_library_sha256': hashlib.sha256((root / 'libnative_code_dump.so').read_bytes()).hexdigest()}
(raw / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
print(json.dumps(status), flush=True)
