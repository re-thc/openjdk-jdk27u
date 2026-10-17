# Bounded public C1 Adler comparison

This is an executable **proposal**, not timing approval. `study.py` defaults to
read-only image/source validation and plan creation. Execution requires a separate
receipt bound to that exact manifest; the generated template has `approved:false`.
No script publishes results, dispatches CI or starts a second experiment. It
resolves whether the candidate public C1 path demonstrates a baseline benefit
at 4096 bytes while keeping the declared small, boundary and long costs bounded.

## Decision and fixed scope

Compare clean **release** images from baseline
`3f71d03f3297f94e8c2cc34160262a880be337fc` and candidate
`5944fe1cb7fc072a8a1b8207383d2f009f785338`. These are the already qualified source
boundaries, not a claim that an arbitrary newer image has the same behavior.
The candidate production delta must be only the C1 GraphBuilder change. Image
`release` SOURCE must identify the clean selected revision. Java/javac/modules
and native-library hashes bind the actual supplied full images. Preparation
records `-Xinternalversion` and rejects fastdebug/slowdebug images. There is no
prebuilt-binary transfer requirement; ordinary source builds can supply them.

| Arm | Image | Adler intrinsics | Direct-path interpretation |
|---|---|---|---|
| A | baseline | enabled | C1 intrinsic leaf |
| B | candidate | enabled | default native invocation; interpreter hop inferred |
| C | candidate | disabled | true JNI selected by flag/source |
| C-prime (`CP`) | baseline | disabled | true-JNI image sanity control |

Use existing `ChecksumPaths.adlerDirect` at **64, 4095, 4096, 4097, 65536 and
1048576 bytes**, plus `adlerHeap` at **4096 bytes** as an unaffected-path guard.
Each public operation includes reset, buffer positioning where applicable,
update and getValue. Data uses the benchmark's fixed seed and offset 7.
The original benchmark is shared by both images; its missing 4095/4097 parameters
are added. No method-handle or synthetic private-call performance benchmark is
needed for this decision. C2, GC Cartesian products and additional sizes are
outside this finite study; do not attribute C2 steady state to a C1 guard.

All forks use G1, explicit tiered compilation capped at C1 level 1, Xbatch,
256 MiB heap, Xshare off, two active processors and one JMH thread. There is no
claimed macOS affinity pin, allocator/ISA tuning or post hoc best-core selection.
Injected Java/compiler/native settings are rejected. Only the Adler flag changes
between enabled/disabled arms; ZIP/CRC flags are not silently disabled.

## Exact budget and schedule

The comparison has a **900-second total supervised allocation**, including:

| Phase | Cap |
|---|---:|
| Pinned dependencies, benchmark compilation, untimed public checks |180 s|
| Separate exact-JMH diagnostic forks and compiler-log checks |180 s|
| Two fixed measurement sessions |480 s|
| Verification, scoring and retained results |60 s|

The diagnostic phase has one fork per arm/workload: 28 forks. Its JMH results
are kept as diagnostics and never enter the performance estimator. It uses the
same source/classes/images/GC/tier/settings and fork workload, with only compiler
logging added. It verifies successful C1 parses reachable from the exact
benchmark and the expected intrinsic/decline decision. Unknown/mixed/C2 routes
stop the study before measurement. This is compiler-selection evidence, not a
direct interpreter-entry breakpoint; it does not reuse old LLDB register/length
conditions or attribute other callers' captures to these forks.

Measurement uses three fresh forks per arm/workload/session, two 200 ms warmup
iterations and three 200 ms measurement iterations: **168 forks**, with 168 s
of nominal fork work (67.2 s warmup, 100.8 s measurement). Startup, JIT, framework
and verification overhead must fit the caps too; completion is not promised.
JMH controllers group the six direct sizes and the one heap size. Session 1
orders A, B, C, CP, direct then heap. Session 2 reverses the entire job sequence.
Every fork/iteration is retained. There is no adaptive duration, dropped row,
extra fork, retry, timed code capture or automatic follow-up.

Use already available clean full release images when applicable. If fresh full
JDK builds are needed, normal source preparation is separately capped at 30 min
per image: at most **75 min including the 15 min comparison**, excluding queue
time. That larger optional preparation allocation needs its own authorization;
it is not hidden inside a 15-minute request. Enforce each preparation cap with
the normal build job timeout; the comparison script does not build full JDKs.
Build timeout stops without timing.
No new builds or Mac runs are requested by preparing this proposal.

## Prospective numeric gates

Each fork contributes the arithmetic mean of its three iterations. Iterations
are not independent samples. For each comparison, take log fork means, compute
B-minus-A (or C-minus-CP) separately in each session, then average the two session
effects with equal weight. The variance is the sum of four within-session log
sample variances divided by 12. Welch-Satterthwaite degrees of freedom use those
four components and two degrees of freedom each. Exponentiate the resulting
interval. Zero estimated between-fork variance is reported as unestimable, not
as a zero-width confidence interval. The model assumes independent JVM forks within each session; reversal
and control checks do not prove hardware independence or remove causal bias.

There are **14 planned intervals**: seven B/A and seven C/CP. Use a two-sided
95% family level with Bonferroni alpha `0.05/14`, using the numerical Student-t
quantile at the computed degrees of freedom. Benefit reuses the 4096-byte B/A
interval; it does not add a selected best-size comparison. No undefined pooled
fork-noise estimate, JMH scoreError substitution or old-data rescoring is used.

- B/A upper bounds must stay within **+5%** for direct 64, **+3%** for the three
  4096 neighbors, **+1%** for 64 KiB/1 MiB, and **+2%** for heap 4096. Each session's
  point ratio must also satisfy its limit. These are declared engineering
  non-regression margins, not proof of zero regression.
- Every C/CP interval and each session point must lie inside **±3%** for small,
  boundary and heap cases, **±1%** for the two long cases. Otherwise the comparison
  is unresolved due to its image/control precision.
- A baseline-benefit result additionally requires the **4096-byte B/A upper
  bound <=0.97** and both session point ratios below 1.
- B/C is descriptive only. **The guard need not beat true JNI.** Passing bounded
  non-regression without the defined baseline benefit is reported separately;
  it is not an automatic optimization or shipping decision.

The execution CLI returns 0 only for the scoped baseline-benefit result, 2 for
other valid decisions, and a nonzero error for invalid execution. Plan creation
returns 0 without authorizing measurement. A bound proving cost beyond its declared margin yields HOLD. An interval too
wide yields UNRESOLVED, never equivalence. Route/provenance/budget/data failures
yield INVALID. No result sets `shipping_qualified=true`. Other qualification protocols, their gates and their historical failures are
not changed or cleared by this proposal.

## Normal source and dependency setup

Use an ordinary repository containing both selected revisions; fetch those
source refs normally if necessary. For fresh images, create clean worktrees at
those exact commits and use the normal release build, for example in each tree:

```sh
bash configure --with-conf-name=adler-release --with-debug-level=release \
  --with-boot-jdk="$BOOT_JDK" --with-jobs="$JOBS"
make CONF=adler-release JOBS="$JOBS" images
```

Preserve source/build logs and use each `build/adler-release/images/jdk` locally.
No artifact upload, VM swapping, manual JMH transfer or cached-library handoff
is required. The executable's preparation downloads JMH 1.37, its processor,
jopt-simple 5.0.4 and commons-math3 3.6.1 from Maven Central, checks the committed
SHA-256 pins, and compiles the single shared benchmark plus untimed checks using
the baseline image's javac. The four jars are not vendored or installed globally.

From this directory, preparation of a fresh plan is non-executing:

```sh
python3 study.py --out "$FRESH_PLAN" --checkout "$SOURCE_REPOSITORY" \
  --baseline "$BASELINE_RELEASE_JDK" --candidate "$CANDIDATE_RELEASE_JDK"
python3 -m unittest -v test_study
```

Inspect its manifest and budget before any execution decision. **Only after
separate explicit approval** supplies the matching genuine receipt:

```sh
python3 "$FRESH_PLAN/source/study.py" --out "$FRESH_PLAN" --execute --approval "$APPROVAL_RECEIPT"
```

The plan snapshots its source, including both Java compilation inputs; the
compiler uses those copies and verifies them by hash. The execution command
uses that recorded controller. The one-shot marker prevents reuse. The supervisor kills a process group once
on failure/timeout and performs only bounded reaping. It retains commands,
raw JSON, stdout, diagnostic logs, dependency/class/source/image identities,
route labels, failed/partial status and a first-analysis hash/byte snapshot.
It neither retries a failed resource nor uploads host data. Re-analysis checks
all consumed raw/diagnostic records and cannot promote a saved INVALID result.
OS/filesystem stalls are not given an invented hard real-time guarantee.
