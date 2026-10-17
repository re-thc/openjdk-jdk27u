# Public range inlining remains blocked

The caller split at `7f0bf03bd947` does **not** establish recovery of the
measured heap regression. All eight public range wrappers still call
`Arrays.mismatch` in the local C2 fixture. The one-word alternative also fails
three ranges and is not applied. No native timing campaign should launch on
this evidence. PR39 remains draft and unqualified.

## Exact rejection and profiles

The original boundary capture has Ideal and PrintInlining output, but no
`LogCompilation` nmethods or replay-size records. Its XML-like tty captures
cannot supply exact native sizes. A fixed diagnostic execution on the existing
x86 policy VM now retains compilation XML and supported `DumpReplay` output.
Only the isolated Java patch selects the ARM branch; no JDK/HotSpot build,
native ARM execution, CI or timing was performed.

These are the **exact `ciMethod.inline_instructions_size` values**, including
HotSpot's skipped-instruction subtraction, rather than XML main-code bounds.
Support size is queried during compilation of the public range method; public
range/full sizes are queried during compilation of their respective wrappers.
All eight range failures name the exact range signature and give the same
reason: `already compiled into a big method`.

| Kind | Support range | Public range | Public full | Compact public range |
| --- | ---: | ---: | ---: | ---: |
| byte | 512 | 1008 | 552 | 992 |
| boolean | 512 | 1008 | 552 | 992 |
| char | 528 | 1016 | 552 | 992 |
| short | 528 | 1016 | 552 | 992 |
| int | 528 | 1016 | 544 | 992 |
| long | 688 | 1200 | 704 | 1024 |
| float | 720 | 1216 | 712 | 1128 |
| double | 872 | 1400 | 736 | 1200 |

Both x86 and AArch64 use non-tiered `InlineSmallCode=1000`; these forks do not
use the separate tiered 2500 override. The cold-site native cutoff is 250 and
`FreqInlineSize` is 325 bytecodes. The observed range sites are hot, and the
public range body is only 69 bytecodes. Neither the cold cutoff nor the hot
bytecode limit caused these failures. Support fits, but the compiled public
method with two range checks, six dynamic arguments and length/result handling
exceeds the native-size cutoff. Full-array zero offsets produce smaller code.
No compiler budget or library force-inline policy is changed.

The fixture intentionally profiles difference 1 at lengths 8/128/4096, then
compiles callees before callers. This ordering is supported by the retained
native byte-8/difference-1 logs from run 39045104945: public method 419 precedes
worker 420 in both images. Both call sites have count 1024 and profile factor
1.0; the base says `inline (hot)` and candidate says `already compiled into a
big method`. Thus the central profile/order mechanism is real. The fixture is
still a targeted early-path check, not all possible profiles, and these x86
instruction sizes do not establish AArch64 instruction sizes.

## Bounded source hypothesis

The retained compact experiment keeps typed first-element guards, uses one
word for byte/boolean/char/short/int, and preserves second-element checks for
long/double. Float uses raw integer NaN classification with canonical bulk
fallback. It inlines 13/16 public wrappers: long, float and double range still
fail the same size filter. The five repaired ranges have only an eight-byte
margin. Moving the second word into bulk also moves byte differences 8–15,
including the measured position 10, across a helper call. No timing establishes
that tradeoff. This disproves the claim that this compact split clears all
16 local mechanism gates; native recovery remains unknown. It does not prove
that every possible Java source repair is impossible.

## Store evidence and required gate

C2 installation alone did not prove that prefix loads were inline between the
stores. The test now calls the public API directly inside each Store wrapper,
so its test-only `dontinline` rule cannot create a hidden Range-wrapper boundary.
It retains eight additional Ideal graphs and requires both stores, an inlined
prefix load, and no public/Support/prefix/generic mismatch call or mismatch
leaf. All original **16 public cases remain mandatory**, plus these eight
Store cases. Compilation XML and replay records are retained with the graphs.

The current local Store graphs each contain two stores and a public range call,
with **zero inline prefix loads: 0/8 pass**. The eight full-array cases pass;
eight ranges and eight Stores fail. The verifier rejects the complete capture.
Six semantic modes still pass (interpreter, C1, C2 G1/Serial/ZGC, intrinsic
disabled), but they do not replace the missing ordering graph proof.

[Machine-readable evidence](inline-boundary-review.json) retains per-signature
sizes, exact rejection reasons, compile identities, call targets, store/load
counts and hashes. Raw logs, replay files, source experiments and commands stay
under `/workspace/scratch/pr39-inline-mechanism-20261017`; the experiment is not
production source. [inspect_boundary.py](inspect_boundary.py) reads matching
process/compile identities and fails on a mismatched replay capture. The
[proposed timing matrix](HEAP-CAMPAIGN.md) remains blocked by this source issue.
