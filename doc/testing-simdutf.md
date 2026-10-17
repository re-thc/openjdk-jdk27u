% Focused x64 simdutf correctness validation

This is a proposed, unexecuted validation stage. It authorizes no publication,
performance campaign, baseline build or AArch64 execution. The candidate is the
review commit containing this document; record its commit and tree before work.

## Scope and reusable inputs

Build count: at most **one Linux x64 server fastdebug candidate**, using the
`jdk` target (the exploded JDK). There is no baseline/release/image-bundle build.
If an independently verified candidate with the identical source tree and
configuration is already available, reuse it and build nothing.

Reuse the centrally provisioned boot/driver JDK, GCC, Autoconf, mold and jtreg.
Use normal repository dependency handling. Reuse matching modules and object
files only through the build system's dependency tracking; do not manually mix
unverified modules or VMs. An image identifying a different source cannot be
labeled as this candidate. No external handoff artifact is required. No
unmanaged package installation is included.

Follow [Building the JDK](building.md) for supported prerequisite versions. Set
the following paths to your provisioned tool installations; the placeholders
are not private handoff inputs. Source, tests and build scripts are in this
repository.

```sh
SIMDUTF_BOOT=/path/to/boot-jdk
SIMDUTF_JTREG=/path/to/jtreg
SIMDUTF_GCC=/path/to/gcc
SIMDUTF_MOLD=/path/to/mold
SIMDUTF_AUTOCONF=/path/to/autoconf
SIMDUTF_OUT="$PWD/../simdutf-x64-correctness-evidence"
SIMDUTF_CONF=simdutf-x64-correctness
```

Before executing, require a clean source checkout at the review commit. Record
`git rev-parse HEAD`, `git rev-parse HEAD^{tree}`, and a SHA256 source archive;
record tool versions, configure arguments and the final `spec.gmk`. Keep those
records outside the review commit. After building, hash the launcher, libjava,
libjvm and exploded java.base contents; retain the generated release metadata.
Never replace source identity with the PR number or a synthetic-merge label.

## One candidate build

Run from the repository root only after authorization:

```sh
timeout -k 30s 5m env AUTOCONF="$SIMDUTF_AUTOCONF" bash configure \
    --with-conf-name="$SIMDUTF_CONF" \
    --with-debug-level=fastdebug \
    --with-jvm-variants=server \
    --with-boot-jdk="$SIMDUTF_BOOT" \
    --with-boot-jdk-jvmargs='-Xms256m -Xmx1g' \
    --with-jtreg="$SIMDUTF_JTREG" \
    --with-toolchain-path="$SIMDUTF_GCC/bin" \
    --with-extra-ldflags="-fuse-ld=mold -B$SIMDUTF_MOLD/bin" \
    --disable-desktop --enable-headless-only \
    --with-native-debug-symbols=none --with-jobs=2

timeout -k 30s 75m make CONF="$SIMDUTF_CONF" JOBS=2 jdk
SIMDUTF_CANDIDATE="$PWD/build/$SIMDUTF_CONF/jdk"
```

This builds the real VM/native bridge and java.base together. Do not substitute
patched stock classes or the previous Java reference backend. The exploded JDK
is sufficient for this correctness stage; it is not final-image performance
evidence. A failed configure/build stops the stage, with the actual cause and
logs reported. No second build is authorized by this document.

## Ordered test gates

Use the provisioned JDK only as the jtreg driver; every test JVM must use
`-jdk:$SIMDUTF_CANDIDATE`. Execute sequentially with one test JVM and a 512 MiB
heap. Retain separate work/report directories and every timeout or failure.
Do not rerun failures until they pass.

First, the zero-progress regression, with a hard 90-second outer timeout:

```sh
timeout -k 10s 90s "$SIMDUTF_BOOT/bin/java" -Xmx256m \
    -jar "$SIMDUTF_JTREG/lib/jtreg.jar" \
    -jdk:"$SIMDUTF_CANDIDATE" -conc:1 -timeoutFactor:1 \
    -javaoption:-Xmx512m \
    -w:"$SIMDUTF_OUT/tiny-work" -r:"$SIMDUTF_OUT/tiny-report" \
    test/jdk/java/lang/String/SimdUTFWideTest.java#tiny-segment
```

Require normal completion and correct UTF-32 bytes/round trips. Stop on a hang,
crash or failure before running broader tests.

Second, the focused semantic boundary suite, C1 opt-out and admission regressions:

```sh
timeout -k 30s 20m "$SIMDUTF_BOOT/bin/java" -Xmx256m \
    -jar "$SIMDUTF_JTREG/lib/jtreg.jar" \
    -jdk:"$SIMDUTF_CANDIDATE" -conc:1 -timeoutFactor:3 \
    -javaoption:-Xmx512m \
    -w:"$SIMDUTF_OUT/wide-work" -r:"$SIMDUTF_OUT/wide-report" \
    test/jdk/java/lang/String/SimdUTFWideTest.java#portable \
    test/jdk/java/lang/String/SimdUTFWideTest.java#compiled \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/TestSimdUTFDisabled.java \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/TestSimdUTFUTF32Admission.java
```

This covers exact bytes/coders, malformed replacement and REPORT/IGNORE,
BOM handling, partial input/output, resumed state, chunk and surrogate
boundaries, overlapping views, read-only/closed/wrong-thread destinations and
misaligned segment terminators. Its directives select interpreter, C1, C2,
opt-out, JNI fallback and compact strings disabled.

Third, the existing genuine native-entry and large-call checks:

```sh
timeout -k 30s 15m "$SIMDUTF_BOOT/bin/java" -Xmx256m \
    -jar "$SIMDUTF_JTREG/lib/jtreg.jar" \
    -jdk:"$SIMDUTF_CANDIDATE" -conc:1 -timeoutFactor:3 \
    -javaoption:-Xmx512m \
    -w:"$SIMDUTF_OUT/native-work" -r:"$SIMDUTF_OUT/native-report" \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java#portable \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java#compiled \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java#checked-oops \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFLargeTest.java#portable \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFLargeTest.java#compiled
```

These directives include successful conversion assertions through the actual
registered native entry, normal interpreter/C1/C2 intrinsic paths,
`DisableIntrinsic=_simdutf_process` JNI fallback, opt-out and fastdebug oop
checking. Preserve the actual child command lines, selected flags and summaries.
A test skipped for unmet VM requirements is not coverage. Verify that the tested
java.base has no reference-backend substitute and that native admission is
actually enabled for the conversion assertions.

## Caps and the next decision

Total stage cap: two wall-clock hours, including configuration and compilation.
Maximum two build jobs, one test JVM, 1 GiB build Java heap and 512 MiB test heap.
Monitor aggregate RSS and output growth; stop above 6 GiB RSS or 20 GiB new disk
use. Individual phase timeouts above also apply. Reaching a cap is incomplete
validation, never a pass. No hosted workflow, timing run, automatic retry,
second configuration, baseline build or AArch64 run is included.

Evidence for the next stage is: verified candidate source/tool/image identity;
normal completion of the tiny test; all selected semantic/native test ids
passing without unexpected skips; preserved JNI/intrinsic/oop-check child
configuration evidence; and no crash or unresolved failure. That permits a
separate, smaller performance request. It does not establish measured
thresholds, regression-free performance, AArch64 correctness or readiness to
merge. Publishing or updating a remote review branch needs separate authority.

## Preparing full-image performance qualification

Correctness runs on an exploded fastdebug JDK do not establish performance.
Timing requires complete release images of the original master and final
candidate, built with the same compiler and configuration. The candidate image
is used both normally and with `-XX:-UseSIMDUTFIntrinsics`; the original master
does not accept that flag. Keep the benchmark JAR identical across all three.
Record each checkout's commit, tree and parents, including any synthetic merge,
configure arguments, compiler version/hash, image `release` file, and hashes of
the launcher, libjava, libjvm and module image. Also record the benchmark JAR,
source and dependency hashes, native architecture, CPU features, affinity,
kernel and effective JVM arguments. A source label alone cannot identify an
image. Native AArch64 execution is required for AArch64 timings.

Set `SIMDUTF_BENCH_JAR` to the repository-built microbenchmark JAR and
`SIMDUTF_BASE` / `SIMDUTF_HEAD` to the verified complete release images. The
driver JDK in `SIMDUTF_BOOT` is used only to launch JMH; `-jvm` selects the image
being measured.

`SimdUTFWide` constructs its wire corpus independently of the charset methods
under test and checks each trial's conversions against it. The segment setup
checks exact bytes as well as a round trip. Its sizes count UTF-16 code units,
not encoded bytes. The supplementary corpus contains `size / 2` pairs plus an
ASCII character for an odd size, so a size of one contains no supplementary
character. The fallback workloads use ASCII with Shift_JIS and windows-1252 to
expose dispatch overhead in generic charset paths.

Emit the untimed case/corpus manifest from the same benchmark JAR:

```sh
"$SIMDUTF_BOOT/bin/java" -Xmx512m -cp "$SIMDUTF_BENCH_JAR" \
    org.openjdk.bench.java.lang.SimdUTFWide > corpus.csv
```

The default manifest has 10,260 wide-conversion cells and 76 fallback cells.
Each row contains the method, all its parameters, encoded byte count and SHA256
of the wire payload. It contains no timing result. A frozen size override can
prepare a smaller pilot or a threshold grid without changing the benchmark:

```sh
"$SIMDUTF_BOOT/bin/java" -Xmx512m -cp "$SIMDUTF_BENCH_JAR" \
    org.openjdk.bench.java.lang.SimdUTFWide \
    --sizes 7,8,9,14,15,16,17,30,31,32,33,63,64,65 > boundary-corpus.csv
```

These points bracket x64's default 32-unit admission and the automatic UTF-32
decoder's 64-byte floor, accounting for wire width and the UTF-16 BOM. AArch64
currently retains the shared 256-unit default; add 63/64/65 and
126/127/128/129 for its wire-width and BOM boundaries. Record the actual
minimum on each image rather than assuming either architecture's policy. Larger
boundary grids should include 2047/2048/2049 and 4095/4096/4097 code units around
the 8 KiB staging capacity, 8191/8192/8193 around repeated staging, and
262143/262144/262145 and 524287/524288/524289 around the 1 MiB native-call byte
boundaries. Keep sizes at or below 1048576. These are sampling points, not
measured crossover values. Explicit `SIMDUTFMinLength` overrides bypass the
automatic operation floors and must be labeled separately.

### Timing and allocation records

Freeze the selected manifest, fork/iteration counts, heap, VM tier, corpus,
commands, variant order, controls and regression criteria before execution.
Run one exact method/parameter cell at a time. Omit blank manifest parameters;
for example, buffer parameters are not applicable to String-only methods.
Use JMH JSON and its built-in GC profiler for both timing and normalized
allocation. A representative single cell, after its campaign has been selected,
is:

```sh
"$SIMDUTF_BOOT/bin/java" -jar "$SIMDUTF_BENCH_JAR" \
    'org.openjdk.bench.java.lang.SimdUTFWide.decodeBuffer$' \
    -jvm "$SIMDUTF_HEAD/bin/java" \
    -jvmArgs '-Xms512m -Xmx512m -XX:ActiveProcessorCount=2' \
    -p charsetName=UTF-32LE -p content=BMP -p size=16 \
    -p sourceKind=DIRECT -p destinationKind=HEAP \
    -f 3 -wi 3 -i 5 -w 1s -r 1s -prof gc -rf json -rff result.json
```

Use the identical command with the original-master image for the baseline.
Only the candidate-disabled variant adds
`-jvmArgsAppend '-XX:-UseSIMDUTFIntrinsics'`. Retain JMH's actual fork command
lines. Verify positive native admission on candidate-enabled images separately;
successful public conversion alone could be a fallback.

Use the unchanged `ArrayCopy.arrayCopy` and `Integers.toStringSmall` (`size=500`)
as neutral controls, with their original source hashes recorded. The fallback
charset methods are workloads under review, not neutral controls. Interleave
the three variants in all six fixed orders (`B E D`, `E D B`, `D B E`, `B D E`,
`D E B`, `E B D`) so every variant occupies every position equally. Preserve
every block and fork; do not select the best order or rerun a failed control
until it passes. Failed controls make their block inconclusive and require a
cause to be established before a replacement experiment.

Retain primary timing data, units, raw fork/iteration observations, confidence
intervals, and `gc.alloc.rate.norm` with unit `B/op`. Missing, unsupported or
non-finite allocation data are inconclusive; GC count or MB/s cannot substitute
for allocation per operation. Report absolute allocation deltas, including
when the baseline is zero, rather than dividing by zero. Constructor/getBytes
and getString include their returned objects; buffers and setString use
preallocated trial state, so their allocation records expose per-call
temporaries. Do not subtract estimated object headers or String payloads from
the profiler result. The Integers control performs a batch per invocation;
compare it only with its matching control configuration.

Join results to the frozen manifest by method and complete parameter map.
Reject duplicates, unexpected cells, changed payload hashes, mismatched units,
image/command mismatches and incomplete fork sets. Keep rows for unrun, failed
and inconclusive configurations as well as successful ones. Do not relabel a
diagnostic, patched-class result or emulator timing as a full-image result.

### Deriving dispatch thresholds

Derive crossovers separately for architecture, execution tier, operation,
content and storage combination. String decode consumes wire bytes, while
encode consumes UTF-16 units; buffer capacity and BOM removal can change the
eligible amount. Use the recorded encoded byte count rather than equating
`size` with bytes. Require a gain that persists across consecutive sampled
sizes and balanced blocks without an unresolved allocation or control
regression. A single winning cell is not a threshold. Keep ambiguous ranges on
the existing path and add boundary samples before changing their admission.

The global minimum also affects UTF-8, search and Base64, so a wide-conversion
crossover cannot justify changing it without the corresponding workloads.
Recheck short inputs and opt-out costs after any threshold change. x64 results
cannot establish an AArch64 threshold, and a safe fallback is not a performance
gain. Preserve CPU/ISA admission independently of this dispatch tuning.
