# StringZilla benchmarks

Measurements compare an untouched complete original JDK, the complete fork with
StringZilla enabled, and that same fork with `-XX:-UseStringZillaIntrinsics`.
All controls use original baseline `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`,
matched GCC/G++ 16 or MSVC 19.44 build profiles, source date and version options.

The [reproduction specification](native-cases.tsv) contains 249 manifest rows,
219 distinct benchmark/parameter inputs and 1,635 backend/tier triplets across
serial, AVX2, AVX-512, native ARM64/NEON and MSVC serial kernels. Every triplet has
original/enabled/disabled controls: 4,905 measurements. It covers interpreter,
C1 and C2, short and threshold inputs, forward and reverse search, immediate
matches, repeated suffixes, periodic needles, overlaps, mixed coders, equality,
character search and serial fallbacks.

Each control uses two forks, three 500 ms warmup iterations and five 500 ms
measurement iterations per fork, Serial GC, disabled CDS and one CPU affinity.
Control order rotates. The runner checks compiler settings, attests executable
backend selection, and fingerprints complete images and the external benchmark
harness before and after measurement. It retains raw samples and every higher
enabled mean; overlapping intervals do not establish equivalence.

Current changes require fresh complete-image qualification. Its source pin,
image receipts, complete table and raw evidence will be recorded here when all
backend/tier shards pass. The [measurement index](measurements/README.md)
preserves completed preceding cohorts and their losses at immutable sources;
those measurements do not qualify subsequent code.

The [PR checks](https://github.com/re-thc/openjdk-jdk27u/pull/4/checks) build
release/debug JDKs and run tier1 tests. Native qualification additionally checks
vendoring, jtreg dispatch and bounds, and executable native kernels under
ASan/UBSan/alignment sanitizers on Linux. Separate compilation traces establish
C1 wrapper inlining and inspect C2 narrow fallback code; their timings are
diagnostic output, not benchmark evidence.
