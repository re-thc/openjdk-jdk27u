# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Offline selection/identity checks. No Java, network or dependency build."""
import tempfile
import unittest
from pathlib import Path
from unittest.mock import Mock
from jtreg import inspect_home, select_installed, unchanged, version_tuple


class JtregTest(unittest.TestCase):
    def home(self, directory, name):
        home = Path(directory) / name
        (home / 'lib').mkdir(parents=True)
        (home / 'lib/jtreg.jar').write_bytes(name.encode())
        return home

    def test_compatible_versions(self):
        self.assertEqual((8, 2, 1, 1), version_tuple('jtreg 8.2.1+1\n'))
        self.assertEqual((8, 3, 0, 1), version_tuple('jtreg, version 8.3+1\n'))
        self.assertEqual((8, 3, 0, 0), version_tuple('jtreg 8.3-dev+0\n'))
        self.assertEqual((9, 0, 0, 0), version_tuple('jtreg 9.0\n'))

    def test_malformed_version(self):
        for text in ('openjdk version "26"', 'jtreg 8.3.0.1', 'jtreg unknown'):
            with self.subTest(text=text), self.assertRaises(ValueError):
                version_tuple(text)

    def test_path_83_precedes_cached_minimum(self):
        with tempfile.TemporaryDirectory() as directory:
            installed = self.home(directory, 'installed-8.3')
            cached = self.home(directory, 'cached-8.2.1')
            reader = Mock(return_value='jtreg 8.3+1')
            selected, notes = select_installed('java-not-executed', env={},
                launcher=str(installed / 'bin/jtreg'), cached=cached, extra_homes=[], reader=reader)
            self.assertEqual(str(installed), selected['home'])
            self.assertEqual('8.3.0+1', selected['version'])
            self.assertEqual([], notes)
            reader.assert_called_once()

    def test_environment_home_precedes_path(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'explicit')
            selected, _ = select_installed('unused', env={'JTREG_HOME': str(home)},
                launcher='/unused/bin/jtreg', extra_homes=[], reader=lambda *args: 'jtreg 8.3+1')
            self.assertEqual(str(home), selected['home'])

    def test_explicit_incompatible_home_is_error(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'old')
            with self.assertRaisesRegex(ValueError, '8.2.1\\+1 or newer'):
                select_installed('unused', explicit=home, env={}, extra_homes=[],
                                 reader=lambda *args: 'jtreg 8.2.1')

    def test_unsupported_discovery_requests_fallback(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'old')
            selected, notes = select_installed('unused', env={}, launcher=str(home / 'bin/jtreg'),
                extra_homes=[], reader=lambda *args: 'jtreg 8.2+1')
            self.assertIsNone(selected)
            self.assertEqual(1, len(notes))

    def test_denied_probe_stops_without_fallback(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'denied')
            with self.assertRaises(PermissionError):
                select_installed('unused', env={}, launcher=str(home / 'bin/jtreg'),
                    extra_homes=[], reader=Mock(side_effect=PermissionError('denied')))

    def test_homebrew_wrapper_and_symlink(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'Cellar/jtreg/8.3/libexec')
            wrapper = home.parent / 'bin/jtreg'
            wrapper.parent.mkdir()
            wrapper.touch()
            link = Path(directory) / 'bin/jtreg'
            link.parent.mkdir()
            link.symlink_to(wrapper)
            selected, _ = select_installed('unused', env={}, launcher=str(link), extra_homes=[],
                                         reader=lambda *args: 'jtreg 8.3+1')
            self.assertEqual(str(home), selected['home'])

    def test_changed_harness_stops_paired_run(self):
        with tempfile.TemporaryDirectory() as directory:
            home = self.home(directory, 'current')
            identity = inspect_home(home, 'unused', reader=lambda *args: 'jtreg 8.3+1')
            unchanged(identity)
            (home / 'lib/jtreg.jar').write_bytes(b'changed')
            with self.assertRaisesRegex(RuntimeError, 'changed during the paired run'):
                unchanged(identity)


if __name__ == '__main__':
    unittest.main()
