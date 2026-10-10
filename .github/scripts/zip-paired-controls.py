import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import sys
import urllib.request

ROOT = Path.cwd()
OUT = ROOT / 'validation/results'
OUT.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location('common', ROOT / '.github/scripts/validate-zip-backend.py')
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
run = common.run
jdk = Path(sys.argv[1]).resolve()
deps = OUT / 'jmh'
deps.mkdir(exist_ok=True)
for name, (path, digest) in common.DEPS.items():
    target = deps / name
    urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + path, target)
    if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
        raise RuntimeError('JMH dependency checksum')
cp = os.pathsep.join(str(deps / name) for name in common.DEPS)
classes = deps / 'classes'
classes.mkdir(exist_ok=True)
run('compile-controls', [jdk / 'bin/javac', '-cp', cp, '-processorpath', cp, '-d', classes] + [
    ROOT / 'test/micro/org/openjdk/bench/java/util/zip' / f for f in ['ZipBackend.java', 'ZipBufferCalls.java']])
cp = str(classes) + os.pathsep + cp
rows = []
for tier, flags, pattern, params, count in [
    ('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1'], 'ZipBackend.deflate$', ['-p', 'size=64', '-p', 'data=text'], 1),
    ('c2', ['-Xbatch', '-XX:-TieredCompilation', '-XX:CompileThreshold=1000'], 'ZipBufferCalls.inflate$',
     ['-p', 'size=65536', '-p', 'input=heap,direct', '-p', 'output=heap,direct'], 4)]:
    for round in range(2):
        labels = ['jni', 'default'] if round == 0 else ['default', 'jni']
        for label in labels:
            name = f'{tier}-{round}-{label}'
            result = OUT / (name + '.json')
            extra = ['-XX:+UnlockDiagnosticVMOptions', '-XX:-UseZipIntrinsics'] if label == 'jni' else []
            options = ['-XX:-UseZlibNG', '-Xshare:off', '-Xms128m', '-Xmx128m',
                       '-XX:+UseSerialGC', '-XX:ActiveProcessorCount=2'] + flags + extra
            run(name, [jdk / 'bin/java', '-Djmh.blackhole.mode=FULL_DONTINLINE',
                '-cp', cp, 'org.openjdk.jmh.Main', pattern] + params + [
                '-f', '3', '-wi', '3', '-i', '6', '-w', '500ms', '-r', '500ms',
                '-jvm', jdk / 'bin/java', '-jvmArgsAppend', ' '.join(options),
                '-rf', 'json', '-rff', result])
            group = json.loads(result.read_text())
            if len(group) != count:
                raise RuntimeError('Missing JMH results')
            for row in group:
                row.update(tier=tier, round=round, config=label)
                rows.append(row)
                metric = row['primaryMetric']
                print(tier, round, label, row['benchmark'].split('.')[-1],
                      row['params'], metric['score'], metric['scoreError'], flush=True)
(OUT / 'paired-jmh.json').write_text(json.dumps(rows, indent=2))
for tier in ['c1', 'c2']:
    for round in range(2):
        baseline = {(row['benchmark'], tuple(sorted(row['params'].items()))): row for row in rows
                    if row['tier'] == tier and row['round'] == round and row['config'] == 'jni'}
        for row in rows:
            if (row['tier'], row['round'], row['config']) != (tier, round, 'default'):
                continue
            before = baseline[(row['benchmark'], tuple(sorted(row['params'].items())))]['primaryMetric']
            after = row['primaryMetric']
            print('PAIRED', tier, round, row['benchmark'].split('.')[-1], row['params'],
                  after['score'] / before['score'],
                  after['score'] - after['scoreError'] > before['score'] + before['scoreError'], flush=True)
