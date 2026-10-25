#!/usr/bin/env python3
"""Write a source-only command plan. Never execute a build or a JVM."""
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path('/workspace/pr57-xss-prototype-20261023')
SOURCE = ROOT / 'source'
BUILD = ROOT / 'build'
ORD = ROOT / 'ordinary'
BASE = '98be5181dac1d5eff26745ac716aad7b76b348d8'
GXX = '/workspace/toolchains/gcc16/bin/g++'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    if len(sys.argv) != 2 or len(sys.argv[1]) != 40:
        raise SystemExit('usage: prepare_commands.py <frozen-prototype-commit>')
    commit = sys.argv[1]
    if any(c not in '0123456789abcdef' for c in commit):
        raise SystemExit('invalid commit')
    BUILD.mkdir(exist_ok=True)
    baseline = BUILD / 'baseline-source'
    pconf, aconf = 'pr57-xss-common-v1', 'pr57-xss-stock-v1'
    config = [
        '--with-jobs=1', '--with-debug-level=release',
        '--with-boot-jdk=/workspace/toolchains/jdk27',
        '--with-jtreg=/workspace/toolchains/jtreg83', '--with-freetype=system',
        '--with-freetype-include=/workspace/toolchains/sysroot/usr/include/freetype2',
        '--with-freetype-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu',
        '--with-toolchain-path=/workspace/toolchains/gcc16/bin',
        '--with-extra-ldflags=-fuse-ld=mold -B/workspace/toolchains/mold/bin',
        '--x-includes=/workspace/toolchains/sysroot/usr/include',
        '--x-libraries=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu',
        '--with-cups-include=/workspace/toolchains/sysroot/usr/include',
        '--with-fontconfig-include=/workspace/toolchains/sysroot/usr/include',
        '--with-alsa-include=/workspace/toolchains/sysroot/usr/include',
        '--with-alsa-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu',
    ]
    old_logger = Path('/workspace/pr57-integration-preparation-20261021/logger-v2')
    logger = BUILD / 'logger'
    logger.mkdir(exist_ok=True)
    # This reviewed synchronous logger is unchanged. Only private paths and
    # invocation tags in the make override change; old evidence is not written.
    (logger / 'serial-log.py').write_bytes((old_logger / 'serial-log.py').read_bytes())
    override = (old_logger / 'logging-override.gmk').read_text()
    override = override.replace(str(old_logger), str(logger))
    override = override.replace('serial-integration-v2', 'serial-xss-v1')
    (logger / 'logging-override.gmk').write_text(override)
    for role, repo, conf in [('A', baseline, aconf), ('P', SOURCE, pconf)]:
        (logger / f'{role}-spec.gmk').write_text(
            f'include {repo}/build/{conf}/spec.gmk\n'
            f'include {logger}/logging-override.gmk\n')
    stages = []

    def stage(name, argv, cwd, seconds, note=''):
        stages.append(dict(name=name, argv=[str(x) for x in argv], cwd=str(cwd),
                           timeout_seconds=seconds, cleanup_seconds=5, note=note))

    stage('baseline-checkout', ['git', '-C', SOURCE, 'worktree', 'add', '--detach',
                               baseline, BASE], ROOT, 300,
          'Destination must be absent. Do not overwrite/reuse any old build.')
    stage('prototype-materialize', ['git', '-C', SOURCE, 'sparse-checkout', 'disable'],
          ROOT, 300, 'Materializes unchanged tracked source; verify clean frozen HEAD afterward.')
    for role, repo, conf in [('A', baseline, aconf), ('P', SOURCE, pconf)]:
        # All values here are fixed script literals. No user text is interpolated.
        import shlex
        script = BUILD / f'configure-{role}.sh'
        script.write_text('#!/usr/bin/env bash\nset -euo pipefail\n'
                          'source /workspace/toolchains/activate.sh\n'
                          f'cd {shlex.quote(str(repo))}\n'
                          'exec bash configure ' + shlex.join(
                              [f'--with-conf-name={conf}'] + config) + '\n')
        stage(f'configure-{role}', ['bash', script], ROOT, 300)
        stage(f'build-{role}', ['make', f'SPEC={logger}/{role}-spec.gmk', 'JOBS=1',
                                'RANGE_SORT_BACKEND=embedded', 'images'], repo, 2700,
              'One serial build. Preserve exit code and regular-file outer log; no retries.')
        image_role = 'A' if role == 'A' else 'E'
        stage(f'archive-image-{image_role}', ['cp', '-a', '--reflink=auto',
              repo / 'build' / conf / 'images/jdk', BUILD / 'images' / image_role],
              ROOT, 120, 'Create images parent first; role destination must not exist.')
    stage('archive-image-U-common', ['cp', '-a', '--reflink=auto',
          BUILD / 'images/E', BUILD / 'images/U'], ROOT, 120,
          'New independent copy; no hard links. E already frozen and hashed.')
    stage('build-U-dso', ['make', f'SPEC={logger}/P-spec.gmk', 'JOBS=1',
          'RANGE_SORT_BACKEND=upstream', 'java.base-libs'], SOURCE, 300,
          'Only new DSO differs. Retain both command lines and stack reports before and after.')
    stage('install-U-dso', ['cp', SOURCE / 'build' / pconf / 'jdk/lib/librangesort.so',
          BUILD / 'images/U/lib/librangesort.so'], ROOT, 30,
          'Changes only the new unpublished U copy. Compare all A/E/U components and E/U DSO bytes.')
    classes, wbclasses = ORD / 'classes', ORD / 'wbclasses'
    javac = BUILD / 'images/A/bin/javac'
    stage('compile-WhiteBox', [javac, '-d', wbclasses,
          SOURCE / 'test/lib/jdk/test/whitebox/parser/DiagnosticCommand.java',
          SOURCE / 'test/lib/jdk/test/whitebox/WhiteBox.java'], ROOT, 60)
    stage('compile-fixtures', [javac, '-cp', wbclasses, '-d', classes,
          SOURCE / 'test/jdk/java/util/Arrays/BoundedSimdSort.java',
          ORD / 'XssActivation.java', ROOT / 'harness/XssPublicBench.java'], ROOT, 60,
          'Two javac build processes total, distinct from eight ordinary test JVMs.')
    common_cxx = [GXX, '-std=c++17', '-O2', '-fno-exceptions', '-fno-rtti',
                  '-fno-omit-frame-pointer', '-fstack-usage', '-fstack-clash-protection']
    for role in ['E', 'U']:
        stage(f'compile-depth-{role}', common_cxx + [
              '-I' + str(SOURCE / 'src/java.base/linux/native/librangesort'),
              f'-DRANGE_SORT_FALLBACK_{role}', '-c', ORD / 'heapsort_fallback.cpp',
              '-o', ORD / f'heapsort-{role}.o'], ROOT, 60)
    stage('compile-native-guard', common_cxx + ['-c', ORD / 'native_guard_harness.cpp',
          '-o', ORD / 'native-guard.o'], ROOT, 60)
    stage('link-native-guard', [GXX, ORD / 'native-guard.o', ORD / 'heapsort-E.o',
          ORD / 'heapsort-U.o', '-ldl', '-lm', '-Wl,-z,now', '-Wl,-z,defs',
          '-o', ORD / 'native_guard_harness'], ROOT, 60)
    for role in ['E', 'U']:
        stage(f'create-diagnostic-{role}', ['cp', '-a', '--reflink=auto',
              BUILD / f'images/{role}', BUILD / f'images/diagnostic-{role}'], ROOT, 120)
        stage(f'compile-witness-{role}', common_cxx + [
              '-shared', '-fPIC',
              '-I' + str(BUILD / 'images' / role / 'include'),
              '-I' + str(BUILD / 'images' / role / 'include/linux'),
              f'-DRANGE_SORT_REAL_PATH="{BUILD}/images/{role}/lib/librangesort.so"',
              ORD / 'librangesort_witness.cpp', '-ldl', '-Wl,-z,now', '-Wl,-z,defs',
              '-o', BUILD / f'images/diagnostic-{role}/lib/librangesort.so'], ROOT, 60,
              'Never use diagnostic shim images in performance slots.')
    env = {'PATH': '/usr/bin:/bin', 'LANG': 'C', 'LC_ALL': 'C', 'TZ': 'UTC'}
    slots = [dict(name='native-guard-EU', kind='native_guard', seconds=60,
                 argv=[str(ORD / 'native_guard_harness'),
                       str(BUILD / 'images/E/lib/librangesort.so'),
                       str(BUILD / 'images/U/lib/librangesort.so')], env=env, cwd=str(ROOT))]
    modes = [('Eactivation', 'E', 'activation', []),
             ('Uactivation', 'U', 'activation', []),
             ('Einterpreted', 'E', 'interpreted', ['-Xint']),
             ('Uc1', 'U', 'c1', ['-XX:TieredStopAtLevel=1']),
             ('UdisableIntrinsic', 'U', 'fallback', ['-XX:DisableIntrinsic=_trySortRange']),
             ('UUseAVX2', 'U', 'fallback', ['-XX:UseAVX=2']),
             ('Estress', 'E', 'stress', []), ('Ustress', 'U', 'stress', [])]
    for name, role, mode, flags in modes:
        image = BUILD / ('images/' + (role if mode == 'stress' else f'diagnostic-{role}'))
        argv = [str(image / 'bin/java'), '-Xms64m', '-Xmx256m', '-Xss1m',
                '-XX:ActiveProcessorCount=4', '-XX:+UseG1GC',
                '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI',
                '-Xbootclasspath/a:' + str(wbclasses),
                '--add-opens=java.base/java.util=ALL-UNNAMED',
                '-Djava.util.concurrent.ForkJoinPool.common.parallelism=4']
        if mode != 'interpreted':
            argv += ['-Xbatch']
        argv += flags + ['-cp', str(classes), 'XssActivation', mode,
                         'none' if mode == 'stress' else str(image / 'lib/librangesort.so')]
        slots.append(dict(name=name, kind='jvm', seconds=60, argv=argv,
                          env=env, cwd=str(ROOT)))
    plan = dict(
        schema='pr57-xss-build-and-correctness-command-plan-v1',
        execution_authorized=False, ready_to_execute=False,
        source_commit=commit, baseline_commit=BASE, stages=stages,
        build_limits=dict(concurrent_builds=1, jobs=1,
                          per_full_image_seconds=2700, U_dso_seconds=300,
                          combined_seconds=6300, cleanup_seconds=5,
                          fixture_compile_seconds=600,
                          expected_minutes='30-60 estimate, not a completed-build claim'),
        ordinary_slots=slots,
        ordinary_limits=dict(JVMs=8, native_processes=1, per_process_seconds=60,
                             global_seconds=300, cleanup_seconds=5,
                             explicit_GC=0, validated_sorts_ceiling=30000),
        prerequisites=[
            'Future build/ordinary execution authority; this plan grants none.',
            'Observed free storage is about 485 MB; retained reference build is 5.4 GiB plus 428 MiB image. Fresh matched staging is not available yet. No old artifacts deleted.',
            'Before stages: verify exact clean commits, no active owned work, approved tool pins and create absent task-local output parents. Stop on actual resource/source/build failure.',
            'Use fresh regular outer logs and deadline/process-group supervision; never pipeline through tee or use process substitution. Reviewed synchronous per-command logger is copied task-locally.',
            'Preserve E .su/compiler command/disassembly before U changes the common build output. Archive images and all bytes before any runtime.',
            'Before ANY ordinary native/JVM entry: independently review E/U optimized stack/callgraph, generic guard frame before SIMD kernel, complete ISA, no allocator/TLS/loader path, bounded heapsort and eager symbols. .su arithmetic alone is insufficient.',
            'Before JVM entry: retain C2 ABI/leaf-call/GC-map and non-moving-array reasoning; runtime activation checks close execution-dependent routing evidence.',
            'Assemble actual build receipts, ordinary manifest, independent ready review and authority. Commands below are not hash-bound executable receipts yet.',
        ],
        logger_reuse=dict(original=str(old_logger), copy=str(logger),
                          serial_logger_sha256=sha(logger / 'serial-log.py'),
                          executable_bytes_identical=True,
                          override_changes='task-local paths and unique invocation tags only'),
        stopping_rule='No further replacement campaign if neither E nor U shows broad practical benefit without repeated material losses. No automatic variant, extension or retry.')
    (ROOT / 'BUILD-AND-CORRECTNESS-PLAN.json').write_text(json.dumps(plan, indent=2) + '\n')
    print('WROTE source-only command plan; no child process was started')


if __name__ == '__main__':
    main()
