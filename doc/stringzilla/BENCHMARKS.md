# StringZilla benchmarks

These measurements use code revision
[`ae6ea74`](https://github.com/re-thc/openjdk-jdk27u/commit/ae6ea74495f4fdaaad08d3cf5ae2c32b82e92762).
The matrix contains **93 distinct workloads, 564 matched control triplets,
1,692 measurements and 3,384 isolated JVM forks**. AVX2 covers 90 workloads,
serial covers 57 and AVX-512 covers 41. Each backend/workload runs in the
interpreter, C1 and C2 with enabled, disabled and original-Java controls.

[The manifest](dispatch-cases.tsv) specifies every operation and input. It
retains the previous 53 workloads and adds the dispatch boundaries and minimal
overlaps affected by reverse-search routing. Coverage includes:

* Latin-1 255/256/257 and UTF-16 127/128/129 code units around the common
  256-source-byte gate; tiny/short inputs and immediate matches.
* UTF-16 prefixes 255/256/257 and 511/512/513, Latin-1 prefixes
  1023/1024/1025, and both coders with 31/32/33-code-unit needles.
* Minimal repeated-suffix overlaps with Latin-1 needles 256/257/258 and
  UTF-16 needles 128/129/130, plus long-overlap inputs on either side of
  the tier-specific comparison-work cutoffs.
* UTF-16 repeated-prefix reverse misses with 64-code-unit needles and a
  mismatch near either end, long bulk overlaps, crossed-byte matches,
  Latin-1 and mixed-coder searches, equality, builders/buffers and character search.

`StringZillaSearch.length` is the actual haystack length.
`StringZillaLongNeedle.length` is padding: its actual haystack contains
`length + needleLength + 1` code units. Thus the 64-code-unit fixtures with
padding 512/4096 search haystacks of 577/4161 code units; minimal-overlap
fixtures use padding zero and a haystack one code unit longer than the needle.

## Dispatch measured

The common 256-source-byte gate remains unchanged. After range normalization,
`prefix = fromIndex + needleCount`; prefix and needle count below use code
units. Additional native eligibility for same-coder substring reverse search is:

| Backend and tier | Additional eligibility |
| --- | --- |
| Serial/AVX2 C1, Latin-1 | Needle at most 256; longer needles require comparison work at least 1024 |
| Serial C2, Latin-1 | Needle 32–256 with prefix at least 1024; longer needles require comparison work at least 4096 |
| AVX2 C2, Latin-1 | Needle at most 128; needles 129–256 require comparison work at least 1024; longer needles require work at least 4096 |
| Serial/AVX2 C1, UTF-16 | Needle at most 128; longer needles require comparison work at least 1024 |
| Serial/AVX2 C2, UTF-16 | Needle at most 128 with prefix at least 512; longer needles require comparison work at least 2048 |
| Interpreter and other backend/tier combinations | Existing eligibility |

Comparison work is `(prefix - needleCount + 1) * needleCount`, computed with
64-bit arithmetic. This activation estimate is separate from the native
maximum-work safety guard. The selected callback table supplies the backend;
C1/C2 fold the compiler-tier query into a constant.

Ineligible UTF-16 and C1 Latin-1 inputs use the original Java reverse loop.
AVX2 C2 Latin-1 uses the same loop in a Java helper with explicit range checks
to retain array bounds optimizations. Ineligible serial C2 Latin-1 inputs use
the existing character-search intrinsic to skip 256-byte blocks without the needle's last character, then resume the original reverse
loop. Latin-1 probes an immediate match for needles up to eight code units
before the additional gate. Eligible serial UTF-16 needles up to 128 code units
use the existing portable aligned batch filter directly. Forward/character
search, mixed-coder search and equality retain their eligibility; mixed needles
over 64 code units remain on Java.

## Method

AMD EPYC 9V74, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op.
Production StringZilla kernels use GCC 16.0.1 (Ubuntu 16-20260322-1ubuntu1);
the VM and other native objects use GCC 14.2.0 release builds with the fork
development profile. All controls use the same image with default four-byte
object headers. Source/runtime hashes identify the measured code and binaries.

Each measurement uses two forks, three 500 ms warmups and five 500 ms
measurement iterations per fork. Runs are sequential, with no concurrent
builds/tests, one active processor, Serial GC and CDS disabled. Controls are
interleaved per workload in rotating order. Interpreter uses `-Xint`, C1 uses
`-XX:TieredStopAtLevel=1`, and C2 uses `-XX:-TieredCompilation`.

* **Enabled:** `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** `-XX:-UseStringZillaIntrinsics`, retaining the fork's Java gates.
* **Original Java:** the disabled VM with unmodified `StringLatin1` and
  `StringUTF16` from base revision `87edd79d3104ff502f7befec034716b081436f49`
  compiled into a `java.base` patch. This isolates the original helper bodies;
  it is not a pristine whole-JDK build. Existing C2 forward/equality intrinsics
  remain active; the equality inlining check is recorded with the raw results.

`UseAVX=0`, `2` and `3` select serial, AVX2 and AVX-512 StringZilla dispatch on
this host. Serial dispatch in this GCC image does not qualify MSVC performance
or a processor without AVX. Each fork checks results against independent
scalar search models and character-array equality before timing.

## Results

Means and JMH 99.9% confidence half-widths are in ns/op. Search sizes are
actual haystack / needle code units. These rows include the reported losses
and the overlap/work boundaries used to refine dispatch.

| Backend | Tier | Input / operation | Original Java | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| serial | c1 | UTF-16 reverse miss, 128 / 4 | 169.89 ± 11.43 | 104.91 ± 15.26 | 28.21 ± 1.69 |
| serial | c2 | UTF-16 reverse miss, 128 / 4 | 29.03 ± 0.82 | 27.65 ± 2.21 | 30.44 ± 4.01 |
| serial | c2 | Latin-1 reverse miss, 4096 / 4 | 751.38 ± 83.36 | 693.10 ± 42.02 | 206.91 ± 17.59 |
| avx2 | c2 | UTF-16 reverse miss, 128 / 4 | 30.03 ± 5.21 | 29.43 ± 4.06 | 29.76 ± 1.42 |
| avx2 | c2 | UTF-16 reverse miss, 129 / 4 | 30.56 ± 1.05 | 30.10 ± 1.17 | 32.08 ± 2.45 |
| avx2 | c1 | UTF-16 minimal overlap, 130 / 129 | 239.13 ± 21.61 | 196.98 ± 3.94 | 209.00 ± 13.34 |
| avx2 | c2 | Latin-1 minimal overlap, 258 / 257 | 160.38 ± 6.07 | 155.06 ± 4.89 | 157.92 ± 3.74 |
| avx2 | c2 | Latin-1 minimal overlap, 259 / 258 | 158.28 ± 10.04 | 155.64 ± 4.49 | 157.37 ± 8.08 |
| serial | c1 | UTF-16 overlap, 135 / 129; work 903, Java | 888.59 ± 228.30 | 718.57 ± 28.99 | 702.96 ± 27.57 |
| serial | c1 | UTF-16 overlap, 136 / 129; work 1032, native | 967.36 ± 58.39 | 784.92 ± 35.45 | 683.83 ± 77.68 |
| avx2 | c2 | Latin-1 overlap, 258 / 256; work 768, Java | 240.17 ± 12.26 | 234.82 ± 19.34 | 235.16 ± 7.95 |
| avx2 | c2 | Latin-1 overlap, 259 / 256; work 1024, native | 300.48 ± 11.31 | 296.36 ± 16.97 | 286.59 ± 29.71 |
| avx2 | c2 | Latin-1 overlap, 271 / 257; work 3855, Java | 1,527.03 ± 564.37 | 1,124.59 ± 108.49 | 1,143.65 ± 49.35 |
| avx2 | c2 | Latin-1 overlap, 272 / 257; work 4112, native | 1,211.94 ± 61.31 | 1,233.55 ± 64.98 | 923.85 ± 24.51 |
| serial | c2 | UTF-16 bulk overlap, 512 / 385 | 17,493.53 ± 1,728.35 | 17,208.21 ± 616.42 | 879.76 ± 18.51 |
| avx512 | c2 | UTF-16 minimal overlap, 130 / 129 | 98.25 ± 8.45 | 92.66 ± 1.38 | 17.43 ± 6.33 |

The full matrix also retains interpreter/C1 and bulk comparisons. Ratios
below are original Java / enabled; values below one are slower enabled means.

| Backend | Workload | Interpreter | C1 | C2 |
| --- | --- | ---: | ---: | ---: |
| avx2 | UTF-16 reverse, near-end mismatch, 4161 / 64 | 705.73× | 24.04× | 6.77× |
| serial | UTF-16 reverse, near-end mismatch, 4161 / 64 | 834.99× | 26.17× | 9.66× |
| avx512 | UTF-16 reverse, near-end mismatch, 4161 / 64 | 750.95× | 19.58× | 7.17× |
| avx2 | UTF-16 reverse, near-start mismatch, 4161 / 64 | 2789.51× | 35.55× | 14.24× |
| avx2 | Latin-1 reverse miss, 4096 / 4 | 67.56× | 18.31× | 3.31× |
| avx2 | Mixed reverse miss, 4096 / 64 | 191.02× | 9.38× | 1.47× |
| avx2 | Latin-1 equality, 4096 | 239.57× | 37.38× | 1.31× |
| avx2 | UTF-16 equality, 4096 | 348.14× | 39.45× | 1.17× |

## Remaining losses

Every slower mean remains in the complete tables, including overlapping
intervals: 134 of 1,128 control comparisons have a higher enabled mean.
The cases with higher, non-overlapping enabled intervals are:

| Backend | Tier | Input / operation | Original Java | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| serial | c2 | UTF-16 immediate reverse match, 128 / 4 | 5.73 ± 0.35 | 5.79 ± 0.16 | 9.32 ± 0.83 |
| avx2 | c2 | UTF-16 immediate reverse match, 128 / 4 | 5.63 ± 0.25 | 5.76 ± 0.27 | 8.12 ± 1.37 |
| avx512 | interpreter | Latin-1 forward miss, 32 / 4 | 434.97 ± 33.62 | 497.72 ± 61.89 | 488.15 ± 17.73 |
| avx512 | interpreter | Mixed reverse miss, 4096 / 65 (Java) | 164,102.34 ± 31,948.63 | 156,901.12 ± 6,616.08 | 203,083.58 ± 34,986.54 |
| serial | c2 | Latin-1 equality, 4096 | 121.12 ± 4.96 | 106.83 ± 6.85 | 118.06 ± 3.81 |

The immediate UTF-16 matches add about 2.5–3.6 ns against original Java.
The AVX-512 short Latin-1 case has a higher interval against original Java;
the mixed 65-code-unit case and serial C2 equality have higher intervals
against disabled execution. These paths already use Java or the existing
C2 equality intrinsic; the mixed needle exceeds the native widening cap.
Supplemental matched repeats are recorded separately below; the primary
measurements and all their slower means are retained unchanged.

| Control | Enabled interval lower | Overlap | Enabled interval higher |
| --- | ---: | ---: | ---: |
| original | 430 | 131 | 3 |
| disabled | 423 | 137 | 4 |

### Supplemental matched repeats

These three cases use the same source, binaries, VM options and two-fork
protocol. They supplement the primary matrix; no primary measurement is
replaced or excluded. [Raw repeat samples](measurements/dispatch-repeat-results.json)
include all nine measurements.

| Backend | Tier | Workload | Original Java | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| avx512 | interpreter | `mixed-reverse-65` | 145,333.59 ± 11,334.20 | 147,883.85 ± 10,357.18 | 153,975.59 ± 5,622.78 |
| avx512 | interpreter | `short-latin` | 478.78 ± 48.28 | 497.13 ± 51.85 | 495.41 ± 16.43 |
| serial | c2 | `equal-latin-large` | 109.08 ± 10.64 | 107.56 ± 4.81 | 122.47 ± 8.90 |

The mixed-search repeat has overlapping intervals with both controls; its
enabled mean remains about 4% higher than disabled. The short Latin-1 repeat
also overlaps both controls. Serial C2 equality remains about 14% slower than
disabled in the repeat. These results retain the remaining measured costs and
do not establish zero performance regressions.

The [complete tables](measurements/DISPATCH_BENCHMARKS.md) retain all 564
triplets, both control/enabled ratios and JMH 99.9% confidence intervals.
[Raw measurements](measurements/dispatch-results.json) preserve all iteration
samples, parameters, JVM options, compiler flags and source/artifact hashes.
A ratio below one identifies a slower enabled mean, including cases with
overlapping intervals. Interval comparisons are descriptive; overlapping
intervals do not establish equivalence, and these comparisons do not apply a
multiple-testing correction.

These results measure the specified workloads on one x86 cloud host. ARM
hardware and MSVC timings remain unmeasured; QEMU supplies functional ARM
coverage. JNI fallback has functional tests rather than a separate timing
matrix.

## Reproduction

Build the classes and generated JMH harnesses for
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` and
`StringZillaLongNeedle.java` with JMH 1.37, or use the OpenJDK microbenchmark
build. Set `JMH_CLASSPATH` to those classes and the JMH dependencies. Prepare
the original-Java control:

```sh
mkdir -p original-src/java/lang original-classes
for class in StringLatin1 StringUTF16; do
    git show 87edd79d3104ff502f7befec034716b081436f49:src/java.base/share/classes/java/lang/$class.java > original-src/java/lang/$class.java
done
"$TEST_JDK/bin/javac" --patch-module=java.base=original-src \
    -d original-classes original-src/java/lang/*.java
```

Run on an x86 host supporting AVX-512 after builds and tests finish:

```sh
doc/stringzilla/run-coverage-benchmarks.sh \
    "$TEST_JDK" "$JMH_CLASSPATH" original-classes dispatch-results 0 \
    doc/stringzilla/dispatch-cases.tsv
```

The [pre-dispatch report](PRE_DISPATCH_BENCHMARKS.md) preserves the previous
765 measurements and their losses at revision `6f3f4d0`.
The [intermediate dispatch report](measurements/DISPATCH_36359F3_BENCHMARKS.md)
preserves the 1,557 measurements at `36359f3`, including the overlapping-match
performance losses addressed by the final routing. The
[measurement index](measurements/README.md) links all historical datasets.
The earlier 23–27× result compared two enabled revisions, rather than original
Java. Integration and functional validation are documented in
[README.md](README.md).
