# Native binary-to-decimal conversion with Żmij

The formatter vendors **Żmij v1.2**, release commit
`d1682cb47e67474319ed146d3ca2c0e1a70f9429`, under its **MIT license option**.
The release is pinned in `make/data/zmij/version.txt`, with its license in
`src/java.base/share/legal/zmij.md`. Vendor patches and upgrade checks are
tracked alongside the import.

## Algorithm selection

For random doubles on Apple M5, xjb's published charts
report 17.09 CPU cycles for xjb, 20.74 for Żmij, 42.83 for yy_double, 47.65 for
yyjson, and 74.41 for full-table Dragonbox. Żmij offers an MIT license option.
The source licenses of xjb v1.11.0 and
Tejú Jaguá are Apache 2.0, incompatible with GPLv2-only HotSpot.

A local native-core comparison used GCC 14.2, `-O3 -std=c++17 -march=x86-64
-fPIC`, 16,384 random finite values, nine timing samples, and CPU 4 of an Intel
Xeon Platinum 8370C. These are medians in ns/value, excluding JNI, String
construction, and adaptation to Java's notation. Each of nine samples processes
256 passes over the same 16,384 values (seed `0xf70a111`), and consumes the
result length and a destination byte. [Recorded medians and ranges](benchmarks/zmij/native-core-results.txt):

| Implementation | double | float |
|---|---:|---:|
| xjb 1.11.0 | 21.004 | 15.840 |
| Żmij 1.2 | 20.032 | 15.763 |
| yy_double | 27.193 | — |
| Dragonbox 1.1.3 | 36.961 | 27.752 |

The upstream comparison is a different workload and machine, and the checked-in
charts predate xjb 1.11.0. Neither table is a claim about end-to-end JDK speed.

Sources: [xjb charts](https://github.com/xjb714/xjb/tree/v1.11.0/bench_result),
[Żmij v1.2](https://github.com/vitaut/zmij/tree/v1.2),
[Żmij MIT license](https://github.com/vitaut/zmij/blob/v1.2/LICENSE).

## Integration and controls

Native formatting is **enabled by default** on little-endian x86-64 and AArch64.
Using this fork requires no enabling flags. `-XX:-UseZmijIntrinsics` opts out
and selects the Java formatter, independently of `-XX:-UseFastFloatIntrinsics`
for parsing. `_formatZmij` and `_decimalZmij` honor `DisableIntrinsic` and
`ControlIntrinsic`. Disabling those intrinsics retains JNI. Zero on a supported
architecture also uses JNI; other architectures retain Java.

The interpreter has frameless entries with a safepoint poll and JNI slow path.
C1 uses shared LIR and the platform C calling convention. C2's array-writing
leaf takes the full memory state to order allocation/initialization, and records
writes to byte-array bodies. Its deterministic decimal-splitting leaf is pure.
Neither leaf allocates or safepoints; an interior pointer never crosses a
safepoint. JNI resolves the array in VM state before calling the same formatter.

The portable x86-64 translation unit uses SSE2. A separate SSE4.1 translation
unit has its own upstream namespace and target attributes. `VM_Version` selects
its entry only when the CPU supports SSE4.1 and `UseSSE` permits it. Intrinsic
generation resolves the entry once; the hot leaf has no per-call CPU dispatch.
JNI selects the same entry. AArch64 uses NEON. There is no AVX2/AVX-512 backend,
and no optional x86 instruction is required for the SSE2 fallback. C1 uses
the existing platform array-address helper for index widening, constant
folding and displacement handling on x86-64 and AArch64.
Wide upstream stores stay in a zero-initialized
40-byte stack buffer. Constant-sized Latin1 copies stay within the caller's
reserved MAX_CHARS span; UTF16 widens only the logical result. Only exclusively
owned, exactly sized arrays are transferred into Strings.

C2 records a float result bound of 15 characters and a double bound of 24.
Float builder append uses the Java converter in C2, where native writes can
add array materialization and copying costs. A Java predicate returns false
in the interpreter/C1 and C2 folds `_useJavaFloatAppend` to true. The tier choice
folds at compilation. Tiny nonzero subnormals still use native formatting in
C2 append so their rendering agrees with the other text entry points. The small Java first stage is forced inline so
the gated route retains the original hot caller shape. C2 still accelerates canonical float strings
and raw float output. Disabling `_useJavaFloatAppend` measures the ungated
native append path. Canonical compact Strings copy the reserved formatter
buffer into a new, exactly sized byte array and pass that exclusively owned
array to the internal Latin1 String constructor. The caller cannot mutate the
String backing array. Noncompact Strings and feature-disabled conversion use
the original public copying constructor; StringBuilder.toString also retains
its original copying constructor. The [original-build measurements](benchmarks/decimal-original-baseline/README.md)
include timing and allocation for this implementation and an isolated control
using the original canonical String constructor.

## Rendering correctness and precision consumers

The zero-fuzz vendor patch applies Java's fixed range `[1e-3, 1e7)`, uppercase
`E`, unpadded exponents without `+`, and a digit after the decimal point. Zero,
infinities and NaNs use Java. Finite values use the vendor's shortest meaningful
significand that round-trips to the same raw binary value. This fork permits
a different correct significand from the stock JDK: Float.MIN_VALUE renders
as `1.0E-45` instead of `1.4E-45`, and Double.MIN_VALUE as `5.0E-324` instead
of `4.9E-324`. Keeping `.0` means these particular strings have the same
character count despite having fewer meaningful digits. Opting out restores
the stock choice. Precision metadata is separate: tiny significands at most
128 retain the Java splitter, preserving BigDecimal scale/precision and
DecimalFormat/Formatter rounding. Decimal splitting retains the exact-integer Java
fast path and packs the significand, exactness and rounding direction into one
`long`; Java derives the exponent. The original scale/precision adjustment in
BigDecimal remains in place. Positive-zero splitting returns directly in Java,
leaving the metadata unchanged and avoiding the fallback scratch array. This
also lets C2 eliminate intermediate metadata allocation for short integers;
the [original-JDK benchmark report](benchmarks/decimal-original-baseline/README.md)
records timing and allocation controls.

| Consumer | Integration |
|---|---|
| Float/Double `toString`, boxed `toString`, String `valueOf` | Canonical text entry |
| StringBuilder/StringBuffer float/double append | Native double at all tiers; native float in interpreter/C1 and usually Java float in C2, Latin1 and UTF16 |
| String concatenation | Existing Float/Double rendering |
| BigDecimal `valueOf(double)` | Decimal splitting |
| Formatter `%e`, `%f`, `%g` | Splitting, including exactness and rounding direction |
| DecimalFormat, CompactNumberFormat, DigitList | Shared FloatingDecimal converter and splitting |
| `jdk.compat.DecimalFormat=true` | Existing legacy compatibility algorithm |
| Vector API Float16 | Existing Java binary16 formatter; Żmij has no binary16 API |
| Preferences, rowset XML, annotations, reflection, JMX, Provider versions, atomic double accumulators/adders | Existing Float/Double conversion paths |
| XML schema/XPath/XSLT/BCEL numbers, image metadata, desktop properties, printing, demos, serviceability-agent text | Existing conversions; notation-specific rules remain |
| Arbitrary-precision BigDecimal formatting/arithmetic and `new BigDecimal(double)` | Different exact-decimal semantics; existing algorithms |
| Hexadecimal formatting and binary stream/class-file encodings | Existing non-decimal paths |

The source audit searched every reference to `FloatToDecimal`, `DoubleToDecimal`,
`FormattedFPDecimal`, and `FloatingDecimal.getBinaryToASCIIConverter`, then
traced Float/Double `toString`, String `valueOf`, builder append and hidden
concatenation consumers across all modules. All binary32/binary64 shortest
decimal consumers reach these shared entries. Precision formatting additionally
requires the splitting metadata; it cannot be replaced by the text-only API.

## Updates

Check out a clean upstream release tag at least v1.2 and run:

```
python3 make/scripts/update-zmij.py /path/to/zmij
```

The script records the version and commit, verifies the MIT license selection,
preserves headers, and applies `make/data/zmij/java-format.patch`,
`make/data/zmij/clang-compat.patch` and `make/data/zmij/shortest-only.patch`
with zero fuzz. The Clang compatibility patch gives three compressed
power-of-ten arrays explicit bounds so Clang can construct the expanded
tables at compile time; their values and sizes are unchanged.
The implementation is named `zmij-impl.hpp`; the portable and SSE4.1 translation
units include it in distinct namespaces. The shortest-only patch suppresses
explicit instantiations of unused precision, hexadecimal and long-double APIs;
only the used formatter and metadata templates are instantiated. Shortest
conversion does not allocate.

The precision bridge intentionally depends on internal vendor tables and its
significand/exponent representation. Before installing any vendor, license or
version files, the updater compiles the same production bridge in
`zmijMetadata.inline.hpp` and runs `check-zmij-metadata.py`. Exact integer
arithmetic checks all 649 downward-rounded normalized power entries and
25,635 deterministic boundary/random inputs, including significand packing,
round trips and exactness/rounding direction. The supplemental `check-zmij.py`
verifier checks 26,352 fixtures in full, shortest-only and compressed-table
profiles under UBSan. Both checkers include the shared production bridge.
A changed private representation,
failed patch, compilation failure or failed assumption stops installation.
Use a host GCC/Clang-compatible C++17 compiler; `--cxx` selects it explicitly.
The standalone checker accepts a directory containing patched
`zmij.cc` and `zmij.h`. Review
changed upstream code and repeat the JDK precision tests and tier benchmarks
before enabling a newer version.

## Reproducing validation and measurements

`TestZmij` requires bit-exact round trips and agreement between native String,
builder, concatenation and raw-buffer output; it compares precision metadata
against the retained Java algorithm. The independent decimal checker verifies
shortest meaningful significands and tie rounding, with separate default and
stock opt-out runs. Coverage includes signed zero,
NaN payloads, subnormal and binade boundaries, decimal powers and their binary
neighbors, random values, Latin1/UTF16 destinations with nonzero offsets, and
decimal-splitting exactness and rounding direction. It runs with the interpreter,
C1, C2, disabled intrinsics/JNI, disabled compact strings, and the product flag
disabled. `TestZmijSSE2` exercises the x86 fallback; WhiteBox checks both IDs at
compiler levels 1 and 4, both intrinsic controls, and the C2-only float append choice.

```sh
make CONF=<configuration> images
make CONF=<configuration> test TEST='test/jdk/jdk/internal/math/ToDecimal test/jdk/jdk/internal/math/FloatingDecimal test/jdk/java/lang/Float test/jdk/java/lang/Double test/jdk/java/lang/String test/jdk/java/lang/StringBuilder test/jdk/java/lang/StringBuffer test/jdk/java/math/BigDecimal test/jdk/java/text/Format/DecimalFormat test/jdk/java/text/Format/CompactNumberFormat test/jdk/java/text/Format/ChoiceFormat test/jdk/java/util/Formatter test/jdk/java/util/Scanner test/hotspot/jtreg/compiler/intrinsics/fastfloat test/hotspot/jtreg/compiler/intrinsics/zmij'
```

The huge String/StringBuilder/StringBuffer tests require several GiB each; run
them sequentially on a memory-constrained machine. The native String test also
requires the jtreg native test libraries, which the normal `make test` flow builds.

`ZmijFormatting` uses deterministic finite values, ordinary decimals, short
integers, signed zeros, NaNs, and a binary16 control. It covers String construction,
append/concatenation, Latin1/UTF16 output, BigDecimal, DecimalFormat, and Formatter.
With JMH 1.37 and its dependencies in the classpath:

```sh
taskset -c <cpu> make/scripts/bench-zmij.sh /path/to/jdk '/path/to/jmh/*' /path/to/results -f 3 -wi 3 -i 3 -w 500ms -r 500ms
```

The script saves JSON and logs for Java, intrinsic, and JNI conversion at each
tier. `ZMIJ_TIERS='c1 c2'` and `ZMIJ_VARIANTS='java zmij'` select subsets;
`ZMIJ_BENCHMARKS` selects a JMH workload regular expression. Keep
the benchmark image fixed and avoid concurrent builds or tests. The
[original-JDK benchmark report](benchmarks/decimal-original-baseline/README.md) records raw measurements, controls,
validation, and limitations. QEMU results establish ARM64 correctness only;
native ARM64 performance must be measured on ARM64 hardware.
