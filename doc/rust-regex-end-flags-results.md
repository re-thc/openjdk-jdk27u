# End-state and large-input review results

Measured on 2026-10-06 (Asia/Taipei), Linux x86_64, Xeon Platinum 8573C. These measurements include the Java changes in the commit containing this document, following baseline `a56d1e6fa9a92c00031902e311b2c351ad2ea60d`. The native Rust adapter and HotSpot VM are unchanged. The Java baseline is the same rebuilt JDK with `-XX:-UseRustRegex`.

The jtreg module declaration now uses `java.base/jdk.internal.util.regex:+open`, supplying both the export needed by the test import and the open needed by private-handle reflection. This follows GraphemeTest's declaration. The interpreter action also has an explicit 600-second timeout: its exhaustive comparison run took 176 seconds here, beyond jtreg's default action timeout.

Literal-prefix/greedy-digit-tail Patterns now compute exact end flags without Java promotion. Successful matches and failed searches set them immediately, avoiding saved replay input/metadata on the common path. Anchored misses inspect the saved prefix only if queried. No fields were added to Matcher. General expressions still replay and promote when queried, because Rust offsets cannot describe Java's attempted reads and backtracking.

The short plan also handles Unicode Strings directly and early candidates in regions larger than 64 KiB, without encoding or native allocation. Short-region literal searches are bounded by the region end, rather than scanning the rest of the String; full-input searches keep the existing String intrinsic. Large scans, longer digit tails that exceed the short-plan bound, and general expressions still select Java. The native leaf-call bound stays at 65,536 characters to bound time spent holding raw heap addresses without a safepoint.

## Measurement protocol

Three alternating enabled/disabled process pairs, one pinned CPU, ActiveProcessorCount=1, SerialGC, one compiler thread, two 200 ms warmups and three 200 ms measurements. JMH 1.37 uses separate JVM processes without child forks because this host has a process/thread quota. Values are means of three process means; raw records retain iteration statistics and the summary retains process ranges. Short warmups and shared-host variation limit small differences and comparisons with the older benchmark run.

RustRegexEndFlags times reset/find plus both hitEnd and requireEnd queries. `hit` is an early match, `captures` is an early named-capture match, `endHit` is a greedy numeric run through the region end, and `miss` has no candidate. `regionMiss` limits the Matcher to the first 64 characters of a large input with a candidate only beyond that region. Backend assertions verify that end queries and large early candidates retain the selected engine, while large general scans fall back. RustRegexNative's ordinary find cases are controls for unqueried matching.

[Raw JMH records](rust-regex-end-flags-benchmark-results.jsonl), [all paired summaries and ranges](rust-regex-end-flags-benchmark-summary.json), [exact commands](rust-regex-end-flags-benchmark-commands.txt): 354 measurements / 59 paired cases. These are exploratory microbenchmarks, not an all-workload no-regression proof. ARM emulation below is functional coverage, not a performance measurement.

## Match plus both end queries

| VM | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 4096 | captures | 843.5 | 102.9 | 8.20x |
| C1 | 4096 | endHit | 47512.8 | 14945.0 | 3.18x |
| C1 | 4096 | hit | 155.7 | 96.0 | 1.62x |
| C1 | 4096 | miss | 25795.8 | 349.7 | 73.76x |
| C1 | 64 | captures | 360.6 | 126.1 | 2.86x |
| C1 | 64 | endHit | 616.0 | 286.0 | 2.15x |
| C1 | 64 | hit | 128.8 | 106.4 | 1.21x |
| C1 | 64 | miss | 135.9 | 165.8 | 0.82x |
| C2 | 4096 | captures | 66.0 | 47.9 | 1.38x |
| C2 | 4096 | endHit | 14098.8 | 14773.6 | 0.95x |
| C2 | 4096 | hit | 83.4 | 47.4 | 1.76x |
| C2 | 4096 | miss | 13168.5 | 296.7 | 44.38x |
| C2 | 64 | captures | 121.6 | 59.7 | 2.04x |
| C2 | 64 | endHit | 217.3 | 92.0 | 2.36x |
| C2 | 64 | hit | 67.6 | 47.9 | 1.41x |
| C2 | 64 | miss | 96.4 | 53.9 | 1.79x |
| interpreter | 4096 | captures | 3903.8 | 2611.7 | 1.49x |
| interpreter | 4096 | endHit | 1031017.0 | 19634.4 | 52.51x |
| interpreter | 4096 | hit | 3490.1 | 1967.0 | 1.77x |
| interpreter | 4096 | miss | 177778.1 | 2073.9 | 85.72x |
| interpreter | 64 | captures | 3535.5 | 2415.9 | 1.46x |
| interpreter | 64 | endHit | 23808.4 | 6104.9 | 3.90x |
| interpreter | 64 | hit | 3148.1 | 2319.7 | 1.36x |
| interpreter | 64 | miss | 3511.6 | 3452.1 | 1.02x |

## Early matches in 131,072-character regions

| VM | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 131072 | captures | 181.2 | 99.2 | 1.83x |
| C1 | 131072 | hit | 130.1 | 95.6 | 1.36x |
| C2 | 131072 | captures | 65.2 | 43.6 | 1.50x |
| C2 | 131072 | hit | 57.8 | 53.4 | 1.08x |
| interpreter | 131072 | captures | 7253.0 | 2861.5 | 2.53x |
| interpreter | 131072 | hit | 4874.6 | 2685.9 | 1.81x |

## Ordinary matching controls

| VM | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 4096 | captures | 170.5 | 95.0 | 1.79x |
| C1 | 4096 | hit | 128.6 | 92.0 | 1.40x |
| C1 | 4096 | lateHit | 8951.5 | 373.5 | 23.97x |
| C1 | 4096 | miss | 8568.9 | 284.1 | 30.16x |
| C1 | 64 | captures | 161.4 | 98.7 | 1.63x |
| C1 | 64 | hit | 125.6 | 94.6 | 1.33x |
| C1 | 64 | lateHit | 210.9 | 166.1 | 1.27x |
| C1 | 64 | miss | 132.8 | 138.0 | 0.96x |
| C2 | 4096 | captures | 72.3 | 44.1 | 1.64x |
| C2 | 4096 | hit | 70.4 | 64.7 | 1.09x |
| C2 | 4096 | lateHit | 6755.4 | 355.4 | 19.01x |
| C2 | 4096 | miss | 9582.5 | 251.2 | 38.14x |
| C2 | 64 | captures | 69.6 | 44.0 | 1.58x |
| C2 | 64 | hit | 187.3 | 54.9 | 3.41x |
| C2 | 64 | lateHit | 159.2 | 129.9 | 1.23x |
| C2 | 64 | miss | 82.8 | 49.2 | 1.68x |
| interpreter | 4096 | captures | 3530.2 | 2159.5 | 1.63x |
| interpreter | 4096 | hit | 3772.0 | 2950.8 | 1.28x |
| interpreter | 4096 | lateHit | 167345.4 | 2366.8 | 70.71x |
| interpreter | 4096 | miss | 165546.0 | 2163.0 | 76.53x |
| interpreter | 64 | captures | 3465.7 | 2581.0 | 1.34x |
| interpreter | 64 | hit | 2938.9 | 2429.8 | 1.21x |
| interpreter | 64 | lateHit | 5216.2 | 3898.7 | 1.34x |
| interpreter | 64 | miss | 3575.4 | 3407.6 | 1.05x |

## Large Java fallback controls

| VM | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C2 | 131072 | endHit | 933290.9 | 283090.7 | 3.30x |
| C2 | 131072 | miss | 247593.5 | 235984.2 | 1.05x |

## 64-character regions in large Strings

| VM | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 131072 | regionMiss | 157.8 | 175.6 | 0.90x |
| C2 | 131072 | regionMiss | 97.5 | 49.5 | 1.97x |
| interpreter | 131072 | regionMiss | 3876.6 | 3746.5 | 1.03x |

## Limits and validation

Long C2 numeric runs can remain slower than Java, and short-input/fallback differences must be read with their process ranges. The exact end-state route removes permanent promotion for this grammar; it does not guarantee every matching workload gets faster. Cold native construction and shared-Pattern contention remain documented in the earlier [complete Pattern-workload measurements](rust-regex-native-results.md), which apply to the earlier Java revision and are not presented as fresh measurements of this change.

The final x86 JDK rebuild, all eight 303,226-comparison configurations, and both native-budget paths pass. AArch64 fastdebug/QEMU C1 and C2 run the new end-state/large-input checks and startup searches with CheckUnhandledOops; compiler logs verify native match intrinsics. The [validation transcript](rust-regex-end-flags-validation.txt) records commands and limits.

CI for the starting head had 90 successful jobs, one skipped job and six failures, all from the same missing-export compilation error. The module fix addresses that failure; the PR links the replacement CI run. Local jtreg remains blocked before test execution by the host's exhausted process/thread quota while probing the JDK version, also with Rust disabled in the harness. Direct execution is recorded separately and is not called a jtreg pass.

The [Rust optimization audit](rust-regex-optimization-audit.md) checks the live upstream guide and release settings, with isolated option trials and a reusable offline script. Regex 1.13.1 was reverified against the live stable index during this review. None of the tested compiler/engine switches provided a broad enough improvement to enable blindly.
