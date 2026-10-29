Eight-fork allocation/lock-elimination mechanism probe

Exactly eight measured GZIPLifecycle.gzipDefault forks, size=64,
content=repeated, on the native Apple M6 Mac. Complete allocation/setup,
payload/EOF reads, trailer handling and close remain inside timing.
A = f2a1e1a17a1be172883b5774f86024ac5220c87d (original PR6).
B = ac242a073e42cbb6bc6a55091f922add36ae674e (prior handback;
runtime source identical to d7150d6f56e08c441f2efbb67464a9388136caf2).
Existing verified release images and identical benchmark bytecode were used.

The prescribed order was executed literally:
  0 normal A,  1 normal B
  2 control B, 3 control A
  4 normal B,  5 normal A
  6 control A, 7 control B
Normal keeps default allocation/lock elimination. Control adds exactly
-XX:-EliminateAllocations -XX:-EliminateLocks. DoEscapeAnalysis remains at
its default. All forks share SerialGC, Xms/Xmx=256m, one benchmark thread,
three 1-second warmups and three 1-second measurements. LogCompilation
is enabled in every measured JVM, using a unique LogFile. There are no
extra diagnostic, bulk, warmup-only or replacement benchmark forks.

Median of the three measurement iteration times in each fork, ns/stream:
sequence policy   variant    PR6 A      handback B
0,1      normal   AB         241.993       240.646
2,3      control  BA         248.864       250.816
4,5      normal   BA         251.752       246.032
6,7      control  AB         250.853       253.942

Descriptive medians of the two fork medians per policy/variant:
normal:  A 246.873, B 243.339 ns, B-A -3.534 ns (-1.43%).
control: A 249.859, B 252.379 ns, B-A +2.520 ns (+1.01%).
With two observations per cell these medians are midpoints, not evidence
of a stable population. Raw iteration data and every individual fork are
retained. Do not pool normal and control or compare these eight forks'
absolute times with the older unlogged forks as though they were paired.

The original ~204 ns PR6 population was not reproduced. All eight exact-fork
logs record readHeader inlining into the benchmark gzip caller. All show
the C2 inflate intrinsic. No eliminate_allocation or eliminate_lock events
were recorded in any of the eight XML logs, including the normal policy.
That is a statement about recorded events, not proof that every relevant
optimization is observable through those tags. The sampled normal PR6
forks stayed in the slower population, so this probe does not confirm or
disprove the proposed explanation of the earlier fast population.
The two control flags changed together; their individual effects cannot
be separated here. Logging can itself perturb compilation and timing.

Unlike the older timing-only evidence, these are compilation logs from
the very same JVMs that produced the reported timings. forks.json maps
each result and console file to its XML log and actual PID and retains
the VM arguments read back from that log. These include JMH's usual
blackhole/compiler-hints flags and, for controls, the requested two flags.
No forced method-inlining setting was added.

commands.jsonl: the eight recorded launcher invocations in execution order.
plan.json: requested policy/order and common configuration, saved before run.
results/: unchanged original JMH JSON files; console/: unchanged stdout logs.
compilation/*.xml.gz: losslessly compressed original XML logs, one per fork.
manifest.json: PID/path mapping and compressed/uncompressed log SHA-256s.
forks.json: results, raw iterations, actual fork arguments and PID mapping.
per-fork.csv, pairs.json, summary.json: descriptive timing summaries.
compiler-observations.json: decoded inlining/elimination/intrinsic records.
analyze.py: static analysis, runnable on these gzip files without any JVM run.
run.py.txt: the launcher source as used; preserved for provenance.
SHA256SUMS covers every other file in this directory.

For an XML log, for example:
  gzip -dc compilation/00-normal-A.xml.gz > /tmp/00-normal-A.xml
Or run python3 analyze.py in this directory to recheck the eight records.
No new JVM is started by analyze.py.

This limited experiment does not add new bulk observations. The original
bulk results keep their qualification about fixed per-case A/B order.
One Mac, eight logged forks, two per policy/variant, no fast PR6 sample:
the allocation/lock-elimination explanation remains unresolved.
