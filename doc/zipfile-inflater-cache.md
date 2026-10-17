# Compact ZipFile inflater cache

Empty caches use null; singleton caches store the inflater directly. A second
idle return permanently promotes the cache to the original default-capacity
ArrayList. Unbounded LIFO reuse is preserved. Cleanup marks even an empty cache
closed before closing active streams; failed admission ends the returning
inflater outside the cache monitor.

Prior local validation: a generic-configure JDK build and 15 targeted ZIP/inflater
tests passed under each of Serial, G1 and ZGC (45 test executions). On Linux x64 with
a 128 MiB heap and the fork's default headers, container bytes per unused/serial
ZipFile fell from 16/64 to zero under Serial/G1, and from 24/112 to zero under
ZGC. Resource-object sizes and promoted-cache containers were unchanged. These
are per-file heap-container counts, excluding one shared closed marker. They
are not RSS or native-memory reductions. Native reuse and release were checked;
startup, throughput neutrality and other platforms/backends were not validated.

The [staged qualification plan](zipfile-inflater-cache/QUALIFICATION.md) first
decides value with exact-head Linux profile builds, retained-container/native
reuse checks and protected startup/throughput cases. Only a worthwhile Linux
result proceeds to normal supported-platform PR correctness CI. The latest
attempt built both packaged JDKs and passed six baseline Serial controls, then
stopped before candidate tests on a harness test-selection error. The complete
[retained-image continuation](zipfile-inflater-cache/CONTINUATION.md) is prepared
for review and separate execution approval; it does not rebuild. Other native
performance campaigns are not prerequisites by assumption.
The full Linux sequence has a four-hour supervisor with owned-process cleanup;
the continuation preserves the original 2026-10-17T18:47:24Z absolute deadline,
including time spent waiting for review or approval.
Proposed 2%/3% resolution checks do not authorize a slowdown: consistently slower
results require explicit trade-off review. Qualification reports observed native
allocation calls separately from live client bytes, not RSS or allocator-retained
savings; startup means a fresh JVM with warm filesystem caches.

## Build and regression

With the repository's build dependencies already installed and BOOT_JDK and
JTREG_HOME pointing to compatible installations:

```sh
bash bin/configure-dev --with-conf-name=review \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME"
make CONF=review JOBS=4 jdk-image
JDK="$(pwd)/build/review/images/jdk"
for gc in Serial G1 Z; do
  make CONF=review JOBS=4 test JDK_IMAGE_DIR="$JDK" \
    TEST="test/jdk/java/util/zip/ZipFile/InflaterCache.java" \
    JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m"
done
```

The regression covers empty/singleton/promoted transitions, permanent promotion,
LIFO order, burst identity reuse, invalid DEFLATE, concurrent reads and returns,
and close/cleaner races with one, two and 32 streams.

## Heap-container reproduction

Build baseline `89885a6288e7aaabd01678a704a586272c0f96e3` and this revision with
the same configuration and `jdk-image` target. Set JDK to each checkout's
`build/review/images/jdk` in turn and OUT to an absolute writable directory,
then run from the repository root:

```sh
mkdir -p "$OUT/classes"
"$JDK/bin/javac" -d "$OUT/classes" \
  doc/zipfile-inflater-cache/ZipCacheFootprint.java
printf 'Premain-Class: ZipCacheFootprint\n' > "$OUT/agent.mf"
"$JDK/bin/jar" --create --file "$OUT/footprint-agent.jar" \
  --manifest "$OUT/agent.mf" -C "$OUT/classes" .
for gc in Serial G1 Z; do
  "$JDK/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC \
    --add-opens java.base/java.util.zip=ALL-UNNAMED \
    --add-opens java.base/java.util=ALL-UNNAMED \
    -javaagent:"$OUT/footprint-agent.jar" -cp "$OUT/classes" ZipCacheFootprint
done
```

The agent measures current cache containers with Instrumentation.getObjectSize,
excluding shared empty arrays, inflater objects and native allocations. It
checks 32 files per case and 20 serial/eight-stream reuse cycles. Output totals
must be divided by the file count for per-file figures. Observed historical
identities describe allocation reuse, not total process retained memory.
Measured containers use linear reference-identity tracking because identity
hashing can expand four-byte headers during GC. Record UseFourByteObjectHeaders,
UseCompactObjectHeaders, UseCompressedOops and ObjectAlignmentInBytes using
`-XX:+PrintFlagsFinal -version` with the same heap and collector flags.
