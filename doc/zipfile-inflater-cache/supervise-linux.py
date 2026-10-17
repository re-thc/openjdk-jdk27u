#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Four-hour Linux qualification supervisor. Prepared source; not yet executed."""
import argparse
import ctypes
import json
import os
from pathlib import Path
import resource
import signal
import subprocess
import sys
import time
sys.dont_write_bytecode = True
from campaign_deadline import original_deadline, remaining_seconds, require_remaining

parser = argparse.ArgumentParser()
parser.add_argument('--resume-from', type=Path, help='exact preserved terminal attempt; no rebuild')
parser.add_argument('root', type=Path, help='new absolute workspace, without whitespace')
parser.add_argument('candidate', help='full reviewed commit SHA')
parser.add_argument('configure_options', nargs=argparse.REMAINDER)
args = parser.parse_args()
root = args.root
if not root.is_absolute() or any(character.isspace() for character in str(root)):
    raise SystemExit('Use a new absolute workspace without whitespace')
disk_roots = [root]
if args.resume_from is not None:
    previous = args.resume_from
    if not previous.is_absolute() or any(character.isspace() for character in str(previous)):
        raise SystemExit('Use an absolute preserved attempt without whitespace')
    previous = previous.resolve(strict=True)
    if root.resolve() == previous or root.resolve() in previous.parents or previous in root.resolve().parents:
        raise SystemExit('Fresh output and preserved attempt must be disjoint')
    disk_roots.append(previous)
if len(args.candidate) != 40 or any(c not in '0123456789abcdef' for c in args.candidate):
    raise SystemExit('Use the full reviewed commit SHA')
source = Path(__file__).resolve().parent
repository = source.parent.parent
options = args.configure_options
if options[:1] == ['--']:
    options = options[1:]
prior_elapsed_seconds = 0
started = time.monotonic()
admission_utc = time.time()
absolute_deadline = admission_utc + 14400
if args.resume_from is not None:
    if options:
        raise SystemExit('No configure options are accepted for retained images')
    binding = json.loads((source / 'retained-builds.json').read_text())
    absolute_deadline = original_deadline(binding, previous)
    prior_elapsed_seconds = binding['prior_elapsed_seconds']
work_seconds = max(0, absolute_deadline - admission_utc)
deadline = started + work_seconds  # One anchor, before preflight; never reset.
require_remaining(absolute_deadline, deadline)
if not hasattr(os, 'pidfd_open') or not hasattr(signal, 'pidfd_send_signal'):
    raise SystemExit('Linux /proc and Python 3.9+ pidfd support are required')
allowed = sorted(os.sched_getaffinity(0))
if len(allowed) < 4:
    raise SystemExit('Four available CPUs are required for the declared comparison')
os.sched_setaffinity(0, allowed[:4])  # inherited by the owned process tree
resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
libc = ctypes.CDLL(None, use_errno=True)
if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER, including orphaned jobs
    raise OSError(ctypes.get_errno(), 'Cannot supervise orphaned descendants')
require_remaining(absolute_deadline, deadline)
root.mkdir(parents=True, exist_ok=False)
for name in ('tmp', 'cache'):
    (root / name).mkdir()
page_size = os.sysconf('SC_PAGE_SIZE')
memory_limit = 16 * 1024**3
disk_limit = 30 * 1024**3
stop_signal = None

def interrupted(signum, frame):
    global stop_signal
    stop_signal = signum

for signum in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
    signal.signal(signum, interrupted)

def process_info(pid):
    fields = Path(f'/proc/{pid}/stat').read_text().rsplit(')', 1)[1].split()
    rss = int(Path(f'/proc/{pid}/statm').read_text().split()[1]) * page_size
    return int(fields[1]), int(fields[19]), rss  # parent, birth ticks, resident bytes

def owned_processes():
    processes = {}
    for path in Path('/proc').glob('[0-9]*/stat'):
        pid = int(path.parent.name)
        try:
            processes[pid] = process_info(pid)
        except (FileNotFoundError, ProcessLookupError, PermissionError, ValueError, IndexError):
            continue
    # A /proc scan is not atomic. Reread each child before validating its
    # parent's owned identity: a stale child record must not acquire a new
    # owned parent just because its original parent's PID was reused.
    parents = {os.getpid(): process_info(os.getpid())[1]}
    owned = {}
    while True:
        new = {}
        for pid, info in processes.items():
            if pid in owned or info[0] not in parents:
                continue
            try:
                fresh = process_info(pid)
                if fresh[:2] != info[:2]:  # unchanged parent and birth
                    continue
                if process_info(fresh[0])[1] == parents[fresh[0]]:
                    new[pid] = fresh
            except (FileNotFoundError, ProcessLookupError, PermissionError,
                    ValueError, IndexError):
                continue
        if not new:
            return owned
        owned.update(new)
        parents.update({pid: info[1] for pid, info in new.items()})

def signal_owned(processes, signum):
    for pid, (_, birth, _) in processes.items():
        try:
            fd = os.pidfd_open(pid)
            try:
                if process_info(pid)[1] == birth:
                    signal.pidfd_send_signal(fd, signum)
            finally:
                os.close(fd)
        except (FileNotFoundError, ProcessLookupError, ValueError, IndexError):
            pass

def cleanup(child, deadline):
    # Signal individual owned descendants, even across nested timeout process
    # groups. Subreaping retains ownership when their original parent exits.
    began = time.monotonic()
    remaining = owned_processes()
    while remaining and time.monotonic() < deadline:
        signal_owned(remaining, signal.SIGTERM if time.monotonic() - began < 10 else signal.SIGKILL)
        if child is not None:
            child.poll()  # Popen reaps its direct child; reap adopted children below.
        for pid in remaining:
            if child is None or pid != child.pid:
                try:
                    os.waitpid(pid, os.WNOHANG)
                except ChildProcessError:
                    pass
        time.sleep(min(0.1, max(0, deadline - time.monotonic())))
        remaining = owned_processes()
    return {str(pid): {'birth_ticks': info[1]} for pid, info in remaining.items()}

def disk_usage(timeout):
    output = subprocess.check_output(['du', '-sb', '--', *map(str, disk_roots)],
                                     text=True, timeout=timeout)
    return sum(int(line.split()[0]) for line in output.splitlines())

env = os.environ.copy()
env.update(ZIP_QUAL_SUPERVISED='1', TMPDIR=str(root / 'tmp'),
           ZIP_QUAL_MONOTONIC_DEADLINE=repr(deadline),
           XDG_CACHE_HOME=str(root / 'cache'), CCACHE_DIR=str(root / 'cache' / 'ccache'))
reason = 'completed'
child = None
remaining = {}
error = None
postflight_disk_bytes = None
try:
    with (root / 'supervisor.log').open('w') as output:
        command = (['bash', str(source / 'continue-linux.sh'), str(root), args.candidate, str(previous)]
                   if args.resume_from is not None else
                   ['bash', str(source / 'run-linux.sh'), str(root), args.candidate, *options])
        # Keep read-only git preflight inside the same monitored process tree.
        # Arguments are passed as argv; the constant shell program never evals them.
        preflight = '''actual=$(git rev-parse HEAD)
test "$actual" = "$1" || { echo 'Run from the exact reviewed commit checkout' >&2; exit 1; }
git diff --quiet HEAD -- doc/zipfile-inflater-cache
shift
exec "$@"
'''
        command = ['bash', '-euc', preflight, 'zip-qualification-preflight', args.candidate, *command]
        require_remaining(absolute_deadline, deadline)
        child = subprocess.Popen(command, cwd=repository, env=env,
                                 stdout=output, stderr=subprocess.STDOUT, start_new_session=True)
        next_disk_check = started
        timing_armed = False
        while child.poll() is None:
            now = time.monotonic()
            if stop_signal is not None:
                reason = f'signal-{stop_signal}'; break
            available = remaining_seconds(absolute_deadline, deadline)
            if available <= 0:
                reason = 'original-campaign-deadline'; break
            rss = sum(info[2] for info in owned_processes().values()) + process_info(os.getpid())[2]
            if rss > memory_limit:
                reason = 'aggregate-rss-ceiling'; break
            phase_file = root / '.qualification-phase'
            phase = phase_file.read_text().strip() if phase_file.exists() else 'starting'
            # One acknowledgment, after any in-flight scan finishes. Once armed,
            # never start another disk scan until the timed sequence has exited.
            if phase == 'timing-wait' and not timing_armed:
                if disk_usage(min(10, available)) > disk_limit - 128 * 1024**2:
                    reason = 'timing-log-reserve-exhausted'; break
                timing_armed = True
                ready = root / '.timing-ready.next'
                ready.write_text('ready\n')
                ready.replace(root / '.timing-ready')
            elif not timing_armed and now >= next_disk_check:
                if disk_usage(min(10, available)) > disk_limit:
                    reason = 'scratch-ceiling'; break
                next_disk_check = time.monotonic() + 15
            time.sleep(min(1, remaining_seconds(absolute_deadline, deadline)))
        if reason == 'completed' and remaining_seconds(absolute_deadline, deadline) <= 0:
            reason = 'original-campaign-deadline'
        elif reason == 'completed' and child.returncode != 0:
            reason = 'stage-nonzero-exit'
except TimeoutError as failure:
    reason = 'original-campaign-deadline'
    error = str(failure)
except BaseException as failure:
    reason = 'supervisor-error'
    error = repr(failure)
finally:
    postflight_deadline = min(time.monotonic() + 30, deadline + 30)
    try:
        remaining = cleanup(child, postflight_deadline)
    except BaseException as failure:
        reason = 'cleanup-error'
        error = repr(failure)
        remaining = {'unknown': {'cleanup': 'not confirmed'}}
    try:
        available = postflight_deadline - time.monotonic()
        if available <= 0:
            raise TimeoutError('Shared cleanup/postflight deadline exhausted')
        postflight_disk_bytes = disk_usage(min(10, available))
        if postflight_disk_bytes > disk_limit:
            reason = 'scratch-ceiling'
    except BaseException as failure:
        reason = 'scratch-check-error'
        error = repr(failure)
    status = dict(reason=reason, child_exit=child.returncode if child is not None else None,
                  elapsed_seconds=time.monotonic() - started, error=error,
                  remaining_owned_processes=remaining,
                  postflight_disk_bytes=postflight_disk_bytes,
                  original_launch_utc=(binding['campaign']['launch_utc']
                                       if args.resume_from is not None else None),
                  original_deadline_utc=(binding['campaign']['deadline_utc']
                                         if args.resume_from is not None else None),
                  remaining_work_seconds=remaining_seconds(absolute_deadline, deadline),
                  limits=dict(work_seconds=work_seconds, original_work_seconds=14400,
                              prior_elapsed_seconds=prior_elapsed_seconds,
                              cleanup_postflight_grace_seconds=30,
                              cpus=4, aggregate_rss_stop_bytes=memory_limit,
                              sampled_scratch_apparent_stop_bytes=disk_limit))
    (root / 'supervisor-status.json').write_text(json.dumps(status, indent=2) + '\n')
if remaining:
    raise SystemExit('Owned-process cleanup incomplete; inspect supervisor-status.json')
if reason != 'completed':
    print('Qualification stopped: ' + reason, file=sys.stderr)
    raise SystemExit(child.returncode if reason == 'stage-nonzero-exit'
                     and child.returncode > 0 else 1)
print('Sequence completed; inspect evidence and trade-off flags before any recommendation.')
