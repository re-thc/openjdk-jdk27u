# Benchmark and validation evidence

Implementation: `263a1ee20fb3520fa5c6c25179ea9517465e78e8`.
Base: `33e539f2d4a847f283a3793df6eebd41b9d1dfac`.

Measured on native x86-64: **AMD EPYC 7763 64-Core Processor**, Ubuntu 24.04, Linux-6.17.0-1022-azure-x86_64-with-glibc2.39. The release image uses GCC 10.5.0; JMH 1.37 runs on JDK 27.0.2-internal. The measurement worker is pinned to CPU 0. This CPU lacks AVX-512: SHA-3 and vector shift backends are unavailable, so those rows measure the retained Java paths.

The baseline is the same release JDK with `UseCommonIntrinsics` disabled;
existing intrinsics remain enabled. A single worker and its processes are
pinned to one CPU, with a fixed 128 MiB heap, Serial GC, one active processor
and one compiler thread.

Interpreter uses `-Xint`, C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses
`-XX:-TieredCompilation`. Each parameter case runs in three externally launched
fresh JVMs. Each JVM uses three warmups (300 ms in interpreter/C1, one second
in C2) and five 300 ms measurements. No build, test or profiler runs
during measurement. Each process runs exactly one case with JMH `-f 0`; tier
and feature flags are supplied directly to that JVM. JMH supplies its normal
compiler hints explicitly, with full Java blackholes selected consistently
in all modes. External process isolation avoids a second driver
VM and its thread overhead. The raw results retain `forks=0`,
`externalFreshProcesses=3`, per-process scores/errors and every raw iteration. The exact
[compiler directives](results/compiler-hints) are retained.

Means are ns/op; speedup is baseline/enabled. `~` marks overlapping
99.9% Student-t intervals across 15 measurement iterations;
an overlapping interval does not establish a performance change.
The [CSV](summary.csv) retains means, errors and interval overlap
for all 78 comparisons; [raw JSON](results/) retains every measurement.

## Public APIs

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup | C2 speedup |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| AES-256 CTR | 64 bytes | 20,140.23 → 604.94 | 33.29× | 795.24 → 99.47 | 7.99× | ~0.97× |
| AES-256 CTR | 4,096 bytes | 1,270,873.02 → 1,383.06 | 918.88× | 48,900.51 → 860.75 | 56.81× | ~1.00× |
| ChaCha20 | 64 bytes | 29,011.91 → 11,772.64 | 2.46× | 238.07 → 70.74 | 3.37× | ~0.94× |
| ChaCha20 | 4,096 bytes | 1,808,299.96 → 709,067.17 | 2.55× | 14,228.48 → 3,289.41 | 4.33× | 1.02× |
| byte[] hash | 64 bytes | 1,625.26 → 148.75 | 10.93× | 60.83 → 39.34 | 1.55× | ~1.00× |
| byte[] hash | 4,096 bytes | 93,086.86 → 1,731.29 | 53.77× | 3,836.29 → 1,615.30 | 2.37× | 0.99× |
| int[] hash | 16 ints | 538.27 → 135.45 | 3.97× | 18.40 → 15.52 | 1.19× | ~1.00× |
| int[] hash | 1,024 ints | 23,213.47 → 535.39 | 43.36× | 960.48 → 416.89 | 2.30× | ~1.00× |
| BigInteger modPow | 512 bits | 683,651.50 → 61,609.53 | 11.10× | 21,954.21 → 4,581.06 | 4.79× | ~0.99× |
| BigInteger modPow | 4,096 bits | 30,180,790.47 → 1,033,281.53 | 29.21× | 920,332.70 → 133,825.49 | 6.88× | ~1.00× |
| BigInteger multiply | 512 bits | 19,802.74 → 582.70 | 33.98× | 574.31 → 135.33 | 4.24× | ~0.99× |
| BigInteger multiply | 4,096 bits | 996,706.15 → 50,173.15 | 19.87× | 28,850.76 → 6,255.59 | 4.61× | ~1.00× |
| SHA-256 | 64 bytes | 73,298.76 → 6,123.69 | 11.97× | 1,093.85 → 176.35 | 6.20× | 1.06× |
| SHA-256 | 4,096 bytes | 2,102,231.70 → 14,898.99 | 141.10× | 31,514.77 → 3,623.16 | 8.70× | ~1.00× |
| SHA3-256 | 64 bytes | 59,614.44 → 59,143.52 | ~1.01× | 967.98 → 969.02 | ~1.00× | 1.01× |
| SHA3-256 | 4,096 bytes | 1,563,895.13 → 1,511,820.60 | ~1.03× | 24,931.10 → 24,919.50 | ~1.00× | ~1.00× |

`hashInts` uses `length/4` elements. BigInteger bit counts are capped at
4096, and modPow uses exponent 65537. AES and ChaCha20 reuse initialized
streaming ciphers. Digest cases include public API finalization; BigInteger
cases include result allocation.

## Direct integer operations

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup | C2 speedup |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| long addExact | scalar | 128.61 → 97.20 | 1.32× | 5.31 → 3.13 | 1.70× | ~1.00× |
| long bitCount | scalar | 179.99 → 82.39 | 2.18× | 4.06 → 0.94 | 4.34× | ~1.01× |
| long leadingZeros | scalar | 121.45 → 82.63 | 1.47× | 3.75 → 0.94 | 4.01× | ~0.99× |
| long multiplyHigh | scalar | 194.61 → 95.94 | 2.03× | 5.94 → 3.12 | 1.90× | ~0.99× |
| long reverseBits | scalar | 225.59 → 91.35 | 2.47× | 8.44 → 4.37 | 1.93× | ~1.00× |
| long unsignedDivide | scalar | 151.24 → 96.14 | 1.57× | 7.50 → 3.44 | 2.18× | ~1.00× |

Scalar inputs are non-final JMH state fields. C1 lowers these operations
directly; C2 already has dedicated implementations.

## In-place BigInteger workers

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup | C2 speedup |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| primitive left shift | 16 limbs | 916.51 → 889.20 | ~1.03× | 29.34 → 29.32 | ~1.00× | ~1.01× |
| primitive left shift | 256 limbs | 9,064.46 → 9,380.20 | ~0.97× | 408.87 → 409.36 | ~1.00× | ~1.00× |
| primitive right shift | 16 limbs | 899.62 → 891.79 | ~1.01× | 26.52 → 26.50 | ~1.00× | ~1.00× |
| primitive right shift | 256 limbs | 9,454.82 → 9,432.61 | ~1.00× | 369.62 → 369.05 | ~1.00× | ~0.99× |

These cases call the private primitive shift workers through constant
method handles and include their invocation cost. They reuse an int array
and shift by seven bits, measuring the in-place paths used internally by
BigInteger. They do not measure public API allocation.

## Control checks

Longer controls use three fresh off/on JVM pairs with alternating order, three one-second warmups and five one-second measurements. These cover every C2 comparison whose original 99.9% intervals do not overlap, and every C1 slowdown with non-overlapping intervals. The paired 95% interval uses the three process-mean differences; a positive interval entirely above zero indicates a reproducible slowdown in this check. [Raw paired controls](results/control-confirmation.json) retain all iterations and process means.

| Mode | Workload | Input | Off/on speedup | Paired on-minus-off ns/op (95% interval) |
| --- | --- | --- | ---: | ---: |
| c2 | chacha20 | 4096 | 1.00× | -7.53 [-23.74, +8.68] |
| c2 | hashBytes | 4096 | 1.00× | +0.02 [-8.58, +8.62] |
| c2 | sha256 | 64 | 1.05× | -5.58 [-8.03, -3.13] |
| c2 | sha3 | 64 | 1.01× | -4.45 [-16.77, +7.86] |

No paired 95% interval establishes a slowdown in these longer controls. This limits the performance claim to the measured cases and hardware.

## Startup

The enabled interpreter generates compiler stubs during VM initialization.
This check times `java -version` in 25 paired fresh processes per tier,
alternating off/on order, pinned to the same CPU, with a 32 MiB fixed heap and
one active processor, one compiler thread and Serial GC. Wall time includes initialization and exit; RSS is
each process's `wait4` maximum. No build or test runs concurrently.

| Mode | Off ms | On ms | Paired on-minus-off ms (95% interval) | Off/on mean RSS KiB |
| --- | ---: | ---: | ---: | ---: |
| int | 25.47 | 26.54 | +1.07 [+0.14, +1.99] | 40,788 / 40,989 |
| c1 | 28.48 | 28.33 | -0.15 [-0.97, +0.67] | 42,020 / 42,203 |
| c2 | 31.27 | 30.69 | -0.58 [-1.66, +0.50] | 43,051 / 43,052 |

Intervals use Student-t on 25 paired time differences. [startup.json](results/startup.json)
contains all 150 observations. This measures launcher/VM startup and peak
process RSS, not application startup or retained heap memory.

## Validation

The full [repository sanity matrix](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37725033578) passes with **96 successful jobs**. Alpine Linux is skipped by the existing repository configuration. Windows ARM’s NMT stack-top assertion passes on retry; the [paired NMT control](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37733379705) also passes all **140 native tests in each of six fresh off/on processes**, using the same final-source debug image.

Native release and fastdebug builds pass on x86-64 and AArch64. The [native tier1 run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37725033578) also builds the pure-C1 minimal and Zero configurations. Both native Linux architectures pass all 12 tier1 groups: HotSpot compiler (three partitions), common, GC, runtime and serviceability; JDK (three partitions); language tools; and test libraries.

The [dedicated qualification run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37725140740) passes all six selections on each architecture:

| jtreg selection | x86-64 passed | AArch64 passed |
| --- | ---: | ---: |
| Common intrinsics, release | 13 | 12 |
| Common intrinsics, fastdebug | 13 | 12 |
| Selected HotSpot AES/BigInteger/digest/ChaCha tests | 11 | 11 |
| Selected JDK crypto/arithmetic/hash tests | 74 | 72 |
| C1 math, level 1 | 3 | 3 |
| C1 math, level 3 | 3 | 3 |

Counts are test records in each selection, including repeat execution in release/debug and C1 modes. AArch64 excludes three x86-only records by their existing platform requirements: `TestCommonScalarFlags`, `TestGCMSplitBound`, and ML-DSA's AVX-specific test variant. The remaining common tests include ARM's SIMD-SHA3 opt-out, method-handle fallback, and the native JVMTI event agent. Every selected, applicable record passes.

The regression suite covers independent arithmetic and in-place shift oracles, C1 evaluation order,
unsigned multiply-add limbs, streaming digest known answers, public API
transcripts, method-handle caller state, CPU opt-outs, intrinsic controls and
JVMTI method-entry events. Valid arithmetic inputs compile before rejected
inputs can suppress guarded operations. Streaming tests verify ten digest
variants across uneven chunks, nonzero offsets and repeated resets. The shift
oracle covers every shift count from 1 to 31 and short/long loop boundaries.
Fastdebug runs enable `CheckUnhandledOops` and `VerifyOops`.

The 391-entry catalogue checker, official source include-order checker,
Python/shell syntax and whitespace checks pass. All shared entries are
non-native.

[validation.json](results/validation.json) records the final revision, actual
results and VM options. [Image fingerprints](results/image-sha256.json) identify
the measured and tested binaries. The deterministic public API transcript is
`f459f5ec15a357973e2e84ab16ca7cff567fe4cad8f169d6cf63bb1e3b57d6c4`.

## Scope and uncertainty

These selected cases cover the implemented paths, not every catalogue
entry or whole-application throughput. Short measurements and shared cloud
resources limit precision. C2 controls check existing implementations;
an overlapping interval does not prove that all regressions are absent.
Native ARM64 performance, pure C1 runtime/performance and tier2 qualification
remain outside this report. Native build and test coverage is listed above.

## Reproduction

Use the normal configure/make workflow, then run:

```sh
make CONF=your-build jdk
python3 make/scripts/check-common-intrinsics.py
make CONF=your-build test TEST='test/hotspot/jtreg/compiler/intrinsics/common'
```

For a direct jtreg run, first build its native agent and supply its directory:

```sh
make CONF=your-build test-image-hotspot-jtreg-native
"$BOOT_JDK/bin/java" -jar "$JTREG_HOME/lib/jtreg.jar" \
  -jdk:/path/to/built-jdk -othervm -conc:1 \
  -nativepath:/path/to/test-image/hotspot/jtreg/native \
  -w:/path/to/work -r:/path/to/report \
  test/hotspot/jtreg/compiler/intrinsics/common
```

The selected jtreg qualification uses Serial GC, one active processor, two
compiler threads, assertions (`-ea -esa`), `-XX:-UsePerfData -XX:+DisableAttachMechanism -Xrs` and a fixed random
seed of 42. Tests prescribe their own additional VM modes. Select the full
paths and options listed in the validation manifest.

Build the three common-intrinsic microbenchmark classes with the repository
microbenchmark build or JMH 1.37's annotation processor, then run:

```sh
bash make/scripts/bench-common-intrinsics.sh \
  /path/to/built-jdk/bin/java \
  '/path/to/jmh-and-generated-benchmark-jars/*' /path/to/results 0
```

VM arguments, flags, fresh-process counts and per-iteration samples are included
in each result file. Ratios use ns/op means for matched cases and flag states.
