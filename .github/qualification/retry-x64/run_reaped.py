import ctypes
import json
import os
from pathlib import Path
import subprocess
import sys
import time

# Own and reap only this command's orphaned children. PID 1 is untouched.
if ctypes.CDLL(None, use_errno=True).prctl(36, 1, 0, 0, 0) != 0:
    raise OSError(ctypes.get_errno(), 'PR_SET_CHILD_SUBREAPER')
log_path = Path(sys.argv[1])
command = sys.argv[2:]
started = time.time()
with log_path.open('w') as log:
    log.write(json.dumps({'command': command, 'cwd': os.getcwd(), 'start': started}) + '\n')
    log.flush()
    process = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT)
    exit_code = None
    reaped = 0
    while True:
        has_children = True
        while True:
            try:
                pid, status = os.waitpid(-1, os.WNOHANG)
            except ChildProcessError:
                has_children = False
                break
            if pid == 0:
                break
            reaped += 1
            if pid == process.pid:
                exit_code = os.waitstatus_to_exitcode(status)
                process.returncode = exit_code
        if exit_code is not None and not has_children:
            break
        time.sleep(0.05)
record = {'command': command, 'exit_code': exit_code, 'seconds': time.time() - started, 'children_reaped': reaped}
log_path.with_suffix(log_path.suffix + '.result.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record), flush=True)
sys.exit(exit_code)
