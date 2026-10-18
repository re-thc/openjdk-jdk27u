# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

# Source-derived from 1c344bde55df568fe4c06e774c87f4446f5ae310; no Supervisor or /proc ownership code.
import csv, json, math, re, statistics, time
from pathlib import Path
BASE = '89885a6288e7aaabd01678a704a586272c0f96e3'

LOCK_SHA = 'c9e0c1f477d6afb94459ac1fde0afd70bac57c3dfebbf6554b85948d47a60e37'

MEASUREMENT_WINDOW = 75 * 60

PLAIN_G1 = [0, 1, 8, 16, 32, 64, 127, 128, 129, 511, 512, 1023, 1024, 1025, 4096, 65536, 1048576]

PLAIN_OTHER = [0, 32, 128, 1024, 4096, 65536]

PLAIN_UTF16 = [32, 128, 1024, 65536]

PROTECTED = {'sha256-hex': 65536, 'fingerprint': 32, 'uppercase-offset-encode': 4096, 'offset-decode': 65536, 'charsequence': 65536, 'appendable': 4096, 'late-invalid': 65536, 'utf16-invalid': 65536, 'mixed-101': 65536}

ERRORS = {'late-invalid', 'utf16-invalid'}

BAD_JNI = re.compile('WARNING in native method|FATAL ERROR in native method|JNI DETECTED ERROR|WARNING: JNI local refs', re.I)

class Stop(Exception):

    def __init__(self, category, detail):
        self.category, self.detail = (category, detail)
        super().__init__(detail)

def write_json(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')
    temporary.replace(path)

def require(condition, message):
    if not condition:
        raise Stop('EVIDENCE_OR_CORRECTNESS', message)

def check_library_load(text, expected, should_load):
    """Require the exact candidate library, with its platform-specific name."""
    expected = Path(expected)
    require(expected.name in {'libhexsimd.so', 'libhexsimd.dylib'},
            'unexpected configured HexFormat library name: ' + str(expected))
    expected = expected.resolve()
    observed = []
    for line in text.splitlines():
        match = re.search(r'\bLoaded library (.+), handle \S+(?:\s|$)', line)
        if match is None:
            require(not ('Loaded library ' in line and 'hexsimd' in line.lower()),
                    'malformed HexFormat library load record: ' + line)
            continue
        actual = Path(match.group(1))
        if 'hexsimd' in actual.name.lower() or actual.resolve() == expected:
            require(actual.is_absolute() and actual.resolve() == expected,
                    'unexpected HexFormat library loaded: ' + str(actual))
            observed.append(str(actual))
    require(len(observed) == (1 if should_load else 0),
            'wrong HexFormat library loading: ' + str(expected))
    return observed

def read_bench(path, kind, sizes, state):
    text = path.read_text()
    require(f"# nativeAvailable={str(state == 'enabled').lower()}" in text, 'wrong availability: ' + str(path))
    require('warmupMs=1000; sampleMs=100; samples=5' in text, 'wrong measurement settings: ' + str(path))
    expected = {(size, name + suffix) for size in sizes for name in ['encode', 'decode'] for suffix in ['-jdk', '-native']} if kind == 'plain' else {(size, name + suffix) for name, size in PROTECTED.items() for suffix in ['-jdk', '-native']}
    groups = {}
    for row in csv.DictReader((line for line in text.splitlines() if not line.startswith('#'))):
        key = (int(row['bytes']), row['operation'])
        ns, allocation = (float(row['ns_per_call']), float(row['java_bytes_per_call']))
        require(math.isfinite(ns) and ns > 0 and math.isfinite(allocation) and (allocation >= 0) and (int(row['calls']) > 0), 'invalid timing/allocation: ' + str(path))
        group = groups.setdefault(key, {})
        sample = int(row['sample'])
        require(sample not in group, 'duplicate sample: ' + str(path))
        group[sample] = (ns, allocation)
    require(set(groups) == expected and all((set(g) == set(range(5)) for g in groups.values())), 'missing/unexpected measurement cells: ' + str(path))
    return {key: {'ns': statistics.median((v[0] for v in samples.values())), 'bytes': statistics.median((v[1] for v in samples.values())), 'observations': [samples[i][0] for i in range(5)], 'allocation_observations': [samples[i][1] for i in range(5)]} for key, samples in groups.items()}

def adjudicate(index, cold, root, supervisor):
    """Explicit per-fork cross-image gates. summarize.py is not an adjudicator."""
    datasets = {}
    for entry in index:
        supervisor.check()
        key = (entry['kind'], entry['compact'], entry['gc'], entry['state'], entry['fork'])
        require(key not in datasets, 'duplicate benchmark process cell')
        datasets[key] = read_bench(Path(entry['file']), entry['kind'], entry['sizes'], entry['state'])
    expected_keys = {(kind, compact, gc, state, fork) for fork in [1, 2, 3] for gc in ['G1', 'Serial', 'Z'] for state in ['baseline', 'disabled', 'enabled'] for compact in ([True, False] if gc == 'G1' else [True]) for kind in ['plain', 'protected']}
    require(set(datasets) == expected_keys, 'not all 72 independently started throughput JVMs completed')
    noise, failures, rows = ([], [], [])
    bad_ranges = {}
    for kind, compact, gc, state, fork in sorted(expected_keys):
        if state != 'enabled':
            continue
        key = (kind, compact, gc, state, fork)
        selected = datasets[key]
        off = datasets[kind, compact, gc, 'disabled', fork]
        base = datasets[kind, compact, gc, 'baseline', fork]
        for (size, operation), value in selected.items():
            if not operation.endswith('-native'):
                continue
            name = operation.removesuffix('-native')
            is_error = name in ERRORS
            old, disabled = (base[size, operation], off[size, operation])
            row = {'kind': kind, 'compact': compact, 'gc': gc, 'fork': fork, 'bytes': size, 'operation': name, 'baseline': old, 'disabled': disabled, 'enabled': value, 'baseline_speedup': old['ns'] / value['ns'], 'disabled_speedup': disabled['ns'] / value['ns']}
            rows.append(row)
            label = f'{kind}/{compact}/{gc}/{fork}/{size}/{name}'
            if not is_error:
                if abs(disabled['ns'] - old['ns']) > max(0.1 * old['ns'], 5):
                    noise.append(label + ': disabled/baseline control drift')
                reference = operation.removesuffix('-native') + '-jdk'
                reference_base = base[size, reference]['ns']
                for tag, dataset in [('baseline', base), ('disabled', off), ('enabled', selected)]:
                    if tag != 'baseline' and abs(dataset[size, reference]['ns'] - reference_base) > max(0.1 * reference_base, 5):
                        noise.append(label + ': unchanged reference drift in ' + tag)
                    if tag != 'baseline' and abs(dataset[size, operation]['bytes'] - old['bytes']) > 16:
                        failures.append(label + ': ' + tag + ' Java allocation differs from baseline by >16 B/call')
                    if abs(dataset[size, operation]['bytes'] - dataset[size, reference]['bytes']) > 16:
                        failures.append(label + ': ' + tag + ' within-VM Java allocation differs by >16 B/call')
            for tag, control in [('baseline', old), ('disabled', disabled)]:
                allowance = max(control['ns'] * (0.25 if is_error else 0.05), 1000 if is_error else 5)
                if name == 'mixed-101':
                    allowance = control['ns'] * 0.05
                if value['ns'] - control['ns'] > allowance:
                    failures.append(label + ': regression versus ' + tag)
                if not is_error and tag == 'disabled' and (abs(value['bytes'] - control['bytes']) > 16):
                    failures.append(label + ': Java allocation differs by >16 B/call versus ' + tag)
            if kind == 'plain' and compact:
                required = 1.1 if (name, size) in [('encode', 1024), ('decode', 128)] else None
                if size in [4096, 65536]:
                    required = 1.2 if name == 'encode' else 2.0
                if required is not None:
                    for tag, control in [('baseline', old), ('disabled', disabled)]:
                        if control['ns'] / value['ns'] < required:
                            failures.append(label + f': speedup versus {tag} below {required}')
                    if selected[size, name + '-jdk']['ns'] < value['ns']:
                        noise.append(label + ': within-VM reference reverses claimed benefit')
                    for tag, control in [('baseline', old), ('disabled', disabled), ('enabled', value)]:
                        if max(control['observations']) > 2 * min(control['observations']):
                            bad_ranges.setdefault((gc, size, name, tag), set()).add(fork)
    for cell, forks in bad_ranges.items():
        if len(forks) >= 2:
            noise.append(str(cell) + ': >2x observation range in at least two forks')
    expected_cold = {(gc, state, round, mode) for gc in ['G1', 'Serial', 'Z'] for state in ['baseline', 'disabled', 'enabled'] for round in range(1, 6) for mode in ['empty', 'tiny', 'encode', 'decode', 'bulk-session']}
    seen = {(r['gc'], r['state'], r['round'], r['mode']) for r in cold}
    require(len(cold) == len(seen) and seen == expected_cold, 'cold dataset incomplete or duplicated')
    cold_rows = []
    for gc in ['G1', 'Serial', 'Z']:
        for mode in ['empty', 'tiny', 'encode', 'decode', 'bulk-session']:
            med = {state: {metric: statistics.median((r[metric] for r in cold if r['gc'] == gc and r['state'] == state and (r['mode'] == mode))) for metric in ['wall_ns', 'call_ns']} for state in ['baseline', 'disabled', 'enabled']}
            cold_rows.append({'gc': gc, 'mode': mode, 'medians': med})
            if abs(med['disabled']['wall_ns'] - med['baseline']['wall_ns']) > max(0.1 * med['baseline']['wall_ns'], 10000000):
                noise.append(f'cold/{gc}/{mode}: disabled/baseline process-wall control drift')
            for state in ['baseline', 'disabled']:
                if mode in ['empty', 'tiny'] and med['enabled']['wall_ns'] - med[state]['wall_ns'] > max(0.05 * med[state]['wall_ns'], 10000000):
                    failures.append(f'cold/{gc}/{mode}: process wall regression versus {state}')
                if mode in ['encode', 'decode'] and med['enabled']['call_ns'] - med[state]['call_ns'] > 20000000:
                    failures.append(f'cold/{gc}/{mode}: first public call exceeds +20ms versus {state}')
                if mode == 'bulk-session' and med[state]['wall_ns'] / med['enabled']['wall_ns'] < 1.1:
                    failures.append(f'fixed-128-pair-session/{gc}: <1.10x wall speedup versus {state}')
    status = 'INCONCLUSIVE_NOISE' if noise else 'NO_GO_MEASURED' if failures else 'LOCAL_GO'
    report = {'status': status, 'noise': noise, 'failures': failures, 'steady_cells': rows, 'cold_cells': cold_rows, 'fixed_session': {'pairs': 128, 'bytes_each_direction': 128 * 65536, 'scope': 'one observed fixed session; no measured amortization crossover'}, 'java_allocation_only': True, 'extra_platform_performance_required': False}
    write_json(root / 'acceptance.json', report)
    return report

class Campaign:

    def run(self, label, argv, cwd=None, env=None, **kwargs):
        return self.s.run(label, argv, cwd or self.repo, env or self.env, **kwargs)

    def java_opts(self, gc='G1', heap=512):
        return ['-Xms128m', f'-Xmx{heap}m', '-XX:ActiveProcessorCount=2', '-XX:+Use' + gc + 'GC', '-XX:-UsePerfData', '-Djava.io.tmpdir=' + str(self.root / 'tmp'), '-XX:ErrorFile=' + str(self.s.logs / 'hs_err_pid%p.log')]

    def java(self, state):
        return self.jdks['baseline' if state == 'baseline' else 'candidate'] / 'bin/java'

    def patched(self, state, options, main, *args):
        return [self.java(state), *options, '--patch-module', 'java.base=' + str(self.harness / 'patch'), '--add-exports', 'java.base/jdk.internal.util=ALL-UNNAMED', '-cp', self.harness / 'classes', main, *args]

    def library_preflight(self):
        records = []
        for mode in ['empty', 'tiny', 'encode', 'decode']:
            out, err, _ = self.run('library-' + mode,
                    [self.java('enabled'), *self.java_opts(heap=128), '-Xcheck:jni',
                     '-Xlog:library=debug', '-cp', self.harness / 'classes', 'FirstUse', mode],
                    timeout=15, measurement=False)
            text = out.read_text() + '\n' + err.read_text()
            require(not BAD_JNI.search(text), 'JNI warning in library preflight: ' + mode)
            records.append({'mode': mode, 'loaded': check_library_load(
                    text, self.library, mode in ['encode', 'decode'])})
        for state in ['baseline', 'disabled', 'enabled']:
            opts = self.java_opts() + ['-Xcheck:jni',
                    '-Dhexsimd.expectNative=' + str(state == 'enabled').lower()]
            if state == 'disabled':
                opts.append('-Djdk.hexFormat.useNative=false')
            out, err, _ = self.run('availability-' + state,
                    self.patched(state, opts, 'FirstUse', 'race'), timeout=30, measurement=False)
            text = out.read_text() + '\n' + err.read_text()
            require('PASS concurrent first use' in text and not BAD_JNI.search(text),
                    'native availability preflight failed: ' + state)
        write_json(self.root / 'library-preflight.json', records)
        self.library_preflight_complete = True

    def cold(self):
        require(getattr(self, 'library_preflight_complete', False),
                'library preflight required before cold timing')
        rows = []
        for gc in ['G1', 'Serial', 'Z']:
            for round in range(1, 6):
                states = ['baseline', 'disabled', 'enabled']
                if round % 2 == 0:
                    states.reverse()
                for state in states:
                    opts = self.java_opts(gc, heap=128)
                    if state == 'disabled':
                        opts += ['-Djdk.hexFormat.useNative=false']
                    for mode in ['empty', 'tiny', 'encode', 'decode', 'bulk-session']:
                        argv = [self.java(state), *opts, '-cp', self.harness / 'classes', 'FirstUse', mode]
                        out, err, wall = self.run(f'cold-{gc}-{round}-{state}-{mode}', argv, timeout=15, measurement=True)
                        values = out.read_text().strip().split(',')
                        require(len(values) == 3 and values[0] == mode, 'invalid cold record')
                        call, length = (int(values[1]), int(values[2]))
                        expected_length = {'empty': 0, 'tiny': 64, 'encode': 2048, 'decode': 128, 'bulk-session': 65536}[mode]
                        require(call > 0 and length == expected_length and (not BAD_JNI.search(err.read_text())), 'wrong cold result')
                        rows.append({'gc': gc, 'state': state, 'round': round, 'mode': mode, 'wall_ns': wall, 'call_ns': call, 'length': length})
                        write_json(self.root / 'cold.json', rows)
        return rows

    def measurements(self):
        require(getattr(self, 'library_preflight_complete', False),
                'library preflight required before throughput timing')
        minimum = 2754 + 10 * 60 + 15 * 60
        if self.s.work_end - time.monotonic() < minimum:
            raise Stop('RESOURCE', 'insufficient total budget for declared measurement batch and cleanup')
        end = min(self.s.work_end - 15 * 60, time.monotonic() + MEASUREMENT_WINDOW)
        index = []
        for fork in [1, 2, 3]:
            states = ['baseline', 'disabled', 'enabled']
            if fork == 2:
                states.reverse()
            for gc in ['G1', 'Serial', 'Z']:
                for state in states:
                    for compact in [True, False] if gc == 'G1' else [True]:
                        sizes = PLAIN_UTF16 if not compact else PLAIN_G1 if gc == 'G1' else PLAIN_OTHER
                        opts = self.java_opts(gc) + ['-Xms512m', '-XX:' + ('+' if compact else '-') + 'CompactStrings', '-Dhexsimd.expectNative=' + str(state == 'enabled').lower(), '-Dhexsimd.warmupMs=1000', '-Dhexsimd.sampleMs=100', '-Dhexsimd.samples=5']
                        if state == 'disabled':
                            opts.append('-Djdk.hexFormat.useNative=false')
                        for kind in ['plain', 'protected']:
                            args = list(map(str, sizes)) if kind == 'plain' else ['protected']
                            out, err, _ = self.run(f'bench-{kind}-{compact}-{gc}-{state}-{fork}', self.patched(state, opts, 'Bench', *args), deadline=end, measurement=True)
                            require(not BAD_JNI.search(out.read_text() + err.read_text()), 'JNI warning in timing process')
                            read_bench(out, kind, sizes, state)
                            index.append({'kind': kind, 'compact': compact, 'gc': gc, 'state': state, 'fork': fork, 'sizes': sizes, 'file': str(out)})
                            write_json(self.root / 'measurements.json', index)
        return index
