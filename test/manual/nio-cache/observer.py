# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Bounded procfs admission and fixed-file sampling; no child creation."""
from contextlib import ExitStack
from pathlib import Path
import re
import time

COUNTERS = ('se.nr_migrations', 'nr_switches', 'nr_voluntary_switches', 'nr_involuntary_switches')
PATTERNS = {key: re.compile(r'^' + re.escape(key) + r'\s*:\s*(\d+)\s*$', re.M) for key in COUNTERS}


def identity(raw):
    fields = raw[raw.rfind(')') + 2:].split()
    return {'id': int(raw.split(' ', 1)[0]), 'start': int(fields[19]), 'cpu': int(fields[36]), 'state': fields[0],
            'ppid': int(fields[1]), 'pgrp': int(fields[2]), 'session': int(fields[3])}


def read_identity(pid, proc_root=Path('/proc')):
    row = identity((proc_root / str(pid) / 'stat').read_text())
    if row['id'] != pid:
        raise ValueError('procfs path/PID mismatch')
    return row


def same_identity(actual, expected):
    if actual['start'] != expected['start']:
        raise ValueError('PID/TID identity reused')


class Costs:
    def __init__(self):
        self.stages = {}

    def measure(self, name, action, *args):
        wall, cpu = time.monotonic_ns(), time.process_time_ns()
        try:
            return action(*args)
        finally:
            cpu, wall = time.process_time_ns() - cpu, time.monotonic_ns() - wall
            stage = self.stages.setdefault(name, {'calls': 0, 'cpu_ns': 0, 'wall_ns': 0, 'max_wall_ns': 0})
            stage['calls'] += 1
            stage['cpu_ns'] += cpu
            stage['wall_ns'] += wall
            stage['max_wall_ns'] = max(stage['max_wall_ns'], wall)


class BoundSampler:
    """Seven open files, eight bounded reads/tick; no process/task enumeration.

    Open descriptors bind procfs objects. Starttime checks additionally reject
    PID/TID reuse. A vanished object ends collection without any rebinding.
    """
    def __init__(self, coordinator, fork, thread, proc_root=Path('/proc'),
                 cgroup=Path('/sys/fs/cgroup/cpu.stat')):
        self.coordinator, self.fork, self.thread = coordinator, fork, thread
        self.stack = ExitStack()
        cp, fp, tp = coordinator['pid'], fork['pid'], thread['tid']
        paths = {'coordinator': proc_root / str(cp) / 'stat',
                 'fork': proc_root / str(fp) / 'stat',
                 'worker': proc_root / str(fp) / 'task' / str(tp) / 'stat',
                 'schedstat': proc_root / str(fp) / 'task' / str(tp) / 'schedstat',
                 'sched': proc_root / str(fp) / 'task' / str(tp) / 'sched',
                 'cgroup': cgroup, 'cpus': proc_root / 'stat'}
        try:
            self.files = {key: self.stack.enter_context(path.open('rb', buffering=0)) for key, path in paths.items()}
        except BaseException:
            self.close()
            raise

    def close(self):
        self.stack.close()

    def read(self, key):
        stream = self.files[key]
        stream.seek(0)
        data = stream.read(16385)
        if not data or len(data) > 16384:
            raise ValueError('empty/oversized bound procfs file: ' + key)
        return data.decode('ascii')

    def sample(self):
        before = time.monotonic_ns()
        same_identity(identity(self.read('coordinator')), self.coordinator)
        same_identity(identity(self.read('fork')), self.fork)
        first = identity(self.read('worker'))
        same_identity(first, self.thread)
        counts = list(map(int, self.read('schedstat').split()))
        if len(counts) != 3 or any(n < 0 for n in counts):
            raise ValueError('schedstat format')
        sched = self.read('sched')
        fields = {}
        for key, pattern in PATTERNS.items():
            match = pattern.search(sched)
            if not match:
                raise ValueError('missing sched counter ' + key)
            fields[key] = int(match[1])
        final = identity(self.read('worker'))
        same_identity(final, self.thread)
        cgroup, cpus = self.read('cgroup'), self.read('cpus')
        return {'before_ns': before, 'after_ns': time.monotonic_ns(), 'tid': self.thread['tid'],
                **final, 'runtime_ns': counts[0], 'wait_ns': counts[1], 'timeslices': counts[2],
                **fields, 'cgroup_cpu_stat': cgroup, 'proc_stat': cpus}
