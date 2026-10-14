Current-target comparison plan, fixed before collecting quiet target timings.

Baseline: 02324e6bd026411407983df06284cd79460c33f6, GCC16 release cloud-gcc16.
Three normal JDK images, identical 39 native files; A changes two Java sources,
B changes BindingSpecializer. No patch module, instrumentation, tests or builds
in timed windows. Source refs, deltas, native/modules hashes and exact commands
are retained. CPU0, native access, heap, CDS and tier flags match within each pair.

Startup: 12 randomized blocks for base/control/A/B with empty, framework and
first bound int downcall; interpreter, C1 ceilings 1/3, default tiered and C2
policy. Run CDS off and default separately. Main/first-link/first-call/early
batch elapsed time and whole-process elapsed + child user/system CPU retained.
Control launches the unchanged base image again. Framework creates linker,
loads library, makes descriptor and resolves symbol without a downcall.

Retained calls: 12 blocks, static-final and mutable-field bound/unbound handles,
same native int identity, -Xint/C1/default tiered/C2. 30 warm batches and 10
timed batches. Explicit per-tier counts keep interpreted forks bounded and
compiled sample durations adequate: int=10000,c1=100000,c13=100000,
tiered=100000,c2=1000000. Output is per-fork median elapsed and thread CPU per
call, verified outside timed batches. Compiler diagnostics are separate and
must establish actual compiled roots after warmup. Existing JMH benchmarks
follow only for a surviving candidate; prior overlapping JMH data are rejected.

Forks are independent units. Report medians and paired geometric base/candidate
ratios with deterministic 95% bootstrap intervals; never treat loop samples as
independent forks. Publish all raw records and controls, without dropping runs.
An interval alone is not a hidden-regression proof. Meaningful baseline-control
drift or wide intervals block qualification. A retained-call loss above 5%
with a clean control rejects a candidate; an inconclusive interval requires
further investigation rather than a gain/non-regression claim. A startup claim
requires an end-to-end elapsed improvement as well as construction attribution
and compatible process-CPU evidence. Saving a hidden class alone is insufficient.

All six helper shapes and fallback/capture/variadic/upcall/scope safety cases
must pass target tests. Arranger selection across x64/AArch64 is not native
AArch64 execution. Fastdebug, broader native tests, warmed JMH and actual
AArch64 execution remain required for a shipping/PR qualification. The owner approved one remote x86_64 release diagnostic job. Broader remote
matrices and merges are not authorized.
