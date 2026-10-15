"""Build a new matched experiment; never accepts historical JVM binaries."""
import argparse
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import signal
import subprocess
import tarfile
import time

from common import BASE, CHANGED, HERE, ORIGINAL, PATCH_SHA, safe_extract, save, sha, snapshot
from rebuild_support import rebuild

SOURCE_DATE = '1792022400'


def check_delta(control, repair):
    delta = {k for k in control.keys() | repair.keys() if control.get(k) != repair.get(k)}
    if delta != CHANGED:
        raise ValueError('Unexpected source delta: ' + repr(sorted(delta)))
    return sorted(delta)


def dependency_inputs(hotspot, source):
    names = set()
    for record in hotspot.rglob('*.d'):
        text = record.read_text().replace('\\\n', ' ')
        for line in text.splitlines():
            if ':' not in line:
                continue
            right = line.split(':', 1)[1]
            names.update(shlex.split(right) if any(c in right for c in ['\\', '"', "'"]) else right.split())
    result = {}
    for name in sorted(names):
        path = Path(name)
        if path.suffix not in ['.h', '.hh', '.hpp', '.c', '.cc', '.cpp', '.S', '.inc', '.ad']:
            continue
        if not path.is_absolute():
            path = source / path
        if not path.is_file():
            raise ValueError('Compiler dependency input no longer readable: ' + str(path))
        result[str(path)] = sha(path)
    return result


def tool_inputs(boot, mold):
    roots = {Path('/usr/include'), Path('/usr/lib/gcc'), Path('/usr/share/autoconf'),
             Path(boot), Path(mold).parent.parent}
    binaries = ['bash', 'make', 'git', 'awk', 'sed', 'm4', 'autoconf', 'zip', 'unzip',
                'gcc-16', 'g++-16', 'as', 'ld', 'ar', 'nm', 'objcopy', 'objdump', 'strip',
                'readelf', 'ldd', 'perl', 'python3']
    executables = {Path(shutil.which(n)).resolve() for n in binaries}
    for program in ['cc1', 'cc1plus', 'collect2', 'lto1']:
        name = subprocess.check_output(['gcc-16', '-print-prog-name=' + program], text=True).strip()
        executables.add(Path(name).resolve())
    for library in ['libc.so', 'libc_nonshared.a', 'libm.so', 'libpthread.a', 'libdl.a',
                    'librt.a', 'libgcc.a', 'libgcc_s.so', 'libstdc++.a', 'libstdc++.so',
                    'crtbeginS.o', 'crtendS.o', 'crti.o', 'crtn.o']:
        name = subprocess.check_output(['gcc-16', '-print-file-name=' + library], text=True).strip()
        path = Path(name)
        if path.is_file():
            executables.add(path.resolve())
    executables.add(Path(mold).resolve())
    executables.add((Path(boot) / 'bin/java').resolve())
    files = {}
    for root in sorted(roots):
        files[str(root)] = snapshot(root)
    resolved_libraries = set()
    for binary in sorted(executables):
        files[str(binary)] = {'sha256': sha(binary)}
        completed = subprocess.run(['ldd', str(binary)], text=True, capture_output=True)
        # ldd may reject shell scripts. Record the complete output either way.
        files[str(binary)]['ldd'] = re.sub(r'\(0x[0-9a-f]+\)', '(address)', completed.stdout + completed.stderr)
        for word in completed.stdout.split():
            if word.startswith('/') and Path(word).is_file():
                resolved_libraries.add(Path(word).resolve())
    for library in sorted(resolved_libraries):
        files[str(library)] = {'sha256': sha(library)}
    return files


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--history', type=Path, required=True)
    parser.add_argument('--boot-jdk', type=Path, required=True)
    parser.add_argument('--work', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    args.work.mkdir(parents=True, exist_ok=False)
    args.output.mkdir(parents=True, exist_ok=False)
    deadline = time.monotonic() + 70 * 60
    from preflight import host_metadata, require_host
    metadata = host_metadata()
    require_host(metadata, building=True)
    save(args.output / 'host.json', metadata)
    assert sha(HERE / 'production.patch') == PATCH_SHA
    assert subprocess.check_output(['gcc-16', '-dumpversion'], text=True).strip() == '16'
    mold = shutil.which('mold')
    if not mold:
        raise RuntimeError('mold is required')
    payload = args.work / 'payload'
    payload.mkdir()
    provenance = payload / 'provenance'
    provenance.mkdir()
    save(provenance / 'packages.json', subprocess.check_output(
        ['dpkg-query', '-W', '-f=${Package}\t${Version}\n'], text=True).splitlines())
    before_tools = tool_inputs(args.boot_jdk, mold)
    save(provenance / 'tool-inputs-before.json', before_tools)
    environment = os.environ.copy()
    environment.update(CC=shutil.which('gcc-16'), CXX=shutil.which('g++-16'),
                       SOURCE_DATE_EPOCH=SOURCE_DATE, LC_ALL='C', LANG='C',
                       CCACHE_DISABLE='1')
    for key in ['CFLAGS', 'CXXFLAGS', 'CPPFLAGS', 'LDFLAGS', 'JAVA_TOOL_OPTIONS',
                'JDK_JAVA_OPTIONS', 'JDK_JAVAC_OPTIONS', '_JAVA_OPTIONS', 'CLASSPATH',
                'MAKEFLAGS', 'MFLAGS', 'CONFIG_SITE', 'BASH_ENV', 'ENV', 'LD_PRELOAD', 'LD_LIBRARY_PATH']:
        environment.pop(key, None)
    save(provenance / 'environment.json', {k: environment[k] for k in
         ['PATH', 'CC', 'CXX', 'SOURCE_DATE_EPOCH', 'LC_ALL', 'LANG', 'CCACHE_DISABLE']})
    source = args.work / 'source'
    config = ['bash', 'configure', '--with-conf-name=native-c1', '--with-jobs=2',
              '--with-num-cores=2', '--with-memory-size=4096', '--disable-ccache',
              '--disable-desktop', '--enable-headless-only', '--enable-jvm-feature-serialgc',
              '--enable-jvm-feature-g1gc', '--enable-jvm-feature-zgc',
              '--disable-jvm-feature-epsilongc', '--disable-jvm-feature-parallelgc',
              '--disable-jvm-feature-shenandoahgc', '--with-debug-level=release',
              '--with-native-debug-symbols=none', '--with-extra-cflags=-march=x86-64-v3 -mtune=generic',
              '--with-extra-cxxflags=-march=x86-64-v3 -mtune=generic',
              '--with-extra-ldflags=-fuse-ld=mold', '--with-version-opt=native-c1-policy',
              '--with-build-user=diagnostic', '--with-source-date=' + SOURCE_DATE,
              '--with-hotspot-build-time=source-date', '--with-boot-jdk=' + str(args.boot_jdk),
              '--with-boot-jdk-jvmargs=-XX:ActiveProcessorCount=2']
    save(provenance / 'configure-command.json', config)
    commands = []

    def run(command, log, limit=1800, cwd=None):
        left = deadline - time.monotonic()
        if left <= 0:
            raise TimeoutError('70-minute build-script budget exhausted')
        record = {'command': command, 'cwd': str(cwd or args.work), 'log': str(log),
                  'started_unix': time.time()}
        commands.append(record)
        save(args.output / 'commands.json', commands)
        with Path(log).open('w') as stream:
            process = subprocess.Popen(command, cwd=cwd or args.work, env=environment,
                                       stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
            try:
                record['exit'] = process.wait(timeout=min(limit, left))
                if record['exit']:
                    raise subprocess.CalledProcessError(record['exit'], command)
            except BaseException:
                try:
                    os.killpg(process.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                process.wait()
                raise
        record['completed_unix'] = time.time()
        save(args.output / 'commands.json', commands)

    run([str(args.boot_jdk / 'bin/java'), '-Xshare:off', '-Xmx64m',
         '-XX:ActiveProcessorCount=2', str(HERE / 'ThreadProbe.java')],
        args.output / 'boot-jvm-thread-readiness.log', 30)
    assert 'FOUR_THREADS_PASS' in (args.output / 'boot-jvm-thread-readiness.log').read_text()
    sources = {}
    revisions = {}
    native_commands = {}
    generated_inputs = {}
    compiler_inputs = {}
    bindings = json.loads((HERE / 'source-bindings.json').read_text())
    for arm, revision in [('before', ORIGINAL), ('current', BASE), ('repair', BASE)]:
        actual = subprocess.check_output(['git', '-C', str(args.history), 'rev-parse', revision], text=True, timeout=30).strip()
        assert actual == revision
        archive = args.work / 'source.tar'
        run(['git', '-C', str(args.history), 'archive', '--format=tar',
             '--output=' + str(archive), revision], args.output / (arm + '-source-archive.log'), 300)
        revisions[arm] = {'commit': revision, 'git_archive_sha256': sha(archive),
            'git_tree': subprocess.check_output(['git', '-C', str(args.history), 'rev-parse', revision + '^{tree}'], text=True, timeout=30).strip()}
        assert revisions[arm]['git_tree'] == bindings['trees'][revision]
        save(provenance / 'source-revisions.json', revisions)
        if source.exists():
            shutil.rmtree(source)  # Owned scratch directory, never a checkout.
        safe_extract(archive, source)
        archive.unlink()
        if arm == 'repair':
            run(['git', 'apply', '--check', str(HERE / 'production.patch')], args.output / 'patch-check.log', 30, source)
            run(['git', 'apply', str(HERE / 'production.patch')], args.output / 'patch-apply.log', 30, source)
        sources[arm] = snapshot(source)
        if arm in ['current', 'repair']:
            assert {name: sources[arm][name]['sha256'] for name in CHANGED} == bindings[arm]
        save(provenance / (arm + '-source.json'), sources[arm])
        if arm == 'repair':
            save(provenance / 'source-delta.json', check_delta(sources['current'], sources['repair']))
        run(config, args.output / (arm + '-configure.log'), 180, source)
        build = source / 'build/native-c1'
        shutil.copy2(build / 'spec.gmk', provenance / (arm + '-spec.gmk'))
        # All arms start with fresh generated/build output at the exact same path.
        target = 'hotspot' if arm == 'repair' else 'images'
        run(['make', 'CONF=native-c1', 'JOBS=2', target], args.output / (arm + '-build.log'),
            1200 if arm == 'repair' else 1800, source)
        assert snapshot(source, excluded=('build',)) == sources[arm]
        save(provenance / (arm + '-build-output.json'), snapshot(build))
        hotspot = build / 'hotspot'
        native_commands[arm] = {p.relative_to(hotspot).as_posix(): p.read_text()
                                for p in hotspot.rglob('*.cmdline')}
        save(provenance / (arm + '-native-commands.json'), native_commands[arm])
        save(provenance / (arm + '-native-dependencies.json'),
             {p.relative_to(hotspot).as_posix(): p.read_text() for p in hotspot.rglob('*.d')})
        compiler_inputs[arm] = dependency_inputs(hotspot, source)
        save(provenance / (arm + '-compiler-inputs.json'), compiler_inputs[arm])
        gensrc = hotspot / 'variant-server/gensrc'
        generated_inputs[arm] = snapshot(gensrc)
        shutil.copytree(gensrc, provenance / (arm + '-generated-inputs'), symlinks=True)
        destination = payload / 'images' / arm
        if arm == 'repair':
            shutil.copytree(payload / 'images/current', destination, symlinks=True)
            shutil.copy2(build / 'support/modules_libs/java.base/server/libjvm.so',
                         destination / 'lib/server/libjvm.so')
        else:
            shutil.copytree(build / 'images/jdk', destination, symlinks=True)
        if arm == 'current':
            rebuild(source, destination, payload / 'support', args.output / 'support-rebuild', run)
    def make_spec(arm):
        return [line for line in (provenance / (arm + '-spec.gmk')).read_text().splitlines()
                if line.strip() and not line.lstrip().startswith('#')]
    assert make_spec('current') == make_spec('repair'), 'Non-comment configure specification changed'
    assert revisions['current'] == revisions['repair'], 'Control/repair base archive identity changed'
    assert native_commands['current'] == native_commands['repair'], 'Actual native build commands changed'
    assert generated_inputs['current'] == generated_inputs['repair'], 'Generated HotSpot source/header inputs changed'
    dependency_changes = {k for k in compiler_inputs['current'].keys() | compiler_inputs['repair'].keys()
                          if compiler_inputs['current'].get(k) != compiler_inputs['repair'].get(k)}
    assert dependency_changes == {str(source / p) for p in CHANGED}, 'Unexpected actual compiler source/header input delta'
    save(provenance / 'compiler-input-delta.json', sorted(dependency_changes))
    control = snapshot(payload / 'images/current')
    repair = snapshot(payload / 'images/repair')
    assert {k for k in control.keys() | repair.keys() if control.get(k) != repair.get(k)} == {'lib/server/libjvm.so'}
    after_tools = tool_inputs(args.boot_jdk, mold)
    save(provenance / 'tool-inputs-after.json', after_tools)
    assert before_tools == after_tools, 'Build tools/headers/libraries changed between arms'
    shutil.copy2(HERE / 'production.patch', provenance / 'production.patch')
    shutil.copy2(HERE / 'frozen-plan.json', provenance / 'frozen-plan.json')
    for name in ['stats.py', 'run.py', 'analyze.py', 'preflight.py', 'common.py', 'build.py',
                 'rebuild_support.py', 'support-manifest.json', 'support-source-bindings.json']:
        shutil.copy2(HERE / name, provenance / name)
    shutil.copytree(HERE / 'harness-sources', provenance / 'harness-sources')
    readiness = payload / 'readiness'
    readiness.mkdir()
    run([str(payload / 'images/current/bin/javac'), '-d', str(readiness), str(HERE / 'ThreadProbe.java')],
        args.output / 'thread-probe-compile.log', 60)
    native = {'experiment': 'matched-native-rebuild-v1', 'original': ORIGINAL, 'base': BASE,
              'patch_sha256': PATCH_SHA, 'source_delta': sorted(CHANGED),
              'control_repair_non_vm_files_identical': True, 'tool_inputs_unchanged': True,
              'current_repair_noncomment_spec_identical': True, 'files': snapshot(payload)}
    save(payload / 'native-manifest.json', native)
    bundle = args.output / 'native-images.tar'
    with tarfile.open(bundle, 'w', dereference=False) as stream:
        for path in sorted(payload.iterdir()):
            stream.add(path, arcname=path.name)
    if time.monotonic() > deadline:
        raise TimeoutError('70-minute build-script budget exhausted; no diagnostic launch')
    identity = {'archive_sha256': sha(bundle), 'manifest_sha256': sha(payload / 'native-manifest.json'),
                'archive_bytes': bundle.stat().st_size, 'experiment': native['experiment']}
    save(args.output / 'identity.json', identity)
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a') as stream:
            stream.write('archive_sha256=' + identity['archive_sha256'] + '\n')
            stream.write('manifest_sha256=' + identity['manifest_sha256'] + '\n')


if __name__ == '__main__':
    main()
