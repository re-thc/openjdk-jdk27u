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
full GCC 16 VM build. All controls use the same image.

Each of the 54 cases uses two isolated forks, three 500 ms warmups and five
500 ms measurements per fork. Runs are sequential with no concurrent builds or
tests, one active processor, Serial GC and CDS disabled. Interpreter uses
`-Xint`, C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses `-XX:-TieredCompilation`.
`UseAVX=2` selects AVX2 kernels; `UseAVX=3` selects AVX-512 on this machine.

* **Enabled:** `-XX:+UseStringZillaIntrinsics`.
* **Disabled:** `-XX:-UseStringZillaIntrinsics`, retaining the fork's Java gates.
* **Original Java:** the same disabled VM with unmodified `StringLatin1` and
  `StringUTF16` from base revision `8d8d71a045285f6d4c42ba44e4a9c8f696ead5df`
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
| Near-end miss | Interpreter | 475,061.66 ± 15,208.97 | 477,483.94 ± 12,181.53 | 1,573.01 ± 102.19 | 302.01× | 303.55× |
| Near-end miss | C1 | 7,494.48 ± 626.33 | 6,884.89 ± 122.52 | 1,023.86 ± 20.76 | 7.32× | 6.72× |
| Near-end miss | C2 | 2,763.66 ± 133.33 | 2,652.34 ± 90.36 | 1,063.99 ± 107.48 | 2.60× | 2.49× |
| Repeated-suffix match | Interpreter | 4,521,322.71 ± 303,529.06 | 4,552,596.72 ± 204,509.82 | 1,048.25 ± 43.19 | 4313.23× | 4343.06× |
| Repeated-suffix match | C1 | 63,122.67 ± 2,388.68 | 50,498.60 ± 3,396.19 | 757.37 ± 26.52 | 83.34× | 66.68× |
| Repeated-suffix match | C2 | 23,091.57 ± 1,763.54 | 20,073.62 ± 1,337.54 | 755.68 ± 42.97 | 30.56× | 26.56× |
| Crossed-byte control | Interpreter | 151,558.93 ± 10,304.63 | 152,069.53 ± 3,946.01 | 655.01 ± 28.76 | 231.38× | 232.16× |
| Crossed-byte control | C1 | 4,725.43 ± 97.64 | 3,186.96 ± 331.61 | 294.65 ± 6.25 | 16.04× | 10.82× |
| Crossed-byte control | C2 | 717.10 ± 41.49 | 710.83 ± 25.28 | 291.15 ± 9.75 | 2.46× | 2.44× |

### AVX-512

| Fixture | Tier | Original Java (ns/op) | Disabled (ns/op) | Enabled (ns/op) | Original / enabled | Disabled / enabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| Near-end miss | Interpreter | 476,076.28 ± 36,364.67 | 483,272.95 ± 20,330.76 | 851.50 ± 10.17 | 559.10× | 567.56× |
| Near-end miss | C1 | 7,696.65 ± 487.07 | 7,039.69 ± 448.58 | 372.03 ± 9.76 | 20.69× | 18.92× |
| Near-end miss | C2 | 2,668.88 ± 132.45 | 2,602.35 ± 71.66 | 398.12 ± 18.84 | 6.70× | 6.54× |
| Repeated-suffix match | Interpreter | 4,360,687.04 ± 126,351.44 | 4,622,864.72 ± 260,748.85 | 295.51 ± 4.21 | 14756.43× | 15643.64× |
| Repeated-suffix match | C1 | 66,500.99 ± 10,750.51 | 50,056.90 ± 2,625.06 | 52.81 ± 3.70 | 1259.21× | 947.84× |
| Repeated-suffix match | C2 | 20,982.74 ± 2,286.83 | 20,988.46 ± 1,294.33 | 48.72 ± 3.87 | 430.64× | 430.76× |
| Crossed-byte control | Interpreter | 151,922.06 ± 4,015.58 | 154,848.36 ± 4,139.62 | 657.60 ± 27.12 | 231.03× | 235.48× |
| Crossed-byte control | C1 | 4,784.09 ± 168.81 | 2,642.52 ± 363.42 | 295.94 ± 8.44 | 16.17× | 8.93× |
| Crossed-byte control | C2 | 706.11 ± 64.20 | 673.25 ± 8.12 | 309.89 ± 23.09 | 2.28× | 2.17× |

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
    git show 8d8d71a045285f6d4c42ba44e4a9c8f696ead5df:src/java.base/share/classes/java/lang/$class.java > original-src/java/lang/$class.java
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
