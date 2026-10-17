#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
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

"""Reconstruct a Git-recorded reference cell; print the recipe unless --write.

Uses one untimed compression call in an existing libzstd 1.5.7, with the same
fresh-CCtx API as the repository native probe. No build, JVM or benchmark runs.
This verifies the later recorded ARM frame, not its unrecorded relationship to
the original 504.5/1511.9 x86 timing/capture cell.
"""

import argparse
import ctypes
import hashlib
import json
from pathlib import Path
import subprocess


CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
EVIDENCE = "983ffb34bd9e1ded6a9cd7685577d6251796191b"
RECORD = "scripts/jdk27/arm-residual-2026-10-16.json"
CELL = "git-source-native-l1-6901a47a"
CORPUS = "dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9"
FRAME = "6901a47a3100e2e1453a43a70017d5a6ad83fcc49a3f8b1be875d7ffe08dcab5"


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def git(root, *args):
    return subprocess.check_output(["git", "-C", str(root), *args])


def reconstruct(args):
    if args.output.exists():
        raise ValueError("Refusing to overwrite input directory: " + str(args.output))
    record = json.loads(git(args.codec_root, "show", EVIDENCE + ":" + RECORD))
    expected = record["fresh_matrix"]
    if expected["corpus_sha256"] != CORPUS or expected["frame_sha256"] != FRAME:
        raise ValueError("Independent Git evidence differs from the pinned reference")
    paths = sorted(path for path in git(args.codec_root, "ls-tree", "-r", "--name-only", CODEC,
                                        "src/main/java").decode().splitlines() if path.endswith(".java"))
    blobs = {path: git(args.codec_root, "show", CODEC + ":" + path) for path in paths}
    corpus = b"".join(blobs[path] + b"\n" for path in paths)
    if len(paths) != 37 or len(corpus) != 764896 or sha256(corpus) != CORPUS:
        raise ValueError("Source corpus does not reproduce the recorded hash")

    library = args.library.resolve(strict=True)
    library_hash = sha256(library.read_bytes())
    zstd = ctypes.CDLL(str(library))
    zstd.ZSTD_versionString.restype = ctypes.c_char_p
    version = zstd.ZSTD_versionString().decode()
    if version != "1.5.7":
        raise ValueError("Use an existing libzstd 1.5.7, found " + version)
    zstd.ZSTD_compressBound.argtypes = [ctypes.c_size_t]
    zstd.ZSTD_compressBound.restype = ctypes.c_size_t
    zstd.ZSTD_createCCtx.restype = ctypes.c_void_p
    zstd.ZSTD_freeCCtx.argtypes = [ctypes.c_void_p]
    zstd.ZSTD_freeCCtx.restype = ctypes.c_size_t
    zstd.ZSTD_compressCCtx.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t,
                                     ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int]
    zstd.ZSTD_compressCCtx.restype = ctypes.c_size_t
    zstd.ZSTD_isError.argtypes = [ctypes.c_size_t]
    zstd.ZSTD_isError.restype = ctypes.c_uint
    zstd.ZSTD_getErrorName.argtypes = [ctypes.c_size_t]
    zstd.ZSTD_getErrorName.restype = ctypes.c_char_p
    source = ctypes.create_string_buffer(corpus)
    capacity = zstd.ZSTD_compressBound(len(corpus))
    destination = ctypes.create_string_buffer(capacity)
    context = zstd.ZSTD_createCCtx()
    if not context:
        raise MemoryError("ZSTD_createCCtx")
    try:
        size = zstd.ZSTD_compressCCtx(context, destination, capacity, source, len(corpus), 1)
        if zstd.ZSTD_isError(size):
            raise ValueError(zstd.ZSTD_getErrorName(size).decode())
        frame = destination.raw[:size]
    finally:
        zstd.ZSTD_freeCCtx(context)
    if len(frame) != 176726 or sha256(frame) != FRAME:
        raise ValueError("Native frame differs from the independent Git record: " + sha256(frame))
    if sha256(library.read_bytes()) != library_hash:
        raise ValueError("Native library changed while constructing inputs")

    manifest = {
        "cell_id": CELL,
        "codec_pin": CODEC,
        "source_recipe": "Lexically sorted recursive src/main/java/*.java Git blobs, one LF after each",
        "source_files_sha256": {path: sha256(data) for path, data in blobs.items()},
        "corpus_bytes": len(corpus), "corpus_sha256": CORPUS,
        "frame_bytes": len(frame), "frame_sha256": FRAME,
        "native_recipe": "Fresh ZSTD_CCtx; one ZSTD_compressCCtx(full corpus, level=1), no overrides",
        "native_library": str(library), "native_library_sha256": library_hash,
        "native_version": version,
        "evidence_commit": EVIDENCE, "evidence_path": RECORD, "evidence_field": "fresh_matrix",
        "evidence_blob": git(args.codec_root, "rev-parse", EVIDENCE + ":" + RECORD).decode().strip(),
        "generator_sha256": sha256(Path(__file__).read_bytes()),
        "historical_504_cell_identity_verified": False,
        "historical_gap": "No Git record binds the original 504.5/1511.9 x86 capture to this frame hash",
        "timing_performed": False,
    }
    args.output.mkdir(parents=True, exist_ok=False)
    (args.output / "corpus.bin").write_bytes(corpus)
    (args.output / "native.l1.zst").write_bytes(frame)
    (args.output / "provenance.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps({key: manifest[key] for key in ("cell_id", "corpus_bytes", "corpus_sha256",
                                                   "frame_bytes", "frame_sha256", "timing_performed")}, indent=2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--codec-root", type=Path, default=Path("/workspace/executor-jzstd"))
    parser.add_argument("--library", type=Path, default=Path("/usr/lib/x86_64-linux-gnu/libzstd.so.1.5.7"))
    parser.add_argument("--output", type=Path, default=Path("/workspace/decoder-lowmask-input"))
    parser.add_argument("--write", action="store_true", help="construct and hash-check inputs without timing")
    args = parser.parse_args()
    args.codec_root, args.output = args.codec_root.resolve(), args.output.resolve()
    if args.write:
        reconstruct(args)
    else:
        print(json.dumps({"cell_id": CELL, "codec_pin": CODEC, "evidence_commit": EVIDENCE,
                          "corpus_sha256": CORPUS, "frame_sha256": FRAME,
                          "output": str(args.output), "write_requested": False}, indent=2))


if __name__ == "__main__":
    main()
