# Decimal review follow-up

The subsequent [shortest-rendering review](../decimal-original-baseline/README.md)
adds an all-tier original-JDK comparison, permits correct shorter subnormal
text and preserves the precision metadata path. Its footprint measurements use
a further reduction of unused explicit instantiations. This report records the
preceding review source and controls.

This follow-up addresses the baseline, String ownership, JNI-default and vendor
upgrade concerns at parent `e9dbce2b547fa5ccb23b4bc8a97b95c869848f88`.
Parsing and formatting remain opt-out. There is no new wrapper in the Java
production path, no speculative JNI cutoff, and no formatter algorithm change.

## Baseline and String construction

The [formatting report](../zmij/README.md) now leads with independently measured
original-formatter controls. Its original image is the preceding fast_float-only
PR image, with an unmodified formatter; it is not a pristine entire JDK.
Float concatenation is parity (52.66 → 52.36 ns, 1.01×), float builder append is
parity, and random Float.toString is about 1.30× (51.48 → 39.56 ns).
The larger modified-image opt-out ratios are retained as diagnostic data.
Precision-formatting outliers and near-neutral controls remain visible.

The enabled compact-string ToDecimal path allocates an exact-sized byte array,
copies the logical text into it, and passes exclusive ownership to an internal
String constructor. Disabled/noncompact paths use the original ISO-8859-1
copying constructor. Descriptions claiming the original constructor was always
retained have been corrected. TestZmij now checks every length 0–24 and mutates
the scratch buffer after construction to catch accidental ownership transfer.
That new Java check is **pending execution**.

No fresh PR-head Java timing/allocation results are claimed. Even a minimal
Serial-GC JVM failed before Java execution with pthread_create EAGAIN on this
host, which has over 32,000 unreaped processes. Historical results are labeled
accordingly. Native compilation and standalone checks below were possible.

## JNI defaults

Parsing defaults on all ports. Interpreter/C1 leaf entries exist on little-endian
x86-64 and AArch64; other interpreter/C1 ports and Zero use JNI. The shared C2
runtime leaf is available where C2 is built. Intrinsic disabling retains JNI.
There is no JNI-specific small-String gate; the trusted digit-buffer eight-digit
gate and String 1,024-code-unit ceiling remain. Linux x86 intrinsic timing does
not qualify JNI-only ports. Forced-JNI x86 timing is a separate diagnostic.
Native ARM64 and Windows performance remain unmeasured. A backend-specific
gate needs representative measurements, not an arbitrary new constant.

## Upgrade checks and retained code

The updater applies a third zero-fuzz patch, shortest-only.patch. The VM's two
Żmij translation units define ZMIJ_SHORTEST_ONLY; this suppresses explicit
instantiations of unused precision/scientific/fixed/hex/long-double APIs.
The upstream default full API and shortest conversion code are preserved.

The inspected HotSpot linker command has no section garbage collection, so the
unused code was actually retained. Using the same GCC 14.2 product O3 flags,
we compiled original and updated portable/SSE4.1 units and relinked them into
the existing local HotSpot library, changing only those appended units:

| Artifact | Original text, bytes | Updated text, bytes |
| --- | ---: | ---: |
| Portable unit | 47,294 | 24,109 |
| SSE4.1 unit | 50,220 | 27,039 |
| Relinked libjvm | 23,810,902 | 23,763,718 |

GNU size reports **47,184 fewer bytes in its text category** (about 46.1 KiB,
including read-only/unwind sections). The executable .text section shrinks by
44,800 bytes and .rodata by 256 bytes; data remains
1,158,992 and BSS 534,632 bytes. All 28 unused public precision-template
instantiations disappear. The shortest exponent helper write_big_exp remains
because it is used. Debug ELF file size is not a measure of resident code.

This is an **actual HotSpot-link experiment with the PR's native units**, but
the reused local VM is not a complete PR #3 head image. It proves retention and
removal under those compiler/linker flags, not whole-image footprint or runtime
behavior on every platform. AArch64's updated portable unit also cross-compiles. The three zero-fuzz
patches applied to the pinned upstream source reproduce both installed
vendor files byte for byte.
There is no fresh ARM runtime/performance measurement.

Before installing vendor files, make/scripts/check-zmij.py extracts the actual
production decimal metadata method, compiles it against the staged vendor, and
uses independent Python exact integer/rational oracles. All three configurations
(full table, shortest-only, shortest-only compressed table) passed under UBSan:

- All 649 downward-rounded, normalized 128-bit powers 10^-307 through 10^341.
- 26,352 fixtures covering exponent bins, mantissa edges, decimal neighbors,
  tiny subnormals, seeded random values, negative/special total fallback.
- Decimal significand/exponent round trips and shortest digit bounds; rescaled
  significand and exactness/rounding flags against exact binary rationals.

A negative control flipping one cached table bit was rejected at 10^-307.
A separate native full-versus-shortest-only writer comparison rendered 250,000
random double and 250,000 random float bit patterns per variant, checked buffer
canaries, and produced identical digest `872d6388a5af0d3a`. These native checks
do not replace the existing Java differential, precision consumer or GC tests.

Wide native stores still use the initialized 40-byte stack buffer; adaptation
copies into the checked 24/15-character caller spans. Direct stores or partial
initialization were not adopted without safety and timing evidence. The removal
of unused retained code is the measured improvement in this follow-up.

## Reproduce and qualify the current head

For vendor upgrades, use a clean v1.2-or-newer release checkout:

```sh
python3 make/scripts/update-zmij.py /path/to/zmij
```

The updater requires a host C++17 compiler with UBSan support. Patch, compile or
contract failure stops before installed files change. To check an already
patched staging directory containing zmij.cc and zmij.h independently:

```sh
python3 make/scripts/check-zmij.py /path/to/staged-vendor --cxx c++
```

To collect current-head timing and allocation with an original JDK baseline:

```sh
python3 make/scripts/bench-decimal-review.py /path/to/original-jdk \
  /path/to/head-jdk '/path/to/jmh/*' /path/to/new-results \
  --original-commit 33e539f2d4a847f283a3793df6eebd41b9d1dfac \
  --head-commit <tested-head> --cpu <allowed-cpu> --tiers c2
```

Build both JDKs with the same configuration/toolchain and run without concurrent
work. The runner compiles the same benchmark sources once, records declared
source commits, SHA-256 of java/javac/libjvm and JMH/source files, and runs
original/default/opt-out/forced-JNI in rotating order. It uses three fresh forks
per variant, three 1 s warmups/measurements, fixed heap, CDS off and GC profiling.
Original runs receive no new product flags. Use --tiers interpreter c1 c2 for
tier qualification, or --benchmarks to expand the focused String/precision/
short-parser matrix. CPU affinity is optional and requires OS support.
The runner is intended for Linux/macOS Python 3.11+ benchmark hosts.

Raw JMH JSON/logs retain intervals and allocation metrics. summary.csv leads
with original/default ratios and bytes/op; opt-out/JNI columns are diagnostics.
Hash records and declared commits must match the images being claimed.
The runner's syntax was checked here; JVM execution remains blocked.
Run TestZmij and the existing math/precision suites on the resulting current
head before treating this follow-up as fully runtime-qualified.
