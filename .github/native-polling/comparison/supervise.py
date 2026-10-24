#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Keep the process-group leader alive and record the direct child's resources."""
import json
import os
from pathlib import Path
import resource
import signal
import subprocess
import sys
import time


def main():
    receipt = Path(sys.argv[1])
    signal.signal(signal.SIGTERM, lambda *_: None)
    signal.signal(signal.SIGINT, lambda *_: None)
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    start = time.monotonic_ns()
    try:
        env = os.environ.copy()
        library = env.pop('NATIVE_KQUEUE_TRACE_DYLIB', None)
        for key in list(env):
            if key.startswith('DYLD_'):
                env.pop(key)
        if library:
            # Set at the final Java exec; intervening protected launchers may strip DYLD variables.
            if Path(sys.argv[2]).name != 'java' or not Path(library).is_absolute():
                raise ValueError('Trace injection requires direct Java and an absolute helper path')
            env['DYLD_INSERT_LIBRARIES'] = library
        child = subprocess.Popen(sys.argv[2:], env=env)
        _, status, usage = os.wait4(child.pid, 0)
        child.returncode = os.waitstatus_to_exitcode(status)
        result = {'returncode': child.returncode, 'child_pid': child.pid,
                  'child_start_ns': start, 'child_end_ns': time.monotonic_ns(),
                  'child_user_cpu_seconds': usage.ru_utime, 'child_system_cpu_seconds': usage.ru_stime,
                  'peak_rss_native_units': usage.ru_maxrss,
                  'peak_rss_unit': 'bytes' if sys.platform == 'darwin' else 'KiB'}
    except BaseException as exc:
        result = {'returncode': 127, 'error': repr(exc), 'child_start_ns': start,
                  'child_end_ns': time.monotonic_ns()}
    temporary = receipt.with_suffix('.tmp')
    temporary.write_text(json.dumps(result) + '\n')
    os.replace(temporary, receipt)
    while True:
        time.sleep(1)


if __name__ == '__main__':
    main()
