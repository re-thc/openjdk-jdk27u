# Żmij measurements and validation

Measured on 2026-10-04 UTC with JMH 1.37, GCC 14.2.0, Intel Xeon Platinum
8370C, Linux x86-64 and a release server JVM. Five logical CPUs are exposed,
with a four-core quota. One worker is pinned to CPU 4; no builds or tests run
concurrently. Each benchmark uses three fresh forks, three 500 ms warmups and
three 500 ms measurements, a fixed 256 MiB heap, and 1,024 deterministic values
per invocation. Times are **mean ns/conversion ± JMH 99.9% confidence interval**.
Speedups are ratios of means, not guarantees for other machines. String and
builder workloads include allocation; raw output reuses a destination array.

The same final packaged image runs all three variants: Java selects
`-XX:-UseZmijIntrinsics`; native enables the product flag; JNI enables it but
disables `_formatZmij` and `_decimalZmij`. C2 float builder append is deliberately
gated to Java when the native flag is enabled, while float canonical strings and raw output
still use native conversion. Interpreter uses `-Xint`, C1 uses
`-Xbatch -XX:TieredStopAtLevel=1`, and C2 uses `-Xbatch -XX:-TieredCompilation`.
[Environment and binary hashes](environment.txt), [validation](validation.txt),
raw JSON, [benchmark source](../../../test/micro/org/openjdk/bench/java/lang/ZmijFormatting.java),
and [reproduction instructions](../../zmij.md) accompany these tables.

Cloud timing variation is visible in the confidence intervals and fork samples.
Overlapping intervals, particularly allocation-heavy formatting and untouched
control paths, do not establish a regression or improvement. Every measured
workload is shown, including near-neutral results. JNI is a functional fallback;
its transition cost can erase the native algorithm's benefit for short values.

## Interpreter

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| BigDecimal.valueOf: 1–3 digit integers | 1088.34 ± 126.46 | 938.11 ± 104.92 | 788.76 ± 33.64 | 1.16× |
| BigDecimal.valueOf: finite random doubles | 2019.35 ± 177.40 | 976.14 ± 30.56 | 952.91 ± 113.49 | 2.07× |
| DecimalFormat: ordinary decimals | 21573.72 ± 2316.08 | 17974.42 ± 680.11 | 18095.49 ± 2951.06 | 1.20× |
| Double: StringBuilder append | 5489.40 ± 333.07 | 1211.36 ± 168.24 | 1411.30 ± 479.17 | 4.53× |
| Double: UTF16 StringBuilder append | 12710.72 ± 2918.42 | 1791.51 ± 217.49 | 1823.38 ± 153.94 | 7.09× |
| Double: string concatenation | 10479.69 ± 631.11 | 1976.57 ± 231.91 | 1938.16 ± 90.34 | 5.30× |
| Double.toString: ordinary decimals | 5485.37 ± 1349.98 | 755.42 ± 98.69 | 746.67 ± 105.79 | 7.26× |
| Double.toString: NaNs (Java path) | 280.86 ± 113.74 | 229.29 ± 24.47 | 236.75 ± 13.81 | 1.22× |
| Double: raw Latin1 output | 3778.76 ± 2200.23 | 296.73 ± 59.82 | 422.80 ± 210.12 | 12.73× |
| Double: raw UTF16 output | 5931.07 ± 1507.21 | 306.68 ± 105.40 | 413.09 ± 270.14 | 19.34× |
| Double.toString: finite random | 4212.43 ± 1112.04 | 789.98 ± 193.85 | 685.05 ± 58.61 | 5.33× |
| Double.toString: 1–3 digit integers | 2417.03 ± 191.62 | 711.63 ± 75.22 | 653.26 ± 30.37 | 3.40× |
| Double.toString: signed zeros (Java path) | 259.59 ± 53.90 | 258.35 ± 21.22 | 237.74 ± 50.43 | 1.00× |
| Float16.toString: finite random (Java control) | 1839.65 ± 114.51 | 2259.04 ± 744.25 | 2181.40 ± 621.80 | 0.81× |
| Float: StringBuilder append | 2975.87 ± 560.20 | 1106.95 ± 187.77 | 1262.24 ± 249.57 | 2.69× |
| Float: string concatenation | 5517.85 ± 1002.07 | 2022.64 ± 388.03 | 1962.33 ± 167.56 | 2.73× |
| Float: raw Latin1 output | 1694.90 ± 31.91 | 270.09 ± 12.67 | 291.68 ± 14.61 | 6.28× |
| Float.toString: finite random | 3077.58 ± 1204.34 | 724.86 ± 130.49 | 744.88 ± 102.89 | 4.25× |
| Float.toString: 1–3 digit integers | 2337.16 ± 566.49 | 673.81 ± 64.45 | 805.43 ± 341.25 | 3.47× |
| Formatter: ordinary decimals, %.9g | 40459.12 ± 6149.18 | 31335.40 ± 3406.67 | 32658.20 ± 4084.84 | 1.29× |

## C1

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| BigDecimal.valueOf: 1–3 digit integers | 46.37 ± 2.61 | 37.23 ± 4.92 | 37.93 ± 8.62 | 1.25× |
| BigDecimal.valueOf: finite random doubles | 119.13 ± 8.14 | 69.91 ± 5.75 | 114.05 ± 111.13 | 1.70× |
| DecimalFormat: ordinary decimals | 667.60 ± 318.15 | 535.55 ± 46.86 | 564.49 ± 19.52 | 1.25× |
| Double: StringBuilder append | 242.82 ± 113.83 | 82.85 ± 2.27 | 108.99 ± 3.29 | 2.93× |
| Double: UTF16 StringBuilder append | 238.90 ± 13.79 | 146.91 ± 26.45 | 166.89 ± 32.85 | 1.63× |
| Double: string concatenation | 251.24 ± 47.28 | 100.28 ± 10.96 | 142.40 ± 64.50 | 2.51× |
| Double.toString: ordinary decimals | 186.37 ± 18.65 | 52.23 ± 3.22 | 71.07 ± 7.32 | 3.57× |
| Double.toString: NaNs (Java path) | 14.71 ± 2.95 | 14.24 ± 1.85 | 12.92 ± 1.21 | 1.03× |
| Double: raw Latin1 output | 150.59 ± 18.22 | 31.11 ± 1.43 | 50.14 ± 2.55 | 4.84× |
| Double: raw UTF16 output | 135.89 ± 10.20 | 36.72 ± 0.85 | 68.53 ± 5.77 | 3.70× |
| Double.toString: finite random | 190.56 ± 40.86 | 55.93 ± 17.88 | 75.03 ± 6.66 | 3.41× |
| Double.toString: 1–3 digit integers | 110.89 ± 39.49 | 54.66 ± 5.01 | 75.58 ± 23.65 | 2.03× |
| Double.toString: signed zeros (Java path) | 13.28 ± 1.99 | 13.40 ± 4.10 | 13.10 ± 2.70 | 0.99× |
| Float16.toString: finite random (Java control) | 117.01 ± 36.92 | 131.27 ± 126.98 | 104.44 ± 34.08 | 0.89× |
| Float: StringBuilder append | 153.60 ± 88.07 | 70.55 ± 1.87 | 90.22 ± 6.87 | 2.18× |
| Float: string concatenation | 175.56 ± 10.93 | 100.25 ± 22.97 | 105.37 ± 9.62 | 1.75× |
| Float: raw Latin1 output | 89.75 ± 12.99 | 29.75 ± 8.12 | 52.53 ± 13.28 | 3.02× |
| Float.toString: finite random | 125.69 ± 4.70 | 52.64 ± 9.34 | 71.04 ± 6.15 | 2.39× |
| Float.toString: 1–3 digit integers | 83.95 ± 8.55 | 57.48 ± 9.97 | 85.62 ± 50.73 | 1.46× |
| Formatter: ordinary decimals, %.9g | 844.68 ± 170.88 | 735.49 ± 49.53 | 759.88 ± 129.87 | 1.15× |

## C2

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| BigDecimal.valueOf: 1–3 digit integers | 24.41 ± 1.71 | 20.25 ± 2.03 | 30.13 ± 24.42 | 1.21× |
| BigDecimal.valueOf: finite random doubles | 36.92 ± 2.36 | 40.33 ± 15.57 | 35.01 ± 2.74 | 0.92× |
| DecimalFormat: ordinary decimals | 283.70 ± 21.62 | 293.10 ± 62.20 | 299.41 ± 44.36 | 0.97× |
| Double: StringBuilder append | 98.17 ± 22.63 | 69.01 ± 6.99 | 85.78 ± 8.50 | 1.42× |
| Double: UTF16 StringBuilder append | 99.03 ± 6.67 | 99.80 ± 26.29 | 137.42 ± 38.23 | 0.99× |
| Double: string concatenation | 70.53 ± 12.91 | 51.85 ± 2.45 | 84.01 ± 18.06 | 1.36× |
| Double.toString: ordinary decimals | 75.80 ± 5.57 | 51.93 ± 13.68 | 84.58 ± 40.57 | 1.46× |
| Double.toString: NaNs (Java path) | 1.15 ± 0.12 | 1.08 ± 0.06 | 1.16 ± 0.15 | 1.07× |
| Double: raw Latin1 output | 54.09 ± 5.58 | 24.21 ± 0.86 | 47.60 ± 4.31 | 2.23× |
| Double: raw UTF16 output | 49.03 ± 4.32 | 30.47 ± 0.87 | 59.04 ± 9.44 | 1.61× |
| Double.toString: finite random | 72.73 ± 19.80 | 50.16 ± 21.47 | 62.84 ± 4.07 | 1.45× |
| Double.toString: 1–3 digit integers | 48.93 ± 10.47 | 42.80 ± 4.24 | 63.26 ± 3.03 | 1.14× |
| Double.toString: signed zeros (Java path) | 1.08 ± 0.18 | 1.04 ± 0.08 | 1.05 ± 0.03 | 1.04× |
| Float16.toString: finite random (Java control) | 66.13 ± 27.88 | 55.56 ± 18.86 | 53.26 ± 12.28 | 1.19× |
| Float: StringBuilder append | 65.39 ± 35.45 | 55.25 ± 7.44 | 53.98 ± 4.08 | 1.18× |
| Float: string concatenation | 106.64 ± 72.39 | 52.36 ± 15.02 | 72.50 ± 9.45 | 2.04× |
| Float: raw Latin1 output | 49.56 ± 12.98 | 34.60 ± 13.30 | 53.24 ± 18.09 | 1.43× |
| Float.toString: finite random | 69.39 ± 18.35 | 39.56 ± 3.25 | 54.10 ± 2.94 | 1.75× |
| Float.toString: 1–3 digit integers | 46.89 ± 5.78 | 39.26 ± 3.45 | 58.35 ± 5.73 | 1.19× |
| Formatter: ordinary decimals, %.9g | 269.62 ± 20.30 | 322.29 ± 156.18 | 309.92 ± 97.90 | 0.84× |

## Original formatter C2 control

The preceding fast_float-only PR image has the unmodified Java formatter.
It is independently measured with the same three-fork protocol. The final
image retains the same String copying constructor, and gates C2 float builder
append to Java. The flag-disabled variant uses Java conversion. No parsing
implementation changed in this formatting addition.

| Workload | Original formatter ns | Final image, Java ns | Final image, native ns |
| --- | ---: | ---: | ---: |
| BigDecimal.valueOf: 1–3 digit integers | 25.28 ± 4.15 | 24.41 ± 1.71 | 20.25 ± 2.03 |
| BigDecimal.valueOf: finite random doubles | 36.55 ± 3.21 | 36.92 ± 2.36 | 40.33 ± 15.57 |
| DecimalFormat: ordinary decimals | 284.17 ± 4.62 | 283.70 ± 21.62 | 293.10 ± 62.20 |
| Double: StringBuilder append | 82.85 ± 19.13 | 98.17 ± 22.63 | 69.01 ± 6.99 |
| Double: UTF16 StringBuilder append | 103.45 ± 21.07 | 99.03 ± 6.67 | 99.80 ± 26.29 |
| Double: string concatenation | 72.35 ± 18.43 | 70.53 ± 12.91 | 51.85 ± 2.45 |
| Double.toString: ordinary decimals | 82.96 ± 36.30 | 75.80 ± 5.57 | 51.93 ± 13.68 |
| Double.toString: NaNs (Java path) | 1.20 ± 0.55 | 1.15 ± 0.12 | 1.08 ± 0.06 |
| Double: raw Latin1 output | 50.00 ± 3.28 | 54.09 ± 5.58 | 24.21 ± 0.86 |
| Double: raw UTF16 output | 50.98 ± 5.66 | 49.03 ± 4.32 | 30.47 ± 0.87 |
| Double.toString: finite random | 59.41 ± 3.09 | 72.73 ± 19.80 | 50.16 ± 21.47 |
| Double.toString: 1–3 digit integers | 44.64 ± 6.03 | 48.93 ± 10.47 | 42.80 ± 4.24 |
| Double.toString: signed zeros (Java path) | 1.78 ± 0.05 | 1.08 ± 0.18 | 1.04 ± 0.08 |
| Float16.toString: finite random (Java control) | 68.51 ± 30.26 | 66.13 ± 27.88 | 55.56 ± 18.86 |
| Float: StringBuilder append | 55.51 ± 15.07 | 65.39 ± 35.45 | 55.25 ± 7.44 |
| Float: string concatenation | 52.66 ± 5.65 | 106.64 ± 72.39 | 52.36 ± 15.02 |
| Float: raw Latin1 output | 37.88 ± 2.42 | 49.56 ± 12.98 | 34.60 ± 13.30 |
| Float.toString: finite random | 51.48 ± 6.67 | 69.39 ± 18.35 | 39.56 ± 3.25 |
| Float.toString: 1–3 digit integers | 43.38 ± 3.47 | 46.89 ± 5.78 | 39.26 ± 3.45 |
| Formatter: ordinary decimals, %.9g | 296.98 ± 60.94 | 269.62 ± 20.30 | 322.29 ± 156.18 |

## Regression investigation and gates

An earlier C2 pilot exposed a float StringBuilder regression: 59.38 ± 5.23 ns
with Java versus 90.21 ± 6.70 ns with native formatting. Inlining output showed
that the builder String constructor's 82-byte `Arrays.copyOfRange` call no longer
inlined. A temporary `Arrays.copyOf` experiment reduced the cost, but repeated
original-build controls still favored Java append in C2. The final integration
therefore retains the original String constructor and folds `_useJavaFloatAppend`
to true in C2, selecting the original Java converter for this caller. Its Java
body returns false in interpreter/C1, which continue to use the faster native
append. The Java first stage is forced inline to avoid a cold-profile call in
the gated route. No C1/C2 runtime dispatch remains. C2 still accelerates float strings
and raw output. C2 also records the correct 15-character float / 24-character
double result bounds. The tables above measure this final hybrid, not the
intermediate experiments.

The decimal-splitting adapter preserves Java's exact-integer fast path and moves
scratch allocation into the Java fallback. Zero, NaN, infinity and significands
at most 128 stay in Java. Short text formatting was measured across tiers;
no blanket length gate was added. Precision consumers retain Java's rounding
and scale handling after native splitting. Float16 is a control, using its
original Java binary16 algorithm throughout.

## Longer C2 control check

The five allocation-heavy/precision workloads were repeated with three forks, three 1 s warmups and three 1 s measurements, with no concurrent tests/builds. All four variants use the same fixed-heap and CPU-pinning protocol. The original build retains the original formatter and String copying. These independent samples are included to investigate noisy main-matrix results, not to replace them.

| Workload | Original ns | Final Java ns | Native ns | JNI ns |
| --- | ---: | ---: | ---: | ---: |
| Double: StringBuilder append | 91.09 ± 20.98 | 82.22 ± 4.07 | 91.79 ± 60.36 | 82.89 ± 4.78 |
| Double: UTF16 StringBuilder append | 110.27 ± 13.39 | 117.22 ± 57.35 | 115.50 ± 52.41 | 153.34 ± 42.40 |
| Float: StringBuilder append | 50.82 ± 13.31 | 60.19 ± 5.43 | 50.90 ± 4.45 | 67.89 ± 39.06 |
| DecimalFormat: ordinary decimals | 288.29 ± 42.25 | 324.89 ± 130.19 | 482.82 ± 142.11 | 314.15 ± 83.05 |
| Formatter: ordinary decimals, %.9g | 274.35 ± 26.21 | 279.49 ± 50.28 | 276.53 ± 60.10 | 292.73 ± 13.34 |

## Longer special-value control check

NaN and signed-zero paths were repeated with three forks and three 1 s warmups/measurements. These small controls are reported in absolute nanoseconds as well as the main table, since a fraction of a nanosecond produces a large ratio.

| Workload | Original ns | Final Java ns | Native flag ns |
| --- | ---: | ---: | ---: |
| Double.toString: NaNs (Java path) | 0.94 ± 0.03 | 1.15 ± 0.14 | 1.06 ± 0.04 |
| Double.toString: signed zeros (Java path) | 2.02 ± 0.26 | 1.10 ± 0.22 | 1.03 ± 0.01 |

## Alternating C2 controls with GC profiling

The longer DecimalFormat native sample above (482.82 ns versus 288.29 ns
original) warranted another check. We retained it and repeated the single
workload with GC profiling, rotating original/native/Java order between three
rounds. Each invocation uses one fresh fork, three 1 s warmups and three 1 s
measurements; each variant therefore has three forks and nine observations.
The same CPU pinning, fixed heap and frozen images apply. The table aggregates
those nine observations with JMH's 99.9% Student-t interval (8 degrees of freedom).
All individual JSON files, including GC metrics, are included.

| Control | Original ns | Final Java ns | Enabled flag ns | Original → enabled allocation, B/conversion |
| --- | ---: | ---: | ---: | ---: |
| DecimalFormat | 285.26 ± 53.10 | 272.54 ± 31.08 | 258.66 ± 13.11 | 253.56 → 213.56 |
| NaN | 0.96 ± 0.13 | 1.10 ± 0.04 | 1.10 ± 0.07 | 0.00 → 0.00 |

DecimalFormat's large slowdown did not reproduce with alternating order, and
native splitting saves 40 bytes per conversion. This is evidence against a
consistent loss in that case, not proof that every timing fluctuation is caused
by the cloud host. The original outlier remains in the report and raw data.
NaN retains Java and has a roughly 0.14 ns higher mean in the alternating run;
its intervals overlap. No improvement is claimed for that control, and the
feature is not advertised as eliminating every possible performance difference.

## Validation and limits

The final packaged x86-64 image passed **247 jtreg tests**, including **46,562
framework cases**. These cover the floating-point converters, Float/Double,
String/StringBuilder/StringBuffer (including six sequential huge-memory tests),
BigDecimal, DecimalFormat/CompactNumberFormat/ChoiceFormat, Formatter, Scanner,
and both native features' intrinsic controls. Differential tests compare Java
strings, splitting metadata, and destination bounds across interpreter/C1/C2,
JNI fallback, flag disabled, UTF16 and SSE2 configurations.

AArch64 VM/libjava cross-builds and QEMU runtime checks passed for interpreter,
C1, C2, JNI, UTF16 and Shenandoah, with WhiteBox C1/C2 availability checks.
Additional x86 GC, header/reference modes, stress scheduling, checked JNI,
CDS, sanitizer and vendor-update reproduction checks passed; details are in
[validation.txt](validation.txt). Native macOS and Windows x64/AArch64
release/debug builds subsequently passed GitHub Actions after the compiler
compatibility fixes. Native ARM64 and Windows performance remain unmeasured.
The [final review](../decimal-final-review/README.md) adds C1 UTF16 coverage and
an allocation improvement for short-integer BigDecimal conversion. No
correctness failures remain in the
selected suites; these tests and samples cannot prove absence of every possible
regression on every workload or platform.
