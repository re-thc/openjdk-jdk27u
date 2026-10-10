# Benchmarks and validation

## Measurement scope

These measurements qualify implementation
`263a1ee20fb3520fa5c6c25179ea9517465e78e8`, before the upstream sync.
They are historical evidence, not measurements of the updated branch.

The baseline is the same release JDK with `UseCommonIntrinsics` disabled.
The host is an AMD EPYC 7763 running Ubuntu 24.04, with JDK 27.0.2-internal,
GCC 10.5.0 and JMH 1.37. One worker is pinned to CPU 0, using a 128 MiB heap,
Serial GC, one active processor and one compiler thread. This CPU lacks
AVX-512, so SHA-3 and vector shifts retain their Java paths.

Each case uses three externally launched fresh JVMs, with one case per process
and JMH `-f 0`. Each process has three warmups (300 ms for interpreter/C1,
one second for C2) and five 300 ms measurements. Compiler hints and full Java
blackholes are explicit. No build or test runs concurrently.

Means are ns/op; speedup is disabled/enabled. The [complete CSV](summary.csv)
contains all 78 comparisons and 99.9% Student-t intervals across 15 iterations.
[Raw samples, compiler hints, binary fingerprints and full methodology](https://github.com/re-thc/openjdk-jdk27u/blob/5330bbb8568e6bdc89bf6528e066d06918c58184/doc/common-intrinsics/BENCHMARKS.md)
remain available at the pinned evidence revision.

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup |
| --- | --- | ---: | ---: | ---: | ---: |
| AES-256 CTR | 4,096 bytes | 1,270,873.02 → 1,383.06 | 918.88× | 48,900.51 → 860.75 | 56.81× |
| ChaCha20 | 4,096 bytes | 1,808,299.96 → 709,067.17 | 2.55× | 14,228.48 → 3,289.41 | 4.33× |
| byte[] hash | 4,096 bytes | 93,086.86 → 1,731.29 | 53.77× | 3,836.29 → 1,615.30 | 2.37× |
| BigInteger modPow | 4,096 bits | 30,180,790.47 → 1,033,281.53 | 29.21× | 920,332.70 → 133,825.49 | 6.88× |
| BigInteger multiply | 4,096 bits | 996,706.15 → 50,173.15 | 19.87× | 28,850.76 → 6,255.59 | 4.61× |
| SHA-256 | 4,096 bytes | 2,102,231.70 → 14,898.99 | 141.10× | 31,514.77 → 3,623.16 | 8.70× |
| long bitCount | scalar | 179.99 → 82.39 | 2.18× | 4.06 → 0.94 | 4.34× |

Public API cases include dispatch and allocation costs. BigInteger modPow uses
exponent 65537. Scalar inputs are non-final JMH state fields. Private shift
cases in the CSV reuse arrays and include method-handle invocation cost.

Longer paired controls cover all initially non-overlapping C2 comparisons and
C1 slowdowns. Three fresh off/on pairs use alternating order, three one-second
warmups and five one-second measurements. No paired 95% interval establishes
a slowdown in those controls. In 25 paired fresh `java -version` processes per
tier, interpreter startup increases by 1.07 ms (95% interval +0.14 to +1.99 ms);
C1 and C2 intervals include zero.

Shared cloud resources and short measurements limit precision. These selected
workloads do not establish whole-application throughput or the absence of all
regressions. ARM performance, pure-C1 runtime/performance and tier2 are outside
this evidence.

## Validation

Post-sync validation is pending. The earlier
[native sanity matrix](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37725033578)
passed 96 jobs, and [targeted qualification](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37725140740)
passed 230 jtreg records on native x86-64/AArch64 release and fastdebug images.
The pinned evidence revision records selections, VM options and exclusions.

## Reproduction

Configure with jtreg and JMH, then use the standard harness:

```sh
make CONF=your-build jdk
python3 make/scripts/check-common-intrinsics.py
make CONF=your-build test TEST='test/hotspot/jtreg/compiler/intrinsics/common'
make CONF=your-build test \
  TEST='micro:org.openjdk.bench.vm.compiler.Common.*Intrinsics' \
  MICRO='FORK=3;VM_OPTIONS=-Xint -XX:+UseCommonIntrinsics'
```

Repeat the microbenchmarks with `-XX:-UseCommonIntrinsics`, and with
`-XX:TieredStopAtLevel=1` or `-XX:-TieredCompilation` in place of `-Xint`.
The standard harness uses JMH forks; the historical evidence used the external
fresh-process launcher retained at the pinned revision.
