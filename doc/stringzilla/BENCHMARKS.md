# StringZilla benchmarks

These measurements use code revision
[`a7607aa`](https://github.com/re-thc/openjdk-jdk27u/commit/a7607aa978dd410a2dedcf6aace886304ead7e82).
The matrix contains **99 distinct workloads, 606 matched control triplets, 1,818
measurements and 3,636 isolated JVM forks**. AVX2 covers 96 workloads, serial covers 63
and AVX-512 covers 43. Each backend/workload runs in the interpreter, C1 and C2 with
enabled, disabled and original-Java controls.

[The manifest](dispatch-cases.tsv) specifies every operation and input. It retains the
previous workloads and adds the dispatch boundaries and minimal overlaps affected by
reverse-search routing. Coverage includes:

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

`StringZillaSearch.length` is the actual haystack length. `StringZillaLongNeedle.length`
is padding: its actual haystack contains `length + needleLength + 1` code units. Thus
the 64-code-unit fixtures with padding 512/4096 search haystacks of 577/4161 code units;
minimal-overlap fixtures use padding zero and a haystack one code unit longer than the
needle.

## Integration decisions

StringZilla 5.3.0 is pinned to an immutable upstream commit. Its search headers are
unchanged from our previous 5.2.0 pin. The release notes list short reverse-search
improvements that were already present in that pin; only alignment sanitizer annotations
change within our dependency closure. The upgrade alone does not remove call overhead or
the long reverse-search overlap defect. The tracked patch remains necessary. CPU
selection occurs once, using HotSpot capabilities and `UseAVX`. Intrinsics call native
leaves without a JNI transition. GCC/Clang use portable word loads for arbitrary
byte-array offsets while retaining SIMD kernels.

Native setup can cost more than the original loop on short compiled inputs. AVX2
long-needle searches also need 32 candidate bytes to enter the library vector loop; C2
retains the filtered Java fallback below that span, separately for each coder. The
backend/tier gates below retain Java there while keeping interpreter, C1 and bulk C2
acceleration. Whole-string interpreter forward entries avoid the Java dispatch checks
for Latin-1, UTF-16 and mixed-coder searches. They reuse the shared entry generator;
platform code supplies calling conventions, publication checks, bounds and safepoint
polls. Search algorithms remain in the library and portable adapter.

The compiled UTF-16 fallback and long-needle C2 Latin-1 fallback check a candidate's
first character before verifying its interior; repeated-suffix overlaps no longer repeat
a long doomed comparison. For long needles with fewer than eight candidates, compiled
code scans the trailing characters and returns immediately if all candidates fail.
Latin-1 forward search keeps its original scalar loop inline. Its immediate-match probe
follows the source-size gate and precedes enable checking and native setup; short ranges
avoid the probe and extra calls. The expanded UTF-16 reverse helper exceeded C2's
hot-method size limit. A local `@ForceInline` annotation preserves caller optimization
without changing global compiler settings. The matched controls retain the losses
measured before these changes.

C2 forward and BMP character search and equality retain their existing JDK intrinsics.
[Final-code traces](measurements/FINAL_DIAGNOSTICS.md) confirm the equality intrinsic
and retain its generated code. The earlier [equality
audit](measurements/EQUALITY_AUDIT.md) found identical enabled/disabled instruction
sequences and sensitivity to array alignment on the earlier measured revision. It
retains smaller slower means and does not prove every difference is caused by alignment.
The character-search inlining trace also confirms the JDK intrinsic in enabled and
disabled runs. C2 equality and character-search ratios are control measurements, not
StringZilla equality improvements.

## Dispatch measured

The common 256-source-byte gate remains unchanged. After range normalization, `prefix =
fromIndex + needleCount`; prefix and needle count below use code units. Additional
native eligibility for same-coder substring reverse search is:

| Backend and tier | Additional eligibility |
| --- | --- |
| Serial/AVX2 C1, Latin-1 | Needle at most 256; longer needles require comparison work at least 1024 |
| Serial C2, Latin-1 | Needle 32–256 with prefix at least 1024; longer needles require comparison work at least 4096 |
| AVX2 C2, Latin-1 | Needle at most 128; needles 129–256 require comparison work at least 1024; longer needles require work at least 4096 and span at least 32 code units |
| Serial/AVX2 C1, UTF-16 | Needle at most 128; longer needles require comparison work at least 1024 |
| Serial C2, UTF-16 | Needle at most 128 with prefix at least 512; longer needles require comparison work at least 2048 |
| AVX2 C2, UTF-16 | Same as serial C2, plus span at least 16 code units for longer needles |
| Interpreter and other backend/tier combinations | Existing eligibility |

Comparison work is `(prefix - needleCount + 1) * needleCount`, computed with 64-bit
arithmetic. This activation estimate is separate from the native maximum-work safety
guard. The selected callback table supplies the backend; C1/C2 fold the compiler-tier
query into a constant.

Ineligible C1 UTF-16 inputs and C2 inputs with needles of at least 128 code units use a
separately compiled Java loop with a first-character candidate filter. Smaller ranges
retain the original in-method loop. Ineligible C1 Latin-1 inputs use the original Java
reverse loop. C2 Latin-1 uses a Java helper with explicit range checks. Needles up to
256 code units retain the original loop; longer needles reject first-character
mismatches before checking interiors. Ineligible serial C2 Latin-1 inputs use the
existing character-search intrinsic to skip 256-byte blocks without the needle's last
character, then resume the original reverse loop. Latin-1 probes an immediate match for
needles up to eight code units before the additional gate. Eligible serial UTF-16
needles up to 128 code units use the existing portable aligned batch filter directly.
UTF-16 also checks immediate matches of up to eight code units after the common
source-size gate and before tier dispatch. Interpreter whole-string forward search
bypasses the Java gate for all three coder combinations, within both native work limits.
Compiled forward/character search, mixed-coder reverse search and equality retain their
eligibility; mixed needles over 64 code units remain on Java.

Span is prefix minus needle count. The AVX2 kernel enters its vector loop only with 32
candidate bytes available; the C2 long-needle span guards retain Java below that
boundary. Interpreter and C1 eligibility are unchanged.

Compiled UTF-16 searches with needles longer than 128 code units and fewer than eight
candidate positions scan trailing characters before backend/work dispatch. The shared
UTF-16 reverse helper is forced inline so added control flow does not disable C2
optimization.

## Method

AMD EPYC 9V74, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op. Production
StringZilla kernels use GCC 16.0.1 (Ubuntu 16-20260322-1ubuntu1); the VM and other
native objects use GCC 14.2.0 release builds with the fork development profile. All
controls use the same image with default four-byte object headers. Source/runtime hashes
identify the measured code and binaries.

Each measurement uses two forks, three 500 ms warmups and five 500 ms measurement
iterations per fork. Runs are sequential, with no concurrent builds/tests, one active
processor, Serial GC and CDS disabled. Controls are interleaved per workload in rotating
order. Interpreter uses `-Xint`, C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses
`-XX:-TieredCompilation`.

* **Enabled:** `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** `-XX:-UseStringZillaIntrinsics`, retaining the fork's Java gates.
* **Original Java:** the disabled VM with unmodified `StringLatin1` and
  `StringUTF16` from base revision `87edd79d3104ff502f7befec034716b081436f49`
  compiled into a `java.base` patch. This isolates the original helper bodies;
  it is not a pristine whole-JDK build. Existing C2 forward/equality intrinsics
  remain active; the equality inlining check is recorded with the raw results.

`UseAVX=0`, `2` and `3` select serial, AVX2 and AVX-512 StringZilla dispatch on this
host. Serial dispatch in this GCC image does not qualify MSVC performance or a processor
without AVX. Each fork checks results against independent scalar search models and
character-array equality before timing.

## Results

Means and JMH 99.9% confidence half-widths are ns/op. The manifest specifies the
operation, input and expected result for every workload.

| Backend | Tier | Workload | Original Java | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| serial | c1 | UTF-16 reverse miss, 128 / 4 | 150.05 ± 2.67 | 81.40 ± 11.39 | 27.88 ± 0.55 |
| serial | c2 | UTF-16 reverse miss, 128 / 4 | 28.63 ± 2.03 | 26.71 ± 1.57 | 27.33 ± 0.56 |
| serial | c2 | Latin-1 reverse miss, 4096 / 4 | 722.45 ± 79.79 | 670.90 ± 15.61 | 204.84 ± 9.66 |
| avx2 | c2 | UTF-16 reverse miss, 128 / 4 | 30.31 ± 1.47 | 28.31 ± 1.67 | 28.53 ± 1.85 |
| avx2 | c2 | UTF-16 reverse miss, 129 / 4 | 27.71 ± 0.43 | 27.74 ± 1.41 | 27.18 ± 1.42 |
| serial | c2 | UTF-16 immediate reverse match, 128 / 4 | 5.61 ± 0.26 | 5.69 ± 0.56 | 4.29 ± 0.09 |
| avx2 | c2 | UTF-16 immediate reverse match, 128 / 4 | 5.51 ± 0.17 | 5.80 ± 0.23 | 4.45 ± 0.13 |
| avx2 | interpreter | Latin-1 forward miss, 32 / 4 | 462.73 ± 27.12 | 490.75 ± 39.16 | 186.48 ± 15.86 |
| avx2 | interpreter | UTF-16 reverse miss, 4 / 4 | 448.22 ± 24.26 | 459.30 ± 19.79 | 459.88 ± 43.80 |
| avx2 | interpreter | Mixed forward miss, 4 / 4 | 258.07 ± 19.43 | 274.82 ± 6.94 | 161.64 ± 7.70 |
| avx2 | interpreter | UTF-16 forward miss, 4 / 4 | 295.74 ± 17.19 | 300.90 ± 12.84 | 169.44 ± 5.77 |
| avx2 | interpreter | UTF-16 forward miss, 32 / 4 | 1,384.29 ± 113.35 | 1,374.84 ± 46.38 | 184.54 ± 7.92 |
| avx2 | c1 | Latin-1 forward miss, 4 / 4 | 6.02 ± 0.17 | 5.84 ± 0.16 | 5.89 ± 0.29 |
| avx2 | c2 | Latin-1 equality, 4096 | 71.09 ± 1.19 | 61.74 ± 16.12 | 74.35 ± 3.41 |

The full tables include the minimal repeated-suffix overlaps, comparison-work
boundaries, 64-code-unit needles, equality and every slower mean.

| Backend | Workload | Interpreter | C1 | C2 |
| --- | --- | ---: | ---: | ---: |
| avx2 | UTF-16 reverse miss near needle end, 4161 / 64 | 655.88× | 22.00× | 6.95× |
| serial | UTF-16 reverse miss near needle end, 4161 / 64 | 665.33× | 26.67× | 9.39× |
| avx512 | UTF-16 reverse miss near needle end, 4161 / 64 | 669.79× | 21.12× | 6.73× |
| avx2 | Latin-1 reverse miss, 4096 / 4 | 68.47× | 17.46× | 3.32× |
| avx2 | Mixed reverse miss, 4096 / 64 | 199.49× | 9.77× | 1.37× |
| avx2 | Latin-1 equality, 4096 | 300.88× | 40.32× | Existing JDK intrinsic |

Ratios are original Java / enabled. Values below one mean a slower enabled mean.

## Slower measurements

All 110 higher enabled means out of 1,212 control comparisons remain in the complete
tables, including overlapping confidence intervals. The higher, non-overlapping enabled
intervals are listed here:

| Backend | Tier | Workload | Original Java | Disabled | Enabled |
| --- | --- | --- | ---: | ---: | ---: |
| serial | interpreter | UTF-16 immediate reverse match, 128 / 4 | 652.54 ± 17.79 | 704.55 ± 24.05 | 698.22 ± 27.45 |

The [supplemental diagnostics](measurements/FINAL_DIAGNOSTICS.md) retain the remaining
immediate-hit interpreter cost versus original Java, including an AVX2 repeat with
non-overlapping intervals. This path returns from the Java probe before entering a
native leaf. An isolated probe candidate did not improve it and was rejected. All
primary measurements remain unchanged.

These interval comparisons are descriptive and have no multiple-testing correction.
Overlapping intervals do not establish equivalence. Results on one cloud host do not
establish zero regressions across all workloads or CPUs.

The [complete final tables](measurements/FINAL_BENCHMARKS.md) retain all 606 triplets
and both ratios. [Raw final samples](measurements/final-results.json) include iteration
data, VM options, compiler commands and source/runtime hashes. The [pre-merge focused
preflight](measurements/final-preflight.json) and [measurement
index](measurements/README.md) retain earlier losses, including the rejected ungated
UTF-16 probe. No primary result was replaced by a repeat.

ARM hardware and MSVC timings remain unmeasured; QEMU supplies functional ARM coverage.
JNI fallback has functional tests rather than a separate timing matrix.

## Reproduction

Build the classes and generated JMH harnesses for
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` and
`StringZillaLongNeedle.java` with JMH 1.37, or use the OpenJDK microbenchmark build. Set
`JMH_CLASSPATH` to those classes and the JMH dependencies. Prepare the original-Java
control:

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

The [pre-dispatch report](PRE_DISPATCH_BENCHMARKS.md) preserves the previous 765
measurements and their losses at revision `6f3f4d0`. The [intermediate dispatch
report](measurements/DISPATCH_36359F3_BENCHMARKS.md) preserves the 1,557 measurements at
`36359f3`, including the overlapping-match performance losses addressed by the final
routing. The [measurement index](measurements/README.md) links all historical datasets.
The earlier 23–27× result compared two enabled revisions, rather than original Java.
Integration and functional validation are documented in [README.md](README.md).