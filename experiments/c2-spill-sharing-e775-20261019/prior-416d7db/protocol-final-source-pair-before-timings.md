# Final source-pair selection before A/B measurements

No paired throughput, startup or compiler-cost measurements have been collected.
The historical pair (stock 815ff4d and v5 with test repairs 32bcee3) has completed
native correctness, allocator activation, full-output/failure, linked GC/frame,
and complete final-code checks. Preserve all historical results, including the
failed original activation fixture and the two cases with worse transport.

Static allocation savings survive on the source and dense decoder captures;
repetitive and long-offset captures worsen transport. This is sufficient reason
to test the idea further, and supplies no throughput qualification or speed claim.

Integrate only the three compiler files, the native guard test and the five Java
test/fixture files with current fork master. Exclude the old review/controllers,
deadline helpers and historical documentation from a proposed product PR. Rebuild
and repeat correctness/activation/code gates on the integrated source pair.

Run the already fixed nine-cell, 12-pair AB/BA timing design only on the final
current-master baseline and its integrated candidate. Retain the same inputs,
application classes, tools, JVM options, fork counts, median estimators, bootstrap
intervals and controls. This avoids treating historical-base evidence as current
fork qualification and avoids an obsolete timing campaign when no v5 throughput
result exists to reproduce. Record all final revisions and image hashes.

For allocation/GC accounting, run a separate secondary JMH batch on direct source
decode, allocating source decode, and the positive trigger: two paired forks per
cell in AB then BA order, with the same warmup/measurement settings and `-prof gc`.
Retain allocation bytes per operation and GC counts/time; profiler throughput is
not the primary performance estimate. This adds no profiling to the nine-cell,
12-pair unprofiled throughput matrix.
