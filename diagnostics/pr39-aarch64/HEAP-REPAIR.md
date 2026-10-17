# Array caller repair for native review

Source `043b59159912d84c3be8e09bbb5e442e08bc9b8b` separates the AArch64 primitive
array caller from bulk dispatch. It addresses the call boundaries identified in
[run 39045104945](RESULTS-39045104945.md); it has **not** been measured or executed
on native ARM. The prior 25 regressions remain unchanged evidence.

The array overloads now select an architecture-specific Java path at build
time. Sub-word inputs use their existing scalar comparisons. At most two
words are compared in the ordinary caller; an early mismatch returns before
any bulk helper, cap calculation or stub entry. Full-array overloads share the
range entry. Public `Arrays` guards, exception order and return conventions
are unchanged. No inlining budget or force-inline annotation is added.

Eight private typed `mismatchLarge` overloads use `@DontInline` to keep bulk
work outside those callers while retaining concrete array types and constant
scales for the existing intrinsic. Only after the hot prefix matches do they
scan the rest of the existing **128-byte admission range** in Java. That
remainder is at most 112 bytes, below intrinsic admission. Differences at 25/82
therefore return from this compiled helper before the cap/stub setup. Both
prior images already called a helper for these cases; this change removes
setup from the selected path rather than claiming an extra call explained
the entire measured loss. The 128-byte minimum and 2 KiB heap cap are unchanged.

On an equal admission range, bulk dispatch keeps all original arguments and
the existing tail/NaN handling. The float prefix classifies the loaded raw
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
  prefix/tail/cap/chunk boundaries, preceding stores, differing NaN payloads,
  signed zero, later differences and exception order.
- All 59 pre-existing methods have identical normalized bytecode on a
  non-AArch64 build. HotSpot/native dispatch sources are unchanged.
- 338 bounded prefix/index model checks pass across scales 0–3 and both byte
  orders. The ordinary Java sources and test compile with Java 27.
- The local precompiled-callee graph fixture inlines 15 of 16 public boundaries.
  `doubleRange` still outlines on x86. A baseline counterfactual reproduces
  that same rejection with the original Java body: public code 1608 bytes and
  wrapper 104 bytes. This does not establish ARM code size or justify relaxing
  the new native gate: **all 16 must pass before timing**.
- 33 qualification-driver tests pass, including fixed rows, shared deadlines,
  no-retry gates, required result IDs and process-group cleanup.

The new native-only call-boundary test deliberately compiles callees before
callers, retains raw Ideal output and checks ordinary inlining without a
library force-inline directive. The local double result is preserved as an
unresolved ISA-dependent code-generation question. No native recovery or
application/x86 speedup is claimed. [The focused campaign](HEAP-CAMPAIGN.md)
is prepared for independent review and separate launch approval.
