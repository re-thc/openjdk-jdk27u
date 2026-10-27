# Direct tier: concrete retained-data reuse

Three isolated local changes now consume work already available to the direct
compiler. They leave admission, coverage, tier thresholds and execution
architecture unchanged. This is a reduction in specific compiler work, not an
application adoption result. The earlier adverse
[spot comparison](direct-baseline-coverage-spot.md) remains the application
evidence.

## Changes and qualification

| Source commit | Change | Qualification |
|---|---|---|
| `3da3f678ed9` | Retain the argument BasicTypes and VMRegPairs already built by Prepared; emission consumes the same arrays | All 16 direct tests, release and fastdebug |
| `881de1f71ed` | Decode existing ConstMethod fingerprints for roots and opcode-valid resolved call targets | All 16 direct tests plus InvokerSignatureMismatch and TestUnloadedSignatureClass, release and fastdebug |
| `c8af17b6c76` | Copy an already-resolved instance field's scalar layout instead of constructing ciField/holder wrappers | All 17 direct tests, release and fastdebug; final field fixture separately rerun in both modes |

The final followup `a082e2d668d` retains root fingerprints and removes the call-target
fingerprint lookup after the corrected net diagnostic failed to show a
consistent combined saving. The candidate history and all outcomes remain. All 17 direct tests and both
signature-boundary tests pass in release and fastdebug on that followup. A
comment-only release rebuild changes one native byte: the line-number argument
to report_should_not_reach_here (805 to 804). Its final image preserves the
original image and additionally passes the field and baseline smoke tests.

The [test ledger](direct-baseline-data/coverage80-tests.tsv) and
[image hashes](direct-baseline-data/reuse-image-provenance.tsv) retain provenance.
Images use the same common runtime modules and exact-source libjvm replacements.
The synchronous build-logging prerequisite remains separate from compiler work.
Private timing instrumentation was restored after each probe; restored release
libjvm hashes match the corresponding qualified images.

The argument arrays live under the same compiler-task ResourceMark across
preparation, CI construction and emission. Receiver slots, long/VOID pairs and
zero-argument calls retain the existing Java calling convention. No new
instruction representation, register allocator or shared cache was introduced.

Root fingerprints are used only when already valid. Zero/overflow values fall
back to SignatureStream. Reference categories do not substitute for access or
loader checks. Fastdebug checks reused parameter slots/categories and return
type against the descriptor. The evaluated call-target lookup required actual-
opcode publication, identical descriptor/staticness and excluded appendices,
local signatures and the full signature-polymorphic intrinsic range. It is
removed from the final source; call sites retain declared-descriptor parsing
and normal emission linking, including signature-polymorphic fallback.

The field snapshot requires acquire-published resolution for the actual get or
put opcode. It copies offset, full BasicType and volatility only. Static fields,
unresolved sites, all final puts and java.lang.ref.Reference fields retain the
CI path. Static mirror rooting/initialization, current-method final-write checks,
narrow signed/unsigned loads, long slots, barriers, null behavior, scopes/maps
and install validation remain. The old unused per-BCI ciField array is removed.
The added fixture covers inherited holders, distinct final values, field widths,
volatile long and oop publication, GC identity, null fallback, and cached-get
versus illegal-final-put authorization. Independent source review found no
adoption blocker. A final post-install width oracle was added and rerun in both
build modes after the full suites.

## Affected-work measurements

Each differential is four startup JVMs in control/reuse/reuse/control order,
CPUs 0–3, the existing javac caller and unchanged dedicated-worker/tier policy.
Private images contain in-memory timers and a replay branch; no diagnostic
printing occurs during the workload. The replay toggles only the named work.
These are service diagnostics, not clean application timing. Clock costs,
task populations, all forks and adverse service outcomes are retained in TSVs.
Do not add the local savings from different images as a controlled total gain.

Argument-layout replay recomputes emission's old arrays/convention while both
modes keep the new Prepared arrays. Emission layout work falls from
1.768/1.891 ms to 1.421/1.510 ms, about 49/53 ns per call site. Full service is
175.913/176.738 ms in the controls and 181.439/186.397 ms with reuse: this small
local saving did not produce a whole-service win in those forks. The 2,492
methods successful in all four captures have equal nmethod sizes and native
code spans. This is not byte-for-byte machine-code equality.
See [argument-layout data](direct-baseline-data/reuse-abi-service.tsv).

The first fingerprint differential records about 80.6% of signature decodes
using cached fingerprints. Decode work falls from 3.486/3.547 ms to
2.598/2.644 ms, including descriptor fallback. However its replay control still
performs the native fingerprint lookup, so this isolates decoding rather than
the net change versus the old source. Lookup timers also perturb the measured
cost. Full service is 198.844/190.463 ms in controls and 169.830/183.751 ms with
reuse; those totals alone do not establish a causal compiler speedup.
See [decode data](direct-baseline-data/reuse-fingerprint-service.tsv).

A corrected differential times lookup plus decode in one scope, with control
skipping the lookup entirely. Root construction costs 0.903/1.092 ms in controls
versus 0.696/0.701 ms with fingerprint reuse. At call sites, however, the new
lookup plus decode costs 2.826/2.708 ms versus descriptor-only 2.104/2.658 ms.
Combined root/call work changes by +0.515/-0.341 ms, so there is no consistent
net saving. Whole service varies from 146.871/185.446 ms in controls to
168.126/168.386 ms with reuse. The final source therefore keeps the directly
available root fingerprint and removes call-target lookup. It does not add a
new persistent cache to rescue that result. See the complete
[net signature data](direct-baseline-data/reuse-fingerprint-net-service.tsv).

Field replay uses CI for every field while retaining the common scalar
FieldAccess refactor. Whole field-resolution work falls from 12.596/12.831 ms
to 6.513/6.611 ms. Reuse takes 4,776/4,789 snapshots, leaving 1,704/1,712
successful CI paths. There are 26 failed resolutions per fork as well. About
73.5% of successful field resolutions avoid CI. Local differences are
6.083/6.220 ms, roughly 48%. Full service is 204.068/195.322 ms for controls and
180.973/182.398 ms with reuse. These task populations differ slightly and full
service contains other variable work; only the named resolution reduction is
the isolated claim. See [field data](direct-baseline-data/reuse-field-service.tsv).

The previous coarse expanded-tier service budget was about 139–145 ms plus
27–30 ms of request work. Eliminating a redundant layout, decoding cached
signatures and saving about 6 ms of field work cannot alone meet the required
early-tier budget. The larger scope/map and ordinary nmethod installation costs
remain, as does the question of execution savings and ordinary-tier handoff.
The [architectural audit](direct-baseline-reuse-audit.md) separates those costs
and the interpreter-frame alternative; no codelet rewrite is included here.

## Why profiler captures failed the enabled-tier check

The earlier full-workload profiler captures were invalid as enabled-direct
samples. The first explicitly retained zero successful tasks. Two followups
failed their broad-installation check before saving detailed records; their
exact original counts remain uncertain. No failed capture was discarded or
relabeled as successful.

A separate short reproducer saves every record and the runtime JVMTI flags
before checking expectations. The target normal method executes exactly 64
times in every case:

| Setup | can_walk_any_space | Successful direct installations, all tasks | Target installations | Excluded before emission |
|---|---:|---:|---:|---:|
| Plain | 0 | 192 | 1 | 0 |
| async-profiler 4.6 | 1 | 0 | 0 | 216 |
| CPU profiler with its can_tag_objects request removed | 1 | 0 | 0 | 217 |
| Built-in JFR | 1 | 705 | 0 | 1,821 |

All four runs exit normally. Every excluded record has zero code_start and
nmethod_bytes: exclusion precedes emission and installation. JFR initializes
after some early direct compilations, accounting for its 705 successes; the
target executed after recording setup still does not install. Those early
successes do not validate a JFR profile as a representative enabled-tier run.
See [complete compatibility counts](direct-baseline-data/reuse-profiler-compat.tsv).

The cause is the compiler's explicit jvmti_can_walk_any_space exclusion in
[DirectCompiler::compile_method](../../src/hotspot/cpu/x86/directBaseline_x86.cpp).
[JvmtiManageCapabilities::update](../../src/hotspot/share/prims/jvmtiManageCapabilities.cpp)
unions its always-available capability sets and derives can_walk_any_space from
can_tag_objects. Removing that one request from the profiler does not prevent
the global flag from becoming true. JFR also creates an internal JVMTI agent.
This is deliberate tooling/admission interference, not a demonstrated nmethod
installer bug. It does not establish that active direct frames are safe for
heap walking, and the restriction was neither bypassed nor weakened.

The time-weighted accepted/rejected/adapter question therefore remains open.
Offline JFR examples can identify ordinary interpreted bodies, but cannot
attribute enabled-direct savings; mixed stacks do not measure adapter CPU, and
native samples can include blocking. A valid next sampler must preserve direct
installation and identify native PCs/Java BCIs without enabling these JVMTI
capabilities. No new policy, threshold or application timing campaign is part
of this batch.

Simply calling AsyncGetCallTrace from a non-JVMTI native sampler is not yet a
working alternative: [forte.cpp](../../src/hotspot/share/prims/forte.cpp) rejects
traces unless should_post_class_load is enabled and returns only already-created
jmethodIDs. That source prerequisite and direct-tier admission must both be
validated before another profiler run. Passive PC attribution could identify
direct/ordinary native ranges, but needs an additional safe interpreter
Method/BCI attribution mechanism to answer the rejected-body question.
