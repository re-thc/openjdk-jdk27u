# Direct baseline: fresh-executor validation of the allocation correction

The subsequent [whole-path budget and worker-preparation study](direct-baseline-budget.md)
records the measured request/install/execution gap, the isolated structural
correction and its adverse application results.

The clean `89a916a84d61d78fc2c454817797f5cefc9495d5` compiler now builds and
passes all five direct-baseline tests on release and fastdebug. A bounded
comparison favors it over the clean `92c064da3d25f2e96d234e3b2964ef4c9a345f7e`
enabled control. Startup still loses to baseline off, so there is no accepted
application win or default-enablement claim. No compiler coverage, C1/C2
promotion policy, threshold or production source changes were made in this
validation work.

## Same-caller results

There are three fresh startup and three fresh warm processes per mode: 18
timed processes in total, all exiting zero. Each phase uses serial orders
off/92c/89a, 89a/off/92c, 92c/89a/off. Every fork, including the slow first off
startup and the adverse warm CPU observations, is retained in
[caller samples](direct-baseline-data/recovery-caller-times.tsv).

| Median metric | Off | 92c enabled | 89a enabled |
|---|---:|---:|---:|
| Startup process wall, ms | 435.816 | 506.840 | 464.042 |
| Startup process CPU, ms | 931.944 | 1080.629 | 986.582 |
| Original warm task, ms | 4.646 | 4.520 | 4.241 |
| Whole warm-process wall, s | 14.027 | 14.339 | 13.988 |
| Whole warm-process CPU, s | 24.694 | 25.262 | 24.247 |

Against 92c, 89a startup wall/CPU improve 8.4%/8.7%, warm-task median improves
6.2%, and whole warm-process CPU improves 4.0%. Against off, startup wall/CPU
remain 6.5%/5.9% worse. The warm-task median is 8.7% better and whole warm CPU
1.8% lower in this cohort. These are three-fork observations, not precise
steady-state estimates. For example, the 89a warm CPU forks are
25.483/24.247/24.211 seconds, while 92c includes a 23.040-second fork.
The earlier mixed/adverse comparisons remain valid historical evidence.

The unchanged public `CompilerWorkload` compiles the same four in-memory
sources. Warm uses its original 1,500-task warmup, compilation-time stability
pause and 100 measured tasks. There is no method forcing, preloading or
WhiteBox in timing. All builds and correctness tests completed before timing.
Tracing, PrintCompilation and LogCompilation are absent from timed commands.
Shared direct service, threshold 32, G1/128 MiB heap, CPUs 0-3, four active
processors, three ordinary compiler threads and ordinary thresholds/masks are
identical. CDS is off. See
[effective flags](direct-baseline-data/recovery-effective-flags.tsv) and
[summary](direct-baseline-data/recovery-caller-summary.tsv).

## Clean builds and semantic checks

Normal git fetched and verified the exact preserved 89a commit. The checkout
and workspace ancestors contain no `AGENTS.md` or `.agents/skills` instructions.
Seeded build outputs contain desktop modules and incompatible collectors;
source configure explicitly rejects their reuse. Fresh `direct-release` and
`direct-fastdebug` configurations therefore build the fork's reduced product
with GCC 16.2, mold and the normal x86-64-v3 baseline. Javac server use is
disabled. Four build jobs fit the actual four-CPU quota and 16 GiB limit.

The only build prerequisites are the reviewed synchronous logging changes
`d136e0d5ea56e42257fddcf032a7a391f7a3789f` and
`86ff12482a7864c1fab9cc7adc49f75e30c5c7cd`, cherry-picked locally as
`31e40beba2f` and `fca5d6f7f25`. No CI workflow change was imported. They are
separate from the compiler correction and contribute no compiler-performance
claim. Fastdebug also uses only the previously recorded per-`handshake.cpp`
GCC warning workaround, `stringop-overflow nonnull`.

Both fresh builds compile all 1,115 HotSpot objects and produce complete JDK
images. Release takes 734 seconds; fastdebug 947 seconds. All five fixtures
pass on both images: DirectBaselineTest, DirectBaselineInstanceTest,
DirectBaselinePolicyTest, DirectBaselineProfileTest and
DirectBaselineStaleInstallTest. The first release harness passed four and
skipped stale-install because my global ActiveProcessorCount option violated
its `vm.flagless` requirement. Removing that harness option and using CPU
affinity instead lets the omitted test pass in its own retained report. The
fastdebug run passes all five without skips. The fixtures cover both worker
owners, Serial/G1, precise reference liveness, receiver/IC/null contracts,
interpreted/C1/C2/native calls, once-only exception side effects, safe whole-
method fallback and ordinary replacement.

Three existing pinned-base smoke tests also pass on release and fastdebug:
FourByteHeaderHashState, TestFourByteHeaderHashExpansion and
compiler/whitebox/DeoptimizeAllTest. They exercise ordinary compilation,
deoptimization and hash/GC behavior with the feature off. They do not claim
integration with another base; no merge/rebase was attempted.
See [baseline checks](direct-baseline-data/recovery-tests.tsv) and
[base smoke](direct-baseline-data/recovery-base-smoke.tsv).

The 92c control reuses matched release objects and rebuilds the two changed
production files in 22 seconds; all five baseline tests pass there too.
An initial image check stops before any timing because independently linked
`lib/modules` containers differ. Extraction compares all 19,917 resources:
only generated SystemModules.moduleHashes(), the jdk.jlink module hash in
java.base/module-info, and jlink's default trace resource differ. To remove
this packaging difference, benchmark images use the same freshly built common
JDK content and the respective clean libjvm. All 211 regular runtime files
match except lib/server/libjvm.so. Both original complete control images and
the stopped check remain preserved. This adds no benchmark repetitions.
See [image identities](direct-baseline-data/recovery-image-manifest.tsv).

## Actual use and optimizer arrivals

Six separate diagnostic processes use tracing, PrintCompilation and XML
logging: one startup and one warm process per mode, all exiting zero. Their
elapsed times are not benchmark results. The held caller uses the same
original javac input classpath through `env.class.path`. A parent reader gets
entry counts from its own held child, using VMStructs and an entry offset
derived from the exact object's debug information. Every direct installation
in all four enabled captures has a pre-attach count; there are no read failures.
Early entries are capped by both first ordinary admission and the total-call
512 end of the inherited shared-worker hold. Counts are diagnostic and may be
approximate under contention; they are not interpreter CPU saved.

| Startup diagnostic | 92c | 89a |
|---|---:|---:|
| Direct installations / used | 847 / 777 | 842 / 775 |
| Javac installations | 206 | 205 |
| Direct body entries / early entries | 220865 / 163282 | 212679 / 163435 |
| Javac entries / early entries | 43688 / 28799 | 43242 / 28495 |
| Worker refusals / preflights | 1416 / 325 | 1415 / 325 |
| Code-cache blob bytes | 587808 | 583832 |
| Javac C1 / C2 installations | 202 / 18 | 198 / 16 |
| First javac C2 installation, VM uptime ms | 372 | 361 |

Off's first javac C2 installation is 332 ms in its startup capture. In the
warm captures, first javac C2 arrives at 273/350/385 ms for off/92c/89a.
The correction does not consistently advance optimizer arrival. Full warm
captures have 1241/1239 direct installations, 214807/226887 javac entries and
150405/151363 early javac entries for 92c/89a. Actual-use coverage is retained,
with ordinary scheduling/profile history still varying between processes.
All 822 common startup methods and 1,187 common warm methods have identical
direct blob size and instruction/stub offsets between versions. This supports
unchanged emission shape, not byte-for-byte machine-code equivalence.

Ordinary compilation continues during the diagnostic warm window. Successful
task starts appearing between its first and last sample number 6 C1/34 C2
off, 7 C1/28 C2 plus 24 direct at 92c, and 7 C1/36 C2 plus 24 direct at 89a.
Each enabled window also starts 18 direct refusals, largely in output helpers.
PrintCompilation is printed at task start; these are not installation times.
This window therefore does not establish complete optimization quiescence or
long-run warmed neutrality. See
[diagnostics](direct-baseline-data/recovery-diagnostics.tsv) and
[matched sizes](direct-baseline-data/recovery-code-sizes.tsv).

## What the correction establishes and what remains

Source review confirms immutable published prepass states: every instruction
copies before mutation and merges/emission only read them. Borrowed code
storage follows the existing C1 ownership contract, with fresh per-task
relocations/scopes/maps and broker cleanup. The five skipped exception getters
have only C2 users; ordinary and initialization environments retain preload.
GC barriers, maps, traps, call/exception handling, initialization/linkage checks
and stale-install protection remain intact. No C1 IR pipeline or new frontend
framework was introduced.

The earlier low-instrumentation compiler-service result remains separate from
this clean application comparison. New heavily logged task budgets fall from
85.586 to 79.623 ms in the startup pair, but increase from 139.648 to 153.378 ms
in the warm pair. Both are retained. They include observer costs and cannot
be called pure compiler CPU or used to explain the whole untraced CPU delta.
Ordinary compiler histories also differ, so the application median difference
cannot be credited one-for-one to removed allocations.

Amortization remains the concrete cost problem. In 89a startup, 441 installs
serve fewer than 128 entries each. They serve 22,702 entries (10.7% of actual
direct entries) while consuming 24.216 ms (53.1%) of the logged successful-
task budget. There are still 1,415 worker refusals. Useful direct execution is
real, but these installations/refusals and normal CI/metadata costs remain
substantial. Reducing those costs is the next useful compiler task; these data
do not justify more coverage, delayed C2, default enablement, or another broad
timing campaign. See [retained task costs](direct-baseline-data/recovery-task-cost.tsv).

All owned commands have completed and are reaped. The child-reaping wrapper
adopts/reaps 58 release-build, 58 debug-build and 19 control-build children.
The 17 PID1 zombies left by initial normal git/configure commands remain
unchanged; the build/test/measurement work adds no persistent zombies. No
process, memory or disk blocker remains. The prior executor was not accessed
or modified. Raw logs, images, scripts and ledgers remain local under
`/workspace/direct-baseline-recovery/`, with no Library upload. No push, PR,
default change, merge or CI dispatch occurred.
