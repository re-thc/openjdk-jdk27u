# Direct baseline: normal instance entry and statically bound calls

The bounded instance implementation builds and passes release/fastdebug
qualification. It substantially expands actual javac coverage, but the small
matched caller comparison establishes neither a startup win nor warmed
neutrality against baseline off. The prototype remains opt-in and unpublished.
`46cf40d0b28`, `d215567cea4`, their images, and all adverse results remain intact.

## Implementation

The production diff adds 37 lines and removes 18 in the emitter and interpreter
entry hook. It retains the verified-bytecode prepass, canonical local/operand
slots, scratch registers, ordinary nmethod frame and precise GC/deopt metadata.
There is no C1 HIR/LIR, allocator, new queue, policy framework or threshold change.

Normal instance methods now use `MacroAssembler::ic_check` at the unverified
entry before the verified entry/frame, matching HotSpot's compiled IC contract.
The receiver is Java argument/local zero in the incoming convention, state
prepass, canonical slots and maps. Descriptor arguments follow it, including
register and stack arguments. Constructors remain excluded in both request and
CI validation; native, synchronized, scoped, intrinsic, reserved-stack,
handler-bearing, unsupported-type and backward-branch methods still fall back.

Calls cache the declared CI signature alongside the resolved target. Virtual
calls require the resolved method's `can_be_statically_bound()`, rather than
the symbolic holder merely being final. Nonconstructor class invokespecial
uses CI/LinkResolver selection; interface target/declared holders and
interface-special callers remain excluded. General virtual/interface dispatch
is not implemented. Existing initialized-holder and linkage checks remain.

Each instance call null-checks its receiver at the invoke BCI before marshalling,
even when a final target never dereferences this. It uses a patchable optimized
virtual call relocation, the normal resolver and interpreter stub. Calls retain
argument oop roots and exact invoke scopes with `reexecute=false`, so an
already-executed throwing callee is not repeated. Guards deoptimize at their
own bytecode state, preserving preceding side effects. Empty native exception
tables retain ordinary outward propagation; no Java handler method is accepted
without the separately studied interpreter handoff.

The interpreter's static-only gate is removed. The existing per-Method attempted
bit, cheap preflight, explicit task/code identity, stale checks and ordinary
queued-bit ownership are unchanged. MC origins/masks, MDO profiling ownership,
the existing 512 live-direct hold and C1/C2 bypasses are unchanged. Wider
eligibility changes queue/service and profile histories in practice, even
though their policy code is unchanged.

## Correctness and independent review

All five baseline jtreg tests pass on release and fastdebug. The completed
instance fixture also passes separately on both after review additions. It tests:

* Instance entry through interpreted and compiled callers; receiver, subword
  and spilled argument ABI; private, final, inherited-final and superclass calls.
* Product-compatible IC miss behavior with two loaded receiver implementations,
  the same compiled caller retained across the miss, and C2 target replacement.
* C1/C2/interpreted/native callees, reference returns and GC across calls with
  receiver/local/argument references, including a spilled reference argument.
* Null receivers for a C2 callee that does not read this; exceptions escaping
  interpreted, C1 and C2 callees, with side effects once and the expected stack.
* Class initialization left untouched until the real cold call, constructor
  exclusion, handler/unbound/interface/inherited-nonfinal fallback and subsequent
  ordinary C1 compilability, plus a virtual-thread result checked by its joiner.

The independent exact-diff review found no production blocker. It identified a
lost virtual-thread assertion in the test, now replaced by a joined result,
and missing inherited symbolic-holder cases, now covered. The initial test
driver initialized WhiteBox without its VM setup and failed before exercising
the compiler. A later IC fixture used debug-only `UseCHA`, which release rejected
before VM startup. The final fixture instead creates both receiver types before
compiling the caller, with default product compiler flags. These harness failures
and intermediate reports are preserved. No native VM failure was observed.
The unchanged profiling test still reaches natural C2 after 5136 additional
genuine profiling calls in each image.

## Small matched caller comparison

The same existing javac caller, classpath and four source inputs are used.
Each case has two startup and two warm forks, serially interleaved in forward
and reverse order. Warm means the original 1500-task warmup, existing stability
pause and 100 timed tasks. There is no forced benchmark method, class preload,
WhiteBox, trace or compilation logging in timing. Builds and tests finished
before timing. All sixteen processes exit zero; no deadline is exceeded.

The cases are baseline off (preflight image), the exact functional 1492 control,
preflight at 46cf40, and instance entry/bound calls. All 377 non-libjvm regular
files match across images. Effective flags differ only in UseDirectBaseline:
shared service, threshold 32, G1/128 MiB heap, CPUs 0–3, four active processors,
three ordinary compiler threads and all ordinary thresholds/masks match.

| Median metric | Off | 1492 | Preflight | Instance |
|---|---:|---:|---:|---:|
| Startup wall, ms | 438.716 | 396.660 | 465.449 | 455.832 |
| Startup process CPU, ms | 945.305 | 864.833 | 997.109 | 993.241 |
| Original warm task, ms | 4.792 | 6.412 | 5.384 | 4.845 |
| Whole warm-process wall, s | 15.264 | 16.322 | 15.508 | 14.818 |
| Whole warm-process CPU, s | 26.470 | 27.776 | 26.416 | 25.833 |

Instance warm fork medians are 5.172/4.518 ms, versus off 4.853/4.732,
1492 6.211/6.613 and preflight 6.027/4.741. The off comparison is mixed and
its median is 1.1% lower. Startup instance wall/CPU are 3.9%/5.1% higher than
off, with substantial between-fork variation. Better results than the two
enabled controls in this cohort do not establish warmed neutrality or an
application win. These two-fork results are a bounded check, not acceptance.

## Actual execution and complete task cost

A separate single retained startup capture per enabled case adds tracing,
LogCompilation and the existing held-caller/counter reader. Its timings are
diagnostic only and must not be substituted for the primary cohort above.

| Diagnostic observation | 1492 | Preflight | Instance |
|---|---:|---:|---:|
| Direct installations / used | 111 / 105 | 161 / 151 | 851 / 779 |
| Javac installations | 11 | 19 | 206 |
| Actual direct body entries | 37295 | 43898 | 284324 |
| Entries before ordinary admission or hold ends | 32913 | 40087 | 208425 |
| Javac entries / early entries | 4444 / 3902 | 5099 / 4678 | 51510 / 37980 |
| Inclusive successful-task CPU, ms | 8.373 | 10.084 | 53.174 |
| Inclusive refused-task CPU, ms | 12.704 | 8.985 | 32.808 |
| Worker refusals / early preflights | 481 / 0 | 317 / 109 | 1437 / 334 |
| Code-cache blob bytes | 66624 | 94752 | 589184 |
| External metadata/map payload bytes | 24764 | 33460 | 231620 |

The 206 javac roots do not contradict the earlier 79-root projection: 77 belong
to that old available-classfile sample and all 77 satisfy its bound-call
filter; 129 were outside the old requested-root sample. No broader call or
handler capability was added. Examples actually served include ListBuffer.clear,
ListBuffer.toList, UnicodeReader.position, ScopeListenerList.symbolAdded and
PathFileObject.getKind. The entry ledger retains every method and handoff.
An entry into a small wrapper does not mean its callee's interpreter work was
avoided; no inclusive callee CPU is credited as direct execution time.

All 2288 instance worker attempts have unique method keys; the 334 cheap
preflights are also unique. The main worker refusal reasons are unsupported
bytecode (715), unbound/interface call (449), unsupported/unresolved call (89),
constant type (71), loop (37) and field (33), plus smaller conservative failures.
This is wider unsupported coverage, not a repeated-attempt defect. Successful
tasks average 62.5 microseconds including broker/CI/install work. The emitter
portion is 41.588 ms of the successful 53.174 ms; refusal emission is 8.826 ms
of 32.808 ms. Compiler-only timing would omit real cost.

Median install counts are 37/35/38 total calls for 1492/preflight/instance.
Enqueue to recorded compiler start grows from 0.186 ms preflight to 1.042 ms
instance (p95 2.095 to 6.360 ms). That interval includes CI setup before the
recorded start and is not pure queue latency. Actual use and early-entry counts
show useful early installation despite the larger backlog. Median first
ordinary admission remains 512 among direct roots; queue feedback means this
is not a universal fixed-call boundary. C1/C2 installed javac nmethods in the
capture are 213/19 instance versus 240/19 preflight. First javac C2 installs
at 324 versus 282 ms, with no explicit C2 delay.

Complete instance task CPU is 85.982 ms, about 302 ns per actual body entry,
versus 434 ns preflight. This improves the local amortization budget but does
not demonstrate execution savings of that magnitude. Seventy-two installations
serve no entries in this capture, and many added methods are small getters.
Emitted blob plus reported external payload is about 821 KB versus 128 KB;
allocator overhead and unrelated MC/MDO/cache allocations are not included.

## Where the logged CPU difference lies

The logged process uses 1169.633 ms instance versus 1052.563 ms preflight:

| Component | Preflight, ms | Instance, ms | Difference, ms |
|---|---:|---:|---:|
| Application thread | 440.506 | 476.953 | +36.447 |
| Direct tasks inside C1 worker | 19.069 | 85.982 | +66.913 |
| Other C1-worker CPU | 260.872 | 290.884 | +30.012 |
| C2 workers | 315.432 | 302.538 | -12.894 |
| GC + other VM threads | 1.827 | 1.562 | -0.265 |
| After-marker/unobserved remainder | 14.858 | 11.714 | -3.144 |
| Total | 1052.563 | 1169.633 | +117.070 |

These totals locate the added work and leave an explicit 11.714 ms residual,
rather than explaining a process gap by successful emitter time alone. Other
C1-worker CPU includes ordinary compilation, initialization and broker work;
application CPU includes execution, admission and runtime transitions. The
capture does not split those further. This logged difference cannot be charged
to the primary cohort's 48 ms off/instance CPU difference: the cohorts differ.

The bounded implementation is useful source and materially broader coverage.
The remaining cost question is whether real interpreter work avoided by these
methods pays complete task, adapter, metadata and scheduling costs. The measured
application result has not met the startup/warm goal. No general dispatch,
handler support, prewarming, scheduling change or threshold campaign follows
from this check.

Raw images, commands, original failures, logs, scripts, entry ledger and reports
remain under `/workspace/direct-baseline-evidence/instance-bound/`. Small tables
are in `direct-baseline-data/instance-bound-*.tsv`; manifests identify exact
image and source hashes. No external action or default-on change occurred.
