# C2 sibling spill-copy sharing review

After the first physical split, C2 can retain two memory-to-register copies
with the same source node and equivalent register constraints. The ordinary
copy-chain coalescer need not eliminate these sibling reloads. This experiment
redirects the later copy's checked value users to a dominating earlier copy,
then rebuilds register masks, liveness and physical interference through the
existing allocator path.

The compiler revision on this branch has not been built or run. There is no
throughput, startup, allocation or compile-time improvement claim. The branch
is for source and test review; a passing semantic test or smaller instruction
sequence would not establish a performance benefit.

## Source identity and scope

The base is stock JDK 27 commit
`815ff4dc327fe17f2433c7d115a5a503af10f3c4`, tree
`576ca92576a193036464be6bed1be361d8f2d80f`. This is intentional even though the
fork's default branch has advanced. Do not substitute the current default
branch when building the control.

The pass runs only after the initial physical split. It accepts ordinary
integer/long origins and bounded transparent copy chains. It rejects save-on-entry
projections, Phis, runtime stubs, pointer values, repeated definitions, calls,
control/debug uses, tied inputs, real precedence edges, constrained masks and
unproved dominance. Definition counting includes every scheduled node, even
projections after a block's end index. The retained reload's resolved range
must have exactly one definition.

The source bounds are 32,768 scheduled nodes, 65,536 ranges, eight users, 16
origin-copy steps, 64 backward/dominator steps, offset-zero masks of at most
4,096 bits and 262,144 shared abstract work units. Definition counts use one
saturating byte per range. These are experimental limits, not measured
shipping thresholds. Exceeding a limit declines a pending transformation.
The normal interference rebuild still follows any completed transformations.

This change does not alter spill policy, matching rules, bounds checks,
corruption checks, Java APIs or oop-map construction. The AMD FPU spill policy
backport and C1 switch profiling backport are separate work.

The rolling allocator was also read at
`93376e455d8d321648994c9f91ea1c7cc55c513a`. Nearby upstream work includes
[JDK-8337821](https://github.com/openjdk/jdk/pull/33203) on Split memory limits,
[JDK-8381149](https://github.com/openjdk/jdk/pull/30500) on post-allocation vector
constant deduplication and [JDK-8390036](https://github.com/openjdk/jdk/pull/32084)
on AddP base rematerialization. Those address different transformations; this
is not a backport of them.

## Public reproduction

Everything required by the synthetic tests is in this repository, apart from
normal public OpenJDK build dependencies. No external workload, prebuilt VM,
replay log, host snapshot or unpublished evidence file is required.

Follow [Building the JDK](../../../../../../doc/building.md) for a supported
compiler, Autoconf and a suitable boot JDK. Configure needs jtreg (including
`lib/jtreg.jar`) and GoogleTest source version 1.14.0 or newer containing both
`googletest/include/gtest/gtest.h` and `googlemock/include/gmock/gmock.h`.
[Testing the JDK](../../../../../../doc/testing.md) describes the test
selectors and result directories. Python 3.9 or newer suffices for the optional
offline deadline checks below.

The following are reproduction instructions, not an unattended launch plan.
Choose and approve a local resource budget before running configure, build or
VM tests. Keep compiler diagnostics and code capture separate from timings.
On a supported Linux host, set these three paths to existing dependencies:

```sh
export BOOT_JDK=/path/to/boot-jdk
export JTREG_HOME=/path/to/jtreg
export GTEST_SRC=/path/to/googletest

git clone --branch pr/c2-share-spill-copies-review-v5 \
  https://github.com/re-thc/openjdk-jdk27u.git spill-sharing-review
cd spill-sharing-review
REVIEW_COMMIT=$(git rev-parse HEAD)
git merge-base --is-ancestor 815ff4dc327fe17f2433c7d115a5a503af10f3c4 HEAD

env -u JAVA_TOOL_OPTIONS -u _JAVA_OPTIONS -u JDK_JAVA_OPTIONS \
  bash configure --with-conf-name=spill-sharing-fastdebug \
  --with-debug-level=fastdebug --with-jvm-variants=server \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-gtest="$GTEST_SRC"
make CONF=spill-sharing-fastdebug JOBS=4 images test-image
```

Record the exact source commit/tree, configure arguments, tool versions and
SHA-256 of the tested JDK binaries. Stop on the first failed command. Do not
silently select a different toolchain, retry a positive-trigger test until it
passes or relabel an earlier prototype's results as results for this revision.

Run the focused native tests before the Java integration tests:

```sh
make CONF=spill-sharing-fastdebug run-test TEST=gtest:SpillCopySharing
make CONF=spill-sharing-fastdebug run-test \
  TEST="hotspot/jtreg/compiler/regalloc/TestSharedSpillLoads.java \
        hotspot/jtreg/compiler/regalloc/TestSharedSpillSharingTrace.java \
        hotspot/jtreg/compiler/regalloc/TestSharedSpillSharingPortable.java \
        hotspot/jtreg/compiler/regalloc/TestSharedSpillGC.java" \
  JTREG="JOBS=1"
```

The expected native selection is nine cases, all executed, with no disabled
cases, skips, failures or errors. These exercise the exact graph-independent
guards used by C2. Symbolic test masks do not validate the entire real RegMask
adapter or prove allocator correctness.

The Java selectors serve different purposes:

| Selector | Required evidence |
| --- | --- |
| `TestSharedSpillLoads` | 120 independent arithmetic cases, 80 alias cases and 60 exception-order/complete-output cases, in each of its three x86 configurations |
| `TestSharedSpillSharingTrace` | The same 260 semantic cases and at least one accepted, unexhausted rewrite in the selected `kernel4` C2 compilation |
| `TestSharedSpillSharingPortable` | The same 260 semantic cases with platform-neutral options |
| `TestSharedSpillGC` | Four root/state cases, three forced collections and two active deoptimizations, with C2-level and hook checks |

The trace test requires a fastdebug x86 VM with BMI2. Its positive trigger has
not been established for this revision. Zero accepted rewrites is a failed
mechanism gate, not permission to loosen the test. Platform requirements may
exclude selectors; record exclusions explicitly. They are not passing tests.

For an unchanged stock compiler control, create another worktree at the exact
base and copy only the two semantic test sources into it:

```sh
git worktree add --detach ../spill-sharing-control \
  815ff4dc327fe17f2433c7d115a5a503af10f3c4
for name in TestSharedSpillLoads TestSharedSpillGC; do
  git show "$REVIEW_COMMIT:test/hotspot/jtreg/compiler/regalloc/$name.java" \
    > "../spill-sharing-control/test/hotspot/jtreg/compiler/regalloc/$name.java"
done
```

Configure and build that control with the same dependency paths, build options
and resource limits, using a distinct configuration directory. Run those two
selectors against both independently identified binaries. The positive rewrite
trace is a candidate-only assertion; stock has no sharing summary. No private
prototype VM is a mandatory control.

## Saved-register coverage and performance qualification

A green GC/deoptimization test alone is insufficient physical-register evidence.
On this x86 source base, compiled nmethods have no explicit callee-saved-value
OopMap entries. RBP's saved link is handled by the compiled frame walker. Inspect
the actual caller call-PC oop map, both linked compilation IDs/PCs and the
callee prolog/epilog/deoptimization code. For a live caller oop in RBP, the
callee's saved-link address is `frame_base + frame_size_bytes - 16`; the walker
maps both RBP VMReg halves to that same address. Stack-only, absent or ambiguous
evidence leaves that coverage unproven. This does not establish save-on-entry
coverage on other architectures.

Before proposing a shipping optimization, establish the revision's positive
rewrite, semantic correctness, complete code/map evidence, compile-time and
allocation costs, then measure unchanged control/candidate binaries in a fixed
alternating order. Report every observation and distributions. Keep cold,
startup and spill-sensitive controls. For decoder qualification, use identical
frames on source, repetitive, dense and long-offset data, plus malformed inputs;
check complete output and failure behavior without weakening checks. Fewer
loads or instructions alone is not a speed claim.

## Optional offline deadline support

`deadline.py` is the reusable absolute monotonic budget/watchdog component.
`deadline_io.py` is a portable extraction of deadline-aware hashing, metadata
and finalization behavior. It is not the host-specific execution controller and
does not configure, build, launch a workload or supply resource admission.
Neither module has an execution CLI. A local driver must be reviewed separately
and keep its fixed controls, prerequisites, resource checks and authorization.

One budget covers all stages, preservation, hashing and terminal output. Start
the watchdog explicitly only for an authorized run. Metadata uses the remaining
absolute timeout; a late exit zero still fails. The watchdog signals only the
currently tracked child process group and exits 124 without post-deadline disk
writes or cleanup grace.

Finalization disk records stay provisional. Success requires a flushed terminal
receipt with `finalization_complete=true`, `within_total_deadline=true` and
`all_preserved=true`, followed by a deadline check and immediate zero exit. The
receipt's elapsed time is sampled after every artifact write. Missing receipts,
late writes, nonzero exits and interrupted preservation remain incomplete or
failed. A receipt does not qualify physical-register coverage or performance.

Run only the offline mocks with:

```sh
python3 -B -m unittest discover \
  -s test/hotspot/jtreg/compiler/regalloc/shared-spill-review \
  -p test_deadline.py -v
```

The 22 checks use synthetic temporary files and mocked process/thread/signal/
exit operations. They launch no target processes or watchdog threads. These
checks passed during source preparation; the compiler/native/Java tests above
have not run for this revision.
