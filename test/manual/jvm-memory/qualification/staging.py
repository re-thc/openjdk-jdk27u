#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Seal complete configurations and discard only approved compile objects.

The CLI is read-only except for new manifests/receipts. Unlink is available only
to the supervised campaign with explicit policy approval, at an empty-child
boundary after the configuration's final compile consumer. No directory removal,
symlink following, recursive delete, or image/symbol/log selection exists here.
"""
import argparse
from contextlib import contextmanager
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import stat
import sys
import time

sys.dont_write_bytecode = True

POLICY = 'compile-objects-after-consumers-v1'
CONFIGURATIONS = {'B-release': 'B', 'C-release': 'C',
                  'C-fastdebug': 'C', 'C-release-asan': 'C'}
MAX_SECONDS = 180
DIRECT_OBJECT_DIRS = {
    'hotspot/variant-server/libjvm/objs',
    'hotspot/variant-server/libjvm/gtest/objs',
    'hotspot/variant-server/libjvm/gtest/launcher-objs',
    'hotspot/variant-server/libjvm/libgtest/objs',
    'hotspot/variant-server/tools/adlc/objs',
}
DIR_FLAGS = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC


def need(condition, message):
    if not condition:
        raise RuntimeError(message)


def encoded(value):
    return (json.dumps(value, sort_keys=True, indent=2, allow_nan=False) + '\n').encode()


def digest(value):
    return hashlib.sha256(encoded(value)).hexdigest()


def write_new(path, value):
    path = Path(path)
    need(path.is_absolute(), 'Manifest output path must be absolute')
    with absolute_directory(path.parent) as parent:
        fd = os.open(path.name, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC,
                     0o600, dir_fd=parent)
        with os.fdopen(fd, 'wb') as stream:
            stream.write(encoded(value))
        assert_root_binding(path.parent, parent)


def read_pinned(path, expected, check=lambda: None):
    path = Path(path); check()
    with absolute_directory(path.parent) as parent:
        fd = os.open(path.name, os.O_RDONLY | os.O_NOFOLLOW | os.O_CLOEXEC, dir_fd=parent)
        try:
            before = os.fstat(fd)
            need(stat.S_ISREG(before.st_mode) and before.st_size <= 128*1024**2,
                 'Manifest is not a bounded regular file')
            blocks = []
            while True:
                check()
                block = os.read(fd, 1024*1024)
                if not block:
                    break
                blocks.append(block)
                need(sum(map(len, blocks)) <= 128*1024**2, 'Manifest grew beyond limit')
            need(identity(before) == identity(os.fstat(fd))
                 == identity(os.stat(path.name, dir_fd=parent, follow_symlinks=False)),
                 'Manifest changed during read')
        finally:
            os.close(fd)
        assert_root_binding(path.parent, parent)
    raw = b''.join(blocks)
    need(len(expected) == 64 and hashlib.sha256(raw).hexdigest() == expected,
         'Manifest byte hash differs')
    value = json.loads(raw)
    need(digest(value) == expected, 'Manifest is not in canonical form')
    check()
    return value


def root_path(campaign, configuration):
    need(configuration in CONFIGURATIONS, 'Configuration outside staging policy')
    campaign = Path(campaign)
    need(campaign.is_absolute() and str(campaign) == os.path.normpath(str(campaign)),
         'Campaign path must be absolute and normalized')
    return campaign / CONFIGURATIONS[configuration] / 'build' / configuration


def relative_parts(name):
    path = PurePosixPath(name)
    need(isinstance(name, str) and name and not path.is_absolute()
         and str(path) == name and all(p not in ('.', '..') for p in path.parts)
         and '\\' not in name and '\x00' not in name,
         'Invalid relative staging path')
    return path.parts


@contextmanager
def absolute_directory(path):
    """Pin every component; an ancestor symlink is not a valid staging root."""
    path = Path(path)
    need(path.is_absolute(), 'Directory must be absolute')
    descriptors = [os.open('/', DIR_FLAGS)]
    try:
        for part in path.parts[1:]:
            need(part not in ('.', '..'), 'Invalid directory component')
            descriptors.append(os.open(part, DIR_FLAGS, dir_fd=descriptors[-1]))
        yield descriptors[-1]
    finally:
        for fd in reversed(descriptors):
            os.close(fd)


@contextmanager
def parent_directory(root_fd, name):
    parts = relative_parts(name)
    descriptors = [os.dup(root_fd)]
    try:
        for part in parts[:-1]:
            descriptors.append(os.open(part, DIR_FLAGS, dir_fd=descriptors[-1]))
        yield descriptors[-1], parts[-1]
    finally:
        for fd in reversed(descriptors):
            os.close(fd)


def identity(value):
    return (value.st_dev, value.st_ino, value.st_mode, value.st_size,
            value.st_nlink, value.st_mtime_ns, value.st_ctime_ns)


def metadata(value):
    return {'device': value.st_dev, 'inode': value.st_ino,
            'mode': stat.S_IMODE(value.st_mode)}


def assert_root_binding(path, root_fd):
    with absolute_directory(path) as current:
        need(metadata(os.fstat(current)) == metadata(os.fstat(root_fd)), 'Staging root moved')


def entry(parent_fd, name, check):
    check()
    before = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    value = metadata(before)
    if stat.S_ISDIR(before.st_mode):
        value['kind'] = 'directory'
    elif stat.S_ISLNK(before.st_mode):
        value.update(kind='symlink', target=os.readlink(name, dir_fd=parent_fd),
                     mtime_ns=before.st_mtime_ns, ctime_ns=before.st_ctime_ns)
    elif stat.S_ISREG(before.st_mode):
        fd = os.open(name, os.O_RDONLY | os.O_NOFOLLOW | os.O_CLOEXEC, dir_fd=parent_fd)
        try:
            need(identity(os.fstat(fd)) == identity(before), 'File changed before hashing')
            h = hashlib.sha256()
            while True:
                check()
                block = os.read(fd, 1024 * 1024)
                if not block:
                    break
                h.update(block)
            need(identity(os.fstat(fd)) == identity(before), 'File changed during hashing')
        finally:
            os.close(fd)
        value.update(kind='file', size=before.st_size, nlink=before.st_nlink,
                     allocated_bytes=before.st_blocks * 512, sha256=h.hexdigest(),
                     mtime_ns=before.st_mtime_ns, ctime_ns=before.st_ctime_ns)
    else:
        raise RuntimeError('Unsupported staging entry type')
    after = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    need(identity(before) == identity(after), 'Entry changed during inspection')
    check()
    return value


def catalog(root_fd, check):
    result = {'.': {**metadata(os.fstat(root_fd)), 'kind': 'directory'}}

    def walk(fd, prefix):
        check()
        for name in sorted(os.listdir(fd)):
            relative = prefix + name
            relative_parts(relative)
            value = entry(fd, name, check)
            result[relative] = value
            if value['kind'] == 'directory':
                child = os.open(name, DIR_FLAGS, dir_fd=fd)
                try:
                    need(metadata(os.fstat(child)) == {k: value[k] for k in ('device', 'inode', 'mode')},
                         'Directory changed before traversal')
                    walk(child, relative + '/')
                finally:
                    os.close(child)
        check()
    walk(root_fd, '')
    return result


def complete_images(entries):
    for name in ['bin/java', 'bin/javac', 'lib/modules', 'release']:
        need(entries.get('images/jdk/' + name, {}).get('kind') == 'file',
             'Incomplete normal JDK image: ' + name)
    for prefix in ['images/test/hotspot/gtest/server/',
                   'hotspot/variant-server/libjvm/gtest/']:
        for name in ['gtestLauncher', 'libjvm.so']:
            need(entries.get(prefix + name, {}).get('kind') == 'file',
                 'Incomplete packaged/canonical native runtime: ' + prefix + name)
    # Image links must resolve through this catalog, without leaving images/.
    for name, item in entries.items():
        if name.startswith('images/') and item['kind'] == 'symlink':
            pending = name
            visited = set()
            while entries.get(pending, {}).get('kind') == 'symlink':
                need(pending not in visited, 'Cyclic image symlink')
                visited.add(pending)
                target = entries[pending]['target']
                need(not target.startswith('/'), 'Absolute image symlink')
                pending = os.path.normpath(str(PurePosixPath(pending).parent / target))
                need(pending.startswith('images/'), 'Image symlink escapes complete image tree')
            # A link may traverse an intermediate symlink, which needs an actual
            # entry too. Fail closed rather than silently following outside data.
            need(pending in entries, 'Unresolved image symlink')
            parts = PurePosixPath(pending).parts
            need(all(entries['/'.join(parts[:i])]['kind'] == 'directory'
                     for i in range(1, len(parts))), 'Image link traverses a symlink')


def eligible(name, value):
    parts = relative_parts(name)
    if value['kind'] != 'file' or not name.endswith('.o'):
        return False
    parent = str(PurePosixPath(name).parent)
    return parent in DIRECT_OBJECT_DIRS or (
        len(parts) == 5 and parts[:2] == ('support', 'native'))


def seal(campaign, configuration, check, audit):
    audit(); check()
    root = root_path(campaign, configuration)
    with absolute_directory(root) as fd:
        entries = catalog(fd, check)
        assert_root_binding(root, fd)
    complete_images(entries)
    audit(); check()
    return {'format': 1, 'policy': POLICY, 'campaign_root': str(campaign),
            'configuration': configuration, 'entries': entries}


def make_plan(campaign, configuration, sealed):
    root_path(campaign, configuration)
    need(sealed.get('format') == 1 and sealed.get('policy') == POLICY
         and sealed.get('campaign_root') == str(campaign)
         and sealed.get('configuration') == configuration, 'Seal scope differs')
    complete_images(sealed['entries'])
    objects = []
    for name, value in sorted(sealed['entries'].items()):
        if name == '.':
            continue
        if eligible(name, value):
            need(value['nlink'] == 1, 'Object has shared/unknown hardlinks: ' + name)
            objects.append({'path': name, 'entry': value})
    need(objects, 'No eligible compile objects')
    return {'format': 1, 'policy': POLICY, 'campaign_root': str(campaign),
            'configuration': configuration, 'root': str(root_path(campaign, configuration)),
            'seal_sha256': digest(sealed), 'objects': objects,
            'object_count': len(objects),
            'reclaimable_allocated_bytes': sum(row['entry']['allocated_bytes'] for row in objects)}


def operate(campaign, configuration, sealed, plan, *, check, audit,
            apply=False, approved_policy=None, journal=lambda row: None):
    """Validate the entire sealed tree before any unlink; retain every other file.

    The caller owns exclusive configuration writes. Descriptor traversal prevents
    symlink redirection; observed drift always fails. Same-uid hostile concurrent
    writes cannot be made transactional by POSIX unlink and are outside custody.
    """
    need(not apply or approved_policy == POLICY, 'Compile-object cleanup policy not approved')
    need(plan == make_plan(campaign, configuration, sealed), 'Cleanup manifest changed or out of scope')
    check(); audit()
    result = {'policy': POLICY, 'configuration': configuration, 'dry_run': not apply,
              'manifest_sha256': digest(plan), 'seal_sha256': digest(sealed),
              'planned_objects': plan['object_count'],
              'reclaimable_allocated_bytes': plan['reclaimable_allocated_bytes'],
              'deleted': [], 'status': 'VALIDATING'}
    try:
        with absolute_directory(root_path(campaign, configuration)) as root_fd:
            need(catalog(root_fd, check) == sealed['entries'], 'Sealed configuration changed')
            if apply:
                audit(); check()
                for row in plan['objects']:
                    check()
                    with parent_directory(root_fd, row['path']) as (parent, name):
                        need(entry(parent, name, check) == row['entry'], 'Object changed before cleanup')
                        journal({'event': 'unlink-intent', 'path': row['path'], 'entry': row['entry']})
                        check()
                        assert_root_binding(root_path(campaign, configuration), root_fd)
                        # Reopen the parent from the root after journalling; do
                        # not unlink through a directory moved out of this tree.
                        with parent_directory(root_fd, row['path']) as (current, _):
                            need(metadata(os.fstat(parent)) == metadata(os.fstat(current)),
                                 'Object parent moved before cleanup')
                        actual = os.stat(name, dir_fd=parent, follow_symlinks=False)
                        expected = row['entry']
                        need(stat.S_ISREG(actual.st_mode) and metadata(actual) == {
                            k: expected[k] for k in metadata(actual)} and actual.st_nlink == 1
                            and actual.st_size == expected['size']
                            and actual.st_mtime_ns == expected['mtime_ns']
                            and actual.st_ctime_ns == expected['ctime_ns'], 'Object identity changed before unlink')
                        os.unlink(name, dir_fd=parent)
                    result['deleted'].append(row['path'])
                    journal({'event': 'unlinked', 'path': row['path']})
            expected = {k: v for k, v in sealed['entries'].items() if k not in result['deleted']}
            need(catalog(root_fd, check) == expected, 'Retained configuration changed during cleanup')
            assert_root_binding(root_path(campaign, configuration), root_fd)
            result['retained_sha256'] = digest(expected)
        audit(); check()
        result['status'] = 'APPLIED_AND_VERIFIED' if apply else 'DRY_RUN_VERIFIED'
        journal({'event': 'complete', 'result': result})
        return result
    except BaseException as exc:
        result.update(status='HOLD', error=repr(exc))
        journal({'event': 'failed', 'result': result})
        raise


def verify_retained(campaign, configuration, sealed, deleted, check, audit):
    plan = make_plan(campaign, configuration, sealed)
    permitted = {row['path'] for row in plan['objects']}
    need(len(deleted) == len(set(deleted)) and set(deleted) <= permitted,
         'Retained verification attempted to exclude evidence outside object policy')
    expected = {k: v for k, v in sealed['entries'].items() if k not in deleted}
    audit(); check()
    with absolute_directory(root_path(campaign, configuration)) as fd:
        need(catalog(fd, check) == expected, 'Retained sealed configuration changed')
        assert_root_binding(root_path(campaign, configuration), fd)
    complete_images(expected)
    audit(); check()


def main():
    p = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    p.add_argument('action', choices=['prepare', 'dry-run'])
    p.add_argument('--campaign-root', type=Path, required=True)
    p.add_argument('--configuration', choices=CONFIGURATIONS, required=True)
    p.add_argument('--seal', type=Path, required=True)
    p.add_argument('--manifest', type=Path, required=True)
    p.add_argument('--seal-sha256')
    p.add_argument('--manifest-sha256')
    p.add_argument('--receipt', type=Path, required=True)
    p.add_argument('--seconds', type=float, default=MAX_SECONDS)
    a = p.parse_args()
    need(0 < a.seconds <= MAX_SECONDS, 'Invalid read-only staging deadline')
    configuration = root_path(a.campaign_root, a.configuration)
    for output in [a.seal, a.manifest, a.receipt]:
        need(output.is_absolute() and not output.resolve().is_relative_to(configuration.resolve()),
             'Manifest/receipt outputs must be outside the sealed configuration')
    need(len({a.seal, a.manifest, a.receipt}) == 3, 'Manifest/receipt paths must be distinct')
    from cancellation import Cancellation
    from process_cleanup import LinuxProcesses, require_no_children
    cancellation = Cancellation(); cancellation.install()
    end = time.monotonic() + a.seconds
    def check():
        cancellation.check()
        need(time.monotonic() < end, 'Staging deadline exhausted')
    def audit():
        require_no_children(LinuxProcesses())
    try:
        if a.action == 'prepare':
            sealed = seal(a.campaign_root, a.configuration, check, audit)
            plan = make_plan(a.campaign_root, a.configuration, sealed)
            write_new(a.seal, sealed); write_new(a.manifest, plan)
        else:
            need(a.seal_sha256 and a.manifest_sha256, 'Pin both manifest byte hashes')
            sealed = read_pinned(a.seal, a.seal_sha256, check)
            plan = read_pinned(a.manifest, a.manifest_sha256, check)
        result = operate(a.campaign_root, a.configuration, sealed, plan, check=check, audit=audit)
        write_new(a.receipt, result)
        print(json.dumps(result))
    finally:
        cancellation.restore()


if __name__ == '__main__':
    main()
