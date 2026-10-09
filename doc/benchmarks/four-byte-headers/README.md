# Measuring four-byte object headers

Compare an upstream JDK 27u release image, whose default header is eight bytes,
with the fork's default four-byte image. Build both revisions with the same
compiler and configuration. Keep images immutable during measurements, finish
builds and correctness tests first, and run timed JVMs sequentially on an idle
machine. Store generated results outside the source tree.

```sh
export BASELINE_JDK=/absolute/path/to/upstream/jdk
export CANDIDATE_JDK=/absolute/path/to/fork/jdk
export RESULTS_DIR=/absolute/path/to/results
export RENAISSANCE_JAR=/absolute/path/to/renaissance-gpl-0.16.1.jar
export JMH_CP='/absolute/path/to/jmh/dependencies/*'
export JMH_PROCESSOR_CP=/absolute/path/to/jmh-generator-annprocess-1.37.jar:/absolute/path/to/jmh-core-1.37.jar
```

Renaissance 0.16.1 has SHA-256
`46d23ad03c5fd3dbf4365a5d15ea5a6c7ec682061fa6775a09d39942d80b0bf3`.
JMH uses core and annotation processor 1.37, jopt-simple 5.0.4 and
commons-math3 3.6.1. The analyzers require Python 3 and SciPy; the Spring driver
also requires aiohttp. Run the following from the repository root.

## Object layout, hashing and startup

```sh
bash doc/benchmarks/four-byte-headers/run.sh footprint
bash doc/benchmarks/four-byte-headers/run.sh memory
bash doc/benchmarks/four-byte-headers/run.sh jmh
bash doc/benchmarks/four-byte-headers/run.sh renaissance
bash doc/benchmarks/four-byte-headers/run.sh startup
python3 doc/benchmarks/four-byte-headers/summarize.py "$RESULTS_DIR"
```

The matrix covers Serial, G1 and ZGC. `baseline8` is upstream's eight-byte
default; `four4` selects the candidate's four-byte layout. The historical
`default8` label selects the candidate's eight-byte opt-out explicitly;
`legacy12` is a compatibility control. Improvement percentages compare eight
with four bytes. Timed JVMs use four active processors and a fixed 512 MiB heap;
`BENCH_PROCESSORS` overrides the processor count for the first four modes.

The footprint probe sums `Instrumentation.getObjectSize` for one million
one-int objects and their retaining array, checking payload and hash retention
after movement. Auxiliary verification arrays and dead pressure allocations
are excluded. Hash preservation can remove the initial size saving. This is an
exact shallow graph size, not application heap occupancy or RSS.

JMH uses three independent forks, five one-second warmup iterations and five
one-second measured iterations. The GC profiler reports allocated bytes per
operation. Cases include first and stored identity hashes, prepopulated
`IdentityHashMap` lookup and map churn across young collections.

Renaissance timing uses three independent JVMs per configuration and ten
operations per workload, discarding the first five. Memory runs use a separate
plugin that collects before each operation and measures heap occupancy,
non-heap use and Linux RSS. Exclude plugin runs from timing comparisons.
Startup interleaves 50 fresh JVMs per configuration after five untimed rounds,
using a 32 MiB heap and each layout's matching CDS archive. It measures
`java -version` startup, not application readiness.

The `repeat-*.sh` scripts provide balanced-order hashing and application
rechecks and independent occupancy diagnostics. Run them sequentially after
the main suite; exclude diagnostics and profiles from primary timing results.

## Database and Spring applications

```sh
DATABASE_FORKS=12 DATABASE_REPEATS=16 \
  bash doc/benchmarks/four-byte-headers/database.sh timing
DATABASE_FORKS=12 bash doc/benchmarks/four-byte-headers/database.sh memory
```

`db-shootout` uses Renaissance's ordinary 500,000-entry configuration with
MapDB, Chronicle Map and H2 MVStore. Timing uses twelve JVMs per layout and
sixteen operations, discarding the first eight. Memory uses twelve separate
JVMs per layout and three operations. Its upstream validator is a dummy;
successful completion does not establish database result correctness.

Build Spring Petclinic once at commit
`67643c4137eb75bfeb177b427f8459c471bdcbd8` and use the same jar with both images:

```sh
git clone https://github.com/spring-projects/spring-petclinic.git
git -C spring-petclinic checkout 67643c4137eb75bfeb177b427f8459c471bdcbd8
cd spring-petclinic
mvn -DskipTests -Dcheckstyle.skip -Dspring-javaformat.skip package
```

From the JDK repository root:

```sh
python3 doc/benchmarks/four-byte-headers/petclinic-load.py \
  "$BASELINE_JDK" "$CANDIDATE_JDK" \
  /absolute/path/to/spring-petclinic/target/spring-petclinic-3.5.0-SNAPSHOT.jar \
  "$RESULTS_DIR"
python3 doc/benchmarks/four-byte-headers/summarize-typical.py "$RESULTS_DIR" \
  --database-forks 12 --database-repeats 16 --memory-forks 12
```

Both applications use a 512 MiB heap, four active processors and their normal
ergonomic collector. No four-byte enabling option is passed. Layout order
alternates within pairs. Petclinic uses Boot 3.5.0, embedded H2 and 10,000 owners;
eight HTTP workers exercise searches, owner details and veterinarians. Each
response must return status 200 and expected page text. Six JVMs per layout use
30 seconds of warmup and 60 seconds of measured load, followed by a full GC
and heap measurement. This local workload does not model a remote database.

The analyzer rejects incomplete matrices, HTTP errors and incorrect layouts.
Values are arithmetic fork means; changes and exploratory 95% Welch intervals
use log ratios without multiplicity adjustment. RSS includes collector slack,
buffers and metadata, so object-size savings do not imply equal RSS savings.
Use `--control` for the candidate's eight-byte opt-out. Profile runs belong in
a separate results directory and are excluded from timing comparisons.

## Recorded measurements

[Application report and raw samples](https://github.com/re-thc/openjdk-jdk27u/tree/d0d59ba6cd3de549ffc429d3bcee6a24d0f6464c/doc/benchmarks/four-byte-headers/results)
are retained at a fixed revision. They were measured before the desktop-free
upstream sync; their image fingerprints and workload settings identify the
builds tested. They are historical evidence, not measurements of later images.

For the locking/hash race, compile `HashAndLock.java` with JCStress 0.16 and its
annotation processor, then run `fourbyte.HashAndLock` under Serial, G1 and ZGC.
Dependencies are JNA and JNA platform 5.8.0 and jopt-simple 4.6. The actors race
identity hashing with synchronized updates while allocating garbage; the
arbiter rejects changed hashes and lost field updates.
