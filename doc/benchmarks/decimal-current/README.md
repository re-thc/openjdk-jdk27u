# Current dependency qualification

This report measures fast_float 8.3.2 (`42f254836ee416ffcf2f4e6576260003ac33d48c`)
and the coherent Żmij main pin (`31ee2b1287cfd51422466022ee7e4606a670543a`).
The control image at `00ff7addb7b9f4cb5f7f5c335b919b4e4dc15ef8` already contains
fast_float 8.3.2 and Żmij v1.2, on base `87edd79d3104ff502f7befec034716b081436f49`.
Its integer conversions are unchanged Java implementations. Floating-point
Java controls instead disable the relevant product flag in the measured image.
The old pre-PR comparison is retained in [the historical report](../decimal-original-baseline/README.md).

Integer native entries apply to interpreter-only execution. Tiered VMs retain
ordinary Java entries, bytecode profiling and C1/C2 compilation. Frame-free
successes during mixed execution changed profiles and slowed compiled code;
those paths are excluded from the shipped selection. The signed formatter
uses a scratch buffer and copies only the logical text, including UTF16.
Integer flags default on only for the measured Linux x86-64 configuration.
AArch64 has explicit-enable entries pending native performance qualification.

## Protocol

Linux x86-64, AMD EPYC 9V74, GCC 16.2, JMH 1.37, CPU 1 affinity. The managed
machine exposes five CPUs with a four-CPU quota and 16 GiB memory. No build,
test or other benchmark runs concurrently with the timed comparisons.

Every integer and pin comparison rotates control/current order over three
fresh forks. Each fork uses three warmups and three measurements of 500 ms,
GC allocation profiling, a 256 MiB heap and disabled CDS. Execution modes are
`-Xint`, `-Xbatch -XX:TieredStopAtLevel=1` and `-Xbatch -XX:-TieredCompilation`.
Short and wide integer datasets contain 1,024 deterministic values, seed
`0xDEC1A1`. UTF16 parsing disables Compact Strings. String results include
allocation; raw writers reuse destinations and include dispatch/call/bounds/
copy costs. Parsing consumes existing input Strings.

The parser runner uses three fresh forks per Java/native/JNI configuration.
Raw iteration samples, independent fork means, normalized allocation samples,
commands, source hashes, jar hashes and image hashes are preserved. Summaries
report both 99.9% Student-t intervals over nine measurements (df 8) and 95%
intervals over three independent fork means (df 2). Small overlapping differences
are inconclusive; native-core timing is not a JDK speedup estimate.

## Validation

The measured Linux release image passes 108 selected jtreg tests and 40,604
framework cases (8 TestNG, 40,596 JUnit). Coverage includes Float/Double,
Integer/Long, guarded decimal buffers, UTF16, grammar/overflow/error equivalence,
builders/concat boundaries, all BigDecimal/DecimalFormat/Formatter tests and
intrinsic controls. Twelve integer configurations each pass 460,184 assertions.
WhiteBox confirms ordinary C1/C2 compilation of all eight integer methods.

Production metadata verification checks 649 power entries and 25,635 inputs.
Supplementary full/shortest/compressed profiles each check 649/26,352 fixtures
under UBSan. The signed integer production bridge passes 3,604,716 guarded
checks in each native, scalar, no-int128, SSE4.1 and SSE4.1/no-int128 profile
under ASan/UBSan. Exact arrays, offsets, adjacent text and rejected bounds are
covered. These native checks establish correctness, not Java performance.

[Exact-head CI at `6f2dab5daf4`](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38198348084)
passed all 57 jobs, including native Linux x86-64/AArch64, macOS AArch64 and
Windows x86-64 debug/release builds and tier-1 tests. The repaired AArch64
interpreter generator also passed GCC 14.2 cross compilation; its pre-fix
source reproduced the original CI diagnostics with the same command.

Native ARM64/Windows performance remains unmeasured. The historical Linux
benchmark image and its source/image hashes are unchanged: its manifest
records the then-unbuilt AArch64-only stack-alignment correction. The later
AArch64 compiler repair and successful native CI qualify the PR source,
not that historical image on other platforms. No platform timing is inferred
from emulation or native-core data.

## Integer results

Ratios are original Java/current means in interpreter-only execution.

| Workload | Short ns, original → current | Wide ns, original → current | Short/wide speedup |
| --- | ---: | ---: | ---: |
| Signed int parsing | 653.43 → 50.60 | 1653.37 → 51.67 | 12.91× / 32.00× |
| Signed long parsing | 657.49 → 49.30 | 3213.58 → 54.82 | 13.34× / 58.62× |
| Unsigned int parsing | 656.52 → 49.64 | 1928.82 → 51.75 | 13.23× / 37.27× |
| Unsigned long parsing | 709.72 → 50.53 | 3820.67 → 57.13 | 14.05× / 66.87× |
| Integer.toString | 379.97 → 176.05 | 832.85 → 246.94 | 2.16× / 3.37× |
| Long.toString | 393.69 → 181.78 | 1656.13 → 389.32 | 2.17× / 4.25× |
| Long builder append, UTF16 | 1610.47 → 1181.43 | 3637.46 → 1609.02 | 1.36× / 2.26× |
| Long concat, UTF16 | 1298.24 → 890.02 | 3193.98 → 1097.62 | 1.46× / 2.91× |
| Raw int writer, Latin1 | 254.15 → 70.01 | 656.66 → 72.28 | 3.63× / 9.09× |
| Raw long writer, UTF16 | 378.51 → 71.38 | 1906.19 → 74.19 | 5.30× / 25.69× |

UTF16-input parsing improves 15.83–16.24× for short values and 41.86–86.43×
for wide values. Parsing remains allocation-free; tiny GC-profiler residuals
are harness overhead. String, builder and concat allocations match the control.
C1/C2 retain Java, with overlapping fork intervals and matching allocations;
no compiled integer speedup is claimed. Full tier/width tables and uncertainty
are in the CSVs and raw [measurement records](measurements.json).

## Floating-point results

Java controls use the same current image with the relevant feature disabled.

| Workload | Interpreter | C1 | C2 | C2 Java → native, ns | C2 Java → native, B/op |
| --- | ---: | ---: | ---: | ---: | ---: |
| Double parsing, short | 9.35× | 3.54× | 2.41× | 28.05 → 11.64 | 39.92 → 0.00 |
| Float parsing, short | 8.69× | 3.38× | 2.42× | 27.00 → 11.18 | 39.92 → 0.00 |
| Double parsing, decimals | 18.68× | 7.09× | 3.90× | 75.63 → 19.37 | 48.00 → 0.00 |
| Float parsing, decimals | 22.29× | 8.73× | 3.77× | 78.90 → 20.90 | 48.00 → 0.00 |
| Double parsing, long mantissa | 44.76× | 6.62× | 3.23× | 308.82 → 95.61 | 108.35 → 0.00 |
| Float parsing, long mantissa | 29.14× | 5.16× | 2.41× | 207.16 → 85.97 | 11.00 → 0.00 |
| Double.toString, random | 7.56× | 3.24× | 1.91× | 49.04 → 25.71 | 79.99 → 79.99 |
| Float.toString, random | 4.98× | 2.59× | 1.55× | 37.25 → 24.07 | 63.88 → 63.88 |
| Double.toString, short integer | 4.40× | 1.68× | 1.29× | 33.60 → 26.05 | 63.91 → 63.91 |
| Float.toString, short integer | 3.97× | 1.74× | 1.40× | 34.58 → 24.77 | 55.91 → 55.91 |
| Raw double writer, UTF16 | 19.99× | 3.31× | 1.92× | 39.30 → 20.46 | 0.00 → 0.00 |
| Raw float writer, UTF16 | 13.25× | 2.15× | 1.51× | 29.88 → 19.80 | 0.00 → 0.00 |

The direct native v1.2/main comparison has overlapping fork intervals for all
six formatting cases in every tier. There is no established floating-point
speedup from this pin change. The coherent main import supplies the measured
integer kernels while preserving floating-point correctness and performance.
Precision-consumer tests pass; these core timings do not establish additional
C2 BigDecimal, DecimalFormat or Formatter speedups.

The recorded VM `.text` grows by 14,656 bytes relative to `00ff7add` on this GCC
release build; [footprint.json](footprint.json) records the image hashes and sizes.

## Reproduction and evidence

[protocol.json](protocol.json) contains exact commands and benchmark/jar hashes.
[source-image.json](source-image.json) records production source and executable
hashes, including the explicitly unbuilt AArch64-only source correction.
The current image has production code matching the final Linux implementation;
documentation and benchmark-evidence commits do not change those files.

Run the recorded commands with the same two images and JMH jars, or use the
checked-in runners after building each source revision. Results are specific
to these workloads, modes and machine. The full raw JSONs/logs, checkpoint Git
bundle, validation logs and reproduction scripts are retained in the supporting
validation archive; the compact raw iteration/GC records are checked in here.
