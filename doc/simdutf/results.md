# simdutf 9.2.1 measurements and validation

These measurements compare a pristine build of `master` at
`33e539f2d4a847f283a3793df6eebd41b9d1dfac` with the proposed build using
`-XX:+UseSIMDUTFIntrinsics`. The feature remains disabled by default.
Speedup is baseline mean time divided by enabled mean time; values below 1
mean the enabled measurement took longer. These are measurements on one
virtualized x86-64 host, not guarantees for other machines or workloads.

## Bulk results

| Public operation (`size=65536`) | C2 | C1 | Interpreter |
| --- | ---: | ---: | ---: |
| ASCII String decode | 0.96x | 7.21x | 80.85x |
| ASCII String encode | 0.99x | 7.43x | 77.06x |
| ASCII validation | 37.30x | 374.46x | 4543.30x |
| BMP UTF-8 String decode | 1.67x | 4.65x | 78.95x |
| BMP String to UTF-8 | 2.40x | 4.14x | 115.90x |
| Latin-1 String to UTF-8 | 2.67x | 4.83x | 96.22x |
| Supplementary UTF-8 decode | 1.77x | 2.96x | 78.37x |
| Supplementary UTF-8 encode | 2.13x | 3.48x | 122.39x |
| Base64 encode | 0.99x | 51.30x | 1066.57x |
| Base64 decode | 0.97x | 2.12x | 40.98x |
| Base64 output stream | 38.26x | 67.09x | 508.45x |
| UTF-8 CharsetEncoder | 4.02x | 9.69x | 159.06x |
| UTF-8 CharsetDecoder | 2.72x | 6.64x | 120.32x |
| Unicode validation | 114.74x | 261.71x | 5849.64x |
| UTF-8 encoded length | 7.84x | 33.18x | 948.47x |
| UTF-16LE encode | 43.22x | 155.96x | 3389.44x |
| UTF-16LE decode | 36.19x | 133.51x | 3566.95x |
| UTF-32LE encode | 31.13x | 151.09x | 3575.82x |
| UTF-32LE decode | 25.85x | 120.04x | 2837.87x |

The parameter is 65,536 input characters/code units for String and charset
operations and 65,536 binary input bytes for Base64. It is not a uniform byte
count: for example, BMP UTF-8 decoding consumes three bytes per character,
UTF-16 decoding consumes two, and UTF-32 decoding consumes four. Base64
decoding consumes the corresponding encoded input. String operations allocate
their normal results; array Base64 and charset cases reuse output storage.
The stream benchmark writes through the public encoder to a null output
stream, isolating encoder work from downstream I/O.

The existing C2 ASCII copy and Base64 block intrinsics remain in use. Their
near-1x bulk results are expected. C1 and the interpreter reach simdutf through
the same public APIs. ASCII and Unicode validation results depend strongly on
the original scalar implementation and compiler profile; their large ratios
should not be generalized to unrelated validation APIs.

All 171 comparisons, including sizes 32 and 4,096, are in
[results.csv](results.csv). The six paired [raw JSON files](results/) retain
every measured sample and confidence interval. Their `forks: 0` and
`externalForks: 2` fields describe the execution procedure below.

## Short inputs and follow-up measurements

The default threshold is 256 input elements. Each caller tests eligibility
before marshalling array arguments. This preserves Java execution for short
inputs and avoids paying for a native call merely to decline it.

An initial run exposed a real C2 ASCII-validation regression caused by routing
around `StringCoding.countPositives`. The final code calls that existing
intrinsic candidate, retaining its C2 intrinsic and its interpreter/C1 simdutf
body. A longer-warmup run also confirmed a short UTF-32 encoder regression.
The final code keeps its original scalar loop in an independently compiled
method, preventing the native call's memory effects from inhibiting the loop.

The final longer-warmup UTF-32 check measured 135.05 ns baseline and 137.29 ns
enabled at size 32 (0.98x), with overlapping 99.9% intervals
[128.28, 141.83] and [120.83, 153.74] ns. Its two paired
`utf32-short-final-c2-*.json` files are included. After this change, UTF-32
encoding was remeasured at all three sizes in all three tiers; those paired
rows replace the earlier UTF-32 encoder rows in the main results.

Two initial C2 ASCII-copy measurements at size 4,096 had lower enabled means.
The follow-up used five one-second warmups and three one-second measurements
per fresh VM: decode was 204.78 to 239.94 ns (0.85x), and encode was 180.38 to
184.78 ns (0.98x). Both confidence intervals overlap. The
`focused-c2-*.json` files retain these results, including size 32. This
experiment cannot establish a universal absence of performance regressions;
the remaining medium-size decode difference needs a less noisy host and
ordinary forked JMH confirmation before enabling the feature by default.

## Method and reproduction

* Linux x86-64 cloud VM, AMD EPYC 9V74, AVX-512/VBMI2 available; GNU 14 release
  build, JDK `27.0.2-internal`; JMH 1.37.
* One benchmark thread, CPU affinity fixed to CPU 2, no concurrent build or
  test workload. Both binaries use Serial GC, `ActiveProcessorCount=1`,
  `CICompilerCount=2`, `-Xrs`, `-XX:-UsePerfData`, and a fixed 512 MiB heap.
* C2: `-XX:-TieredCompilation`; C1: `-XX:TieredStopAtLevel=1`;
  interpreter: `-Xint`. Only the proposed binary receives the enable flag.
* Each case/size/binary gets two separately launched, fresh JVM processes.
  Each process runs two 300 ms warmups and three 300 ms measurements.
  Python launches JMH with `-f 0` inside each process because the exhausted
  container cannot sustain a JMH driver JVM and a worker JVM simultaneously.
* Ordinary non-forked JMH omits compiler hints. The runner explicitly installs
  the generated benchmark directives and the full Blackhole directives,
  including `dontinline` for `consumeFull`, and forces
  `-Djmh.blackhole.mode=FULL_DONTINLINE`. The directives are included in
  [compiler-hints.txt](results/compiler-hints.txt). No compiler-blackhole
  autodetection JVM runs. Both binaries use the same procedure.
* Means pool six measured samples. Error bars are two-sided 99.9% Student-t
  intervals with five degrees of freedom. Iterations within a process are
  correlated; these intervals are descriptive and do not replace independent
  host/fork replication. Longer-warmup follow-ups use the same fresh-process
  procedure with five one-second warmups and three one-second measurements.

The pristine baseline was copied before patching the JDK; it is not a
flag-disabled build of the modified Java classes. Baseline SHA-256 identities:

```text
lib/server/libjvm.so
3bad7aad69f1eaa5fed0c8206f7904c4d4e4e6f8757de37013424484422419f7
modules/java.base/java/lang/String.class
9ff18f9a0812c4ffd72acb379dff9dc0b9c56fb594182f6d9fe3eab074f02154
```

The benchmark source is
`test/micro/org/openjdk/bench/java/lang/SimdUTF.java`. Build it with the
repository's microbenchmark target and use its generated classpath, or compile
it with the JMH 1.37 annotation processor. The normal runner defaults to JMH
worker forks and is the preferred reproduction on a fresh machine:

```sh
taskset -c 2 python3 doc/simdutf/benchmark.py \
    --baseline /path/to/pristine-jdk --enabled /path/to/proposed-jdk \
    --classpath '/path/to/generated/benchmark/classes:/path/to/jmh/*' \
    --output /tmp/simdutf-results \
    --jvm-args '-Xrs -XX:+UseSerialGC -XX:-UsePerfData -XX:ActiveProcessorCount=1 -XX:CICompilerCount=2'
```

Add `--external-forks` to reproduce the procedure used for this table. Add
`--tiers c2 --sizes 32,4096 --warmup 5 --time 1s` and a specific `--filter` for
the longer-warmup checks. `--resume` is only for unchanged binaries,
parameters and benchmark selection; it does not fingerprint JDK contents.
The absolute compiler-hints path in UTF-32 rows differs because that case was
remeasured in a separate results directory; the hint contents and VM options
are otherwise identical.

## Validation status

* The x86-64 release JDK build passed. The final two Java-only performance
  fixes were compiled using the build-generated incremental `java.base`
  compiler command and exercised by the final contracts and benchmarks.
* The final native HotSpot sources cross-built successfully for Linux AArch64
  with GNU 14. No AArch64 execution or performance measurements were available.
* Before the final eligibility gates and performance fixes, selected jtreg
  suites passed **175 JDK tests** (6,023 TestNG/JUnit cases) and **20 HotSpot
  tests**. Five additional tests did not meet platform requirements. These
  results are not presented as a final-source full-suite rerun.
* The final source passed **30 directly launched contract combinations**: six execution modes across Serial GC, compact strings disabled, x86 ISA disabled, ZGC and Shenandoah. These execute the unchanged jtreg test class without the jtreg harness. GC resource retries used one compiler thread, non-tiered compiled JNI, and interpreted disabled-flag checks as recorded in the transcript.
* Repeating the full jtreg suites after the final changes was blocked by
  `pthread_create(EAGAIN)` in harness/worker startup. The container accumulated
  more than 32,000 unreaped build logging processes; simultaneous harness and
  test VMs no longer fit its thread/process allowance. This remains a
  validation gap, and the PR is a draft pending a clean-environment jtreg
  rerun and AArch64 execution. The resource failures were not test assertion
  failures.

The new contract uses independent scalar byte oracles and covers malformed
input, offsets, canaries, capacity/overflow, narrowing prefixes, BOMs, endian
conversion, inaccessible buffer storage, native range/type/alias checks,
Base64 alphabets/padding/in-place calls and stream chunking. Inlining logs
confirm `SimdUTF::process0 (intrinsic)` in both C1 and C2. JNI runs explicitly
disable `_simdutf_process`; disabled-feature runs check the Java paths.

[validation.txt](validation.txt) records commands, pass summaries and final
binary identities. On a fresh build, rerun:

```sh
make CONF=your-conf test \
    TEST='test/jdk/jdk/internal/util/SimdUTF test/jdk/sun/nio/cs test/jdk/java/lang/String test/jdk/java/util/Base64 test/jdk/java/lang/CharSequence' \
    JTREG='JAVA_OPTIONS=-XX:+UseSIMDUTFIntrinsics'
make CONF=your-conf test \
    TEST='test/hotspot/jtreg/compiler/intrinsics/base64 test/hotspot/jtreg/compiler/intrinsics/string' \
    JTREG='JAVA_OPTIONS=-XX:+UseSIMDUTFIntrinsics'
```

Repeat the contract with `-XX:-CompactStrings`, disabled x86 ISA features,
ZGC and Shenandoah. Keep the feature opt-in until the outstanding validation
and broader performance measurements are complete.
