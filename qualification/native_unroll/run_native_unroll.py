#!/usr/bin/env python3
"""Plan or run bounded native fastdebug C2 IR diagnostics using existing classes."""
import argparse
import hashlib
import itertools
import json
import os
import pathlib
import subprocess
import sys
from parse_native_unroll import analyze

# Every entry was accepted in the earlier actual b3 local fastdebug trace.
PHASES = 'AFTER_PARSING INCREMENTAL_INLINE EXPAND_VUNBOX SCALARIZE_VBOX INLINE_VECTOR_REBOX EXPAND_VBOX ELIMINATE_VBOX_ALLOC ITER_GVN_AFTER_VECTOR AFTER_EA BEFORE_MATCHING'
BASE = '87edd79d3104ff502f7befec034716b081436f49'
PATCHED = 'b3ce67e362c3b1678fcf3d18ee714182b2395c86'

def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as file:
        for block in iter(lambda: file.read(1024*1024), b''): h.update(block)
    return h.hexdigest()

def record(path):
    return {'path': str(path), 'bytes': path.stat().st_size, 'sha256': sha(path)}

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--base-jdk', type=pathlib.Path, required=True)
    p.add_argument('--patched-jdk', type=pathlib.Path, required=True)
    p.add_argument('--classes', type=pathlib.Path, required=True)
    p.add_argument('--whitebox', type=pathlib.Path, required=True)
    p.add_argument('--kernel-source', type=pathlib.Path, required=True)
    p.add_argument('--probe-source', type=pathlib.Path, required=True)
    p.add_argument('--provenance', type=pathlib.Path, required=True,
                   help='Root-verified artifact/build/run IDs and exact source commits')
    p.add_argument('--out', type=pathlib.Path, required=True)
    p.add_argument('--cpu', type=int, required=True)
    p.add_argument('--headers', default='legacy', help='Comma-separated legacy,four,eight')
    p.add_argument('--sve', default='default', help='Comma-separated default,0')
    p.add_argument('--measure-calls', type=int, default=1000)
    p.add_argument('--execute', action='store_true', help='Without this flag only record the plan; launch no JVM')
    a = p.parse_args()
    if not 1 <= a.measure_calls <= 10000: p.error('measure-calls must be 1..10000')
    headers = a.headers.split(',')
    sve = a.sve.split(',')
    if any(h not in ('legacy', 'four', 'eight') for h in headers): p.error('Unknown header')
    if any(v not in ('default', '0') for v in sve): p.error('Unknown SVE diagnostic')
    if len(headers) != len(set(headers)) or len(sve) != len(set(sve)): p.error('Duplicate conditions')
    if a.cpu < 0: p.error('Invalid CPU')
    images = {'base87': a.base_jdk.resolve(), 'b3': a.patched_jdk.resolve()}
    classes, wb, out = a.classes.resolve(), a.whitebox.resolve(), a.out.resolve()
    if out.exists() and any(out.iterdir()): p.error('Use a new empty output directory')
    out.mkdir(parents=True, exist_ok=True)
    inputs = {'classes': [record(f) for f in sorted(classes.rglob('*.class'))],
              'sources': [record(a.kernel_source.resolve()), record(a.probe_source.resolve())],
              'whitebox': record(wb) if wb.is_file() else [record(f) for f in sorted(wb.rglob('*.class'))],
              'provenance_file': record(a.provenance.resolve()),
              'provenance': json.loads(a.provenance.read_text()), 'images': {}}
    for name in ('PhaseVectorProbe.class', 'PhaseVectorKernels.class'):
        if not (classes / name).is_file(): p.error('Missing existing compiled class ' + name)
    if 'measureCalls' not in a.probe_source.read_text(): p.error('Probe lacks fixed measureCalls interface')
    for name, root in images.items():
        inputs['images'][name] = {relative: record(root / relative) for relative in
            ('bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release')}
        inputs['images'][name]['release_text'] = (root / 'release').read_text()
    scripts = pathlib.Path(__file__).resolve().parent
    inputs['scripts'] = [record(scripts / name) for name in ('run_native_unroll.py', 'parse_native_unroll.py')]
    cases = []
    header_flags = {'legacy': ['-XX:-UseCompactObjectHeaders'], 'four': [], 'eight': ['-XX:-UseFourByteObjectHeaders']}
    for header, isa, unroll, image in itertools.product(headers, sve, ('default', '1'), images):
        label = image + '-' + header + '-sve' + isa + '-unroll' + unroll
        argv = ['taskset', '-c', str(a.cpu), str(images[image] / 'bin/java'), '-Xms256m', '-Xmx512m',
            '-XX:ActiveProcessorCount=2', '--add-modules=jdk.incubator.vector', '-DvectorBits=128',
            '-DobserveCompilation=true', '-DmeasureCalls=' + str(a.measure_calls),
            '-XX:+UnlockDiagnosticVMOptions', '-XX:+PrintFlagsFinal', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(wb),
            '-Xbatch', '-XX:-TieredCompilation', '-XX:+LogCompilation', '-XX:LogFile=' + str(out / (label + '.xml')),
            '-XX:CompileCommand=dontinline,PhaseVectorKernels::conversion',
            '-XX:CompileCommand=dontinline,PhaseVectorProbe::invoke',
            '-XX:CompileCommand=PrintIdealPhase,PhaseVectorKernels::conversion,' + PHASES,
            '-XX:CompileCommand=PrintIdeal,PhaseVectorKernels::conversion',
            '-XX:CompileCommand=PrintInlining,PhaseVectorKernels::conversion',
            *header_flags[header]]
        if isa == '0': argv.append('-XX:UseSVE=0')
        if unroll == '1': argv.append('-XX:LoopMaxUnroll=1')
        argv += ['-cp', str(classes) + os.pathsep + str(wb), 'PhaseVectorProbe', 'conversion', 'c2']
        cases.append({'label': label, 'image': image, 'declared_source_commit': BASE if image == 'base87' else PATCHED,
                      'header': header, 'sve': isa, 'loop_max_unroll': unroll, 'argv': argv})
    plan = {'scope': 'Fastdebug IR diagnostics only; raw timer output is not qualified performance evidence',
            'measure_calls': a.measure_calls, 'phases': PHASES.split(), 'inputs': inputs, 'cases': cases,
            'execute_requested': a.execute}
    (out / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    if not a.execute:
        print('Recorded', len(cases), 'planned JVM commands; no JVM launched')
        return
    failures = []
    for case in cases:
        label = case['label']
        raw = out / (label + '.out')
        with raw.open('w') as stream:
            try:
                status = subprocess.run(case['argv'], cwd=out, stdout=stream, stderr=subprocess.STDOUT, timeout=180)
                code = status.returncode
            except subprocess.TimeoutExpired:
                code = 124
            except OSError as exc:
                stream.write(str(exc) + '\n')
                code = 125
        result = {'argv': case['argv'], 'cwd': str(out), 'exit_status': code, 'raw_output': record(raw)}
        xml = out / (label + '.xml')
        if xml.exists(): result['log_compilation'] = record(xml)
        (out / (label + '.status.json')).write_text(json.dumps(result, indent=2) + '\n')
        print(label, 'exit_status=' + str(code), flush=True)
        if code: failures.append(label)
    if failures: raise SystemExit('Diagnostic JVM failures: ' + ', '.join(failures))
    analyze(out)

if __name__ == '__main__':
    main()
