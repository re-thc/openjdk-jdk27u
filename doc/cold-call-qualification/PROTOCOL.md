# Frozen correctness, attribution, samples and decision gates

This source-only protocol preserves the pre-result workload and acceptance
criteria. [README.md](README.md) supplies the exact repaired revisions, one-time
budget, ordinary-checkout setup and execution authorization boundary. No new
rate or safety result is asserted by publication.

## Required evidence, in order

1. **Matched ordinary builds.** Build all three images with warnings enabled.
   No preexisting build output or externally supplied libjvm is used. Inspect
   the generated specs to confirm identical release configurations and ordinary
   server feature sets. A new build diagnostic is not permission to suppress a
   warning or edit source mid-run:
   any build failure stops this exact-revision campaign.

2. **Focused safety before performance.** Use the candidate images' own launchers
   and installed jtreg, with concurrency one. On each candidate image run the
   three checked-in tests: `TestColdCallSpillPolicy`,
   `TestColdCallSpillPlacement`, `TestColdCallDerivedPointers`. The driver owns
   default/off/on, frame-pointer, scheduling/FPU and fixed-register negatives;
   never enable the flag globally for these tests. The native helper library is
   compiled locally from the exact candidate header/test, with warnings as errors.
   These cover actual production cost/visit mechanics, duplicate debug slots,
   negative masks/frequencies, moving base/derived pairs, GC, deoptimization,
   monitors, trained exceptions and CAS. Preserve all their selection assertions.
   Run existing `TestC2IntPressure` and `TestSpilling` on base release, candidate
   release enabled, and candidate fastdebug enabled; add debug-only
   `TestVerifyRegisterAllocator` on fastdebug. Five jtreg invocations select
   **13 allocator tests**, including the drivers' existing nested children.
   The two handshake prerequisite tests in the README follow them. Their own
   multiple `@run` actions/probes are included in the same time caps. No skipped
   selected test counts as a pass. The existing stress test may print generated
   seeds; retain them, with no seed retry.

3. **Actual production activation and correctness.** Compile the unchanged codec
   and existing `DecoderQualification` once. Prepare its 19 inputs / 57 native
   frames at levels 1/3/9 with installed libzstd **1.5.7**, then pin their hashes.
   Source corpus is 764896 bytes, SHA256
   `dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9`.
   Four release captures (base, candidate default, off, on) and two fastdebug
   captures (off/on) each check all 57 frames for 32 fixed rounds, reusable and
   allocating outputs. No broad inlining, helper overlay, call removal or
   encoder-owner prototype is applied. This uses one G1/C2 normal-entry mode,
   `-Xbatch`, no OSR, and threshold scaling 0.1; it is a normal server build,
   not a claim to qualify every default tiered execution shape.

   Method-scoped traces tie the final `CCINITIAL`/`CCDEFER` region to the final
   normal-entry C2 **compile ID**; assembly ID must match XML, that nmethod must
   remain entrant, and the returning `readPartialLong` static call at BCI 684
   must remain in its assembly. Enabled must select; disabled must not. Earlier
   compilations/OSR or a synthetic kernel alone cannot supply the activation
   oracle. Allocation attempts/failures are retained for the same task.

   Disassemble all six captures with existing objdump/extractor. Before a GO,
   review relocation-aware base/default/off code and allocation equivalence.
   Do not normalize arbitrary constants or ignore unexplained instruction
   changes. Account for the complete hot cycle and refill/call siblings,
   argument/save/restore/Phi moves, CISC stack operands, XMM transport, frame
   size and code size. Count moved stores once; all 19 hot stores surviving in
   older evidence must remain visible in the explanation. Automated execution
   stops short of claiming this manual all-path review passed.

4. **End-to-end rate, identical frames.** Primary: pinned source/native L1 frame,
   **six paired fresh processes per Java cell** (base, candidate off, on, and
   a duplicate candidate-off A/A control with the identical image/flags) and
   six native processes. Secondary controls: deterministic periodic 4 MiB and
   incompressible 1 MiB L1 frames, three paired processes per cell/native.
   There are 42 Java decoder and 12 native decoder processes. Java uses the same
   reusable-output `CodecProbe`; native uses the existing reusable DCtx helper.
   All variants read byte-identical frames and verify exact decoded bytes.
   Candidate/default equivalence is a capture/safety gate; timing default would
   duplicate the off cell. Native and Java both retain their existing allocation
   conventions. Their warmups differ (8-second Java / 2-second native), but all
   five windows are 700 ms and each native process has its own warmup.

   Cell order rotates/reverses deterministically; processes run sequentially.
   Java has eight seconds warmup and five 700-ms windows, no assembly, allocator
   trace, JFR or PMU during timing. Identical **compilation-event XML logging**
   is retained in Java cells to establish a normal C2 source parser/encoder
   at least 100 ms before the recorded warmup boundary and no invalidation near
   or after that boundary. MXBean calls occur outside the windows and reject
   more than 10 ms total JIT compilation during them. This is no runtime sampling
   profiler, but compilation logging is a declared instrumentation limitation.
   No resampling because a process looks unfavorable. Random/raw or RLE paths
   may bypass the sequence parser: treat those as protection controls, not
   failed activation cases or evidence about parser speed.

5. **Encoder protection.** Ordinary `CodecProbe encode`, unchanged codec,
   source/periodic/incompressible L1, three paired base/off/on processes each:
   **27 Java encoder processes**, same warmup/windows and compile-stability
   checks. Validate each output by decoding and require byte-identical compressed
   frames across all variants/repetitions, so ratio changes cannot buy speed.
   This is public encode/decode API work only. **No security-stopped active-frame
   encoder probe, replacement for it, encoder patch or cross-clobber experiment
   is included.** There are 81 timed processes total, including native.

6. **Compilation cost and peak-memory protection.** Three fixed repetitions of
   base/off/on for two separate diagnostic workloads: the full 57-frame decoder
   checker, and a fresh ordinary javac of all 37 pinned production sources.
   That is **18 processes**, distinct from throughput samples. Capture XML
   C1/C2 methods, normal/OSR kinds, task counts, success/failure, regalloc attempts,
   timestamps and CITime. Compare final parser C2 task duration and matched
   method sets, not only process wall time. The fresh javac also protects an
   ordinary noncodec compiler workload, with identical emitted class hashes.
   Its wall time includes Java compilation/execution/GC; it is not C2 CPU time.

   Per-task `MemStat,...,print` reports C2 arena **chunk-capacity high-water**;
   collect printed records, not only the exit table's largest 64 tasks. Record
   parser and javac per-task peaks plus their retained timelines. Category
   columns describe composition at the overall peak; phase labels describe
   chunk origin, not exact live allocation of the new policy. Sub-1-MiB temporary
   peaks may be omitted. IndexSet recycling/ResourceMark rewind can reuse
   already retained chunks, so unchanged peaks do not falsify the memory fix.
   Comparing base/off/on measures net prototype overhead, **not** improvement
   against the preceding `226ef07` prototype.

   Linux `wait4` on GNU timeout records peak RSS: for a single Java command it is
   the largest process RSS (the JVM dominates its tiny timeout parent). It is
   neither compiler-arena usage nor aggregate simultaneous process-tree memory.
   Build RSS is likewise largest descendant, not total build peak. No new memory
   sampler, cgroup mutation, installation or generic deadline framework is used.

## Decision fixed before results

Before any measurements, independent review identified a profile attribution
gap: the57-frame checker may compile the real parser with different branch
profiles from the source-only timing case. Four additional **diagnostic-only**
processes are therefore frozen: release off/on and fastdebug off/on of the exact
`CodecProbe` source/frame/classes/COMMON flags,8-second warmup and5windows.
They run once after valid main completion, regardless of gain/loss, under a
combined3-minute cap and the single four-hour continuation clock. Their printed rates are
retained and excluded by this predeclared rule from all rate statistics; they
never replace a primary sample. The main81-process ensemble is unchanged.

These four must show final entrant normal C2 before the warmup boundary, BCI684
call retention in that same nmethod, and source-trained fastdebug off0/on>0
deferral. Compare release code/all-path transport and corresponding timed XML
task shape, helper inlining, allocation attempts and nmethod/frame sizes.
Unexplained profile/code mismatches leave parser attribution inconclusive.
Even a match corroborates the parser mechanism plus a net global-policy A/B;
other methods may activate, so it does not isolate a quantitative contribution
of the parser or three packed entries.

`campaign.json` retains every process median/window log, paired ratio, source
and frame hashes. It computes the primary paired median ratio and a deterministic
10,000-resample paired-bootstrap 95% interval (seed 20261017); six pairs give
limited power, and this interval is not a broad statistical guarantee. Retain
individual pairs, dispersion and chronology; windows are not independent
process replicates. Report native time gaps from inverse rates, not fractions
of raw MB/s differences.

The next action is **a usable default-off review PR**, only if all safety and
activation gates pass, default/off code equivalence is explained, primary
median on/off is at least **1.03** and the paired interval lower end exceeds
1.00. Require no secondary or encoder median on/off below **0.98**, and no
candidate-off/base median below **0.99**; inspect all pairs for drift/outliers.
The unchanged-image primary A/A ratio must be within **0.98–1.02**, with its
paired interval including 1.00; otherwise the controls invalidate the experiment.
Any protected workload's paired interval wholly below 1.00 is demonstrated
slowdown and rejects success even if its median loss is smaller than 2%.
These modest control samples cannot establish universal nonregression.

For resource protection, no new compilation failures/retries, unexpected extra
target allocation attempt, or missing protected C2 method set is allowed.
Median final-parser task time may rise by at most max(5%, **10 ms**), arena
chunk peak by at most max(5%, **1 MiB**), and javac wall/CITime/RSS/arena medians
by at most **5%**. Separate method-set/compile-count changes from per-method
cost and inspect outliers; RSS cannot substitute for arena evidence. Missing
or noisy evidence is inconclusive, not a zero-overhead claim.

The runner emits `execution-complete-review-required`, not an automatic GO.
The owner must finish the bounded static analysis of produced code/resource
evidence, then report GO / NO-GO / INCONCLUSIVE against these frozen gates.
A safety failure is NO-GO. Missing activation or unstable compilation invalidates
the timing claim. A small/uncertain gain or protection regression does not
justify advancing this as a codec-performance PR; retain the branch and report
the unsupported lead without retries. A GO PR must state the measured host,
flags/corpora and residual gap, and retain the diagnostic default-off flag.
One host, even with a gain, does not authorize a default change or merge.
Creating/publishing that PR is a later explicit action, not hidden in this run.

## What fraction of the gap is at stake

Recorded custom-fastdebug evidence: Java 520.1 -> 553.6 MB/s and native
1599.6 MB/s on one identical 176726-byte frame. The time-gap fraction closed is

`(1/520.1 - 1/553.6) / (1/520.1 - 1/1599.6) = about 9.0%`.

The refined prototype has no release throughput evidence. Its common path
changed 212 -> 203 instructions, 57 -> 46 stack MOVs (38 -> 27 loads), with
**19 stores unchanged**. Neither the 19% MOV reduction nor the 4% instruction
reduction is a cycle or end-to-end speedup estimate. Other paths still perform
preservation and surrounding code can change. The older synthetic kernel's
9.6% time reduction would save roughly `p * 9.6%` overall time only if the real
decoder spent fraction `p` in that same affected work. The recorded 61.3%
inclusive parser profile came from a different ARM run and cannot supply `p`
for this release/x86 experiment.

A several-percent end-to-end improvement is a plausible hypothesis; closing
the whole roughly threefold old rate gap is unsupported. The approved campaign
would calculate its actual same-frame inverse-rate gap fraction, retain negative
controls, and leave sequence execution, Huffman, residual hot spills, code shape
and other codec costs to their separate owners. No throughput result has been
produced by writing this proposal.
