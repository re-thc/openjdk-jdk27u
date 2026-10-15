import ctypes
import os
import subprocess
import sys

# Reap this build's orphaned logger/linker children without touching PID 1.
if ctypes.CDLL(None, use_errno=True).prctl(36, 1, 0, 0, 0) != 0:
    raise OSError(ctypes.get_errno(), 'PR_SET_CHILD_SUBREAPER')
command = ['bash', '-c', 'source /workspace/toolchains/activate.sh; make CONF=cloud-gcc16 JOBS=1 images']
print(command, flush=True)
with open('/workspace/common-intrinsics-evidence/fresh/release-final-build.log', 'w') as log:
    result = subprocess.run(command, cwd='/workspace/openjdk-jdk27u', stdout=log, stderr=subprocess.STDOUT)
while True:
    try:
        os.waitpid(-1, 0)
    except ChildProcessError:
        break
print('exit_code', result.returncode, flush=True)
sys.exit(result.returncode)
