#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""UNEXECUTED Linux PID1 job entry; verify containment before any campaign child."""
import argparse,json,os,shutil,subprocess,sys,time
from pathlib import Path
sys.dont_write_bytecode=True
from deadline import TOTAL_SECONDS,fingerprint,validate_causal_report

p=argparse.ArgumentParser()
p.add_argument('--stage',choices=['causal','full'],required=True)
p.add_argument('--root',type=Path,required=True);p.add_argument('--repo',type=Path,required=True)
p.add_argument('--started',type=float,required=True);p.add_argument('--parent-pidns',required=True)
p.add_argument('--causal-report',type=Path)
a=p.parse_args();root=a.root.resolve();repo=a.repo.resolve()
try:
    if os.getpid()!=1:raise RuntimeError('command is not the PID namespace init process')
    namespace=os.readlink('/proc/self/ns/pid')
    if namespace==a.parent_pidns:raise RuntimeError('PID namespace isolation missing')
    if not 0<=time.monotonic()-a.started<TOTAL_SECONDS-10:raise RuntimeError('invalid or exhausted job clock')
    cpu=Path('/sys/fs/cgroup/cpu.max').read_text().strip()
    memory=Path('/sys/fs/cgroup/memory.max').read_text().strip()
    if cpu!='400000 100000' or memory!='17179869184':
        raise RuntimeError('inherited cgroup does not enforce the frozen four-CPU/16GiB ceiling')
    capacity=os.statvfs(root).f_blocks*os.statvfs(root).f_frsize
    if not 0<capacity<=80*1024**3:raise RuntimeError('scratch filesystem capacity exceeds80GiB')
    if os.stat(root).st_dev!=os.stat('/tmp').st_dev:raise RuntimeError('/tmp is not on bounded scratch storage')
    for name in ['JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS','CLASSPATH','LD_PRELOAD','DYLD_INSERT_LIBRARIES']:
        if os.environ.get(name):raise RuntimeError('uncontrolled environment: '+name)
    if 'CARGO_ENCODED_RUSTFLAGS' in os.environ:raise RuntimeError('encoded Cargo flags must be unset')
    entry_commands=[]
    def git_read(*arguments):
        command=['git','-C',str(repo),*arguments]
        output=subprocess.check_output(command,text=True,timeout=120)
        entry_commands.append(dict(command=command,stdout=output,exit_status=0))
        return output
    sha=git_read('rev-parse','HEAD').strip()
    if git_read('status','--porcelain','--untracked-files=all').strip():
        raise RuntimeError('candidate checkout is dirty')
    (root/'entry-source.json').write_text(json.dumps(dict(commands=entry_commands,
        git=fingerprint(shutil.which('git')),python=fingerprint(sys.executable)),indent=2)+'\n')
    causal=None
    if a.stage=='full':
        if a.causal_report is None:raise RuntimeError('candidate-bound causal report is missing')
        validate_causal_report(a.causal_report,sha)
        causal=fingerprint(a.causal_report)
    audit=dict(schema=1,status='APPROVED',candidate_sha=sha,root=str(root),
        started_monotonic=a.started,total_seconds=TOTAL_SECONDS,audited_by='job_entry.py actual in-namespace checks',
        manager=dict(kind='bubblewrap-pid1',verified=True,pid1=True,pid_namespace=namespace,
            parent_pid_namespace=a.parent_pidns,cpu_max_path='/sys/fs/cgroup/cpu.max',cpu_max=cpu,
            memory_max_path='/sys/fs/cgroup/memory.max',memory_max=memory,
            timeout_total_seconds=TOTAL_SECONDS,kill_after_seconds=10),
        scratch=dict(verified=True,capacity_bytes=capacity),causal_report=causal)
    path=root/'launch-audit.json'
    if path.exists():raise RuntimeError('refusing to replace launch audit')
    path.write_text(json.dumps(audit,indent=2)+'\n')
    environment=dict(os.environ,QUAL_REVIEW=str(repo),QUAL_ROOT=str(root),QUAL_SHA=sha,
        QUAL_STARTED=str(a.started),QUAL_STAGE=a.stage,QUAL_LAUNCH_AUDIT=str(path))
    # Bash replaces PID1. PID1 death (normal or abnormal) tears down every
    # descendant in this namespace, including setsid/double-fork descendants.
    os.execve('/usr/bin/bash',['bash',str(repo/'test/experiments/instant-speedate-production/build_and_qualify.sh')],environment)
except BaseException as error:
    (root/'launch-hold.txt').write_text('HOLD: '+repr(error)+'\n')
    raise
