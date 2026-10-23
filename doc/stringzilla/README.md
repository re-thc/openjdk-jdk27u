# StringZilla integration

StringZilla 5.3.0 supplies bounded native kernels for eligible string searches,
interpreter/C1 equality and Latin-1 line and whitespace scans. It is enabled by
default; `-XX:-UseStringZillaIntrinsics` selects the existing JDK implementations.
Public APIs, compact-string representation, range checks and Unicode semantics
are preserved.

## Execution

Package-private `java.lang.StringZilla` bridges call kernels in `libjava`.
HotSpot supplies interpreter entries and compiler calling conventions.

| Layer | Integration |
| --- | --- |
| Interpreter | x86-64/AArch64 entries poll before deriving heap addresses and call bounded kernels |
| C1 | Native leaf calls, checked equality and reverse-search bridges carrying the caller's tier |
| C2 | Reverse-search and Latin-1 scan leaf calls; existing forward-search and equality intrinsics |
| JNI fallback | The same kernels and bounds through JVM entry points |

An immutable kernel table is published during `System.registerNatives`.
Equality has a scalar bootstrap fallback. GCC/Clang x86 selects AVX2 or AVX-512
using HotSpot capabilities and `UseAVX`; AArch64 uses NEON. MSVC x64, Zero and
other ports use serial kernels. SIMD capability checks include the instructions
required by each selected implementation.

Native setup is outlined from short Java searches. Immediate matches and small
prefixes remain in Java; backend and caller tier govern bulk admission.
Checked overlapping word comparisons verify 9–16-character C2 UTF-16 candidates.
On MSVC, bounded character-search blocks filter sparse reverse candidates;
dense ending characters resume the existing Java loop. C1 narrow long-needle
windows can use bounded native equality.

Latin-1 `trim`, `strip`, `stripLeading`, `stripTrailing`, `isBlank` and
`lines` use eligible byte-set scans. Compiled producers use bounded word probes
before native dispatch; interpreted producers use scalar probes. Admission uses
each producer's logical range, and serial backends use Java scanning.

`trim` removes bytes `0x00`–`0x20`. Latin-1 Character whitespace is exactly
`0x09`–`0x0D` and `0x1C`–`0x20`; NEL and NBSP remain non-whitespace for
strip/blank operations. Line splitting recognizes CR, LF and CRLF.
Identity, allocation, lazy line traversal, splitting and consumer exceptions
remain in Java. UTF-16 retains its Unicode scanners.

## Bounds and safepoints

Physical range checks precede unchecked UTF-16 and word access. Builders retain
their logical length, spare capacity and synchronization. Native adapters reject
odd-byte UTF-16 occurrences and preserve overlapping candidate starts.

| Limit per native call | Bound |
| --- | --- |
| Source bytes | 64 KiB |
| Source bytes × needle bytes | 4,194,304 |
| Mixed needle widened on the stack | 64 code units |

Excess work returns `-2` for Java fallback; `-1` means no match.
Large searches overlap windows by the needle length minus one code unit.
Java backedges poll between calls, which derive fresh addresses from rooted
arrays. Equality also uses bounded range calls. These limits bound leaf work
rather than elapsed time.

The kernel file uses `HIGHEST` optimization. MSVC release and fastdebug use
`/O2`; slowdebug retains `/Od`. GCC/Clang use portable scalar loads for
unaligned byte-array offsets. No additional shared library is required.

## Vendoring

The 28 upstream files are pinned to Apache-2.0 StringZilla 5.3.0, commit
`86d73f1021e6cce022c3cceb1f7837eb50338774`.
[UPSTREAM.json](../../src/java.base/share/native/libjava/stringzilla/UPSTREAM.json)
records upstream, patch and patched-file SHA-256 hashes.
[The shipped notice](../../src/java.base/share/legal/stringzilla.md) contains
the license. Independent adapters follow `ADDITIONAL_LICENSE_INFO`.

Two tracked patches preserve reverse-search overlaps and MSVC baseline
bit-operation semantics. The other 26 files are unmodified.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

The updater stages the dependency closure and patches, refreshes hashes and
license text, and removes obsolete headers. It rejects fuzz/reversed patches and
leaves the checkout untouched on failure. Review patches against each new pin
and repeat correctness and performance checks on native platforms.

## Validation

Permanent [JMH benchmarks](../../test/micro/org/openjdk/bench/java/lang)
cover StringZilla searches, scans, alignment and long needles alongside the
ordinary correctness tests. Run benchmarks through the normal JDK microbenchmark
build with complete SDK images.

Tests cover forced interpreter/C1/C2, JNI, opt-out, thresholds, windows, repeated
needles, overlaps, coders, surrogates, builder capacity and concurrent GC.
Native tests cover executable kernels, exact allocations, alignment and work
limits. Sanitizer receipts identify their tested kernel source and backend.

```sh
make test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string' \
  'JTREG=TIMEOUT_FACTOR=4'
```

JNI fallback tests disable the relevant `_stringzilla*` bridge intrinsics.
Equality uses `_equalsL`, `_equalsLChecked` and `_stringzillaEqualsRange`;
disabling `_equalsL` also disables its checked alias. Forward-search fallback
tests also disable the applicable existing `_indexOf*` intrinsics.
