# Performance and qualification

Measurements use `190109a0d2dffbd96bdb606f1d7f8a4ceb0b439e`, based on
`master` at `87edd79d3104ff502f7befec034716b081436f49`, including four-byte
object headers. The subsequent runtime change at `bcaa0c0cd43` registers the
C1 guard handler for AOT code caching; intrinsic implementations are unchanged.

## Methodology

Measurements compare the same release image with `UseCommonIntrinsics`
disabled and enabled. JMH 1.37 uses three alternating fresh-JVM pairs, one
worker pinned to a CPU, three one-second warmups and five one-second
measurements per fork. The VM uses Serial GC, a 128–256 MiB heap, one active
processor and `CICompilerCount=2`. C1 stops at level 1; C2 disables tiered
compilation. Both compiled modes use `-Xbatch`. Compiler hints and compiler
blackholes use the standard JMH fork machinery. No local build or test runs
concurrently with the measurements.

Means are ns/op; speedup is disabled/enabled. Paired 95% Student-t intervals
use the three fork means, rather than treating iterations within a fork as
independent observations. The [complete CSV](summary.csv) includes C2 controls.
Public API cases include dispatch and allocation. BigInteger modPow uses
exponent 65537. Scalar inputs are non-final JMH state fields.

[Raw local samples, binary fingerprints and test summaries](https://github.com/re-thc/openjdk-jdk27u/tree/dce7a1df36b7ff3948464a4301fe0cd21efcf1ab/.github/qualification/local-x64)
are pinned separately from the implementation.
[Native x64 and ARM samples and test summaries](https://github.com/re-thc/openjdk-jdk27u/tree/c5ac319fa07293da056700b652a448a82ed8e889/.github/qualification)
include the CI environment and binary fingerprints.

## Linux x86-64

AMD EPYC 9V74, GCC 16.2, `UseAVX=3`, `MaxVectorSize=64`, SHA-3 enabled.

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup |
| --- | --- | ---: | ---: | ---: | ---: |
| AES-256 CTR | 4,096 bytes | 916,008.61 → 693.97 | 1319.96× | 37,911.08 → 353.61 | 107.21× |
| SHA-256 | 4,096 bytes | 1,586,556.30 → 6,874.13 | 230.80× | 29,101.06 → 2,490.64 | 11.68× |
| SHA3-256 | 4,096 bytes | 944,367.10 → 13,266.81 | 71.18× | 21,862.96 → 8,164.71 | 2.68× |
| byte[] hash | 4,096 bytes | 33,408.92 → 1,531.69 | 21.81× | 3,480.26 → 1,493.97 | 2.33× |
| BigInteger multiply | 4,096 bits | 518,747.33 → 36,427.54 | 14.24× | 25,771.01 → 5,753.75 | 4.48× |
| BigInteger modPow | 4,096 bits | 19,117,847.57 → 733,349.46 | 26.07× | 826,828.74 → 123,143.06 | 6.71× |
| long bitCount | scalar | 99.98 → 47.35 | 2.11× | 3.46 → 0.58 | 5.98× |

All seven C2 control intervals include zero; none establishes a slowdown in
these selected cases. A separate GitHub Actions x64 run on an EPYC 9V74 also
passes the C2 controls. These measurements do not establish whole-application
throughput or the absence of every possible regression.

## Linux AArch64

Neoverse-N2, native GCC 16 release image from the same implementation revision.

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup |
| --- | --- | ---: | ---: | ---: | ---: |
| AES-256 CTR | 4,096 bytes | 938,877.04 → 1,659.14 | 565.88× | 48,889.08 → 1,214.56 | 40.25× |
| SHA-256 | 4,096 bytes | 1,653,903.00 → 7,499.56 | 220.53× | 33,945.46 → 2,110.12 | 16.09× |
| SHA3-256 | 4,096 bytes | 1,043,906.21 → 13,404.74 | 77.88× | 15,642.93 → 7,725.08 | 2.02× |
| byte[] hash | 4,096 bytes | 52,497.59 → 1,310.19 | 40.07× | 3,640.56 → 1,226.57 | 2.97× |
| BigInteger multiply | 4,096 bits | 574,556.16 → 33,415.89 | 17.19× | 31,991.44 → 5,975.64 | 5.35× |
| BigInteger modPow | 4,096 bits | 21,000,096.69 → 805,827.85 | 26.06× | 1,024,346.50 → 189,494.63 | 5.41× |
| long bitCount | scalar | 117.21 → 55.83 | 2.10× | 3.16 → 2.92 | 1.08× |

The three-pair C2 controls measure +0.0051 ns for bitCount (95% interval
+0.0038 to +0.0063 ns) and +4.54 ns for multiply (+0.94 to +8.15 ns).
A separate confirmation uses six alternating fresh-VM pairs, eight one-second
warmups and ten two-second measurements per fork:

| C2 control | Off → on | Paired 95% change |
| --- | ---: | ---: |
| long bitCount | 0.611 → 0.608 ns/op | −0.0266 to +0.0214 ns |
| BigInteger multiply | 5,065.32 → 5,030.54 ns/op | −118.04 to +48.49 ns |

Both confirmation intervals include zero; the initial small slowdowns do not
reproduce. This does not prove the absence of every C2 regression.
[Confirmation samples](https://github.com/re-thc/openjdk-jdk27u/tree/55353f8ced7c9b67a199791a255350f70fe29496/.github/qualification/arm-controls)
include the native environment and complete fork results.

## Guard isolation

The mixed benchmark combines two checked additions and an int-array hash.
Before/after measurements compare the synced baseline `d55aaad40b2` with the
updated implementation on the same host. Three fresh pairs alternate version
order; setup warms the caller before causing one guard failure, then warms it
again before measurement. `-Xbatch` ensures the failure reaches compiled C1.

| Array elements | Before, after one failed guard | Updated, after one failed guard | Paired 95% change |
| ---: | ---: | ---: | ---: |
| 1,024 | 379.00 ns/op | 386.38 ns/op | −9.37 to +24.12 ns |
| 4,096 | 1,490.22 ns/op | 1,506.97 ns/op | −64.94 to +98.44 ns |

These cases show no established throughput change after the policy fix.
The compilation tests separately verify that failing one site leaves other
sites accelerated, and that repeated rejected inputs keep the same compiled
method. The measurement does not imply that the earlier policy slowed every
mixed caller.

## Startup

The historical interpreter startup regression was +1.07 ms, approximately
4.2%, with a paired 95% interval of +0.145 to +1.986 ms. It is retained as a
measured cost of the historical implementation, not dismissed as noise.
[Historical methodology and samples](https://github.com/re-thc/openjdk-jdk27u/blob/5330bbb8568e6bdc89bf6528e066d06918c58184/doc/common-intrinsics/BENCHMARKS.md)
remain pinned.

The updated interpreter skips unused Base64 compiler stubs and x86 SIMD-sort
library loading. A paired comparison on the same current host uses 100 blocks
of four fresh `java -version` processes: each version with the flag off and on,
reversing order in alternate blocks. Ten initial blocks are discarded. The
baseline includes the upstream sync and uses the same object-header defaults.

| Interpreter flag cost | Mean | Paired 95% interval |
| --- | ---: | ---: |
| Synced baseline | +1.513 ms | +0.741 to +2.285 ms |
| Updated implementation | −0.120 ms | −0.797 to +0.557 ms |
| Change in flag cost | −1.633 ms | −2.747 to −0.518 ms |

A separate current-image run uses 100 alternating fresh-VM pairs per tier,
with ten warm pairs discarded. Worker and coordinator use separate CPUs;
Serial GC, a 32–256 MiB heap and one active processor are fixed.

| Mode | Off → on | Mean change | Paired 95% interval |
| --- | ---: | ---: | ---: |
| Interpreter | 21.052 → 21.211 ms | +0.160 ms | −0.233 to +0.552 ms |
| C1 | 22.097 → 22.599 ms | +0.502 ms | −0.208 to +1.211 ms |
| C2 | 24.304 → 24.302 ms | −0.003 ms | −0.507 to +0.502 ms |

The paired before/after result establishes a reduction in interpreter startup
cost on this host. The local current-image intervals include zero, which does
not prove zero overhead. The separate x64 CI run measures an interpreter cost
of +0.366 ms (95% interval +0.214 to +0.518 ms) and a C1 cost of +0.643 ms
(+0.568 to +0.718 ms). Its C2 interval includes zero. On ARM the interpreter
cost is +0.208 ms
(+0.016 to +0.400 ms), and the C1 cost is +0.212 ms (+0.002 to +0.423 ms).
The ARM C2 interval also includes zero.

The flag remains enabled by default: the measured interpreter and C1
throughput gains justify retaining a small startup cost for these modes.
`-XX:-UseCommonIntrinsics` remains available for startup-sensitive workloads.

## Hardware and runtime qualification

On the AVX-512 host, release and fastdebug common-intrinsic tests pass,
including breakpoint-only debugging, guard isolation at C1 levels 1 and 3,
method handles, streaming digests, vector boundaries and aliases. Fastdebug
uses `CheckUnhandledOops` and `VerifyOops`. The AVX-512 test requires native
Keccak execution in interpreter and both C1 modes. Related HotSpot AES,
BigInteger, ChaCha20 and digest tests also pass.

[Final packaged-image qualification](https://github.com/re-thc/openjdk-jdk27u/blob/147796219f1a96a890994ee3bc264bf709aa0235/.github/qualification/local-x64/head-qualification.json)
at `bcaa0c0cd43` passes all 18 common-intrinsic records in each build and the
seven AOT/CDS records below. The report includes binary fingerprints.

[Native Linux x64 and AArch64 qualification](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38315107246)
passes release and fastdebug common-intrinsic suites, related HotSpot and JDK
crypto/BigInteger tests, and C1 math tests at levels 1 and 3. The x64 CI host
also executes the AVX-512 cases. ARM skips x86-only tests.

[AOT code-cache qualification](https://github.com/re-thc/openjdk-jdk27u/blob/55353f8ced7c9b67a199791a255350f70fe29496/.github/qualification/local-x64/aot-current.json)
passes seven AOT/CDS runtime records on fastdebug, including
G1, Serial and ZGC caches, compressed-oop configurations and CPU compatibility.

A C1-only x86 VM built from the benchmarked implementation with
`--with-jvm-features=-compiler2` passes scalar arithmetic, scalar operations,
guard isolation and level-1 method handles.
[WhiteBox verifies that C2 is excluded](https://github.com/re-thc/openjdk-jdk27u/blob/55353f8ced7c9b67a199791a255350f70fe29496/.github/qualification/local-x64/c1-current.json).
The copied class image uses
`-Xshare:off`; C1-only performance is outside this evidence.

The 391-entry applicability audit, official include-order checker and
compilation of all four JMH classes pass. Windows AVX-512 execution and tier2
remain outside the qualified scope.

## Reproduction

Configure with jtreg and JMH, then use the standard harness:

```sh
make CONF=your-build images
python3 make/scripts/check-common-intrinsics.py
make CONF=your-build test TEST='test/hotspot/jtreg/compiler/intrinsics/common'
make CONF=your-build test \
  TEST='micro:org.openjdk.bench.vm.compiler.Common.*Intrinsics' \
  MICRO='FORK=3;VM_OPTIONS=-Xint -XX:+UseCommonIntrinsics'
```

Repeat with `-XX:-UseCommonIntrinsics`, and use
`-Xbatch -XX:TieredStopAtLevel=1` or `-Xbatch -XX:-TieredCompilation` for the
compiled modes. The mixed benchmark uses `failedGuard=false,true` and
`size=1024,4096`.
