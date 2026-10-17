#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Record/verify retained normal JDK image bytes; never launch a VM or build.

The manifest is local provenance, not a qualification result. Source/configuration,
custody, platform and runtime controls must be checked separately before reuse.
"""
import hashlib
import json
import os
from pathlib import Path
import stat
import sys

# Adapted from Scanner db266200863da200d5bb11a80e8875643153db5e.
class Uncertain(RuntimeError):
    pass


def check_image(image):
    for name in ['bin/java', 'bin/javac', 'lib/modules', 'release']:
        if not (image / name).is_file():
            raise Uncertain('Incomplete normal JDK image: ' + name)


def catalog(image, check=lambda: None, require_jdk=True):
    image = image.resolve(strict=True)
    if require_jdk:
        check_image(image)
    entries = {}

    def inspect(path):
        check()
        before = path.lstat()
        item = {"mode": stat.S_IMODE(before.st_mode)}
        if stat.S_ISLNK(before.st_mode):
            # Do not silently verify a link while its unrecorded outside target
            # changes. Normal retained images must be self-contained.
            if not path.resolve(strict=True).is_relative_to(image):
                raise Uncertain(f"image link escapes its root: {path}")
            item.update(kind="symlink", target=os.readlink(path))
        elif stat.S_ISDIR(before.st_mode):
            item.update(kind="directory")
        elif stat.S_ISREG(before.st_mode):
            digest = hashlib.sha256()
            with path.open("rb") as stream:
                while block := stream.read(1024 * 1024):
                    check()
                    digest.update(block)
            item.update(kind="file", bytes=before.st_size, sha256=digest.hexdigest())
        else:
            raise Uncertain(f"unsupported image entry type: {path}")
        after = path.lstat()
        if (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns,
            before.st_ctime_ns, before.st_mode) != (
                after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns,
                after.st_ctime_ns, after.st_mode):
            raise Uncertain(f"image changed while recording: {path}")
        entries[path.relative_to(image).as_posix()] = item
        check()

    inspect(image)
    def traversal_error(error):
        raise error  # os.walk's default would silently omit unreadable entries.

    for root, directories, files in os.walk(image, followlinks=False, onerror=traversal_error):
        for name in sorted(directories + files):
            inspect(Path(root) / name)
    return {"format": 1, "entries": entries}


def record(image, manifest, check=lambda: None):
    # Refuse replacement of an established provenance witness.
    if manifest.resolve().is_relative_to(image.resolve()):
        raise Uncertain("image manifest must be stored outside the image")
    data = catalog(image, check)
    with manifest.open("x") as output:
        output.write(json.dumps(data, indent=2, sort_keys=True) + "\n")
    return data


def verify(image, manifest, check=lambda: None):
    check()
    expected = json.loads(manifest.read_text())
    if expected.get("format") != 1 or not isinstance(expected.get("entries"), dict):
        raise Uncertain("unsupported image manifest schema")
    actual = catalog(image, check)
    old, new = expected["entries"], actual["entries"]
    missing, added = sorted(old.keys() - new.keys()), sorted(new.keys() - old.keys())
    changed = sorted(name for name in old.keys() & new.keys() if old[name] != new[name])
    if missing or added or changed:
        raise Uncertain(f"retained image differs: missing={missing}, added={added}, changed={changed}")
    check()
    return image.resolve(strict=True)


def main(args):
    if len(args) != 3 or args[0] not in ("record", "verify"):
        raise ValueError("usage: image_manifest.py record|verify <normal-image> <manifest.json>")
    image, manifest = Path(args[1]), Path(args[2])
    if args[0] == "record":
        record(image, manifest)
        print(manifest.resolve())
    else:
        print(verify(image, manifest))


if __name__ == "__main__":
    try:
        main(sys.argv[1:])
    except Exception as error:
        print(f"INCOMPLETE: {type(error).__name__}: {error}", file=sys.stderr)
        sys.exit(125)
