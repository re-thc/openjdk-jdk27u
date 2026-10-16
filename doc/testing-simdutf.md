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

Second, the focused semantic boundary suite and C1 opt-out regression:

```sh
timeout -k 30s 20m "$SIMDUTF_BOOT/bin/java" -Xmx256m \
    -jar "$SIMDUTF_JTREG/lib/jtreg.jar" \
    -jdk:"$SIMDUTF_CANDIDATE" -conc:1 -timeoutFactor:3 \
    -javaoption:-Xmx512m \
    -w:"$SIMDUTF_OUT/wide-work" -r:"$SIMDUTF_OUT/wide-report" \
    test/jdk/java/lang/String/SimdUTFWideTest.java#portable \
    test/jdk/java/lang/String/SimdUTFWideTest.java#compiled \
    test/hotspot/jtreg/compiler/intrinsics/simdutf/TestSimdUTFDisabled.java
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
