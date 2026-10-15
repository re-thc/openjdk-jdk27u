"""Reproduce frozen harness bytecode from sources; no binary input publication."""
import json
import os
from pathlib import Path
import shutil
import urllib.request

from common import HERE, save, sha, verify

JARS = {
    'commons-math3-3.6.1.jar': 'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar',
    'jmh-core-1.37.jar': 'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar',
    'jmh-generator-annprocess-1.37.jar': 'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar',
    'jopt-simple-5.0.4.jar': 'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar',
}


def rebuild(source, jdk, destination, work, invoke, jar_cache=None):
    source, jdk, destination, work = map(Path, [source, jdk, destination, work])
    destination.mkdir(parents=True, exist_ok=False)
    work.mkdir(parents=True, exist_ok=False)
    expected = json.loads((HERE / 'support-manifest.json').read_text())['files']
    bindings = json.loads((HERE / 'support-source-bindings.json').read_text())
    files = HERE / 'harness-sources'
    for name, digest in bindings.items():
        path = source / name if name.startswith('test/') else files / name
        if sha(path) != digest:
            raise ValueError('Frozen support source differs: ' + name)
    bench = work / 'bench'
    bench.mkdir()
    for name, relative in JARS.items():
        path = bench / name
        if jar_cache:
            shutil.copyfile(Path(jar_cache) / name, path)
        else:
            with urllib.request.urlopen('https://repo.maven.apache.org/maven2/' + relative, timeout=60) as response:
                with path.open('xb') as output:
                    shutil.copyfileobj(response, output)
        if sha(path) != expected['bench/' + name]['sha256']:
            raise ValueError('Pinned JMH dependency differs: ' + name)
    cp = ':'.join(str(p) for p in sorted(bench.glob('*.jar')))
    classes, whitebox, probes = [work / n for n in ['classes', 'whitebox', 'probe-classes']]
    for path in [classes, whitebox, probes]:
        path.mkdir()
    java_sources = [str(files / n) for n in ['FastFloatParsing.java', 'ZmijFormatting.java',
                   'DecimalIntegerConversion.java', 'SplitFallbackBench.java', 'C2ElisionBench.java']]
    javac = [str(jdk / 'bin/javac'), '-J-XX:ActiveProcessorCount=2']
    invoke(javac + ['--add-modules=jdk.incubator.vector', '--add-exports=java.base/jdk.internal.math=ALL-UNNAMED',
                   '--add-exports=java.base/jdk.internal.util=ALL-UNNAMED', '-cp', cp, '-processor',
                   'org.openjdk.jmh.generators.BenchmarkProcessor', '-d', str(classes)] + java_sources,
           work / 'compile-harness.log', 60)
    invoke(javac + ['-sourcepath', str(source / 'test/lib'), '-d', str(whitebox),
                   str(source / 'test/lib/jdk/test/whitebox/WhiteBox.java'),
                   str(source / 'test/lib/jdk/test/whitebox/parser/DiagnosticCommand.java')],
           work / 'compile-whitebox.log', 60)
    invoke(javac + ['--add-modules=jdk.incubator.vector', '--add-exports=java.base/jdk.internal.math=ALL-UNNAMED',
                   '-cp', str(classes) + ':' + str(whitebox) + ':' + cp, '-d', str(probes),
                   str(files / 'CodeInputsProbe.java')], work / 'compile-probe.log', 60)
    for name, record in sorted(expected.items()):
        target = destination / name
        if record['type'] == 'directory':
            target.mkdir(parents=True, exist_ok=True)
            target.chmod(record['mode'])
            continue
        target.parent.mkdir(parents=True, exist_ok=True)
        if name.startswith('bench/classes/META-INF/'):
            origin = files / Path(name).name
        elif name.startswith('bench/classes/'):
            origin = classes / name[len('bench/classes/'):]
        elif name.startswith('bench/'):
            origin = bench / name[len('bench/'):]
        elif name.startswith('whitebox/'):
            origin = whitebox / name[len('whitebox/'):]
        elif name.startswith('probe-classes/'):
            origin = probes / name[len('probe-classes/'):]
        else:
            origin = files / Path(name).name
        if sha(origin) != record['sha256']:
            raise ValueError('Recreated support file does not match frozen bytes: ' + name)
        shutil.copyfile(origin, target)
        target.chmod(record['mode'])
    verify(destination, expected)
    save(work / 'identity.json', {'exact_support_files': sum(v['type'] == 'file' for v in expected.values()),
                                 'classfile_hashes_match': True, 'source_bindings': bindings})
