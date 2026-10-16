# C2 signed-guard range-check prototype

This review branch proposes removing an unsigned array bounds check when
nearby signed guards on the exact same index already prove it. For example:

```java
if (index < 64) {
    return index <= 0 ? 0 : table[index] & 0xff;
}
return index;
```

For a constant 64-element array, the access path implies `1 <= index < 64`.
The signed exits have different observable results. The proposal combines
their local facts rather than merging the exits or changing the index's
global type.

**Status: source-only review prototype.** The compiler change and new Java
sources have not been compiled or executed. Source review and patch
application checks are the available validation. The IR rules, dependency
preservation, generated code, portability and performance remain unqualified.
There is no measured application benefit from this candidate.

## Scope and source

The parent commit is `758f41576fc79d35a62a3896dbe5ab97c448c436`.
The change is confined to `RangeCheckNode::Ideal` in
`src/hotspot/share/opto/ifnode.cpp` and generic test sources. It accepts a
`Bool[lt](CmpU(index, positive ConI))`, follows at most eight direct control
edges, and intersects the existing integer type with signed constant-guard
facts from `IfNode::filtered_int_type`. The guard must use the exact same
index node. The walk stops at merges, loops, calls, predicates and unknown
control. It does not equate arithmetic expressions or separate loads.

After a successful proof, the helper calls `pin_dependent_nodes` and changes
the current check's condition to true while retaining its incoming control.
Pinning and later control transformations require runtime graph review;
source plausibility is insufficient. No parser casts, public APIs, mismatch
stubs, native-memory paths or architecture matchers are changed.

The bounded upstream audit included
[rolling JDK `93376e455d8d`](https://github.com/openjdk/jdk/tree/93376e455d8d321648994c9f91ea1c7cc55c513a)
and [fork master `89885a6288e7`](https://github.com/re-thc/openjdk-jdk27u/tree/89885a6288e7aaabd01678a704a586272c0f96e3).
Relevant existing signed-filtering fixes
[JDK-8385855](https://github.com/openjdk/jdk/pull/31395) and
[JDK-8346420](https://github.com/openjdk/jdk/pull/28819) are already included
in the audited source. This is a narrower unsigned-check proof, rather than
a backport of those changes. The audit found no exact applicable duplicate;
it is not an exhaustive historical search.

## One bounded qualification batch

Use a full clean checkout, existing OpenJDK prerequisites from
[the build guide](../building.md), JDK 27, jtreg 8.3, Python 3 on Linux and
GNU coreutils `timeout`. No package installation or private input is required.
The repository includes the existing Python resource supervisor, adapted as
[`bounded_step.py`](../../test/hotspot/jtreg/compiler/rangechecks/signed-guards/bounded_step.py),
and a fixed batch preparer/runner,
[`qualification.py`](../../test/hotspot/jtreg/compiler/rangechecks/signed-guards/qualification.py).
The supervisor uses only Python's standard library and the available GNU
`timeout`; it is not an unspecified external service.

Prepare the complete request without launching any build or JVM:

```sh
set -eu
REVIEW=$(pwd)
QUALIFY="$REVIEW/test/hotspot/jtreg/compiler/rangechecks/signed-guards/qualification.py"
BOOT_JDK=/absolute/path/to/jdk-27
JTREG_HOME=/absolute/path/to/jtreg-8.3
OUT=/absolute/path/to/new-absent-signed-range-output
REQUEST=/absolute/path/to/new-signed-range-request.json
python3 "$QUALIFY" prepare --repository "$REVIEW" --boot-jdk "$BOOT_JDK" \
    --jtreg "$JTREG_HOME" --output "$OUT" --request "$REQUEST" --cpus 0,1
```

Choose exactly two allowed CPUs before freezing the request. Existing local
configure/toolchain options can be supplied as repeated
`--configure-arg=--with-toolchain-path=/absolute/existing/toolchain` and
`--make-arg=NAME=value`. The manifest records every resulting argument;
review and hash that complete manifest before approving runtime execution.
No runtime authorization is implied by preparation or source publication.

The fixed public batch has 55 commands, in this order:

1. Check out the pinned baseline; build an ordinary release **image**, then
   ordinary baseline/candidate fastdebug VMs. Snapshot matching runtime files
   and replace only `lib/server/libjvm.so`; the baseline runtime comes from
   `build/qualification-release/images/jdk`, not the exploded build directory.
2. Overlay exactly the reviewed compiler/test/driver sources. Compile common
   WhiteBox and diagnostic classes once from repository sources; freeze their
   hashes and capture the first baseline/candidate `testLookup64` pair.
3. Review the first pair internally against the structural gate below. When
   it qualifies, capture the seven fixed remaining target pairs, then review
   dependency evidence internally and independently before continuation.
4. Build/snapshot the candidate release VM. Run both generic tests and the
   fourteen named existing regressions on all four images, followed by one
   fixed-seed functional stress pair on fastdebug.
5. Run the baseline fastdebug IR-negative control. Exit 1 creates an explicit
   **unqualified** review record; only a review of the exact redundant-check
   IR mismatch can qualify it. Timeout, signal, launcher and other exits stop.

There is no timing stage, automatic seed search, retry, hosted workflow,
provisioning, publication or merge in this batch. Source, configure specs,
common classes and runtime files are hash-recorded. Each consumer checks
its generated input seals. The public default builds everything from source;
use of any already saved baseline in a separately frozen local request must
retain its exact source/configuration/artifact identities.

The supervisor receives these actual manifest settings:

| Setting | Fixed value |
| --- | --- |
| Overall elapsed ceiling, including internal reviews | 7,200 seconds |
| CPUs / build jobs | two allowed CPUs / two jobs |
| Configure / build aggregate workload RSS stop | 4 GiB / 6 GiB |
| Captures and other small steps / jtreg RSS stop | 2 GiB / 4 GiB |
| Initial free space / minimum remaining free space | 13 GiB / 4 GiB |
| Output apparent-size / combined log per command | 9 GiB / 64 MiB |
| Each XML / normal per-file limit | 256 MiB / 512 MiB |
| Build per-file limit / core dumps | 1 GiB / disabled |
| Capture total wall ceiling / termination grace | 120 seconds / two seconds included |

RSS, disk, XML and log limits are sampled stop thresholds, once per second
plus scan time. Affinity and core/per-file limits are kernel controls. The
supervisor and its small watchdog are control processes, outside the workload
session RSS sum. The overall ceiling dominates the sum of individual command
ceilings; a complete run within two hours is not promised. A cap stops the
batch, preserves partial evidence and leaves unexecuted work unqualified.

Each command gets a fresh owned session. The supervisor schedules an
independent watchdog against the **absolute** earlier step/overall deadline:
TERM starts two seconds before it, then process-group SIGKILL and owned-session
cleanup occur at the deadline. This watcher remains effective during the
main process's filesystem scan or after a launcher exits with live descendants.
The main process retains the leader PID until watchdog disarm. GNU timeout
provides a second process-group escalation path; a full capture is equivalent
in intent to `timeout --signal=TERM --kill-after=2s 118s command`, rather than
an unbounded TERM-only timeout. Actual launch arguments, absolute deadline
and termination reserve are recorded. Commands must not detach into unrelated
sessions. This source-reviewed mechanism has not yet been runtime tested;
OS scheduling or uninterruptible tasks cannot be promised real-time cleanup.

After runtime approval, use one runner command:

```sh
python3 "$QUALIFY" run "$REQUEST"
```

Exit 75 identifies an **internal technical review**, not a request for another
parent/user approval. The executing agent reads the retained graphs itself or
uses its internal reviewer. It records a reasoned review under `OUT/reviews`,
then invokes the same runner to continue the already approved batch. The same
request hash, elapsed clock, command attempts and resource caps remain in
force. Do not rerun a command after failure, timeout or uncertain outcome.
An unmet or ambiguous gate stops the batch and is reported with evidence.

A review record must contain the exact request SHA256, `qualified: true`, the
specified reviewer (`internal-review` for lookup64/final negative, or
`internal-independent-review` for dependencies), and a nonempty
`evidence_files` map of output-relative filenames to SHA256 hashes. Include
the graphs/diagnostics and the written reasoning; the supervisor rechecks
those hashes. No script infers graph qualification or turns a missing witness
into a pass. A final nonzero candidate remains unqualified until this review.

## Required graph and functional checks

The first driver calls only the unchanged `testLookup64`: 20 fixed inputs
for 2,000 interpreter sweeps, one blocking normal-entry C2 enqueue, then 20
compiled checks. The shared IR-framework runner would compile fourteen tests
and is deliberately not used for this isolated capture. Require functional
checksums and exactly one normal level-4 compilation, with no early/OSR/queued
compilation. The common capture heap is 512 MiB with Serial GC.

In the candidate IGVN sequence, require the same processed target
`RangeCheck`, its exact SSA index and positive constant, both signed facts,
and unchanged incoming control. Require the condition to change from the
relevant `Bool(CmpU)` to `ConI 1`; review the entire graph difference and source
paths to exclude other folds. Level-5 snapshots follow progressing IGVN steps;
they are not literal helper entry/exit traces. A missing final `CmpU`, a green
IR rule or a smaller nmethod does not locate the transformation.

Track previously floating dependent loads/casts, preserving memory slice,
address/value and metadata across the fold and a genuinely later guard
removal, splitting or loop transformation. `clone_pinned` uses `UnknownControl`
on this source, not literal `Pinned`; already nonfloating users may need no
clone. A duplicate removed before the new helper does not witness later
removal. Missing requested event/dependency lineage remains unqualified.

The seven remaining paired targets are `testLookup131` and, from
`TestDominatingSignedRangeDependencies`, `testAliasedReadBeforeWrite`,
`testDuplicateUpperGuard`, `testDuplicateLowerGuard`, `testDiamondIndex`,
`testInvariantLoop` and `testGuardBeforeLoop`. Their driver runs 2,000 complete
original functional sweeps, one explicit compilation of the selected method,
and one compiled sweep; other methods execute interpreted.

Normal jtreg uses one test at a time, 1 GiB Test/Flag heaps and fixed
`jdk.test.lib.random.seed=1597463007`. It omits `UseSerialGC`, which would
disable this IR framework's matching through its whitelist. Candidate
fastdebug must actually perform IR matching. Baseline functional runs set
`VerifyIR=false`; installed jtreg 8.3 preserves `-D` options for driver actions.
The single fixed stress pair uses `StressIGVN`, `StressSeed=1597463007`,
`VerifyIterativeGVN=111111`, `VerifyLoopOptimizations` and `VerifyIR=false`;
these are functional checks, not IR qualification. The dependency test has
functional assertions and no blanket no-`CmpU` rule.

The exact fourteen existing regression paths and all flags are in the
preparer. They cover smearing, CastII/split-if/unswitching, unsigned
underflow/overflow, reexecution, folded compares and type propagation to
CmpU. The final baseline IR-negative must specifically identify the intended
redundant-check rule failure. Unrelated jtreg errors cannot qualify it.

Compiler/test/driver source remains the reviewed prototype. Builds, Java
compilation, supervisor behavior, functional/IR outcomes and portability
have not yet been tested for this branch. Fewer instructions or passing tests
would still not establish encoder throughput. Performance and compilation
cost require a separate bounded plan after these correctness gates.
