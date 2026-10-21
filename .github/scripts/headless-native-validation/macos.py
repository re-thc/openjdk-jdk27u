# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. See LICENSE for details.

"""Run exactly six existing native launcher/JNI entry points; no driver JVM."""
import argparse
import json
import os
from pathlib import Path
import resource
import signal
import subprocess
import sys
import tempfile
import time


def environment(libdir):
    env = {k: v for k, v in os.environ.items() if not k.startswith('DYLD_') and k not in (
        'JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS', 'JDK_AOT_VM_OPTIONS',
        'GITHUB_TOKEN', 'GH_TOKEN')}
    env['DYLD_LIBRARY_PATH'] = str(libdir)
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


def validate(result, text, kind, variant, revision):
    if result['error']:
        return result['error']
    if result['exit_code'] != 0:
        return 'Native process exited with status ' + str(result['exit_code'])
    if kind == 'jni':
        return None if 'initVM: numOptions = 2' in text else 'Missing JNI invocation output'
    if revision not in text or ('fastdebug' in text) != (variant == 'fastdebug'):
        return 'JLI version/debug identity mismatch'
    return None


def self_test():
    import unittest

    class Tests(unittest.TestCase):
        def test_success_and_wrong_version(self):
            result = {'error': None, 'exit_code': 0}
            self.assertIsNone(validate(result, 'build-rev fastdebug', 'jli', 'fastdebug', 'build-rev'))
            self.assertIsNotNone(validate(result, 'wrong', 'jli', 'release', 'build-rev'))

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
    results = []
    for variant in ('release', 'fastdebug'):
        image = identity['images'][variant]
        home = Path(image['home'])
        if home.name != 'Home' or not (home.parent / 'MacOS/libjli.dylib').is_file():
            raise RuntimeError('Expected Mac Home bundle and MacOS libjli alias')
        cases = [('jli-home', image['jli'], ['--version'], home / 'lib'),
                 ('jli-bundle', image['jli'], ['--version'], home.parent / 'MacOS'),
                 ('jni', image['jni'], [], home / 'lib')]
        for name, exe, argv, libdir in cases:
            case = variant + '-' + name
            directory = evidence / case
            directory.mkdir()
            env = environment(libdir)
            result, out, err = run_child([exe, *argv], env, directory)
            result.update(case=case, loader_path=str(libdir), java_tool_options=env['JAVA_TOOL_OPTIONS'])
            (directory / 'stdout.txt').write_bytes(out)
            (directory / 'stderr.txt').write_bytes(err)
            result['error'] = validate(result, (out + err).decode(errors='replace'),
                                       'jni' if name == 'jni' else 'jli', variant, revision)
            if list(directory.glob('core*')):
                result['error'] = 'Unexpected core file'
            results.append(result)
            (evidence / 'results.json').write_text(json.dumps(results, indent=2))
            if not result['cleanup_complete']:
                raise SystemExit('Cleanup incomplete; do not launch another target')
    if len(results) != 6 or any(result['error'] for result in results):
        raise SystemExit('Mac native validation failed; see evidence')
    print('PASS: six Mac target-image processes')


if __name__ == '__main__':
    main()
