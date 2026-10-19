# Spill sharing experiment: design fixed before timings

Candidate starting revision: 18963220078b0392b91f88acbf3fc6891155b3ef.
Historical stock baseline: 815ff4dc327fe17f2433c7d115a5a503af10f3c4.
Fork master checked: 416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda.

First require a built candidate, native guard checks, positive rewrite activation,
complete semantic output and exception checks, GC/deoptimization safety, and
final allocated code accounting. An implementation repair starts a separately
identified experiment. Any profitable candidate must then be integrated and
qualified against its source-matched current-master baseline before a draft PR.

Use complete release images built with the same GCC14 compiler, configuration,
version and source-date options. Record source commits/patches and binary hashes.
Application source and inputs must be identical between A (stock) and B (candidate).
Use public jzstd scripts/documentation where applicable. Include source,
repetitive, dense and long-offset frames, spill-sensitive arithmetic and an
unaffected control. Validate every full decoded output before timings and cover
malformed-input failure behavior. No JVM-favoring application changes.

For each timing workload/configuration, run 12 independent paired JVM forks in
alternating order AB, BA, AB, BA, continuing for 24 total forks. Use identical
options, heap sizes, CPU affinity and workload counts; do not overlap builds or
diagnostic JVMs with timings. Use the workload's ordinary warmup/measurement
conventions where available, with at least 3 seconds of steady-state warmup and
5 seconds measured per fork. Record per-iteration values and process exit status.
Preserve all observations, including unfavorable ones. Diagnose invalid controls
before interpreting an experiment; do not drop noisy pairs or repeatedly sample
until favorable. A revised design is recorded separately with its reason.

The timing matrix is fixed as five direct fixed-frame decoder cells (source,
repetitive, dense, long-offset, random), source allocating decode, the unchanged
kernel4 pressure fixture, and a 1 MiB array-copy control. The external FrameBench
adapter calls the same public decoder APIs as the public CodecProbe, and verifies
full output before and after a trial. JMH 1.37 uses 3 x 1-second warmup iterations
and 5 x 1-second measurement iterations per independent JVM fork. The pressure
fixture uses its original dontinline/excluded-reference directives in both arms.

Per-fork throughput is the median of its five JMH measurement iterations.
Primary estimate: median of within-pair candidate/baseline throughput ratios.
Also report per-arm medians and all pairs, and bootstrap 95% intervals over paired
ratios, resampling whole pairs (20,000 resamples, fixed seed 20261019). Inspect order groups separately
for drift. Report allocation and GC metrics when relevant. Assess startup wall
time and compiler CPU/time using separate matched independent JVM runs, keeping
diagnostics out of the primary throughput runs. A useful claim requires benefit
that survives controls/uncertainty, acceptable correctness and regression results,
and final allocated code showing the work has been removed without equivalent
replacement transport. Smaller assembly alone does not qualify the idea.
