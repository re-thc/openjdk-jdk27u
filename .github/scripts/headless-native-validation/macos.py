# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. See LICENSE for details.

"""Run exactly six existing native launcher/JNI entry points; no driver JVM."""
import argparse
import json
import os
from pathlib import Path
import re
import resource
import signal
import subprocess
import sys
import tempfile
import time

from mac_image import inspect_image


def environment(libdir):
    env = {k: v for k, v in os.environ.items() if not k.startswith('DYLD_') and k not in (
        'JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS', 'JDK_AOT_VM_OPTIONS',
        'GITHUB_TOKEN', 'GH_TOKEN')}
    env['DYLD_LIBRARY_PATH'] = str(libdir)
    env['DYLD_PRINT_LIBRARIES'] = '1'
    env['JAVA_TOOL_OPTIONS'] = '-XX:-CreateCoredumpOnCrash'
    return env


def run_child(argv, env, cwd, timeout=30):
    started = time.monotonic()
    child = subprocess.Popen(argv, env=env, cwd=cwd, stdin=subprocess.DEVNULL,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
    error = None
    drained = True
    try:
        out, err = child.communicate(timeout=timeout)
    except subprocess.TimeoutExpired as first_timeout:
        error = '30-second process/output deadline expired'
        try:
            os.killpg(child.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        except OSError as failure:
            error += '; group kill failed: ' + str(failure)
        # Cover a failed process-group signal without extending the cleanup bound.
        child.kill()
        try:
            out, err = child.communicate(timeout=5)
        except subprocess.TimeoutExpired as cleanup_timeout:
            out = cleanup_timeout.output or first_timeout.output or b''
            err = cleanup_timeout.stderr or first_timeout.stderr or b''
            drained = False
            child.stdout.close()
            child.stderr.close()
            error += '; five-second cleanup deadline expired'
    return {'pid': child.pid, 'argv': argv, 'exit_code': child.poll(),
            'elapsed_seconds': time.monotonic() - started,
            'cleanup_complete': drained and child.poll() is not None, 'error': error}, out, err


def plan(identity):
    cases = []
    for variant in ('release', 'fastdebug'):
        image = identity['images'][variant]
        actual = inspect_image(Path(image['jdk_root']), Path(image['tests_root']), variant,
                               identity['manifest']['build_commit'])
        if actual != image:
            raise RuntimeError('Mac image identity changed: ' + variant)
        routes = [('home', Path(image['libjli']).parent)]
        if variant == 'release':
            routes.append(('bundle', Path(image['bundle_libjli']).parent))
        for route, libdir in routes:
            for kind in ('jli', 'jni'):
                exe = image[kind]
                libraries = [str(libdir / 'libjli.dylib'), image['libjvm']]
                cases.append({'case': f'{variant}-{kind}-{route}', 'variant': variant, 'kind': kind,
                              'argv': [exe, '--version'] if kind == 'jli' else [exe],
                              'loader_path': str(libdir), 'libraries': libraries,
                              'hashes': {path: image['hashes'][path] for path in [exe, *libraries]}})
    if len(cases) != 6:
        raise RuntimeError('Expected six Mac target cases')
    return cases


def loaded_libraries(text, pid):
    # Apple's Loader::logLoad emits "<uuid> path"; RuntimeState prefixes dyld[pid].
    paths = re.findall(r'^dyld\[([0-9]+)\]:\s+(?:<[^>]*>\s+)?(/[^\n\r]+)', text, re.MULTILINE)
    return {str(Path(path).resolve()) for source_pid, path in paths if int(source_pid) == pid
            and Path(path).name in ('libjli.dylib', 'libjvm.dylib')}


def validate(result, text, case, revision):
    if result['error']:
        return result['error']
    if result['exit_code'] != 0:
        return 'Native process exited with status ' + str(result['exit_code'])
    if not result['cleanup_complete'] or result['pid'] <= 0:
        return 'Native process identity/cleanup incomplete'
    if loaded_libraries(text, result['pid']) != {str(Path(p).resolve()) for p in case['libraries']}:
        return 'Loaded libjli/libjvm paths do not match selected image/route'
    if case['kind'] == 'jni':
        # The existing binary calls DestroyJavaVM but does not check its return value.
        parts = ('initVM: numOptions = 2', '-XX:+PrintCommandLineFlags', '-Xrs')
        return None if all(part in text for part in parts) else 'Missing JNI invocation output'
    version_lines = [line for line in text.splitlines() if not line.startswith('dyld[')
                     and re.search(r'\bVM \([^\n]*\)$', line)]
    if len(version_lines) != 1 or revision not in version_lines[0] or (
            bool(re.search(r'\bfastdebug\b', version_lines[0])) != (case['variant'] == 'fastdebug')):
        return 'JLI version/debug identity mismatch'
    return None


def self_test():
    import unittest

    class Tests(unittest.TestCase):
        def test_success_and_wrong_version(self):
            result = {'error': None, 'exit_code': 0, 'pid': 42, 'cleanup_complete': True}
            case = {'kind': 'jli', 'variant': 'fastdebug',
                    'libraries': ['/selected/lib/libjli.dylib', '/selected/lib/server/libjvm.dylib']}
            loads = '\n'.join('dyld[42]: <no uuid> ' + p for p in case['libraries'])
            version = '\nOpenJDK 64-Bit Server VM (fastdebug build-rev, mixed mode)'
            self.assertIsNone(validate(result, loads + version, case, 'build-rev'))
            self.assertIsNotNone(validate(result, loads + '\nwrong', case, 'build-rev'))
            self.assertIsNotNone(validate(result, loads.replace('/selected/', '/other/') + version, case, 'build-rev'))
            self.assertIsNotNone(validate(result, loads.replace('[42]', '[43]') + version, case, 'build-rev'))
            # Debug paths in the dyld transcript must not masquerade as debug VM identity.
            case['libraries'] = [p.replace('/selected/', '/selected/fastdebug/') for p in case['libraries']]
            debug_loads = loads.replace('/selected/', '/selected/fastdebug/')
            self.assertIsNotNone(validate(result, debug_loads + version.replace('fastdebug ', ''), case, 'build-rev'))
            case['libraries'] = [p.replace('/selected/fastdebug/', '/selected/') for p in case['libraries']]
            case['kind'] = 'jni'
            self.assertIsNone(validate(result, loads + '\ninitVM: numOptions = 2\n-XX:+PrintCommandLineFlags\n-Xrs', case, 'build-rev'))
            self.assertIsNotNone(validate(result, loads + '\ninitVM: numOptions = 2', case, 'build-rev'))

        def test_six_cases_use_only_existing_layout_routes(self):
            from unittest.mock import patch
            images = {}
            for variant in ('release', 'fastdebug'):
                home = '/jdk-27.0.2.jdk/Contents/Home' if variant == 'release' else '/jdk-27.0.2/fastdebug'
                image = {key: home + '/' + name for key, name in (
                    ('libjli', 'lib/libjli.dylib'), ('libjvm', 'lib/server/libjvm.dylib'),
                    ('jli', 'native/JliLaunchTest'), ('jni', 'native/JniInvocationTest'))}
                image.update(jdk_root=variant, tests_root='/native')
                if variant == 'release':
                    image['bundle_libjli'] = '/jdk-27.0.2.jdk/Contents/MacOS/libjli.dylib'
                image['hashes'] = {p: 'fixture-hash' for key, p in image.items() if key not in ('jdk_root', 'tests_root')}
                images[variant] = image
            identity = {'manifest': {'build_commit': 'revision'}, 'images': images}
            with patch(__name__ + '.inspect_image', side_effect=lambda jdk, *_: images[str(jdk)]):
                cases = plan(identity)
            self.assertEqual(len(cases), 6)
            self.assertEqual(sum(c['variant'] == 'release' for c in cases), 4)
            self.assertEqual(sum(c['kind'] == 'jni' for c in cases), 3)
            self.assertEqual([c['case'] for c in cases if c['variant'] == 'fastdebug'],
                             ['fastdebug-jli-home', 'fastdebug-jni-home'])
            images['fastdebug']['hashes']['changed'] = 'wrong'
            with patch(__name__ + '.inspect_image', return_value={}), self.assertRaises(RuntimeError):
                plan(identity)

        def test_timeout_and_reap(self):
            with tempfile.TemporaryDirectory() as temp:
                result, _, _ = run_child([sys.executable, '-c', 'import time; time.sleep(10)'],
                                         environment('/fixture'), temp, timeout=0.1)
                self.assertIsNotNone(result['error'])
                self.assertIsNotNone(result['exit_code'])
                self.assertTrue(result['cleanup_complete'])
                self.assertLess(result['elapsed_seconds'], 5.5)

        def test_environment(self):
            env = environment('/selected/lib')
            self.assertEqual(env['JAVA_TOOL_OPTIONS'], '-XX:-CreateCoredumpOnCrash')
            self.assertEqual(env['DYLD_LIBRARY_PATH'], '/selected/lib')
            self.assertEqual(env['DYLD_PRINT_LIBRARIES'], '1')
            self.assertNotIn('_JAVA_OPTIONS', env)

    result = unittest.TextTestRunner().run(unittest.defaultTestLoader.loadTestsFromTestCase(Tests))
    if not result.wasSuccessful():
        raise SystemExit(1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--evidence', type=Path)
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    if sys.platform != 'darwin':
        raise RuntimeError('Native execution requires macOS')
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    evidence = args.evidence.resolve()
    identity = json.loads((evidence / 'identity.json').read_text())
    revision = identity['manifest']['build_commit']
    cases = plan(identity)  # Validate both layouts and all hashes before starting any target.
    results = []
    for case in cases:
        directory = evidence / case['case']
        directory.mkdir()
        env = environment(case['loader_path'])
        result, out, err = run_child(case['argv'], env, directory)
        result.update(case=case['case'], loader_path=case['loader_path'], hashes=case['hashes'],
                      java_tool_options=env['JAVA_TOOL_OPTIONS'])
        (directory / 'stdout.txt').write_bytes(out)
        (directory / 'stderr.txt').write_bytes(err)
        text = (out + err).decode(errors='replace')
        result['loaded_libraries'] = sorted(loaded_libraries(text, result['pid']))
        result['error'] = validate(result, text, case, revision)
        if list(directory.glob('core*')):
            result['error'] = 'Unexpected core file'
        results.append(result)
        (evidence / 'results.json').write_text(json.dumps(results, indent=2))
        print(json.dumps({k: result[k] for k in ('case', 'pid', 'exit_code', 'cleanup_complete', 'loaded_libraries', 'error')}), flush=True)
        if not result['cleanup_complete']:
            raise SystemExit('Cleanup incomplete; do not launch another target')
    if len(results) != 6 or any(result['error'] for result in results):
        raise SystemExit('Mac native validation failed; see evidence')
    print('PASS: six Mac target-image processes')


if __name__ == '__main__':
    main()
