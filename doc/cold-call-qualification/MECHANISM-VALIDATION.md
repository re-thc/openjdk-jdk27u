# Executable mechanism and final-code validation

Status: **local storage/staging proposal; new execution remains on hold**.
The entry point is [mechanism_validation.py](scripts/jdk27/cold-call/mechanism_validation.py).
It runs from an ordinary checkout of this JDK repository and creates isolated,
fresh Git worktrees. It never calls the historical performance runner.

Candidate release, fastdebug, regression tests and preparation helpers must be
exactly `b7534f5ccac7847a22ba7b63a6ea18beb71580e2`. The control is
`01903ba375f94c0ab7f9193d3e36bd30fe663d7e`; production codec is
`7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`. The historical `75ee82d...`
candidate image is rejected. All three images are built anew; image adoption,
incremental caches and binary transfer are unsupported.

The previous performance result remains **NO-GO**. This runner has no timing,
performance probes, expanded diagnostics, CI, publication or continuation into
another campaign. A mechanism pass cannot qualify performance.

## One future invocation

No approval receipt is supplied by this package. Independently review the
committed runner and freeze a host config based on
[MECHANISM-CONFIG.example.json](MECHANISM-CONFIG.example.json). The separately
authorized receipt must bind its SHA256, the exact runner Git commit and the
SHA256 of [MECHANISM-SOURCE-MANIFEST.json](MECHANISM-SOURCE-MANIFEST.json).
[MECHANISM-APPROVAL.example.json](MECHANISM-APPROVAL.example.json) is deliberately
unauthorized and cannot run. Populate it only after explicit execution approval
with one actual start and immutable UTC deadline exactly 7,200 seconds apart.
The expired `2026-10-17T14:31:01.403725Z` allowance is never reused.

After that single approval, the complete invocation is:

```sh
python3 doc/cold-call-qualification/scripts/jdk27/cold-call/mechanism_validation.py run \
  --config /saved/mechanism-config.json \
  --approval /saved/mechanism-approval.json \
  --approval-sha256 APPROVED_RECEIPT_SHA256 \
  --output /saved/new-mechanism-output
```

No hand-built build/test/capture commands are required. Sources, installed tools,
receipt and config must already be present in the saved environment. Paths come
solely from that frozen config. Output must be a new absolute directory outside
source/tool checkouts. An exclusive claim beside the approval prevents another
attempt using that receipt. Preserve the claim with the receipt when saving or
moving the environment. No resume, retry, deadline override or image argument
exists. `plan` only prints inert scope information.

## Fixed limits and admission

| Phase | Maximum seconds |
| --- | ---: |
| Readiness, tool provenance and exact source checkouts | 300 |
| Matched builds and image provenance | 4,800 |
| Fixed input/classes/native policy preparation | 300 |
| Six safety invocations, 15 selectors | 600 |
| Six correctness/code captures and six disassemblies | 300 |
| Final-code accounting and independent review | 840 |
| Owned cleanup and final evidence sealing | 60 |

The phase maxima sum to 7,200 seconds. Build roles have aggregate limits of
1,500/1,500/1,800 seconds including configure, images, version checks and full
image inventory. Configure is additionally capped at 180 seconds. Tests are
capped at 300 seconds each, captures at 45 and objdump at five. Phase transitions
cannot reset elapsed debits; commands use the smaller phase, role, command and
absolute UTC/monotonic remainder. Sixty seconds is reserved before new work.
Unused time cannot buy another selector, capture or attempt.

The controller's main-thread watchdog applies those same absolute bounds to
synchronous analysis, comparison, hashing and receipt processing. It checks at
most one second apart, preserves the 60-second cleanup reserve, and interrupts
CPU work even when the analyzer has no cooperative callback. Log hashes and
streamed JSON writes also check the existing command/role/phase/outer limits
between chunks. Owned launch registration and TERM/KILL/reap keep their identity
anchor; cancellation is deferred only through those critical sections while the
original outer clock remains open. Cleanup and its receipt writes share one
anchored limit of at most 60 seconds and the remaining outer time. Evidence
processing cannot renew either allowance; the first expiry pins cleanup's clock
even when an owned critical section defers cancellation. Expiry prevents a pass.

Before any external command, require native Linux x86-64, 16 GiB usable RAM,
strictly more than the 4 GiB workspace safety reserve, at most 32 PID1 zombies and at least 4,096 available
process/thread slots under kernel, cgroup and per-user limits. Readiness uses
read-only `/proc`, cgroup and filesystem accounting. No fork stress probe,
installation, privilege change or PID1 management occurs. Prerequisites are
installed GCC/G++ 16.2.0, boot JDK 27, jtreg 8.3, JUnit Jupiter and zstd 1.5.7
headers/library. Missing or ambiguous prerequisites stop this attempt.

During commands the owner checks host/PID health at most five seconds apart.
More than 64 additional PID1 zombies, fewer than 4,096 slots or less than 16 GiB
usable RAM stops owned work. Storage has a separate one-second watchdog below.
Commands use four build jobs, jtreg concurrency one and private sessions.
WNOWAIT keeps each session leader pinned through bounded TERM/KILL group cleanup;
only then is its direct child reaped. A lost identity forbids group signaling
and prevents a pass. No unrelated process is signaled or deleted.

## Sequential storage proposal

The former 35 GiB admission reservation was conservative, not an observed peak.
It cannot be met by the inspected 31.45 GiB filesystem, whose available space
was about 29.82 GiB. The original failed admission receipt remains historical
and untouched. This proposal supplies no execution receipt, retry or permission
to reuse that attempt. A later authorized execution must bind this exact new
runner commit, package manifest and frozen configuration to a new single-use
receipt; the same two-hour design and every code/safety gate apply.

The storage guard admits available capacity rather than claiming that an
estimated fastdebug build fits. It records the actual initial available bytes,
filesystem device/capacity, filesystem used bytes, latest/minimum free space
and peak observed net consumption. Its observed net-consumption allowance is
`initial available - 4 GiB`; unrelated writes also consume it. At or below
4 GiB available, changed/unavailable filesystem accounting, or a guard error,
new work stops with INCONCLUSIVE_INFRA. A recovery in free space cannot reopen
the stopped attempt. No fixed per-role size or guessed fastdebug minimum is
presented as a proven bound.

The existing main-thread watchdog forces a storage probe on each one-second
timer tick, including synchronous analysis, inventory, object hashing and JSON
writes. Cooperative checks reuse a sample for at most one second; command/host
checks force another probe. The 4 GiB threshold is an explicit conservative
stop buffer for outstanding writes from four build jobs, TERM/KILL/reap and
small evidence/receipt writes. It is not a measured worst-case write burst or
a guaranteed successful build envelope. A burst between probes, blocked I/O or
unexpected fastdebug size may still exhaust storage and stop this attempt;
none permits a pass, continuation, retry or expanded allowance. The first
storage failure pins the same at-most-60-second cleanup clock. Only owned
launch/cleanup critical sections may defer cancellation. Final cleanup receipt
writes bypass the *work* space floor while retaining the original time bounds.
`/tmp` is not counted as independent workspace capacity or used for build staging.

Each role gets an exclusively created empty `build/mechanism` in its fresh
worktree, with an immutable ownership receipt containing run/role identities
and directory device/inodes. Roles still build serially with four jobs. After
successful images, exact source checks, version/spec validation, full image
inventory and all sealed-log verification, a separate `image-seal-ROLE.json`
binds the complete image, ownership, approval, specification and command records.
No compaction begins before that receipt is saved, hashed and all seals are
verified again, with every owned process reaped.

Compaction removes only private regular `.o` and `.gch` files below these two
newly generated directories:

- `build/mechanism/hotspot/variant-server/libjvm/objs`
- `build/mechanism/support/native`

The immutable object manifest records relative paths, identity, allocated bytes
and SHA256 before unlinking. Every deletion rechecks ownership, uses anchored
directory descriptors without following symlinks, rejects hardlinks and verifies
the planned file identity. No pre-existing build directory can be adopted.
Complete images keep their original paths and are reverified before and after
compaction. Sources, specifications, debug sidecars, classes, generated sources,
all logs and command/dependency records are retained. Only successfully sealed
roles are compacted; a failed/interrupted seal preserves every object. An
interrupted compaction retains its plan/progress, stops the campaign and cannot
resume. No storage-triggered deletion of existing setup files or failed-role
artifacts is attempted, including during final cleanup.

This intentionally narrow compaction removes the dominant native object/PCH
cost while retaining other reproducible outputs as well as all unique evidence.
For role build footprints `F`, discarded object bytes `O`, source footprint `S`
and evidence `E`, peak space is approximately
`S + E + max(F_base, F_base-O_base+F_release,
F_base-O_base+F_release-O_release+F_debug)`; directory/temporary/linker overhead
is additional and governed by live free space. Objects are discarded before
the next role begins, within the same role/4,800-second build caps. The unknown
fastdebug footprint remains a possible controlled infrastructure stop.

## Frozen work and evidence

Normal server features and warnings as errors are required. Release configurations
match exactly; fastdebug differs only in debug level. The runner records compiler
subprograms, boot/jtreg inventories, environment, configure argv, spec, source
heads and clean status. GCC's selected linker, including a frozen `-fuse-ld`/`-B`
selection, must agree with spec LD/LDCXX/AS and linker arguments. A linker prefix
cannot substitute compiler or assembler binaries. Every image file is inventoried, including modules,
release metadata and libjvm. Required repaired source bytes, helpers, tools,
config, approval, classes, inputs and accepted logs are sealed and rechecked.

Preparation uses the unchanged 37-file source corpus (764,896 bytes, SHA256
`dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9`), 19 factory
inputs and exactly 57 level-1/3/9 frames. It compiles the exact pinned checker and
native policy library. The wrapper records the actual mapped zstd library hash;
it adds no inputs, timing or retry. Header and loaded-library readiness are
verified during preflight before any build, and preparation must use the same
admitted library identity.

The six safety suites are control pressure/spilling (2), release focused (3),
release enabled pressure/spilling (2), fastdebug focused (3), fastdebug enabled
pressure/spilling/register verification (3), and fastdebug handshake/Unsafe (2).
Focused drivers retain their own default/off/on and activation/negative cases;
the runner does not globally enable their feature. Every selector needs its own
passed JTR and exact passed-count summary. Missing/skipped tests fail closed.

Exactly six 57-frame, 32-round checker captures run: release base/default/off/on
and fastdebug off/on. They retain G1/C2, batch compilation, no OSR, threshold
scaling 0.1, method-scoped assembly, XML, fastdebug TraceSpilling and register
verification. The final normal-entry C2 compile ID must match XML and assembly
and retain the returning `readPartialLong` call at BCI 684. Objdump must decode
every contiguous main-code byte. There are no source-trained timing captures.

The analyzer discovers packed roots at BCIs 360/373/386 and checks their
deferral/Phi/pressure provenance. It enumerates complete all-root CFG cycles and
all MOV/CISC stack, register-class, call/refill and frame traffic. It lists actual
relocation normalization without erasing arbitrary constants. Base, default and
off code must match after that normalization. The sealed historical
[19-store path reference](MECHANISM-REFERENCE-STORES.json) is attribution evidence,
not a new timing observation. An unmappable reference, incomplete CFG, unknown
stack effect, absent activation or missing frequency remains inconclusive.
Every old store and replacement transport stays in the ledger. Trace activation
or smaller code alone cannot pass; recreated/compensating hot transport fails.

Implicit stack work is also an acceptance gate. Push/pop/call/return operations
and their byte counts, frame allocations, matched common-path traffic and debug
frequency-weighted traffic must not increase. Newly introduced or increased
frame work rejects advancement even if explicit stores decrease. Debug's
combined explicit-plus-implicit weighted cost must improve. Ambiguous frame
widths, allocations or path mappings stay inconclusive, and semantic review
cannot waive these gates.

If every mechanical gate passes, or only the explicitly listed semantic store
bindings remain open, the runner writes `review-request.json` and waits within
the same 840-second review phase for independent `review.json`:

```json
{
  "schema": 1,
  "kind": "cold-call-mechanism-review",
  "run_id": "THE_APPROVED_RUN_ID",
  "request_sha256": "SHA256_OF_THE_EXACT_REVIEW_REQUEST",
  "decision": "ACCEPT",
  "reviewer": "Independent reviewer identity",
  "reason": "Evidence-bound final-code assessment"
}
```

The reviewer may choose ACCEPT, REJECT or INCONCLUSIVE. This reviews completed
evidence; it is not another execution approval or a command-assembly step. If
semantic bindings remain, the request contains an automatically prepared
`semantic_review_template`. ACCEPT must include the completed template under
`semantic_review`: every listed old store needs a removed/moved/retained
disposition, exact replacement instruction PCs, value-flow evidence and path
evidence, plus explicit review of all replacement transport. The validator
requires the exact ledger/capture hashes, every row once, real operand PCs and
all other mechanical gates true. It writes a separate reviewed ledger and keeps
the original. Unchanged opcode/register text alone is not value-flow proof.

The receipt cannot waive a mechanical gate or supply missing captures. Missing,
late, malformed or mismatched review cannot pass. Other adverse/incomplete
mechanical results are retained immediately without waiting for review to fix them.

## Results and offline checks

`campaign.json` ends with `MECHANISM_PASS`, `MECHANISM_NO_GO` or
`INCONCLUSIVE_INFRA` only after owned cleanup and final sealing. A pass requires
every provenance, safety, activation, equivalence, transport and review gate.
Completed safety/code regressions fail. Readiness, build, budget, cleanup or
ambiguous evidence failures are inconclusive. Preserve receipts, logs, reports,
XML, required image/native/capture binaries, assembly, proofs, ledger and image/source inventories.
The discarded reproducible object/PCH identities remain in their manifests. Old campaign
evidence remains untouched. Nothing starts after the verdict.

Pure Python negative/lifecycle tests mock process launches and management. They
execute no Java, native workloads, builds, captures or timing:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s doc/cold-call-qualification/scripts/jdk27/cold-call \
  -p 'test_mechanism_*.py'
```
