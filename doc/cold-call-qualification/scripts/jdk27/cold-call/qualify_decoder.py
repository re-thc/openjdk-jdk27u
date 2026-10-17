#!/usr/bin/env python3
"""Prepare the frozen native frames with an ordinary JDK image; no capture route."""
import argparse
import ctypes
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[3]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def prepare(args):
    classes = args.output / "classes"
    classes.mkdir(parents=True, exist_ok=True)
    sources = sorted((ROOT / "src/main/java").rglob("*.java")) + [
        ROOT / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java",
        Path(__file__).with_name("DecoderQualification.java"),
    ]
    source_args = args.output / "sources.args"
    source_args.write_text("\n".join(map(str, sources)) + "\n")
    subprocess.run([str(args.java_home / "bin/javac"), "--add-modules", "jdk.incubator.vector",
                    "-cp", str(args.junit), "-d", str(classes), "@" + str(source_args)], check=True)
    corpus = args.output / "corpora"
    subprocess.run([str(args.java_home / "bin/java"), "--add-modules", "jdk.incubator.vector",
                    "-cp", str(classes) + ":" + str(args.junit), "dev.jzstd.DecoderQualification",
                    "prepare", str(corpus), str(args.source_corpus)], check=True)
    zstd = ctypes.CDLL("libzstd.so.1")
    zstd.ZSTD_compressBound.argtypes = [ctypes.c_size_t]
    zstd.ZSTD_compressBound.restype = ctypes.c_size_t
    zstd.ZSTD_compress.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p,
                                  ctypes.c_size_t, ctypes.c_int]
    zstd.ZSTD_compress.restype = ctypes.c_size_t
    zstd.ZSTD_isError.argtypes = [ctypes.c_size_t]
    zstd.ZSTD_isError.restype = ctypes.c_uint
    zstd.ZSTD_versionString.restype = ctypes.c_char_p
    rows = []
    for source in sorted(corpus.glob("*.bin")):
        raw = source.read_bytes()
        buffer = ctypes.create_string_buffer(zstd.ZSTD_compressBound(len(raw)))
        for level in (1, 3, 9):
            size = zstd.ZSTD_compress(buffer, len(buffer), raw, len(raw), level)
            if zstd.ZSTD_isError(size):
                raise RuntimeError("ZSTD_compress error " + str(size))
            frame = source.with_suffix(f".l{level}.zst")
            frame.write_bytes(buffer.raw[:size])
            rows.append(dict(source=source.name, frame=frame.name, level=level,
                             source_bytes=len(raw), frame_bytes=size,
                             source_sha256=sha(source), frame_sha256=sha(frame)))
    (corpus / "frames.tsv").write_text("".join(f"{r['source']}\t{r['frame']}\n" for r in rows))
    manifest = dict(scope="Fixed correctness frames; no encode/decode timing",
                    native_version=zstd.ZSTD_versionString().decode(),
                    factory_source_sha256=sha(sources[-2]), rows=rows)
    (args.output / "frames.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Prepared {len(rows)} frames; no timing")



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["prepare"])
    parser.add_argument("--java-home", type=Path, required=True)
    parser.add_argument("--junit", type=Path, required=True)
    parser.add_argument("--source-corpus", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    prepare(parser.parse_args())


if __name__ == "__main__":
    main()
