# Used-only interpreter-frame labels and scoped patch storage

Runtime source: `df4852a57a9`, following reviewed report `1e26841879f`.
Control: qualified runtime `1d9220745c2`, documented at `aedf724d3d0`.
Both control images and all previous evidence remain preserved.

The structural correction is implemented and passes focused release/debug
qualification. The bounded preparation comparison is mixed: the large stack
reservation is gone, but a broad preparation speedup is not established. First-use
and several second-position regressions remain. This does not establish an
application win or complete the original early-tier goal.

## Source and independent review

The [cost review](interpreter-frame-producer-cost-design.md) proposed making
temporary generation work proportional to the targets actually referenced.
Independent review covered the design and exact three-file implementation before
execution. It found no correctness blocker, with the following contracts retained:

- `PilotLabels` uses a bounded BCI-to-slot index, placement-constructs only requested
  BCI and actual call-return labels in the enclosing ResourceArea, and explicitly
  destroys every constructed label. The latter preserves the unbound-reference
  assertions on both success and rejection paths.
- A requested label still binds at the same point in the bytecode traversal.
  Pending labels still alias ordinary fallback. Truncated final-call classification
  and direct per-site return addresses are unchanged. Each of at most 64 operations
  introduces at most one target, including an attempted final operation.
- The external-address CodeBuffer constructor accepts optional borrowed patch
  storage with explicit ownership state. Other constructors retain owned storage.
  Borrowed buffers assert that they do not expand; their destructor never deletes
  the supplied arena. Both prepare entry points retain their outer ResourceMark
  through all fixups and CodeBuffer destruction.
- Reviewed G1/Serial helpers have no nested ResourceMark around patch-list updates.
  VerifyOops diagnostic-string marks end before branch emission. Existing
  GrowableArray resource-nesting assertions remain enabled.

No invocation-time machinery, final-class specialization, persistent map/cache,
opcode extension or tier-policy change was added. Guest instruction emission,
profiling, BCP/TOS state, return guards, fixed code budget, flush and publication
are unchanged.

Existing object disassembly confirms the silent producer's local stack reservation
fell from **17,664 to 3,648 bytes in release**, and **61,408 to 4,256 in fastdebug**,
excluding pushes/alignment. Used labels still cost resource allocations; this is
not an allocation-free producer.

## Build and qualification

CodeBuffer's header change required recompiling 774/775 existing dependent objects
in release/fastdebug. Builds were sequential, three jobs, PCH disabled, with the
same compiler/code-generation flags and synchronous logging as the control.
External debug-symbol packaging remained disabled; earlier symbols/images remain.

Release built successfully. The first fastdebug invocation failed because it
omitted the control's existing per-`handshake.cpp` GCC warning setting, producing
`-Werror=nonnull` in the unchanged virtual-thread handshake code. That invocation
and error are preserved. Restoring the exact control argument,
`BUILD_LIBJVM_DISABLED_WARNINGS_gcc_handshake.cpp="stringop-overflow nonnull"`,
completed the build. No runtime source or assertion was altered for the recovery.

All existing focused checks passed:

| Configuration | Result |
|---|---:|
| Release | 12/12 |
| Fastdebug | 12/12 |
| Fastdebug maximal-profile/VerifyOops | 3/3 |

The checks include calls/native successors and truncation, cold/resolved fields,
references/casts/forward joins, exceptions, GC roots, armed poll, late breakpoint
fallback, direct-baseline regressions and ordinary-call linkage. The additional
checks retain CheckCompressedOops, VerifyOops, VerifyActivationFrameSize,
VerifySecondarySupers, VerifyDataPointer, TypeProfileLevel=222, width eight and
the non-popcount subtype path. No semantic test failed.

## Fixed matched preparation comparison

Eight release JVMs used the existing unchanged harness classes, explicit WhiteBox
preparation action 8, G1, 64 MiB heap, four active processors, two compiler threads,
CDS off, normal interpreter profiling and continuation test counters disabled.
The small-case harness retains its existing identical compile-only/callee controls;
the two real methods are held noncompilable. C1/C2 thresholds and admission are
unchanged. This measures held generation, not application startup or execution.

The normal producer contains no inner clocks or test counters. Action 8's outer
CPU/wall clocks remain. Method conversion, MethodCounters creation, snapshot and
Java result allocation lie outside the held interval. The full external small-case
intervals and one-time startup costs remain in the private ledger.

Small forks ran control-134, candidate-134, candidate-413, control-413. The order
digits choose the same three target methods with reversed first-use placement.
Real forks ran candidate/control/control/candidate; the existing real harness
always prepares JrtPath first, Key second. No additional forks sought significance.

All values are microseconds. Percentages describe these individual paired samples.

| Case/position | Control CPU | Candidate CPU | Change | Control wall | Candidate wall |
|---|---:|---:|---:|---:|---:|
| Equals first | 16.915 | 17.095 | +1.1% | 16.945 | 17.115 |
| Static second | 7.561 | 8.422 | +11.4% | 7.581 | 8.442 |
| Interface third | 3.315 | 2.694 | -18.7% | 3.345 | 2.714 |
| Interface first | 13.140 | 15.052 | +14.6% | 13.159 | 15.083 |
| Equals second | 10.725 | 12.629 | +17.8% | 10.757 | 12.659 |
| Static third | 3.095 | 3.065 | -1.0% | 3.095 | 3.075 |
| JrtPath pair 0 | 17.085 | 17.056 | -0.2% | 17.116 | 17.076 |
| Key pair 0 | 23.875 | 22.353 | -6.4% | 23.926 | 22.374 |
| JrtPath pair 1 | 16.014 | 16.495 | +3.0% | 16.054 | 16.535 |
| Key pair 1 | 96.644 | 21.652 | -77.6% | 96.816 | 21.682 |

The 96.644-us control outlier is retained. Its percentage is not presented as
repeatable speedup or folded into an adoption median. Small cases are mixed,
JrtPath is roughly flat, and Key remains over 21 us even in the candidate samples.
The fixed label setup was therefore not the dominant explanation for all earlier
3–29-us preparations. First-position cost still remains substantial.

Emitted sizes are unchanged across every matched fork: Equals 573, Static 240,
Interface 252, JrtPath 829 and Key 2300 bytes. All six small-case instruction-stream
comparisons match after normalizing absolute `movabs` VM addresses, including local
branch offsets and external relative transfers. No invocation-time improvement or
regression was measured in this pass; no new execution timing windows ran.

## Separate diagnostic cuts and remaining cost

Two additional generation-only action-4 captures, one control and one candidate,
used existing inner cuts and no continuation counters. They are diagnostic
captures, separate from the eight silent performance forks; their instrumented
times are not substituted into the preceding comparison.

| Body | Producer CPU, control/candidate | Scan-emission CPU, control/candidate | Thread resource bytes, control/candidate | Resource chunk growth |
|---|---:|---:|---:|---:|
| JrtPath | 18.487 / 18.077 | 14.912 / 14.681 | 0 / 360 | 0 / 0 |
| Key | 24.156 / 24.025 | 20.901 / 20.621 | 0 / 688 | 0 / 0 |

Both bodies retain end BCIs 28/59 and 13/29 logical operations. Borrowing scratch
removes this producer's private CodeBuffer Arena construction/deletion. In
these captures, the actual used labels and patch arrays fit the existing thread
ResourceArea: there was no replacement chunk-pool growth cycle. Other preparations
can still grow that area; zero growth here is not a universal guarantee. The old
zero resource deltas did not observe its private CodeBuffer arena.

The candidate diagnostic still spends about 81%/86% of observed producer CPU in
the broad scan/emission cut. It includes decoding, signature/category checks at
calls, actual label allocation/lookup and fixups, generic instruction encoders,
collector/profiling helpers, complete subtype-search emission and per-site return
islands. Label setup has been reduced, not isolated as a cycle count. On-demand
resource allocation and target lookup also have costs; smaller stack reservation
does not imply proportional CPU improvement. Host code layout/cache warmth and
first-use behavior remain unseparated in this small comparison.

Analysis remains 0.300–0.341 us, buffer construction 0.310–0.330 us, publication
0.340–0.601 us, buffer cleanup 0.191–0.321 us and ResourceMark cleanup
0.130–0.140 us in the candidate diagnostic. These are clocked cuts. There is no
hidden CI/nmethod install or optimizing pass to remove. The unchanged general
semantic helper emission and first-use costs remain the principal unresolved
generation budget, not the removed maximum-capacity label arrays. Their individual
shares are not proven by the broad timer.

Final-class specialization stays a separate unimplemented proposal from the source
review, including its resolution-availability qualification. No additional variant,
threshold adjustment or timing repetition followed these outcomes.

## Provenance and limits

Candidate release libjvm SHA-256:
`53585d6fc78abdf82e4a45e01435fc5ba1ae341eabbb880afc67728e81ef6361`.
Candidate fastdebug:
`4696c5eef0503f6d04bba2a11017c8510a605a66fab2d974225b3ccd8e93ee63`.
Both preserved control hashes were verified unchanged after builds and captures.
Build output hardlinks were detached before linking to protect those controls.

Private evidence is `/workspace/interpreter-frame-used-labels/`: source/image
manifests, independent-review record, every build including the failure, jtreg
results, eight silent captures, separate diagnostic cuts, code disassemblies and
paired/raw ledgers. Nothing was uploaded or deleted. The owned build supervisor
retained a 256 MiB stop floor; it never triggered. About 1.21 GB remained free,
zombies stayed at 26, no OOM occurred and owned commands were reaped.

The pilot still has sixteen fixed unrecycled slots and its existing category-1,
forward-only scope. No automatic admission, residency redesign, tier thresholds,
default enablement, public action or CI dispatch changed. Focused qualification
does not establish full-HotSpot coverage, application repayment or steady-state
neutrality. The mixed preparation result remains part of the evaluation.
