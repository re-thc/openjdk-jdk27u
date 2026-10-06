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
twelve-byte and four-byte layouts under Serial, G1 and ZGC. Timed JVMs use
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

[Raw JSON and CSV results](results/) and the
[validation report](results/validation.md) accompany the PR. The
report identifies any earlier memory-only runs whose timings were affected
by concurrent compilation or tests; those timings must not be used.

The [evidence archive](results/evidence.zip) contains the standalone HTML
report, raw final measurements, separate before-fix results, selected-test
CSVs, audited CI summaries and local validation logs. Its publication snapshot
records pending CI jobs explicitly. Completed runs and measured timing costs
determine acceptance; a green build badge alone does not establish it.

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
    -jvmArgsPrepend "--enable-native-access=ALL-UNNAMED -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+Use${gc}GC"
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
