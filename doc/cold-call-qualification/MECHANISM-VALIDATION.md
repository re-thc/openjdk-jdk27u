# Proposed mechanism and code-quality check

Status: **prepared, not authorized or launched**. The
[command manifest](MECHANISM-VALIDATION-PLAN.json) is inert data, not an execution
entry point. It binds candidate release, candidate fastdebug, regression tests
and qualification helpers to
`b7534f5ccac7847a22ba7b63a6ea18beb71580e2`, control release to
`01903ba375f94c0ab7f9193d3e36bd30fe663d7e`, and production codec to
`7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`.

The purpose is to decide whether the repaired allocator actually changes the
decoder's final spill placement usefully. No throughput experiment is included.
The previous measured result stays **NO-GO**. A mechanism pass only supports a
later proposal for performance qualification; it is not a GO, PR, merge or
default-change decision.

## One proposed bound

The proposed outer cap is **7,200 seconds**, including source preparation,
build/reuse verification, tests, captures, review and owned cleanup. This is a
new proposal requiring explicit execution authorization, not an extension of
the expired `2026-10-17T14:31:01.403725Z` allowance. No deadline is assigned by
this document. On release, record one immutable UTC deadline and corresponding
monotonic deadline; every command and review uses the smaller remainder.

| Phase | Maximum seconds | Fixed scope |
| --- | ---: | --- |
| Readiness and source freeze | 300 | Host, tools, exact checkouts/configuration |
| Build or verified reuse | 4,800 | Base release 1,500; candidate release 1,500; fastdebug 1,800 |
| Prepare | 300 | One 57-frame input set and exact native policy library |
| Safety | 600 | Six jtreg invocations, 15 selected tests |
| Capture and disassemble | 300 | Six correctness/code captures, once each |
| Final-code accounting and review | 840 | Evidence-bound all-path review and verdict |
| Cleanup | 60 | Owned command groups and direct children only |

Per-build limits include configure and provenance verification. Configure has
an additional 180-second command cap; the images command is bounded by the
remaining role/phase/outer limits. Tests have 300-second individual ceilings,
captures 45 seconds and objdump 5 seconds, all subordinate to the phase cap.
Unused time never buys another capture, corpus, selector or measurement.

The earlier fresh builds took approximately 22.6, 21.5 and 28.1 minutes. The
80-minute build allowance therefore accommodates one comparable fresh build
set without assuming incremental reuse succeeds. A timeout or preparation
failure stops this exact attempt; no repair/retry or longer allowance is
implied. Do not start if the reserved cleanup time cannot remain available.

## Host and reuse gate

Require native Linux x86-64, at least 16 GiB RAM and 35 GiB free workspace, with
the already installed GCC/G++ 16.2.0, boot JDK 27, jtreg 8.3, JUnit and zstd
library/headers 1.5.7. The larger disk floor accounts for approximately 20 GiB
of build outputs, source trees, captures and a reserve. Missing prerequisites
stop; there is no installation, compiler substitution or binary handoff.

Before admitting any build/test process, read process/cgroup/rlimit headroom and
establish a healthy process-reaping baseline. At most 32 initial PID1 zombies
and at least 4,096 available process slots are required. Missing or ambiguous
headroom is a stop, not permission to raise a limit. Monitor PID1 zombie growth
and process capacity in the owner process every five seconds and at command
boundaries; more than 64 additional PID1 zombies, insufficient headroom or a
fork/reaping failure stops the owned work. No PID1 cleanup, security change,
unrelated signaling or stress/fork probe is part of the check.

All workloads are serial. Builds use four jobs; jtreg uses concurrency one.
The execution owner must retain exact command ownership and reap its direct
children. Use the previously reviewed held-session-leader cleanup discipline:
keep the leader identity pinned until bounded TERM/KILL cleanup finishes, never
signal a recycled group, and record cleanup outcomes. Do not invoke the old
qualification runner, whose candidate pin, clock and timing matrix belong to
the completed campaign.

Existing build material is usable only after the host gate passes:

- An image already built at the exact required revision may be adopted only
  after verifying clean source, full image inventory, `release` source identity,
  `spec.gmk`, configure arguments, tool/linker/boot identities and hashes, and
  successful build logs. A library hash alone is insufficient.
- An older candidate build can supply an incremental cache only in an
  independent scratch tree. Record the old and new source identities, verify
  absolute source/dependency paths and configuration, run the complete `images`
  target at the new revision, and prove changed allocator objects were rebuilt.
  Seal the new image and metadata. Never relabel the old image or transplant a
  new `libjvm.so` into it.
- The retained campaign worktrees, images, configurations and logs remain
  untouched. Cloning a cache must preserve isolation and disk headroom; do not
  assume reflink support or create a hard-linked writable build. If safe reuse
  cannot be established, use an ordinary fresh checkout/build within the same
  cap. Do not move old binaries to another host.

The retained local candidate images identify `75ee82d...`, not the repaired
revision. They are not valid candidate images for this check. Their exact
inventories and the current host admission result belong in the local readiness
receipt, not in this portable source package. No reuse has been performed.

## Fixed execution matrix after release

Resolve the manifest's path placeholders from a newly frozen local host config.
Preserve identical release configure/dependency/compiler/linker arguments and
normal server features; fastdebug differs only by debug level. `JTREG_JAVA` and
effective PATH must select the installed boot JDK for jtreg. Clear inherited
Java/compiler flags as in the reviewed protocol. Record all resolved argv,
working directories, environment/config hashes and exact source heads before
launch. There are 29 command templates; adopted builds need explicit verified
reuse records in place of the corresponding checkout/configure/build jobs.

Prepare the unchanged 37-file source corpus (764,896 bytes, SHA256
`dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9`), its
19 existing factory inputs and 57 level-1/3/9 frames. The exact bundled
`qualify_decoder.py prepare` compiles production/checker classes and prepares
these inputs. Hash every class/input/frame. Suitable existing input bytes can
be adopted only with the same complete hashes; no new seed or corpus is used.
Compile `libColdCallSpillPolicy.so` from the repaired header and native test
with installed G++16 and warnings as errors. No throughput probe is compiled.

The six safety invocations preserve the existing 15 selectors:

| Image/suite | Selectors |
| --- | ---: |
| Base release: C2 integer pressure and exception spilling | 2 |
| Candidate release: policy, placement, derived pointers | 3 |
| Candidate release enabled: existing pressure/spilling | 2 |
| Candidate fastdebug: policy, placement, derived pointers | 3 |
| Candidate fastdebug enabled: existing tests plus register-allocation verification | 3 |
| Candidate fastdebug: handshake/Unsafe prerequisites | 2 |

Do not globally enable the feature for the focused drivers. Their nested
default/off/on, GC, deoptimization, exception, monitor, CAS, fixed-mask,
derived/base movement and scheduling/FPU cases remain intact. The repaired
placement driver must also pass its three-root/two-join/six-boundary activation
oracle and negative oracle cases. No skip or absent marker counts as success.

Run exactly these six `DecoderQualification check` processes, each checking
all 57 frames for 32 fixed rounds with reusable and allocating output:
release base/default/off/on, and fastdebug off/on. Use the existing COMMON
G1/C2 flags, `-Xbatch`, no OSR and threshold scaling 0.1. Record compilation XML
and method-scoped assembly; scope `TraceSpilling` to the target on fastdebug and
retain register-allocation verification. Disassemble the six final main-code
byte ranges once with the bundled extractor and installed objdump.

No `CodecProbe`, timed windows, native throughput process, encoder diagnostic,
source-trained timing capture, sampling profiler or timing ensemble is included.

## Activation and final-coloring evidence

For each capture select the final entrant **normal-entry C2**
`BlockDecoder::decodeSequencesRolling` nmethod. Its assembly compile ID must
match XML; retain every target task, allocation attempt, retry/failure and final
task status. The returning in-loop `readPartialLong` call at BCI 684 must remain.
No earlier compilation, OSR body or synthetic fixture substitutes for it.

In that final fastdebug compilation, identify the three real `loadL` nodes
from their JVMState bytecode positions: `llEntry` 360, `ofEntry` 373, `mlEntry`
386. Node and block numbers are discovered, not fixed to the old trace. All
three must have actual `CCDEFER` records and connected accepted Phi placements
covering the two hot joins, with complete input/state/provenance/cost records.
Off must have no deferral/placement records. Inspect every applicable pressure
boundary; do not impose the synthetic fixture's scheduling-specific six-boundary
count on the production decoder. Its final placement is the acceptance test.

Follow these values through PASS2 copies, coalescing, all subsequent allocation
attempts and final machine operands. A first-attempt UP trace followed by hot
spilling during final coloring fails. Report precisely where each value lives
on each normal, refill, returning-call, uncommon-trap and loop-backedge path.

Release base/default/off must have equivalent target code and allocation/frame
behavior after documented relocation normalization. Normalize only actual
relocations and identified local control-flow/polling-PC references, with each
case listed; never mask arbitrary constants. Any unexplained difference stops
the mechanism claim. Confirm the same parse/inlining/branch shape across the
matched captures. If the current off cycle cannot be mapped to the retained
19-store cycle, report inconclusive attribution rather than choose a new slice.

## Required transport ledger and verdict

The review must account for **every one of the 19 prior hot-cycle stores**.
Give each old store a row with value/slot, method-relative instruction offset,
compiler node/block, path and frequency, then identify its final replacement or
explain why it remains necessary. Cover the complete within-word and cross-word
cycles and every refill/call sibling. List new traffic even if it belongs to a
different value; a replacement spill cannot disappear from the accounting.

Count loads/stores in MOVs and CISC arithmetic operands, argument/save/restore
traffic, Phi reconciliation, GPR/XMM transport, stack-to-stack sequences and
prologue/epilogue effects. Report both per-path static counts and complete
frequency-weighted counts. Charge a copy at the frequency of its actual
insertion block, including extra executions before a conditional terminator.
Use the same 2-load/1-store provisional allocator weights, and show register/XMM
moves separately. These weights and compiler frequencies are not hardware-cycle
measurements. Avoid double counting moved stores or amortizing cold work away.

Record main-code size, frame/stack size, total instructions, all stack operands,
loads/stores and XMM moves for off/on; explain every change and any allocation
retry. The three packed values' hot stores must actually disappear or move only
to fully charged cold paths. Compensating hot spills or no net reduction of
frequency-weighted transport on either common cycle reject advancement. Other
necessary stores can remain, but the complete 19-store ledger must show them.
Smaller nmethods, fewer MOVs or the presence of `CCDEFER` alone cannot pass.

One evidence-bound code-quality review, within the same cap, chooses:

- `MECHANISM_PASS`: all provenance, safety, activation, equivalence and final-code
  gates pass; the entire ledger supports a useful placement change without an
  unexplained code-quality regression. Performance remains unqualified.
- `MECHANISM_NO_GO`: completed execution shows a safety/activation/final-placement
  failure, recreated hot stores, compensating transport or a consistent code
  regression. Retain the failing evidence; do not rerun to improve it.
- `INCONCLUSIVE_INFRA`: host admission, build/preparation, deadline, missing
  capture/provenance or ambiguous code mapping prevents the decisive check.
  Do not infer allocator success or failure from unavailable evidence.

Seal the resolved manifest, host/process snapshots, source/config/tool/image and
class/input hashes, all stdout/stderr, jtreg reports, six XML/log/assembly files,
root-to-final-operand maps, full traffic ledger, accepted review and cleanup
receipt. Retain original NO-GO evidence unchanged. No timing starts automatically
after any verdict.
