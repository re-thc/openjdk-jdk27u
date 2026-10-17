# Cold-call spill review: source repair and one bounded continuation

Publication supplies source and instructions only. **No build, Java compilation,
test, code capture, timing retry, installation, CI, PR or default change is
authorized by publishing this branch.** Execute the proposal below only after a
separate explicit execution approval. The failed attempt remains
`INVALID_BUILD_BLOCKED`, integration `HOLD`; the performance hypothesis remains
unresolved. A failed build is neither allocator falsification nor a slowdown.

## Identifiable repair and identical comparison treatment

The independent common-source repair is commit
`01903ba375f94c0ab7f9193d3e36bd30fe663d7e`, directly on original base
`89885a6288e7aaabd01678a704a586272c0f96e3`. It is an exact backport of
[OpenJDK JDK-8391051, commit 51bb52c5c0a5a764dd080dc23bed0829fd0ae638](https://github.com/openjdk/jdk/commit/51bb52c5c0a5a764dd080dc23bed0829fd0ae638):
four additions in `src/hotspot/share/runtime/javaThread.inline.hpp`, scoped
diagnostic push / nonnull-ignore / explanation / pop. The local and upstream
diff hunks match byte for byte; stable patch ID
`3e34f4c8381f674c5f8fb7c00f790a825f4b0ae4`. No semantic null check, assertion
removal, global suppression, compiler downgrade or allocator edit is included.

The failed object was `hotspot/variant-server/libjvm/objs/handshake.o`:

```text
javaThread.hpp:1013:29: error: 'this' pointer is null [-Werror=nonnull]
```

GCC diagnosed `JavaThread::cast` through `UnsafeAccessErrorHandshakeClosure`
while inlining into the unmounted virtual-thread callback path. The actual
unsafe-error callback keeps its current-thread assertion and handler. This
matches the known upstream handshake repair; no simdutf-specific connection or
independent reduction of the exact GCC optimization defect is claimed.

Merge commit `75ee82dff6f86e41aad8cedfe947a90a2b9296df` combines the original
C2 candidate `f9ad708bea04f806b811a724f746e54353c95121` with the exact standalone
repair, preserving both commits in ancestry. The runtime prerequisite is the
only tree change from that C2 candidate. The subsequent documentation commit
does not change the frozen build revisions:

| Future image | Exact source commit | Policy |
| --- | --- | --- |
| Control release | `01903ba375f94c0ab7f9193d3e36bd30fe663d7e` | Original allocator plus common repair |
| Candidate release | `75ee82dff6f86e41aad8cedfe947a90a2b9296df` | Default/off/on use this one image |
| Candidate fastdebug | `75ee82dff6f86e41aad8cedfe947a90a2b9296df` | Same common repair and prototype |

Use the same already installed GCC **16.2.0**, boot JDK 27, dependencies,
linker/configuration and four build jobs on every side. Preserve
warnings-as-errors. No GCC downgrade or alternate compiler is part of this
proposal. No compiler, JDK, native library, test framework or disassembler is
downloaded or installed during execution. The diagnostic allocator flag remains
default-off, with the same provisional strict ten-times frequency margin.

## Preserve the old images; rebuild every compared image

The completed original release images remain untouched, with their original
source identities. Their `lib/server/libjvm.so` SHA256 values are:

| Original source | JVM SHA256 |
| --- | --- |
| `89885a6288e7aaabd01678a704a586272c0f96e3` | `58bc9f058658c40ae164c4c0a0925cdd2ad03077622cee00e28182befc19524a` |
| `f9ad708bea04f806b811a724f746e54353c95121` | `235656946f85e5e25de3542f44087d5ae635e3732686d3793419cb04de521d08` |

Keep their logs, manifest, release/spec metadata and inventories locally as
evidence of the stopped attempt. Do not upload those raw host records or any
binary/image. No old image is relabeled as a repaired source head.

This proposal rebuilds **all three** images from fresh ordinary detached
worktrees. It does not reuse either old release binary for the new comparison,
copy libraries into an image, use `-XXaltjvm`, mix original/repaired identities,
or mix toolchains. Although the repair is diagnostic-only, source equivalence
does not establish rebuilt machine-code identity. Both release configurations
must match; fastdebug changes only debug level. Every new image gets its own
exact source head, `release`, `spec.gmk`, compiler/linker version, build commands,
log hashes and JVM hash. No base-fastdebug result is inferred from the original
candidate-fastdebug failure.

## Ordinary checkout setup before execution approval

The small source bundle under `scripts/jdk27/` contains the existing frozen
qualification workloads, adapted only for the repaired revisions, tighter caps,
two prerequisite tests and a preparation-only frame helper. It includes no
captured output, host configuration, binary or private artifact dependency.
[SOURCE-MANIFEST.json](SOURCE-MANIFEST.json) records its source hashes and
provenance. The full production codec and corpus factory remain pinned to
`re-thc/jzstd` commit `7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`.

With ordinary Git checkouts available, prepare a clean source checkout:

```sh
# JDK_SOURCE: checkout of this published review branch, with both build refs.
# CODEC_SOURCE: ordinary checkout of re-thc/jzstd; no production-source edits.
git -C "$CODEC_SOURCE" checkout --detach 7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6
cp -R "$JDK_SOURCE/doc/cold-call-qualification/scripts/jdk27/." \
  "$CODEC_SOURCE/scripts/jdk27/"
git -C "$CODEC_SOURCE" add scripts/jdk27
git -C "$CODEC_SOURCE" -c user.name='Harry Chan' \
  -c user.email='38070640+re-thc@users.noreply.github.com' \
  commit -m 'Freeze published repaired cold-call qualification sources'
```

Use a separate codec worktree if an existing checkout has other work. Review the
copied source diff: only qualification sources may change. The runner verifies
production sources and `ComprehensiveRoundTripTest.java` against the pinned
codec commit. Record the local qualification-source commit and published JDK
documentation commit before execution. These source setup commands are not
benchmark execution and do not fetch a private binary.

Copy `qualification-host.example.json` to a local file outside both source
worktrees. Replace its placeholder paths with already installed tools and add
only the dependency/environment/configuration choices needed for the normal
server build. Freeze and hash that file **before execution approval**. The same
configuration is used for all three builds. Confirm the existing native
libzstd/header version is **1.5.7**, jtreg **8.3**, and the existing JUnit jar is
available; a missing prerequisite stops instead of downloading it. Set the JDK
source location to the published review checkout, which must contain both exact
build commits. Do not use a host snapshot from another run as implicit setup.

Clear inherited `JAVA_TOOL_OPTIONS`, `JDK_JAVA_OPTIONS`, `_JAVA_OPTIONS`,
`MAKEFLAGS`, `JAVA_HOME`, `CLASSPATH`, `CC`, `CXX`, `CFLAGS`, `CXXFLAGS`, and
`LDFLAGS`; the runner does this before applying the frozen environment. Its GCC
16 directory must select both C/C++ compilers and the matching runtime/linker
setup. No broad warning flag, feature-subset VM, PGO, custom runtime overlay,
new seed, longer warmup or workload replacement is allowed.

## One proposed continuation: four hours total, no retries

This is one new, separately approved continuation at repaired revisions, not a
resume of the invalid exact-revision attempt. Its **14,400-second total**
includes new worktree checkout/configuration, all three builds, preparation,
tests, captures, measurements, review and cleanup. Do not add a two-hour
prerequisite run or a second campaign before/after it. The owner starts and
maintains an outer four-hour budget before the runner, recording elapsed and
remaining time through diagnostics, manual review and cleanup. The runner uses
internal monotonic command caps; the separate diagnostic helper reconstructs
elapsed wall time from the original log mtime. Manual review is owner-managed.
The owner enforces the remaining outer budget across these mechanisms and stops
owned work at expiry. The global cap wins; local maxima are not entitlements.

| Stage | Maximum |
| --- | ---: |
| Three fresh normal builds, including checkout/configuration | 159 minutes |
| Build subcaps: control release / candidate release / fastdebug | 45 / 45 / 60 minutes |
| Each configure, included in build stage | 3 minutes |
| Corpus and helper preparation | 5 minutes |
| Safety, including both new prerequisite tests | 15 minutes |
| Production activation/correctness captures | 5 minutes |
| Fixed paired throughput ensemble | 20 minutes |
| Compilation-resource protection | 10 minutes |
| Four fixed source-profile diagnostics | 3 minutes |
| Manual all-path/code/resource/statistical review | 20 minutes |
| Final accounting and cleanup | 3 minutes |

The top-level stage caps sum to four hours. Four build jobs; one otherwise idle
Linux x86-64 host with at least 16 GiB RAM and 25 GiB free disk; one timed JVM at
a time; jtreg concurrency one. Explicit measurement-stage caps remain
**38 minutes**, below the previous 45-minute ceiling. Unused time cannot buy
extra repetitions. A fixed termination grace of at most ten seconds is for
cleanup only, never new measurements. No PMU, JFR, affinity/governor mutation,
remote execution, CI, PR, merge or default change is included.

After explicit approval, run once from the prepared, committed clean codec
checkout, using an entirely new output path:

```sh
python3 scripts/jdk27/cold-call/qualification_campaign.py plan \
  --config "$FROZEN_HOST_CONFIG"
python3 scripts/jdk27/cold-call/qualification_campaign.py run \
  --config "$FROZEN_HOST_CONFIG" --output "$NEW_OUTPUT"
# Only after execution-complete-review-required, regardless of gain or loss:
python3 scripts/jdk27/cold-call/capture_timed_profile.py "$NEW_OUTPUT"
```

`plan` is inert. Do not run `run` or the diagnostic script in this publication
phase. The existing command-boundary budget uses installed GNU `timeout`; no
new generic deadline infrastructure is introduced. Each command runs once.
Nonzero exit, timeout, missing marker, identity/profile mismatch, skipped test,
semantic mismatch or exhausted cap stops and retains the complete evidence.
No compiler substitution, warning fallback, partial-directory resume, sample
replacement/expansion, seed retry or timing continuation after a failed gate.
No new execution permission is implied by a successful source publication.

## Required evidence and unchanged decision gates

Follow [PROTOCOL.md](PROTOCOL.md) in order. The three existing policy tests run
on candidate release and fastdebug; the five allocator-suite invocations total
13 allocator tests including strong GC/deoptimization/base/derived, mask,
calling-convention, frame-pointer, scheduling/FPU and fixed-register negatives.
The two added fastdebug tests are
`runtime/handshake/AsyncHandshakeWalkStackTest.java` and
`runtime/Unsafe/InternalErrorTest.java`, once together with the image's own
launcher and no globally enabled allocator flag. All **15 selected tests** must
pass; their existing nested runs and probes remain intact.

Use all 57 fixed native frames, then six normal-image captures. Tie production
activation to the same final entrant normal C2 compile ID and retained
`readPartialLong` call at BCI 684. The four predeclared diagnostics use the
actual timing source/frame/profile and are never extra rate samples. Manually
account for moved transport over the hot cycle and refill/call siblings, CISC
operands, XMM moves, frame size, argument/return/Phi handling and all hot stores.
Fewer hot MOVs alone do not prove a throughput gain or disappearance of costs.

Keep the exact source/periodic/incompressible L1 frames, six primary pairs,
three secondary/encoder pairs, identical-image A/A, native same-frame controls,
81 total timing processes, 18 separate resource processes, eight-second Java
warmup and five 700-ms windows. No assembly/allocator tracing during rate
samples. Compilation-event logging and MXBean checks retain their declared
limits; no invalidated or unsettled target supplies a sample. Preserve encoder
correctness/identical compressed outputs without the separately stopped encoder
active-frame experiment. Protected code, frame bytes, output hashes and final
compile identities must match the specified cells.

GO requires primary median on/off at least **1.03**, paired-bootstrap lower
bound above **1.00**, A/A within **0.98-1.02** with interval including 1.00,
secondary/encoder medians at least **0.98**, and off/control medians at least
**0.99**. Any protected interval wholly below 1.00 rejects success. No new
compilation failure/retry/extra target allocation attempt; final-parser task
time at most max(5%, 10 ms) higher and arena peak at most max(5%, 1 MiB) higher;
javac wall/CITime/RSS/arena medians at most 5% higher. Distinguish arena chunk
capacity from live allocations and process RSS from compiler memory. Missing
or noisy evidence is inconclusive. Compare matched method sets and outliers.

Report GO / NO-GO / INCONCLUSIVE only after manual review, with inverse-rate
same-frame time-gap accounting and residual gap. No result automatically
publishes a PR or changes defaults. The old approximately nine-percent
time-gap contribution is a historical hypothesis, not a release claim. This
publication establishes a supported build prerequisite and reproducible
continuation instructions; it supplies no new performance evidence.
