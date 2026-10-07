# Benchmark and validation evidence

Base: `33e539f2d4a847f283a3793df6eebd41b9d1dfac`. Linux x86-64,
AMD EPYC 9V74, GCC 16 release VM, JMH 1.37, one worker pinned to CPU 0,
128 MiB fixed heap, `ActiveProcessorCount=1`. The baseline is the same JDK
with `UseCommonIntrinsics` disabled; existing intrinsics stay enabled.
The pristine base image also produced the identical differential-test transcript.

Interpreter: `-Xint`; C1: `-XX:TieredStopAtLevel=1`; C2:
`-XX:-TieredCompilation`. Ordinary measurements use three fresh forks,
three 300 ms warmups and five 300 ms measurements per case. Means are ns/op;
speedup is baseline/enabled. The CSV contains errors and interval types.
`~` marks C2 results with overlapping intervals or a confirmation interval
including zero; these do not establish a performance change.

## Bulk public APIs

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup | C2 speedup |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| AES-256 CTR | 64 bytes | 14,732.3 → 495.4 | 29.74× | 619.8 → 77.2 | 8.03× | ~0.94× |
| AES-256 CTR | 4,096 bytes | 891,996.2 → 835.4 | 1067.70× | 40,026.2 → 354.1 | 113.03× | ~1.00× |
| ChaCha20 | 64 bytes | 20,988.5 → 7,739.5 | 2.71× | 208.3 → 51.6 | 4.04× | ~1.00× |
| ChaCha20 | 4,096 bytes | 1,281,808.8 → 469,229.4 | 2.73× | 12,860.7 → 2,065.2 | 6.23× | ~1.00× |
| byte[] hash | 64 bytes | 597.9 → 106.7 | 5.60× | 57.1 → 36.2 | 1.58× | ~1.00× |
| byte[] hash | 4,096 bytes | 30,789.2 → 1,610.1 | 19.12× | 3,547.7 → 1,470.8 | 2.41× | ~1.00× |
| int[] hash | 16 ints | 238.4 → 102.0 | 2.34× | 16.3 → 13.8 | 1.18× | ~0.97× |
| int[] hash | 1,024 ints | 8,600.3 → 472.4 | 18.21× | 909.8 → 382.6 | 2.38× | ~0.99× |
| BigInteger modPow | 512 bits | 459,380.3 → 35,610.2 | 12.90× | 18,956.6 → 3,953.4 | 4.80× | ~0.98× |
| BigInteger modPow | 4,096 bits | 19,543,451.4 → 776,149.0 | 25.18× | 886,248.1 → 135,051.3 | 6.56× | ~1.12× |
| BigInteger multiply | 512 bits | 15,275.4 → 394.1 | 38.77× | 514.0 → 126.0 | 4.08× | ~0.98× |
| BigInteger multiply | 4,096 bits | 824,803.9 → 40,661.6 | 20.28× | 27,368.2 → 6,141.6 | 4.46× | ~0.92× |
| SHA-256 | 64 bytes | 67,357.6 → 4,310.2 | 15.63× | 1,021.9 → 169.5 | 6.03× | ~1.00× |
| SHA-256 | 4,096 bytes | 2,158,169.0 → 6,746.8 | 319.88× | 27,984.4 → 2,602.9 | 10.75× | ~0.99× |
| SHA3-256 | 64 bytes | 40,677.4 → 5,147.0 | 7.90× | 839.4 → 394.7 | 2.13× | ~0.96× |
| SHA3-256 | 4,096 bytes | 1,082,698.4 → 13,466.9 | 80.40× | 21,817.5 → 7,933.9 | 2.75× | ~0.99× |

`hashInts` uses `length/4` elements. BigInteger's bit count is capped at 4096;
modPow's exponent is 65537. AES/ChaCha20 reuse initialized streaming ciphers,
digests include their public API finalization, and BigInteger operations include
result allocation. These are selected public API cases, not measurements of
every catalogue entry or whole-application throughput.

## Direct integer operations

| Workload | Input | Interpreter ns/op, off → on | Speedup | C1 ns/op, off → on | Speedup | C2 speedup |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| long addExact | scalar | 81.9 → 58.9 | 1.39× | 2.29 → 0.64 | 3.59× | ~0.97× |
| long bitCount | scalar | 150.1 → 58.5 | 2.56× | 3.49 → 0.57 | 6.12× | ~1.07× |
| long leadingZeros | scalar | 98.1 → 49.3 | 1.99× | 2.35 → 0.58 | 4.02× | ~1.01× |
| long multiplyHigh | scalar | 144.2 → 47.9 | 3.01× | 3.54 → 0.65 | 5.48× | ~1.02× |
| long reverseBits | scalar | 173.4 → 52.1 | 3.33× | 5.96 → 1.81 | 3.30× | ~1.03× |
| long unsignedDivide | scalar | 107.2 → 50.3 | 2.13× | 3.66 → 1.98 | 1.85× | ~1.00× |

The scalar inputs are non-final JMH state fields. C1's improvements come from
direct lowering; C2 already lowers these operations.

## C2 confirmation and measurement limits

The short initial hash control reported slowdowns in C2's int[] cases.
Diagnostic compilation logs confirmed selection of the original C2
`vectorizedHashCode` intrinsic in both modes. The repeat below used five fresh
paired forks, alternating mode order, three one-second warmups and five
one-second measurements. No local build/test/profiler ran during this repeat.
The table and main CSV use these longer C2 hash results. All initial samples
remain in `results/final-hash-c2-*.json` so the earlier observation is reviewable.

| C2 hash control | Input | Off ns/op | On ns/op | On-time change (paired 95% interval) |
| --- | --- | ---: | ---: | ---: |
| byte[] hash | 64 bytes | 8.59 | 8.57 | -0.29% [-3.69, +3.24] |
| byte[] hash | 4,096 bytes | 177.30 | 178.07 | +0.44% [-1.05, +1.96] |
| int[] hash | 16 ints | 7.01 | 7.19 | +2.57% [-0.13, +5.34] |
| int[] hash | 1,024 ints | 44.19 | 44.56 | +0.84% [-2.35, +4.14] |

Intervals use a Student-t interval on five paired log time ratios, without
multiplicity correction. Every interval includes zero. The shortest int[]
case still allows about a 5.3% slowdown; this is not a universal no-regression
guarantee. Shared cloud resources and short ordinary runs limit precision.
Native ARM64 performance, other operating systems, pure C1 builds and full
HotSpot/JDK tier1/tier2 runs have not been qualified.

C1's final samples (`reviewed-c1-*.json`) include the final inlining,
fixed-register and missing-backend changes. Interpreter bulk/scalar and C2
samples precede the final C1-only availability/register bookkeeping; their
executed operation implementations are unchanged. The final VM/class image
hashes are recorded separately. An early short-array hash slowdown was fixed
by force-inlining the C1 Java helper; final C1 samples include this fix.

## Correctness and builds

* x86-64 release: full `jdk` build passes.
* AArch64 fastdebug: cross-built HotSpot, java.base libraries and launcher pass.
  QEMU `-cpu max` checks use ARM binaries and identical Java classes; emulation
  is correctness evidence, not an ARM performance measurement.
* Five new jtreg tests pass on the final x86 VM: public API differential
  transcript, scalar bit-loop oracles, BigInteger arithmetic oracles including
  register pressure, null/bounds/large-array fallback and availability/opt-out.
* Existing HotSpot BigInteger, SHA, AES and ChaCha selection: 11 passed,
  four skipped and two did not meet platform requirements. The include-order
  test was one platform exclusion (release VM); its official source checker
  was then run directly and passed.
* Existing JDK AES/ChaCha/AEAD, MessageDigest and ML-DSA: 65 jtreg results passed.
* Existing Integer/Long unsigned, Math exact and Arrays hash tests: four passed.
  **85 selected jtreg results passed**, with no failures/errors in these final
  selections. Counts are result entries, not internal framework assertions.
  [validation.json](results/validation.json) records each selected test path,
  result and timestamp, plus the final build output and image fingerprints.
* ARM debug public API transcripts match the pristine x86 Java baseline in
  interpreter and C1 modes, including `CheckUnhandledOops`/`VerifyOops` checks.
  Final scalar, arithmetic/register-pressure and fallback programs pass in
  interpreter, C1 level 1 and profiling C1 level 3; availability/opt-out checks
  pass too. ARM has no bulk ECB stub; its Java ECB loop reaches the shared
  AES block intrinsic. Optional parallel Keccak stubs remain platform dependent.
* G1, ZGC and Shenandoah C1 transcripts agree at a 64 MiB maximum heap.
  Disabling x86 LZCNT/TZCNT/POPCNT passes scalar checks in interpreter/C1 modes.

The deterministic public API transcript is
`f459f5ec15a357973e2e84ab16ca7cff567fe4cad8f169d6cf63bb1e3b57d6c4`.

## Reproduction

Build with the repository's normal configure/make workflow and run:

```sh
make CONF=your-build jdk
python3 make/scripts/check-common-intrinsics.py
make CONF=your-build test TEST='test/hotspot/jtreg/compiler/intrinsics/common'
```

The direct harness used here was jtreg 8.3:

```sh
"$BOOT_JDK/bin/java" -jar "$JTREG_HOME/lib/jtreg.jar"   -jdk:/path/to/built-jdk -othervm -conc:2   -w:/path/to/work -r:/path/to/report   test/hotspot/jtreg/compiler/intrinsics/common
```

For existing suites add `-javaoptions:'-Xbatch -XX:TieredStopAtLevel=1'`
and select the test paths in `results/validation.json`, prefixed with
`test/hotspot/jtreg/` or `test/jdk/` as indicated by the suite. Tests with their
own VM options still select their prescribed compilation mode.
Build the two JMH classes with the
repository microbenchmark build, or JMH 1.37's annotation processor. Supply
the JMH/generated benchmark jars to:

```sh
bash make/scripts/bench-common-intrinsics.sh   /path/to/built-jdk/bin/java '/path/to/jmh-and-benchmark-jars/*' /path/to/results 0
```

The final C1 confirmation uses the same runner settings with only the C1 tier.
For the longer C2 hash control select `CommonIntrinsics.hash.*`, `-f 1`,
`-wi 3 -i 5 -w 1s -r 1s`, and repeat five off/on pairs with alternating order.
Raw JMH JSON, including each measurement iteration, is in [results](results/).
[summary.csv](summary.csv) contains all 66 comparisons. Early tuning probes
are not presented as final measurements.
