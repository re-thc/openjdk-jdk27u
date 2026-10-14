# Performance and qualification

Current x64 measurements use `8bf01e9ed8a3df53fd8836d61216ed511ad3e591`
and unmodified `master` at `87edd79d3104ff502f7befec034716b081436f49`, with
the same four-byte object-header defaults. Native tests and startup comparisons
also use these revisions on AArch64. The ARM throughput reference below uses
`190109a0d2d`.

## Methodology

Current x64 measurements compare unmodified master with the modified release
image at its default enabled setting. ARM reference measurements compare the
same older image with the flag disabled and enabled. JMH 1.37 uses three alternating fresh-JVM pairs, one
worker pinned to a CPU, three one-second warmups and five one-second
measurements per fork. The VM uses Serial GC, a 128–256 MiB heap, one active
processor and `CICompilerCount=2`. C1 stops at level 1; C2 disables tiered
compilation. Both compiled modes use `-Xbatch`. Compiler hints and compiler
blackholes use the standard JMH fork machinery. No local build or test runs
concurrently with the measurements.

Means are ns/op. Current x64 speedup is master/modified; ARM reference speedup
is disabled/enabled. Paired 95% Student-t intervals
use the three fork means, rather than treating iterations within a fork as
independent observations. The [current x64 CSV](summary.csv) includes C2 controls and experiment sizes.
Public API cases include dispatch and allocation. BigInteger modPow uses
exponent 65537. Scalar inputs are non-final JMH state fields.

[Current x64 samples, binary fingerprints and all test summaries](https://github.com/re-thc/openjdk-jdk27u/tree/08e855a448acda54c7b1872c286443495503f11a/.github/qualification/final-x64)
are pinned separately from the implementation. The same record retains
unprepared startup samples and the loading controls.
[Historical native ARM evidence](https://github.com/re-thc/openjdk-jdk27u/tree/c5ac319fa07293da056700b652a448a82ed8e889/.github/qualification/ci-linux-aarch64)
records the reference revision and hardware.

## Linux x86-64

AMD EPYC 9V74, GCC 16.2, `UseAVX=3`, `MaxVectorSize=64`, SHA-3 enabled.

| Workload | Input | Interpreter ns/op, master → modified | Speedup | C1 ns/op, master → modified | Speedup |
| --- | --- | ---: | ---: | ---: | ---: |
| AES-256 CTR | 4,096 bytes | 958,959.60 → 744.37 | 1288.29× | 38,508.41 → 360.06 | 106.95× |
| SHA-256 | 4,096 bytes | 1,610,809.35 → 7,021.25 | 229.42× | 30,532.93 → 2,571.65 | 11.87× |
| SHA3-256 | 4,096 bytes | 941,863.50 → 13,652.17 | 68.99× | 21,967.80 → 8,249.30 | 2.66× |
| byte[] hash | 4,096 bytes | 33,001.55 → 1,589.13 | 20.77× | 3,601.03 → 1,554.20 | 2.32× |
| BigInteger multiply | 4,096 bits | 522,480.74 → 36,999.18 | 14.12× | 26,821.64 → 6,196.43 | 4.33× |
| BigInteger modPow | 4,096 bits | 18,774,800.02 → 789,476.20 | 23.78× | 865,865.06 → 131,578.49 | 6.58× |
| long bitCount | scalar | 98.87 → 48.45 | 2.04× | 3.58 → 0.59 | 6.06× |

The three-pair C2 intervals include zero. Multiplication and SHA-256 also
have six alternating pairs with eight one-second warmups and ten two-second
measurements per fork:

| C2 control | Master → modified | Paired 95% change |
| --- | ---: | ---: |
| BigInteger multiply | 4,782.95 → 4,824.75 ns/op | −155.92 to +239.52 ns |
| SHA-256 | 2,502.42 → 2,477.22 ns/op | −45.76 to −4.63 ns |

These selected controls do not establish a C2 slowdown. Kernel measurements
include public API dispatch and allocation; they do not establish
whole-application throughput.

## Linux AArch64 reference

Neoverse-N2, native GCC 16 release image at `190109a0d2d`. These historical
flag comparisons are separate from the current x64 master comparison.

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

The implementation defers compiler stubs until an enabled bulk-intrinsic class
is linked after bootstrap, outside the leaf adapters. C2 initialization shares
the same serialized publication. Interpreter entries retain Java until the
stubs are ready. Scalar and hash entries do not require the compiler blob.
Existing C1 availability checks keep their direct path, and interpreter entry
lookup remains inline.

Current x64 measurements compare `8bf01e9ed8a` with unmodified `master` at
`87edd79d3104`. Each mode uses 600 blocks containing master, modified flag-off
and modified flag-on, cycling through all six orders. Eighteen warm blocks are
discarded. The worker and coordinator use separate CPUs; Serial GC,
32–256 MiB heap and one active processor are fixed.

| Mode | Master → modified enabled | Paired change | 95% interval |
| --- | ---: | ---: | ---: |
| Interpreter | 20.941 → 20.849 ms | −0.092 ms | −0.324 to +0.141 ms |
| C1 | 22.478 → 22.597 ms | +0.119 ms | −0.150 to +0.387 ms |
| C2 | 23.677 → 23.754 ms | +0.078 ms | −0.138 to +0.293 ms |

The corresponding flag-off/on changes are +0.083 ms (−0.108 to +0.274),
+0.282 ms (−0.0003 to +0.563) and −0.024 ms (−0.307 to +0.260).
These intervals do not establish a startup regression or prove zero overhead.

Both JVM libraries were prepared with an identical single-CPU copy before
warming; SHA-256 verifies unchanged bytes. Unprepared local images measured
+0.37–0.50 ms against master, concentrated in library loading. A standalone
`dlopen` control measured 1.410 versus 1.701 ms on the original files, while
identically prepared copies measured 1.446 versus 1.459 ms (paired change
+0.013 ms, 95% interval −0.023 to +0.050 ms). Initial and
controlled samples are retained with the evidence. These are warm-start
measurements of these images, not cold-start or whole-application guarantees.
An independent [native CI run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38397336007)
uses the same 600-block design and identical library preparation:

| Architecture | Mode | Master → modified enabled | Paired change | 95% interval |
| --- | --- | ---: | ---: | ---: |
| x64 | Interpreter | 20.027 → 20.065 ms | +0.038 ms | −0.008 to +0.083 ms |
| x64 | C1 | 21.452 → 21.420 ms | −0.032 ms | −0.083 to +0.019 ms |
| x64 | C2 | 23.843 → 23.867 ms | +0.024 ms | −0.063 to +0.112 ms |
| AArch64 | Interpreter | 20.656 → 20.394 ms | −0.262 ms | −0.342 to −0.183 ms |
| AArch64 | C1 | 22.254 → 22.061 ms | −0.193 ms | −0.283 to −0.104 ms |
| AArch64 | C2 | 23.979 → 23.922 ms | −0.056 ms | −0.127 to +0.014 ms |

The native x64 flag-off/on interpreter comparison measures +0.051 ms
(95% interval +0.013 to +0.090 ms). Its master comparison includes zero,
as do all other native flag-off/on intervals. These results do not establish
zero enabled-path cost.

## Hardware and runtime qualification

The final x64 implementation at `8bf01e9ed8a` passes 136 jtreg records:

| Selection | Passed |
| --- | ---: |
| Common intrinsics, release | 20 |
| Common intrinsics, fastdebug | 20 |
| Related HotSpot crypto and BigInteger | 11 |
| JDK crypto | 74 |
| AOT/CDS and code-cache overflow, fastdebug | 10 |
| Flagless metaspace/CDS | 1 |

Fastdebug common tests use `CheckUnhandledOops` and `VerifyOops`. AVX-512
execution covers shifts, tails, aliases and native Keccak in interpreter and
C1 levels 1 and 3. Tests also cover breakpoint-only debugging, per-site guard
feedback, method handles and concurrent first-use publication.

Polynomial assignment tests cover lengths 0–33, selection and aliasing,
and the public two-limb general-purpose field in interpreter, C1 and C2.
A native Linux probe reproduces the old Microsoft x64 ABI register collision
and passes with the fixed scalar loop; it is not a Windows PR-JVM execution.
The 391-entry applicability audit and official include-order checker pass.

The [code-identical Linux run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38385226401)
passes all four release/debug builds and 23 of 24 tier1 selections. AArch64
runtime fails `FourByteHeaderArchiveDeterminism.java#z`: the first two ZGC
archives differ at byte 1,785,800. [Paired baseline/PR reproduction](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38640541680)
is queued; this failure has not been attributed to the PR. The docs-only head
has no new CI run.

[Windows/macOS release/debug builds](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38393501715)
pass; their tier1 jobs are skipped. The [targeted native run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38397336007)
passes all six test selections on both x64 and AArch64: common intrinsics in
release/fastdebug, related HotSpot tests, JDK crypto and C1 math at levels 1
and 3. Windows AVX-512 execution and tier2 remain outside the evidence.

Earlier native ARM tests and the C1-only x64 scalar/guard/method-handle checks
remain [reference evidence](https://github.com/re-thc/openjdk-jdk27u/blob/55353f8ced7c9b67a199791a255350f70fe29496/.github/qualification/local-x64/c1-current.json).
C1-only performance is unqualified.

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

For current-head comparisons, build unmodified master with the same toolchain
and run the same benchmarks at default flag settings. For flag comparisons,
repeat with `-XX:-UseCommonIntrinsics`. Use
`-Xbatch -XX:TieredStopAtLevel=1` or `-Xbatch -XX:-TieredCompilation` for the
compiled modes. The mixed benchmark uses `failedGuard=false,true` and
`size=1024,4096`.
