# Qualification proposal: launch HOLD, no execution

No JDK, build, test, benchmark, CI job or install was run while preparing this
revision. New scripts/tests are unexecuted source, reviewed statically. The only
new numbers are arithmetic re-analysis of retained CSVs. This is a proposal for a
separately authorized execution, not an authorization or a new qualification.

## Disabled-path investigation comes first

[RUNTIME_DISABLED_AUDIT.md](RUNTIME_DISABLED_AUDIT.md) identifies the historical
sources, image/module hashes, exact workloads/storage flags, compiler identities
and missing diagnostics. It preserves all old rows and the original conclusions
in `retained-disabled/`, with a manifest of their original Git paths and hashes.
Runtime-off canonical losses occurred in all three historical forks, in both
String modes. Missing production compiler traces and unstable rounds prevent
precise attribution of the6–11.5% pooled difference. Do not call the old candidate
regression-free or treat a later timeout as erasing that concern.

The source correction short-circuits after VM boot on the same saved startup
property, before eligibility, failure-state and Library access. It preserves
public Instant.parse, C/Rust/ABI, the original formatter, exact lowercasefalse
semantics and the nonwaiting loader. A new main/othervm regression covers preboot,
property mutation, guard order, loader initialization and exact fallback outcomes.
It is written, not executed. The public wrapper/boot read remain; zero-cost
runtime disabling or restored caller inlining is not established.

**Launch HOLD:** first run the frozen causal stage, not the broad matrix. The
full-stage entry refuses to build anything without a completed PASS report for
this exact candidate plus unchanged retained evidence identities. Missing,
HOLD, NO-GO, INCONCLUSIVE, unknown containment, changed tools/source or a failed
prerequisite cannot be promoted to GO. No source-only review releases this gate.

## Frozen source and routes

Baseline is89885a6288e7aaabd01678a704a586272c0f96e3 (tree
 d77a085e51da37106c582c017af6151e01e95f42). Pre-correction review source is
779753e390e43508372ac860fdf944a801c869c8. Freeze the full SHA of the commit
containing this document before either stage. There is no moving branch input.
The only production Java change since779753 is InstantParser guard/property
placement. Public Instant.parse and the native implementation remain unchanged;
there is no empty-diff claim for the corrected helper.

The causal stage builds **three** normal images: previous779753 enabled,
corrected enabled and corrected configure-off. Public/direct-formatter controls
run in each. The later broad stage builds **four**, not five, normal images:
baseline, baseline with the frozen cached Java parser control, corrected enabled
and corrected configure-off. Runtime-off shares the enabled image and adds
-Djdk.time.instantSpeedate=false. There is no patch-module timing route or
arbitrary binary handoff. The cached file must exactly match the transformation
of its pinned baseline; all other checkout status must be pristine, including
staged and untracked files.

Historical native integration2a62302b1e4 used a dirty fdb9621 checkout; its
ProductionProbe and runtime code were identical to779753, but historical image
hashes do not identify a new build. The older Windows build-path repair also
needs real native correctness qualification. LocalDate/LocalDateTime contribute
no source change, correctness proof or timing evidence here.

## Actual job boundary and launch commands

The Linux-only launcher uses the already installed GNU timeout and bubblewrap,
with unshared user/PID namespaces, COMMAND asPID1, --die-with-parent and no further
user namespaces. PID1 exit destroys the namespace's remaining processes,
including detached/double-fork descendants. Timeout sends TERM early enough to
reserve ten seconds for KILL/teardown inside the total ceiling. The new process
namespace, actual inherited cgroup CPU/memory limits and scratch filesystem size
are checked inside PID1 before any checkout/build command. A matching machine
capture, not a manually written approval assertion, binds every command receipt.

The current environment's read-only metadata reports cpu.max400000/100000,
memory.max17179869184 and a roughly32GiB /workspace filesystem (below the80GiB
maximum). /tmp inside the job is bound to that same scratch filesystem. Namespace
creation has **not** been attempted; installed bwrap does not prove the host
permits it. Failure to create/verify the namespace is HOLD, without an uncontained
fallback. There is no dependency on systemd, privileged setup, new hardware or
an unmanaged install. Another compatible Linux host is necessary only if the
existing host refuses the required process containment. Other architecture
performance hosts are not prerequisites for this initial decision.

Use a fresh /workspace scratch root, a clean committed review checkout, installed
GCC16/mold/JDK27/jtreg83/Rust1.99 and the existing activation script. The script
sets direct installed Cargo/rustc paths, not mutable rustup shims; target libraries
and compiler driver are fingerprinted. If these exact tools/paths are unavailable,
stop and review a replacement source proposal instead of silently installing or
changing them. Normal Cargo dependencies must already be available offline.

```bash
source /workspace/toolchains/activate.sh
cd /workspace/instant-review-publish
# After separate execution authorization, first and only first:
bash test/experiments/instant-speedate-production/launch_qualification.sh \
  causal /workspace/instant-disabled-causal
# Only after that completed candidate-bound PASS and separate full-stage authorization:
bash test/experiments/instant-speedate-production/launch_qualification.sh \
  full /workspace/instant-full-qualification \
  /workspace/instant-disabled-causal/disabled-comparison/causal-decision.json
```

These are separate fixed stages with separate empty roots and clocks; there is
no retry of a failed stage or reset of a running clock. The causal artifacts are
retained and re-hashed as evidence. The broad stage builds all four own images;
it does not reuse the causal images. No broad stage starts automatically.

## Resource and time allocation

Each separately authorized stage has **six hours total**, one monotonic start
captured before setup; the outer job enforces that ceiling, including teardown.
The earlier three-hour all-in claim is withdrawn: retained full-build logs lack
elapsed timestamps and the enabled log is incremental, so they cannot establish
that four fresh builds plus the full matrix fit three hours. This revision fixes
a prospective ceiling before execution; it is not an extension after a miss.

Maximum four CPU equivalents,16GiB memory, filesystem capacity<=80GiB. Make
images use JOBS=4, Cargo2. All fixture JVMs run serially with ActiveProcessorCount2,
256MiB heaps (stress64MiB). Normal build configuration disables the javac server;
PID namespace teardown handles abnormal/detached children. Failure/cleanup/logs
are retained. Disk/resource exhaustion or uncertainty stops the whole job.

The full-stage planning allocation is60min for checkouts/configurations/cache/
metadata,120min for four complete images (30min each),40min for three JUnit stages
and Rust (10min each),30min runtime correctness/compiler diagnostics,90min timing,
5min cold cohort and5min final owner consolidation:350min plus10min contingency.
The fixed per-command limits remain5min configure/cache/checkout,30min images,
10min JUnit/Rust and2min a fixture JVM/compiler. The runtime controller enforces
30/90/5min phase limits under the same six-hour clock. These are stop ceilings,
not proof that an unknown workload will finish. Subordinate command maxima are
nonadditive under that hard total: the planning allocation does not grant every
setup/metadata command its full limit plus a fresh stage clock. The causal stage uses three
builds, two JUnit stages and the smaller comparison under the same outer maximum.

The broad matrix keeps188 timing JVMs x11million public calls =2.068billion
parses, plus30 diagnostic JVMs x11million =330million. A90min timing ceiling
allows about2.61us per call before process/compiler/controller overhead. Retained
medians span roughly0.1–1.3us, but are not evidence for the new fallback/custom
corpora or other collectors. Even a1.6us weighted average would require55.1min
before process/GC/compiler overhead. The90min timing allocation leaves margin without
reducing warmup, block count, forks or controls. Unknown workloads can still
exhaust it. No budget exhaustion permits sample expansion, selective deletion,
smaller arbitrary repetitions or GO.

## Exact normal build and check contract

`build_and_qualify.sh` is the complete command sequence. It configures every clean
checkout before making the frozen provenance manifest, then builds normal images
with the repository's native configure-dev profile, no javac server and modest
parallelism. The cached control only caches the existing immutable parser for
variable fractional precision; no handwritten calendar parser is introduced.
It must pass the oracle and full relevant JUnit/TCK checks.

The manifest captures every spec.gmk/configure.log/config.log, source revisions,
key source/Cargo files, selected make/CC/CXX/LD, mold, boot java/javac, jtreg.jar,
direct Cargo/rustc, Rust driver/std/compiler notices, target libraries, harness
files and relevant tool-selection environment. Its hashes are checked before
and after commands. Staged/untracked source changes and modified cached-control
content are rejected. Image identities include release, full modules, bin/java,
libjvm and the native library/notices. JUnit cannot silently rebuild a different
image: before/after image identities must agree.

Exact images command: `make CONF=qualification JOBS=4 images`. Each JUnit command
uses the frozen TEST selection plus both of these **single make arguments**:

```text
TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m
JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0
```

Make JOBS=1 alone does not override auto TEST_JOBS. The separate TEST_OPTS and
JTREG controls set jtreg concurrency1 and child CPU/heap limits explicitly;
MAX_MEM also bounds the harness. Enabled/off select TestInstantSpeedate,
TestInstant, TCKInstant, TCKInstantPrinterParser and InstantSpeedateDisabled;
cached selects the three existing baseline Instant/TCK tests. No repeat/retry.
JUnit/Rust receipts must match exact commands, checkout, helper, manifest and
selected tools/image identities; timestamp/success alone is insufficient.

Rust tests explicitly use `env -u CARGO_ENCODED_RUSTFLAGS CARGO_BUILD_JOBS=2
RUSTC=<configured raw executable> 'RUSTFLAGS=-C target-cpu=<configured CPU> -C
panic=unwind' <configured raw cargo> test --frozen --manifest-path
src/java.base/share/native/libinstant/rust/Cargo.toml --target <configured target>
--target-dir <scratch>/rust-tests`. Encoded flags are cleared at job entry as in
the production recipe and rejected if reintroduced. Wrappers are cleared/rejected.
There is no toolchain downgrade or install.

Before a final target-only GO, the owner must inspect the retained nm/readelf/ldd
logs: one JNI export Java_java_time_InstantParser_parse0, non-executable stack,
no missing dependency or Rust runtime-library dependency. The script also captures
each image's `javap -p -c java.time.Instant`, VM flags/settings/version, CPU/OS and
compiler version. Retain full output and compare the resolved
baseline/configure-off parse instructions after removing constant-pool indexes;
the original formatter-only sequence must match. Record OS/ISA, versions and
collector availability. These explicit owner checks are not implied by a binary
filename or by the controller's partial RUNTIME-GATES-PASS label.

## Runtime correctness and frozen decisions

The causal controller freezes24 canonical timing JVMs and12 separate diagnostic
JVMs, both String modes, public/direct controls in previous/corrected/off images.
It records264million timing+warmup calls and132million diagnostic calls, not a
broad qualification. It requires exact checksums, C2 normal-entry evidence,
stability and no contradictory unchanged controls; the detailed discrimination
rules are in RUNTIME_DISABLED_AUDIT.md. Startup checks/oracles are separate.
Unchanged-work calibration requires both fork ratios in0.97–1.03 with a maximum
spread of0.03, symmetrically permitting equality and small shifts either way.
This two-fork engineering screen is not statistical proof of equivalence.
It does not relax any candidate slowdown/gain rule or the movement envelope.
A strict PASS plus unchanged fingerprinted evidence is required before full.

The full controller retains five routes/both storage modes through100308-case
oracles, native49680-hit proof, audited corpus checksums/classification, three
scratch fault variants, six actual Serial/G1/ZGC pressure runs, preboot/cold-init/
JNI_OnLoad contention and CDS. Diagnostics are separate from throughput and
cannot establish identity of timing-fork generated code. All real timing includes
public-call dispatch, input conversion, JNI, library validation/conversion and
result construction. Allocation counters cover Java allocated bytes only.

Every timing process retains all six500000-call blocks after64x125000 warmup
calls. Require max/min<=1.10, tail-three/head-three medians within5%, allocated
byte spread<=1B/op, unchanged measured compiler time across all blocks/gaps, exact
checksums and measured GC time<=10%. No printing inside the measured cohort.
Failure of stationarity/noise checks is INCONCLUSIVE; there is no pooled rescue.

* Canonical enabled >=1.5x baseline under G1/Serial/Z and >=1.25x cached Java
  under G1, with >=90% Java-allocation reduction. Both forks must satisfy each.
* Protected workloads: enabled mostly/mixed/successful fallback/syntax/calendar/
  custom under G1; mixed/fallback under Serial/Z; runtime-off and configure-off
  all seven G1 corpora. Both per-fork losses>3% are NO-GO. **Both losses>0 but
  within or straddling3% are HOLD**, even if an earlier3% acceptance would pass.
  Loss direction disagreement is INCONCLUSIVE. Positive point differences
  cannot be promoted to a claimed harmless noise floor without the unchanged
  controls; neither HOLD nor uncertainty is GO. No allocation growth>1B/op.
* Cold cohort:300 fresh JVMs (five routes xthree cases xtwo storage modes xten),
  rotated order. First public parse and whole-process medians each must remain
  within baseline+max(5%,2ms) for enabled/runtime-off/configure-off. Cached is
  reported as control. The helper timestamps blocking wait completion rather
  than a polling timeout interval. Known values/errors are checked after timing.
* Correctness, checksum, JNI warning/fatal, JVM crash or safety failure is NO-GO.
  Findings are checkpointed as they are established. NO-GO dominates HOLD, which
  dominates later INCONCLUSIVE/timeout/interruption. A later failure cannot erase
  an already demonstrated miss. Missing diagnostics/resource/cleanup uncertainty
  is INCONCLUSIVE only when no stronger established finding exists.

The runtime controller returns RUNTIME-GATES-PASS only after all its gates; this
is not final integration GO until normal-build/provenance/inspection checks are
consolidated. Exit0 denotes that partial pass,1 NO-GO,2 INCONCLUSIVE,3 HOLD. Every
sample, command, failure and checkpoint is retained; no retry-until-pass.

## Later platforms and publication boundary

After a worthwhile Linux result, supported-platform correctness uses the normal
repository CI only after separately approved PR integration. Default-off CI
alone does not exercise the new ABI; explicit opt-in native build/check coverage
needs compatible preinstalled Rust/targets and locked dependencies. No CI change,
dispatch or PR is part of this continuation. No unmanaged install is authorized.

Linux x64-v3/AArch64, macOS arm64/apple-m1 and Windows x64-v3 remain the intended
source scope. The new supervisor is for Linux stage1 only. Windows Cargo/MSVC/SDK
or macOS SDK/link/runtime behavior requires actual native testing; Unix stand-in
fixtures are not native qualification. Architecture-specific performance requires
corresponding hardware only for that later performance claim. No four-performance-
host requirement is imposed on a useful first Linux result.
