# simdutf benchmark evidence

## Public API results against the original JDK

The historical matrix compares pristine master
`33e539f2d4a847f283a3793df6eebd41b9d1dfac` with an enabled simdutf build:
31 public API cases × three sizes (32, 128, 65,536) × interpreter/C1/C2,
for 279 paired comparisons. The table shows the 65,536 size parameter.
Speedup is original-JDK mean divided by enabled mean; values below 1 measured
slower.

**These measurements precede the final shared thresholds and platform,
capacity and converter fixes. Current-head public API measurements and native
ARM64/Windows performance remain outstanding.** Small or near-neutral changes
do not establish a benefit, and this one-host study cannot establish absence
of regressions.

| Public benchmark | C2 | C1 | Interpreter |
| --- | ---: | ---: | ---: |
| asciiCharValidation | 9.04× | 144.83× | 4509.40× |
| asciiDecode | 0.98× | 6.60× | 71.24× |
| asciiEncode | 1.06× | 7.12× | 72.78× |
| asciiValidation | 41.19× | 358.21× | 4288.05× |
| base64Decode | 1.00× | 2.31× | 44.27× |
| base64Encode | 1.11× | 59.71× | 1053.04× |
| base64StreamEncode | 41.14× | 64.78× | 505.97× |
| charArrayCodePointCount | 1.84× | 7.32× | 160.02× |
| charArrayString | 1.05× | 3.13× | 169.32× |
| charsetAsciiEncode | 1.05× | 19.09× | 283.49× |
| charsetDecode | 2.70× | 6.78× | 126.49× |
| charsetEncode | 4.93× | 9.62× | 177.95× |
| codePointCount | 1.73× | 7.00× | 362.21× |
| encodedLength | 7.73× | 33.05× | 892.26× |
| latin1CharsetEncode | 0.94× | 14.05× | 206.43× |
| latin1Decode | 1.59× | 3.02× | 56.93× |
| latin1Encode | 3.41× | 4.90× | 103.05× |
| latin1EncodedLength | 23.54× | 83.88× | 857.31× |
| latin1ToChars | 1.01× | 6.96× | 86.76× |
| latin1Validation | 4.51× | 70.09× | 2552.93× |
| supplementaryDecode | 1.79× | 3.06× | 81.56× |
| supplementaryEncode | 2.07× | 3.43× | 118.95× |
| unicodeValidation | 132.80× | 265.92× | 6385.20× |
| utf16CharsetDecode | 71.82× | 131.58× | 3661.22× |
| utf16CharsetEncode | 85.37× | 154.01× | 3399.90× |
| utf16Encode | 2.50× | 4.17× | 114.76× |
| utf16ToChars | 0.99× | 4.91× | 222.14× |
| utf32CharsetDecode | 47.61× | 118.08× | 2687.66× |
| utf32CharsetEncode | 49.43× | 159.09× | 3632.06× |
| utf32TightCharsetDecode | 12.42× | 30.20× | 764.88× |
| utf8Decode | 1.72× | 4.65× | 79.66× |

The size parameter counts characters/code units for String/charset cases and
binary input bytes for Base64; decoder byte buffers may be larger. Existing
C2 copy/Base64 stubs explain several near-parity results. The benchmark source
now has 33 cases; the two additional ASCII UTF-8 charset cases are absent from
this historical matrix.

## Method and reproduction

Linux x86-64, AMD EPYC 9V74 with AVX-512/VBMI2, GNU 14 JDK 27 release and
JMH 1.37. One worker is pinned to CPU 2 with Serial GC, a 512 MiB fixed heap,
one active processor and one compiler thread. C2 uses `-XX:-TieredCompilation`,
C1 uses `-XX:TieredStopAtLevel=1`, and interpretation uses `-Xint`.

Each operation/binary/tier uses two fresh VMs. Within each VM, sizes are
measured separately with two 100 ms warmups and three 100 ms measurements.
Sizes share compiler profiles. Means pool six samples; descriptive 99.9%
Student-t intervals use five degrees of freedom, with correlated within-fork
iterations. Generated compiler hints and FULL_DONTINLINE Blackhole directives
are installed explicitly.

Run from the repository root with freshly built benchmark classes and both JDKs:

```sh
taskset -c 2 python3 make/scripts/bench-simdutf.py \
  --baseline /path/to/pristine-jdk --enabled /path/to/proposed-jdk \
  --classpath '/path/to/benchmark/classes:/path/to/jmh/*' \
  --output /tmp/simdutf-results --sizes 32,128,65536 \
  --jvm-args '--finalization=disabled -Xrs -XX:+UseSerialGC -XX:-UsePerfData -XX:ActiveProcessorCount=1 -XX:CICompilerCount=1'
```

The runner normally uses forked JMH. Add
`--external-forks --batch-sizes --warmup 2 --time 100ms` to reproduce the
historical protocol. For stronger crossover checks, omit batching and use
`--warmup 5 --time 500ms`. `--resume` verifies binary/classpath fingerprints,
flags, measurement parameters and complete benchmark/size pairs before reusing
results. The proposed JDK enables simdutf by default; no enable flag is needed.

Use an original JDK as the headline baseline. For dispatch experiments using
the same fork binary on both sides, pass
`--baseline-jvm-args=-XX:-UseSIMDUTFIntrinsics`; this measures the fork's
opt-out path and must be labeled separately.

## Threshold evidence

The exploratory crossover sweep contains 441 pairs: 21 operations × seven
sizes (16–1,024) × three tiers. It compares the same pre-tuning JDK with
acceleration disabled and with `SIMDUTFMinLength=1`, rather than original-JDK
performance.

Forced C2 code-point counting and UTF-8 length measured 0.61× and 0.41× at
size 32, reaching 1.47× and 2.49× at 128. C1 Base64 decode moved from 0.75×
at 32 to 1.37× at 128. Interpretation benefited at 16 in all 21 measured cases.

These results support the [operation thresholds](simdutf.md) and a lower base
for pure interpretation. Compiler-enabled VMs share Java floors so native
execution during interpreter/C1 profiling does not leave a cold Java fallback
for C2. This defers some short C1 gains. AArch64 retains the conservative
256-element base pending native measurements. Explicit thresholds override
automatic floors.

A separate, longer five-case C2 check at size 32 used two VMs, five 500 ms
warmups and three 500 ms measurements per VM. Results ranged from 1.00× to
1.04× with overlapping intervals; that check does not qualify all cases.

## Base64 backend decision

Retain **simdutf 9.2.1**. A native comparison against aklomp/base64
`bf058e571ac5002b75b03fed38e33ed4e8d45eff` (latest tag v0.5.2) covered
2,100 paired samples across AVX-512, AVX2 and SSE4.2 profiles on the same
EPYC host. These are native vendor/adapter timings, without Java/JNI or
allocation costs; forced ISA profiles do not represent separate CPUs.

The selected AVX-512 results below use mean aklomp time divided by mean simdutf
time, so values above 1 favor simdutf. Five alternating 30 ms pairs at four
destination alignments follow 10 ms warmups. Both variants share buffers.

| Native operation | Size 128 | Size 65,536 |
| --- | ---: | ---: |
| Standard encode | 3.70× | 1.05× |
| Raw decode | 2.20× | 2.43× |
| Strict checked decode | 1.21× | 1.05× |
| URL encode | 8.60× | 16.80× |
| URL checked decode | 1.62× | 1.78× |

Aklomp's URL adapter includes alphabet replacement; decode uses bounded
256-byte staging and its streaming API. Checked rows include strict alphabet
prevalidation for both libraries. Independent scalar-oracle and destination
canary checks passed.

Aklomp wins some short standard-decode cases on AVX2/SSE4.2, mostly below
the compiled 128-element Base64 floor. Encoding and URL adaptation favor
simdutf, so the measurements do not justify an additional dependency.
Strict prevalidation reduces the bulk AVX-512 core-decode advantage from
2.43× to 1.05×. Removing it requires preserving Java's rejection,
partial-write and consumption behavior. ARM64 and Windows performance are
unmeasured.

## Archived evidence

The raw samples and one-off native comparison programs are retained in the
PR's history at `f078203f`, outside the current documentation tree:

- [Public API samples and intervals](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/results.csv)
  and [binary/run fingerprints](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/runs.json).
- [Threshold sweep](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/thresholds.csv)
  and [longer short-input check](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/short-check.csv).
- [All Base64 profiles, protocol and reproduction](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/base64-comparison.md),
  [samples](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/base64-comparison.csv)
  and [native driver](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/base64-benchmark.cpp).
- [Direct/bounded converter protocol](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/results.md#native-converter-comparison-2026-10-05),
  [samples](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/encode-comparison.csv)
  and [native driver](https://github.com/re-thc/openjdk-jdk27u/blob/f078203f8c382146cda86cc132c07e582fa05dae/doc/simdutf/encode-benchmark.cpp).
