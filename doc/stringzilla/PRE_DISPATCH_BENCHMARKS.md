# Pre-dispatch StringZilla benchmarks

These historical results describe revision `6f3f4d03ce83fbcef5816f1138b6c905fe3eb346`.
See [BENCHMARKS.md](BENCHMARKS.md) for the current dispatch and measurements.

The final-code matrix contains **53 distinct workloads**. All 53 run with AVX2;
16 representative workloads also run with serial and AVX-512 dispatch. Each uses
interpreter, C1 and C2 with enabled, disabled and original-Java controls: **255
control triplets, 765 measurements and 1,530 isolated JVM forks**.

The matrix includes:

* UTF-16 reverse search with 64-code-unit needles, a mismatch near either end,
  and repeated-prefix lengths of 512 and 4096. The appended odd-byte occurrence
  makes the actual haystacks 577 and 4161 code units. It also retains the
  256-code-unit mismatch, 129-code-unit UTF-16 and 257-byte Latin-1 overlapping matches, and crossed-byte cases.
* Short searches and misses below, at and above the 256-source-byte gate:
  Latin-1 lengths 255/256/257 and UTF-16 lengths 127/128/129, plus 4- and 32-code-unit
  inputs and immediate forward matches.
* Latin-1 forward/reverse search, a 64-code-unit Latin-1 needle, UTF-16 forward
  search, and mixed-coder forward/reverse needles of 64 and 65 code units. The
  latter exercises the Java fallback beyond the widening limit.
* Equality on distinct strings constructed from separate character arrays:
  4/8/9/32-code-unit and threshold equal inputs and 4096-code-unit equal, first-mismatch and
  last-mismatch inputs, for both Latin-1 and UTF-16.
* `StringBuilder`, `StringBuffer` and character-search callers.

[The manifest](coverage-cases.tsv) specifies every operation, size, coder,
position, needle and backend. The serial subset includes short/threshold cases,
64- and 256-code-unit needles, overlapping matches, Latin-1/mixed search and
equality; it is not an extrapolation from vector results.

## Method

AMD EPYC 9V74, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op.
Production StringZilla kernels use GCC 16.0.1 (Ubuntu 16-20260322-1ubuntu1);
the VM and other native objects use GCC 14.2.0 release builds with the fork
development profile. This measures GCC 16 kernels in the GCC 14 image, not a
full GCC 16 VM build. All controls use the same post-merge image with default
four-byte object headers, portable scalar loads, the overlapping reverse-search
fix, first-byte prefix filter, strengthened UTF-16 candidate filter and separate C1 mixed scalar loop.

Each measurement uses two forks, three 500 ms warmups and five 500 ms measurement
iterations per fork. Runs are sequential, with no concurrent builds or tests,
one active processor, Serial GC and CDS disabled. The three controls are
interleaved for each workload, with rotating order. Interpreter uses `-Xint`,
C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses `-XX:-TieredCompilation`.

* **Enabled:** `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** `-XX:-UseStringZillaIntrinsics`, retaining the fork's Java gates.
* **Original Java:** the disabled VM with unmodified `StringLatin1` and
  `StringUTF16` from base revision `87edd79d3104ff502f7befec034716b081436f49`,
  compiled into a `java.base` patch. This isolates the original helper bodies;
  it is not a pristine whole-JDK build. Existing C2 forward/equality intrinsics
  remain available in this control.

`UseAVX=0`, `2` and `3` select serial, AVX2 and AVX-512 StringZilla dispatch on
this machine. Serial dispatch is measured in the same GCC image; it does not
qualify MSVC performance or a machine without AVX. Setup checks search results
against independent scalar models and equality against character-array content
before timing in every fork.

## Results

Representative original-Java / enabled mean ratios are shown below. Sizes
are code units (haystack / needle for search). Values below 1 indicate slower
enabled means; the complete tables provide uncertainty and disabled controls.

| Backend | Workload | Interpreter | C1 | C2 |
| --- | --- | ---: | ---: | ---: |
| avx2 | Latin-1 forward miss, 32 / 4 | 0.95× | 0.97× | 0.91× |
| avx2 | UTF-16 reverse miss, 128 / 4 | 12.06× | 2.76× | 0.63× |
| avx2 | UTF-16 reverse, near-end mismatch, 577 / 64 | 167.98× | 14.36× | 4.78× |
| avx2 | UTF-16 reverse, near-end mismatch, 4161 / 64 | 740.20× | 20.57× | 7.01× |
| avx2 | UTF-16 reverse, near-start mismatch, 4161 / 64 | 2565.23× | 32.68× | 12.44× |
| avx2 | Latin-1 reverse miss, 4096 / 4 | 70.46× | 17.58× | 3.25× |
| avx2 | Mixed reverse miss, 4096 / 64 | 207.67× | 9.83× | 1.42× |
| avx2 | Mixed reverse miss, 4096 / 65 | 0.96× | 1.67× | 1.00× |
| avx2 | Mixed forward miss, 4096 / 65 | 1.09× | 1.00× | 1.00× |
| avx2 | Latin-1 equality, 4096 | 244.37× | 40.17× | 0.72× |
| avx2 | UTF-16 equality, 4096 | 351.78× | 41.31× | 1.00× |
| serial | UTF-16 reverse, near-end mismatch, 4161 / 64 | 741.20× | 18.35× | 6.17× |
| serial | UTF-16 reverse, overlapping match, 642 / 129 | 4837.30× | 85.86× | 37.04× |
| serial | Latin-1 reverse, overlapping match, 770 / 257 | 1557.36× | 184.01× | 49.95× |
| serial | UTF-16 reverse miss, 128 / 4 | 7.83× | 0.54× | 0.10× |
| serial | Latin-1 reverse miss, 4096 / 4 | 16.11× | 1.98× | 0.36× |
| serial | Latin-1 equality, 4096 | 263.56× | 4.90× | 1.10× |
| avx512 | UTF-16 reverse, near-end mismatch, 4161 / 64 | 813.15× | 21.17× | 7.21× |
| avx512 | Latin-1 equality, 4096 | 227.47× | 50.43× | 0.96× |

Interval comparisons across the 255 control triplets:

| Control | Enabled interval below control | Overlap | Enabled interval above control |
| --- | ---: | ---: | ---: |
| original | 176 | 71 | 8 |
| disabled | 172 | 77 | 6 |

Searches beyond the mixed-coder widening limit remain on Java. Existing C2
forward-search/equality paths and short-input gates are measured as controls,
not counted as universal acceleration.

The higher enabled intervals include material serial-dispatch costs. The
UTF-16 reverse miss at 128 code units takes 284 ns in C1 versus 153 ns original
and 89 ns disabled, and 287 ns in C2 versus 28 ns original and 30 ns disabled.
Serial C2 Latin-1 reverse misses take 133 ns at length 256 versus 49/52 ns
original/disabled, and 1889 ns at length 4096 versus 686/685 ns.

With AVX2, C2 UTF-16 reverse misses at lengths 128 and 129 take about 48 ns
versus 27–30 ns for the controls. C2 Latin-1 equality at length 4096 takes
71 ns versus 51 ns original and 71 ns disabled; the latter intervals overlap.
The four-code-unit mixed-coder forward miss in the interpreter takes 270 ns
versus 250 ns original and 268 ns disabled. These are remaining performance
limitations, even though many longer searches and interpreter/C1 equality
cases improve. Raising the shared search gate would also affect the measured
interpreter/C1 gains; these results do not establish one optimal gate for
every tier and backend.

[Complete tables](measurements/COVERAGE_BENCHMARKS.md) include all 255 triplets,
means, JMH 99.9% confidence intervals, both speedup ratios and slower cases.
[Raw measurements](measurements/coverage-results.json) preserve all iteration
samples, parameters, JVM options, compiler flags and source/artifact hashes.
A ratio below 1 means the enabled mean was slower. Non-overlapping intervals
are a descriptive comparison; overlapping intervals do not prove equivalence.

These measurements cover the stated workloads on one x86 cloud host. They do
not establish zero regressions for every workload or processor. ARM hardware
performance and MSVC performance remain unmeasured. QEMU supplies functional
ARM coverage; JNI fallback has functional tests rather than a separate timing
matrix.

## Reproduction

Build the classes and generated JMH harnesses for both
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` and
`StringZillaLongNeedle.java` with JMH 1.37, or use the OpenJDK microbenchmark
build. Set `JMH_CLASSPATH` to those classes and the JMH dependencies. Prepare the
original-Java control:

```sh
mkdir -p original-src/java/lang original-classes
for class in StringLatin1 StringUTF16; do
    git show 87edd79d3104ff502f7befec034716b081436f49:src/java.base/share/classes/java/lang/$class.java > original-src/java/lang/$class.java
done
"$TEST_JDK/bin/javac" --patch-module=java.base=original-src \
    -d original-classes original-src/java/lang/*.java
```

Run on an x86 host supporting AVX-512 after all builds and tests finish:

```sh
doc/stringzilla/run-coverage-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" original-classes final-coverage 0
```

The [measurement index](measurements/README.md) retains the earlier focused run
and historical datasets. The earlier 23–27× result compared two enabled
revisions and is not a feature speedup against original Java. Integration and
functional validation are documented in [README.md](README.md).
