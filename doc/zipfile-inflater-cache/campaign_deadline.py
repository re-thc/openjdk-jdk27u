#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Original ZIP campaign deadline, derived from pinned terminal evidence."""
import argparse
from datetime import datetime, timedelta, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import time


def original_deadline(binding, previous):
    evidence = {}
    for name in ('analysis.json', 'supervisor-status.json'):
        data = (previous / name).read_bytes()
        if hashlib.sha256(data).hexdigest() != binding['provenance_sha256'][name]:
            raise ValueError('Deadline evidence changed: ' + name)
        evidence[name] = json.loads(data)
    campaign = binding['campaign']
    launch = datetime.strptime(campaign['launch_utc'], '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=timezone.utc)
    deadline = launch + timedelta(seconds=14400)
    if (evidence['analysis.json']['launch_utc'] != campaign['launch_utc']
            or evidence['analysis.json']['supervisor_limits']['work_seconds'] != 14400
            or evidence['supervisor-status.json']['limits']['work_seconds'] != 14400
            or deadline.strftime('%Y-%m-%dT%H:%M:%SZ') != campaign['deadline_utc']):
        raise ValueError('Original four-hour deadline disagrees with campaign evidence')
    return deadline.timestamp()


def remaining_seconds(deadline, monotonic_deadline=None):
    remaining = deadline - time.time()
    if monotonic_deadline is not None:
        remaining = min(remaining, monotonic_deadline - time.monotonic())
    return max(0, remaining)


def require_remaining(deadline, monotonic_deadline=None):
    remaining = remaining_seconds(deadline, monotonic_deadline)
    if remaining <= 0:
        stamp = datetime.fromtimestamp(deadline, timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')
        raise TimeoutError('Original campaign deadline expired: ' + stamp)
    return remaining


def supervised_deadline():
    value = os.environ.get('ZIP_QUAL_MONOTONIC_DEADLINE')
    if value is None:
        if os.environ.get('ZIP_QUAL_SUPERVISED') == '1':
            raise ValueError('Missing supervisor monotonic deadline')
        return None
    value = float(value)
    if not math.isfinite(value) or value <= 0:
        raise ValueError('Invalid supervisor monotonic deadline')
    return value


def report(binding, deadline, monotonic_deadline=None):
    return dict(original_launch_utc=binding['campaign']['launch_utc'],
                original_deadline_utc=binding['campaign']['deadline_utc'],
                checked_utc=datetime.now(timezone.utc).isoformat(),
                remaining_work_seconds=require_remaining(deadline, monotonic_deadline))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('previous', type=Path)
    args = parser.parse_args()
    binding = json.loads(Path(__file__).with_name('retained-builds.json').read_text())
    print(json.dumps(report(binding, original_deadline(binding, args.previous),
                            supervised_deadline()), indent=2))
