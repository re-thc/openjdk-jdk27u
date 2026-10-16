# NIO cache lifetime review and manual qualification

This branch backports JDK-8392951, upstream commit
`46d5c4cde130da57ace0f12aededc6f4b18bf06f`, preserving donor authorship and
legal headers. It pins virtual threads to their carrier around access to the
carrier-local temporary direct-buffer, iovec and native-buffer caches, and fixes
the aligned-buffer replacement lifetime. No other memory proposals are included.

This directory contains source-only manual fixtures and an optional Linux
scheduling diagnostic. It contains no private handoff requirements, binaries,
host records or performance verdict. No workflow changes are needed.

## Build and correctness checks

From a clean checkout, use the repository's documented build dependencies
(`doc/building.md`), supported boot JDK and jtreg installation. For example:

```sh
bash configure --with-conf-name=nio-review --with-debug-level=release \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME"
make CONF=nio-review images
make CONF=nio-review test TEST="jdk:sun/nio/ch/TempBuffer.java jdk:java/nio/channels/FileChannel/TempDirectBuffersReclamation.java"
```

Build a second checkout at this branch's parent before the donor commit for a
matched baseline, using the same dependencies, configuration and hardware.
Do not compare a release image with a debug image. These instructions are for
reproduction; the new current-master branch has not been built in this task.

Compile the fixtures once with a supported JDK (reuse those classes for both
images):

```sh
JDK="$PWD/build/nio-review/images/jdk"
Q="$PWD/test/manual/nio-cache"
mkdir -p "$Q/classes" "$Q/generated"
"$JDK/bin/javac" --add-exports java.base/sun.nio.ch=ALL-UNNAMED \
  -d "$Q/classes" "$Q/NioAlignedCacheLifecycleFixture.java" "$Q/NioCarrierFixture.java"
"$JDK/bin/java" -cp "$Q/classes" NioCarrierFixture platform
"$JDK/bin/java" -Djdk.virtualThreadScheduler.parallelism=4 \
  -Djdk.virtualThreadScheduler.maxPoolSize=4 -cp "$Q/classes" NioCarrierFixture virtual
```

Both carrier modes should report checksum 1627136 with no exceptions. They cover
heap-buffer scalar and scattering/gathering file I/O with yields and thread exit.
They do not prove all carrier migration schedules or all platforms.

For lifecycle accounting, run in a terminal and keep stdin open:

```sh
"$JDK/bin/java" -Xshare:off -XX:NativeMemoryTracking=detail \
  --add-exports java.base/sun.nio.ch=ALL-UNNAMED \
  -cp "$Q/classes" NioAlignedCacheLifecycleFixture control
```

At `NIO READY`, use that image's `jcmd <pid> VM.native_memory baseline` and
`VM.native_memory detail scale=1` from another terminal. Press Enter once. At
`NIO POST_EXIT`, collect `VM.native_memory detail.diff scale=1` and
`VM.native_memory detail scale=1`; press Enter again to exit. Main and warmup
threads have fully exited before READY; the measured worker fully exits before
POST_EXIT. Reconcile the complete live `Other` malloc category and its groups,
not a selectively named frame. This is NMT requested allocation accounting,
not RSS, PSS, committed memory or peak allocation. An unexplained nonzero
background allocation is inconclusive; do not subtract it.

Repeat separately for baseline/candidate. `leak` instead of `control` requires
all 32 ordinary cached buffers to be misaligned for the requested 4096-byte
alignment; if the allocator does not produce that path, the fixture fails and
no aligned-replacement conclusion is supported. Do not weaken that assertion.
Controls can use `-Djdk.nio.maxCachedBufferSize=0`; boundary cases use 65536,
69631 and 69632. Distinguish control zero-retention from actually exercising the
replacement path.

## Optional one-baseline scheduling diagnostic

Dependency setup uses the repository recipe (normal managed dependency setup,
not part of this task's executed work):

```sh
bash make/devkit/createJMHBundle.sh
JARS="$PWD/build/jmh/jars"
CP="$JARS/commons-math3-3.6.1.jar:$JARS/jopt-simple-5.0.4.jar:$JARS/jmh-core-1.37.jar:$JARS/jmh-generator-annprocess-1.37.jar"
"$JDK/bin/javac" --add-exports java.base/sun.nio.ch=ALL-UNNAMED \
  -cp "$CP" -processorpath "$CP" \
  -processor org.openjdk.jmh.generators.BenchmarkProcessor \
  -s "$Q/generated" -d "$Q/classes" "$Q/NioCachePaths.java"
python3 -m unittest discover -s "$Q" -v
python3 "$Q/prepare.py" --jdk "$JDK" --classes "$Q/classes" --jars "$JARS"
```

`prepare.py` only hashes local inputs and writes a local command/freeze; it
launches no processes. The explicit colon-separated processor path avoids wildcard ambiguity.
Do not omit annotation processing: BenchmarkList,
CompilerHints and generated timed-loop classes are required. JMH 1.37 and all
four exact recipe jars are required. No downloaded or locally built outputs
belong in a commit.

Execution is a separately approved scope in a fresh checkout:

```sh
python3 "$Q/diagnostic.py" --execute-approved --approval-reference NEW_APPROVAL
```

One Python observer, one JDK coordinator, one baseline fork; no compiler,
candidate, jcmd, helper probes, retries or CI job. Five one-second warmups and
seven one-second measurements of `ordinaryHit`, one worker and 1024 operations
per invocation. Global cap 90 seconds; preflight 30 seconds; invocation deadline
60 seconds from controller start; cleanup reserve two seconds. Output cap 48 MiB
while running. An existing run directory prevents reuse. The compatibility flag
`--sun-misc-unsafe-memory-access=allow` applies to both JVMs; stderr must remain
empty. Both `java.home` and JMH helper-probe controls are explicit. XML log names
use `hotspot_pid<number>.xml`; GC names use `gc_<number>.log`.

Requires Linux, readable task schedstat/sched/stat, populated scheduling
counters, readable cgroup v2 cpu.stat and CPUs0-4. Workload affinity0-3,
observer affinity4: both share the cgroup quota. No perf/pidstat/PMU dependency.
CLOCK_MONOTONIC must be shared by Python and HotSpot. Sampling target20ms;
reject gaps over30ms or acquisition brackets over5ms within final two warmups
and all measured windows. Observer CPU above2% of one CPU makes collection
inconclusive. Identity uses PID/TID starttimes and the unique HotSpot-truncated
JMH worker name; ambiguity and counter resets fail admission.

Report conservative lower/upper deltas for worker runtime, run-queue wait,
context switches, migrations and timeslices using interior and exterior
samples, never interpolation. Raw cgroup throttle/usage and global CPU/steal
snapshots supply context, not attribution to a particular process. Observer
windows enclose synchronization and fixture hooks as well as the timed loop;
they do not expose exact timed-loop CPU cost. Sampling perturbs the workload
and can miss brief migrations. No CPU frequency or hardware counter conclusion
is possible here.

Correlate seven scores with CPU/wait bounds, throttling, compilation and GC.
Material CPU deprivation can establish a scheduling contribution at observer
window granularity. Near-full CPU with slower scores does not alone identify a
code regression. Missing, intrusive or insufficiently resolved data leaves the
cause unresolved. Diagnostic success is **data only**, never a performance
pass. Existing failed/noisy performance controls stay inconclusive. No new
candidate campaign is authorized by this diagnostic.

## Evidence and remaining limits

Earlier Linux x64 release qualification on the original source base completed
a matched lifecycle pair plus16 additional cases, including four jtreg runs,
with complete cleanup. The tested candidate removed tracked requested NIO
allocation retention; the default baseline retained2224128 bytes in32
allocations while the candidate retained zero. This was not a current-master
rebuild. No startup, RSS/PSS, representative throughput/pause-tail or universal
no-regression claim is established. Unchanged-code timing controls were
inconclusive. This newly repository-based diagnostic is source-reviewed and
offline-tested, not runtime-qualified.
