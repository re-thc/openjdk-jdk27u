# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Explicit trial-setup identity protocol, class readiness and read-only checks."""
import os
from pathlib import Path
import re
import struct
import threading
from observer import BoundSampler, identity, read_identity, same_identity

BENCHMARK = 'org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit'
PROTOCOL = 'nio-bind-v1'
BIND = re.compile(r'NIO_BIND protocol=nio-bind-v1 nonce=([0-9a-f]{32}) pid=([1-9][0-9]*) tid=([1-9][0-9]*) start=([1-9][0-9]*) benchmark=' + re.escape(BENCHMARK) + r'\n')


def read_binding(path, nonce, details):
    details['polls'] = details.get('polls', 0) + 1
    try:
        with path.open('rb') as stream:
            data = stream.read(1025)
    except FileNotFoundError:
        details['last_state'] = 'awaiting trial-setup binding file'
        return None
    details['binding_bytes'] = len(data)
    if len(data) > 1024:
        raise ValueError('binding exceeds 1KiB')
    if b'\n' not in data:
        details['last_state'] = 'awaiting complete binding record'
        return None
    match = BIND.fullmatch(data.decode('ascii'))
    if not match or match[1] != nonce:
        raise ValueError('malformed, duplicate or wrong-nonce binding record')
    pid, tid, start = map(int, match.groups()[1:])
    if pid >= 2**31 or tid >= 2**31 or start >= 2**63:
        raise ValueError('binding identity outside supported range')
    details['last_state'] = 'binding record received; checking procfs identities'
    return {'pid': pid, 'tid': tid, 'start': start}


def verify_binding(record, coordinator, java, binding_path, nonce, proc_root=Path('/proc')):
    pid, tid = record['pid'], record['tid']
    if pid == coordinator['pid']:
        raise ValueError('binding identifies coordinator instead of fork')
    row = read_identity(pid, proc_root)
    if (row['ppid'] != coordinator['pid'] or row['pgrp'] != coordinator['pid']
            or row['session'] != coordinator['pid']):
        raise ValueError('fork outside owned coordinator ancestry/group/session')
    root = proc_root / str(pid)
    if (root / 'exe').resolve() != Path(java).resolve():
        raise ValueError('unexpected fork executable')
    with (root / 'cmdline').open('rb') as stream:
        raw = stream.read(32769)
    if len(raw) > 32768:
        raise ValueError('fork cmdline cap')
    args = raw.rstrip(b'\0').decode().split('\0')
    for required in ('org.openjdk.jmh.runner.ForkedMain', '-Dnio.observer.nonce=' + nonce,
                     '-Dnio.observer.binding=' + str(binding_path)):
        if args.count(required) != 1:
            raise ValueError('fork cmdline identity mismatch: ' + required.split('=')[0])
    thread = identity((root / 'task' / str(tid) / 'stat').read_text())
    if thread['id'] != tid or thread['start'] != record['start']:
        raise ValueError('handshake worker TID/starttime mismatch')
    same_identity(read_identity(pid, proc_root), row)
    same_identity(read_identity(coordinator['pid'], proc_root), coordinator)
    return {'pid': pid, **row}, {'tid': tid, **thread}


def class_utf8(data):
    """Parse classfile constant-pool UTF8 entries without invoking javap/JVM."""
    if len(data) < 10 or data[:4] != b'\xca\xfe\xba\xbe':
        raise ValueError('invalid fixture classfile')
    count = struct.unpack_from('>H', data, 8)[0]
    pos, index, strings = 10, 1, []
    sizes = {3: 4, 4: 4, 5: 8, 6: 8, 7: 2, 8: 2, 9: 4, 10: 4, 11: 4,
             12: 4, 15: 3, 16: 2, 17: 4, 18: 4, 19: 2, 20: 2}
    try:
        while index < count:
            tag = data[pos]
            pos += 1
            if tag == 1:
                size = struct.unpack_from('>H', data, pos)[0]
                pos += 2
                if pos + size > len(data):
                    raise ValueError('truncated constant pool')
                strings.append(data[pos:pos + size])
                pos += size
            else:
                pos += sizes[tag]
                if pos > len(data):
                    raise ValueError('truncated constant pool')
                if tag in (5, 6):
                    index += 1
            index += 1
    except (IndexError, KeyError, struct.error) as exc:
        raise ValueError('malformed fixture constant pool') from exc
    return strings


def verify_fixture_protocol(classes):
    path = classes / 'org/openjdk/bench/nioqual/NioCachePaths.class'
    pool = class_utf8(path.read_bytes())
    for marker in (b'nio-bind-v1', b'/proc/thread-self/stat', b'nio.observer.binding', b'nio.observer.nonce'):
        if not any(marker in value for value in pool):
            raise ValueError('stale fixture classes: compile the current handshake source first')


def visibility(proc_root=Path('/proc'), cgroup=Path('/sys/fs/cgroup/cpu.stat'), pid=None, tid=None):
    pid = os.getpid() if pid is None else pid
    tid = threading.get_native_id() if tid is None else tid
    row = read_identity(pid, proc_root)
    (proc_root / str(pid) / 'exe').resolve(strict=True)
    with (proc_root / str(pid) / 'cmdline').open('rb') as stream:
        cmdline = stream.read(32769)
    if not cmdline or len(cmdline) > 32768:
        raise ValueError('command identity view unavailable; timing path disabled')
    direct = identity((proc_root / 'thread-self/stat').read_text())
    task = identity((proc_root / str(pid) / 'task' / str(tid) / 'stat').read_text())
    if direct['id'] != tid or task['id'] != tid or direct['start'] != task['start']:
        raise ValueError('thread-self/native-TID correspondence unavailable; timing path disabled')
    bound = BoundSampler({'pid': pid, **row}, {'pid': pid, **row}, {'tid': tid, **task}, proc_root, cgroup)
    try:
        bound.sample()  # One read-only capability check, no workload or timing loop.
    finally:
        bound.close()
    return {'thread_self_identity': True, 'bound_counter_files': True, 'command_identity_views': True,
            'children_view_present': (proc_root / str(pid) / 'task' / str(tid) / 'children').exists(),
            'children_view_required': False, 'worker_names_required': False,
            'scope': 'read-only visibility, not live diagnostic qualification'}
