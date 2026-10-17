#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Exercise the production preparation entry point with curl and javac mocked.

Real file hashing, partial-file promotion, failure receipts and source selection
are exercised. No network request, compiler, JVM or benchmark is executed.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location(
    'regex_prepare', Path(__file__).with_name('prepare-rust-regex-benchmarks.py'))
prepare = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prepare)


class Preparation(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.java_home = self.root / 'jdk'
        (self.java_home / 'bin').mkdir(parents=True)
        (self.java_home / 'bin' / ('javac.exe' if prepare.os.name == 'nt' else 'javac')).write_text('never executed')
        self.output = self.root / 'out'
        self.payloads = {path: ('fixture:' + path).encode() for _, path in prepare.DEPENDENCIES}
        fixture = tuple((hashlib.sha256(self.payloads[path]).hexdigest(), path)
                        for _, path in prepare.DEPENDENCIES)
        dependencies = patch.object(prepare, 'DEPENDENCIES', fixture)
        dependencies.start()
        self.addCleanup(dependencies.stop)
        self.commands = []

    def fake_tool(self, command, **kwargs):
        self.commands.append(command)
        self.assertGreater(kwargs['timeout'], 0)
        if command[0] == 'curl':
            coordinate = next(path for path in self.payloads if command[-3].endswith('/' + path))
            Path(command[-1]).write_bytes(self.payloads[coordinate])
        else:
            self.assertEqual(Path(command[0]).name, 'javac.exe' if prepare.os.name == 'nt' else 'javac')
            classes = Path(command[command.index('-d') + 1])
            if '-processor' in command:
                (classes / 'META-INF').mkdir(exist_ok=True)
                for name in ('BenchmarkList', 'CompilerHints'):
                    (classes / 'META-INF' / name).write_text('fixture metadata')
            for source in (Path(arg) for arg in command if arg.endswith('.java')):
                directory = classes / 'org/openjdk/bench/java/util/regex' if '/test/micro/' in str(source) else classes
                directory.mkdir(parents=True, exist_ok=True)
                (directory / (source.stem + '.class')).write_bytes(b'fixture class; never loaded')
        return subprocess.CompletedProcess(command, 0)

    def run_prepare(self, tool=None):
        with patch.object(prepare.subprocess, 'run', side_effect=tool or self.fake_tool):
            return prepare.prepare(self.java_home, self.output)

    def receipt(self):
        return json.loads((self.output / 'preparation.json').read_text())

    def test_primary_success_prepares_every_qualification_source(self):
        receipt = self.run_prepare()
        self.assertEqual(receipt['status'], 'prepared')
        self.assertEqual(len(receipt['dependencies']), 4)
        self.assertEqual(len(self.commands), 6)
        self.assertTrue(all(command[0] == 'curl' for command in self.commands[:4]))
        self.assertTrue(all(command[-3].startswith(prepare.REPOSITORIES[0]) for command in self.commands[:4]))
        self.assertEqual({Path(arg).stem for command in self.commands[4:] for arg in command if arg.endswith('.java')},
                         set(prepare.BENCHMARKS) | {Path(name).stem for name in prepare.HELPERS})
        self.assertTrue(receipt['source_sha256'])
        self.assertTrue(receipt['classpath_sha256'])
        self.assertFalse(list(self.output.rglob('*.part')))

    def test_http404_uses_reviewed_retry_and_fallback_before_compilation(self):
        def tool(command, **kwargs):
            if command[0] == 'curl' and command[-3].startswith(prepare.REPOSITORIES[0]):
                self.commands.append(command)
                Path(command[-1]).write_bytes(b'partial HTTP404 body')
                raise subprocess.CalledProcessError(22, command)
            return self.fake_tool(command, **kwargs)
        self.run_prepare(tool)
        downloads = [command for command in self.commands if command[0] == 'curl']
        self.assertEqual(len(downloads), 8)
        for command in downloads:
            for flag, value in [('--retry', '2'), ('--retry-delay', '1'), ('--retry-max-time', '30'),
                                ('--connect-timeout', '10'), ('--max-time', '20'),
                                ('--proto', '=https'), ('--proto-redir', '=https')]:
                self.assertEqual(command[command.index(flag) + 1], value)
            self.assertIn('--retry-all-errors', command)
        self.assertTrue(all(entry['repository'] == prepare.REPOSITORIES[1] for entry in self.receipt()['dependencies']))

    def test_both_hosts_fail_without_compilation_or_partial_jar(self):
        def tool(command, **kwargs):
            self.commands.append(command)
            Path(command[-1]).write_bytes(b'failed download')
            raise subprocess.CalledProcessError(22, command)
        with self.assertRaisesRegex(RuntimeError, 'unable to download'):
            self.run_prepare(tool)
        self.assertEqual(len(self.commands), 2)
        self.assertFalse(list((self.output / 'lib').iterdir()))
        self.assertEqual(self.receipt()['status'], 'failed')

    def test_checksum_mismatch_never_falls_back_or_compiles(self):
        def tool(command, **kwargs):
            result = self.fake_tool(command, **kwargs)
            Path(command[-1]).write_bytes(b'wrong payload')
            return result
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
            self.run_prepare(tool)
        self.assertEqual(len(self.commands), 1)
        self.assertFalse(list((self.output / 'lib').iterdir()))
        self.assertEqual(self.receipt()['status'], 'failed')

    def test_verified_existing_jars_need_no_download(self):
        lib = self.output / 'lib'
        lib.mkdir(parents=True)
        for path, payload in self.payloads.items():
            (lib / Path(path).name).write_bytes(payload)
        self.run_prepare()
        self.assertEqual(len(self.commands), 2)
        self.assertTrue(all(entry['reused'] for entry in self.receipt()['dependencies']))

    def test_corrupt_existing_jar_is_terminal(self):
        lib = self.output / 'lib'
        lib.mkdir(parents=True)
        (lib / Path(prepare.DEPENDENCIES[0][1]).name).write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
            self.run_prepare()
        self.assertEqual(self.commands, [])

    def test_extra_jar_cannot_enter_wildcard_classpath(self):
        lib = self.output / 'lib'
        lib.mkdir(parents=True)
        (lib / 'unverified.jar').write_bytes(b'unverified')
        with self.assertRaisesRegex(ValueError, 'unexpected dependency'):
            self.run_prepare()
        self.assertEqual(self.commands, [])

    def test_compiler_failure_stops_pipeline_and_preserves_receipt(self):
        def tool(command, **kwargs):
            if command[0] != 'curl':
                self.commands.append(command)
                raise subprocess.CalledProcessError(1, command)
            return self.fake_tool(command, **kwargs)
        with self.assertRaises(subprocess.CalledProcessError):
            self.run_prepare(tool)
        self.assertEqual(len(self.commands), 5)
        self.assertEqual(self.receipt()['status'], 'failed')

    def test_success_exit_without_generated_metadata_is_rejected(self):
        def tool(command, **kwargs):
            result = self.fake_tool(command, **kwargs)
            if '-processor' in command:
                (self.output / 'classes/META-INF/BenchmarkList').unlink()
            return result
        with self.assertRaisesRegex(ValueError, 'complete qualification inputs'):
            self.run_prepare(tool)

    def test_attempt_cannot_be_silently_replaced(self):
        self.run_prepare()
        before = (self.output / 'preparation.json').read_bytes()
        with self.assertRaisesRegex(ValueError, 'attempt already exists'):
            self.run_prepare()
        self.assertEqual(before, (self.output / 'preparation.json').read_bytes())

    def test_timeout_is_terminal_without_fallback_and_removes_partial(self):
        def tool(command, **kwargs):
            self.commands.append(command)
            Path(command[-1]).write_bytes(b'incomplete')
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            self.run_prepare(tool)
        self.assertEqual(len(self.commands), 1)
        self.assertFalse(list((self.output / 'lib').iterdir()))
        self.assertEqual(self.receipt()['status'], 'failed')

    def test_catalog_covers_repository_benchmarks_and_portable_helpers(self):
        directory = prepare.ROOT / 'test/micro/org/openjdk/bench/java/util/regex'
        sources = {path.stem for path in directory.glob('*.java')
                   if path.stem.startswith(('RustRegex', 'JavaFallback', 'JavaDigitFallback'))}
        self.assertEqual(sources, set(prepare.BENCHMARKS))
        self.assertIn('test/jdk/java/util/regex/RustRegexStateSequences.java', prepare.HELPERS)
        self.assertTrue(all((prepare.ROOT / name).is_file() for name in prepare.HELPERS))


if __name__ == '__main__':
    unittest.main()
