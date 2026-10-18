#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Portable launch of the frozen Hex grid. No process discovery or reaper.

Run only after complete-batch authority. Native launchd or a container's normal
--init owns orphan reaping. This runner launches only the supplied Java mains.
"""
import argparse
import json
import os
from pathlib import Path
import platform
import signal
import subprocess
import sys
import threading
import time
sys.dont_write_bytecode = True
import matrix as m
from identity import FrozenInputs, PRODUCT


class JavaRuns:
    def __init__(self, root):
        self.logs = root / 'logs'
        self.logs.mkdir()
        self.root, self.commands = root, []
        self.work_end = time.monotonic() + 7200 - 10

    def check(self):
        if time.monotonic() >= self.work_end:
            raise m.Stop('DEADLINE', 'two-hour batch expired; no retry')

    def run(self, label, argv, cwd, env, deadline=None, timeout=None, measurement=False):
        self.check()
        out, err = self.logs / (label + '.stdout'), self.logs / (label + '.stderr')
        entry = dict(label=label, argv=list(map(str, argv)), measurement=measurement,
                     stdout=str(out), stderr=str(err), cwd=str(cwd))
        self.commands.append(entry)
        m.write_json(self.root / 'commands.json', self.commands)
        p = None
        timer = None
        expired = threading.Event()
        try:
            with out.open('w') as stdout, err.open('w') as stderr:
                # File setup stays outside the cold process-wall observation.
                start = time.perf_counter_ns()
                p = subprocess.Popen(entry['argv'], cwd=cwd, env=env, stdin=subprocess.DEVNULL,
                                     stdout=stdout, stderr=stderr)
                seconds = min(self.work_end, deadline or self.work_end) - time.monotonic()
                if timeout is not None:
                    seconds = min(seconds, timeout)
                def expire():
                    expired.set()
                    p.kill()
                timer = threading.Timer(max(.001, seconds), expire)
                timer.daemon = True
                timer.start()
                # Blocking wait preserves cold process-wall precision; Python's
                # wait(timeout=...) polling can add tens of milliseconds.
                code = p.wait()
                wall = time.perf_counter_ns() - start
            entry.update(returncode=code, process_wall_ns=wall)
            if expired.is_set():
                raise m.Stop('DEADLINE', label + ': timeout; no retry')
            if code:
                raise m.Stop('COMMAND_FAILED', label + ': exit ' + str(code))
            self.check()
            return out, err, wall
        finally:
            if timer is not None:
                timer.cancel()
                timer.join()
            # p is the direct child returned by this Popen, never a discovered
            # PID. Benchmark sources create threads and do not launch processes.
            if p is not None and p.poll() is None:
                p.kill()
                p.wait(timeout=5)
            m.write_json(self.root / 'commands.json', self.commands)


def interrupted(*_):
    raise KeyboardInterrupt()


def execute(c, frozen):
    frozen.verify('before')
    try:
        c.library_preflight()
        cold = c.cold()
        index = c.measurements()
        return m.adjudicate(index, cold, c.root, c.s)
    finally:
        # An identity failure overrides a provisional performance result,
        # including after a library/measurement failure. Keep both logs.
        frozen.verify('after')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--execute', action='store_true')
    for option in ['baseline', 'candidate', 'harness', 'output']:
        p.add_argument('--' + option, type=Path, required=True)
    p.add_argument('--receipt', type=Path, required=True)
    p.add_argument('--receipt-sha256', required=True)
    p.add_argument('--package-revision', required=True)
    a = p.parse_args()
    if not a.execute:
        p.error('measurement requires --execute and complete-batch authority')
    if platform.system() not in ['Darwin', 'Linux']:
        p.error('use a supported native Unix host')
    for key in ['baseline', 'candidate', 'harness', 'output']:
        setattr(a, key, getattr(a, key).resolve())
    if a.output.exists():
        p.error('fresh output required; results are never overwritten')
    suffix = '.dylib' if platform.system() == 'Darwin' else '.so'
    for image in [a.baseline, a.candidate]:
        if not (image / 'bin/java').is_file():
            p.error('missing normally built native JDK: ' + str(image))
    if not (a.candidate / ('lib/libhexsimd' + suffix)).is_file():
        p.error('enabled candidate library missing')
    a.output.mkdir(parents=True)
    (a.output / 'tmp').mkdir()
    s = JavaRuns(a.output)
    c = m.Campaign()
    c.s, c.root, c.repo, c.harness = s, a.output, a.output, a.harness
    c.jdks = dict(baseline=a.baseline, candidate=a.candidate)
    c.library = a.candidate / ('lib/libhexsimd' + suffix)
    c.env = os.environ.copy()
    for key in ['JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'JAVA_OPTS',
                'LD_PRELOAD', 'DYLD_INSERT_LIBRARIES']:
        c.env.pop(key, None)
    manifest = dict(platform=platform.platform(), machine=platform.machine(),
                    java_heap_MiB=512, active_processors=2, deadline_seconds=7200,
                    resource_limits='external OS/container; no aggregate RSS or affinity claim',
                    source_pins={'baseline': m.BASE, 'candidate': PRODUCT})
    manifest.update(receipt=str(a.receipt.resolve()), receipt_sha256=a.receipt_sha256,
                    package_revision=a.package_revision)
    m.write_json(a.output / 'manifest.json', manifest)
    signal.signal(signal.SIGTERM, interrupted)
    result = dict(status='INCOMPLETE', extra_platform_claims=False)
    code = 4
    try:
        frozen = FrozenInputs(a.receipt, a.receipt_sha256, Path(__file__).resolve().parent,
                a.package_revision, a.baseline, a.candidate, a.harness, a.output,
                platform.system(), platform.machine())
        report = execute(c, frozen)
        result.update(status=report['status'], acceptance='acceptance.json')
        code = 0 if report['status']=='LOCAL_GO' else 3 if report['status']=='INCONCLUSIVE_NOISE' else 2
    except (Exception, KeyboardInterrupt) as error:
        result['detail'] = repr(error)
        if isinstance(error, m.Stop):
            result['category'] = error.category
    m.write_json(a.output / 'result.json', result)
    print(json.dumps(result, indent=2))
    return code


if __name__ == '__main__':
    raise SystemExit(main())
