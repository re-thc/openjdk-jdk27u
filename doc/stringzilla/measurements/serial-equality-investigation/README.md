# Native serial equality configuration investigation

The production integration keeps `SZ_USE_MISALIGNED_LOADS=0`. The proposed
unconditional word equality loop was rejected: it improves Clang's long serial
comparisons, but loses GCC 16's existing vectorized comparisons and increases
some short-input means. Enabling unaligned typed loads is not a portable fix.

This directory preserves a native primitive experiment, **not whole-image Java,
JIT-tier, String.equals, or JMH evidence**. It does not qualify a production
change. The production base was
`da3ae24b030d8c9c0694bbb5b33412f76c27780c`, kernel blob
`993fd1957118b4d45dee801a1977c15c3d982570`, using StringZilla 5.3.0.

## Compared implementations

- `current`: production serial equality, portable loads.
- `word`: explicit eight-byte loop using the existing legal `sz_u64_load`
  helper; retains the original pointer-based tail.
- `patched` in the refined run: word loop with remaining-length accounting
  and an indexed byte tail.
- `probe`: refined loop plus an initial zero-length/first-byte check.

The first run calls its word candidate `patched`; the refined run calls that
same candidate `word`. All variants retain the upstream 24-byte word threshold,
the production callback, and its length bounds. No handwritten assembly or
architecture-specific load was added.

## Selected refined means

Nanoseconds per native callback; equal inputs at source/target offset 0.
Refined timing allocations are explicitly aligned to 64 bytes.

| Compiler / native runner | Bytes | Current | Word | Indexed tail | First-byte probe |
| --- | ---: | ---: | ---: | ---: | ---: |
| GCC 16 x64 | 16 | 10.62 | 10.39 | 10.38 | 10.73 |
| GCC 16 x64 | 64 | 5.31 | 7.78 | 6.49 | 6.23 |
| GCC 16 x64 | 4096 | 164.03 | 460.13 | 382.88 | 383.95 |
| GCC 16 ARM64 | 4096 | 195.46 | 228.77 | 224.21 | 224.34 |
| Clang 21 x64 | 16 | 3.73 | 3.67 | 3.81 | 7.17 |
| Clang 21 x64 | 64 | 13.27 | 3.84 | 2.53 | 2.71 |
| Clang 21 x64 | 4096 | 924.00 | 227.62 | 127.32 | 130.57 |
| Clang 21 ARM64 | 16 | 7.19 | 7.23 | 7.62 | 7.43 |
| Clang 21 ARM64 | 4096 | 1654.47 | 202.89 | 229.27 | 201.26 |

Higher candidate means remain in every raw and summary file. Counts below are
descriptive comparisons, not significance tests; each configuration has 464
input tuples.

| Native configuration | First word: higher means | Refined word | Refined indexed | Refined probe |
| --- | ---: | ---: | ---: | ---: |
| GCC 16 x64 | 60 | 157 | 116 | 137 |
| GCC 16 ARM64 | 86 | 79 | 78 | 57 |
| Clang 21 x64 | 122 | 52 | 113 | 81 |
| Clang 21 ARM64 | 123 | 126 | 121 | 100 |

The retained optimized assembly explains the GCC result: its current byte loop
uses vector comparisons for suitable congruent alignments. The explicit word
loop gives up that path. Clang's current serial callback uses byte comparisons;
the candidate folds legal portable helper loads into `movq` / `ldr`.
Compiler-specific native wins do not establish end-to-end Java wins.

## Method and complete evidence

Both completed runs used native x64 and ARM64 runners, GCC
`16.0.1 20260322 (experimental)` and Clang `21.1.8`.
Each configuration covers 23 lengths from 0 through 4096 bytes, four source/target
offset pairs (0/0, 1/1, 1/3, 7/0), equality and first/interior/final mismatches,
with duplicate cases removed. Calls run on one permitted CPU at `-O3`; each
input/variant calibrates to at least 3 ms.

The first run uses ten alternating paired rounds, two variants, and ordinary
malloc timing allocations. Offset 0/0 in that run does **not** promise a
32- or 64-byte alignment. The refinement fixes that blind spot with explicitly
64-byte-aligned timing allocations and recorded offsets, twelve balanced rotated
rounds, and four variants. Do not compare absolute times across the two runs as
if they shared a machine. These are repeated samples in one process per
configuration, without independent process forks or formal confidence claims.

All variants passed the production native kernel contract tests and exact-size
unaligned equality fixtures under ASan, UBSan and alignment checks. Sanitizer
fixtures retain exact-size malloc allocations. Compiler target-default reports,
source headers, optimized assembly, build logs and sanitizer receipts are
retained alongside all 126,208 timed samples.

| Configuration | First run | Refined run |
| --- | --- | --- |
| GCC x64 | [raw](first/x86_64/gcc-16/raw.csv), [means](first/x86_64/gcc-16/summary.json), [assembly](first/x86_64/gcc-16/current/optimized.s) | [raw](refined/x86_64/gcc-16/raw.csv), [means](refined/x86_64/gcc-16/summary.json), [assembly](refined/x86_64/gcc-16/current/optimized.s) |
| GCC ARM64 | [raw](first/aarch64/gcc-16/raw.csv), [means](first/aarch64/gcc-16/summary.json), [assembly](first/aarch64/gcc-16/current/optimized.s) | [raw](refined/aarch64/gcc-16/raw.csv), [means](refined/aarch64/gcc-16/summary.json), [assembly](refined/aarch64/gcc-16/current/optimized.s) |
| Clang x64 | [raw](first/x86_64/clang/raw.csv), [means](first/x86_64/clang/summary.json), [assembly](first/x86_64/clang/current/optimized.s) | [raw](refined/x86_64/clang/raw.csv), [means](refined/x86_64/clang/summary.json), [assembly](refined/x86_64/clang/current/optimized.s) |
| Clang ARM64 | [raw](first/aarch64/clang/raw.csv), [means](first/aarch64/clang/summary.json), [assembly](first/aarch64/clang/current/optimized.s) | [raw](refined/aarch64/clang/raw.csv), [means](refined/aarch64/clang/summary.json), [assembly](refined/aarch64/clang/current/optimized.s) |

[Receipt](receipt.json) records exact source commits, sample counts and run URLs.
[First run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39055555124)
and [refined run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39056589977)
each completed all four jobs successfully. Every producer artifact hash was
verified before archiving. Original binary hashes remain in each producer
`sha256.json`; binaries were omitted from this durable text archive.
[archive-sha256.json](archive-sha256.json) hashes every retained text file.
