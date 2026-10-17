# Array caller split and unresolved inlining

Source `7f0bf03bd947a95c551da4fa0352257738e5f281` separates the AArch64 primitive
array caller from bulk dispatch. It has **not** resolved the public range call
boundary identified in [run 39045104945](RESULTS-39045104945.md). The
[exact inlining review](INLINE-REVIEW.md) retains the failed size decisions and
rejects the compact source hypothesis as a complete repair. The source has
not been measured or executed on native ARM. The prior 25 regressions remain
unchanged evidence; no timing campaign should launch on this source evidence.

The array overloads now select an architecture-specific Java path at build
time. Sub-word inputs use their existing scalar comparisons. At most two
words are compared in the ordinary caller; an early mismatch returns before
any bulk helper, cap calculation or stub entry. Full-array overloads share the
range entry. Public `Arrays` guards, exception order and return conventions
are unchanged. The existing first-element Java accesses remain ahead of unsafe
word loads, including their null/bounds exception order. No inlining budget or force-inline annotation is added.

Eight private typed `mismatchLarge` overloads use `@DontInline` to keep bulk
work outside those callers while retaining concrete array types and constant
scales for the existing intrinsic. Only after the hot prefix matches do they
scan the rest of the existing **128-byte admission range** in Java. That
remainder is at most 112 bytes, below intrinsic admission. Differences at 25/82
therefore return from this compiled helper before the cap/stub setup. Both
prior images already called a helper for these cases; this change removes
setup from the selected path rather than claiming an extra call explained
the entire measured loss. The intrinsic's 128-byte minimum and 2 KiB heap leaf cap are unchanged.
The array path finishes a request of at most 128 bytes in Java. For larger
requests it continues after the matched 128 bytes and restores the public index,
so the suffix intrinsic first becomes eligible at 256 total bytes. The focused
plan checks equal 255/256/257 explicitly; this crossover is not a measured optimum.

An equal admission range is not rescanned. Larger scans pass a remaining
array subrange to the existing implementation, then add the compared-element
count to a nonnegative result. Complemented tails remain valid because 128 bytes
is a multiple of the Java word width. C2 still preserves every argument of
that intrinsic call for its existing fallback and deoptimization; original
array objects and indices remain ordinary Java locals, with no shifted raw
pointer crossing a call. The existing tail/NaN handling is retained. The float prefix classifies the loaded raw
NaN pair and requests a full rescan when canonical comparison is needed. Its
bulk helper may skip the hot prefix only after raw equality; it cannot skip an
unchecked element after a NaN pair. Double's bounded two-element prefix uses
canonical comparisons. NaN payloads, signed zero and subsequent differences
remain part of the semantic tests.

`ArraysSupport.vectorizedMismatch` itself, all HotSpot files, native/mixed
selection, alias-ordering barriers, bounded leaf/polling behavior, mapped-fault
handling and reachability code remain unchanged from `93926`. Native 4 KiB benefit
and native/mixed recovery are source-preserved, but must still pass the fixed
native gates. There is no new comparison library, assembly or public API.

## Local evidence and its limit

[The validation record](heap-boundary-validation.json) identifies source, VM,
commands, raw log hashes and the existing local policy VM's production-source
hashes. No JDK or HotSpot build was performed. An isolated Java patch selects
the AArch64 library branch on that existing x86 VM; this is compiler/semantic
validation, not native ARM execution or emulated performance.

- Interpreter, C1 and C2 semantics pass, including G1, Serial and ZGC. Coverage
  includes every primitive kind, full/range calls, independent offsets,
  prefix/tail/cap/chunk boundaries, same-method stores before and after comparison, differing NaN payloads,
  signed zero, later differences and exception order.
- All 59 pre-existing methods have identical normalized bytecode on a
  non-AArch64 build. HotSpot/native dispatch sources are unchanged.
- 338 bounded prefix/index model checks pass across scales 0–3 and both byte
  orders. The ordinary Java sources and test compile with Java 27.
- The final guard-preserving source's unsupported x86 graph fixture inlines
  all eight full-array wrappers and outlines all eight range wrappers. These
  failures are retained. A separate baseline counterfactual also outlines
  double range (public code 1608 bytes, wrapper 104 bytes); no corresponding
  baseline claim is made for the other seven ranges. This does not establish
  ARM instruction size or validate recovery. Exact replay records now show
  public range sizes of 1008–1400 bytes and the same big-method rejection
  recorded in the prior native byte case. This is a demonstrated unresolved
  mechanism, not an ISA-based exception. **All 16 public and eight Store/prefix
  native graphs must pass before timing.**
- 33 qualification-driver tests pass, including fixed rows, shared deadlines,
  no-retry gates, required result IDs and process-group cleanup.

The native-only call-boundary test compiles callees before callers and retains
Ideal output, compilation XML and replay records under ordinary inlining.
Eight Store graphs now require the prefix loads in the same graph as both
stores, with no hidden public/Support/prefix call. All eight currently fail:
C2 installation alone was not an ordering proof. Six semantic modes pass with
the revised direct-API Store wrappers. No native recovery or application/x86
speedup is claimed. [The focused campaign](HEAP-CAMPAIGN.md) remains blocked by
the public range mechanism.
