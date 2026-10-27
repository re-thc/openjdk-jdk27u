# Interpreter-frame category-1 semantic foundation

Runtime source `6d719bb6078` extends the opt-in WhiteBox-only pilot from
`452b85eef42`. Normal admission and C1/C2 policy are unchanged. This is semantic
qualification; no timing or new application census was run.

The generator now accepts ordinary instance-entry aliases, category-1 int/oop
signatures and locals, cached reference/integer constants, resolved class
mirrors/casts/instanceof, cached instance/static field reads and forward
integer/null/reference branches. Values remain canonical vtos, with the
original BCP saved at each completed bytecode. Null/cast/resolution fallback
precedes operand/profile mutation; committed branches update profiles and BCP
once, including a target outside the emitted prefix. Ordinary returns and
unsupported instructions use polling interpreter dispatch. Class literals
use the klass cache and mirror handle, not the resolved-reference map.

Generation embeds no Method/klass/oop addresses and performs no linking or
initialization. Actual-get resolution authorizes scalar field snapshots;
static reads retain class initialization and mirror-handle checks. Strong
Serial/G1 reads reuse existing collector-aware helpers. Cold field sites end
an immutable prefix rather than become native later. Reference-special field
semantics, other collectors, constructors, new handler support, category-2/FP,
arrays, writes and backward branches remain outside the new batch. Original
integer-only handler/fallback controls remain intact. No call continuation is
included in this checkpoint.

Independent source review found and corrected a class-literal reference-map
hazard and VerifyOops diagnostic-string lifetime. Each accepted immutable slot
retains its own reference-counted debug strings for code lifetime. The reviewed
pre-emission reserve is 2048 bytes per supported opcode and 512 for dispatch,
including bounded subtype/profile, VerifySecondarySupers/VerifyOops helpers,
BCP bookkeeping and VerifyActivationFrameSize. A post-emission audit remains.
The sixteen 4 KiB slices and no-recycling policy are unchanged.

Incremental release and fastdebug builds passed with the landed PR104
synchronous logging pattern. On each coherent image all eight focused jtreg
files passed: the new InterpreterFramePilotReferenceTest, existing pilot and
guard tests, and all five DirectBaseline tests. The reference fixture runs
all three explicit producer modes with Serial and G1, checks complete emitted
body BCIs for its supported cases, initializes MDOs, and covers signed/narrow/
volatile reads, reference joins, cached constants, class literals without an
oop-reference map, null/unresolved/success/failure casts and exception fallback.
The existing guard tests preserve forced-poll opt-in and late-breakpoint
fallback, and prior pilot tests preserve GC/frame walking, unloading, C1
handoff and concurrent publication. A collection after the new reference
fixture returns does not itself prove suspended derived-oop roots; that is an
explicit call-stage qualification obligation.

The first release compile failed on stale C++ API names (Label and CP map
access), then passed after correction. Its log is retained with all later
results. Private images/logs remain local; no public action occurred.
