# Executable mechanism and final-code validation

Status: **source prepared and tested offline; runtime not authorized or launched**.
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
35 GiB free workspace, at most 32 PID1 zombies and at least 4,096 available
process/thread slots under kernel, cgroup and per-user limits. Readiness uses
read-only `/proc`, cgroup and filesystem accounting. No fork stress probe,
installation, privilege change or PID1 management occurs. Prerequisites are
installed GCC/G++ 16.2.0, boot JDK 27, jtreg 8.3, JUnit Jupiter and zstd 1.5.7
headers/library. Missing or ambiguous prerequisites stop this attempt.

During commands the owner checks host/PID health at most five seconds apart.
More than 64 additional PID1 zombies, fewer than 4,096 slots, less than 16 GiB
usable RAM or less than 2 GiB remaining disk stops owned work. The lower ongoing
disk floor allows admitted build outputs to consume their reserved space.
Commands use four build jobs, jtreg concurrency one and private sessions.
WNOWAIT keeps each session leader pinned through bounded TERM/KILL group cleanup;
only then is its direct child reaped. A lost identity forbids group signaling
and prevents a pass. No unrelated process is signaled or deleted.

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
XML, binaries, assembly, proofs, ledger and image/source inventories. Old campaign
evidence remains untouched. Nothing starts after the verdict.

Pure Python negative/lifecycle tests mock process launches and management. They
execute no Java, native workloads, builds, captures or timing:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s doc/cold-call-qualification/scripts/jdk27/cold-call \
  -p 'test_mechanism_*.py'
```
