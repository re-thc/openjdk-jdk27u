#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Owned exact old-B object cleanup, requiring separate explicit release.

Use supervise.py --execute --cleanup-only. This is never a qualification pass,
continuation, new build, broad cleanup, or permission to reuse the old image.
"""
import argparse
import json
from pathlib import Path
import sys
import tempfile
import time

sys.dont_write_bytecode = True

from cancellation import Cancellation
from continuation import git, verification
from process_cleanup import LinuxProcesses, enable_subreaper, require_no_children
from storage_guard import StorageGuard
import staging


def main():
    p = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    p.add_argument('--execute', action='store_true')
    p.add_argument('--outer-owner-reference', type=Path, required=True)
    p.add_argument('--campaign-root', type=Path, required=True)
    p.add_argument('--configuration', choices=['B-release'], required=True)
    p.add_argument('--seal', type=Path, required=True)
    p.add_argument('--seal-sha256', required=True)
    p.add_argument('--manifest', type=Path, required=True)
    p.add_argument('--manifest-sha256', required=True)
    p.add_argument('--receipt', type=Path, required=True)
    p.add_argument('--harness-commit', required=True)
    p.add_argument('--storage-cleanup', choices=[staging.POLICY], required=True)
    a = p.parse_args()
    if not a.execute:
        p.error('Exact cleanup requires separate explicit execution/manifest approval')
    root = staging.root_path(a.campaign_root, a.configuration)
    journal_path = a.receipt.with_suffix('.journal.jsonl')
    for output in [a.receipt, journal_path]:
        staging.need(output.is_absolute() and not output.resolve().is_relative_to(root.resolve()),
                     'Cleanup receipts must be outside the retained configuration')
        staging.need(not output.exists(), 'Refuse existing cleanup output')
    cancellation = Cancellation(); cancellation.install()
    deadline = time.monotonic() + staging.MAX_SECONDS
    backend = LinuxProcesses()
    guard = StorageGuard([a.campaign_root, a.receipt.parent, Path(tempfile.gettempdir())])
    row = {'status': 'STARTING', 'scope': 'exact-old-B-cleanup-only', 'qualification_pass': False,
           'manifest_sha256': a.manifest_sha256, 'seal_sha256': a.seal_sha256,
           'harness_commit': a.harness_commit, 'outer_owner_reference': str(a.outer_owner_reference),
           'deadline_monotonic': deadline, 'git': []}
    failure = None
    def check():
        cancellation.check()
        staging.need(time.monotonic() < deadline, 'Exact cleanup deadline exhausted')
        guard.poll()
    def audit():
        require_no_children(backend)
    try:
        guard.admit()
        backend.verify_support(); enable_subreaper(); audit(); check()
        with verification(check, row['git'], deadline):
            staging.need(git(Path(__file__).resolve().parents[4], 'rev-parse', 'HEAD') == a.harness_commit,
                         'Reviewed cleanup harness HEAD differs')
            staging.need(not git(Path(__file__).resolve().parents[4], 'status', '--porcelain', '--untracked-files=all'),
                         'Reviewed cleanup harness checkout is dirty')
        sealed = staging.read_pinned(a.seal, a.seal_sha256, check)
        plan = staging.read_pinned(a.manifest, a.manifest_sha256, check)
        # The manifests, hashes and progress remain outside the old config.
        with journal_path.open('x') as stream:
            def journal(event):
                stream.write(json.dumps(event, allow_nan=False) + '\n'); stream.flush()
            row['result'] = staging.operate(a.campaign_root, a.configuration, sealed, plan,
                check=check, audit=audit, apply=True, approved_policy=a.storage_cleanup, journal=journal)
        audit(); check()
        row['status'] = 'APPLIED_AND_VERIFIED'
    except BaseException as exc:
        failure = exc
        row.update(status='HOLD', error=repr(exc))
    finally:
        try:
            row['storage'] = guard.finish()
            row['observed_net_free_change_bytes'] = {
                path: free - row['storage']['before_free_bytes'][path]
                for path, free in row['storage']['after_free_bytes'].items()}
            audit()
        except BaseException as exc:
            row.update(status='HOLD', closure_error=repr(exc))
            failure = failure or exc
        if cancellation.signum is not None or time.monotonic() >= deadline:
            row.update(status='HOLD', cancellation_signal=cancellation.signum,
                       deadline_exhausted=time.monotonic() >= deadline)
            failure = failure or RuntimeError('Exact cleanup cancelled/deadline exhausted')
        try:
            staging.write_new(a.receipt, row)
        finally:
            cancellation.restore()
    return 0 if failure is None and row['status'] == 'APPLIED_AND_VERIFIED' else 2


if __name__ == '__main__':
    sys.exit(main())
