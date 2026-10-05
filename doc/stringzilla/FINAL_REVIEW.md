# Final independent review

Recorded 2026-10-05 (Asia/Taipei). StringZilla remains enabled by default;
`-XX:-UseStringZillaIntrinsics` remains the opt-out.

## Retained changes

The review checked initialization/publication, ISA capability gates, native
bounds, UTF-16 alignment, C1 call arguments and register lifetimes, C2 range
checks and memory dependencies, interpreter leaf entries, JNI fallback, and
the applicability audit. No further correctness defect was found in these
paths. This is a review conclusion, not proof that every workload is regression
free.

The repository include formatter corrected the two changed CPU interpreter
files as well as the previously fixed shared files. A scan of all 21 changed
HotSpot C++/header files passes. The standard include-order test currently scans
shared and OS directories; this extra scan also covers our CPU files.

The public scalar oracle now covers every equality length from zero through
nine, plus word, search-threshold, and larger boundaries. A new WhiteBox test
forces equality callers to compile at levels 1 and 4 and keeps 16 independently
varying values live across the operation. It checks both coders, lengths 0..40,
every mismatch position, high-byte mismatches, different lengths, and null
arguments. Runs cover default-on behavior, compact strings/object headers off,
and explicit opt-out. This protects the existing unrolled C1 prefix as well as
the native call and the caller's spilled values.

## Measured candidate: rejected

A prototype replaced C1's eight individual prefix-byte comparisons with two
bounded eight-byte loads for arrays of at least eight bytes. Shorter arrays
kept byte comparisons. Correctness checks passed, including fastdebug compiler
stress and AArch64/QEMU, but timing exposed a short-input regression. The
prototype was removed; no performance change from it is included in the PR.

The comparison pins CPU 0 on AMD EPYC 9V74, runs before/after sequentially, and
uses JMH 1.37 with two isolated forks, three 500 ms warmups, and five 500 ms
measurements per fork. Both states enable StringZilla and stop at C1. Builds
and functional tests finish before timing. The baseline is the implementation
at remote commit `9a669712ad37afdd94228d96cee4e3f238348b5f`; libjava and modules
are identical in both states. The restored release and fastdebug libjvm hashes
match their pre-prototype binaries exactly.

Means are ns/op; the ratio is baseline/prototype. These are **rejected prototype
results**, not additional gains in the shipped implementation. A ratio below
one means slower. All measured means, including slower ones, are retained.

| Coder | Characters | Shape | Baseline | Prototype | Ratio |
| --- | ---: | --- | ---: | ---: | ---: |
| Latin-1 | 1 | equal | 4.817 | 4.652 | 1.04x |
| Latin-1 | 1 | first mismatch | 4.819 | 4.892 | 0.99x |
| Latin-1 | 4 | equal | 5.896 | 6.097 | 0.97x |
| Latin-1 | 4 | first mismatch | 4.574 | 4.990 | 0.92x |
| Latin-1 | 8 | equal | 7.450 | 4.833 | 1.54x |
| Latin-1 | 8 | first mismatch | 5.083 | 4.663 | 1.09x |
| Latin-1 | 32 | equal | 9.308 | 6.549 | 1.42x |
| Latin-1 | 32 | first mismatch | 4.796 | 4.578 | 1.05x |
| Latin-1 | 4096 | equal | 74.262 | 72.623 | 1.02x |
| Latin-1 | 4096 | first mismatch | 4.592 | 4.577 | 1.00x |
| UTF-16 | 1 | equal | 4.955 | 5.569 | 0.89x |
| UTF-16 | 1 | first mismatch | 5.062 | 4.835 | 1.05x |
| UTF-16 | 4 | equal | 7.919 | 5.071 | 1.56x |
| UTF-16 | 4 | first mismatch | 4.646 | 4.990 | 0.93x |
| UTF-16 | 8 | equal | 9.640 | 7.705 | 1.25x |
| UTF-16 | 8 | first mismatch | 4.817 | 4.997 | 0.96x |
| UTF-16 | 32 | equal | 9.166 | 6.680 | 1.37x |
| UTF-16 | 32 | first mismatch | 4.734 | 4.785 | 0.99x |
| UTF-16 | 4096 | equal | 141.302 | 151.195 | 0.93x |
| UTF-16 | 4096 | first mismatch | 4.630 | 4.904 | 0.94x |

The decisive four-character Latin-1 first-mismatch case changes from
`4.574 +/- 0.093` to `4.990 +/- 0.201` ns/op (JMH 99.9% confidence intervals
do not overlap). A faster long/equal prefix does not justify that regression.
Other small differences, especially the 4096-character UTF-16 equal case,
have overlapping intervals and are not established regressions or gains.
[All 40 measurements](rejected-word-prefix-results.json) include raw samples,
intervals, VM arguments, artifact/source hashes, and the exact rejected patch.
The original feature on/off tables remain in [BENCHMARKS.md](BENCHMARKS.md).

## Remaining performance opportunities and limits

* C1 still pays for the unrolled prefix on equal arrays. A future word-prefix
  implementation must preserve the measured short/early-exit behavior and be
  checked under register pressure on both architectures before replacing it.
* Mixed UTF-16/Latin-1 needles longer than 64 code units retain Java searching.
  Simply increasing the stack buffer would change stack usage and crossover
  behavior; a different bounded algorithm needs its own measurements.
* The aligned UTF-16 first/last-character filter verifies candidate interiors
  with serial StringZilla equality even in SIMD-selected tables. Using an ISA
  equality function there needs workloads with many surviving candidates,
  plus code-size and correctness checks; ordinary odd-byte misses are not
  enough evidence to change it.
* The original on/off matrix retains some slower short/crossover means. The
  gates reduce overhead but do not establish zero performance regressions for
  all applications. They remain unchanged by this final pass.
* ARM timings require ARM hardware. QEMU is functional coverage only. Serial
  ports/toolchains also need platform measurements before changing their gates.

## Final validation

* Release HotSpot, JDK image and all four CDS archives rebuild successfully.
  Fastdebug and AArch64 cross-release HotSpot builds pass.
* Default-on selected jtreg suites: **157 passed, 2 platform skips, zero
  failures/errors**. String: 93; StringBuilder: 16; StringBuffer: 25; HotSpot
  string intrinsics: 23 passed / 2 skipped. This includes all eight modes of
  the expanded public oracle and all three runs of the new equality test.
* Fastdebug targeted jtreg: **3 passed, zero skipped/failed/error**:
  `TestIncludesAreSorted`, `StringZillaKernelsTest`, and
  `TestStringZillaEquality`. The equality-state test also passes with
  `StressLinearScan` enabled.
* Fastdebug: all eight expanded public-oracle modes, default/on/off
  availability checks, and forced compilation/execution of all 22 API callers
  at levels 1 and 4 pass. The default remains true and explicit opt-out false.
* AArch64/QEMU: the new equality-state test and all 22 existing C1/C2 callers
  pass; default/opt-out availability checks pass. The expanded interpreter,
  C1 and C2 public oracles all pass.
* Vendor verification: 28 unmodified upstream files. Changed-source include
  sorting and staged whitespace checks pass.

At 22:22 Asia/Taipei, GitHub Actions run
[37317168213](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37317168213)
for the preceding CI-fix commit reports successful Linux x64 Zero debug,
Linux AArch64 debug and s390x cross builds. No failure is reported; other build
and test jobs are running or queued. This snapshot does not mean the full CI
matrix is green, and a push of these final source/test changes starts another
run. Local checks above apply to the final source, independently of remote CI.

Historical results and sanitizer limits remain in
[REVIEW_RESPONSE.md](REVIEW_RESPONSE.md). Full tier1/tier2 locally, whole-JDK
sanitizers, MSVC builds locally, and ARM hardware timing remain untested.

| Final artifact | SHA-256 |
| --- | --- |
| Release `lib/server/libjvm.so` | `ccd136760d4d94b60c9eb5046e27533778d2e2fda69da692bdaa5e21c3f8db15` |
| Release `lib/libjava.so` | `6fc1aed08c1aa301b86df317f24c5045f3a9eae9f75eae192834a60227f7a4f3` |
| Release `lib/modules` | `d8dc91b7adc3f3bf0bc2298982f397c019ac1e1e3809fdd7b2351177649c06b5` |
| Fastdebug `lib/server/libjvm.so` | `cda8a26daf04dfe0bb0675353d9162c1084c0c52637d5ae72675c84e315e4461` |
| AArch64 `lib/server/libjvm.so` | `955993c87be1424e96d33a9aa59b4cedd5ace0bff8964ab3a4ed922b7c18e09a` |
