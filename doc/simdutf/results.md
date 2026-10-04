# simdutf measurements

The complete matrix has 279 paired comparisons: 31 public API cases,
sizes 32/128/65536, and interpreter/C1/C2. It compares pristine master
`33e539f2d4a847f283a3793df6eebd41b9d1dfac` with the proposed build after the
compact-decoding inlining fix, **before the final shared Java floors and removal
of the extra C2 cutoff graph**. The converter implementations are unchanged by
that last policy cleanup. This matrix is not an exact-final-head certification.
The exact final source has a separate longer five-case C2 short-input check.
An attempted complete final-policy rerun could not start its first worker
because the container exhausted its native-thread/process allowance.

## Bulk matrix, size 65536, before final cutoff cleanup

| Public benchmark | C2 | C1 | Interpreter |
| --- | ---: | ---: | ---: |
| asciiCharValidation | 9.04x | 144.83x | 4509.40x |
| asciiDecode | 0.98x | 6.60x | 71.24x |
| asciiEncode | 1.06x | 7.12x | 72.78x |
| asciiValidation | 41.19x | 358.21x | 4288.05x |
| base64Decode | 1.00x | 2.31x | 44.27x |
| base64Encode | 1.11x | 59.71x | 1053.04x |
| base64StreamEncode | 41.14x | 64.78x | 505.97x |
| charArrayCodePointCount | 1.84x | 7.32x | 160.02x |
| charArrayString | 1.05x | 3.13x | 169.32x |
| charsetAsciiEncode | 1.05x | 19.09x | 283.49x |
| charsetDecode | 2.70x | 6.78x | 126.49x |
| charsetEncode | 4.93x | 9.62x | 177.95x |
| codePointCount | 1.73x | 7.00x | 362.21x |
| encodedLength | 7.73x | 33.05x | 892.26x |
| latin1CharsetEncode | 0.94x | 14.05x | 206.43x |
| latin1Decode | 1.59x | 3.02x | 56.93x |
| latin1Encode | 3.41x | 4.90x | 103.05x |
| latin1EncodedLength | 23.54x | 83.88x | 857.31x |
| latin1ToChars | 1.01x | 6.96x | 86.76x |
| latin1Validation | 4.51x | 70.09x | 2552.93x |
| supplementaryDecode | 1.79x | 3.06x | 81.56x |
| supplementaryEncode | 2.07x | 3.43x | 118.95x |
| unicodeValidation | 132.80x | 265.92x | 6385.20x |
| utf16CharsetDecode | 71.82x | 131.58x | 3661.22x |
| utf16CharsetEncode | 85.37x | 154.01x | 3399.90x |
| utf16Encode | 2.50x | 4.17x | 114.76x |
| utf16ToChars | 0.99x | 4.91x | 222.14x |
| utf32CharsetDecode | 47.61x | 118.08x | 2687.66x |
| utf32CharsetEncode | 49.43x | 159.09x | 3632.06x |
| utf32TightCharsetDecode | 12.42x | 30.20x | 764.88x |
| utf8Decode | 1.72x | 4.65x | 79.66x |

Speedup = pristine mean / enabled mean. Values below 1 measured slower.
The parameter counts characters/code units for String/charset cases and binary
input bytes for Base64; decode buffer byte counts can be larger. Existing C2
copy/Base64 stubs explain near-1x rows. [results.csv](results.csv) retains all
means, intervals and six samples. [runs.json](runs.json) distinguishes binary
fingerprints for each source revision and protocol.

## Final-source short-input check

| Final-source check, size 32 | C2 |
| --- | ---: |
| asciiDecode | 1.00x |
| charsetDecode | 1.00x |
| latin1EncodedLength | 1.04x |
| supplementaryEncode | 1.03x |
| utf8Decode | 1.03x |

These use fresh VMs per operation/size, five 500 ms warmups and three 500 ms
measurements in each of two VMs. [short-check.csv](short-check.csv) retains
samples and intervals. The five previously slow cases now measure parity or
slightly faster with overlapping intervals. This does not certify every size.

The compact-decoding addition initially increased `String.utf8` from 269 to 338
bytecodes. C2 rejected it as “hot method too big,” slowing 32-byte ASCII decode
from 10.05 to 14.13 ns/op. Moving the duplicated attempt into a helper reduced
it to 301 bytecodes and restored ordinary hot inlining. Two checks measured
9.92/9.89 ns/op; the final policy check measured 10.03 ns/op.

## Threshold investigation

The exploratory sweep has 441 paired comparisons: 21 operations ×
seven sizes (16/32/64/128/256/512/1024) × three tiers. It compares the same
pre-tuning JDK with acceleration disabled and with `SIMDUTFMinLength=1`.
It exposes native-call crossover, rather than pristine-master improvements.
[thresholds.csv](thresholds.csv) retains the full sweep and samples.

At size 32, forced C2 code-point counting and encoded-length calculation
measured 0.61x and 0.41x; at 128 these reached 1.47x and 2.49x. C1 Base64
decode crossed from 0.75x at 32 to 1.37x at 128. Unicode validation and
UTF-16/UTF-32 codecs benefited earlier. Pure interpreted execution benefited
already at 16 in all 21 exploratory cases.

Enabled x86-64 selects a 32-element base. Pure `-Xint` uses that base. Compiled
VMs share Java floors of 256 input bytes for UTF-8 decode; 128 input elements
for UTF-8 encode, compact UTF-8 decode, Base64 decode and code-point counts;
and 64 for ASCII/Latin-1 validation, encoded lengths and UTF-32 decode.
Sharing these floors avoids training interpreted/C1 execution exclusively on
the native path while C2 takes a cold Java fallback loop. This trades some C1
short-input acceleration for stable C2 behavior. Existing C2 stubs remain in
use. AArch64 keeps 256 pending runtime measurements. Explicit thresholds
override the automatic floors. [Integration](../simdutf.md) documents units.

## Method and reproduction

Linux x86-64 AMD EPYC 9V74 cloud host, AVX-512/VBMI2; GNU 14 release JDK 27,
JMH 1.37, CPU affinity 2, one benchmark thread, Serial GC, one active processor,
one compiler thread and 512 MiB fixed heap. C2 uses `-XX:-TieredCompilation`,
C1 `-XX:TieredStopAtLevel=1`, and interpreter `-Xint`. Finalization and
performance-data recording are disabled; generated compiler hints and
FULL_DONTINLINE Blackhole directives are installed explicitly.

The complete and exploratory matrices run each operation/binary/tier in two
fresh VMs. Within each VM, sizes are measured separately with two 100 ms
warmups and three 100 ms measurements per size. Later sizes can share compiler
profiles. The final short check uses the longer protocol above without size
batching. No simultaneous JMH driver VM runs. Startup-only host resource
failures were explicitly retried; only successful VM samples are combined.

Means pool six samples. Descriptive two-sided 99.9% Student-t intervals use
five degrees of freedom; within-fork iterations are correlated. This one-host
study cannot establish universal absence of regressions. Superseded JSON dumps
and duplicate validation logs were removed; CSV preserves the actual samples.

```sh
taskset -c 2 python3 doc/simdutf/benchmark.py \
  --baseline /path/to/pristine-jdk --enabled /path/to/proposed-jdk \
  --classpath '/path/to/benchmark/classes:/path/to/jmh/*' \
  --output /tmp/simdutf-results --sizes 32,128,65536 \
  --jvm-args '--finalization=disabled -Xrs -XX:+UseSerialGC -XX:-UsePerfData -XX:ActiveProcessorCount=1 -XX:CICompilerCount=1'
```

Add `--external-forks --batch-sizes --warmup 2 --time 100ms` for the matrices'
container protocol. The normal runner uses ordinary forked JMH. External
mode launches VMs without a driver and installs compiler directives explicitly.
`--resume` requires matching binary/classpath fingerprints, selection, flags
and measurement parameters. Use a fresh runner for final qualification.

For the threshold study use the same JDK on both sides, with
`--baseline-jvm-args=-XX:-UseSIMDUTFIntrinsics` and
`--enabled-jvm-args='-XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=1'`.
For crossover confirmation omit batching and use `--warmup 5 --time 500ms`.
Final full jtreg, complete final-policy benchmarking and AArch64 execution
remain outstanding. See [validation](validation.txt).
