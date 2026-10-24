#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Hold the process-group leader until the controller terminates the group."""
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time


def main():
    receipt = Path(sys.argv[1])
    # Caught handlers reset to default on exec in the child. Keeping this leader
    # alive through TERM prevents its PID/PGID from being reused before KILL.
    signal.signal(signal.SIGTERM, lambda *_: None)
    signal.signal(signal.SIGINT, lambda *_: None)
    start = time.monotonic_ns()
    try:
        child = subprocess.Popen(sys.argv[2:])
        rc = child.wait()
        result = {"returncode": rc, "child_pid": child.pid,
                  "child_start_ns": start, "child_end_ns": time.monotonic_ns()}
    except BaseException as exc:
        result = {"returncode": 127, "error": repr(exc),
                  "child_start_ns": start, "child_end_ns": time.monotonic_ns()}
    temporary = receipt.with_suffix(".tmp")
    temporary.write_text(json.dumps(result) + "\n")
    os.replace(temporary, receipt)
    while True:
        time.sleep(1)


if __name__ == "__main__":
    main()
