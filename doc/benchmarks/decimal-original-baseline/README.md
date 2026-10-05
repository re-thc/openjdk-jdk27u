# Decimal conversion against the original JDK

These comparisons use the **pre-PR JDK at
`33e539f2d4a847f283a3793df6eebd41b9d1dfac` as the headline baseline**.
It contains neither native feature. The final image uses both features' default
settings; there are no enabling flags. The same benchmark class files and
input seeds run in both images. Earlier same-image opt-out tables remain in
[the parsing archive](../fast-float/README.md) and
[the formatting archive](../zmij/README.md), but their ratios are diagnostic
controls rather than speedups against the original JDK.

The frozen measured source is local commit
`cfbc2f3ce028`: [source-manifest.json](source-manifest.json) records its full
hash, every changed runtime/vendor/microbenchmark source hash, VM/module
hashes and release metadata. The published review adds consumer-test fixtures and documentation and merges
remote maintenance tools without changing the measured runtime/vendor/microbenchmark
sources. Maintenance-only differences are recorded separately in the manifest. The
original JDK has an exploded module layout; the final image is packaged.
CDS is disabled in both, and warmups precede measured conversions.

## Protocol and interpretation

Intel Xeon Platinum 8370C, Linux x86-64, GCC 14.2 release server VMs,
JMH 1.37, one thread pinned to CPU 4, four-core cgroup quota, fixed 256 MiB
heap. No local builds/tests run alongside timed benchmarks. Interpreter uses
`-Xint`; C1 uses `-Xbatch -XX:TieredStopAtLevel=1`; C2 uses
`-Xbatch -XX:-TieredCompilation`. Every invocation converts 1,024 deterministic
values and consumes every result. Allocation figures are from `-prof gc`.

The full matrix has three independent forks per variant, each with three
500 ms warmups and three 500 ms measurements. Original/final order reverses
in round two. Constructor controls use three one-second warmups/measurements
and rotate previous/final/original-constructor order. Longer C2 confirmation
uses five one-second warmups/measurements, rotating original/final/opt-out
order over three forks. The opt-out there is a diagnostic control; conclusions
still compare final against original.

Ratios are original/default means. A ratio below 1 means a higher measured
mean; a ratio alone does not establish a repeatable regression. **Cloud outliers
are substantial in the short C2 formatting samples.** All samples are retained,
including unfavorable ones. Detailed tables show 99.9% Student-t intervals:
nine observations (df=8, critical value 5.041305) for the main matrix and
constructor controls; fifteen (df=14, 4.140454) for the longer confirmation.
Overlapping intervals do not establish either a gain or a loss. Allocation is
usually much steadier. These workloads and intervals cannot prove universal
performance or regression freedom.

[measurements.json](measurements.json) records raw timing/allocation iteration
values, fork identifiers, VM arguments and iteration durations.
[measure.sh](measure.sh) and [precision-control.sh](precision-control.sh) record
the exact benchmark selections/order. Adjust their image/classpath/root/CPU
paths to reproduce. Compile the shared JMH classes as described in
[the parser notes](../../fast-float.md) and [formatter notes](../../zmij.md).

## Parse against the original JDK

| Workload | Interpreter | C1 | C2 | C2 original → default, ns | C2 original → default, B/op |
| --- | ---: | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 7.73× | 4.47× | 2.25× | 37.01 → 16.47 | 39.92 → 0.00 |
| Float, 1–3 digits | 7.59× | 4.38× | 2.67× | 46.07 → 17.26 | 39.92 → 0.00 |
| Double, ordinary decimals | 14.57× | 6.28× | ~4.95× | 157.81 → 31.86 | 56.00 → 0.00 |
| Float, ordinary decimals | 18.14× | 8.09× | 3.73× | 131.39 → 35.22 | 56.00 → 0.00 |
| Double, round trips | 19.08× | 8.18× | 4.51× | 158.17 → 35.08 | 56.00 → 0.00 |
| Float, round trips | 16.51× | 6.52× | 3.27× | 96.00 → 29.33 | 48.00 → 0.00 |
| Double, long mantissas | 34.91× | 7.43× | 4.03× | 545.18 → 135.12 | 114.44 → 0.00 |
| Float, long mantissas | 30.93× | 6.16× | 2.62× | 306.11 → 116.82 | 11.68 → 0.00 |
| DigitList, 20–21 digits | 10.26× | 2.01× | ~1.23× | 31.81 → 25.85 | 24.51 → 0.00 |
| DigitList, about 60 digits | 8.59× | 1.92× | ~1.29× | 31.65 → 24.57 | 24.92 → 0.00 |
| BigDecimal → double, cached | 9.38× | 3.31× | ~1.91× | 220.22 → 115.43 | 321.85 → 14.17 |
| BigDecimal → float, cached | 12.36× | 2.90× | ~1.31× | 149.33 → 114.06 | 307.94 → 0.38 |

## Format against the original JDK

| Workload | Interpreter | C1 | C2 | C2 original → default, ns | C2 original → default, B/op |
| --- | ---: | ---: | ---: | ---: | ---: |
| Double.toString, random | 5.57× | 3.78× | 1.38×¹ | 68.06 → 49.31 | 103.34 → 103.34 |
| Float.toString, random | 3.25× | 2.77× | ~1.30×¹ | 60.39 → 46.60 | 83.60 → 83.60 |
| Double builder append | 4.25× | 3.04× | ~2.07× | 223.13 → 107.83 | 167.34 → 167.34 |
| Float builder append | ~2.31× | ~1.25× | ~0.92×¹ | 55.05 → 59.61 | 83.60 → 83.60 |
| Float concatenation | 2.71× | ~1.45× | ~1.17×¹ | 60.87 → 52.18 | 115.64 → 115.64 |
| Double raw Latin1 | 12.93× | 6.00× | ~2.14× | 78.82 → 36.82 | 0.00 → 0.00 |
| BigDecimal.valueOf, short integers | ~1.08× | ~1.24× | ~1.36× | 30.12 → 22.17 | 111.91 → 31.91 |
| BigDecimal.valueOf, random | 1.84× | ~1.78× | ~1.41×¹ | 52.67 → 37.45 | 112.00 → 32.00 |
| DecimalFormat, decimals | ~1.40× | ~1.53× | ~2.07× | 777.40 → 375.52 | 253.57 → 213.57 |
| Formatter, %.9g | ~0.83× | ~1.42× | ~1.10× | 449.63 → 407.25 | 544.13 → 504.13 |
| Double.toString, tiny subnormals | 4.15× | 2.81× | ~1.19× | 81.90 → 68.83 | 88.00 → 88.00 |
| Float.toString, tiny subnormals | 3.36× | 2.87× | ~1.19× | 79.16 → 66.47 | 80.00 → 80.00 |

¹ C2 uses the longer paired confirmation for these five formatting workloads; the complete initial 500 ms matrix is retained in the detailed tables. A tilde (~) marks overlapping 99.9% intervals: the ratio is inconclusive.

## What the comparisons establish

Direct String parsing shows clear gains across the three tiers for most selected
workloads. Canonical double Strings improve in interpreter/C1 and in the longer
C2 comparison (68.06 ± 6.44 → 49.31 ± 7.62 ns, 1.38×). Float's longer C2
mean ratio is 1.30×, with overlapping intervals. Float concatenation and append
are near-neutral in C2 (inconclusive ratios 1.17× and 0.92×); no 2× concatenation
gain is claimed. Precision-consumer C2 timings remain too variable for a strong
speed claim. The original short C2 outliers are retained below, including the
unfavorable double-string and BigDecimal samples.

Allocation reductions are clearer: C2 BigDecimal.valueOf uses 31.91 rather than
111.91 B/op for short integers, and 32 rather than 112 B/op for random values.
DecimalFormat and Formatter save about 40 B/op. C1/interpreter canonical String
construction saves about 24 B/op. Direct String parsing effectively eliminates
its conversion allocation. Tiny-subnormal text conversion shows clear gains
in interpreter/C1; its C2 intervals overlap.

## Defaults and JNI-only ports

Both product flags remain opt-out. Parsing defaults to the portable parser on
all platforms; interpreter/C1 leaf entries exist on little-endian x86-64 and
AArch64, and C2 has a portable leaf-call integration. Zero and unsupported
entries use JNI. There is no backend-specific small-String gate. The existing
short digit-buffer and cold BigDecimal Java gates remain.

Forced JNI below disables `_parseFastFloat` and `_parseFastFloatDigits` in the
final x86 VM. It measures transition overhead separately from the default
leaf path. It does **not** establish a win on another architecture or operating
system. Small JNI conversions can lose enough of the algorithm's gain to be
neutral or slower than the original Java parser. Default-on JNI on unmeasured
ports is a fork policy, not a universal performance claim. Native Windows and
ARM64 timings remain unmeasured; QEMU results are correctness evidence only.

## String ownership and copying

Canonical compact Strings allocate an exact-sized owned byte array, copy the
reserved formatter buffer into it and use the internal Latin1 constructor.
The original mutable buffer is never transferred. Noncompact/opt-out Strings
and StringBuilder.toString retain the original copying constructor. Thus the
old PR description claiming the original constructor everywhere was incorrect.

The constructor control patches **only ToDecimal.class** in the final VM,
replacing the owned-array path with the original public ISO-8859-1 String
constructor. Compile with `-implicit:none` and a patch source directory
containing only ToDecimal.java, rather than the full java.base tree. The
previous image is the published `e9dbce2b547` source. Previous/final/control
allocation and timing are recorded below, including float append/concatenation
controls for the additional rare subnormal branch.

A direct native destination write was investigated for capacity. Upstream
requires 17 bytes for float and 34 for double, including padding for wide
stores, while Java callers reserve 15 and 24 characters. The current 40-byte
stack buffer safely contains those stores; bounded copying/widening stays
within the caller's reservation. Removing that copy without widening the
caller contract would be unsafe. No unverified direct-write change is retained.

## Linked footprint and vendor upgrades

The portable and SSE4.1 units previously retained explicit precision,
hexadecimal and long-double template instantiations. The tracked shortest-only
patch suppresses the instantiation footer; used templates instantiate normally.
Actual linked `libjvm.so` symbols, rather than source size, show vendor function
text falling **41,314 → 6,391 bytes** (40 → 7 functions, 34,923 bytes / 84.5%
less). This percentage applies only to those named vendor functions, not the
whole VM. The complete VM `.text` falls **16,983,534 → 16,936,686 bytes**
(46,848 bytes); `.rodata` falls 256 bytes. Other retained sections are recorded
in [footprint.json](footprint.json).

The decimal-metadata bridge intentionally uses vendor internals. The updater
now compiles the **same production bridge** against the staged import before
installing any files. Exact integer arithmetic checks all 649 normalized
128-bit power entries and 25,635 deterministic inputs for round trips,
significand/exponent bounds, packed width, exactness and rounding direction.
GCC and Clang checks pass (141 exact and 9,946 away cases). A deliberately
corrupted power entry is rejected, and a compiler failure leaves installed
vendor/license/version files unchanged. [Update instructions](../../zmij.md)
explain the host C++17 compiler requirement and all three tracked patches.
The remotely added checker is also retained: 26,352 fixtures pass in full,
shortest-only and compressed-table UBSan profiles against the shared bridge.

## Permitted rendering difference

This fork accepts the vendor's shortest meaningful significand when it
round-trips to the same raw float/double. In particular Float.MIN_VALUE renders
as `1.0E-45` and Double.MIN_VALUE as `5.0E-324`; their stock choices are
`1.4E-45` and `4.9E-324`. Mandatory `.0` keeps these examples' character count
the same. The opt-out retains stock selection. Notation, signed-zero/special
spelling and destination bounds remain checked. Precision consumers keep
stock metadata for tiny values, preserving BigDecimal scale and Formatter/
DecimalFormat rounding. The independent mathematical checker tests minimum
meaningful length, closest equal-length decimal and tie rounding under both
selection policies; consumer fixtures accept the two approved renderings.

## Rejected float-append experiment

A prototype removed the tiny-subnormal native append branch and let the Java
float kernel use one meaningful digit when the feature was enabled. C2 compact
and UTF16 round-trip/metadata/destination checks passed. In three paired forks,
float append measured 52.93 ± 2.57 ns for production and 61.07 ± 28.17 ns for
the prototype, with 83.60 B/op in both. Float concatenation was 51.27 ± 15.24
versus 47.79 ± 3.93 ns; canonical float Strings 42.78 ± 9.43 versus
39.68 ± 2.81 ns. There was no reliable overall gain, so it is not retained.
The [patch](java-shortest.patch) and [raw values](java-shortest-results.json)
record the rejected change rather than silently replacing production samples.

## Detailed samples and controls

## Parse interpreter details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 2636.62 ± 497.25 | 341.30 ± 20.19 | 39.95 | 0.00 |
| Float, 1–3 digits | 2536.07 ± 184.20 | 333.96 ± 8.13 | 39.95 | 0.00 |
| Double, ordinary decimals | 6790.93 ± 578.53 | 466.24 ± 103.22 | 56.08 | 0.01 |
| Float, ordinary decimals | 8254.05 ± 1702.67 | 455.04 ± 59.04 | 56.10 | 0.01 |
| Double, round trips | 9015.51 ± 653.55 | 472.62 ± 105.33 | 56.11 | 0.01 |
| Float, round trips | 8270.89 ± 5780.72 | 501.10 ± 79.85 | 48.10 | 0.01 |
| Double, long mantissas | 26650.55 ± 4243.34 | 763.42 ± 462.54 | 114.76 | 0.01 |
| Float, long mantissas | 19627.16 ± 7413.19 | 634.63 ± 51.59 | 11.92 | 0.01 |
| DigitList, 20–21 digits | 1353.09 ± 700.54 | 131.94 ± 24.35 | 24.52 | 0.00 |
| DigitList, about 60 digits | 1177.00 ± 167.27 | 137.08 ± 36.84 | 24.94 | 0.00 |
| BigDecimal → double, cached | 13378.24 ± 1066.56 | 1426.38 ± 207.43 | 341.23 | 14.19 |
| BigDecimal → float, cached | 12000.67 ± 2859.91 | 971.03 ± 156.94 | 327.30 | 0.39 |

## Parse c1 details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 84.53 ± 18.14 | 18.91 ± 0.44 | 39.92 | 0.00 |
| Float, 1–3 digits | 91.79 ± 54.25 | 20.94 ± 0.91 | 39.92 | 0.00 |
| Double, ordinary decimals | 239.81 ± 19.34 | 38.19 ± 4.10 | 56.00 | 0.00 |
| Float, ordinary decimals | 334.90 ± 122.75 | 41.38 ± 3.22 | 56.00 | 0.00 |
| Double, round trips | 358.13 ± 88.25 | 43.78 ± 2.61 | 56.00 | 0.00 |
| Float, round trips | 245.43 ± 79.07 | 37.63 ± 1.58 | 48.00 | 0.00 |
| Double, long mantissas | 993.62 ± 258.95 | 133.71 ± 8.92 | 114.45 | 0.00 |
| Float, long mantissas | 755.45 ± 289.42 | 122.60 ± 4.08 | 11.69 | 0.00 |
| DigitList, 20–21 digits | 56.26 ± 10.54 | 27.98 ± 1.03 | 24.51 | 0.00 |
| DigitList, about 60 digits | 54.41 ± 1.61 | 28.35 ± 1.56 | 24.92 | 0.00 |
| BigDecimal → double, cached | 407.86 ± 73.62 | 123.38 ± 11.26 | 341.07 | 14.17 |
| BigDecimal → float, cached | 335.75 ± 141.80 | 115.87 ± 7.31 | 327.16 | 0.38 |

## Parse c2 details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 37.01 ± 4.11 | 16.47 ± 6.59 | 39.92 | 0.00 |
| Float, 1–3 digits | 46.07 ± 17.83 | 17.26 ± 3.15 | 39.92 | 0.00 |
| Double, ordinary decimals | 157.81 ± 180.48 | 31.86 ± 4.80 | 56.00 | 0.00 |
| Float, ordinary decimals | 131.39 ± 22.71 | 35.22 ± 5.82 | 56.00 | 0.00 |
| Double, round trips | 158.17 ± 46.02 | 35.08 ± 3.23 | 56.00 | 0.00 |
| Float, round trips | 96.00 ± 26.65 | 29.33 ± 1.04 | 48.00 | 0.00 |
| Double, long mantissas | 545.18 ± 50.61 | 135.12 ± 33.98 | 114.44 | 0.00 |
| Float, long mantissas | 306.11 ± 64.31 | 116.82 ± 5.09 | 11.68 | 0.00 |
| DigitList, 20–21 digits | 31.81 ± 12.26 | 25.85 ± 4.65 | 24.51 | 0.00 |
| DigitList, about 60 digits | 31.65 ± 12.53 | 24.57 ± 1.73 | 24.92 | 0.00 |
| BigDecimal → double, cached | 220.22 ± 237.56 | 115.43 ± 34.17 | 321.85 | 14.17 |
| BigDecimal → float, cached | 149.33 ± 27.28 | 114.06 ± 36.81 | 307.94 | 0.38 |

## Format interpreter details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double.toString, random | 3849.40 ± 396.52 | 690.89 ± 58.73 | 127.38 | 103.34 |
| Float.toString, random | 2396.21 ± 157.83 | 737.44 ± 94.96 | 107.63 | 83.61 |
| Double builder append | 5456.28 ± 1502.83 | 1282.76 ± 217.96 | 167.40 | 167.35 |
| Float builder append | 2847.27 ± 733.46 | 1231.74 ± 1017.87 | 107.64 | 107.62 |
| Float concatenation | 5095.17 ± 1391.94 | 1881.56 ± 358.88 | 163.70 | 139.66 |
| Double raw Latin1 | 3708.24 ± 2061.59 | 286.89 ± 110.89 | 0.05 | 0.00 |
| BigDecimal.valueOf, short integers | 991.85 ± 162.57 | 917.43 ± 255.86 | 111.92 | 71.92 |
| BigDecimal.valueOf, random | 2051.66 ± 359.37 | 1115.51 ± 403.28 | 112.03 | 72.01 |
| DecimalFormat, decimals | 26092.84 ± 12122.70 | 18639.38 ± 5866.81 | 253.88 | 213.79 |
| Formatter, %.9g | 35611.23 ± 2686.76 | 42868.75 ± 27702.63 | 568.55 | 528.63 |
| Double.toString, tiny subnormals | 3037.41 ± 268.05 | 731.15 ± 92.28 | 112.04 | 88.01 |
| Float.toString, tiny subnormals | 2606.26 ± 803.59 | 775.70 ± 276.79 | 104.03 | 80.01 |

## Format c1 details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double.toString, random | 248.81 ± 129.23 | 65.84 ± 30.88 | 127.34 | 103.34 |
| Float.toString, random | 175.23 ± 64.37 | 63.17 ± 30.75 | 107.60 | 83.60 |
| Double builder append | 279.30 ± 87.38 | 92.02 ± 5.72 | 167.34 | 167.34 |
| Float builder append | 161.07 ± 76.15 | 128.98 ± 93.42 | 107.60 | 107.60 |
| Float concatenation | 193.72 ± 67.96 | 133.60 ± 100.43 | 163.64 | 139.64 |
| Double raw Latin1 | 195.29 ± 79.14 | 32.54 ± 3.36 | 0.00 | 0.00 |
| BigDecimal.valueOf, short integers | 60.32 ± 28.61 | 48.50 ± 17.80 | 111.91 | 71.91 |
| BigDecimal.valueOf, random | 155.23 ± 57.51 | 87.45 ± 29.98 | 112.00 | 72.00 |
| DecimalFormat, decimals | 889.77 ± 613.04 | 580.58 ± 91.58 | 253.57 | 213.57 |
| Formatter, %.9g | 1130.14 ± 375.29 | 793.30 ± 161.00 | 568.14 | 528.13 |
| Double.toString, tiny subnormals | 177.69 ± 73.81 | 63.32 ± 24.00 | 112.00 | 88.00 |
| Float.toString, tiny subnormals | 145.91 ± 36.83 | 50.88 ± 2.86 | 104.00 | 80.00 |

## Format c2 details

| Workload | Original ns | Default ns | Original B/op | Default B/op |
| --- | ---: | ---: | ---: | ---: |
| Double.toString, random | 107.48 ± 71.01 | 137.74 ± 193.82 | 103.34 | 103.34 |
| Float.toString, random | 73.96 ± 29.80 | 54.62 ± 28.48 | 83.60 | 83.60 |
| Double builder append | 223.13 ± 377.91 | 107.83 ± 50.87 | 167.34 | 167.34 |
| Float builder append | 66.09 ± 18.61 | 82.99 ± 38.72 | 83.60 | 83.60 |
| Float concatenation | 80.73 ± 36.25 | 65.21 ± 32.43 | 115.64 | 115.64 |
| Double raw Latin1 | 78.82 ± 40.31 | 36.82 ± 10.30 | 0.00 | 0.00 |
| BigDecimal.valueOf, short integers | 30.12 ± 18.94 | 22.17 ± 9.22 | 111.91 | 31.91 |
| BigDecimal.valueOf, random | 42.19 ± 12.45 | 90.91 ± 89.97 | 112.00 | 32.00 |
| DecimalFormat, decimals | 777.40 ± 1242.25 | 375.52 ± 291.66 | 253.57 | 213.57 |
| Formatter, %.9g | 449.63 ± 311.50 | 407.25 ± 224.77 | 544.13 | 504.13 |
| Double.toString, tiny subnormals | 81.90 ± 40.14 | 68.83 ± 30.79 | 88.00 | 88.00 |
| Float.toString, tiny subnormals | 79.16 ± 39.28 | 66.47 ± 35.18 | 80.00 | 80.00 |

## Forced JNI parsing interpreter

| Workload | Original ns | Default leaf ns | Forced JNI ns | Original / JNI |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 2636.62 ± 497.25 | 341.30 ± 20.19 | 399.91 ± 40.48 | 6.59× |
| Float, 1–3 digits | 2536.07 ± 184.20 | 333.96 ± 8.13 | 479.19 ± 284.38 | 5.29× |
| Double, ordinary decimals | 6790.93 ± 578.53 | 466.24 ± 103.22 | 526.49 ± 114.06 | 12.90× |
| Float, ordinary decimals | 8254.05 ± 1702.67 | 455.04 ± 59.04 | 616.87 ± 317.09 | 13.38× |

## Forced JNI parsing c1

| Workload | Original ns | Default leaf ns | Forced JNI ns | Original / JNI |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 84.53 ± 18.14 | 18.91 ± 0.44 | 38.53 ± 9.33 | 2.19× |
| Float, 1–3 digits | 91.79 ± 54.25 | 20.94 ± 0.91 | 45.04 ± 14.29 | 2.04× |
| Double, ordinary decimals | 239.81 ± 19.34 | 38.19 ± 4.10 | 60.61 ± 23.92 | 3.96× |
| Float, ordinary decimals | 334.90 ± 122.75 | 41.38 ± 3.22 | 70.42 ± 24.58 | 4.76× |

## Forced JNI parsing c2

| Workload | Original ns | Default leaf ns | Forced JNI ns | Original / JNI |
| --- | ---: | ---: | ---: | ---: |
| Double, 1–3 digits | 37.01 ± 4.11 | 16.47 ± 6.59 | 35.08 ± 7.84 | 1.05× |
| Float, 1–3 digits | 46.07 ± 17.83 | 17.26 ± 3.15 | 32.26 ± 1.37 | 1.43× |
| Double, ordinary decimals | 157.81 ± 180.48 | 31.86 ± 4.80 | 46.20 ± 1.89 | 3.42× |
| Float, ordinary decimals | 131.39 ± 22.71 | 35.22 ± 5.82 | 53.58 ± 8.40 | 2.45× |

## Canonical String constructor control (C2)

| Workload | Previous PR ns | Final ns | Original constructor control ns | Previous → final → control, B/op |
| --- | ---: | ---: | ---: | ---: |
| Double.toString, random | 44.54 ± 2.04 | 44.37 ± 4.64 | 82.07 ± 23.20 | 103.34 → 103.34 → 103.34 |
| Float.toString, random | 39.20 ± 2.83 | 39.96 ± 3.61 | 80.20 ± 7.65 | 83.60 → 83.60 → 83.60 |
| Float concatenation | 49.62 ± 5.89 | 46.02 ± 3.12 | 48.48 ± 3.54 | 115.64 → 115.64 → 115.64 |
| Float builder append | 53.63 ± 3.61 | 58.99 ± 20.45 | 55.90 ± 11.90 | 83.60 → 83.60 → 83.60 |

## Longer C2 confirmation against the original JDK

| Workload | Original ns | Final default ns | Final opt-out control ns | Original / default | Original → default, B/op |
| --- | ---: | ---: | ---: | ---: | ---: |
| Double.toString, random | 68.06 ± 6.44 | 49.31 ± 7.62 | 67.52 ± 4.67 | 1.38× | 103.34 → 103.34 |
| Float.toString, random | 60.39 ± 18.04 | 46.60 ± 13.56 | 58.94 ± 10.89 | 1.30× | 83.60 → 83.60 |
| Float concatenation | 60.87 ± 11.73 | 52.18 ± 13.61 | 64.40 ± 5.51 | 1.17× | 115.64 → 115.64 |
| Float builder append | 55.05 ± 10.24 | 59.61 ± 13.59 | 69.97 ± 21.07 | 0.92× | 83.60 → 83.60 |
| BigDecimal.valueOf, random | 52.67 ± 26.06 | 37.45 ± 6.81 | 38.56 ± 4.29 | 1.41× | 112.00 → 32.00 |

## Validation

The release sweep initially passed 242 of 243 selected jtreg tests, with 46,545
framework cases. Its remaining ValueOfDouble fixture assumed textual identity
between Double.toString and BigDecimal.valueOf for Double.MIN_VALUE. The fixture
now explicitly requires the retained BigDecimal precision/scale, including the
negative value; its targeted rerun passes. All 243 selected results are now
passing. The two other revised String fixtures also pass. The six unchanged
huge-memory String tests were excluded from this repeat after passing the prior
full validation; they are listed in [validation.txt](validation.txt).

The remotely added String ownership test is retained; the merged TestZmij/ZGC
and SSE2 suite passes all three selected tests. Both update checkers pass
before the combined updater installs byte-for-byte matching vendor files.

Eight targeted tests pass on GCC no-PCH fastdebug and eight on the rebuilt
Clang VM. Two tests pass on Zero fastdebug (four compiler/collector-specific
IDs correctly do not meet its platform requirements). AArch64 fastdebug under
QEMU passes both parser/formatter checks in C1 and C2 with noncompact Strings.
The official debug-only TestIncludesAreSorted passes; read-only sorting also
passes over Linux/POSIX/shared sources and the x86 SSE unit. An expanded check
found the unrelated oops/method.hpp order issue in the interpreter file, also
present in the pre-PR source; it is outside the official test scope.

Release image, GCC no-PCH fastdebug, Clang 19, AArch64 cross and Zero builds
pass. The vendor updater reproduces the installed files; GCC/Clang assumption
checks and negative update controls pass. [Validation details](validation.txt)
record the commands, results and limits. Native Windows/macOS CI is triggered
by the published follow-up; its result is reported separately in the PR.
