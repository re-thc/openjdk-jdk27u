# StringZilla benchmarks

These measurements compare the final implementation with StringZilla disabled
and with the original Java search helpers. They include portable scalar loads,
the overlapping reverse-search fix and the strengthened UTF-16 candidate filter.
The earlier 23–27× result compared two enabled revisions; it is preserved in
[the historical report](measurements/BOUNDED_BENCHMARKS.md).

## Method

AMD EPYC 9V74, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op.
Production StringZilla kernels use GCC 16.0.1 (Ubuntu 16-20260322-1ubuntu1);
the VM and other native objects use GCC 14.2.0 release builds with the fork
development profile. This is a GCC 16 kernel integration measurement, not a
full GCC 16 VM build. All controls use the same image with four-byte object
headers enabled by default.

Each of the 54 cases uses two isolated forks, three 500 ms warmups and five
500 ms measurements per fork. Runs are sequential with no concurrent builds or
tests, one active processor, Serial GC and CDS disabled. Interpreter uses
`-Xint`, C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses `-XX:-TieredCompilation`.
`UseAVX=2` selects AVX2 kernels; `UseAVX=3` selects AVX-512 on this machine.

* **Enabled:** `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** `-XX:-UseStringZillaIntrinsics`, retaining the fork's Java gates.
* **Original Java:** the same disabled VM with unmodified `StringLatin1` and
  `StringUTF16` from base revision `87edd79d3104ff502f7befec034716b081436f49`
  compiled into a `java.base` patch. This isolates the original search bodies;
  it is not a pristine whole-JDK build.

`StringZillaLongNeedle.lastIndexOf` validates every fixture against an independent
scalar model before timing:

| Fixture | Haystack code units | Needle code units | Expected result |
| --- | ---: | ---: | ---: |
| Near-end mismatch and odd-byte occurrence (`NEAR_END`) | 4353 | 256 | -1 |
| Repeated suffix after a complete match (`OVERLAP`) | 642 | 129 (258 bytes) | 0 |
| Crossed-byte short-needle control (`CROSSED`) | 4101 | 4 | -1 |

## Results

Means include the JMH 99.9% confidence half-width. Ratios are control / enabled;
values below 1 denote a slower enabled mean. Every case in this selected matrix
is included. [Raw measurements](measurements/long-needle-results.json) preserve
all iteration samples, JVM arguments, compiler flags and artifact/source hashes.

### AVX2

| Fixture | Tier | Original Java (ns/op) | Disabled (ns/op) | Enabled (ns/op) | Original / enabled | Disabled / enabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| Near-end miss | Interpreter | 460,328.24 ± 22,331.11 | 475,919.96 ± 30,272.28 | 1,519.75 ± 41.85 | 302.90× | 313.16× |
| Near-end miss | C1 | 7,616.15 ± 453.53 | 7,128.79 ± 396.75 | 1,010.36 ± 18.02 | 7.54× | 7.06× |
| Near-end miss | C2 | 2,495.47 ± 251.27 | 3,237.13 ± 881.23 | 1,017.19 ± 34.05 | 2.45× | 3.18× |
| Repeated-suffix match | Interpreter | 4,314,745.29 ± 108,232.67 | 4,315,818.94 ± 91,600.19 | 952.81 ± 54.31 | 4528.43× | 4529.55× |
| Repeated-suffix match | C1 | 60,005.70 ± 1,779.62 | 50,819.99 ± 1,835.27 | 730.20 ± 93.51 | 82.18× | 69.60× |
| Repeated-suffix match | C2 | 19,450.75 ± 309.29 | 21,503.13 ± 3,001.02 | 694.16 ± 41.33 | 28.02× | 30.98× |
| Crossed-byte control | Interpreter | 142,427.28 ± 5,969.68 | 155,282.01 ± 9,618.02 | 656.77 ± 29.65 | 216.86× | 236.43× |
| Crossed-byte control | C1 | 4,905.76 ± 254.86 | 2,576.43 ± 160.26 | 300.37 ± 6.25 | 16.33× | 8.58× |
| Crossed-byte control | C2 | 695.87 ± 50.85 | 694.34 ± 38.39 | 290.41 ± 16.15 | 2.40× | 2.39× |

### AVX-512

| Fixture | Tier | Original Java (ns/op) | Disabled (ns/op) | Enabled (ns/op) | Original / enabled | Disabled / enabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| Near-end miss | Interpreter | 468,090.02 ± 22,959.54 | 467,730.18 ± 20,888.39 | 888.98 ± 32.18 | 526.55× | 526.14× |
| Near-end miss | C1 | 7,777.84 ± 542.19 | 7,037.32 ± 391.84 | 364.53 ± 9.76 | 21.34× | 19.31× |
| Near-end miss | C2 | 2,769.42 ± 104.01 | 3,190.28 ± 860.97 | 376.18 ± 18.80 | 7.36× | 8.48× |
| Repeated-suffix match | Interpreter | 4,361,690.93 ± 194,510.93 | 4,292,977.22 ± 153,885.23 | 299.23 ± 7.99 | 14576.39× | 14346.76× |
| Repeated-suffix match | C1 | 60,972.70 ± 3,107.61 | 50,368.27 ± 1,795.68 | 49.70 ± 2.77 | 1226.87× | 1013.49× |
| Repeated-suffix match | C2 | 21,036.82 ± 1,920.65 | 19,853.62 ± 619.25 | 48.34 ± 2.68 | 435.15× | 410.68× |
| Crossed-byte control | Interpreter | 141,860.84 ± 4,905.04 | 146,843.45 ± 2,841.66 | 651.34 ± 38.93 | 217.80× | 225.45× |
| Crossed-byte control | C1 | 4,755.61 ± 104.69 | 2,623.69 ± 204.10 | 303.36 ± 9.18 | 15.68× | 8.65× |
| Crossed-byte control | C2 | 678.50 ± 9.30 | 671.19 ± 21.55 | 300.59 ± 21.34 | 2.26× | 2.23× |

For each measured case, the enabled 99.9% interval lies below both control
intervals. These results cover the selected x86 workloads and both executable SIMD
backends. They do not establish zero regressions for every workload or processor.
ARM hardware performance remains unmeasured; QEMU provides functional coverage.

## Reproduction

Build the JMH classes and generated harnesses for
`test/micro/org/openjdk/bench/java/lang/StringZillaLongNeedle.java` with JMH 1.37,
or use the OpenJDK microbenchmark build. Set `JMH_CLASSPATH` to those classes and
the JMH dependencies. Build the original Java helper control from the base:

```sh
mkdir -p original-src/java/lang original-classes
for class in StringLatin1 StringUTF16; do
    git show 87edd79d3104ff502f7befec034716b081436f49:src/java.base/share/classes/java/lang/$class.java > original-src/java/lang/$class.java
done
"$TEST_JDK/bin/javac" --patch-module=java.base=original-src \
    -d original-classes original-src/java/lang/*.java
```

Run after all builds and tests finish:

```sh
doc/stringzilla/run-long-needle-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" original-classes final-avx2 0
STRINGZILLA_USE_AVX=3 doc/stringzilla/run-long-needle-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" original-classes final-avx512 0
```

The [measurement index](measurements/README.md) also retains the earlier feature
off/on and bounded-implementation datasets with their original validation and
build metadata. Integration and validation are documented in [README.md](README.md).
