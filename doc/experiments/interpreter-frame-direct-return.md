# Immutable call-site returns

This local change implements the reviewed design in
[interpreter-frame-direct-return-design.md](interpreter-frame-direct-return-design.md).
It preserves design checkpoint `aa7515a358b`, qualified runtime `38b1b63a0ea`
and their images/evidence. It changes neither admission nor C1/C2 policy. The
pilot remains opt-in and explicitly prepared; this is not application qualification.

## Independent review and implementation

An independent read-only source review approved the standard single return-PC
word, with r8 live only until that PC is pushed. Interpreter frame recognition,
root walking, exception routing, deoptimization and continuation freeze/thaw
accept the immutable interpreter-arena PC. No new frame slot or persistent
register is needed. The review confirmed that OnLoad capability availability is
permanent in this source, while `can_walk_any_space` can change through a Live
capability update and must be read fresh. A correction to the design document
removes FRAME_POP from the literal INTERP_EVENT_BITS list; its exclusion follows
from the access-local/exception availability flags instead.

The producer emits a distinct typed return island at each call with a generated
successor. Existing typed-epilogue emission repairs last_sp/SP, restores BCP and
locals, profiles reference returns, removes arguments and handles ordinary
PopFrame/early return exactly once. The island then canonicalizes the result,
advances/saves BCP, reads enabled/old-obsolete/late-walk state, tests the existing
poll and branches directly to the native successor. ASSERT-only mutable debug
flags remain checked. Normal execution contains no continuation counter; the
existing startup test opt-in generates that instrumentation only when requested.

The independent review found no stack-watermark requirement for an additional
return-site poll: activation removal already owns that barrier, and ordinary
invoke-return dispatch defaults to no poll. This first replacement retains the
existing poll rather than combining a second progress-policy decision.

An immediate ordinary return uses the normal typed interpreter return entry.
For an unknown successor after prefix truncation, the deferred return label
resolves to an ordinary-return trampoline before any generated cleanup. This
preserves the caller frame and ordinary return bytecode; it is not Java tail-call
elimination. Unresolved calls still fall back before any effect or VM resolution.

Return labels are distinct from Java BCI labels. Full inline call/island emission
is included in the existing 2048-byte opcode bound; the original 3832-byte total
code budget, fallback reserve, 4KiB slices, 16-slot arena and no-recycling lifetime
remain. Deferred `bind_loc`/`patch_instructions` fixups complete before release
publication. The contiguous-prefix invariant bounds unresolved final-call
trampolines to one. The former runtime BCI/native map is removed; the reserved
tail contains only the diagnostic native-site count and code-size header.

## Qualification plan

Retain all eleven focused tests on release and fastdebug, plus maximal profile
width/type-profile/VerifyOops debug call controls. Existing call tests cover
multiple sites, recursion, reference/void results, GC roots, native/C1/C2 callees,
exceptions, disable-in-callee, redefinition and late JFR fallback. New controls
assert zero native continuations for both immediate-return and unsupported-next-
bytecode cases. Virtual-thread blocking/stack-walking/GC and deoptimization of a
compiled blocked callee test the ordinary return-word freeze/thaw path.

Build, qualification and the single smallest matched call comparison are pending.
All outcomes, including failures and regressions, will be retained privately.
