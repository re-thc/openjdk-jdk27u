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
source = (ROOT / 'test/micro/org/openjdk/bench/java/util/zip/ZipStreamCalls.java').read_text()
rows = []
arm = platform.machine() == 'aarch64'
tiers = [('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1'])] if arm else [
    ('int', ['-Xint']), ('c1', ['-Xbatch', '-XX:TieredStopAtLevel=1'])]
for context in ['original', 'arch-initialized']:
    area = deps / context
    area.mkdir(exist_ok=True)
    text = source
    if context == 'arch-initialized':
        text = text.replace('public void setup() {', '''public void setup() {
        try {
            Class.forName("jdk.internal.util.Architecture");
        } catch (ClassNotFoundException e) {
            throw new AssertionError(e);
        }''')
    src = area / 'ZipStreamCalls.java'
    src.write_text(text)
    run('compile-' + context, [jdk / 'bin/javac', '-cp', cp, '-processorpath', cp, '-d', area, src])
    for tier, flags in tiers:
        for round in range(2):
            labels = ['jni', 'default'] if round == 0 else ['default', 'jni']
            for label in labels:
                name = f'{context}-{tier}-{round}-{label}'
                result = OUT / (name + '.json')
                extra = ['-XX:+UnlockDiagnosticVMOptions', '-XX:-UseZipIntrinsics'] if label == 'jni' else []
                options = ['-XX:-UseZlibNG', '-Xshare:off', '-Xms128m', '-Xmx128m',
                           '-XX:+UseSerialGC', '-XX:ActiveProcessorCount=2'] + flags + extra
                run(name, [jdk / 'bin/java', '-Djmh.blackhole.mode=FULL_DONTINLINE',
                    '-cp', str(area) + os.pathsep + cp, 'org.openjdk.jmh.Main',
                    'ZipStreamCalls.gzip$' if arm else 'ZipStreamCalls.(zip|gzip)$',
                    '-p', 'size=64' if arm else 'size=1024',
                    '-p', 'chunk=4096' if arm else 'chunk=64,4096',
                    '-f', '3', '-wi', '3', '-i', '6', '-w', '500ms', '-r', '500ms',
                    '-jvm', jdk / 'bin/java', '-jvmArgsAppend', ' '.join(options),
                    '-rf', 'json', '-rff', result])
                group = json.loads(result.read_text())
                if len(group) != (1 if arm else 4):
                    raise RuntimeError('Missing JMH results')
                for row in group:
                    row.update(context=context, tier=tier, round=round, config=label)
                    rows.append(row)
                    metric = row['primaryMetric']
                    print(context, tier, round, label, row['benchmark'].split('.')[-1],
                          row['params'], metric['score'], metric['scoreError'], flush=True)
(OUT / 'paired-jmh.json').write_text(json.dumps(rows, indent=2))
for context in ['original', 'arch-initialized']:
    for tier, _ in tiers:
        for round in range(2):
            baseline = {(row['benchmark'], tuple(sorted(row['params'].items()))): row for row in rows
                        if row['context'] == context and row['tier'] == tier and
                        row['round'] == round and row['config'] == 'jni'}
            for row in rows:
                if (row['context'], row['tier'], row['round'], row['config']) != (context, tier, round, 'default'):
                    continue
                before = baseline[(row['benchmark'], tuple(sorted(row['params'].items())))]['primaryMetric']
                after = row['primaryMetric']
                print('PAIRED', context, tier, round, row['benchmark'].split('.')[-1], row['params'],
                      after['score'] / before['score'],
                      after['score'] - after['scoreError'] > before['score'] + before['scoreError'], flush=True)
