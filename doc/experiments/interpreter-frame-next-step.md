# Remaining interpreter-prefix cost and next implementation proposal

This is a source and retained-evidence analysis of `8e9b7c551b8`, following the
[publication experiment](interpreter-frame-publication.md). No compiler source,
opcode coverage, admission threshold or ordinary tier policy changes in this
pass. No JVM, benchmark, profiler or build was run. The early-stage goal remains
open despite the useful publication reduction.

The smallest justified recurring-work correction is to emit the common prefix
entry guards once in the interpreter's existing entry path, rather than emit
identical guards into every method body. Separately, a normal runtime producer
can avoid WhiteBox reflection/result packaging and phase instrumentation. Neither
change is evidence that the stage repays its cost before C1. The current sample
deliberately prevents that replacement and therefore cannot establish it.

## What the remaining request CPU contains

The native-route cuts below are arithmetic differences between the retained
nested CPU timers, not a new capture. They reconcile to external wrapper CPU.
The [derived table](direct-baseline-data/interpreter-publication-attribution.tsv)
retains nanoseconds and the original
[phase table](direct-baseline-data/interpreter-publication-generation.tsv)
retains every control/native outcome.

| CPU component, µs A / B | Short, first | Medium, second | Long, third |
|---|---:|---:|---:|
| Producer preparation | 13.319 / 12.709 | 10.335 / 9.644 | 7.301 / 7.441 |
| Other work inside native request timer | 1.263 / 1.292 | 1.252 / 0.892 | 0.531 / 0.491 |
| External Java wrapper less native timer | 12.789 / 13.320 | 1.303 / 1.481 | 1.091 / 1.141 |
| Observed request total | 27.371 / 27.321 | 12.890 / 12.017 | 8.923 / 9.073 |

In [WB_InterpreterFramePilot](../../src/hotspot/share/prims/whitebox.cpp), the
internal timer starts after JNI entry, before reflected_method_to_jmid, and
ends after the separate snapshot lock. It includes conversion through
JNI FromReflectedMethod, checked method-ID lookup, held metadata, checks,
preparation, and snapshot acquisition. It excludes allocation/filling of the
32-long result array, JNI result-handle creation, JNI exit and the Java call
boundary. The external wrapper also includes measurement boundaries. Thus the
0.49–0.53 µs Long internal remainder and 1.09–1.14 µs outer remainder are
observed interface buckets, not individually timed reflection/array costs.
The result alone allocates 256 payload bytes plus its array header/alignment.
FromReflectedMethod can also create a method ID if it is not already cached.

Short is always the first call to this particular WhiteBox native. The source
has a concrete cold path outside its internal timer:
[generate_native_entry](../../src/hotspot/cpu/x86/templateInterpreterGenerator_x86.cpp)
checks its signature handler and can call prepare_native_call;
[SignatureHandlerLibrary::add](../../src/hotspot/share/interpreter/interpreterRuntime.cpp)
initializes/looks up/generates a native signature handler if needed. First call
site linkage and instruction/data-cache state are additional candidates. Native
registration and initial WhiteBox class initialization already precede these
request timers; they must not simply be charged again to Short.

The outer remainder's roughly 13 µs first outcome versus 1.1–1.5 µs later
outcomes strongly implicates first-use interface effects. It is not proof of
which cold path actually ran, nor a measured recurring 13 µs cost for five
operations. Fixed generation order also confounds the producer: 21 operations
cost more scan/emission CPU than 39. The captures contain no reordered or warmed
repeat preparation to identify a cold premium. No numeric first-use subtraction
is justified, and no such new timing is run here.

Startup arena/mutex initialization is separately recorded at 17.55–20.25 µs CPU
per JVM and lies outside every request. The enclosing interpreter BufferBlob
allocation is also separate. MethodCounters allocation and observed ResourceArea
growth are zero for all these warmed targets, including Short. There is no
per-method executable CodeBlob allocation. These facts rule out those recorded
allocations as explanations for the Short request premium; they do not census
every CHeap allocation or establish whole-process startup cost.

## Inside the producer

| Native producer CPU, µs A / B | Short | Medium | Long |
|---|---:|---:|---:|
| Shape/signature analysis | 0.961 / 0.691 | 0.330 / 0.351 | 0.240 / 0.420 |
| Fixed CodeBuffer setup | 0.171 / 0.451 | 0.171 / 0.170 | 0.151 / 0.141 |
| Scan/emission | 8.232 / 7.411 | 7.411 / 6.790 | 4.807 / 4.797 |
| Flush/invalidate/publication | 0.481 / 0.491 | 0.531 / 0.450 | 0.501 / 0.501 |
| Buffer cleanup | 0.401 / 0.421 | 0.350 / 0.360 | 0.200 / 0.200 |
| Mutex acquisition | 0.331 / 0.331 | 0.150 / 0.160 | 0.151 / 0.150 |
| ResourceMark cleanup | 0.150 / 0.140 | 0.140 / 0.141 | 0.121 / 0.121 |
| Remaining producer CPU | 2.592 / 2.773 | 1.252 / 1.222 | 1.130 / 1.111 |

The Long scan/emission bucket is about 65% of its producer CPU, but its name is
broader than bytecode decoding. In
[generate_locked](../../src/hotspot/cpu/x86/interpreterFramePilot_x86.cpp), it
includes emitting common polling/tooling/breakpoint guards and their fixups,
the hit counter, logical BytecodeStream decoding, integer-state checks,
assembler instruction encoding, per-bytecode BCP updates, and normal/fallback
dispatch. There is one fused bytecode walk, no separate success prepass, no
field/call resolution, type-state arrays, IR, register allocation, CI or normal
nmethod installation. The signature bitmap is in the smaller analysis bucket.
There is no retained interpreter AST that can replace this walk for free.

Instrumentation is material work at this scale. The successful producer path
executes sixteen current-thread CPU clock reads and four wall clock reads.
Two more CPU reads bracket the native request and two bracket its Java wrapper.
On Linux the CPU clock reaches clock_gettime(CLOCK_THREAD_CPUTIME_ID), as shown
in [os_linux.cpp](../../src/hotspot/os/linux/os_linux.cpp). No timer overhead was
measured or subtracted. Cuts and residuals contain clock bookkeeping and other
instructions; the 1.1 µs Long residual is not evidence of a hidden optimizer.
An observation-free path removes real diagnostic work, but its microsecond
saving cannot be inferred by charging every clock a guessed constant.

Uncontended mutex CPU/wall are both small here. Contention remains unmeasured;
removing its timer or the second snapshot lock does not license removing the
generation lock. Publication still requires completed instructions, instruction
cache invalidation and release ordering. The approximately 0.5 µs cut includes
that work and its clocks. Mandatory publication is not the dominant observed
producer bucket.

## Reuse at a normal interpreter trigger

The interpreter already has the Method, an interpreted frame, saved BCP/locals,
and usually the MethodCounters used by generate_counter_incr. A thin
InterpreterRuntime JRT helper can use LastFrameAccessor and a thread-owned
methodHandle, following the existing direct_baseline helper. It needs no
reflected Executable, jmethodID conversion, Java result array, extra snapshot
request, compiler task, CI setup or nmethod installer. Existing rewritten
bytecodes, verified bounds, signature and fixed interpreter arena remain the
inputs. Missing counters should fall back in a bounded pilot, not introduce an
unexpected metaspace allocation into its no-safepoint region.

Required frame setup, counters/MDO handling, method-entry events and stack
checks must retain their order. Preparation may happen through the established
runtime call mechanism immediately after notify_method_entry and before pilot
selection. Trigger tests must reload the relevant MC/MDO counters there, rather
than assume the earlier rcx counter survives entry notifications. Prefix
selection remains after normal entry handling.
The generated entry must reload the owner/counters after the runtime transition
and retain runtime polling/tool guards, because JRT exit can safepoint or process
tooling/redefinition. A side pointer must not replace Method::code: C1/C2 must
still redirect future invocations normally, and an active interpreted frame may
finish its prefix/fallback.

The existing frequency_counter_overflow runtime call is reusable plumbing, but
using only its notification point is not a free admission answer. The source's
nominal Tier0InvokeNotifyFreqLog is 7 (128 calls), with ordinary policy and
scaling influencing real events. Waiting until that point can consume much of
the remaining pre-C1 window. An earlier counter-trigger experiment would need
an explicit bounded hook; it cannot silently change notification masks or hold
C1 back. No new trigger count is selected in this analysis.

## Smallest implementation sequence proposed

1. Move the common execution guards from per-method generate_locked emission
   into the existing pilot selection path in generate_normal_entry. All current
   native entries arrive through this one path; WhiteBox returns an address for
   observation but does not invoke it directly. Keep the private-field guard
   emitter in InterpreterFramePilot, callable during startup generation, so no
   new public JVMTI interface or global TemplateTable state is required. Preserve
   the target register, counters owner check, enabled/entry publication, armed
   poll, every tooling/debug/breakpoint condition and the hit increment. Guard
   failure must dispatch through the active table **with a poll**; the existing
   default dispatch_next call has generate_poll=false and is not an equivalent
   substitute. The method body then contains only the supported operations,
   BCP updates and its one ordinary continuation dispatch. This eliminates
   repeated instruction encoding/fixups for nine global JVMTI checks and the
   common prologue/failure dispatch, without adding an indirect jump or relaxing
   a runtime check. It shortens, rather than extends, generation's existing
   no-safepoint work. The saved CPU is unmeasured; source alone does not split
   this fixed work out of the 4.8 µs Long emission bucket.
2. Give the held-method producer an observation-free path. Keep the current
   detailed WhiteBox route for diagnostics; the runtime path needs no phase
   clocks, thread IDs, ResourceArea accounting or snapshot/result packaging.
   Preserve the actual ResourceMark and code cleanup. This is an interface
   separation within one bounded generator, not a new cached IR or framework.
3. For a subsequent normal-entry qualification pilot, explicitly arm only the
   same selected methods and consume a one-shot request through a thin JRT
   helper. A ranked Mutex::try_lock may decline busy requests and resume normal
   interpretation; do not block an application thread waiting in the
   no-safepoint region or retry on every call. An arm must have defined atomic
   ownership, consumed/refused/busy outcomes and version/clone/unloading rules.
   Keep the existing fixed arena, no recycling, supported operations and tier
   policy. Review this hook and state transition before execution. This tests
   the normal entry boundary without pretending to have designed automatic
   all-method admission. The first two changes can be reviewed and qualified
   independently before introducing the hook.

The correctness gate for the first change is the existing release/fastdebug
fixture plus explicit guard-failure polling, late tooling/breakpoint changes,
GC/stack walking and handoff checks at the shared entry. The second must prove
unchanged semantics/code lifetime with observation disabled. No execution of
these proposed changes is included in this pass.

## Does the available interpreter window repay it?

The measured 227–249 Long, 673–744 Medium and 7,607–11,092 Short observed-request
repayments use targets excluded from ordinary compilation and fixed callers
compiled before measurement. They show arithmetic against continuing
interpretation, not that those many calls remain interpreted in a real JVM.
The prefix may also cover a small fraction of an expensive unsupported body;
its eligibility or entry count is not time-weighted execution coverage.

Retained full direct-tier application diagnostics provide a caution, not a
controlled prediction for this different prefix architecture:

- The [expanded use ledger](direct-baseline-data/causal-expanded-use.tsv)
  records 308 zero-use installations and another 1,121 with fewer than 128
  entries: 1,429/2,629, or 54.36%, are below even the new Long request repayment
  if one conditionally applies its measured saving. Shapes, compilation cost
  and useful windows differ, so that is not a predicted success rate.
- Of 981 ordinary replacements, the matched diagnostic's median invocation
  count is 333, with 820 replacements first at C1 level 3, 160 at level 1 and
  one at C2. It records 443,792 direct entries before ordinary enqueue versus
  502,301 before replacement/snapshot. The latter includes post-enqueue time;
  neither aggregate supplies an off-arm, same-method counterfactual.
- Earlier census data used a shared-worker 512-invocation C1 hold, whereas the
  broader spot check used dedicated service and no such hold. Its larger
  early-entry window must not be imported to justify repayment with unchanged
  ordinary policy. The adverse application results remain intact.

For scale only, a hypothetical preparation at invocation 32 followed by ordinary
enqueue at 256 permits 224 calls before enqueue. At the Long microcase's
35.93–40.11 ns saving this is 8.05–8.98 µs: less than each same-JVM observed
request cost, though more than its measured 7.30–7.44 µs producer core. Waiting
until a nominal 128-call notification leaves only 128 calls/4.60–5.13 µs in
that illustration. The 32/256 counts are not proposed thresholds or guaranteed
current policy events. A replacement count of 333 may leave a wider window,
but existing queue delays, inlining and changed worker competition prevent
treating that median as guaranteed exclusive interpreter time saved.

The useful budget is per method: future calls that would still interpret in
the unchanged off case, multiplied by same-shape prefix CPU saving, must exceed
preparation/trigger CPU plus induced runtime/optimizer cost. Ordinary compiled
or inlined calls are not savings against interpretation; idle residency is not
CPU; delayed C1 is not free benefit. Existing captures do not join those
counterfactual windows to these three prefix shapes. There is no defensible
workload repayment or warmed-throughput claim yet.

The next decision should therefore pair the small structural correction with
an explicit normal-entry/ownership design and a pre-C1 opportunity budget,
rather than widen opcodes or choose a threshold from these quotients. This
analysis proposes that implementation boundary; it does not launch another
timing campaign or declare the early-stage goal complete.
