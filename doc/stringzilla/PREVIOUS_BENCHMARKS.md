# Previous StringZilla complete-image benchmarks

These measurements use production revision
[`90e763c`](https://github.com/re-thc/openjdk-jdk27u/commit/90e763c6758c08b2cb8981beb8a038cf86c279e8)
with **99 workloads, 606 matched original/enabled/disabled triplets, 1,818 measurements
and 3,636 isolated JVM forks**. All controls are complete source-built JDK distributions.
The [manifest](dispatch-cases.tsv) covers short inputs, thresholds, both coders, mixed
needles, equality, builders/buffers, long repeated-prefix misses and overlapping matches.
AVX2 covers 96 workloads, serial 63, and AVX-512 43, each in interpreter, C1 and C2.

Five [mixed-fallback inputs](mixed-fallback-cases.tsv) add 135 measurements across
all backends and tiers. Three [native batch-boundary inputs](native-batch-cases.tsv)
add 27 AVX2 measurements. Five [mixed-prefix boundary inputs](mixed-prefix-cases.tsv)
add 135 measurements at needle lengths 64, 66, 127, 128 and 129; the fallback supplement
covers 65. All supplements use the same complete images and are reported separately
from the 99-workload matrix. The native batch inputs use a 129-code-unit UTF-16
needle in haystacks of 160/161/162 code units: spans 31/32/33, or 32/33/34
candidate positions. Only the first uses the at-most-32-candidate aligned filter;
the latter two use upstream byte search.

## Integration and dispatch

StringZilla 5.3.0 supplies the native kernels, with one tracked reverse-overlap patch.
Its search headers are unchanged from the previous 5.2.0 pin; the upgrade alone does
not fix that defect or call overhead. Backend selection runs once. Bounded VM leaves
avoid JNI transitions; JNI fallback shares the kernels and work limits. A single
native candidate uses upstream equality directly, avoiding search preprocessing.

Short compiled inputs retain Java/platform paths. Interpreter whole-string forward
entries avoid Java dispatch. Short interpreted UTF-16 reverse-match probes reuse bounded
range equality. For mixed reverse needles of 9–64 characters, compiled serial
callers probe the rightmost candidate backward in Java; misses retain native bulk
search. Interpreter and vector dispatch are preserved. Interpreted single-candidate
mixed searches within the 64-character widening cap call the bounded kernel directly. For longer mixed needles, the interpreter
and C1 filter trailing characters before the inline Java loop; C2 uses the existing JDK
character intrinsic to skip empty blocks before Java verification. An immediate trailing
candidate of 65–128 characters uses the existing C2 mixed forward-search intrinsic
over exactly that one candidate (at most 256 source bytes). A rejection resumes
reverse search at the preceding start. Longer C2 candidates retain Java. For
65–128-character candidates, the interpreter and C1 compare the trailing suffix backward, then verify the bounded
64-character prefix natively. An outlined helper keeps native argument setup out of
the scalar caller. Compiled single-candidate searches use a small backward verifier
with an intrinsic range check. The C2 helper has its own compilation profile,
so interpreter early returns do not leave its Java loop untrained.

C2 forward, BMP character search and equality retain existing JDK intrinsics. Their
control timings are not StringZilla kernel improvements. The adapter adds no handwritten
SIMD search algorithm. For AVX2 UTF-16 needles longer than 128 characters and at most
32 candidates, it reuses the portable aligned filter to avoid long-needle preprocessing.
Larger eligible windows retain upstream search.

After the common 256-source-byte gate, same-coder substring reverse search uses the
following additional eligibility. Prefix is `fromIndex + needleCount`, span is prefix
minus needle count, and comparison work is `(span + 1) * needleCount` in 64-bit arithmetic.
These activation estimates are separate from the native 64 KiB source limit and
4,194,304 byte-product work bound.

| Backend and tier | Additional native eligibility |
| --- | --- |
| Serial or AVX2 C1, Latin-1 | Needle up to 256 code units, or comparison work at least 1024 |
| Serial C2, Latin-1 | Needle 32–256 code units with prefix at least 1024, or longer needle with comparison work at least 4096 |
| AVX2 C2, Latin-1 | Needle up to 128 code units; needle 129–256 with comparison work at least 1024; longer needle with comparison work at least 4096 and span at least 32 code units |
| Serial or AVX2 C1, UTF-16 | Needle up to 128 code units, or comparison work at least 1024 |
| Serial C2, UTF-16 | Needle up to 128 code units with prefix at least 512, or longer needle with comparison work at least 2048 |
| AVX2 C2, UTF-16 | Same as serial C2, plus a span of at least 16 code units for longer needles |
| Interpreter, other backend/tier combinations, mixed-coder searches | Existing eligibility |

The [integration guide](README.md) specifies fallback paths, API coverage and safepoints.

## Method

AMD EPYC 9V74 80-Core Processor, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op.
The original and fork images use GCC/G++ 16.0.1 (20260322 experimental),
the same headless release development profile, x86-64-v3 flags, version string, source timestamp, GC features and object-header layout.
[Raw provenance](measurements/complete-image-results.json) records compiler commands,
complete-distribution file hashes, module lists and harness fingerprints.

* **Original JDK:** a complete untouched-base image from
  `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`, without a StringZilla class or flag.
* **Enabled:** the complete fork image with `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** a byte-identical fork distribution with `-XX:-UseStringZillaIntrinsics`.

No control uses a class/module patch or manually substituted native object. Each
measurement has two forks, three 500 ms warmups and five 500 ms measurements per fork.
Runs are sequential, without concurrent builds/tests, using one active processor,
Serial GC and CDS disabled. Control order rotates per workload. Tiers use `-Xint`,
`-XX:TieredStopAtLevel=1`, and `-XX:-TieredCompilation`; `UseAVX=0/2/3` selects the
serial/AVX2/AVX-512 tables on this host. Independent setup oracles check every input.

## Results

Means and JMH 99.9% confidence half-widths are ns/op. Integration gains include
Java fallback improvements; the route column identifies the implementation measured.

| Backend | Tier | Workload (haystack / needle) | Route | Original JDK | Disabled | Enabled |
| --- | --- | --- | --- | ---: | ---: | ---: |
| serial | c1 | UTF-16 reverse miss, 128 / 4 | Native aligned filter | 152.31 ± 6.52 | 83.57 ± 9.25 | 28.63 ± 2.28 |
| serial | c2 | UTF-16 reverse miss, 128 / 4 | Java | 27.04 ± 2.74 | 25.94 ± 2.75 | 27.66 ± 3.11 |
| serial | c2 | Latin-1 reverse miss, 4096 / 4 | Java + JDK character intrinsic | 710.52 ± 30.00 | 667.99 ± 14.99 | 201.35 ± 13.44 |
| avx2 | c2 | UTF-16 reverse miss, 128 / 4 | Java | 29.68 ± 2.77 | 28.36 ± 1.74 | 27.53 ± 1.76 |
| serial | interpreter | UTF-16 immediate reverse match, 128 / 4 | Bounded native equality probe | 671.61 ± 22.32 | 726.60 ± 74.81 | 427.65 ± 34.08 |
| avx512 | interpreter | Latin-1 forward miss, 32 / 4 | Native interpreter entry | 462.98 ± 18.26 | 498.51 ± 27.90 | 169.58 ± 11.97 |
| avx512 | interpreter | Mixed reverse miss, 4096 / 65 | Native trailing-character filter | 146,097.79 ± 7,820.96 | 152,208.99 ± 4,478.65 | 614.65 ± 86.64 |
| serial | c2 | Mixed reverse miss, 4096 / 65 | Java + JDK character intrinsic | 673.24 ± 22.02 | 672.74 ± 27.50 | 250.17 ± 7.84 |
| serial | c2 | Latin-1 equality, 4096 | Existing JDK equality intrinsic | 118.12 ± 6.00 | 116.69 ± 15.14 | 109.74 ± 11.89 |

## Requested AVX2 C2 span boundaries

All six repeated-suffix fixtures return zero. `StringZillaLongNeedle.length` is padding;
the actual haystack length is `length + needleLength + 1`. The table uses actual lengths.
The complete tables retain the interpreter, C1 and serial controls for these inputs.

| Coder | Needle | Haystack | Span | AVX2 C2 route | Original JDK | Disabled | Enabled |
| --- | ---: | ---: | ---: | --- | ---: | ---: | ---: |
| Latin-1 | 257 | 288 | 31 | Java | 2,424.28 ± 66.41 | 2,408.57 ± 132.30 | 176.93 ± 13.44 |
| Latin-1 | 257 | 289 | 32 | Native | 3,227.05 ± 1,337.02 | 2,426.13 ± 121.00 | 463.95 ± 6.22 |
| Latin-1 | 257 | 290 | 33 | Native | 2,493.26 ± 182.69 | 2,592.88 ± 217.96 | 924.54 ± 37.43 |
| UTF-16 | 129 | 144 | 15 | Java | 701.76 ± 29.77 | 587.11 ± 34.36 | 61.31 ± 3.23 |
| UTF-16 | 129 | 145 | 16 | Native aligned filter | 782.63 ± 43.70 | 670.24 ± 34.47 | 54.10 ± 2.00 |
| UTF-16 | 129 | 146 | 17 | Native aligned filter | 822.07 ± 37.41 | 687.28 ± 73.88 | 52.89 ± 1.71 |

## Slower measurements

All 105 higher enabled means out of 1,212 primary control comparisons
remain in the [complete table](measurements/COMPLETE_IMAGE_BENCHMARKS.md), including
overlapping intervals. The primary higher non-overlapping intervals are:

| Backend | Tier | Workload | Original JDK | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| avx2 | interpreter | `threshold-latin-below` | 2,491.47 ± 175.43 | 2,768.49 ± 195.54 | 2,809.59 ± 136.75 |
| serial | interpreter | `threshold-utf16-below` | 4,822.97 ± 251.26 | 5,175.17 ± 419.21 | 5,340.66 ± 221.44 |

The two interpreter inputs search 255 Latin-1 bytes or 127 UTF-16 code units,
below the common 256-byte gate. They execute the Java fallback; both fork controls
have higher means than the original JDK. These measurements include dispatch and
fallback costs and remain performance limitations of this integration.

The supplements contain 15 higher enabled means.
Their higher non-overlapping intervals are:

| Backend | Tier | Workload | Original JDK | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| serial | c1 | mixed-prefix-64 | 70.82 ± 4.63 | 60.35 ± 1.35 | 67.72 ± 1.82 |

The serial C1 supplement verifies a 64-character mixed immediate match backward
in Java. Its enabled mean is lower than original and higher than disabled.

The [mixed-fallback](measurements/MIXED_FALLBACK_BENCHMARKS.md),
[native batch-boundary](measurements/NATIVE_BATCH_BENCHMARKS.md) and
[mixed-prefix](measurements/MIXED_PREFIX_BENCHMARKS.md) tables retain every supplemental
mean and both ratios. Interval comparisons have no multiple-testing
correction. Overlap does not establish equivalence; one cloud host cannot establish
zero regressions across all workloads or CPUs.

Native ARM and MSVC performance remain unmeasured. Serial dispatch in this x86-64-v3
GCC image does not qualify MSVC or hardware without AVX. Earlier QEMU functional checks
are separate from native performance qualification.

## Validation

The [local validation record](measurements/complete-image-validation.json) reports
190 jtreg passes, zero failures/errors and two platform exclusions on this production
source. The untouched original image passed 91 String tests. Independent fixture
checks cover all primary and supplemental inputs in 27 backend/tier/control
configurations; forced-JNI checks cover serial, AVX2 and AVX-512. GCC 16 native
ASan/UBSan checks include alignment checks; the tested native sources match this
production revision. The [CI record](measurements/complete-image-ci.json) records
all 57 jobs passing on this source, including release/debug builds and tier1 tests
on Linux x64/AArch64, macOS AArch64 and Windows x64. The record links the public
workflow and individual jobs.

## Reproduction

Build complete images from the original base and measured production revision with
matching configure/compiler settings. Exact commands and fingerprints are in the raw
provenance. Build the two StringZilla microbenchmark classes with JMH 1.37 and set
`JMH_CLASSPATH` to the generated harness and dependencies. After builds/tests finish:

```sh
doc/stringzilla/run-coverage-benchmarks.sh \
    "$ORIGINAL_JDK" "$FORK_JDK" "$FORK_JDK" "$JMH_CLASSPATH" results 0
doc/stringzilla/run-coverage-benchmarks.sh \
    "$ORIGINAL_JDK" "$FORK_JDK" "$FORK_JDK" "$JMH_CLASSPATH" mixed-results 0 \
    doc/stringzilla/mixed-fallback-cases.tsv
doc/stringzilla/run-coverage-benchmarks.sh \
    "$ORIGINAL_JDK" "$FORK_JDK" "$FORK_JDK" "$JMH_CLASSPATH" batch-results 0 \
    doc/stringzilla/native-batch-cases.tsv
doc/stringzilla/run-coverage-benchmarks.sh \
    "$ORIGINAL_JDK" "$FORK_JDK" "$FORK_JDK" "$JMH_CLASSPATH" prefix-results 0 \
    doc/stringzilla/mixed-prefix-cases.tsv
```

The runner locks each output directory, fingerprints complete images and the harness,
and resumes only complete matching measurements. The [measurement index](measurements/README.md)
preserves all earlier campaigns, including the 99-workload `a7607aa` patched-class
controls and every measured candidate loss. Those are historical evidence, not the
complete-image controls above.

This report records the historical `90e763c6758` runtime. See [the current report](BENCHMARKS.md) for the latest qualified source and native ARM/MSVC measurements.
