# StringZilla benchmarks

The bounded-search and checked C1 equality implementation was measured against
the preceding default-on revision, `6e8756207e3afb50145510d8c60ca2c16b16ab0b`. Both images enable
StringZilla. This comparison measures the portable alignment filter, bounded
native work and checked C1 equality changes; it is not a feature off/on or
pristine-upstream comparison. The
[earlier feature off/on matrix](measurements/ORIGINAL_BENCHMARKS.md) records
259 pairs for the original integration and is identified separately.

## Method

AMD EPYC 9V74, x86-64 Linux, CPU 0 pinned, JMH 1.37 average time in ns/op.
Both images use GCC 14 release builds with the standard OpenJDK build profile.
Each of the 30 paired cases uses two isolated forks, three 500 ms warmups and
five 500 ms measurements per fork. Runs are sequential, after builds/tests,
with one active processor, Serial GC and CDS disabled. Interpreter uses `-Xint`,
C1 uses `-XX:TieredStopAtLevel=1`, and C2 uses `-XX:-TieredCompilation`.
VM/libjava/module hashes, source hashes, VM arguments and every iteration sample
are preserved in [bounded-results.json](measurements/bounded-results.json).

`StringZillaLongNeedle.lastIndexOf` tests UTF-16 reverse searches with repeated
prefixes, near-start/near-end mismatches and actual odd-byte occurrences.
Its `length` parameter is the repeated-prefix length; the full haystack has
`length + needleLength + 1` code units. For example, prefix 4096 / needle 256
means **4353 haystack code units**. The fixture validates its result
against an independent scalar model. Equality controls use distinct backing
arrays in `StringZillaSearch.equals`.

## Complete paired results

Means are shown with the JMH 99.9% confidence half-width. Speedup is
before / after; values below 1 denote a slower measured mean. All 30 pairs,
including the slower large C1 equality control, are included.

| Case | Tier | Before (ns/op) | After (ns/op) | Speedup |
| --- | --- | ---: | ---: | ---: |
| Near-end UTF-16 miss, prefix 512, needle 64 | Interpreter | 4732.17 ± 451.23 | 794.06 ± 6.97 | 5.96× |
| Near-end UTF-16 miss, prefix 512, needle 256 | Interpreter | 7490.10 ± 218.38 | 604.78 ± 28.89 | 12.38× |
| Near-end UTF-16 miss, prefix 4096, needle 64 | Interpreter | 38069.24 ± 972.71 | 5299.17 ± 273.59 | 7.18× |
| Near-end UTF-16 miss, prefix 4096, needle 256 | Interpreter | 110983.04 ± 3664.84 | 4833.44 ± 113.00 | 22.96× |
| Near-end UTF-16 miss, prefix 512, needle 64 | C1 | 4412.85 ± 277.53 | 569.29 ± 27.31 | 7.75× |
| Near-end UTF-16 miss, prefix 512, needle 256 | C1 | 7578.14 ± 423.45 | 347.64 ± 10.30 | 21.80× |
| Near-end UTF-16 miss, prefix 4096, needle 64 | C1 | 39199.35 ± 2717.31 | 5127.58 ± 273.74 | 7.64× |
| Near-end UTF-16 miss, prefix 4096, needle 256 | C1 | 119869.94 ± 14224.64 | 4374.93 ± 150.79 | 27.40× |
| Near-end UTF-16 miss, prefix 512, needle 64 | C2 | 4223.54 ± 211.03 | 575.53 ± 36.38 | 7.34× |
| Near-end UTF-16 miss, prefix 512, needle 256 | C2 | 7547.39 ± 224.71 | 341.52 ± 3.17 | 22.10× |
| Near-end UTF-16 miss, prefix 4096, needle 64 | C2 | 38142.62 ± 1077.02 | 4975.38 ± 131.85 | 7.67× |
| Near-end UTF-16 miss, prefix 4096, needle 256 | C2 | 111976.96 ± 13070.82 | 4399.18 ± 169.51 | 25.45× |
| Near-start UTF-16 miss, prefix 512, needle 64 | Interpreter | 1327.96 ± 109.05 | 1134.37 ± 52.17 | 1.17× |
| Near-start UTF-16 miss, prefix 512, needle 64 | C1 | 1081.61 ± 34.14 | 863.70 ± 29.53 | 1.25× |
| Near-start UTF-16 miss, prefix 512, needle 64 | C2 | 1096.71 ± 46.23 | 880.04 ± 20.00 | 1.25× |
| Crossed UTF-16 miss, prefix 4096, needle 4 | Interpreter | 680.80 ± 60.02 | 622.01 ± 28.94 | 1.09× |
| Crossed UTF-16 miss, prefix 4096, needle 4 | C1 | 297.52 ± 22.89 | 275.63 ± 12.93 | 1.08× |
| Crossed UTF-16 miss, prefix 4096, needle 4 | C2 | 333.57 ± 55.14 | 265.52 ± 4.69 | 1.26× |
| LATIN1 equality, 4 characters, equal | C1 | 5.75 ± 0.24 | 5.60 ± 0.33 | 1.03× |
| LATIN1 equality, 4 characters, first-character mismatch | C1 | 5.00 ± 0.38 | 4.54 ± 0.05 | 1.10× |
| LATIN1 equality, 32 characters, equal | C1 | 10.29 ± 0.39 | 9.99 ± 0.21 | 1.03× |
| LATIN1 equality, 32 characters, first-character mismatch | C1 | 4.99 ± 0.26 | 4.69 ± 0.16 | 1.06× |
| UTF16 equality, 4 characters, equal | C1 | 8.30 ± 1.14 | 5.47 ± 0.13 | 1.52× |
| UTF16 equality, 4 characters, first-character mismatch | C1 | 5.21 ± 0.46 | 4.64 ± 0.16 | 1.12× |
| UTF16 equality, 32 characters, equal | C1 | 10.24 ± 0.46 | 10.15 ± 0.41 | 1.01× |
| UTF16 equality, 32 characters, first-character mismatch | C1 | 5.00 ± 0.23 | 4.62 ± 0.26 | 1.08× |
| LATIN1 equality, 131072 characters, equal | C1 | 2552.43 ± 105.78 | 2595.41 ± 44.34 | 0.98× |
| UTF16 equality, 131072 characters, equal | C1 | 5271.75 ± 528.03 | 5224.65 ± 326.56 | 1.01× |
| LATIN1 equality, 131072 characters, equal | C2 | 2487.99 ± 95.20 | 2394.93 ± 83.61 | 1.04× |
| UTF16 equality, 131072 characters, equal | C2 | 5547.35 ± 959.88 | 4793.76 ± 182.09 | 1.16× |

Near-end cases improve by 5.96–27.40× in this dataset. The large Latin-1 C1
equality control has a 0.98× mean ratio with overlapping intervals. No slower
case in this selected matrix has separated 99.9% intervals. Overlapping
intervals do not establish a throughput change; the results do not establish
zero regressions for every workload or processor. ARM emulation supplies
functional coverage, not hardware performance evidence.

## Safepoint response

[StringZillaSafepointProbe.java](StringZillaSafepointProbe.java) runs a C1
reverse UTF-16 search with a 262144-code-unit repeated prefix, a 4096-code-unit
needle, a penultimate mismatch and an odd-byte occurrence. A second thread
requests 12 WhiteBox safepoints during searches.

| Response | Before | After |
| --- | ---: | ---: |
| Median | 110.535 ms | 0.112 ms |
| Maximum observed | 122.312 ms | 2.591 ms |

This measures requested-safepoint response, not a GC pause distribution or a
latency guarantee. Samples and the full JVM argument list are included in
`bounded-results.json` under `safepoint_response` and `safepoint_reproduction`.

## Reproduction

Build the JMH classes and generated harnesses for
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` and
`StringZillaLongNeedle.java` with JMH 1.37, or use the OpenJDK microbenchmark
build. Set `JMH_CLASSPATH` to those classes and the JMH dependencies.

Run the two frozen JDK images sequentially, with no concurrent build/test load:

```sh
doc/stringzilla/run-bounded-benchmarks.sh "$BEFORE_JDK" "$JMH_CLASSPATH" before-results 0
doc/stringzilla/run-bounded-benchmarks.sh "$AFTER_JDK" "$JMH_CLASSPATH" after-results 0
```

For a feature off/on matrix on the current image:

```sh
doc/stringzilla/run-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" feature-results 0
```

That script defaults to one fork per case; set `JMH_FORKS=2` for repeated
controls. Its new output is distinct from the archived earlier implementation.

Compile the safepoint probe against the test WhiteBox classes. Run each frozen
image with two active processors, CPUs 0/1 pinned, Serial GC, CDS disabled,
`-Xbatch -XX:TieredStopAtLevel=1`, `-XX:+UnlockDiagnosticVMOptions`,
`-XX:+WhiteBoxAPI`, and the WhiteBox classes on the boot classpath. Use
`-XX:CompileCommand=dontinline,StringZillaSafepointProbe::probe` and the probe
classes on the application classpath. Preserve the recorded flag state and
JVM arguments for both images.

The [measurement index](measurements/README.md) links the raw records and earlier
feature off/on controls. Implementation and validation are documented in
[README.md](README.md).
