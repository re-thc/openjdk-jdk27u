#
# Copyright (c) 2026, Harry Chan. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#/

"""Deadline-aware artifact helpers for a separately authorized local driver.

There is no command-line launcher and no workload or machine configuration.
The caller supplies one HardDeadline shared by every phase and finalization.
"""
import hashlib
import json
from pathlib import Path
import subprocess

from deadline import DeadlineExpired


class DeadlineIO:
    def __init__(self, budget):
        self.budget = budget

    def read_text(self, path):
        self.budget.check()
        value = Path(path).read_text()
        self.budget.check()
        return value

    def write_text(self, path, value):
        self.budget.check()
        Path(path).write_text(value)
        self.budget.check()

    def sha256(self, path):
        self.budget.check()
        digest = hashlib.sha256()
        with Path(path).open('rb') as stream:
            while True:
                self.budget.check()
                block = stream.read(1048576)
                self.budget.check()
                if not block:
                    break
                digest.update(block)
        self.budget.check()
        return digest.hexdigest()

    def metadata(self, argv):
        """Use only the remaining absolute budget, including a late exit zero."""
        self.budget.check()
        process = subprocess.Popen(argv, text=True, stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE, start_new_session=True)
        try:
            self.budget.track(process)
            stdout, stderr = process.communicate(timeout=self.budget.remaining())
            self.budget.check()
            if process.returncode:
                raise subprocess.CalledProcessError(process.returncode, argv,
                                                    stdout, stderr)
            return stdout.strip()
        except (subprocess.TimeoutExpired, DeadlineExpired) as error:
            self.budget.kill_owned()
            self.budget.expired = True
            raise DeadlineExpired('Metadata exceeded absolute deadline') from error
        finally:
            self.budget.untrack(process)

    def finalize(self, artifacts, state_path, manifest_path, *, preserved):
        """Return a terminal receipt only after all writes complete on time.

        Disk records intentionally remain provisional. The driver must emit the
        returned receipt with flushed output, check the same budget once more,
        and exit zero immediately. No receipt or a nonzero exit is incomplete.
        The watchdog must cover output and exit as well as this function.
        """
        state_path, manifest_path = Path(state_path), Path(manifest_path)
        if state_path == manifest_path:
            raise ValueError('State and manifest paths must differ')
        paths = [Path(path) for path in artifacts]
        if any(path in (state_path, manifest_path) for path in paths):
            raise ValueError('Artifacts must exclude finalization records')
        provisional = dict(finalization_complete=False,
                           within_total_deadline=None, all_preserved=preserved)
        self.write_text(state_path, json.dumps(provisional) + '\n')
        manifest = {}
        for path in paths:
            self.budget.check()
            manifest[str(path)] = self.sha256(path)
        self.write_text(manifest_path, json.dumps(dict(files=manifest,
                            finalization_complete=False), indent=2) + '\n')
        self.write_text(state_path, json.dumps(provisional) + '\n')
        self.budget.check()
        elapsed = self.budget.clock() - self.budget.start
        self.budget.check()
        return dict(finalization_complete=True, within_total_deadline=True,
                    all_preserved=preserved, elapsed=elapsed,
                    elapsed_sampled_after_all_artifact_writes=True)
