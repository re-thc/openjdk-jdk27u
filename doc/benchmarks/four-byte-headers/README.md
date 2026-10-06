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
```

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

Raw JSON and CSV results and the validation report accompany the PR. The
report identifies any earlier memory-only runs whose timings were affected
by concurrent compilation or tests; those timings must not be used.
