Original ~204 ns / ~248 ns timing-fork evidence

Compilation logs from these exact timing forks do not exist: their JVMs
were run without LogCompilation, PrintCompilation or PrintInlining. Their
compiler state and inlining decisions cannot be recovered after those JVMs
exited. No separate diagnostic run is presented as a log from these forks.
This package contains the original commands, JMH results and console logs
that actually survive. No new benchmark run was made to populate it.

These are all five original interleaved A/B pairs for GZIPLifecycle.gzipDefault,
size=64, content=repeated, from the unprofiled tiny-stable suite. Setup,
allocation, complete payload/EOF processing, trailer validation and close
are timed. Scores normalize 16 streams per invocation to one stream.
Each fork used SerialGC, a 256-MiB heap, three 1-second warmup iterations
and three 1-second measurement iterations.

Launch-order correction: the preserved commands show all five default-buffer
pairs ran A then B. They were interleaved AB, not order-balanced AB/BA.
Other benchmark cases ran between these pairs. The earlier report's claim
that per-case order alternated was incorrect: reversing the case list while
using the case index in the order formula cancelled the intended alternation.

A is original PR6, f2a1e1a17a1be172883b5774f86024ac5220c87d.
B is d7150d6f56e08c441f2efbb67464a9388136caf2, the identical runtime source
later handed back as ac242a073e42cbb6bc6a55091f922add36ae674e. That handback
added only the benchmark and report. Do not relabel A/B here as the later
ac242a073e42 versus 960ac6ffb574 comparison.

Reported aggregation: median of each fork's three raw measurement iteration
times, then median of the five fork medians in each variant:
  A = 204.24059967322904 ns/stream
  B = 248.17671768179298 ns/stream
The original ~204 ns aggregate is supplied by tiny-stable-4-...-A; the
~248 ns aggregate by tiny-stable-2-...-B. They are not from the same pair.
All five pairs are included so the fast/slow populations remain visible.

commands.jsonl preserves the ten selected original launcher records and
their recorded timestamps in execution order, including original absolute
host paths. It is not a newly generated command transcript. JMH's internal
spawned-JVM OS command/PID was not separately recorded.

results/*.json and console/*.log are byte-for-byte copies of the originals.
The console files contain JMH warmup/measurement output, not compiler logs.
The JSON score field is JMH's arithmetic mean; forks.csv and manifest.json
also give the median statistic used in the qualification report.

manifest.json records revisions, machine/toolchain, benchmark hashes, raw
iteration values, summary medians and a null compilation_log for every
fork. The unchanged benchmark source is at
test/micro/org/openjdk/bench/java/util/zip/GZIPLifecycle.java in this branch.
SHA256SUMS covers every other file in this evidence directory.

The separately instrumented tiny-long and later diagnostic runs are excluded:
they cannot establish which code was compiled in these original timing JVMs.
