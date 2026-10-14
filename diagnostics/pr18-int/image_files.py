#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. GPL version 2.
"""Bounded image allocation changes; never overwrite a baseline hardlink."""
import hashlib
import json
import os
import shutil
import stat
import sys
from pathlib import Path
from filesystem import capture

VM_FILES = ('lib/server/libjvm.so', 'lib/server/libjvm.debuginfo')


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def regular_owned(path):
    s = path.lstat()
    if not stat.S_ISREG(s.st_mode) or s.st_uid != os.geteuid():
        raise RuntimeError(f'Expected an owned regular file: {path}')
    return s


def ct_sym(root, src, dst):
    expected = root / 'source/build/diagnostic/support'
    if src != expected / 'symbols/ct.sym' or dst != expected / 'modules_libs/jdk.compiler/ct.sym':
        raise RuntimeError('Refusing an unexpected ct.sym copy target')
    dst.parent.mkdir(parents=True, exist_ok=True)
    capture('ctsym-before', [src, dst, dst.parent])
    try:
        original = regular_owned(src)
        if original.st_dev != dst.parent.stat().st_dev:
            raise RuntimeError('ct.sym hardlink would cross filesystems')
        digest = sha(src)
        temporary = dst.with_name(dst.name + '.diagnostic-' + str(os.getpid()))
        try:
            os.link(src, temporary)
            os.replace(temporary, dst)
        finally:
            temporary.unlink(missing_ok=True)
        if (src.stat().st_dev, src.stat().st_ino) != (dst.stat().st_dev, dst.stat().st_ino):
            raise RuntimeError('ct.sym destination is not the requested hardlink')
        if sha(src) != digest or sha(dst) != digest:
            raise RuntimeError('ct.sym bytes changed during installation')
        capture('ctsym-after', [src, dst])
        print(json.dumps({'ctsym_sha256': digest, 'allocation': 'hardlink'}), flush=True)
    except Exception as e:
        capture('ctsym-failure', [src, dst, dst.parent], e)
        raise


def freeze(root):
    source = root / 'source/build/diagnostic/images/jdk'
    base = root / 'images/base'
    support = root / 'source/build/diagnostic/support/modules_libs/java.base/server'
    if base.exists():
        raise RuntimeError('Baseline already exists; refusing to replace it')
    for path in source.rglob('*'):
        if path.is_symlink() and not path.resolve().is_relative_to(source.resolve()):
            raise RuntimeError(f'Packaged image points outside its immutable tree: {path}')
    for name in VM_FILES:
        a, b = regular_owned(source / name), regular_owned(support / Path(name).name)
        if (a.st_dev, a.st_ino) == (b.st_dev, b.st_ino):
            raise RuntimeError('Packaged VM aliases mutable build output')
    if source.stat().st_dev != base.parent.stat().st_dev:
        raise RuntimeError('Baseline rename would cross filesystems')
    source.rename(base)


def candidate(root):
    base, dest = root / 'images/base', root / 'images/candidate'
    support = root / 'source/build/diagnostic/support/modules_libs/java.base/server'
    if dest.exists():
        raise RuntimeError('Candidate already exists; refusing to replace it')
    # No mutable build output is linked into the frozen baseline.
    shutil.copytree(base, dest, copy_function=os.link, symlinks=True)
    for name in VM_FILES:
        target, built = dest / name, support / Path(name).name
        regular_owned(built)
        digest = sha(base / name)
        target.unlink()  # Required: writing through this link would corrupt the baseline.
        shutil.copy2(built, target)
        if (target.stat().st_dev, target.stat().st_ino) == (base.joinpath(name).stat().st_dev, base.joinpath(name).stat().st_ino):
            raise RuntimeError('Candidate VM still aliases baseline')
        if sha(base / name) != digest or sha(target) != sha(built):
            raise RuntimeError('VM byte preservation check failed')


if __name__ == '__main__':
    root = Path(os.environ['DIAGNOSTIC_ROOT']).resolve()
    operation = sys.argv[1]
    if operation == 'ctsym':
        ct_sym(root, Path(sys.argv[2]).absolute(), Path(sys.argv[3]).absolute())
    else:
        paths = [root / 'images/base', root / 'images/candidate',
                 root / 'source/build/diagnostic/images/jdk']
        for name in VM_FILES:
            paths += [root / 'source/build/diagnostic/support/modules_libs/java.base/server' / Path(name).name,
                      root / 'images/base' / name, root / 'images/candidate' / name]
        capture(operation + '-before', paths)
        try:
            if operation == 'freeze':
                freeze(root)
            elif operation == 'candidate':
                candidate(root)
            else:
                raise ValueError('Unknown copy operation')
        except Exception as e:
            capture(operation + '-failure', paths, e)
            raise
        capture(operation + '-after', paths)
