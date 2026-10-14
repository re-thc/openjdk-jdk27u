#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. GPL version 2.
"""Read-only filesystem evidence for this diagnostic build."""
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path


def command(args):
    if not shutil.which(args[0]):
        return {'command': args, 'unavailable': True}
    try:
        p = subprocess.run(args, text=True, stdout=subprocess.PIPE,
                           stderr=subprocess.STDOUT, timeout=5)
        return {'command': args, 'exit_code': p.returncode, 'output': p.stdout}
    except (OSError, subprocess.TimeoutExpired) as e:
        return {'command': args, 'error': str(e)}


def existing(path):
    path = Path(path).absolute()
    while not path.exists() and path != path.parent:
        path = path.parent
    return path


def capture(label, paths, error=None):
    report = {'label': label, 'time_ns': time.time_ns(), 'pid': os.getpid(),
              'uid': os.getuid(), 'euid': os.geteuid(), 'gid': os.getgid(),
              'groups': os.getgroups(), 'cwd': os.getcwd(), 'paths': [],
              'quota_user': command(['quota', '-vs']),
              'quota_groups': command(['quota', '-vsg'])}
    if error is not None:
        report['failure'] = {'type': type(error).__name__, 'message': str(error),
                             'errno': getattr(error, 'errno', None)}
    for name in ['/proc/self/mountinfo', '/proc/self/cgroup']:
        try:
            report[name] = Path(name).read_text()
        except OSError as e:
            report[name] = {'error': str(e)}
    for name in ['/proc/self/ns/mnt', '/proc/1/ns/mnt']:
        try:
            report[name] = os.readlink(name)
        except OSError as e:
            report[name] = {'error': str(e)}
    for requested in paths:
        path = existing(requested)
        item = {'requested': str(requested), 'observed': str(path),
                'resolved': str(path.resolve())}
        try:
            s, v = path.stat(), os.statvfs(path)
            item['stat'] = {'device': s.st_dev, 'major': os.major(s.st_dev),
                            'minor': os.minor(s.st_dev), 'inode': s.st_ino,
                            'links': s.st_nlink, 'uid': s.st_uid, 'gid': s.st_gid,
                            'bytes': s.st_size, 'blocks_512': s.st_blocks}
            item['statvfs'] = {'block_size': v.f_frsize, 'blocks': v.f_blocks,
                               'blocks_free': v.f_bfree, 'blocks_available': v.f_bavail,
                               'inodes': v.f_files, 'inodes_free': v.f_ffree}
        except OSError as e:
            item['stat_error'] = str(e)
        item['mount'] = command(['findmnt', '-T', str(path), '-o', 'TARGET,SOURCE,FSTYPE,OPTIONS'])
        item['filesystem_type'] = command(['stat', '-f', '-c', '%T', str(path)])
        item['disk'] = command(['df', '-hT', str(path)])
        item['inodes'] = command(['df', '-i', str(path)])
        item['attributes'] = command(['lsattr', '-pd', str(path)])
        report['paths'].append(item)
    text = json.dumps(report, indent=2)
    # The console retains evidence even if the failing filesystem rejects another write.
    print('PR18_FILESYSTEM_REPORT_BEGIN', flush=True)
    print(text, flush=True)
    print('PR18_FILESYSTEM_REPORT_END', flush=True)
    try:
        out = Path(os.environ['DIAGNOSTIC_ROOT']) / 'evidence'
        out.mkdir(parents=True, exist_ok=True)
        (out / f'filesystem-{label}-{report["time_ns"]}-{os.getpid()}.json').write_text(text + '\n')
    except OSError as e:
        print('Cannot retain filesystem JSON: ' + str(e), file=sys.stderr, flush=True)
    return report


if __name__ == '__main__':
    if sys.argv[1] == 'select-scratch':
        root = (Path(os.environ['RUNNER_TEMP']) / 'pr18-int').resolve()
        root.mkdir(parents=True, exist_ok=True)
        os.environ['DIAGNOSTIC_ROOT'] = str(root)
        with Path(os.environ['GITHUB_ENV']).open('a') as stream:
            stream.write('DIAGNOSTIC_ROOT=' + str(root) + '\n')
        capture('scratch-selection', [root, Path('/tmp'), Path('/tmp/pr18-int')])
        filesystem = command(['stat', '-f', '-c', '%T', str(root)])
        if (filesystem.get('exit_code') != 0 or len(filesystem['output'].splitlines()) != 1 or
                filesystem['output'].strip() in ['tmpfs', 'ramfs', 'devtmpfs']):
            raise RuntimeError('Cannot establish disk-backed runner scratch space')
    else:
        capture(sys.argv[1], sys.argv[2:])
