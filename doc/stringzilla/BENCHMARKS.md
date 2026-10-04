# StringZilla measurements and validation

This is an opt-in experiment, not a universal performance improvement. Enable
with `-XX:+UseStringZillaIntrinsics` (default: false). Long searches show large
improvements in interpreter/C1 and useful C2 gains. Some short/early C1 cases
regress. The PR remains a draft pending those costs and final jtreg validation
on a healthy host. No unconditional “no regressions” claim is made.

## Method

AMD EPYC 9V74, x86-64 Linux, AVX2/AVX-512 enabled; CPU 0 pinned, one benchmark
at a time. The same frozen release JDK was measured with the flag off/on.
The baseline is the modified JVM with the flag off, **not a separately built
pristine upstream JVM**. Java gates remain in interpreter bytecode; compilers
can fold the static final flag. ARM results below are functional tests under
QEMU, not ARM hardware performance measurements.

JMH 1.37, average time in ns/op; 212 measurements (106 off/on pairs), each with
two 300 ms warmups and three 500 ms measurement iterations. A follow-up has ten
measurements (five off/on pairs), each with three 500 ms warmups and five 1 s
measurements. Four-character needles; string lengths are **Java characters**,
so UTF-16 uses twice as many bytes. Random inputs use a fixed seed. `MISS`
contains no match; `START` inserts one at index zero; `END` inserts it at the
last position; `REPEATED` stresses repeated prefix candidates. Equality uses
separate backing arrays: `EQUAL`, first-character mismatch (`START`), or
last-character mismatch (`END`). `CROSSED` alternates bytes that appear to
match a needle at odd byte offsets, but has no code-unit match.

Interpreter: `-Xint`; C1: `-XX:TieredStopAtLevel=1`; C2:
`-XX:-TieredCompilation`. All use `-XX:ActiveProcessorCount=1`, Serial GC,
and `-Xshare:off`. JMH ran with `-f 0` because the host could not fit its parent
and forked JVM together after accumulating approximately 32,400 unreaped
processes. Each tier/flag/group launches a fresh JVM, but parameter cases
within a group share that JVM. This loses normal JMH fork isolation. Short
runs and code layout/profile differences produce substantial noise; do not
interpret small ratios as conclusive. `results.json` retains every JMH record,
raw sample, confidence interval, VM argument and runtime artifact hash.

The initial crossed-byte implementation restarted the upstream byte search
at each rejected odd match, and measured approximately 35–37 microseconds
versus 0.74–0.80 microseconds with the feature off. The final bounded aligned
AVX2/NEON filter measured approximately 0.30 microseconds on the same input.
Those exploratory measurements are not included in the final results table.

## Reproduction

Compile `test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` with
JMH 1.37 core and annotation processor, or use OpenJDK's microbenchmark build.
Then run:

```sh
doc/stringzilla/run-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" results 0
# Only for a resource-constrained host:
JMH_FORKS=0 doc/stringzilla/run-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" results 0
```

The script defaults to normal forked runs. For the follow-up controls, use the
same parameters/VM options with `-wi 3 -w 500ms -i 5 -r 1s`, one parameter case
per JVM. Use longer measurements and multiple forks before selecting default
thresholds for production. The 256-byte Java gate avoids native transition
costs on short ranges. C2 also retains one-character/long-needle platform
searches and probes the first 32 starting positions before native acceleration.
These guards still have execution/code-layout costs; they cannot guarantee
zero overhead. Existing C2 forward character and equality intrinsics are
retained, which the controls show near parity.

## Remaining performance costs

Longer C1 follow-ups confirm an immediate UTF-16 substring match at about
7.89 → 10.50 ns and a 32-character Latin-1 reverse miss at about
30.73 → 38.45 ns (non-overlapping reported confidence intervals). These remain
open tuning work. Repeated C2 short controls changed direction compared with
the initial matrix, illustrating profile/layout sensitivity; the C2 immediate
UTF-16 follow-up was 4.64 → 4.82 ns with overlapping intervals. All measured
controls, including slower cases, are included below.

## Validation

* Release x86 JDK image and all standard CDS archives built successfully.
  x86 fastdebug HotSpot and AArch64 cross-release HotSpot also built.
* Final release **and** fastdebug: all seven independent scalar-oracle modes
  passed (interpreter, C1, C2, compact strings off, interpreter JNI fallback,
  compiled JNI fallback, feature off). These include periodic odd-byte inputs,
  supplementary/isolated surrogates, range extremes, builder capacity,
  mutation and concurrent GC, plus distinct-array equality/mismatches.
* Final WhiteBox tests force all 22 search/equality/local-allocation callers
  to compile and execute at levels 1 and 4 on release, fastdebug and AArch64;
  no silent compiler bailout. All ten intrinsic registrations are checked on
  and off on x86. Java gate/VM flag consistency passes with `-Xshare:on` and G1 on
  the newly generated release archive, for both flag states.
* Final x86 `UseAVX=0` and `UseAVX=2` oracle runs passed. Final AArch64/QEMU
  interpreter, C1 and C2 oracle runs passed using the same portable Java
  classes and the cross-built native VM. ARM hardware timing remains untested.
* Earlier broad jtreg: **152 passed, five skipped, zero failures/errors**:
  String 90 passed/2 skipped; StringBuilder 16 passed; StringBuffer 25 passed;
  HotSpot string intrinsics 21 passed/3 skipped. The three new targeted jtreg
  tests also passed on that earlier revision. These precede the final aligned
  UTF-16 kernel, some compiler debug fixes and equality addition.
* Final jtreg reruns were attempted with one worker and reduced JVM threads;
  the harness cannot start its second VM (`pthread_create` EAGAIN / unable to
  create native thread) on this host. This is **not** a final jtreg pass. The
  final test bodies were run directly, separately, as described above.
* Vendored manifest verification: 28 unmodified upstream files; `git diff
  --check` passed. Other architectures, full tier1/tier2, sanitizers and ARM
  hardware performance remain outside the validation performed here.

On a healthy host, rerun the three new tests and the String, StringBuilder,
StringBuffer and HotSpot string intrinsic directories with the feature on,
then the appropriate OpenJDK tier suites. Test sources include their exact
jtreg run configurations. Preserve off/on and disabled-intrinsic cases.

## Complete final matrix

Means are ns/op. Speedup is **off / on**; below 1 means a slower enabled mean.
`LL` = Latin-1, `UU` = UTF-16, `UL` = UTF-16 haystack/Latin-1 needle. Raw
uncertainty and samples are in `results.json`; tables do not suppress slower
cases. All pairs have identical parameters.

### C2 — miss

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 32 | MISS | 4.84 | 5.97 | 0.81× |
| indexOf | LL | 4096 | MISS | 370.67 | 116.28 | 3.19× |
| indexOf | UU | 32 | MISS | 7.98 | 9.62 | 0.83× |
| indexOf | UU | 4096 | MISS | 766.40 | 220.83 | 3.47× |
| indexOfChar | LL | 32 | MISS | 2.54 | 2.58 | 0.99× |
| indexOfChar | LL | 4096 | MISS | 51.41 | 52.06 | 0.99× |
| indexOfChar | UU | 32 | MISS | 3.10 | 3.20 | 0.97× |
| indexOfChar | UU | 4096 | MISS | 149.06 | 146.17 | 1.02× |
| lastIndexOf | LL | 32 | MISS | 10.94 | 10.99 | 0.99× |
| lastIndexOf | LL | 4096 | MISS | 735.33 | 124.12 | 5.92× |
| lastIndexOf | UU | 32 | MISS | 13.49 | 13.25 | 1.02× |
| lastIndexOf | UU | 4096 | MISS | 767.41 | 242.04 | 3.17× |
| lastIndexOfChar | LL | 32 | MISS | 12.54 | 12.41 | 1.01× |
| lastIndexOfChar | LL | 4096 | MISS | 1040.78 | 62.25 | 16.72× |
| lastIndexOfChar | UU | 32 | MISS | 10.16 | 12.12 | 0.84× |
| lastIndexOfChar | UU | 4096 | MISS | 758.96 | 246.33 | 3.08× |

### C2 — boundary

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 4096 | START | 3.96 | 4.94 | 0.80× |
| indexOf | UU | 4096 | START | 4.93 | 6.44 | 0.77× |
| indexOfChar | LL | 4096 | START | 2.00 | 2.05 | 0.98× |
| indexOfChar | UU | 4096 | START | 2.11 | 2.09 | 1.01× |
| lastIndexOf | LL | 4096 | START | 687.83 | 128.81 | 5.34× |
| lastIndexOf | UU | 4096 | START | 991.70 | 239.93 | 4.13× |
| lastIndexOfChar | LL | 4096 | START | 1058.45 | 63.89 | 16.57× |
| lastIndexOfChar | UU | 4096 | START | 685.59 | 243.01 | 2.82× |

### C2 — equality

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| equals | LL | 4096 | EQUAL | 72.59 | 69.90 | 1.04× |
| equals | LL | 4096 | START | 2.28 | 2.32 | 0.98× |
| equals | LL | 4096 | END | 70.51 | 71.41 | 0.99× |
| equals | UU | 4096 | EQUAL | 136.02 | 136.84 | 0.99× |
| equals | UU | 4096 | START | 2.27 | 2.24 | 1.02× |
| equals | UU | 4096 | END | 145.81 | 146.24 | 1.00× |

### C2 — mixed

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | UL | 4096 | MISS | 757.65 | 230.45 | 3.29× |
| indexOf | UL | 4096 | END | 777.07 | 221.61 | 3.51× |
| indexOf | UL | 4096 | REPEATED | 3783.80 | 246.77 | 15.33× |
| lastIndexOf | UL | 4096 | MISS | 794.65 | 292.41 | 2.72× |
| lastIndexOf | UL | 4096 | END | 6.40 | 4.27 | 1.50× |
| lastIndexOf | UL | 4096 | REPEATED | 675.34 | 245.57 | 2.75× |

### C2 — crossed

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | UU | 4096 | CROSSED | 762.05 | 303.44 | 2.51× |
| lastIndexOf | UU | 4096 | CROSSED | 756.82 | 297.52 | 2.54× |

### C2 — callers

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| bufferIndexOf | LL | 4096 | MISS | 389.10 | 118.63 | 3.28× |
| bufferIndexOf | UU | 4096 | MISS | 864.99 | 228.03 | 3.79× |
| builderIndexOf | LL | 4096 | MISS | 399.11 | 125.09 | 3.19× |
| builderIndexOf | UU | 4096 | MISS | 760.97 | 218.50 | 3.48× |
| contains | LL | 4096 | MISS | 392.13 | 122.91 | 3.19× |
| contains | UU | 4096 | MISS | 761.72 | 240.69 | 3.16× |
| replace | LL | 4096 | MISS | 383.00 | 123.26 | 3.11× |
| replace | UU | 4096 | MISS | 740.08 | 252.83 | 2.93× |

### C1 — miss

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 32 | MISS | 23.07 | 23.41 | 0.99× |
| indexOf | LL | 4096 | MISS | 2627.80 | 117.79 | 22.31× |
| indexOf | UU | 32 | MISS | 18.85 | 19.12 | 0.99× |
| indexOf | UU | 4096 | MISS | 1855.31 | 240.12 | 7.73× |
| indexOfChar | LL | 32 | MISS | 26.23 | 24.79 | 1.06× |
| indexOfChar | LL | 4096 | MISS | 2490.98 | 59.19 | 42.08× |
| indexOfChar | UU | 32 | MISS | 20.39 | 23.12 | 0.88× |
| indexOfChar | UU | 4096 | MISS | 1983.72 | 258.17 | 7.68× |
| lastIndexOf | LL | 32 | MISS | 28.97 | 37.61 | 0.77× |
| lastIndexOf | LL | 4096 | MISS | 3481.78 | 129.84 | 26.82× |
| lastIndexOf | UU | 32 | MISS | 39.42 | 25.44 | 1.55× |
| lastIndexOf | UU | 4096 | MISS | 4651.66 | 300.13 | 15.50× |
| lastIndexOfChar | LL | 32 | MISS | 30.25 | 28.36 | 1.07× |
| lastIndexOfChar | LL | 4096 | MISS | 2620.05 | 70.44 | 37.20× |
| lastIndexOfChar | UU | 32 | MISS | 22.83 | 22.94 | 0.99× |
| lastIndexOfChar | UU | 4096 | MISS | 1865.37 | 299.36 | 6.23× |

### C1 — boundary

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 4096 | START | 9.34 | 9.51 | 0.98× |
| indexOf | UU | 4096 | START | 7.91 | 11.11 | 0.71× |
| indexOfChar | LL | 4096 | START | 4.58 | 4.77 | 0.96× |
| indexOfChar | UU | 4096 | START | 4.57 | 4.86 | 0.94× |
| lastIndexOf | LL | 4096 | START | 3511.39 | 133.11 | 26.38× |
| lastIndexOf | UU | 4096 | START | 4543.00 | 248.44 | 18.29× |
| lastIndexOfChar | LL | 4096 | START | 3390.26 | 68.87 | 49.23× |
| lastIndexOfChar | UU | 4096 | START | 2299.41 | 255.45 | 9.00× |

### C1 — equality

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| equals | LL | 4096 | EQUAL | 3247.63 | 79.98 | 40.61× |
| equals | LL | 4096 | START | 6.27 | 6.22 | 1.01× |
| equals | LL | 4096 | END | 3441.06 | 13.22 | 260.35× |
| equals | UU | 4096 | EQUAL | 6485.43 | 144.81 | 44.79× |
| equals | UU | 4096 | START | 6.65 | 6.37 | 1.04× |
| equals | UU | 4096 | END | 6777.88 | 144.10 | 47.04× |

### INTERPRETER — miss

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 32 | MISS | 495.61 | 515.53 | 0.96× |
| indexOf | LL | 4096 | MISS | 37632.52 | 361.96 | 103.97× |
| indexOf | UU | 32 | MISS | 1392.85 | 1431.68 | 0.97× |
| indexOf | UU | 4096 | MISS | 150930.18 | 558.52 | 270.23× |
| indexOfChar | LL | 32 | MISS | 452.26 | 474.03 | 0.95× |
| indexOfChar | LL | 4096 | MISS | 36120.84 | 237.01 | 152.40× |
| indexOfChar | UU | 32 | MISS | 1469.01 | 1481.08 | 0.99× |
| indexOfChar | UU | 4096 | MISS | 154647.82 | 561.62 | 275.36× |
| lastIndexOf | LL | 32 | MISS | 565.25 | 607.42 | 0.93× |
| lastIndexOf | LL | 4096 | MISS | 35998.01 | 409.04 | 88.01× |
| lastIndexOf | UU | 32 | MISS | 1563.18 | 1586.01 | 0.99× |
| lastIndexOf | UU | 4096 | MISS | 148447.62 | 606.05 | 244.94× |
| lastIndexOfChar | LL | 32 | MISS | 513.84 | 502.25 | 1.02× |
| lastIndexOfChar | LL | 4096 | MISS | 36685.86 | 330.78 | 110.91× |
| lastIndexOfChar | UU | 32 | MISS | 1487.67 | 1513.15 | 0.98× |
| lastIndexOfChar | UU | 4096 | MISS | 160828.99 | 864.75 | 185.98× |

### INTERPRETER — boundary

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| indexOf | LL | 4096 | START | 288.15 | 258.30 | 1.12× |
| indexOf | UU | 4096 | START | 550.76 | 584.79 | 0.94× |
| indexOfChar | LL | 4096 | START | 162.38 | 163.98 | 0.99× |
| indexOfChar | UU | 4096 | START | 222.66 | 236.40 | 0.94× |
| lastIndexOf | LL | 4096 | START | 36093.31 | 458.43 | 78.73× |
| lastIndexOf | UU | 4096 | START | 159657.22 | 702.92 | 227.13× |
| lastIndexOfChar | LL | 4096 | START | 36872.79 | 343.43 | 107.37× |
| lastIndexOfChar | UU | 4096 | START | 162443.36 | 928.64 | 174.93× |

### INTERPRETER — equality

| Operation | Coder | Length | Shape | Off ns/op | On ns/op | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| equals | LL | 4096 | EQUAL | 46038.73 | 226.98 | 202.84× |
| equals | LL | 4096 | START | 143.62 | 145.08 | 0.99× |
| equals | LL | 4096 | END | 45686.82 | 168.03 | 271.90× |
| equals | UU | 4096 | EQUAL | 91931.80 | 296.52 | 310.04× |
| equals | UU | 4096 | START | 141.40 | 142.34 | 0.99× |
| equals | UU | 4096 | END | 91477.21 | 297.32 | 307.67× |

## Longer follow-up controls

| Tier / operation / coder / length / shape | Off ns/op | On ns/op | Speedup |
| --- | ---: | ---: | ---: |
| c1 / indexOf / UTF16 / 4096 / START | 7.89 | 10.50 | 0.75× |
| c1 / lastIndexOf / LATIN1 / 32 / MISS | 30.73 | 38.45 | 0.80× |
| c2 / indexOf / LATIN1 / 32 / MISS | 11.42 | 5.30 | 2.16× |
| c2 / indexOf / UTF16 / 32 / MISS | 14.17 | 9.65 | 1.47× |
| c2 / indexOf / UTF16 / 4096 / START | 4.64 | 4.82 | 0.96× |
