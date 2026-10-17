#!/usr/bin/env python3
"""Run the exact pinned preparation helper and seal the loaded zstd identity.

This entry point is exclusively for the approval-bound prepare-frames job. It
adds no inputs, levels, rounds, timing, or retry to the historical helper.
"""
import argparse
import ctypes
import hashlib
import importlib.util
import json
from pathlib import Path


def native_identity():
    library = ctypes.CDLL("libzstd.so.1")
    library.ZSTD_versionString.restype = ctypes.c_char_p
    version = library.ZSTD_versionString().decode()
    paths = set()
    for line in Path("/proc/self/maps").read_text().splitlines():
        fields = line.split(maxsplit=5)
        if len(fields) == 6 and Path(fields[5]).name.startswith("libzstd.so"):
            paths.add(Path(fields[5]).resolve())
    if version != "1.5.7" or len(paths) != 1:
        raise RuntimeError("Exact zstd 1.5.7 loaded-library identity unavailable")
    records = {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in paths}
    return dict(version=version, libraries=records)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--readiness", action="store_true", help="read library identity only; no input preparation")
    parser.add_argument("--helper", type=Path)
    parser.add_argument("--java-home", type=Path)
    parser.add_argument("--junit", type=Path)
    parser.add_argument("--source-corpus", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.readiness:
        if any((args.helper, args.java_home, args.junit, args.source_corpus)):
            parser.error("readiness does not accept workload arguments")
        args.output.write_text(json.dumps(native_identity(), indent=2) + "\n")
        return
    if not all((args.helper, args.java_home, args.junit, args.source_corpus)):
        parser.error("all fixed preparation paths are required")
    spec = importlib.util.spec_from_file_location("frozen_decoder_preparation", args.helper)
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    helper.prepare(args)
    (args.output / "native-library.json").write_text(json.dumps(native_identity(), indent=2) + "\n")


if __name__ == "__main__":
    main()
