# Reviewed conditioning-assignment implementation — not approved for execution

This implements the independently reviewed version1 plan from Library
`libfile_6a9ddedd8cd881918926a6ad3a6ee8ee`, packet SHA256
`c6b74d31b53eabbb96b376f44933a2759a0cd9e6cb3d9529f219935193c38147`.
It is a new unchanged-code assignment diagnostic. The old run38806591473,
its HOLD, every row, family280 intervals and100ns/1pp gates remain unchanged.
This implementation and workflow are returned for review only. No tag creation,
publication, workflow dispatch or native measurement is authorized here.

## Fixed design

One native worker, supervised by a blocked Python collector; two persistent
physical stream slots use the same unchanged prefixed zlib-ng library. Eight
blocks, three conditions and both orders produce exactly48quartets/192rows.
There is no sample-count option. Slot roles alternate by block, jointly balanced
with condition position and first order. Eight block contrasts per condition
remain the observations; no row/process pooling or independent-host claim.

Every row performs3328 reuse64 warm operations,8 reuse4k preparation operations
and64 reuse4k timed operations on the assigned slot. The corpus is the original
256-entry warm ring over132tiny banks and eight existing4096-byte text banks
(old IDs532..539). Corpus bytes/digests are locked in corpus.json; no new inputs.
Level6, wrapped stream, window15, memLevel8, default strategy remain fixed.

Assigned target gaps are40/40,42.2/37.8 or37.8/42.2ms. Every incoming-role gap,
including row0's quartet-anchor gap, is assigned before fixed work. Four target
gap budgets total160ms in every quartet, irrespective of order. Neutral busy
wait fills remaining time, but actual spin time is recorded, not assumed equal.
Target/start adherence and fixed-work completion determine delivery validity.
Measured durations, centers and their decomposition are outcomes, never vetoes.
Invalid delivery retains every row; no compensation, exclusions or reruns.

## Telemetry and correctness

The driver opens a per-thread pinned hardware group for CPU cycles,
instructions and reference cycles, user-only with kernel/hypervisor exclusion.
Event IDs are checked on every group read. A startup probe requires positive
counts and exactly equal enabled/running time. Unsupported events, permission
errors, zero counters or multiplexing cause a retained preflight-unavailable
receipt and exit77 BEFORE compression initialization or measurement. No perf
installation, privilege workaround or clock-only fallback exists.

Each row records FOUR separate hardware brackets: warm, preparation, padding
and timed work (768records total). It retains cumulative raw counts and both
reads, enable/disable bounds, wall/thread-CPU bounds and scheduling times.
Postprocessing rejects bad timing/order, repeated IDs at preflight, missing
records, unequal disabled snapshots, overlapping complete counter brackets,
zero deltas or unequal enabled/running time. Each prior read3 must be no later
than the next read0; each next before snapshot must equal the prior after snapshot.
These brackets include clock/ioctl bookkeeping and are not exactly the inner
compression wall interval. Only raw cycles/reference-event ratios are reported; they are NOT frequency proxies in this implementation.
Generic-event opening is an availability check, not a host-specific semantics gate.
This harness does not perform that semantic review and makes NO frequency,
effective-GHz, VM-steal or cache-mechanism inference. Its explicit semantics
verified/frequency-inference flags remain false, even if generic events open.
The claims are limited to assignment response plus raw hardware observations.
Row resource counters cover the whole warm/prep/padding/timed envelope, not a
pretended compression-only rusage interval. CPU identity is checked per row.

Both slots are checked against identical compressed reference bytes and pinned
stock-zlib1.3.2 inflation for all140inputs before and after measurement:
280checks each side, plus192final-row inflates. Every operation checks output
length, every row checks sums and final bytes. Audit independently inflates
all140saved references using Python's stock zlib. Stock zlib never compresses
an actual native measurement arm; it is only the correctness inflater.

## Pure planning, synthetic tests and compilation

From this directory, the following perform no native measurements:

```sh
python3 test_timing_model.py
python3 test_packet_io.py
python3 test_assignment.py
python3 assignment.py --plan --out /tmp/assignment-plan-fresh
python3 assignment.py --build-only --checkout /path/to/openjdk-jdk27u --out /tmp/assignment-build-fresh
```

Build-only archives the exact production commit
`3f71d03f3297f94e8c2cc34160262a880be337fc`, verifies all215ng source identities
and stock1.3.2, then compiles unchanged source using existing gcc14/ar/make.
It does not invoke the diagnostic or its perf preflight. No candidate patch,
source rewrite, instrumentation object or library selection fallback exists.
Build flags, configure/make/link output, symbols and complete source/binary
SHA256 inventories are retained. Compilation does not validate live perf access.

`assignment.py --audit --out SAVED_DIRECTORY` reads existing evidence only.
The collector tests construct synthetic timestamps/counters and untimed Python
compressed fixtures, marked SYNTHETIC_UNIT_TEST. They never launch assignment.c
or query perf. Rates/bursts are calculated from actual fixture durations.

## Future execution path, still requires separate approval

The accompanying workflow accepts only the exact fresh lightweight push tag
`diagnostic-tiny-zlib-conditioning-assignment-20261016-once`, created/nonforced/
nondeleted, attempt1. Execution also checks the repository, event, built checkout
SHA, frozen plan/specification and full source/binary inventory. Atomic Python
and native markers refuse reuse. Local execution and workflow_dispatch are
rejected. The proposed tag/workflow have not been published or launched.

The supervisor allows180s startup, a900s absolute native measurement window,
then180s finishing; its timer uses the native CLOCK_MONOTONIC deadline. The
driver also checks the deadline between every row. A hard timeout kills once
and retains already-flushed partial rows/counters; no retry follows. Completed
rows are flushed after each row outside measured brackets. Those writes and
previous-row checks fall within the next fixed target-gap budget. Any induced
late start is retained and invalidates delivery rather than shifting targets.

Whole-run delivery/telemetry validity is distinct from the four new diagnostic
mean intervals (family4, df7,t3.3352949398170826), common24-row block denominator,
and independent response/bounded-response/residual-instability/indeterminate
flags. Source timing_model.py is byte-identical to reviewed version1. Complete
raw rows, per-order/mapping summaries, actual gap/center/duration terms, raw and
derived counter brackets, and all block values are retained. No order or slot
subgroup receives an extra inferential-coverage claim.

Preflight-unavailable, invalid/partial evidence or diagnostic-complete all
remain unqualified. Workflow success means evidence collection, never a backend
or Java qualification. The busy-wait intervention changes activity placement
as well as elapsed time: any assignment response applies only to this new
setup, not pure timestamp geometry or the cause/bias of old results.

## Collector correction revision2

Standalone audit requires explicit protocol_error=null, last_stage=finish,
integer retries=0, successful return/timeout flags and192 complete native rows.
A saved collector error or failed result cannot be promoted by reaudit, even
if a later receipt is edited to look successful. Rejection preserves prior
result bytes in result-before-rejection.json and all original receipts/raw
data; invalid evidence suppresses every informative outcome flag.

Reference semantics scope is narrowed as described above; there is no hidden
claim that a generic perf event preflight validates host-specific frequency
meaning. This changes no192-row design, backend, old HOLD or statistical gate.
