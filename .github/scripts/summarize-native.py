import csv
from pathlib import Path
import statistics

for artifact in sorted(Path("validation/native-artifacts").iterdir()):
    print("ARCHITECTURE", artifact.name, flush=True)
    for line in (artifact / "cpu.txt").read_text().splitlines():
        if any(key in line for key in ["Architecture:", "Model name:", "CPU(s):", "Vendor ID:", "Flags:"]):
            print(line, flush=True)
    print((artifact / "compiler.txt").read_text(), flush=True)
    rows = list(csv.DictReader((artifact / "real-corpora.csv").open()))
    print("SMALL INPUTS: median of three batches, level 6, reused stream; ns and bytes", flush=True)
    for size in [64, 1024, 65536]:
        for corpus in ["java", "hotspot", "documentation"]:
            for library in ["zlib", "zlib-ng-release", "zlib-ng-develop", "libdeflate"]:
                group = [r for r in rows if int(r["size"]) == size and int(r["level"]) == 6
                         and r["corpus"] == corpus and r["library"] == library]
                print("SMALL", corpus, size, library,
                      round(statistics.median(float(r["deflate_ns"]) for r in group), 2),
                      round(statistics.median(float(r["inflate_ns"]) for r in group), 2),
                      group[0]["compressed_bytes"], flush=True)
    checksums = list(csv.DictReader((artifact / "checksums.csv").open()))
    print("CHECKSUMS: median of three batches, Java corpus, ns per call", flush=True)
    for size in [1, 64, 1024, 16384, 65536]:
        for checksum in ["adler32", "crc32"]:
            for library in ["zlib", "zlib-ng-release", "zlib-ng-develop", "libdeflate"]:
                group = [r for r in checksums if int(r["size"]) == size and r["checksum"] == checksum
                         and r["corpus"] == "java" and r["library"] == library]
                print("CHECKSUM_MEDIAN", size, checksum, library,
                      round(statistics.median(float(r["ns"]) for r in group), 2), flush=True)
