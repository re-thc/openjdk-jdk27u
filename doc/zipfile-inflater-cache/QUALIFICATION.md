# Staged compact ZIP cache qualification

Prepared instructions only: the qualification driver/runner have had source
review but have not been compiled or executed. Compact-cache startup and
throughput remain unmeasured. Default inflater eviction remains rejected.

## Subject and existing evidence

Baseline B is `89885a6288e7aaabd01678a704a586272c0f96e3`. Product source was
published at `4c24619ebb6cb14e1c96d1c1029568dcc3585840`; subsequent qualification
files do not change it. Set C to the full reviewed head of
`review/zipfile-compact-inflater-cache`, record it once and use that exact checkout.
The expected Git blobs are:

| File | Blob |
| --- | --- |
| src/java.base/share/classes/java/util/zip/ZipFile.java | 9943e4f9635c2480f58bdf7c0116432eee00ad51 |
| test/jdk/java/util/zip/ZipFile/InflaterCache.java | f79e29971e1c8b6dcedea8420a74ad80db914bd1 |
| doc/zipfile-inflater-cache/ZipCacheFootprint.java | e720f00727bb6c030896d6f914f94dad8d664a47 |

The normal Linux x64 GCC 16.2 build and 15 targeted tests under each of
Serial/G1/ZGC passed for this product source. That build used generic configure
flags, not the repository's configure-dev native profile. Instrumentation showed
16/64 bytes per unused/serial cache eliminated under default Serial/G1 layouts,
24/112 under ZGC, without resource growth or promoted-cache changes. These are
heap-container counts, excluding one shared closed marker. Linux/plain-zlib
1.3.1 accounting showed unchanged one/32-stream native requests, no replacement
inflaters and complete release at close. Earlier eviction startup/performance
results do not qualify this compact representation. No current result proves
startup/throughput neutrality, native/RSS savings or other-platform performance.

## Stage 1: decide value on Linux first

Use one native Linux x64-v3 host and the repository profile, Serial/G1/ZGC only.
No other native host is a prerequisite. Use installed compatible Boot JDK 27,
jtreg 8.3, GCC 16, mold, GNU make/coreutils timeout, autoconf, Python 3 and system
plain zlib headers.
No JMH, unmanaged installation, binary transfer or CI is required. The owner
resolves ordinary installed tool/dependency paths and runs the complete stage
after execution is authorized. ROOT is a fresh absolute writable workspace;
BOOT_JDK and JTREG_HOME name installed tools; C is the reviewed full commit SHA.

Ceiling: four allocated CPUs, 16 GiB RAM, 30 GiB scratch, four hours wall time,
two normal build images, JOBS=4 and two jtreg workers. Enforce the overall limit
with the host's job deadline or GNU timeout around the command sequence; stop
each build at 90 minutes and each correctness stage at 30 minutes. No concurrent
build/check/timing work. Use a quiet host; do not change governors, disable
security or flush OS caches. Preserve every outcome; no threshold sweep or
favorable reruns. Fresh profile checks close a configuration gap rather than
repeat the already completed generic-profile campaign.

Stop on identity drift, missing/incompatible tools, unsupported collector,
build/test failure, bad content/provider count, worker failure, hang, lifecycle
failure or exhausted budget. Do not install a replacement tool automatically.
Source-only driver fixes are owned work before the first timed process, with
their new identities recorded; a product change or a driver change after timing
stops this qualification. A baseline failure invalidates the comparison.

### Normal checkouts and builds

These are commands for a future authorized run, not actions already taken.
Pass any installed dependency-prefix configure options identically to both
builds, preserving the profile's CPU and collector settings.

```sh
set -euo pipefail
B=89885a6288e7aaabd01678a704a586272c0f96e3
: "${C:?Set C to the full reviewed commit SHA}"
git fetch origin master review/zipfile-compact-inflater-cache
test "$(git rev-parse "$C^{commit}")" = "$C"
git cat-file -e "$C:doc/zipfile-inflater-cache/run-qualification.py"
test "$(git rev-parse "$C:src/java.base/share/classes/java/util/zip/ZipFile.java")" = 9943e4f9635c2480f58bdf7c0116432eee00ad51
test "$(git rev-parse "$C:test/jdk/java/util/zip/ZipFile/InflaterCache.java")" = f79e29971e1c8b6dcedea8420a74ad80db914bd1
test "$(git rev-parse "$C:doc/zipfile-inflater-cache/ZipCacheFootprint.java")" = e720f00727bb6c030896d6f914f94dad8d664a47
git worktree add --detach "$ROOT/base" "$B"
git worktree add --detach "$ROOT/candidate" "$C"
mkdir -p "$ROOT/results" "$ROOT/classes"
for tree in base candidate; do
  cd "$ROOT/$tree"
  bash bin/configure-dev --with-conf-name=zip-qual --with-debug-level=release \
    --with-jobs=4 --with-memory-size=8192 --with-boot-jdk="$BOOT_JDK" \
    --with-jtreg="$JTREG_HOME" --with-zlib=system \
    > "$ROOT/results/$tree-configure.log" 2>&1
  timeout --kill-after=30s 90m make CONF=zip-qual JOBS=4 jdk \
    > "$ROOT/results/$tree-build.log" 2>&1
done
BASE_JDK="$ROOT/base/build/zip-qual/jdk"
CANDIDATE_JDK="$ROOT/candidate/build/zip-qual/jdk"
Q="$ROOT/candidate/doc/zipfile-inflater-cache"
```

Record source/tool/compiler/spec and image hashes, actual system zlib and VM
layout flags locally. Verify release build, x86-64-v3 and exactly Serial/G1/ZGC
in the configured JVM features. Do not copy old build directories into checkouts.

### Correctness, retained containers and native reuse

Run the original fifteen cache/ZIP tests plus six protected local JAR consumer
tests on C; the six consumer tests also run on B as controls. Do not sweep the
whole URLClassLoader directory, which includes unrelated HTTP-server tests.

```sh
cache_tests="test/jdk/java/util/zip/InflaterClose.java
test/jdk/java/util/zip/DeflaterDictionaryTests.java
test/jdk/java/util/zip/InflaterInputStream/MarkReset.java
test/jdk/java/util/zip/InflaterInputStream/TestAvailable.java
test/jdk/java/util/zip/InflaterInputStream/UnexpectedEndOfZlibStream.java
test/jdk/java/util/zip/ZipFile/DeleteTempJarTest.java
test/jdk/java/util/zip/ZipFile/FinalizeInflater.java
test/jdk/java/util/zip/ZipFile/InflaterCache.java
test/jdk/java/util/zip/ZipFile/InvalidCompressedSizeTest.java
test/jdk/java/util/zip/ZipFile/MultiThreadedReadTest.java
test/jdk/java/util/zip/ZipFile/ReadAfterClose.java
test/jdk/java/util/zip/ZipFile/ReleaseInflater.java
test/jdk/java/util/zip/ZipFile/ShortRead.java
test/jdk/java/util/zip/ZipFile/TestCleaner.java
test/jdk/java/util/zip/ZipFile/ZipFileSharedSourceTest.java"
consumer_tests="test/jdk/java/net/URLClassLoader/JarLoaderCloseTest.java
test/jdk/java/util/ServiceLoader/basic/ServiceLoaderBasicTest.java
test/jdk/java/util/jar/JarFile/mrjar/MultiReleaseJarAPI.java
test/jdk/java/util/jar/JarFile/VerifySignedJar.java
test/jdk/java/util/jar/JarFile/SignedJarFileGetInputStream.java
test/jdk/java/util/jar/JarFile/SignedJarPendingBlock.java"
for gc in Serial G1 Z; do
  (cd "$ROOT/base" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test \
    TEST="$consumer_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m") \
    > "$ROOT/results/base-$gc-tests.log" 2>&1
  cp -a "$ROOT/base/build/zip-qual/test-results" "$ROOT/results/base-$gc-test-results"
  (cd "$ROOT/candidate" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test \
    TEST="$cache_tests $consumer_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m") \
    > "$ROOT/results/candidate-$gc-tests.log" 2>&1
  cp -a "$ROOT/candidate/build/zip-qual/test-results" "$ROOT/results/candidate-$gc-test-results"
done
"$BOOT_JDK/bin/javac" -d "$ROOT/classes" "$Q/ZipCacheQualification.java" \
  "$Q/ZipCacheFootprint.java" "$Q/ZipInflaterProbe.java"
"$BOOT_JDK/bin/jar" --create --file "$ROOT/workload.jar" -C "$ROOT/classes" .
printf 'Premain-Class: ZipCacheFootprint\n' > "$ROOT/agent.mf"
"$BOOT_JDK/bin/jar" --create --file "$ROOT/footprint-agent.jar" \
  --manifest "$ROOT/agent.mf" -C "$ROOT/classes" .
gcc -shared -fPIC -O2 -I"$CANDIDATE_JDK/include" -I"$CANDIDATE_JDK/include/linux" \
  "$Q/zipalloc.c" -o "$ROOT/libzipalloc.so" -ldl
"$BOOT_JDK/bin/java" -cp "$ROOT/workload.jar" ZipCacheQualification prepare "$ROOT/fixtures"
for gc in Serial G1 Z; do
  for label in base candidate; do
    image="$ROOT/$label/build/zip-qual/jdk"
    timeout --kill-after=5s 30s "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC \
      -cp "$ROOT/workload.jar" ZipCacheQualification lifecycle "$ROOT/fixtures" \
      > "$ROOT/results/$label-$gc-lifecycle.log" 2>&1
    timeout --kill-after=5s 30s "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC \
      --add-opens java.base/java.util.zip=ALL-UNNAMED \
      --add-opens java.base/java.util=ALL-UNNAMED -javaagent:"$ROOT/footprint-agent.jar" \
      -cp "$ROOT/workload.jar" ZipCacheFootprint > "$ROOT/results/$label-$gc-footprint.log" 2>&1
    "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC -XX:+PrintFlagsFinal -version \
      > "$ROOT/results/$label-$gc-flags.log" 2>&1
    for width in 1 32; do
      LD_PRELOAD="$ROOT/libzipalloc.so" timeout --kill-after=5s 30s "$image/bin/java" \
        -Xms128m -Xmx128m -XX:+Use${gc}GC --enable-native-access=ALL-UNNAMED \
        --add-opens java.base/java.util.zip=ALL-UNNAMED -Dmeasure=true \
        -Dallocator="$ROOT/libzipalloc.so" -cp "$ROOT/workload.jar" \
        ZipInflaterProbe "$width" 65536 1024 8 > "$ROOT/results/$label-$gc-native$width.log" 2>&1
    done
  done
done
python3 -E "$Q/check-allocation.py" "$ROOT/results"
```

The allocator helper requires Linux/glibc and dynamically linked plain zlib;
it fails if interposition is absent. Requested client bytes exclude its metadata;
diagnostic usable bytes are not savings. No instrumented time is reported or
used for performance. Empty/singleton containers must disappear without resource
growth; promoted containers, live native requests and identities must match B,
with zero replacements and complete release at close. No native-byte generalization
to another backend is needed for this heap-container change.

### Fixed representative startup and throughput

Only after all prior gates pass, on the same quiet Linux host:

```sh
python3 "$Q/run-qualification.py" --baseline "$BASE_JDK" --candidate "$CANDIDATE_JDK" \
  --workload-jar "$ROOT/workload.jar" --fixture "$ROOT/fixtures" \
  --out "$ROOT/results/timing"
```

Seven cases protect metadata-only opens, serial full/partial 4 KiB reads,
four independent readers sharing one ZIP, repeated 32-stream bursts with serial
reuse, first two-stream promotion on fresh ZIPs, and local 32-JAR class/resource/
service loading. The loader checks 128 generated Runnable classes and the exact
32-provider set, with eight STORED and 24 compressed archives. Reads check CRC/
length; joined Futures propagate worker failures. Signed/multi-release positive
and negative verification are correctness tests, not timing claims. The lifecycle
case closes a loader with active/idle streams, deletes/recreates its archive and
verifies a reopened full read.

The runner permits 18 batch JVMs and 48 startup JVMs total across Serial/G1/ZGC.
Batch: three independent paired forks, AB/BA/AB order; eight rounds per case,
first three warmup, process median from the last five. Startup: two warmup pairs
and six measured pairs per GC, alternating order. It measures the prepared local
JAR application's fresh JVM with warm filesystem caches, not cold-disk boot.
Heap is 128 MiB, ActiveProcessorCount=4; -Xbatch is used only for batch work.
Batch/startup timeouts are 90/15 seconds and the whole runner has a 30-minute
deadline. Output directories cannot be reused; observations and partial timeout
output are preserved. Any failed/inconclusive gate exits nonzero.

Proposed resolution gates, fixed before execution: every warm row's paired
geometric elapsed-time ratio has a one-sided 95% upper bound <=1.02; startup
<=1.03. The small-sample log-ratio t constants are 2.919986 for three pairs and
2.015048 for six. These are explicit proposed budgets, not previously approved
regressions, proof of exact zero cost or family-wise confidence. No pooled win
hides a protected loss. Inconclusive spread is a non-pass, without more samples.

Stage 1 ends with one recommendation. If builds, correctness, allocation/reuse
or protected timings fail or remain inconclusive, preserve results and recommend
against integration on that evidence; do not request three more performance
hosts. If this modest deterministic heap saving survives the gates, recommend
normal PR correctness review/CI, with Linux-only performance claims.

## Stage 2: normal supported-platform PR correctness, if worthwhile

After a worthwhile Linux result and separate authorization to create the PR,
use the repository's normal PR CI for its supported Linux x64/AArch64, macOS
AArch64 and Windows x64 builds/checks. Retain the repository Serial/G1/ZGC profile;
do not invent a new CI workflow, dispatch a manual performance campaign or require
native host provisioning before Stage 1. Confirm the focused regression is
covered and record which collector actually ran it; a CI label does not prove
all collectors were exercised. If normal CI omits that test or reveals a
collector-relevant failure, address that specific gap through the normal
supported-platform correctness path rather than invent a full extra matrix.
This document does not authorize PR creation or any CI launch.

Passing Linux timings is not evidence of other-platform performance neutrality.
Nevertheless, shared Java reference storage has no architecture-specific speedup
claim requiring three automatic native timing campaigns. Request a native
performance follow-up only for concrete evidence: a platform regression, changed
JIT/locking behavior in the affected path, or a proposed target-specific speedup.
Name that hypothesis and run only the smallest relevant protected case/collector
on that target. A general claim of universal throughput neutrality would require
more evidence; omit it instead of making it an integration prerequisite.

The owner owns checkouts, installed-tool discovery, builds/checks, bounded
analysis and source repairs. Stage 1 currently depends only on permission to
execute, not on other hosts. Stage 2 depends on later PR authorization and normal
CI availability. Source/runner preparation is not completed runtime qualification;
no builds, tests, benchmarks, installs, PRs or CI were launched while preparing it.
