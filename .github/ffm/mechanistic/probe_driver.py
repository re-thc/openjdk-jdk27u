"""Record current-executor capabilities; no Java or FFM invocation."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess

p = argparse.ArgumentParser()
p.add_argument('probe')
p.add_argument('output')
a = p.parse_args()

def optional(path):
    try:
        return Path(path).read_text().strip()
    except (FileNotFoundError, PermissionError, OSError):
        return None

def names(path):
    try:
        return sorted(item.name for item in Path(path).iterdir())
    except (FileNotFoundError, PermissionError, OSError):
        return None

cpu = optional('/proc/cpuinfo')
first_cpu = dict(line.split(':', 1) for line in cpu.split('\n\n', 1)[0].splitlines() if ':' in line) if cpu else {}
metadata = {'scope': 'This executor only; capability probe, not an FFM benchmark',
    'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'uname': platform.uname()._asdict(), 'uid': os.getuid(), 'affinity': sorted(os.sched_getaffinity(0)),
    'cpu': {key.strip(): value.strip() for key, value in first_cpu.items()},
    'perf_event_paranoid': optional('/proc/sys/kernel/perf_event_paranoid'),
    'event_sources': names('/sys/bus/event_source/devices'),
    'cpu_pmu_type': optional('/sys/bus/event_source/devices/cpu/type'),
    'rdpmc': optional('/sys/bus/event_source/devices/cpu/rdpmc'),
    'status': optional('/proc/self/status'),
    'schedstat': optional('/proc/thread-self/schedstat'),
    'scaling_cur_freq': optional('/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq'),
    'cpu_max': optional('/sys/fs/cgroup/cpu.max'),
    'probe_sha256': hashlib.sha256(Path(a.probe).read_bytes()).hexdigest(),
    'privilege_or_system_configuration_changes': False}
run = subprocess.run([str(Path(a.probe).resolve())], capture_output=True, text=True, timeout=10)
metadata.update(returncode=run.returncode, stderr=run.stderr)
if run.returncode == 0:
    metadata['probe'] = json.loads(run.stdout)
else:
    metadata['stdout'] = run.stdout
with Path(a.output).open('x') as output:
    output.write(json.dumps(metadata, indent=2) + '\n')
print(json.dumps(metadata))
raise SystemExit(run.returncode)
