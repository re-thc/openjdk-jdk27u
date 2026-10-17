# Cold-call spill review: source repair and one bounded continuation

**Current status: the completed qualification of candidate
`75ee82dff6f86e41aad8cedfe947a90a2b9296df` is NO-GO.** The build-blocked stage
and bounded continuation described below are historical. The inherited runner
and `SOURCE-MANIFEST.json` still pin that old candidate and preserve the expired
original allowance; they must not be used to validate or relabel the Phi repair.
The separate [future validation plan](FUTURE-VALIDATION-PLAN.json) binds the new
production revision explicitly. It is source-only, leaves execution on hold,
and supplies no new budget or deadline. Existing evidence and gates remain
unchanged.

The next proposed action has a separate executable
[bounded mechanism/code-quality runner](MECHANISM-VALIDATION.md), a
[fixed scope and job registry](MECHANISM-VALIDATION-PLAN.json), and a
[complete source inventory](MECHANISM-SOURCE-MANIFEST.json). It excludes timing,
builds the repaired revision from fresh worktrees, and requires a healthy
admitted host plus one separately frozen execution receipt. Publishing its source
does not authorize or launch it.

Publication supplies source and instructions only. **No build, Java compilation,
test, code capture, timing retry, installation, CI, PR or default change is
authorized by publishing this branch.** Use only the new entry point above for a
future approved mechanism check. The rest of this document preserves historical
75ee82d campaign instructions and expired budgets; its commands are not a route
to validating b7534f5. The completed measured result remains NO-GO.

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
provenance. The portable runner also includes its offline Python tests. The full production codec and corpus factory remain pinned to
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

The runner prepends the configured boot JDK's `bin` directory to the effective
PATH, including when jtreg launches Java. It records both the supplied config
hash and effective configuration; no old host path or temporary owner script is
required.

Clear inherited `JAVA_TOOL_OPTIONS`, `JDK_JAVA_OPTIONS`, `_JAVA_OPTIONS`,
`MAKEFLAGS`, `JAVA_HOME`, `CLASSPATH`, `CC`, `CXX`, `CFLAGS`, `CXXFLAGS`, and
`LDFLAGS`; the runner does this before applying the frozen environment. Its GCC
16 directory must select both C/C++ compilers and the matching runtime/linker
setup. No broad warning flag, feature-subset VM, PGO, custom runtime overlay,
new seed, longer warmup or workload replacement is allowed.

## One proposed continuation: four hours total, no retries

This is the **same already-started approved continuation**, including an
approved fresh-environment preparation repair. Its original start is
**2026-10-17T10:31:01.403725+00:00** and its immutable deadline is
**2026-10-17T14:31:01.403725+00:00**. Source publication, a new checkout, a
new process or a replacement host never starts a new four-hour allowance.
`plan` is inert after expiry; `run` refuses expiry before creating output or
launching any command. No CLI/config/environment deadline override exists.

The task-specific clock maps the fixed UTC deadline to the current boot's
monotonic clock once, and uses the smaller UTC/monotonic remainder thereafter.
The unified runner shares that clock through builds, provenance, both review
gates and the four diagnostics. It never consumes old-host monotonic values or
reconstructs elapsed time from log mtimes. Trusted, correctly synchronized UTC
on a fresh host is a prerequisite; standalone diagnostics reject an observation
older than their parent. Every command's existing GNU timeout is bounded by
this remainder and its stage cap, reserving ten seconds inside the original
allowance for termination cleanup. Expiry, EOF, a stale review or any failed gate
stops; no partial-directory resume or automatic retry exists.

Owned-command cancellation retains the direct session leader with `waitid` /
`WNOWAIT` until TERM and unconditional KILL have been sent to its group. A leader
that exits promptly cannot cause a TERM-ignoring descendant to escape cleanup.
The unreaped leader pins group identity; after releasing that anchor the runner
never signals its numeric group again. Cleanup is one-shot within the existing
ten-second reserve. TERM/INT received during launch are deferred until ownership
registration, without passing a blocked signal mask to the executed command.

All preparation, manual review and cleanup remain inside the same original
14,400 seconds. The following stage limits are maxima, not new entitlements:

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

After the approved fresh host passes independent review, run once from the
prepared, committed clean codec checkout, using an entirely new output path:

```sh
python3 scripts/jdk27/cold-call/qualification_campaign.py plan \
  --config "$FROZEN_HOST_CONFIG"
python3 scripts/jdk27/cold-call/qualification_campaign.py run \
  --config "$FROZEN_HOST_CONFIG" --output "$NEW_OUTPUT"
```

This single `run` performs all three fresh builds, full provenance, preparation,
15 safety selectors and six captures. Before **any** timing it writes
`pre-timing-review-request.json` and `pre-timing-review.template.json`, then
waits on stdin. Review the requested code/activation/transport evidence, copy the
template to a separate local JSON, fill its reviewer/notes and every boolean
check, and select `CONTINUE_FIXED_ENSEMBLE` only when they pass. Submit the
completed JSON's path on stdin. EOF, STOP, missing/false checks, a mismatched
request hash or expiry stops. No prewritten approval token bypasses evidence.
Full image/class/input/log identities are rechecked after the review.

After the unchanged 81-process ensemble and 18 separate resource cases, the
same runner automatically runs the four fixed diagnostic captures once,
regardless of gain or loss. Do not invoke the diagnostic script again. It then
writes the corresponding `final-review-request.json` and template, waiting for
an evidence-bound `GO`, `NO-GO` or `INCONCLUSIVE` review JSON path. Both review
waits share a total twenty-minute maximum. GO additionally requires complete
counts/diagnostics and the executable frozen numerical/resource gates; a human
review cannot override a failed automatic gate. The owner must still review
all-path transport, method-set/code/profile equivalence and the declared limits.
A completed review records `complete-owner-verdict`; no PR, CI, merge or default
change follows automatically. Pending review never counts as qualification.

The runner inventories every regular file/symlink in all three images and all
compiled classes, hashes the production sources/factory, validates all 57 frame
rows and timed inputs, preserves generated specs and installed tool identities,
and rejects changed provenance before/after review. All such records remain in
`NEW_OUTPUT`, outside the source checkout; none is included in publication.
No binary, raw-log, host-data or private-artifact handoff is part of setup.

Offline checks are standard-library only and launch no build, Java, Git or
benchmark subprocess:

```sh
python3 -B -m unittest discover \
  -s "$JDK_SOURCE/doc/cold-call-qualification/scripts/jdk27/cold-call" \
  -p 'test_qualification_campaign.py' -v
```

`plan` remains inert. Publication authorizes no campaign on the unhealthy host.
Nonzero exit, timeout, missing marker, identity/profile mismatch, skipped test,
semantic mismatch or exhausted cap stops and retains evidence. No compiler
substitution, warning fallback, seed retry or sample replacement/expansion is
included. Existing stopped-attempt evidence stays on its original host.

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

## Reviewed preparation-only jtreg continuation

The portable [continuation instructions](scripts/jdk27/cold-call/RESUME-PREPARATION.md)
cover only the exact `installed-jtreg-version` stop before any safety/capture/measurement
workload, after all three builds and full image inventories completed. The stopped
parent and its source checkout remain immutable. A separately reviewed local receipt
binds every original image/configuration/evidence identity without publishing host
metadata. The only environment correction is explicit `JTREG_JAVA` selection of the
same installed boot JDK 27. No build repeats, deadline renewal, measurements before
review release, changed matrix, unreviewed resume or publication of host records is
authorized. The unchanged original **2026-10-17T14:31:01.403725+00:00** deadline, stage
budgets, two evidence-bound reviews and numerical/resource gates still apply.
