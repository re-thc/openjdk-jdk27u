This qualification uses repository compiler tests and a pressure proxy. It does
not fetch a codec or reproduce historical decoder throughput.

The workflow restores only immutable artifacts 12212432914, 12218827151 and
12214446423 from run 39291419273. The controller checks each original ZIP digest,
source/build metadata, actual JVM and launcher hashes, and matched release
compiler/profile fields before starting a JVM. No rebuild or product change is
part of this workflow.

The four existing fixtures run on candidate fastdebug and release. Passing JTRs
are required for all eight checks; jtreg skips cannot count as passes. The
fastdebug tests enforce real activation, including exercised debug-home/oop-map
controls. The in-tree native policy DLL is restored with each candidate image.

StandaloneColdCallProbe preserves kernel, testCold, testJoins and testHot method
bodies exactly from candidate TestColdCallSpillPlacement. Its helpers implement
the ordinary action=0 behavior; there are no explicit GC/deoptimization/throw
requests in this probe. WhiteBox gathers 64 interpreted reference results and
installs normal, non-OSR C2 code. Target methods remain out of line in the sampler;
kernel is forced inline and returning helpers remain out of line. The sampled
operation is a complete 256-iteration cold/hot kernel or 1024-iteration join
kernel. Rates are ns/operation, not decoder MB/s.

Six short untimed fastdebug invocations check off/on activation for the same
three cases. Cold and joins must activate; joins must expose three packed load
roots, pressure-down Phi propagation and kept high-pressure boundaries. Hot and
off runs must not activate. Trace and allocator verification flags are confined
to these gates and the existing fixtures.

Timing uses 54 distinct JVM forks: three cases, three variants, six blocks. Every
case uses all six variant permutations, and case order rotates across blocks.
Each fork has six seconds of warmup and five 700ms samples. Every input seed has
an interpreted/C2 result check, each sample has a checked checksum, and XML plus
WhiteBox must prove normal target C2 residency throughout measurement. There are
no retry or replacement forks. All six paired results, including every loss,
remain in the summary. Same-image on/off is primary; baseline comparisons are
secondary. Target compile elapsed time, XML nmsize and regalloc rounds are retained
for analysis; they do not establish exact hot stack-traffic counts.

The approval receipt binds this runner and frozen plan. The job cap is 50
minutes from runner allocation; the controller stops at 43 minutes to reserve
time for evidence upload. Commands obey the remaining deadline and stop on a
failed gate. Each jtreg image has a ten-minute timeout; a timing fork has a
30-second timeout. Existing failure runs and their evidence remain unchanged.

Preparation review: the extracted method bodies were compared byte for byte,
the Java sources compiled with the available JDK27, the Python source parsed,
and the plan validator verified all artifact identities and six permutations.
No local performance or activation workload was executed during preparation.
