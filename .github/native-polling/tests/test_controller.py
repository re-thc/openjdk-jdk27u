import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("native_controller", ROOT / "controller.py")
controller = importlib.util.module_from_spec(spec)
spec.loader.exec_module(controller)


class ControllerTests(unittest.TestCase):
    def runner(self, directory, seconds=10):
        return controller.Runner(directory, ROOT / "supervise.py", time.monotonic() + seconds)

    def test_normal_exit_keeps_output_and_cleans_group(self):
        with tempfile.TemporaryDirectory() as d:
            result = self.runner(d).run("normal", [sys.executable, "-c", "print('preserved')"], cap=3)
            self.assertEqual(Path(result['log']).read_text().strip(), 'preserved')
            self.assertEqual(json.loads((Path(d) / 'active-processes.json').read_text()), [])
            self.assertEqual(result['returncode'], 0)
            self.assertGreater(result['elapsed_seconds'], 0)
            self.assertIn('group_teardown', result)

    def test_nonzero_keeps_status_and_stderr(self):
        with tempfile.TemporaryDirectory() as d:
            with self.assertRaises(controller.CommandFailure):
                self.runner(d).run("failure", [sys.executable, "-c", "import sys;print('failure evidence',file=sys.stderr);sys.exit(17)"], cap=3)
            records = list(Path(d).glob('commands/*/command.json'))
            record = json.loads(records[0].read_text())
            self.assertEqual(record['status'], 'failed')
            self.assertEqual(record['returncode'], 17)
            self.assertIn('failure evidence', Path(record['log']).read_text())

    def test_timeout_kills_child_and_grandchild(self):
        with tempfile.TemporaryDirectory() as d:
            pidfile = Path(d) / 'grandchild.pid'
            script = "import subprocess,sys,time; p=subprocess.Popen([sys.executable,'-c','import time;time.sleep(60)']);open(sys.argv[1],'w').write(str(p.pid));time.sleep(60)"
            with self.assertRaises(controller.CommandFailure):
                self.runner(d).run('timeout', [sys.executable, '-c', script, str(pidfile)], cap=.4)
            pid = int(pidfile.read_text())
            # An adopted zombie has no executable work left, and may await PID 1.
            result = subprocess.run(['ps', '-p', str(pid), '-o', 'stat='], text=True, capture_output=True)
            self.assertTrue(result.returncode != 0 or result.stdout.strip().startswith('Z'))
            record = json.loads(next(Path(d).glob('commands/*/command.json')).read_text())
            self.assertEqual(record['status'], 'timeout')
            self.assertEqual(json.loads((Path(d) / 'active-processes.json').read_text()), [])

    def test_expired_deadline_does_not_launch(self):
        with tempfile.TemporaryDirectory() as d:
            runner = self.runner(d, -1)
            with self.assertRaises(controller.CommandFailure):
                runner.run('expired', [sys.executable, '-c', "raise AssertionError('launched')"])
            self.assertFalse(list(Path(d).glob('commands/*/receipt.json')))

    def test_phase_failure_preserves_record(self):
        with tempfile.TemporaryDirectory() as d:
            runner = self.runner(d)
            with self.assertRaisesRegex(ValueError, 'injected'):
                with runner.phase('setup', 2):
                    raise ValueError('injected setup failure')
            record = json.loads((Path(d) / 'phases/setup.json').read_text())
            self.assertEqual(record['status'], 'failed')
            self.assertIn('injected', record['error'])

    def test_cleanup_rejects_stale_identity(self):
        with tempfile.TemporaryDirectory() as d:
            controller.write_json(Path(d) / 'active-processes.json', [
                {'pid': os.getpid(), 'start_identity': 'wrong identity'}])
            result = controller.cleanup_registry(d)
            self.assertEqual(result[0]['status'], 'identity-mismatch-no-signal')

    def test_setup_failure_still_records_status_and_phase(self):
        if sys.platform == 'darwin': self.skipTest('Linux native-platform refusal check')
        from unittest.mock import patch
        with tempfile.TemporaryDirectory() as d:
            q = controller.Qualification(ROOT.parents[1], d, 'a' * 40)
            with patch.object(controller, 'validate_sources', return_value={'fixture': True}):
                with self.assertRaisesRegex(controller.CommandFailure, 'Darwin'):
                    q.execute()
            self.assertEqual(json.loads((Path(d) / 'status.json').read_text())['status'], 'failed')
            self.assertEqual(json.loads((Path(d) / 'phases/setup.json').read_text())['status'], 'failed')
            self.assertEqual(json.loads((Path(d) / 'active-processes.json').read_text()), [])
            self.assertTrue((Path(d) / 'cleanup.json').exists())

    def test_failed_build_retains_configuration(self):
        from unittest.mock import patch
        with tempfile.TemporaryDirectory() as d:
            q = controller.Qualification(ROOT.parents[1], Path(d) / 'evidence', 'a' * 40)
            q.source = Path(d) / 'source'
            config = q.source / 'build/native-release'
            config.mkdir(parents=True)
            (config / 'spec.gmk').write_text('retained spec')
            (config / 'configure.log').write_text('retained configure')
            with patch.object(q, 'command', side_effect=controller.CommandFailure('injected build failure')):
                with self.assertRaises(controller.CommandFailure):
                    q.build('baseline', controller.B, 'release', 2)
            self.assertEqual((q.output / 'build-metadata/baseline/spec.gmk').read_text(), 'retained spec')
            self.assertTrue((q.output / 'build-metadata/baseline/configure.log').exists())

    def test_checkout_failure_collection_needs_no_source(self):
        import yaml
        workflow = yaml.load((ROOT.parents[1] / '.github/workflows/main.yml').read_text(), Loader=yaml.BaseLoader)
        steps = workflow['jobs']['native-macos']['steps']
        with tempfile.TemporaryDirectory() as d:
            env = os.environ.copy()
            env.update(RUNNER_TEMP=d, PREVIOUS_JOB_STATUS='failure')
            for step in (steps[0], steps[-2]):
                result = subprocess.run(['bash', '-e', '-o', 'pipefail', '-c', step['run']],
                                        cwd=d, env=env, capture_output=True, text=True, timeout=10)
                self.assertEqual(result.returncode, 0, result.stderr)
            root = Path(d) / 'native-polling-evidence'
            self.assertTrue((root / 'job-start.json').exists())
            record = json.loads((root / 'collection.json').read_text())
            self.assertEqual(record['job_status_before_collection'], 'failure')
            self.assertIn('not started', record['controller_status'])
            exported = Path(d) / 'native-polling-artifacts'
            self.assertTrue((exported / 'job-start.json').exists())
            self.assertTrue((exported / 'collection.json').exists())

    def test_signal_interruption_tears_down_grandchild(self):
        import signal
        with tempfile.TemporaryDirectory() as d:
            pidfile = Path(d) / 'grandchild.pid'
            script = Path(d) / 'harness.py'
            script.write_text("import sys,signal,time;sys.path.insert(0," + repr(str(ROOT)) + ")\n"
                "from controller import Runner,CommandFailure\n"
                "from pathlib import Path\n"
                "def interrupted(*_): raise CommandFailure('signal interruption')\n"
                "signal.signal(signal.SIGTERM,interrupted)\n"
                "r=Runner(sys.argv[1],Path(" + repr(str(ROOT)) + ")/'supervise.py',time.monotonic()+10)\n"
                "try:\n r.run('interrupted',[sys.executable,'-c',\"import subprocess,sys,time;p=subprocess.Popen([sys.executable,'-c','import time;time.sleep(60)']);open(sys.argv[1],'w').write(str(p.pid));time.sleep(60)\",sys.argv[2]],cap=9)\n"
                "except CommandFailure: pass\n")
            proc = subprocess.Popen([sys.executable, script, str(Path(d) / 'results'), str(pidfile)],
                                    stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, start_new_session=True)
            try:
                deadline = time.monotonic() + 4
                while not pidfile.exists() and time.monotonic() < deadline: time.sleep(.02)
                self.assertTrue(pidfile.exists())
                proc.send_signal(signal.SIGTERM)
                _, err = proc.communicate(timeout=4)
                self.assertEqual(proc.returncode, 0, err)
                pid = int(pidfile.read_text())
                state = subprocess.run(['ps', '-p', str(pid), '-o', 'stat='], text=True, capture_output=True)
                self.assertTrue(state.returncode != 0 or state.stdout.strip().startswith('Z'))
                self.assertEqual(json.loads((Path(d) / 'results/active-processes.json').read_text()), [])
            finally:
                if proc.poll() is None: proc.kill(); proc.wait()
                controller.cleanup_registry(Path(d) / 'results')

    def test_campaign_budget_and_balancing(self):
        rows = controller.trial_plan()
        self.assertEqual(len(rows), 64)
        self.assertEqual(len({r['pair'] for r in rows}), 32)
        self.assertEqual(sum((r['warmup_ms'] + r['measure_ms']) / 1000 for r in rows), 352)
        self.assertEqual(sum(r['command_cap_seconds'] for r in rows), 768)
        self.assertLess(768 + len(rows) * .25, 900)
        self.assertEqual(sum(controller.STAGE_CAPS.values()), 130 * 60)
        self.assertEqual(sum(controller.STAGE_CAPS.values()) + 5 * 60 + 5 * 60, 140 * 60)
        for case in controller.MAIN_CASES + controller.CONTROL_CASES:
            firsts = [rows[i]['arm'] for i in range(0, len(rows), 2) if rows[i]['case'] == case]
            self.assertEqual(firsts.count('baseline'), 2)
            self.assertEqual(firsts.count('candidate'), 2)

    def test_formula_gate_rejects_version_drift_and_noncore_sources(self):
        formulae = [{'name': name, 'tap': 'homebrew/core', 'versions': {'stable': version}}
                    for name, version in controller.BREW_VERSIONS.items()]
        controller.check_brew_versions(json.dumps({'formulae': formulae}))
        for index in range(len(formulae)):
            for key, value in (('tap', 'other/tap'), ('versions', {'stable': 'unexpected'})):
                changed = json.loads(json.dumps(formulae))
                changed[index][key] = value
                with self.assertRaises(controller.CommandFailure):
                    controller.check_brew_versions(json.dumps({'formulae': changed}))

    def tool_outputs(self, name, *_args, **_kwargs):
        values = {'xcode-version': 'Xcode 26.6\nBuild version 17F113', 'sdk-version': '26.5',
                  'brew-prefix': '/opt/homebrew', 'autoconf-version': 'autoconf (GNU Autoconf) 2.73',
                  'make-version': 'GNU Make 4.4.1', 'm4-version': 'm4 (GNU M4) 1.4.21',
                  'brew-build-tool-formulae': json.dumps({'formulae': [
                      {'name': name, 'tap': 'homebrew/core', 'versions': {'stable': version}}
                      for name, version in controller.BREW_VERSIONS.items()]})}
        return values[name]

    def test_missing_runner_utilities_are_reported_together_before_install(self):
        from unittest.mock import patch
        with tempfile.TemporaryDirectory() as d:
            q = controller.Qualification(ROOT.parents[1], d, 'a' * 40)
            with patch.object(controller.shutil, 'which', side_effect=lambda name: None if name in ('brew', 'curl') else '/fixture'), \
                    patch.object(Path, 'is_dir', return_value=True), patch.object(q, 'command') as command:
                with self.assertRaisesRegex(controller.CommandFailure, 'brew, curl'):
                    q.prepare_tools()
                command.assert_not_called()

    def test_missing_xcode_components_are_reported_together_before_install(self):
        from unittest.mock import patch
        with tempfile.TemporaryDirectory() as d:
            q = controller.Qualification(ROOT.parents[1], d, 'a' * 40)
            def fail_components(name, *_args, **_kwargs):
                if name in ('xcode-version-metal', 'xcode-version-metallib'):
                    raise controller.CommandFailure('missing component')
            with patch.object(controller.shutil, 'which', return_value='/fixture'), \
                    patch.object(controller.shutil, 'disk_usage', return_value=type('Disk', (), {'free': 20 * 1024**3})()), \
                    patch.object(Path, 'is_dir', return_value=True), \
                    patch.object(q, 'command_output', side_effect=self.tool_outputs), \
                    patch.object(q, 'command', side_effect=fail_components) as command:
                with self.assertRaisesRegex(controller.CommandFailure, 'metal, metallib'):
                    q.prepare_tools()
                self.assertEqual(len(command.call_args_list), 14)
                self.assertFalse(any(row.args[0] == 'install-build-tools' for row in command.call_args_list))

    def test_tool_setup_limits_install_and_rejects_formula_drift_before_it(self):
        from unittest.mock import patch
        for drift in (False, True):
            with self.subTest(drift=drift), tempfile.TemporaryDirectory() as d:
                q = controller.Qualification(ROOT.parents[1], d, 'a' * 40)
                def outputs(name, *args, **kwargs):
                    value = self.tool_outputs(name, *args, **kwargs)
                    return value.replace('2.73', '2.74') if drift and name == 'brew-build-tool-formulae' else value
                with patch.object(controller.shutil, 'which', return_value='/fixture'), \
                        patch.object(controller.shutil, 'disk_usage', return_value=type('Disk', (), {'free': 20 * 1024**3})()), \
                        patch.object(Path, 'is_dir', return_value=True), \
                        patch.object(q, 'command_output', side_effect=outputs), patch.object(q, 'command') as command:
                    if drift:
                        with self.assertRaises(controller.CommandFailure): q.prepare_tools()
                        self.assertFalse(any(row.args[0] == 'install-build-tools' for row in command.call_args_list))
                    else:
                        q.prepare_tools()
                        install = [row for row in command.call_args_list if row.args[0] == 'install-build-tools']
                        self.assertEqual(len(install), 1)
                        self.assertEqual(install[0].args[1], ['brew', 'install', '--formula',
                            'homebrew/core/autoconf', 'homebrew/core/make'])
                        self.assertEqual(install[0].kwargs['cap'], 120)
                        self.assertEqual(q.make, '/opt/homebrew/opt/make/bin/gmake')
                        self.assertEqual(q.runner.env['M4'], '/opt/homebrew/opt/m4/bin/m4')
                        for name in ('HOMEBREW_NO_AUTO_UPDATE', 'HOMEBREW_NO_INSTALL_UPGRADE', 'HOMEBREW_NO_INSTALL_CLEANUP'):
                            self.assertEqual(q.runner.env[name], '1')

    def test_bad_or_unverified_footer_is_rejected(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / 'output'
            for text in ('no footer', 'NATIVE_POLLING_RESULT {}',
                         'NATIVE_POLLING_RESULT {"wall_ns":1,"cpu_ns":1,"units":1,"operations":1,"verified":false}'):
                p.write_text(text)
                with self.assertRaises(controller.CommandFailure):
                    controller.parse_benchmark(p)

    def test_incomplete_pair_is_retained(self):
        result = controller.summarize([{'pair':'stable-0','case':'stable','arm':'baseline','status':'failed'}])
        self.assertEqual(result['complete_pairs'], 0)
        self.assertEqual(result['pairs'][0]['status'], 'incomplete')
        self.assertEqual(result['observations'], 1)

    def test_failed_second_arm_is_not_counted_as_complete(self):
        metrics = {'wall_ns':10,'cpu_ns':10,'units':1}
        result = controller.summarize([
            {'pair':'stable-0','case':'stable','arm':'baseline','status':'passed','result':metrics},
            {'pair':'stable-0','case':'stable','arm':'candidate','status':'failed','result':metrics}])
        self.assertEqual(result['complete_pairs'], 0)
        self.assertEqual(result['pairs'][0]['status'], 'incomplete')

    def test_phase_deadline_overrides_longer_command_cap(self):
        with tempfile.TemporaryDirectory() as d:
            runner = self.runner(d)
            started = time.monotonic()
            with self.assertRaises(controller.CommandFailure):
                with runner.phase('short', .05):
                    runner.run('phase timeout', [sys.executable, '-c', 'import time;time.sleep(60)'], cap=5)
            self.assertLess(time.monotonic() - started, 2)
            self.assertEqual(json.loads((Path(d) / 'active-processes.json').read_text()), [])

    def test_image_manifest_binds_source_architecture_and_symlinks(self):
        with tempfile.TemporaryDirectory() as d:
            image = Path(d) / 'image'; image.mkdir()
            (image / 'release').write_text('SOURCE=".:git:' + controller.C[:12] + '"\nOS_ARCH="aarch64"\n')
            (image / 'payload').write_text('image bytes')
            (image / 'link').symlink_to('payload')
            result = controller.image_manifest(image, Path(d) / 'manifest.json', controller.C)
            self.assertEqual(result['source'], controller.C)
            self.assertTrue(any(r.get('target') == 'payload' for r in result['files']))
            with self.assertRaises(controller.CommandFailure):
                controller.image_manifest(image, Path(d) / 'bad.json', controller.B)
            (image / 'release').write_text('SOURCE=".:git:' + controller.C[:12] + '"\nOS_ARCH="x86_64"\n')
            with self.assertRaises(controller.CommandFailure):
                controller.image_manifest(image, Path(d) / 'bad-arch.json', controller.C)

    def test_runtime_source_allowlist_excludes_documents_and_private_notes(self):
        with tempfile.TemporaryDirectory() as d:
            code = Path(d) / 'code'
            target = Path(d) / 'snapshot'
            for name in controller.ARTIFACT_SOURCE_FILES:
                p = code / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text('runtime input')
            for name in ('SELF-REVIEW.md', 'README.md', 'notes/private.md', '__pycache__/cache.pyc'):
                p = code / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text('private note')
            hashes = controller.snapshot_runtime_sources(code, target)
            copied = {str(p.relative_to(target)) for p in target.rglob('*') if p.is_file()}
            self.assertEqual(copied, set(controller.ARTIFACT_SOURCE_FILES))
            self.assertEqual(set(hashes), set(controller.ARTIFACT_SOURCE_FILES))
            self.assertFalse(any('REVIEW' in name or 'private' in name for name in hashes))

    def test_hosted_export_excludes_images_binaries_private_state_and_reviews(self):
        with tempfile.TemporaryDirectory() as d:
            source, target = Path(d) / 'evidence', Path(d) / 'export'
            allowed = ('source-identities.json', 'observations.json', 'commands/001/output.log',
                       'jtreg/test/report/text/summary.txt', 'validation-source/controller.py',
                       'native-diagnostics/sun_nio_ch_KQueue.h')
            denied = ('images/candidate/lib/modules', 'benchmark-classes/Probe.class',
                      'native-helper/libVThreadPinner.dylib', 'native-diagnostics/signal',
                      'active-processes.json', 'cleanup.json', 'build-metadata/baseline/spec.gmk',
                      'validation-source/SELF-REVIEW.md', 'review.md', 'commands/001/private-review.json',
                      'phases/private-review.json',
                      'jtreg/test/work/Probe.class', 'source-snapshots/private-review.md')
            for name in allowed + denied:
                p = source / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_text('fixture')
            manifest = controller.export_artifacts(source, target)
            self.assertEqual({r['path'] for r in manifest}, set(allowed))
            for name in denied: self.assertFalse((target / name).exists(), name)
            self.assertTrue((target / 'artifact-manifest.json').exists())

    def test_workflow_is_one_literal_shell_job_with_always_collection(self):
        import yaml
        workflow = yaml.load((ROOT.parents[1] / '.github/workflows/main.yml').read_text(), Loader=yaml.BaseLoader)
        self.assertEqual(set(workflow['on']), {'workflow_dispatch'})
        self.assertEqual(len(workflow['jobs']), 1)
        job = workflow['jobs']['native-macos']
        self.assertEqual(job['timeout-minutes'], '150')
        self.assertNotIn('strategy', job)
        for step in job['steps']:
            if 'run' in step:
                self.assertEqual(step['shell'], 'bash')
                # Also parse every literal run block as bash, without executing it.
                self.assertEqual(subprocess.run(['bash', '-n'], input=step['run'], text=True).returncode, 0)
                import re
                for marker in ('PY', 'PYTHON'):
                    for body in re.findall(r"python3 - <<'" + marker + r"'\n(.*?)\n" + marker, step['run'], re.S):
                        compile(body, '<workflow-python-heredoc>', 'exec')
        self.assertEqual(job['steps'][-1]['if'], 'always()')
        self.assertEqual(job['steps'][-1]['with']['path'], '${{ runner.temp }}/native-polling-artifacts')
        self.assertEqual(job['steps'][-1]['with']['retention-days'], '5')
        self.assertEqual(job['steps'][-1]['with']['include-hidden-files'], 'false')
        self.assertEqual(job['steps'][-2]['if'], 'always()')
        self.assertEqual(job['steps'][1]['timeout-minutes'], '5')
        self.assertEqual(job['steps'][1]['with']['fetch-depth'], '5')
        self.assertEqual(job['steps'][1]['with']['persist-credentials'], 'false')


if __name__ == '__main__':
    unittest.main()
