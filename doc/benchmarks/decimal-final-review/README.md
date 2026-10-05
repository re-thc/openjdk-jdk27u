# Final decimal-intrinsics review

The subsequent [original-JDK baseline review](../decimal-original-baseline/README.md)
accepts correctly rounded shortest subnormal significands, adds automatic
vendor-bridge assumption checks, removes retained unused vendor code and
remeasures the final implementation against the pre-PR JDK. The results below
record the earlier positive-zero improvement and rejected experiments.

Baseline: `c49478493b69cbe021a7560b962fc39d82785449`, after the official
HotSpot include-order fix. This follow-up reviews the Java gates, interpreter,
C1, C2, JNI fallback, platform guards, vendor patches and benchmark coverage.
Both features remain enabled by default and independently opt out through
`-XX:-UseFastFloatIntrinsics` and `-XX:-UseZmijIntrinsics`.

The review checked String coder/length units and Java grammar fallbacks,
direct binary32 rounding, destination capacities and native endianness,
interpreter safepoint polls and barriered oop loads, C1 array-address helpers
and runtime-name registration, C2 leaf memory/escape classifications, Zero
dispatch guards, and the scoped compiler-warning exceptions. The existing
C2 Java float-append choice and short digit-buffer/exact-integer shortcuts
remain justified by the recorded measurements. No additional native binding,
capacity or fallback defect was found in this pass.

## Accepted improvement: decimal metadata for positive zero

`Zmij.split` already preserves the Java exact-integer shortcut. Positive zero
still returned to `DoubleToDecimal.toDecimalJava`, which creates an unused
scratch byte array and prevents C2 from eliminating the intermediate
`FormattedFPDecimal` allocation across that fallback. The new return handles
positive zero in Java, leaving the metadata object untouched, exactly as the
original splitter does. Negative zero, tiny subnormals, negative values and
non-finite values retain their existing handling. The feature-disabled path
also retains its existing behavior.

This improves the short-integer workload, whose deterministic corpus includes
zero. It does not accelerate the native conversion algorithm or change its
calling convention. Existing differential tests cover both signed zeros,
metadata flags, boundary bit patterns, rendering and destination bounds.

| C2 workload | Before ns/op | After ns/op | Before B/op | After B/op |
|---|---:|---:|---:|---:|
| `bigDecimalShortInteger` | 19.11 ± 2.12 | **10.95 ± 0.78** | 72.02 | **31.91** |
| `bigDecimalValueOf` | 37.05 ± 12.27 | 37.06 ± 11.17 | 32.00 | 32.00 |
| `decimalFormatDecimal` | 317.96 ± 134.04 | 329.38 ± 137.89 | 213.56 | 213.56 |
| `formatterGeneral` | 272.13 ± 17.45 | 271.10 ± 13.16 | 504.13 | 504.13 |

The short-integer result is **1.75× faster**, with approximately **56% less
allocation**. All three before/after rounds improved this workload. The other
workloads have overlapping timing intervals and unchanged allocation; no
additional speedup is claimed for them.

## Other performance checks

Added four reproducible UTF16 benchmarks: float builder append, float direct
output, and float/double direct short-integer output. C1 now explicitly tests
both converters with `-XX:-CompactStrings`, extending the existing interpreter
and C2 configurations.

Two native UTF16 widening experiments were measured separately: fixed-length
24/15-character double/float widening, and fixed-length float widening alone.
Both passed the rendering/destination differential smoke test. Neither gave a
reliable overall performance benefit across the tested workloads and tiers.
The first improved C1 float direct UTF16 output (36.31 ± 3.37 to
30.48 ± 2.40 ns/op), but controls and C2 results showed mixed tradeoffs. The
float-only experiment did not retain a clear C2 float improvement. Both were
reverted; the production UTF16 loop still writes the actual output length.
Their exact rejected changes are saved as [fixed-span.patch](fixed-span.patch)
and [float-span.patch](float-span.patch).

The C2 decimal-metadata path was also remeasured against the pre-Żmij image
and the feature-disabled Java path. Random `BigDecimal.valueOf` allocation
remains 32 B/op with Żmij versus 112 B/op with Java. DecimalFormat/Formatter
samples were noisy, including large outliers in both Java and enabled runs.
The earlier small timing regressions did not reproduce consistently enough
to justify a new C2 fallback gate. The original measurements and their limits
remain available in [the main formatting report](../zmij/README.md).

## Measurement protocol and reproduction

Intel Xeon Platinum 8370C, x86-64 Linux, GCC 14.2, JMH 1.37, one thread pinned
to CPU 4. Three independent forks, each with three warmup and three measurement
iterations; before/after order reversed in the second round. Zero-split runs
use one-second iterations, `-prof gc`, a 256 MB heap, `-Xshare:off`, `-Xbatch`
and `-XX:-TieredCompilation`. Both variants explicitly enable Żmij. No local
builds or tests ran concurrently with the measurements.

To isolate the accepted change, both variants used the same frozen baseline
JDK. The after variant patched only `jdk/internal/math/Zmij.class` compiled
from the updated source with `-implicit:none` and a source patch directory
containing only that class. Native VM code and all other module classes were
identical. The final source was subsequently built into a complete JDK image
for regression tests. Timing errors are 99.9% Student-t intervals over the nine
measurement observations (df=8, critical value 5.041305). Raw iteration values,
allocation values and rejected-experiment results are in
[measurements.json](measurements.json), with 204 round/workload records.

Build the baseline and updated JDKs separately. Use the same generated JMH
benchmark classes for both; `make/scripts/bench-zmij.sh` supplies the compilation
recipe. For each JDK, run the following three times in alternating order,
changing `RESULT` for each fork:

```sh
"$JDK/bin/java" -cp "$BENCHMARK_CLASSES:$JMH_CLASSPATH" org.openjdk.jmh.Main \
  'org.openjdk.bench.java.lang.ZmijFormatting.(bigDecimalShortInteger|bigDecimalValueOf|decimalFormatDecimal|formatterGeneral)$' \
  -jvm "$JDK/bin/java" \
  -jvmArgsAppend '--add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.math=ALL-UNNAMED -Xshare:off -Xms256m -Xmx256m -Xbatch -XX:-TieredCompilation -XX:+UseZmijIntrinsics' \
  -f 1 -wi 3 -i 3 -w 1s -r 1s -prof gc -foe true -rf json -rff "$RESULT"
```

Pin the process to one available CPU for comparison. To reproduce the isolated
class experiment, use the baseline JDK for both and add
`--patch-module=java.base=$PATCH_CLASSES` to the after fork's JVM arguments.
Use a source directory containing only the updated `Zmij.java` when compiling
that patch; pointing javac at the full java.base source tree can compile
unrelated bootstrap classes.

## Validation

Validation results are recorded in [validation.txt](validation.txt). The
follow-up also places the new x86/AArch64 interpreter utility includes and the
x86 SSE translation-unit includes in their proper blocks. The official
include sorter passes over its Linux/POSIX/shared scope and the changed
x86 SSE translation unit. A later expanded check found a preexisting
`oops/method.hpp` ordering issue in the interpreter's unrelated include block;
it is also present in the pre-PR source and outside the official test scope. No unrelated preexisting architecture include blocks were reordered.

The preceding include-sort commit's native macOS and Windows x64/AArch64
release/debug builds all passed in
[GitHub Actions run 37315601666](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37315601666).
Its remaining jobs were still queued/running when these measurements finished.
Native Windows and ARM64 performance has not been measured; QEMU runtime
checks are correctness evidence only.
