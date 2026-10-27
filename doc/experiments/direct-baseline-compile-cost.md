# Direct baseline: compiler cost attribution and allocation cleanup

The earlier 85.982 ms was a heavily logged broker interval, not complete
diagnostics-free compiler service CPU. Calling it complete was inaccurate.
It included per-method tracing and LogCompilation work, but ended before the
task line, resource/JNI-handle cleanup and CompileTaskWrapper destruction.
The original data remains unchanged. A bounded, total-only diagnostic now
measures service after dequeue, subtracting measured diagnostic output.

Three small allocation cleanups reduce its three-run median from 47.549 to
43.700 ms. Matched method/outcome medians improve by 11.8%. This is a compiler
cost result, not a startup or warmed application win. No new coverage,
threshold, scheduling or C1/C2 promotion change is made.

The clean production patch is ready, but final clean-image builds and full
jtreg validation are **blocked by executor process/thread exhaustion**. Three
javac diagnostic processes ran successfully with the instrumented reduced
version before that exhaustion. They do not replace the pending semantic tests.

## What the retained 86 ms actually contains

The retained instance capture has 851 installed tasks consuming 53.174 ms and
1437 refusals consuming 32.808 ms. All 2288 method keys are unique. The old
emitter timer reports 41.588/8.826 ms, leaving 35.568 ms outside it. That
remainder includes broker/CI work, failure handling, teardown and tracing;
it cannot be labeled CI construction alone.

The successful-task timer itself includes prepass, recorder setup, a temporary
CodeCache buffer, assembly/scopes/maps, nmethod creation/installation and their
logging. The refusal timer still constructs the complete CI environment and
root ciMethod before rejecting a bytecode or operand. This explains why task
count, not just emitted bytes, drives total cost.

## Focused instrumentation and its observer cost

Temporary source patches separately time broker setup, CI construction and
exception preload, root CI target/JVMTI setup, prepass and operand resolution,
recorders, scratch buffer, emission, scopes/oop maps and registration. A clock
around nmethod creation separates it from the rest of registration. Nested
buckets are subtracted when producing the disjoint table below.

The first fine capture with full logging spent 14.765 ms printing refusal
compile lines alone. The next fine capture disables LogCompilation and normal
direct tracing, uses CITime only as a temporary diagnostic trigger, and measures
its own output. It generates the direct body counter for the retained reader.
No such CITime behavior or profiling machinery remains in the production patch.

| Fine capture, all direct tasks | CPU, ms |
|---|---:|
| Broker setup | 5.368 |
| CI constructor excluding exception preload | 6.326 |
| Five unused exception wrappers | 2.881 |
| Root ciMethod and JVMTI/DTrace setup | 3.965 |
| Bytecode load/type-state/remaining validation | 3.908 |
| Timed operand CI resolution/validation | 10.002 |
| Recorder setup | 1.826 |
| Scratch CodeCache buffer allocation | 0.586 |
| Emission excluding timed scope/maps | 5.586 |
| Scope/oop-map construction | 1.651 |
| nmethod creation | 6.361 |
| Other registration | 2.807 |
| Other compiler work | 4.039 |
| Environment cleanup/failure/statistics tail | 3.620 |
| Total work in fine broker interval | 58.925 |
| Measured output inside that interval, excluded above | 19.795 |

These are fine-instrumented buckets, not a retrospective exact partition of
the old 86 ms. Fine timing requires many thread-CPU clock reads per method;
those reads are material for microsecond operations. Scope encoding happens
incrementally in the recorder, while frozen map packaging and metadata copying
also occur inside nmethod creation. The latter subparts are not separately
resolved by this table.

A separate total-only image removes the fine probes and in-compiler output.
It times the whole task after dequeue, including the enclosing resource/JNI and
task-wrapper cleanup, and measures/subtracts its diagnostic output. Queue
selection and request creation remain outside this service interval. CITime
bookkeeping and a few clock reads remain, so this is a low-instrumentation
diagnostic, not an assertion of exact default-on application cost.

## Minimal structural corrections

Only two production files change; all temporary flags, timing records, TLS,
header fields, broker instrumentation and diagnostic output changes are removed.

* **Publish immutable successor states without another copy.** Each instruction
  already copies its input before mutation. Branch/fallthrough merges and
  emission only read the published states. The old merge duplicated the State,
  local-array initialization/copy and stack-array allocation/copy on every
  first-seen successor. A conditional may safely share its immutable output
  between both successors. The current prepass and strict merge checks remain.
* **Reuse the worker's scratch code storage.** A shared C1 worker already owns
  a BufferBlob. A dedicated direct worker lazily obtains one through the same
  CompilerThread field, with the existing broker cleanup lifecycle. Each task
  creates a new non-owning CodeBuffer view and fresh relocations, recorder,
  scopes and maps. The null test checks the owner, not code.blob(), which is
  intentionally null for a borrowed view. This removes per-success BufferBlob
  creation/free, VM transitions, CodeCache locking and memory accounting.
* **Do not preload unused C2 IR exception inputs.** Direct guards deoptimize and
  calls use runtime exception propagation. The five preallocated exception
  ciInstance getters are C2 users; direct does not use them. Direct environments
  initialize those fields to null rather than creating five wrappers/JNI handles
  per task. Ordinary C1/C2 and initialization environments still take the old
  preload path. The factory's shared class-initialization snapshot, normal CI
  linkage checks, JVMTI/DTrace snapshots and teardown remain intact.

The scratch capacity retains the old 64 KiB budget plus the same section
alignment/slop. It is not reduced based on average method size: ordinary x86
emission does not automatically guard/expand instruction space in product
builds. Public per-task relocation setup follows the existing C1 pattern.
Shared service adds no new persistent buffer; dedicated service retains roughly
64 KiB plus alignment/header overhead after its first successful task.

No required GC/deopt state, barrier, safepoint, call/exception contract,
resolution/initialization check or stale-install protection is removed. There
is still no C1 parser, HIR, LIR, optimizer or global allocator. The inherited
cost is the general CI/broker/nmethod machinery, including unnecessary
allocations identified above, not a hidden C1 compilation pipeline.

## Same-caller cost check, without an application timing campaign

The held startup caller, classpath, source inputs, CPU affinity, heap, collector,
shared priority, direct threshold and ordinary promotion policy are unchanged.
There are three fresh processes per version, interleaved control/reduced/
reduced/control/control/reduced. No forced benchmark method or preload is used.

| Dequeued service work after measured output subtraction | Control | Reduced |
|---|---:|---:|
| Fork values, ms | 47.549 / 46.023 / 50.655 | 43.700 / 55.038 / 41.608 |
| Median, ms | 47.549 | 43.700 |

The reduced 55.038 ms outlier is retained; whole-process CPU does not show a
consistent improvement in these diagnostic captures. Aggregate service median
improves 8.1%. To reduce method-mix noise, the matched analysis requires the same
method, bytecode size, installed/refused result and reason in all six processes:

| Matched keys | Methods | Sum of control method medians, ms | Reduced, ms |
|---|---:|---:|---:|
| Installed | 822 | 24.098 | 20.927 |
| Refused | 1387 | 17.541 | 15.810 |
| Both | 2209 | 41.639 | 36.737 |

The mean of matched installed-method medians falls from 29.3 to 25.5
microseconds; refused-method medians from 12.6 to 11.4 microseconds. All 822
common installed methods have identical nmethod content sizes in every run.
This supports a compile-side allocation correction; it is not byte-for-byte
code equivalence or a replacement for GC, exception and deoptimization tests.
No new warmed or multi-image startup timing campaign was run.

## Actual-use amortization remains the problem

In the original retained capture, 72 installations serve zero entries and
consume 4.097 ms of logged successful-task CPU. The 429 installations serving
fewer than 128 direct entries consume 26.057 ms, nearly half the successful
budget, while serving only 21264 entries (7.5%). In contrast, 153 installations
serve at least 512 entries and account for 178989 entries (63%) and 10.357 ms.

Low direct use is not proof that the method is globally cold. Of the 429,
326 have no ordinary root request in the retained log; 103 do, including 102
simple-C1 requests. Inlining into an optimized caller can bypass direct code
without a root request too. Delaying a successor would not create application
calls and cannot count displacement of faster C1 code as interpreter work saved.
The per-method ledger retains all entries and handoff facts rather than treating
root count or nested callee execution as CPU coverage.

The remaining general CI setup, operand resolution, refusals and conventional
nmethod metadata/installation costs are larger than raw emission. Preserving
the correct snapshots/maps is necessary with the current CI frontend. Removing
them wholesale would require a separately qualified direct VM/installation
context; the data does not justify building that framework or expanding coverage
now. These allocation fixes are useful but do not establish application benefit
or resolve the warmed criterion. The earlier 1492 startup timing remains a
noisy historical comparator, not proof of a required regression or win here.

## Validation blocker and retained evidence

The instrumented reduced release image completed all three fresh javac captures.
Final clean release and fastdebug builds then failed with posix_spawn EAGAIN
(`Resource temporarily unavailable`). Serial JOBS=1 and a child-reaping build
wrapper also failed. The environment has over 32000 unreaped zombie processes
parented to PID 1 (`tail`). Even a JVM restricted to one processor fails during
initialization with pthread_create EAGAIN before jtreg/test main can execute.
Memory was available; this is a process/thread-capacity blocker, not a new test
failure in generated code. No full-suite pass is claimed for the clean patch.
The precise enforcing limit is not identified; no cgroup limit value is inferred
from the visible zombie count.

Pending: build both clean images and run compiler/baseline jtreg after executor
capacity is restored or a fresh executor retains the workspace. No approval was
denied, no command is left running, and no PID-1 modification was attempted.
Git's parallel index scan also failed; local source review/checkpoint uses
single-threaded index settings.

The next build actions are `make CONF=direct-release JOBS=1 hotspot` and
`make CONF=direct-fastdebug JOBS=1
BUILD_LIBJVM_DISABLED_WARNINGS_gcc_handshake.cpp='stringop-overflow nonnull'
hotspot` using the existing toolchain activation, followed by the existing five
tests. Partially rebuilt output directories must not be treated as validated
clean images.

All instrumented source patches/images, the original 86 ms data, fine and
total-only captures, API/build failures, resource-failure logs, scripts and
per-method tables remain in `/workspace/direct-baseline-evidence/compile-cost/`.
Small summaries and hashes are in `direct-baseline-data/compile-cost-*.tsv`.
The prototype stays opt-in/local; no public action or default-on change occurs.
