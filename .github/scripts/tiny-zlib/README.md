# Tiny zlib native diagnostic

## Approved fixed candidate campaign

The current workflow executes --candidate-campaign-only once. Production pins,
all three saved patches and PR6 remain unchanged. Builds, full differential
tree/stream checks and ASan/UBSan complete serially before the one timing process.
No allocator hooks/tuning, offset correction or retry-until-pass loop is used.

The frozen manifest contains 674 cells per layout: 98 tiny cells (three original
prefixes plus random/zero/repeated/JSON 64-byte data; level 6, reuse/create;
ng-stock, each prototype-ng and each prototype-stock); 192 ordinary/long cells
(Java/random/repeated/JSON at 1KiB/64KiB/1MiB, levels 1/6 and both lifecycles;
ng-stock plus each prototype-ng); and 384 unit-tree cells (all 128 retained
generator cases for every prototype vs ng). Tree timing is in separate test
images; backend tree sources are not modified to expose a test entry point.

Both role-A and role-B images are isolated with -Bsymbolic, loaded by exact
handles before timing. Layout0 initializes reference/A then comparator/B;
layout1 initializes comparator/A then reference/B and reverses the cell order.
Every stream permanently owns its initializing API; selecting a different role
never assigns an existing stream to another backend. Create/end uses a fresh
zeroed z_stream and ends it through that owner. Function/DSO mappings, initial
state/stream/buffer addresses, initialization order and every timed batch's
first/last state and initialization ordinal are retained. Recording adds equal
driver bookkeeping to both arms; it is not a trace of internal malloc calls.

Each layout is immediately bracketed in the same process by shared-owner and
separate-unmodified-role A/A on reset, original Java64 reuse and create/end.
Every A/A cell retains 12 blocks x20 alternating pairs x128 operations and the
unchanged abs(mean block difference)+2.201*SEM <=100ns rule. Comparative cells
use six blocks x10 alternating pairs; batches have 128/4/1 stream operations
by size or 100 prepared tree builds. Setup, tree digest and representative
stock-inflate validation are outside timing. All samples are retained. Both
layouts finish once even if a bracket fails; any failed bracket makes winner
qualification inconclusive. The prior 120.62ns failure stays failed.

Canonical comparator-minus-reference differences and ratios are scored per
layout with t(5)=2.571. Layouts are never averaged to hide a failed guard. Tiny
stock parity keeps its lower95% stock-minus-candidate bound >=-100ns; ordinary/
long screening keeps upper95% candidate/ng <=1.01. Tree-unit latency losses are
reported separately, with no invented whole-stream margin. Instruction counts
remain warnings. Correctness/calibration passes alone qualify no speedup or JDK.

The artifact preserves sources, binaries, input identities, commands, the frozen
manifest, all 173,280 raw rows, addresses and scores. A separately hashed gzip
of the text evidence is also retained in completed job logs for read-only
recovery. --validate-only on the C driver performs loading/ownership/output
fixtures with zero timed blocks and no performance samples.

## Retained earlier calibration-only extension

### Calibration identification protocol

The earlier workflow ran one fixed identification battery, without candidates
or stock timing. The earlier experiment remains in its original commit and
artifact. Run native.py with --controls-only to execute, in fixed order:

1. Shared function pointers and one shared stream for both logical arms.
2. Shared function pointers and two independently owned states, reversing the
   logical A/B assignment to the physical states on every block.
3. The separate-library/separate-state control, with fixed A/B assignment.

Each control keeps the retained 12 blocks, 20 alternating pairs per block,
128 calls per batch, reset-only and 64-byte level-6 reset/finish cells. Both
logical arms receive 64 warmups; the shared state consequently receives 128.
Each measured operation begins with deflateReset. All samples remain included.
The logical-arm gate remains abs(mean of 12 block paired means)+2.201*SEM <=100 ns.
The same bound is additionally reported for physical slot1-minus-slot0 to make
state effects visible when reversed assignments cancel in the logical mean.
Both contrasts and order strata are retained; no failed contrast is hidden.

Initialization order, state/stream/input/output addresses, function pointers,
DSO bases/offsets, process mappings and each block's assignment are recorded
before timing. Allocation uses the default allocator without hooks or tuning;
the order record identifies initialization and returned states, not every
internal allocator event. Core unrelocated .text equality remains a source/build
control and does not establish equal runtime addresses.

All three controls execute once in the same process, keeping DSO mappings fixed
across modes, even if an earlier gate fails. No candidate,
stock campaign, repeated-until-pass loop, post-correctness workload or threshold
relaxation is part of this run. Every raw CSV and address record is saved in the
artifact and also encoded into the completed job log for read-only recovery.
This battery diagnoses calibration distinctions; it cannot qualify a prototype
or a patched JDK speedup.

## Retained earlier native experiment

This is an isolated supporting experiment for PR6. The diagnostic branch changes
only this directory and its scoped workflow. It does not change production code,
change a compression level, update PR6, build a JDK, or merge anything.

Production source is fixed at 3f71d03f3297f94e8c2cc34160262a880be337fc, stock zlib
1.3.2, and unmodified ng upstream 88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0. The
workflow verifies the source pin and all upstream vendor hashes before building.
Corpora come from 9870d54525f8f5a1315da6f2f9b289fb535e26a3. Every generated input,
compiler/configuration, library and executable is identified in the artifact.

The source patches are the retained generic-C tree experiments, with exact
compressed-output semantics as their goal:

- v1: defer histogram work for <=16-leaf distance/bit-length trees; it adds work
  to the literal scan and larger small alphabets.
- v2: split literal preparation and insertion-sort the full small alphabets;
  deterministic descending 30-leaf work regresses 29.7%.
- v3: retain insertion through 16 leaves, bottom-up merge-sort 17–30 leaves using
  the two existing buffers; six count cells regress, worst +13.53% randomized
  low-frequency 30-leaf distance trees.

These are retained prototypes, not shipping fixes. Deterministic instruction
counts are in deterministic/. They are not stream-latency measurements. The new
native run measures actual latency only after a same-build resolution gate.
There is no new source sorting variant in this experiment.

## Gates and ordering

All experiment work is serial, pinned to one allowed CPU during calibration,
correctness and measurement. No compilation, sanitizer or correctness process
runs concurrently with timing. The workflow uses GCC 14 with equal -O2 -fPIC,
upstream static compatibility builds, private prefixes, and separate shared
libraries with -Bsymbolic so internal ng functions cannot accidentally mix.

1. Two independently configured unmodified ng namespaces run the retained
   calibrate.c on the original Java 64-byte prefix, level 6. It records 12 blocks
   of 20 alternating pairs per cell, with 128 operations per timed batch, for
   reset-only and reset+finish. Wall/thread CPU, contexts, faults and throttle
   deltas are retained. Core object .text sections must match exactly.
2. For each cell require abs(mean of block paired differences) + t(11)*SEM <=
   100 ns. The rule is unchanged from the scratch experiment. No exclusions,
   clock substitution or retry-until-pass is allowed. A failed first gate stops
   before candidate work. Raw CPU-controller snapshots identify missing fields;
   absent throttle counters are not evidence of zero throttling.
3. After a passing first gate, each candidate gets the complete exact-byte/
   stock-inflate stream matrix, the 19,200 exact-tree matrix, and the retained
   ASan/UBSan matrix, serially. A failed candidate is invalid and not timed.
   The separate baseline Memcheck finding is not erased by these gates.
4. Recheck A/A after correctness, before any measurements. If it fails, stop.
5. Run stock replacement reset/reuse controls, the unchanged retained native C
   comparison on all full corpora (six alternating 150 ms batches), and the
   new short-batch paired tiny/ordinary/long comparisons. Every timed cell
   verifies representative final outputs with stock inflate; complete stream
   correctness is established separately, not claimed for every timed call.
6. Recheck A/A at the end. Failure invalidates any winner claim. All raw pairs
   and failures remain in the uploaded artifact.

Both arms receive the same 64 reset+finish warmups. Creation measurements use
the default allocator after both libraries have been warmed, with no allocator
settings changed. The earlier untimed trace found that one ng creation changes
subsequent stock heap trimming/fault behavior, so allocator state/order and
measured faults must be considered. Isolated init/end times must not be treated
as a library-intrinsic allocation cost without that context.

The paired end-to-end driver times batches (no per-operation clock): 128 calls
for <=1 KiB, four for <=64 KiB, and one for larger inputs, with six blocks of ten
alternating pairs per cell. It covers levels 1 and 6, reset/finish and new/end,
original and offset prefixes, 0–4/63/64/65-byte random data, zero/repeated/JSON
payloads, and 1 KiB/64 KiB/1 MiB Java/random/repeated/JSON data. Levels stay
unchanged; the retained C harness separately includes the original level-1/2
mapping comparisons. Compressed sizes are reported for both arms.

Confidence intervals use all six chronological block means and t(5), without
outlier removal. Ordinary/long screening requires an upper paired ratio bound
<=1.01 to establish no meaningful (>1%) regression in tested cells. Tiny 64-byte
level-6 parity with stock requires the lower 95% stock-minus-candidate bound
>=-100 ns. Raw intervals remain authoritative; screening is not a universal
speed or patched-JDK claim. A narrower or inconclusive result is reported as
such. No winner can be claimed if any A/A checkpoint fails.

## Reproduce

The workflow is scoped to pushes on diagnostic/tiny-zlib-native-20261014 that
change this experiment or its workflow. It cannot trigger the repository's
master-only full-JDK matrix. The artifact includes sources, patches, binaries,
raw CSVs, results.json, report.md, identities and all logs, retained for 30 days.

Given a production checkout of this diagnostic commit and a corpus checkout of
the fixed corpus pin:

    python3 .github/scripts/tiny-zlib/native.py \
      --root . --corpora ../corpora --out ../validation/tiny-zlib-native

The run requires Linux x86-64, GCC 14, make, ar, objcopy, patch and Python 3. It
makes no repository writes or pushes. Retained earlier scripts are included for
source/evidence continuity; native.py supplies the scoped layout and gating.
