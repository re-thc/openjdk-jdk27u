#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Balanced complete-process startup, compilation and source-indexing comparisons."""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import sys
import time

sys.dont_write_bytecode = True
p = argparse.ArgumentParser(description=__doc__)
for name in ('controls', 'source', 'corpus', 'output'):
    p.add_argument('--' + name, type=Path, required=True)
a = p.parse_args()
a.output.mkdir(exist_ok=False)
for name in ('JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS'):
    os.environ.pop(name, None)
spec = importlib.util.spec_from_file_location('support', a.source/'.github/scripts/stringzilla-performance.py')
support = importlib.util.module_from_spec(spec)
spec.loader.exec_module(support)
affinity = support.pin_cpu()
controls = json.loads(a.controls.read_text())
names = list(controls)
assert len(names) == 4 and 'original' in names and 'candidate' in names
images = {n: Path(c['image']).resolve() for n, c in controls.items()}
inventories = {n: support.image(image) for n, image in images.items()}
settings = {n: support.read_spec(Path(c['spec'])) for n, c in controls.items()}
assert all(s == settings['original'] for s in settings.values())
for name, control in controls.items():
    assert inventories[name]['tree_sha256'] == control['expected_tree_sha256']
assert subprocess.check_output(['git', '-C', str(a.corpus), 'rev-parse', 'HEAD'], text=True).strip() == support.BASE
assert not subprocess.check_output(['git', '-C', str(a.corpus), 'status', '--porcelain'], text=True).strip()
corpus = sorted((a.corpus/'src/java.base/share/classes/java/lang').glob('String*.java'))
assert len(corpus) == 8
manifest = a.output/'corpus.txt'
manifest.write_text(''.join(str(f.resolve())+'\n' for f in corpus))
sources = [a.source/'test/jdk/java/lang/String'/name for name in
           ('StringZillaSearch.java', 'StringZillaBounded.java', 'StringZillaKernelsTest.java')]
app = Path(__file__).with_name('SourceScan.java')
classes = a.output/'classes'
classes.mkdir()
subprocess.run([str(images['original']/'bin/javac'), '-proc:none', '-d', str(classes), str(app)], check=True)
source_hashes = {str(f): support.sha(f) for f in [*sources, *corpus, app, Path(__file__)]}
checksum = None
results = []
for wi, workload in enumerate(('startup', 'javac', 'source-index')):
    rounds = []
    class_hashes = None
    for repeat in range(-1, 8):
        group = {}
        offset = (wi+max(0, repeat)) % len(names)
        order = names[offset:]+names[:offset]
        for name in order:
            prefix = f'{workload}-r{repeat}-{name}'
            flags = controls[name].get('flags', [])
            image = images[name]
            if workload == 'startup':
                command = [str(image/'bin/java'), *flags, '-version']
            elif workload == 'javac':
                target = a.output/(prefix+'-classes')
                target.mkdir()
                command = [str(image/'bin/javac'), *['-J'+flag for flag in flags], '-proc:none',
                           '-d', str(target), *map(str, sources)]
            else:
                command = [str(image/'bin/java'), *flags, '-cp', str(classes),
                           'SourceScan', str(manifest), '128']
            # Ordinary blocking completion avoids Python's timed-wait polling.
            started = time.perf_counter_ns()
            result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
            elapsed = (time.perf_counter_ns()-started)/1e6
            (a.output/(prefix+'.stdout')).write_bytes(result.stdout)
            (a.output/(prefix+'.stderr')).write_bytes(result.stderr)
            if workload == 'source-index':
                observed = result.stdout.decode().strip()
                if checksum is None:
                    checksum = observed
                assert observed == checksum
            if workload == 'javac':
                observed = {str(f.relative_to(target)): support.sha(f) for f in sorted(target.rglob('*.class'))}
                assert observed
                if class_hashes is None:
                    class_hashes = observed
                assert observed == class_hashes, 'Different compiled program bytes'
            group[name] = {'milliseconds': elapsed, 'command': command}
        if repeat >= 0:
            rounds.append(group)
    ratios = {n: [r[n]['milliseconds']/r['candidate']['milliseconds'] for r in rounds]
              for n in names if n != 'candidate'}
    result = {'workload': workload, 'rounds': rounds,
              'medians_ms': {n: statistics.median(r[n]['milliseconds'] for r in rounds) for n in names},
              'paired': {n: {'median': statistics.median(v), 'min': min(v), 'max': max(v), 'ratios': v}
                         for n, v in ratios.items()}, 'compiled_classes': class_hashes}
    results.append(result)
    print(json.dumps({k: v for k, v in result.items() if k not in ('rounds', 'compiled_classes')}), flush=True)
    (a.output/'results.json').write_text(json.dumps(results, indent=2)+'\n')
assert all(support.image(images[n])['files'] == inventory['files'] for n, inventory in inventories.items())
assert all(support.sha(Path(f)) == h for f, h in source_hashes.items())
receipt = {'controls': controls, 'images': inventories, 'matched_settings': settings, 'affinity': affinity,
           'machine': platform.platform(), 'source_hashes': source_hashes, 'source_index_checksum': checksum,
           'protocol': 'Four controls; one untimed full round then eight balanced rotating rounds; ordinary JVM defaults including tiering/CDS; blocking whole-process wall time; no timeout polling',
           'scope': 'java -version, javac compilation of three fixed source files, and one fixed token/reverse/line source-indexing task; no general application claim',
           'complete': True}
(a.output/'receipt.json').write_text(json.dumps(receipt, indent=2)+'\n')
