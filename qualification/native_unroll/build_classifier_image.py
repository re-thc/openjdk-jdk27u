"""Build one classifier HotSpot overlay; never rebuild historical controls or Java modules."""
import argparse
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import tarfile
import time

from classifier_images import (TOOLS, FILES, configure_arguments, historical_binding,
    payload_manifest, pins, record, require, source_binding, verify_overlay)


def cleanup_group(child, grace=1.0):
    """Finish the whole group even if its leader has already exited/reaped."""
    deferred_term = False
    def defer_term(signum, frame):
        nonlocal deferred_term
        deferred_term = True
    previous = signal.signal(signal.SIGTERM, defer_term)
    killed = False
    try:
        try:
            os.killpg(child.pid, signal.SIGTERM)
        except ProcessLookupError:
            return dict(pgid=child.pid, kill_required=False, live_members_after_cleanup=0)
        deadline = time.monotonic() + grace
        while time.monotonic() < deadline:
            child.poll()  # Reap the leader, but never use it as the group-liveness test.
            try:
                os.killpg(child.pid, 0)
            except ProcessLookupError:
                break
            time.sleep(0.02)
        try:
            os.killpg(child.pid, signal.SIGKILL)
            killed = True
        except ProcessLookupError:
            pass
        child.wait(timeout=10)
        deadline = time.monotonic() + 1.0
        while True:
            live = []
            for path in Path('/proc').iterdir():
                if not path.name.isdecimal():
                    continue
                try:
                    fields = (path / 'stat').read_text().rsplit(')', 1)[1].split()
                except (FileNotFoundError, ProcessLookupError):
                    continue
                if int(fields[2]) == child.pid and fields[0] not in ('Z', 'X', 'x'):
                    live.append(int(path.name))
            if not live:
                break
            require(time.monotonic() < deadline, 'Live command group members after SIGKILL: ' + str(live))
            time.sleep(0.02)
        return dict(pgid=child.pid, kill_required=killed, live_members_after_cleanup=0)
    finally:
        try:
            child.wait(timeout=10)
        finally:
            signal.signal(signal.SIGTERM, previous)
            if deferred_term:
                raise TimeoutError('Producer terminated during process-group cleanup')


def run_logged(argv, cwd, env, logfile, timeout):
    # Leave ten minutes for capture/upload within the outer90-minute job cap.
    with logfile.open('w') as stream:
        child = subprocess.Popen(argv, cwd=cwd, env=env, stdout=stream,
                                 stderr=subprocess.STDOUT, start_new_session=True)
        try:
            require(child.wait(timeout=timeout) == 0, 'Command failed: ' + str(argv[0]))
        finally:
            cleanup = cleanup_group(child)
            stream.write('CLASSIFIER_PROCESS_GROUP_CLEANUP=' + json.dumps(cleanup) + '\n')


def toolchain():
    paths = {}
    for name in TOOLS[:8]:
        found = shutil.which(name)
        require(found, 'Missing native tool: ' + name)
        paths[name] = Path(found).resolve()
    for name, compiler in [('cc1', 'gcc-16'), ('cc1plus', 'g++-16')]:
        found = subprocess.check_output([str(paths[compiler]), '-print-prog-name=' + name], text=True).strip()
        paths[name] = Path(found if Path(found).is_absolute() else shutil.which(found) or found).resolve()
    return paths


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source', type=Path, default=Path('.'))
    for name in ['historical-built', 'template-jdk', 'boot-built', 'boot-jdk', 'out']:
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--level', choices=['release', 'fastdebug'], required=True)
    p.add_argument('--execute', action='store_true')
    a = p.parse_args()
    source, out, boot_image = a.source.resolve(), a.out.resolve(), a.boot_jdk.resolve()
    require(not out.exists() or not any(out.iterdir()), 'Output must be empty')
    out.mkdir(parents=True, exist_ok=True)
    result = dict(schema=1, status='validating', level=a.level, new_hotspot_builds=1,
        new_control_builds=0, new_module_builds=0, same_toolchain_performance_pair=False)
    previous_term_handler = None

    def save():
        (out / 'classifier-build.json').write_text(json.dumps(result, indent=2) + '\n')

    try:
        pin = pins()
        result.update(source=source_binding(source, pin),
            historical_control=historical_binding(a.historical_built, a.template_jdk, a.level, pin),
            boot=historical_binding(a.boot_built, boot_image, 'release', pin), boot_image_root=str(boot_image),
            configure=['bash', str(source / 'bin/configure-dev'), *configure_arguments(a.level, boot_image)])
        result['status'] = 'planned'
        save()
        if not a.execute:
            print('CLASSIFIER_BUILD_PLAN=' + json.dumps(result)); return
        require(os.uname().machine == 'aarch64', 'Native AArch64 required')
        require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS')),
                'Inherited JVM options are not permitted')
        require(not (source / 'build/native-candidate').exists(), 'Refusing reuse of an existing HotSpot build')
        def interrupted(signum, frame):
            raise TimeoutError('Producer terminated before capture deadline')
        previous_term_handler = signal.signal(signal.SIGTERM, interrupted)
        deadline = time.monotonic() + 80 * 60
        paths = toolchain()
        before = {name: record(path) for name, path in paths.items()}
        env = dict(os.environ, CC=str(paths['gcc-16']), CXX=str(paths['g++-16']))
        result.update(tools_before=before, tool_paths={k:str(v) for k,v in paths.items()},
            compiler_env={k:env[k] for k in ('CC', 'CXX')},
            make=[str(paths['make']), 'CONF=native-candidate', 'hotspot'], status='building')
        save()
        image, logs = out / 'classifier-jdk', out / 'candidate'
        shutil.copytree(a.template_jdk, image, symlinks=True)
        logs.mkdir()
        for name in ['gcc-16', 'g++-16', 'mold']:
            run_logged([str(paths[name]), '--version'], source, env, logs / (name + '-version.txt'), 30)
        for name, argv in [('configure', result['configure']), ('build', result['make'])]:
            remaining = deadline - time.monotonic()
            require(remaining > 0, 'Build pre-capture deadline elapsed')
            run_logged(argv, source, env, logs / (name + '.log'), remaining)
        lib = source / 'build/native-candidate/support/modules_libs/java.base/server/libjvm.so'
        shutil.copy2(lib, image / 'lib/server/libjvm.so')
        for spec in (source / 'build/native-candidate').glob('*spec.gmk'):
            shutil.copy2(spec, logs / spec.name)
        run_logged([str(image / 'bin/java'), '-version'], source, env, logs / 'java-version.txt',
                   min(60, max(1, deadline - time.monotonic())))
        actual = {name: record(image / name) for name in FILES}
        payload = payload_manifest(image)
        verify_overlay(result['historical_control']['payload'], payload)
        for name in ['bin/java', 'lib/modules', 'release']:
            require(actual[name] == result['historical_control']['image'][name], 'Java template changed')
        require(actual['lib/server/libjvm.so'] != result['historical_control']['image']['lib/server/libjvm.so'],
                'New candidate VM was not installed')
        after = {name: record(path) for name, path in paths.items()}
        require(before == after, 'Toolchain changed during candidate build')
        require((logs / 'spec.gmk').is_file(), 'Configure spec not captured')
        require(source_binding(source, pin) == result['source'],
                'Candidate source binding changed during build')
        result.update(image=actual, candidate_payload=payload, tools_after=after,
            evidence={path.relative_to(out).as_posix():record(path) for path in sorted(logs.iterdir())},
            status='completed')
        save()
        (out / 'classifier-provenance.json').write_text(json.dumps(pin, indent=2) + '\n')
        with tarfile.open(out / 'classifier-jdk.tar.gz', 'w:gz') as archive:
            archive.add(image, arcname='classifier-jdk')
        print('CLASSIFIER_BUILD_COMPLETED=true')
    except BaseException as error:
        result.update(status='failed', error=str(error))
        save()
        raise
    finally:
        if previous_term_handler is not None:
            signal.signal(signal.SIGTERM, previous_term_handler)


if __name__ == '__main__':
    main()
