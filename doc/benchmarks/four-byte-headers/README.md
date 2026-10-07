# Reproducing the measurements

Build the unmodified base and the candidate with the same compiler,
configuration and Java libraries. Use release images for timings. Keep each
image immutable while its JVMs are running. Set these environment variables:

```sh
export BASELINE_JDK=/absolute/path/to/baseline/jdk
export CANDIDATE_JDK=/absolute/path/to/candidate/jdk
export RESULTS_DIR=/absolute/path/to/results
export RENAISSANCE_JAR=/absolute/path/to/renaissance-gpl-0.16.1.jar
export JMH_CP='/absolute/path/to/jmh/dependencies/*'
export JMH_PROCESSOR_CP=/absolute/path/to/jmh-generator-annprocess-1.37.jar:/absolute/path/to/jmh-core-1.37.jar
```

The JMH runtime dependencies are JMH core 1.37, jopt-simple 5.0.4 and
commons-math3 3.6.1. The annotation processor is JMH generator 1.37.
Renaissance 0.16.1 has SHA-256
`46d23ad03c5fd3dbf4365a5d15ea5a6c7ec682061fa6775a09d39942d80b0bf3`.

Run the following from the repository root on an idle machine:

```sh
bash doc/benchmarks/four-byte-headers/run.sh footprint
bash doc/benchmarks/four-byte-headers/run.sh memory
bash doc/benchmarks/four-byte-headers/run.sh jmh
bash doc/benchmarks/four-byte-headers/run.sh renaissance
bash doc/benchmarks/four-byte-headers/run.sh startup
python3 doc/benchmarks/four-byte-headers/summarize.py "$RESULTS_DIR"
```

The analyzer requires Python 3 and SciPy (the recorded run used SciPy 1.17.0).
It rejects incomplete workload, layout, collector, fork and iteration matrices.

Each mode compares the original eight-byte default with candidate eight-byte,
twelve-byte and four-byte layouts under Serial, G1 and ZGC. This fork now
defaults to four-byte headers; the historical `default8` control label selects
eight-byte headers explicitly with `-XX:-UseFourByteObjectHeaders`. Timed JVMs use
four active processors and a fixed 512 MiB heap. `BENCH_PROCESSORS` overrides
the processor count for the first four modes. Startup uses a 32 MiB heap and
requires successful loading of each layout's matching default CDS archive.

The footprint probe sums `Instrumentation.getObjectSize` for one million
objects containing one `int`, plus their retaining reference array. It checks
hash and payload preservation after movement. The result distinguishes
unhashed objects from hashed objects after GC; hidden hash slots can erase
the initial saving. It excludes the auxiliary verification hash array and
dead allocation pressure. This measures exact shallow graph size, rather
than process RSS.

The Renaissance memory plugin performs a full collection at operation setup
and before teardown. It records heap occupancy, non-heap use and Linux RSS
separately. Collector page granularity, heap slack, buffers and TLABs affect
these values; post-GC occupancy is not an exact count of live object bytes.
Plugin runs are for memory measurements. Use separate runs without the
plugin for performance comparisons. The two workloads validate their output
through the Renaissance harness.

JMH runs three independent JVM forks, five one-second warmup iterations and
five one-second measurement iterations. Its GC profiler reports allocated
bytes per operation. The benchmark includes both first and stored identity
hashes, lookup in a prepopulated `IdentityHashMap`, and map churn that retains
hashed objects across young collections.

Renaissance timing runs use three independent JVMs per configuration and ten
operations per workload. Discard the first five operations and aggregate the
last five within each fork before comparing configurations. Startup interleaves
50 fresh JVMs per configuration after five untimed rounds with a fixed shuffle
seed. It measures `java -version` process startup, not application readiness.

The [final application report](results/applications.md) retains all final fork
JSON files, summary CSVs and image fingerprints. The
[supplementary layout report](results/validation.md) retains concise historical
layout/hash summaries, including measured costs. The
[current CI snapshot](results/applications/review-ci-snapshot.json) records the
review-fix runs. The [earlier completed CI audit](results/applications/final-ci-snapshot.json)
belongs to the prior runtime revision; full JTRs and logs are workflow artifacts.

The additional locking/hash race uses JCStress 0.16, JNA and JNA platform
5.8.0, and jopt-simple 4.6. Set `JCSTRESS_CP` to those four jars, then run:

```sh
mkdir -p "$RESULTS_DIR/jcstress-classes"
"$CANDIDATE_JDK/bin/javac" -cp "$JCSTRESS_CP" \
  -processor org.openjdk.jcstress.infra.processors.JCStressTestProcessor \
  -d "$RESULTS_DIR/jcstress-classes" \
  doc/benchmarks/four-byte-headers/HashAndLock.java
for gc in Serial G1 Z; do
  "$CANDIDATE_JDK/bin/java" --enable-native-access=ALL-UNNAMED \
    -XX:ActiveProcessorCount=2 \
    -cp "$RESULTS_DIR/jcstress-classes:$JCSTRESS_CP" \
    org.openjdk.jcstress.Main -t 'fourbyte.HashAndLock' \
    -m quick -f 3 -iters 5 -time 200 -c 2 -af NONE \
    -r "$RESULTS_DIR/jcstress-$gc" \
    -jvmArgsPrepend "--enable-native-access=ALL-UNNAMED -XX:+Use${gc}GC"
done
```

The actors race the first identity hash with synchronized updates while
allocating garbage. The arbiter rejects hash changes and lost field updates.
This supplements the jtreg relocation and concurrent-hash tests.

To investigate first-hash timing separately, run the balanced-order recheck
after the main suite has finished:

```sh
bash doc/benchmarks/four-byte-headers/repeat-first-hash.sh
python3 doc/benchmarks/four-byte-headers/summarize.py "$RESULTS_DIR"
```

It runs six independent forks for baseline, default and four-byte layouts
under each required collector. The six possible configuration orders each
run once. This preserves all results while reducing fixed-order effects.

The main matrix also identified possible costs in Serial identity-map lookup
and ZGC stored-hash reads. Confirm those two cases separately, after all other
timed runs finish:

```sh
bash doc/benchmarks/four-byte-headers/repeat-hash-reads.sh
python3 doc/benchmarks/four-byte-headers/summarize-hash-reads.py "$RESULTS_DIR"
```

This uses the already compiled JMH classes and the same six balanced orders.
All reported improvement percentages compare the original JDK 27u eight-byte
default with four-byte mode. Candidate eight-byte and twelve-byte measurements
serve as default-behavior and compatibility controls.

The initial application matrix showed a default-mode Serial Scala Doku
slowdown signal. Recheck the original two-workload sequence in twelve forks
with balanced baseline/default/four-byte order:

```sh
bash doc/benchmarks/four-byte-headers/repeat-serial-app.sh
python3 doc/benchmarks/four-byte-headers/summarize-serial-app.py "$RESULTS_DIR"
```

Each of the six layout orders occurs twice. The first six-fork round still
left uncertainty about a smaller default-mode slowdown, so the recorded run
includes a second balanced round. Keep every supplementary run sequential
with the main timed runs.

One initial Serial post-GC occupancy control was unusually high. Confirm
memory results independently after `run.sh memory` has built the plugin:

```sh
bash doc/benchmarks/four-byte-headers/repeat-memory-check.sh
```

This records three fresh JVMs per layout and three plugin operations per
workload. The report uses the median of per-fork medians and retains the range.

For the occupancy diagnostic without TLAB slack, use:

```sh
MEMORY_NO_TLAB=true MEMORY_RESULT_PREFIX=notlab \
  bash doc/benchmarks/four-byte-headers/repeat-memory-check.sh
```

These diagnostic runs are excluded from performance comparisons.

## Database and Spring application runs

The fork-default application comparison uses the original JDK 27u eight-byte
default and the candidate's four-byte default without an enabling flag. Both
use a 512 MiB heap, four active processors and their normal ergonomic collector
(G1 on the recorded host). Finish compilation and correctness testing before
starting timing runs. Keep every timed JVM sequential.

Renaissance's `db-shootout` uses its ordinary 500,000-entry configuration with
MapDB, Chronicle Map and H2 MVStore reads/writes. Its upstream validator is a
dummy: normal completion does not establish that all database results are
correct. The final timing study uses twelve independent JVMs per layout and the
upstream default sixteen operations, discarding the first eight. The earlier
six-fork, eight-operation study was inconclusive, so the longer study was
specified before final-image timings. Workload size remains unchanged. Memory runs use
twelve separate JVMs per layout and three operations with the heap plugin.
The review-fix study specifies all twelve memory forks before measurements.
The prior image's exploratory memory follow-up remains in Git history:

```sh
DATABASE_FORKS=12 DATABASE_REPEATS=16 \
  bash doc/benchmarks/four-byte-headers/database.sh timing
DATABASE_FORKS=12 bash doc/benchmarks/four-byte-headers/database.sh memory
```

Spring Petclinic is pinned to commit
`67643c4137eb75bfeb177b427f8459c471bdcbd8`, using Spring Boot 3.5.0, Hibernate,
Thymeleaf, Tomcat and embedded H2. Build the same application jar once:

```sh
git clone https://github.com/spring-projects/spring-petclinic.git
git -C spring-petclinic checkout 67643c4137eb75bfeb177b427f8459c471bdcbd8
cd spring-petclinic
mvn -DskipTests -Dcheckstyle.skip -Dspring-javaformat.skip package
```

From the JDK repository root, with Python 3, aiohttp and SciPy installed:

```sh
python3 doc/benchmarks/four-byte-headers/petclinic-load.py \
  "$BASELINE_JDK" "$CANDIDATE_JDK" \
  /absolute/path/to/spring-petclinic/target/spring-petclinic-3.5.0-SNAPSHOT.jar \
  "$RESULTS_DIR"
python3 doc/benchmarks/four-byte-headers/summarize-typical.py "$RESULTS_DIR" \
  --database-forks 12 --database-repeats 16 --memory-forks 12
```

The fixture expands the standard database to 10,000 owners, with one pet and
visit for each added owner. Eight persistent HTTP workers cycle through owner
search, owner details and veterinarians. Each response must have status 200
and the expected owner or page text. Six independent JVMs per layout use
30 seconds of warmup and 60 seconds of measured load, alternating layout order.
The harness reports throughput, p50/p95/p99 latency, server/load-driver CPU,
RSS, busy heap samples and startup until health is UP. A full GC and heap
measurement occur after the timed load. This is a local read-heavy application
test with an embedded database; production network and database latency differ.

The analyzer requires every expected fork and normal database termination,
and rejects HTTP failures or incorrect header layouts. Its 95% intervals use
independent fork means. Raw values and per-fork measurements accompany the
application results; they are not combined with the earlier opt-in image.

For a diagnostic comparison that also includes the fork's eight-byte opt-out,
pass `--control`. To collect CPU stacks with async-profiler 4.1, pass
`--profile-library /absolute/path/to/libasyncProfiler.so` and use a separate
results directory. These profiles use the `itimer` event and five-millisecond
sampling. Profiled runs include startup and load, are excluded from timing
tables, and are rejected by the primary analyzer.
