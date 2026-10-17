#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Staged storage bounds. All removal is confined to a newly owned campaign."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import uuid

GiB = 1024**3
MiB = 1024**2
MIN_FREE_BYTES = 20 * GiB
MAX_WORK_BYTES = 18 * GiB
MAX_ACTIVE_BUILD_BYTES = 9 * GiB
MAX_SOURCE_BYTES = GiB
MAX_IMAGE_BYTES = 640 * MiB
MAX_TEST_ARTIFACT_BYTES = 512 * MiB
MAX_AUXILIARY_BYTES = 512 * MiB
MAX_MANIFEST_BYTES = 256 * MiB
FREE_FLOOR_BYTES = 2 * GiB
NAMES = ('baseline-release', 'candidate-release', 'baseline-fastdebug', 'candidate-fastdebug')
LAST_CONSUMERS = {
    'baseline-release': ('baseline-release-provenance', 'jmh-build', 'jmh-list-evidence'),
    'candidate-release': ('candidate-release-provenance',),
    'baseline-fastdebug': ('baseline-fastdebug-provenance',),
    'candidate-fastdebug': ('candidate-fastdebug-provenance', 'gtest-evidence'),
}



def peak_components():
    # Active build already includes its own image; only three completed images coexist with it.
    return dict(source_checkouts=4 * MAX_SOURCE_BYTES, active_build=MAX_ACTIVE_BUILD_BYTES,
                completed_images=3 * MAX_IMAGE_BYTES, retained_test_artifacts=MAX_TEST_ARTIFACT_BYTES,
                auxiliary_inputs=MAX_AUXILIARY_BYTES, input_manifests=MAX_MANIFEST_BYTES,
                outer_logs_and_results=GiB)

def allocated_bytes(path, skip_top=()):
    """Filesystem allocated bytes, without following symlinks or counting hardlinks twice."""
    path = Path(path)
    if not path.exists() and not path.is_symlink():
        return 0
    seen = set()
    def size(item, top=False):
        stat = item.lstat()
        key = (stat.st_dev, stat.st_ino)
        if key in seen:
            return 0
        seen.add(key)
        total = stat.st_blocks * 512
        if item.is_dir() and not item.is_symlink():
            for child in item.iterdir():
                if top and child.name in skip_top:
                    continue
                total += size(child)
        return total
    return size(path, True)


def create_owner(root, plan_sha256):
    root = Path(root).resolve()
    stat = root.stat()
    return dict(schema=1, root=str(root), directory_device=stat.st_dev, directory_inode=stat.st_ino,
                token=uuid.uuid4().hex, plan_sha256=plan_sha256)


def require_owner(root, plan_sha256):
    root = Path(root).absolute()
    if root.is_symlink() or root.resolve() != root:
        raise ValueError('Campaign root must have its original canonical identity')
    owner = json.loads((root / 'campaign-owner.json').read_text())
    stat = root.stat()
    if (owner.get('root'), owner.get('directory_device'), owner.get('directory_inode'), owner.get('plan_sha256')) != (
            str(root), stat.st_dev, stat.st_ino, plan_sha256):
        raise ValueError('Campaign ownership or plan identity mismatch')
    return owner


def deletion_targets(root, name):
    """Return only unused generated outputs; keep source, images and original config in place."""
    if name not in NAMES:
        raise ValueError('Unknown build variant')
    root = Path(root).resolve()
    tree = root / name
    build = tree / 'build/qualified'
    for path in (tree, tree / 'build', build):
        if path.is_symlink() or path.resolve() != path:
            raise ValueError('Refuse symlinked build ancestor: ' + str(path))
    if not build.is_dir():
        raise ValueError('Missing campaign build directory')
    keep = {'images', 'spec.gmk', 'configure.log'}
    targets = [p for p in sorted(build.iterdir()) if p.name not in keep]
    images = build / 'images'
    if images.is_symlink() or not images.is_dir():
        raise ValueError('Expected ordinary completed images directory')
    keep_test = name in ('baseline-release', 'candidate-fastdebug')
    targets += [p for p in sorted(images.iterdir()) if p.name not in ({'jdk', 'test'} if keep_test else {'jdk'})]
    if keep_test:
        test = images / 'test'
        child = 'micro' if name == 'baseline-release' else 'hotspot'
        if test.is_symlink() or not test.is_dir() or (test / child).is_symlink() or not (test / child).is_dir():
            raise ValueError('Expected ordinary retained test-artifact directories')
        targets += [p for p in sorted(test.iterdir()) if p.name != child]
        allowed = {'benchmarks.jar'} if name == 'baseline-release' else {'gtest'}
        targets += [p for p in sorted((test / child).iterdir()) if p.name not in allowed]
    return build, targets


def reject_live_references(keepers, targets):
    for keeper in keepers:
        entries = [keeper] + list(keeper.rglob('*')) if keeper.is_dir() else [keeper]
        for item in entries:
            if item.is_symlink():
                resolved = item.resolve()
                if any(resolved == target or resolved.is_relative_to(target) for target in targets):
                    raise ValueError('Retained input refers to a removal target: ' + str(item))


def remove_generated(target):
    # rmtree uses descriptor-based symlink protection on the supported Linux/Python host.
    if target.is_symlink() or not target.is_dir():
        target.unlink()
    else:
        if not shutil.rmtree.avoids_symlink_attacks:
            raise ValueError('Safe descriptor-based rmtree is required')
        shutil.rmtree(target)


def check_limits(root, active_build=None):
    root = Path(root)
    record = dict(work_allocated_bytes=allocated_bytes(root), free_bytes=shutil.disk_usage(root).free)
    if record['work_allocated_bytes'] > MAX_WORK_BYTES:
        raise ValueError('Campaign allocation exceeds18GiB; stop without raising the limit')
    if record['free_bytes'] < FREE_FLOOR_BYTES:
        raise ValueError('Less than2GiB free; stop')
    tests, active = 0, []
    record['source_allocated_bytes'] = {}
    record['image_allocated_bytes'] = {}
    for name in NAMES:
        tree = root / name
        source = allocated_bytes(tree, skip_top={'build'})
        record['source_allocated_bytes'][name] = source
        if source > MAX_SOURCE_BYTES:
            raise ValueError('Source checkout exceeds1GiB: ' + name)
        build = tree / 'build/qualified'
        image = allocated_bytes(build / 'images/jdk')
        record['image_allocated_bytes'][name] = image
        image_path = build / 'images/jdk'
        frozen = root / 'input-manifests' / (hashlib.sha256(str(image_path).encode()).hexdigest() + '.json')
        if frozen.exists() and image > MAX_IMAGE_BYTES:
            raise ValueError('Completed JDK image exceeds640MiB: ' + name)
        tests += allocated_bytes(build / 'images/test')
        journal = root / 'storage' / (name + '-prune.json')
        complete = journal.exists() and json.loads(journal.read_text()).get('status') == 'complete'
        if build.exists() and not complete:
            active.append(name)
    if len(active) > 1:
        raise ValueError('More than one build has live intermediates: ' + str(active))
    if tests > MAX_TEST_ARTIFACT_BYTES:
        raise ValueError('Retained test artifacts exceed512MiB')
    auxiliary = sum(allocated_bytes(root / p) for p in ('deps', 'codec', 'codec-classes', 'corpus'))
    record['auxiliary_allocated_bytes'] = auxiliary
    record['test_artifact_allocated_bytes'] = tests
    if auxiliary > MAX_AUXILIARY_BYTES:
        raise ValueError('Pinned auxiliary inputs exceed512MiB')
    if allocated_bytes(root / 'input-manifests') > MAX_MANIFEST_BYTES:
        raise ValueError('Input manifests exceed256MiB')
    if active_build is not None:
        record['active_build_allocated_bytes'] = allocated_bytes(active_build)
        if record['active_build_allocated_bytes'] > MAX_ACTIVE_BUILD_BYTES:
            raise ValueError('Active build exceeds9GiB; stop without raising the limit')
    return record
