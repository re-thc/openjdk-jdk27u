# Qualification proposal for c4be5c3

This is an executable, bounded proposal. No new JDK build, Java compilation,
benchmark, CI run or dependency installation was performed while preparing it.
Only the archived receipts were analyzed, hashed and copied. The Java harness
has been source-reviewed but has **not** been compiled or executed.
Offline Python tests validate the dry-run matrices, default optimization flags,
paired scheduling, protected execution gates and rejection of stale/late/OSR-only
C2 evidence. Run them with `python3 -m unittest discover -s doc/c2-vector-bounds-qualification -p test_tools.py`.

The correctness review is GO. Codec applicability and performance remain open.
The actual codec source lacks the fixture's explicit unsigned guard. Its signed
`literal + ll <= literals.length - 32` guard does not match the new rule's
unsigned `literal < literals.length - 15` condition. C2 might create another
matching condition; that needs a graph at the actual codec bytecode location.
Do not insert a Java guard, change codec tuning, or claim that destination or
match checks are redundant. The inductive cursor/overflow proof is separate work.

## Fixed identities and preserved evidence

| Item | Identity |
| --- | --- |
| JDK source base | `89885a6288e7aaabd01678a704a586272c0f96e3` |
| Shared GCC 16 prerequisite | `0c097b2e91d2a0b9cf32db95166650dbed35871e` |
| Candidate compiler/test change | `c4be5c3a666ff4e237133474ac830bbd1e09ad6c` |
| Codec | `re-thc/jzstd`, `6abf77e2f63b68cc9269d5823e206235ab254c04` |
| Native compiler | installed GCC 16.2.0; exact driver hashes, specs and native command files in audit |
| Harness | this Git revision; JMH 1.37; one class/JAR set shared by both VMs |

`audit.py` has already run against `/workspace/scratch/c2-vector-bounds`.
Its final output is `/workspace/scratch/c2-vector-bounds/qualification-evidence-final`:

- `audit.json`: source pins, release/debug VM hashes, complete exploded runtime
  module-tree digests, toolchain identities, flags actually recorded, normal C2
  graph assertions, and limitations.
- `manifest.json` and `text-receipts.tar.gz`: 67 archived text/class receipts,
  including original compiler source, commands, graphs, assembly, tests and
  pinned codec references. Symlinks are dereferenced into the archive.
- Codec `PROVENANCE.json` binds the downloaded WindowBuffer content to its
  GitHub commit/tree/blob. Its SHA-256 is
  `09db7bd9ca026c4631d9d02326c97210ba8bde38aab694f2821e3fdaefb750a6`.

The release module trees are identical. All common debug runtime files are
identical; candidate additionally has the jlink `default_jli_trace.txt` tool
resource. The audit records that difference explicitly. Both compiled regression
test classes are archived individually; graph assertions are checked directly.

Original files, native VMs, JDKs and jtreg directories remain untouched.
Do not rebuild into them, strip them, chmod hardlinks, overwrite receipts, or
relabel one side. New execution output must use new scratch directories.

The release comparison recompiles only `ifnode.cpp`, linking against identical
remaining object paths with the same native command. Both sides use the shared
GCC warning prerequisite. The archive identifies the resulting binaries exactly;
historical hashes/source identities of every shared native object are unavailable.
It is an incremental component comparison, not proof of two independent clean
JDK builds. The full candidate fastdebug build and matched original-ifnode debug
VM supply the current-source IR evidence. If release provenance is deemed
insufficient for a publication claim, stop and propose separately authorized clean
matched builds; do not silently rebuild or substitute VMs in this campaign.

## What the existing receipts establish

The focused baseline debug run failed exactly `copy` and `ordered`; candidate
passed. The audit independently reevaluated all seven normal-entry C2 graph
assertions at `AFTER_MACRO_EXPANSION`, so this result does not depend solely on a
green jtreg status. All five negative graph assertions hold on both sides.

Both test commands enabled IR verification, `LoopMaxUnroll=0`, and Vector API
check mode 2, with background compilation disabled by the framework. The CPU
condition is sse2 or asimd and `MaxVectorSize >= 16`. Baseline failures demonstrate
applicable rules; both graphs contain the required 16-byte byte-vector loads.
Numeric effective `MaxVectorSize`, `UseAVX` and the per-rule socket encoding were
not retained. Do not invent their numeric values or claim the socket messages
were archived. The framework's stress run disabled IR matching; it checks
semantics and debug assertions only. Existing surrounding coverage passed
37/37 fastdebug and 36 release tests with one platform skip.

The product reproduction has normal-entry C2 as well as OSR, using identical
input/result and flags on each side. Its default unroll captures are separate
from its `LoopMaxUnroll=0` attribution captures:

| Main code | Baseline | Candidate | Change |
| --- | ---: | ---: | ---: |
| Normal entry, default | 768 B | 1,272 B | +65.6% |
| Normal entry, no unroll | 768 B | 656 B | −14.6% |
| OSR, default | 1,488 B | 1,608 B | +8.1% |
| OSR, no unroll | 1,488 B | 1,408 B | −5.4% |

Default candidate main-loop stride changes from one to two, with additional loop
structure. With unrolling disabled, the source comparison changes from two to
one while the destination comparison and 128-bit vector operations remain.
Both inputs return 19,760,000. Frames remain 0x60. No new hot-loop spills are
demonstrated. Parse-time intrinsic counts and register-allocation attempt counts
do not measure final check counts, spills, or performance.

The saved ordered graph shows the vector address depending on a non-floating
CastII below the intervening signed guard, preserving the dependency that the
eliminated check carried. That establishes safety for the covered case. It does
not establish absence of scheduling or loop-optimization regressions elsewhere.

## Scope and resource envelope after execution approval

One serial timing lane, one JMH thread, two allowed logical CPUs on distinct
physical cores, fixed affinity, 512 MiB heap and G1 on both sides. Allow 4 GiB
resident memory and 8 GiB new scratch space; existing preserved JDKs/VMs are
additional. These are operator-monitored capacity limits, not enforced aggregate
RSS/disk quotas. Stop if they are exceeded; do not change host quotas. No root changes, governor changes, hardware counters, installations,
CI, merges or public push are part of this plan.

| Stage | Bound | Stop condition |
| --- | --- | --- |
| Source checkout | 2 minutes for fetch | missing pin or network failure |
| Build harness once | 10 minutes; each tool ≤180 seconds | missing dependencies, dirty/wrong codec pin, failed compilation/JAR metadata |
| Frozen inputs and correctness | 5 minutes; each Java process ≤120 seconds | any decode, roundtrip, boundary, canary or exception mismatch |
| Debug graphs/product code shape | 20 minutes; 44 forks, ≤90 seconds each | missing C2 applicability evidence, failed semantics, missing/oversize graph |
| Matched timing | 55 minutes; ≤252 forks, ≤60 seconds each | incorrect output, crash, timeout, changed identity, incomplete pair or disk cap |
| Offline analysis/receipt finalization | 3 minutes | incomplete/corrupt receipts |

Total execution budget is 95 minutes, plus at most 5 seconds for timeout cleanup.
Dependency staging is separate setup and must be resolved before the campaign.
Stage budgets include their validation
overhead; no automatic retries, larger heaps, extra cases or fallback builds.
Every child inherits a 256 MiB per-file limit and disabled core dumps. Each run
stage checks its 2 GiB receipt budget after each child; an in-flight child can
overshoot that threshold, so reserve the larger aggregate envelope above.
Whole process groups are terminated on timeout.
Any incomplete campaign is reported as incomplete and retains its receipts.

The scripts default to dry run. `--execute` is an operator switch after approval;
it is not a substitute for approval. Optimization-disabled Python is rejected
so assertions cannot silently remove execution gates.

## Prerequisites and exact execution sequence

The installed workspace has no Gradle executable or JMH JARs. Stage these four
existing/cached dependencies before execution; obtaining them requires separately
authorized dependency setup if they are still absent. Nothing downloads them
automatically:

- `org.openjdk.jmh:jmh-core:1.37`
- `org.openjdk.jmh:jmh-generator-annprocess:1.37`
- `net.sf.jopt-simple:jopt-simple:5.0.4`
- `org.apache.commons:commons-math3:3.6.1`

Place their correspondingly named JAR files in `TASK_DEPS`. The processor and
runtime dependency choices follow JMH's [processor POM](https://github.com/openjdk/jmh/blob/1.37/jmh-generator-annprocess/pom.xml)
and [runtime POM](https://github.com/openjdk/jmh/blob/1.37/jmh-core/pom.xml).
Hashes enter `artifact.json`. Obtain a clean codec checkout at the exact SHA
above through ordinary Git. Never build from the extracted reference directory.
No Gradle wrapper or auto-downloading Java toolchain is used.

Run all commands from this JDK checkout. Set the two physical CPUs from the
existing allowed affinity/topology; the executor validates availability and
distinct package/core identities. These variables deliberately avoid HOME/PATH:

```bash
TASK_REPO=/workspace/openjdk-jdk27u
TASK_PLAN="$TASK_REPO/doc/c2-vector-bounds-qualification"
TASK_RECEIPTS=/workspace/scratch/c2-vector-bounds
TASK_AUDIT="$TASK_RECEIPTS/qualification-evidence-final/audit.json"
TASK_RUN=/workspace/scratch/c2-vector-bounds-qualification-run
TASK_CODEC=/workspace/scratch/jzstd-6abf77e2
TASK_DEPS=/workspace/toolchains/jmh-1.37
TASK_CPUS=0,1  # replace with two allowed distinct physical cores
```

Create `TASK_RUN` once as a new private directory. After the execution and
dependency prerequisites are satisfied, build one immutable harness:

```bash
mkdir "$TASK_RUN"
git init "$TASK_CODEC"
git -C "$TASK_CODEC" remote add origin https://github.com/re-thc/jzstd.git
timeout 120 git -C "$TASK_CODEC" fetch --depth=1 origin 6abf77e2f63b68cc9269d5823e206235ab254c04
git -C "$TASK_CODEC" checkout --detach FETCH_HEAD
taskset --cpu-list "$TASK_CPUS" python3 "$TASK_PLAN/build_harness.py" \
  --codec "$TASK_CODEC" --jdk "$TASK_RECEIPTS/baseline-release-jdk" \
  --deps "$TASK_DEPS" --out "$TASK_RUN/harness" --execute
```

The script verifies the clean codec Git SHA, compiles its production sources
unchanged, compiles the separate qualification class with JMH annotation
processing, checks BenchmarkList/CompilerHints/generated classes, and writes
`harness/artifact.json`. It records source, dependency, class-JAR and javac hashes.
Use that exact artifact on all VMs.

For each of the following invocations, omitting `--execute` prints JSON commands
without starting Java. Run preflight once, then diagnostics:

```bash
python3 "$TASK_PLAN/matrix.py" preflight \
  --artifact "$TASK_RUN/harness/artifact.json" --receipts "$TASK_RECEIPTS" \
  --audit "$TASK_AUDIT" --repo "$TASK_REPO" --cpus "$TASK_CPUS" \
  --corpus "$TASK_RUN/corpus" --out "$TASK_RUN/preflight" --execute
python3 "$TASK_PLAN/matrix.py" diagnostics \
  --artifact "$TASK_RUN/harness/artifact.json" --receipts "$TASK_RECEIPTS" \
  --audit "$TASK_AUDIT" --repo "$TASK_REPO" --cpus "$TASK_CPUS" \
  --corpus "$TASK_RUN/corpus" --out "$TASK_RUN/diagnostics" --execute
```

Preflight creates eight baseline-generated level-3 frames once: four deterministic
corpora, at 64 KiB and 1 MiB, matching the codec's existing JMH corpus generator.
All forks read those same input/frame files and check their hashes. Correctness
checks both public decode forms, complete output equality, offset destination
canaries, truncated/bad-magic frames, undersized output, forbidden overlap and
compression roundtrips. Compare rejection classes between VMs if either differs;
any difference blocks timing. The saved compiler regression already covers
negative sizes, zero lengths, aliases, INT_MAX and rejected overflowing updates.
Each timed trial validates its last observable result/output after warmup and
measurement; full hashing/reference checks are outside measured operations.

Diagnostics runs four actual-codec direct-decode corpora plus six noncodec shapes
on both debug and product VMs, and an additional no-unroll vector-cursor capture
per VM. Debug forks print phases, assembly and inlining. Product diagnostic forks
print assembly and inlining with the same default optimization settings as timing.
The requested
phase names are checked against this tree's `phasetype.hpp`; product VMs
receive no develop flags. It imposes no compile-only, forced inlining or tiering
changes. If a target is naturally inlined, inspect the actual C2 caller and
bytecode state instead of forcing a new call shape.

## One review gate, then the complete matched run

Review all diagnostics together; proceed without new per-case permission within
an approved campaign. This is substantive graph review, not a checkbox inference
from successful execution. Write one `TASK_RUN/gate.json` only after resolving:

1. **Actual compilation and flags.** Record normal-entry C2 compile IDs, or the
   normal C2 caller/inlining chain for each target. Reject OSR-only evidence.
   Some stored/random-frame cases may never execute WindowBuffer; label them
   target-not-exercised and inspect their actual decode caller rather than
   requiring a nonexistent standalone WindowBuffer compilation.
   Compare effective flag tables, especially check mode 2, MaxVectorSize, UseAVX,
   tiering, unroll limits, predicate/SuperWord controls, GC, compressed pointers,
   compiler threads, heap and ActiveProcessorCount. Permit only expected debug
   versus product differences. Review debug and product identity separately.
2. **Actual codec applicability.** At the literal vector bytecode location, show
   which established condition matches the eliminated check: comparison/test,
   exact index, AddI constant, raw LoadRange, linear dominance and exception state.
   Trace the preserved control/cast/address and memory inputs in debug graphs,
   and demonstrate the same target check removal in product code at the mapped
   codec BCI. Debug output alone cannot establish product scheduling/code shape.
   If absent, set
   `codec_target_removed` to false. Stop codec-gain attribution and retain only the
   two predeclared direct-decode sentinels, compression controls and noncodec tests.
3. **Downstream effects.** Compare before/after predication, unrolling and
   auto-vectorization, after macro expansion, GCM and register allocation.
   Record cast dependency type/control/loop membership, guard placement, memory
   precedence, pre/main/post loops, stride, vector lanes and operations per input
   element, hot-loop spills, polls, code/nmethod/metadata sizes and C2 compilation
   failures. Compare default vectorCursor against its no-unroll pair. Keep normal
   and OSR code separate. A lost hoist/vector pack or added hot-loop memory traffic
   needs explanation before timing proceeds; it must not disappear in an aggregate.
4. **Correctness and applicability of controls.** Inspect scalar subrange,
   invariant vector load plus intervening store/guard, scalar map suitable for
   predication/SuperWord, the differing-offset near miss, and arraycopy. The matcher
   is not vector-specific. Record which controls actually trigger it; if baseline
   already removes a check, label that case unaffected. Do not infer an early-pin
   regression solely from code growth or allocator attempts.

The source-backed risk is that `compute_invariance()` in loopPredicate.cpp treats
in-loop controlled nodes differently when `depends_only_on_test()` is false;
SuperWord also propagates unknown/pinned load dependencies. Existing captures
do not resolve these risks. Do not disable predication/SuperWord speculatively;
an unexplained divergence ends this bounded campaign with a follow-up proposal.

Gate fields are explicit booleans `correctness_pass`, `effective_flags_reviewed`,
`normal_c2_before_measurement`, `dependencies_preserved`, `loop_and_schedule_reviewed`,
`debug_product_identity_reviewed`, and `codec_target_removed`. Also include SHA-256
fields `artifact_sha256`, `audit_sha256`, `corpus_manifest_sha256`, and the absolute
paths/digests `preflight_receipt_manifest`, `preflight_receipt_manifest_sha256`,
`diagnostics_receipt_manifest`, `diagnostics_receipt_manifest_sha256`. Add review
notes with compile IDs/BCIs/phase findings. The executor verifies identities and
receipt digests; it cannot replace the graph review. Both stage manifests are
created automatically. Do not put the new gate file inside a manifested stage.

```bash
python3 "$TASK_PLAN/matrix.py" timing \
  --artifact "$TASK_RUN/harness/artifact.json" --receipts "$TASK_RECEIPTS" \
  --audit "$TASK_AUDIT" --repo "$TASK_REPO" --cpus "$TASK_CPUS" \
  --corpus "$TASK_RUN/corpus" --out "$TASK_RUN/timing" \
  --gate "$TASK_RUN/gate.json" --execute
python3 "$TASK_PLAN/summarize.py" "$TASK_RUN/timing" --out "$TASK_RUN/summary.json"
```

The full matrix has 21 cells: eight direct-decode cases, four allocating decode
cases at 1 MiB, two 64 KiB compression controls, two vectorCursor sizes and five
other noncodec shapes. No-hit mode has 11 cells. There are six paired blocks,
balanced AB/BA per cell, deterministic shuffled case order (seed 20261017), one
fresh fork per side, five 1-second warmup and five 1-second measurement iterations.
That is at most 252 forks and 42 minutes of scheduled warmup/measurement; no-hit
mode is 132 forks and 22 minutes. Startup/setup and checks fit within the 55-minute
stage cap or the campaign stops incomplete.

Both timed VMs retain normal tiering and unrolling. Fixed heap/GC/CPU count and
Vector API mode 2 are identical (mode 2 is this JDK's default). Minimal identical
LogCompilation is enabled in timed forks to prove actual C2 compilation; these
are logged measurements, not an instrumentation-free claim. No assembly/ideal
printing occurs there. Iteration-start uptime markers occur outside measured
operations and identify the first measurement boundary. Review compilation logs
for any C2 completion after that boundary, recompilation or deoptimization during
measurement. `summarize.py` reports standalone normal C2 evidence; fully inlined
cases need manual caller review and remain inconclusive until that is supplied.
An nmethod invalidated during warmup cannot satisfy this gate. Invalidations
after measurement starts are conservatively flagged, including teardown; use
their timestamps to distinguish those phases in the review.

## Decision and report

Use each fork's five-iteration mean as one observation. Pair by cell/block;
never pool iterations as independent samples. Retain every completed fork and
never rerun only the unfavorable side. Summaries include six individual ratios,
geometric mean, descriptive paired-bootstrap 95% interval and negative-pair count.
The predeclared primary codec endpoint is the geometric mean of the eight direct
decode cells within each block, with a two-sided exact sign-flip test across six
block ratios. Allocating decode, compression and individual cells are secondary;
do not turn their unadjusted intervals into multiple independent gain claims.

A provisional codec benefit requires a proved actual-codec removal, unchanged
correctness, reviewed C2/flags/dependencies, primary gain at least 2%, primary
95% interval above zero and sign-flip p ≤ 0.05. Report every individual case.
Any noncodec/control regression above 2% in at least five of six pairs, lost
vectorization/hoisting, new hot-loop spills, repeated deoptimization or compilation
failure blocks a GO pending explanation. Wide intervals or unresolved scheduling
differences are inconclusive; they do not authorize more runs. Six pairs provide
a bounded screen, not universal performance assurance. Any eventual codec claim
must remain scoped to these pinned sources, binaries, workload and logged setup.

Return one report with applicability outcome, correctness, per-cell and primary
results, graph/scheduling changes, code size, compilation/deoptimization evidence,
all identity digests, resource use and exact blockers. If the actual codec target
does not change, explicitly report **safe duplicate-check removal demonstrated;
no codec-gap improvement demonstrated**. Continue the broader offset proof only
as separate authorized work.

Keep raw logs, native files and host details in private scratch storage. Source
changes and any follow-up fixes use ordinary Git with Harry Chan's requested
identity. This proposal changes only its documentation/harness files; it leaves
`ifnode.cpp`, the GCC prerequisite, finite-threshold matching, and public branches
untouched. Integrating the already published compiler commit still needs ordinary
shared-file coordination with the finite-threshold lead.
