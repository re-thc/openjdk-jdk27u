# Prospective selected-scope FFM performance decision

**Draft preparation only. No JVM, benchmark, host-admission probe or new CI job was launched to prepare this packet.** Offline tests use synthetic rows and mocked processes. Execution bindings and launch approval are intentionally absent. This is a separate proposal, not a retry or revision of any spent campaign or the frozen 1,260-fork kit. It is outside the product PR.

PR: https://github.com/re-thc/openjdk-jdk27u/pull/47 (open draft; performance unqualified).

Compare original baseline `02324e6bd026411407983df06284cd79460c33f6` with candidate `b67cf2421d5dca1df4d9759003e1983a1b810f86` on **native Linux AArch64 release**. This asks about the isolated patch relative to its original base. CI integration merge `2ac53f9fde7ab9e12a617cf9d65e2c314bdb8919` against master `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda` is a different source pair and is not substituted here.

## Fixed scope and budget

| Stage | Conditions | Maximum fresh timing forks |
| --- | --- | ---: |
| Startup | Default tiered; empty, framework, bound int-to-int first use | 108 |
| Historical call form | C2; constant unbound int-to-int | 36 |
| Selected counterparts | C2 constant bound; C1 level-1 constant unbound | 72 |
| Total ceiling | 12 paired blocks; base/control/candidate | 216 |

The first two stages need at most 144 forks. Any invalid fork, failed unchanged control or consistent candidate slowdown stops subsequent stages. An inconclusive startup result may still be followed by the independent historical-call-form stage. The final 72 forks run only if both primary stages resolve favorably. No other automatic expansion, retry, setting change, exclusions or pooling.

The collector uses an absolute **3,600-second campaign budget**, including snapshots, collection I/O and stage analysis, and a 180-second process-and-reap deadline within the remaining budget. The process wall endpoint ends at reap; subsequent parent-side parsing and receipt writes belong to the campaign budget. An overrun invalidates the run; it does not extend the budget. Cleanup polls an owned child with `wait4(WNOHANG)` for at most two seconds within the remaining campaign budget. A child that cannot be reaped is recorded with its PID and `cleanup_pending`; collection stops and needs explicit ownership follow-through. OS or filesystem stalls cannot be made into a hard termination guarantee. The timer never asynchronously interrupts terminal-row persistence. Persisted rows, launch intents, witnessed launches and terminal receipts are reported separately; none is relabeled as an exact launch count when evidence is incomplete.

Proposed overall preparation/execution ceiling: **150 active and elapsed minutes**: 85 minutes for retained-file verification, at most one ordinary baseline release build (45-minute ceiling), harness compilation and untimed evidence; 60 minutes for collection/analysis; five minutes for final hashes, reporting and cleanup. Reuse the accepted candidate release image only when its retained receipts bind it exactly. Build the baseline once in a fresh checkout/output directory. Missing/inconsistent candidate evidence stops this plan; no candidate rebuild or correctness repeat follows automatically. The complete commands, tool/date/version replay, budget record, named process-group supervisor and exact reuse-invalidating conditions are in [RUNBOOK.md](RUNBOOK.md).

Before timing, at most six retained-call diagnostics (two images × three conditions) establish actual C1 level 1/C2 level 4 compilation of `callsUnbound`/`callsBound` before the warm marker. Two additional startup class-initialization traces are permitted only for attribution, for an eight-diagnostic-fork ceiling. Compiler policy flags alone are not compilation evidence. Diagnostic invocations and output stay outside collection.

## Controls and decisions

`control` and `base` use the identical baseline image. Every condition has each of the six label permutations exactly twice; condition order is also balanced. `SCHEDULE.json` fixes all 216 slots before execution. Its structure and exact bytes are checked before any launch.

Keep the original control ratio bounds: point estimate 0.95–1.05 and entire 95% interval 0.90–1.10. Startup controls require process wall and individual process CPU for each shape; int first-use also requires `first_ns`. Retained controls require wall and current-thread CPU. Use 12 paired independent fork medians, geometric comparator/candidate ratios, 10,000 bootstrap resamples and seed 20261016, reset per comparison. Report all unadjusted intervals.

Hold on either comparator interval wholly below 1 or candidate slower than both baseline labels in at least 9/12 paired blocks, with no acceptable-loss margin. A crossing interval or point ratio below 1 remains uncertain. To unlock the final stage, startup int process wall, process CPU and first-call intervals must resolve favorably against both labels; both retained C2 metrics must also resolve favorably. A link-construction-only gain is insufficient. Empty/framework controls and all candidate endpoint results remain visible.

Even a favorable outcome covers only these conditions. It does not establish broad FFM, x64, interpreter, C1 level-3, mutable-handle, other-signature or cross-build non-regression. The prior handwritten old-A C2 hold remains unchanged. The actual held quiet72 caller was `Steady.callsUnbound`; the separate JMH compiler capture was not the timed caller. Retained samples follow 30 warm batches and are not first-call latency. Report gross harness costs, not isolated native transitions.

Historical evidence is separate: handwritten candidate `a954d96f3d0d89df4b0dbf8db065abdf4523fc83` retained an x64 C2 elapsed baseline/A ratio of 0.957669775, 95% CI [0.879932499, 0.999771891]; this is an unresolved hold, not a uniform slowdown or a proven cause. Later generated-template cohorts failed unchanged controls. The exact b67 ARM64 release/fastdebug PASS is user-reported correctness, with original full hashes/logs retained on Harry's volume, not performance evidence inspected in the cloud. This new plan has no executed performance result.

## Image and host preparation

Use matching `bin/configure-dev` release settings, Linux Boot JDK26+35, GCC16.0.1, mold3.0.0, disabled ccache and AArch64 flags. The configure wrapper is unchanged across both pins (SHA256 `0f38d9f758a1ddd5cc1d97c4ecc063fb35c4b0b50a6631bc070901efc9b27039`). Freeze full per-image trees, module/CDS identities, complete native-library file sets, source/config/tool hashes and harness artifacts. Native file sets and hashes must match; investigate unexplained differences and stop rather than adjusting flags or normalizing bytes. Module images intentionally differ; each image retains its own default CDS archive, whose bytes may match or differ.

Recover the existing candidate required-mode JTR/image linkage locally: `DOWNCALL_TEMPLATE_PASS checks=63 selected=true platform=linux-aarch64`, with no unsupported-host fallback. The accepted user report is not replaced by fabricated full hashes or paths. Generated-template payload SHA256 `ccffb3898eb9adfbdd22912989a46859247c05bc65c32b89624f103d3e4d5d34` identifies generated class bytes, **not** the separately compiled native benchmark library.

Run collector and Java children inside the same native Linux VM. Individual `wait4` usage measures each owned Java child; do not time a macOS container-client process. Bind one CPU from verified affinity/cpuset and keep it fixed. Actual untimed diagnostics must establish PID/namespace/cgroup/counter visibility and coherent CPU accounting. Before collection and for every child, compare the complete visible ancestor `cpu.max`/effective-cpuset limits with admission evidence and compare the executable identity. Any drift invalidates the run. A required admission receipt also attests no concurrent builds, tests or input writes. Before/after hashes and executable inode witnesses detect many mutations but do not prove absence of a transient write-and-restore; input immutability is an operational prerequisite.

## Files and offline checks

`decision.py` contains the frozen proposal, schedule validator, workload commands, assessor and stage decisions. `child_collector.py` records individual-child usage plus launch/terminal receipts. `measure_once.py` implements one-shot staged collection and reports its final budget estimate as provisional/pre-seal. `observe_return.py` uses `collector_supervisor.py` for one Linux session/group launch, subreaper ownership, bounded TERM/KILL and exact-child nonblocking reaping within the existing campaign/sealing and overall deadlines. It records actual process return and final cleanup; intervention, overrun, failed/unknown return or incomplete cleanup blocks acceptance. Original statistical dispositions remain recorded. `inputs.py` checks complete frozen inputs and the separate reviewed launch receipt. It never creates approval. Its module documentation defines receipt schemas.

```sh
python3 -m unittest -q test_decision test_child_collector test_campaign test_inputs test_baseline_replay test_budget test_collector_supervisor
```

Do not invoke `observe_return.py` until the parent execution gate is satisfied and real `EXECUTION_BINDINGS.json`, evidence receipts and `LAUNCH_REVIEW.json` exist. It launches the collector once; an existing observer intent or `run/` prevents another launch. Collector output alone is provisional until the terminal observation succeeds. Preserve raw stdout/stderr, attempt/launch/terminal journals, every row, snapshot, report and original control disposition. The offline tests run no processes or Linux supervision probes and do not establish containment/runtime readiness. No campaign data or machinery is added to the product PR.
