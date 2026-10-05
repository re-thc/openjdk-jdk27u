# fast_float measurements and validation

Original-build controls lead the conclusions; opt-out/JNI matrices are diagnostic. These Java measurements are historical and do not qualify the current PR head or JNI-only ports.

Measured on 2026-10-04 UTC with JMH 1.37, GCC 14.2.0, an Intel Xeon Platinum 8370C,
Linux x86-64, and a release server JVM. The container exposes five CPU cores with
a four-core CPU quota. Each benchmark uses one worker pinned to CPU 4, three fresh
forks, three 500 ms warmup iterations and three 500 ms measurement iterations.
C1 uses `-Xbatch -XX:TieredStopAtLevel=1`; C2 uses `-Xbatch -XX:-TieredCompilation`.
The interpreter uses `-Xint`. Each invocation consumes 1,024 deterministic inputs;
`@OperationsPerInvocation` reports time per conversion.

Java selects `-XX:-UseFastFloatIntrinsics`. Native enables the product flag.
JNI enables the flag and disables both intrinsic IDs. The compiled runs use the
packaged JDK image. The interpreter runs use the equivalent exploded image;
the subsequent inlining annotations do not change interpreted bytecodes.

Times are mean **ns/conversion ± JMH 99.9% confidence interval**. Speedup is the
ratio of Java mean to native mean. Cloud timing variation is visible in the
intervals and raw fork samples; small differences in gated/fallback paths are
not evidence of an improvement or regression. Cold BigDecimal includes construction.

Raw JMH JSON is included beside this file. The benchmark source and reproduction
script are described in [the implementation notes](../../fast-float.md).

## Original-build C2 controls

An unmodified build of the same base commit was measured with the three-fork/
500 ms protocol for the cold, short-buffer, hexadecimal and short String cases.
The original and flag-disabled confidence intervals overlap for every gated
control. Short decimal Strings improve with the native path.

| Workload | Original build ns | New build, Java ns | New build, native ns |
| --- | ---: | ---: | ---: |
| bigDecimalDoubleCold | 991.45 ± 1015.99 | 648.80 ± 181.61 | 639.69 ± 77.86 |
| bigDecimalFloatCold | 698.01 ± 145.36 | 644.27 ± 154.32 | 809.98 ± 414.20 |
| decimalFormatDigitsShort | 11.23 ± 1.25 | 10.65 ± 1.09 | 11.90 ± 3.58 |
| parseDoubleHex | 290.13 ± 80.82 | 325.93 ± 92.87 | 279.60 ± 16.76 |
| parseDoubleShortInput | 48.22 ± 30.23 | 39.24 ± 19.35 | 15.34 ± 0.22 |
| parseFloatHex | 208.32 ± 21.12 | 197.32 ± 24.62 | 225.21 ± 73.50 |
| parseFloatShortInput | 34.68 ± 2.96 | 49.10 ± 26.56 | 18.42 ± 8.68 |

## Interpreter: modified-image diagnostic

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| Double: 1–3 digit integers | 2683.29 ± 751.31 | 316.75 ± 5.51 | 497.71 ± 219.87 | 8.47× |
| Float: 1–3 digit integers | 2354.05 ± 293.71 | 337.07 ± 55.45 | 357.91 ± 18.55 | 6.98× |
| Double: ordinary decimals | 12420.97 ± 10707.29 | 444.46 ± 14.45 | 447.66 ± 62.35 | 27.95× |
| Float: ordinary decimals | 6978.71 ± 389.83 | 408.75 ± 11.71 | 433.23 ± 10.56 | 17.07× |
| Double: finite round trips | 13110.16 ± 6602.58 | 421.84 ± 41.23 | 446.62 ± 39.80 | 31.08× |
| Float: finite round trips | 5749.01 ± 1060.40 | 418.23 ± 15.31 | 457.77 ± 7.89 | 13.75× |
| Double: long mantissas | 25359.10 ± 851.17 | 571.04 ± 21.29 | 687.34 ± 273.60 | 44.41× |
| Float: long mantissas | 17210.00 ± 5126.36 | 570.02 ± 28.43 | 618.00 ± 68.50 | 30.19× |
| DigitList: 4 digits (Java gate) | 449.53 ± 134.72 | 377.19 ± 64.36 | 321.97 ± 15.23 | 1.19× |
| DigitList: 20–21 digits | 1088.89 ± 23.75 | 140.80 ± 19.73 | 143.80 ± 3.15 | 7.73× |
| DigitList: ~60 digits | 1148.02 ± 130.08 | 131.75 ± 8.89 | 143.47 ± 7.93 | 8.71× |
| BigDecimal → double, cached | 12465.08 ± 2289.08 | 1167.88 ± 24.19 | 1084.88 ± 11.27 | 10.67× |
| BigDecimal → float, cached | 10804.97 ± 839.24 | 967.13 ± 78.66 | 858.27 ± 30.47 | 11.17× |
| BigDecimal → double, cold | 31737.71 ± 938.96 | 35482.12 ± 1995.10 | 31332.97 ± 768.12 | 0.89× |
| BigDecimal → float, cold | 31699.74 ± 1342.57 | 35408.24 ± 5530.83 | 29225.16 ± 964.11 | 0.90× |
| Double: hexadecimal fallback | 7609.99 ± 261.46 | 7290.57 ± 381.58 | 7318.51 ± 234.39 | 1.04× |
| Float: hexadecimal fallback | 6288.71 ± 533.24 | 6424.19 ± 440.66 | 6502.15 ± 169.62 | 0.98× |

## C1: modified-image diagnostic

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| Double: 1–3 digit integers | 100.25 ± 59.34 | 20.01 ± 1.12 | 34.68 ± 5.74 | 5.01× |
| Float: 1–3 digit integers | 86.45 ± 42.47 | 20.65 ± 0.34 | 34.17 ± 1.90 | 4.19× |
| Double: ordinary decimals | 248.81 ± 50.79 | 38.29 ± 9.66 | 54.34 ± 3.72 | 6.50× |
| Float: ordinary decimals | 293.56 ± 70.02 | 44.51 ± 13.50 | 66.86 ± 25.56 | 6.60× |
| Double: finite round trips | 337.31 ± 69.33 | 41.74 ± 3.25 | 63.74 ± 9.50 | 8.08× |
| Float: finite round trips | 258.20 ± 116.39 | 42.67 ± 20.22 | 59.55 ± 4.37 | 6.05× |
| Double: long mantissas | 1031.50 ± 259.47 | 135.91 ± 15.46 | 137.96 ± 5.03 | 7.59× |
| Float: long mantissas | 632.84 ± 60.10 | 125.77 ± 9.50 | 141.23 ± 18.02 | 5.03× |
| DigitList: 4 digits (Java gate) | 14.64 ± 1.13 | 16.02 ± 6.74 | 16.47 ± 7.16 | 0.91× |
| DigitList: 20–21 digits | 53.15 ± 3.57 | 28.04 ± 1.69 | 37.30 ± 3.41 | 1.90× |
| DigitList: ~60 digits | 53.32 ± 2.70 | 29.79 ± 1.46 | 41.64 ± 13.54 | 1.79× |
| BigDecimal → double, cached | 547.11 ± 443.67 | 127.12 ± 21.60 | 125.20 ± 3.34 | 4.30× |
| BigDecimal → float, cached | 276.26 ± 30.48 | 155.14 ± 49.80 | 117.15 ± 5.04 | 1.78× |
| BigDecimal → double, cold | 1313.86 ± 184.42 | 1416.90 ± 169.06 | 1483.82 ± 421.09 | 0.93× |
| BigDecimal → float, cold | 1800.29 ± 697.25 | 1792.86 ± 888.94 | 1200.97 ± 64.26 | 1.00× |
| Double: hexadecimal fallback | 384.33 ± 77.07 | 404.58 ± 49.24 | 368.15 ± 36.07 | 0.95× |
| Float: hexadecimal fallback | 458.88 ± 323.71 | 340.92 ± 43.81 | 332.81 ± 12.07 | 1.35× |

## C2: modified-image diagnostic

| Workload | Java ns | Native ns | JNI ns | Native speedup |
| --- | ---: | ---: | ---: | ---: |
| Double: 1–3 digit integers | 39.24 ± 19.35 | 15.34 ± 0.22 | 32.83 ± 3.43 | 2.56× |
| Float: 1–3 digit integers | 49.10 ± 26.56 | 18.42 ± 8.68 | 31.54 ± 2.79 | 2.67× |
| Double: ordinary decimals | 115.84 ± 8.56 | 28.37 ± 5.29 | 43.24 ± 1.01 | 4.08× |
| Float: ordinary decimals | 121.92 ± 4.15 | 35.33 ± 6.41 | 50.16 ± 0.79 | 3.45× |
| Double: finite round trips | 129.47 ± 27.35 | 53.69 ± 33.69 | 47.38 ± 1.29 | 2.41× |
| Float: finite round trips | 78.20 ± 2.83 | 32.14 ± 1.34 | 48.27 ± 0.70 | 2.43× |
| Double: long mantissas | 647.53 ± 163.96 | 126.81 ± 8.88 | 144.05 ± 4.12 | 5.11× |
| Float: long mantissas | 336.99 ± 76.82 | 122.25 ± 39.92 | 137.15 ± 5.31 | 2.76× |
| DigitList: 4 digits (Java gate) | 10.65 ± 1.09 | 11.90 ± 3.58 | 28.02 ± 45.08 | 0.89× |
| DigitList: 20–21 digits | 26.30 ± 4.25 | 24.62 ± 0.75 | 37.22 ± 2.43 | 1.07× |
| DigitList: ~60 digits | 25.98 ± 0.70 | 25.39 ± 2.84 | 39.21 ± 4.65 | 1.02× |
| BigDecimal → double, cached | 373.43 ± 621.57 | 99.24 ± 49.22 | 102.04 ± 12.14 | 3.76× |
| BigDecimal → float, cached | 179.08 ± 44.31 | 104.52 ± 45.08 | 104.70 ± 4.39 | 1.71× |
| BigDecimal → double, cold | 648.80 ± 181.61 | 639.69 ± 77.86 | 1043.89 ± 1093.02 | 1.01× |
| BigDecimal → float, cold | 644.27 ± 154.32 | 809.98 ± 414.20 | 846.36 ± 433.18 | 0.80× |
| Double: hexadecimal fallback | 325.93 ± 92.87 | 279.60 ± 16.76 | 292.47 ± 34.79 | 1.17× |
| Float: hexadecimal fallback | 197.32 ± 24.62 | 225.21 ± 73.50 | 224.39 ± 19.96 | 0.88× |

## Validation

The packaged x86-64 image passed **97 jtreg tests**, including **41,214 framework
cases**. Suites cover FloatingDecimal, Float, Double, BigDecimal, DecimalFormat,
Scanner, ChoiceFormat, CompactNumberFormat, scalar Float16 operations and
HotSpot intrinsic availability/control checks. The differential tests compare
the original Java parser, both precisions, signed zeros, range boundaries,
midpoints, malformed syntax, exceptions, long inputs and raw digit buffers.

Interpreter, C1, C2, JNI-only, disabled and UTF-16 configurations passed.
Additional runs passed with Serial, Parallel, ZGC and Shenandoah, compact
headers, and uncompressed references. CDS honors the product flag.

AArch64 GCC cross-builds of the server JVM and libjava passed. Under QEMU,
interpreter, C1, C2, JNI, UTF-16 and Shenandoah differential checks passed;
WhiteBox confirmed C1/C2 availability. Native ARM performance and Windows/MSVC
performance have not been measured. See [validation.txt](validation.txt).


## Vendor layout experiment

Upstream [issue #418](https://github.com/fastfloat/fast_float/issues/418) reports
19.87 → 11.22 ns/double with Windows/MSVC after moving the error field.
The field move reduces the parser token from 72 to 64 bytes on the tested
x86-64 and AArch64 ABIs. The patch preserves every field and its initializer.

Seven alternating original/patched runs of 200 passes over the upstream
`simple_fastfloat_benchmark` Canada data (111,126 numbers), pinned to CPU 4
with other build/test/benchmark jobs stopped, produced these GCC 14.2 medians:

| Precision | Original ns | Patched ns | Original range | Patched range |
| --- | ---: | ---: | ---: | ---: |
| double | 15.508 | 15.759 | 15.256–18.748 | 15.417–18.270 |
| float | 15.366 | 15.314 | 15.164–15.656 | 15.215–15.797 |

GCC did not reproduce the reported MSVC performance regression or speedup;
these differences are small relative to timing variation. The vendored patch
retains the smaller layout. All corresponding checksums match. MSVC has not
been tested locally.

[Raw layout samples](layout-canada.tsv) and the [standalone driver](layout-benchmark.cpp)
are included. Compile original and patched headers separately with:

```sh
g++ -O3 -std=c++17 -fno-exceptions -fno-rtti -fno-strict-aliasing -fno-omit-frame-pointer -ffp-contract=off -I/path/to/include layout-benchmark.cpp -o layout-benchmark
taskset -c <cpu> ./layout-benchmark canada.txt 64
# Use 32 for float.
```

Data: <https://raw.githubusercontent.com/lemire/simple_fastfloat_benchmark/master/data/canada.txt>
SHA-256: `157834558e841b454a507d76f1744136afb192db4006a532205bb5defcbe93a0`.

## Longer interpreter control check

The five gated/fallback workloads were repeated without concurrent build/test
work, using three forks and three 1 s warmup/measurement iterations each.
The Java/native confidence intervals overlap for each workload. These cases
continue to use the Java algorithms; no speedup is claimed.

| Workload | Java ns | Native flag ns |
| --- | ---: | ---: |
| bigDecimalDoubleCold | 36462.61 ± 6492.65 | 43473.32 ± 16778.33 |
| bigDecimalFloatCold | 31197.14 ± 1185.18 | 44465.24 ± 26064.85 |
| decimalFormatDigitsShort | 323.02 ± 7.94 | 351.55 ± 43.19 |
| parseDoubleHex | 7537.26 ± 984.95 | 9592.96 ± 3319.99 |
| parseFloatHex | 6570.76 ± 853.76 | 7924.33 ± 2190.10 |

JNI-only C2 digit conversion has transition overhead and can be slower than
Java for these small buffers. The default C2 path uses the leaf intrinsic;
`DisableIntrinsic` intentionally exposes the JNI fallback for measurement.
The product flag selects the original Java parser across every layer.

## Digit cutoff check

A separate C2 length sweep uses normalized ASCII digits and decimal exponent
zero, with the same three-fork/500 ms protocol. Four-digit inputs retain the
Java path. The tested 8–256 digit inputs benefit from the native word scan.
[Driver](RawDigits.java) and raw JSON are included; the driver exposes
additional exponent parameters for future updates. This check preceded the
inlining hints, which the warmed-up C2 wrapper already satisfied.

| Digits | Java ns | Native ns |
| --- | ---: | ---: |
| 4 | 21.76 ± 31.14 | 14.05 ± 10.25 |
| 8 | 11.42 ± 1.61 | 9.33 ± 0.97 |
| 12 | 13.63 ± 2.26 | 10.70 ± 0.19 |
| 16 | 18.76 ± 5.77 | 11.05 ± 0.27 |
| 20 | 22.59 ± 0.41 | 17.93 ± 0.31 |
| 60 | 23.01 ± 0.32 | 19.11 ± 3.14 |
| 256 | 27.58 ± 3.38 | 20.83 ± 0.57 |
