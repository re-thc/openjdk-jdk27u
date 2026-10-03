# Unicode native binding at the existing String origin

The public UTF-16 encoder and compact UTF-8 decoder call typed native methods on
`java.lang.StringCoding` directly. Public conversion does not load or call the
test-only `StringCodingAccess` wrapper. Descriptors remain `([BII[BII)I`, with one
native registration table and one tooling-revocation registry.

## Cold admission and initialization order

The existing String methods retain Java conversion for eligible spans below
1024 input bytes while the converter is cold. A direct `@Stable` readiness-field
read avoids resolving another Java helper on that path. Once qualifying bounded
larger interpreted work initializes the converter before hot compilation, the existing smaller
leaf thresholds remain available to subsequent interpreted or newly compiled
work. UTF-16 input bytes are twice the number of code units; UTF-8
input bytes are the remaining private source span after the compact-prefix scan.
No invocation counter, startup hook or speculative converter warmup is added.

C2 makes a separate, best-effort origin admission decision. If the live volatile
readiness field is false while parsing an original String encoder/decoder, C2
may retain Java for the entire compiled method, including larger later calls and
calls after another thread initializes the bindings. It takes the first existing
size guard's Java fallback edge before consulting that branch's profile. Merely
folding the later readiness call would leave earlier size-profile traps in place.
The original method, bytecodes, MethodData, scopes and complete deoptimization
state are retained. There is no alternate Java body, helper call or new global
state on the String path. A method compiled after readiness is published keeps
native admission, with a minimum of 64 UTF-16 code units. The interpreter keeps
the Java source's independent 16-unit lower bound. C2 uses non-speculative branch
probabilities for the validated optional min/max/readiness/null guards, so size
transitions retain both routes without a profile-driven uncommon trap.

C1 independently chooses Java when bindings are unready at compilation and uses
64 UTF-16 code units as its ready encoder minimum. Nonprofiling compilation
makes one admission decision at the original size guard: cold work goes to the
existing Java fallback, while ready encode compares against 64. The original
pre-pop state retains the Java operands for reexecution. It does not also
apply the fallthrough policy or reread readiness during that decision.
Profiling levels 2/3 leave the original minimum-size `If` and `BranchData` intact.
On that branch's empty-stack fallthrough (encoder BCI 44, decoder BCI 13), an unprofiled forward edge skips to
the existing Java fallback. Ready encode adds an unprofiled 64-unit guard there.
Its `StateBefore` is a full copy of the original BCI 44 state, including caller
frames; deoptimization reexecutes the original optional region. The synthetic
continuation is not placed in the bytecode block map. Neither policy edge counts
as a Java branch or loop backedge, and skipped optional guards acquire no
fabricated profile counts. The separate C1 Latin1 BCI 60 lowering is unchanged.

The shared CI proof validates the complete optional-region bytecode shape and symbolic
references, current String/StringCoding transformation and redefinition history,
and the static boolean volatile stable field. It reads the live mirror under VM
state with acquire semantics; it does not constant-fold the default stable value.
Patched java.base modules, changed layouts and tooling-sensitive configurations
retain ordinary parsing. After this complete proof, unsupported collectors,
unaudited platforms and `UseTmfyStringCoding=false` retain the original Java route
for compiled public origins, avoiding an unqualified JNI round trip. Direct native
callers retain JNI, as do explicit `DisableIntrinsic` controls for eligible work.
The interpreter keeps its independent native admission; this compiler policy does
not qualify borrowed-pointer leaves for any additional collector or platform.
The proof still declines when StringCoding is unresolved or uninitialized; it
does not suppress class initialization. Current StringCoding has no
`@AOTSafeClassInitializer` annotation or archived instances, so it is excluded
from initialized-mirror archiving. Ordinary CDS/AOT restores a fresh mutable
readiness value of false and clears native method pointers. The AOT fixture
checks false readiness before any Latin1 warmup, performs fresh registration,
and verifies Unicode conversion and exact native dispatch before its mixed
loops. This does not establish support for a future initialized StringCoding
mirror: a Java readiness field alone would not validate restored process-local
native bindings. Origin and readiness-helper evolution dependencies preserve
late redefinition and breakpoints.
The exact native target is registered with existing tooling revocation even when
the call is omitted, so late native-bind capability changes, kernel or registration-
bridge rebinding and installation races also revoke this policy.

The initializer claims an in-progress flag under `StringCoding.class`, then
releases the monitor before native resolution or registration. `NativeLookup`
resolves `StringCoding.registerNatives:()Z` directly to the VM without libjava or
a helper-class initializer. Before `is_init_completed()` the bridge returns false
without converter setup. After bootstrap it validates backend admission before
preparing the registration-table exemption, then registers the native methods.
Only after registration returns does Java release-publish the volatile stable
readiness field from false to true. The field is never reset.

A NativeMethodBind callback runs before native-pointer publication. On the same
or another thread it sees the in-progress state and retains Java conversion.
No monitor is held while a callback might wait for another thread. Default-zero
stable values are not constant-folded; after true is published, C1/C2 can fold
the readiness field. Later native rebinding invalidates leaf callers without
resetting readiness, and ordinary JNI observes the replacement binding.

Registration checks the original native method count but does not allocate
jmethodIDs speculatively. A native-prefix transformer can legally replace an
intrinsic native with a Java wrapper and a renamed native. A catalogue mismatch
revokes intrinsic bypasses while ordinary `RegisterNatives` resolves the prefixed
method, preserving wrapper observability and normal registration errors.
Interpreter entries consult the sticky revocation byte.
C1/C2 record the exact native method and evolution dependency before installing
a leaf caller. `Compile_lock` serializes method-ID publication, installation and
revocation: a raced compile is either rejected at installation or already has an
ID through which its dependent nmethods are invalidated. Existing method handles,
old-method checks and evolution dependencies cover redefinition races.

## CPU, OS and retained initializer ordering

String and C1 String-loop initialization use
`TmfyStringCoding::initialize()`. On x86 this reuses the effective VM CPU flags,
after `UseSSE`, `UseAVX` and per-instruction restrictions. Three audited groups
cover the pinned library's complete compiler target attributes:

- SSE4.2 plus POPCNT and preceding SSE levels
- AVX2 plus BMI1/BMI2, LZCNT and the preceding group
- AVX512F/DQ/CD/BW/VL/VBMI/VBMI2/VPOPCNTDQ, PCLMUL and preceding groups

The existing signal save/restore check is passed independently. Failed signal
preservation suppresses both AVX groups even if CPU/XCR0 feature bits are set.
The selector compares each implementation's required flags against the admitted
mask. Full target groups also cover compiler attributes omitted from the library
metadata; simdutf 9.2.1 aliases CD and VPOPCNTDQ metadata bits, so both CPU features
are explicitly required. A version assertion requires re-audit after an update.
Unimplemented platforms and standalone native tests retain library detection.

An existing backend, including a concurrent initializer's CAS winner, is checked
against the String VM mask before native registration. An incompatible choice
leaves the immutable backend untouched and retains Java conversion without an
exception or native output stores. The public conversion paths share this same
initializer; no other feature-specific registration bridge is included.

## Pointer, failure and test contracts

Initialization never borrows an array pointer. The bounded leaves retain their
range, capacity, work and runtime gates and never safepoint. Ordinary JNI uses
bounded private copies. Only `-1` permits Java replay with no stores; malformed
input completes native replacement, and other invalid statuses throw.

Required checks include interpreter/C1 genuinely cold small work followed by bulk
admission before hot compilation and subsequent small leaf use; independent C1/C2
cold small compilation followed by large/small work without
registration, a changed compile ID, traps or decompilation; late explicit readiness
without redirecting that compiled Java path; early-ready C1/C2 leaf use; initialized
16/63/64/maximum/oversized encoder transitions without new traps; C1 constant-length
inlined callers and original minimum-branch profile counts; explicit default-CDS controls; registration-bridge rebinding; same-thread/cross-thread first-use reentry, post-store errors,
late rebinding, boundary/GC/stack tests, ISA-disable selections and real AOT cache
production. `TestStringCodingCpuSelection` runs eight VM-flag restrictions and
checks public conversion plus the selected backend group. The standalone
`native/unicodeReplacementKernel.cpp` oracle covers explicit masks, compatible
and incompatible prior selections, and concurrent initialization/CAS behavior
using only host-supported implementations. The current tests do not
independently inject failed OS signal preservation.

The genuine AOT test requires the named `tmfy_stringcoding_initialize` and
`throw_tmfy_stringcoding_error` C1 runtime blobs to be restored in compatible
productions. Their three process-local external addresses must be remapped;
an aggregate C1 blob count alone is not sufficient evidence. GC/CPU mismatch
productions retain the upstream cache-rejection checks instead.

Performance validation must separate first conversion from process-total time,
state UTF-8 byte counts and UTF-16 code-unit counts explicitly, and retain a
matched patched-stock control for module-patch probes. Final unpatched-image
validation must separately measure small-only C1 and C2 warmup, the first later large
conversion and the following small call. Shape equality and routing tests alone
do not establish absence of performance regressions.

## C1 regression coverage

Integration must build both release and assertion VMs, run the C1 route/profile/
constant/CDS fixtures and the existing C2 routes, then check late tooling, GC,
stack, native reentry and restoration scenarios. Measure fresh-JVM cold bulk and
small-warmup-to-large transitions separately from initialized steady state. C1's
initialized 16-unit mostly-ASCII case must return to the Java route without
losing the measured 64-unit opportunities; the independent Latin1 BCI 60 path
must retain its existing behavior. No performance conclusion follows from the
syntax checks or route expectations alone.
