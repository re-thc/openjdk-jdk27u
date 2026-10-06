# Bounded native work and portable UTF-16 alignment

Review follow-up measured locally, 2026-10-06 Asia/Taipei (2026-10-05 UTC). This supersedes the
alignment/performance-opportunity discussion in `FINAL_REVIEW.md`. StringZilla
remains enabled by default, with `-XX:-UseStringZillaIntrinsics` as the opt-out.
No upstream JDK or StringZilla PR was opened for this follow-up.

## Changes

The odd-byte adapter previously compared every candidate interior from the
beginning. A real odd-byte occurrence could therefore send a reverse search
through almost the entire needle at every repeated-prefix candidate, even when
Java's reverse search rejected the penultimate character immediately. The new
verifier starts at the search-direction end and checks both ends inward. This
also preserves inexpensive rejection of near-start mismatches. Only the prefix
or suffix not excluded by the upstream byte search is checked.
The batch filter proves the first/last characters; verification checks only the
interior. Scalar tail candidates explicitly check the boundaries first.

The first/last-character batch filter is one portable C implementation. The
handwritten AVX2 `_mm*` and NEON vector operations are removed. GCC/Clang compile
an AVX2 copy of that C loop through a function-target annotation, selected only
by the existing VM capability gate. Baseline and ARM builds compile the same
loop for their normal target. This retains compiler-generated vectorization
without maintaining separate ISA algorithms. The 28 vendored StringZilla 5.2.0
files remain unmodified. HotSpot still needs its existing ABI entry glue;
the interpreter adds a size comparison/branch on each architecture.

Every StringZilla search/equality leaf, including JNI fallback, independently
rejects excessive work before reading arrays. The ABI constants in `jvm.h` are
64 KiB maximum source bytes and, for substring search, a source-byte-length
times needle-byte-length budget of 4 MiB. `-2` means resume Java; `-1` remains a
search miss. The product bounds worst-case candidate verification by a fixed
amount, including adversarial interiors. It is a work proxy, not an elapsed-time
guarantee or a claim that the aligned algorithm is globally linear.

Java splits large requests into bounded windows, overlapping by needle length
minus one code unit and respecting forward/reverse search order. When the
needle would occupy more than half the allowable window, the original Java
search handles the request. This prevents nearly complete window rescans.
Large interpreter/C1 equality uses a range bridge with the existing search
calling shape; C2 retains its platform equality and forward-search intrinsics.
Bounds apply to StringZilla leaves, not every existing JDK intrinsic.

All three Java chunk helpers were forced through C1 and C2. Compiled output
contains backedge safepoint polls for `searchLarge`, `searchCharLarge`, and
`equalsLarge` in both tiers. Heap addresses exist only inside bounded calls;
each subsequent call derives fresh addresses from rooted Java arrays.

The direct private-equality method-handle test found incomplete C1 deoptimization
state. The guarded private intrinsic now captures full pre-call state, and
method-handle calls parse the Java equality body. The C1 length inputs are
explicit HIR array-length nodes, allowing value numbering to reuse a caller's
length load. C1 parses a Java replacement for the checked equality wrapper:
tiny comparisons use existing word-load intrinsics, first-byte misses return
early, ordinary sizes reuse the equality intrinsic and large arrays call the
chunk helper. Its Java branches preserve caller state without alternative
Java/leaf calls hidden inside one LIR block. The substitution explicitly uses
static invocation semantics. The new range entry is also registered with C1's diagnostic name
lookup, which fastdebug verification requires.

## Performance measurements

The baseline is local commit `b1b2dc62089443623243f51a8a205657cf548b84`, whose
tree matches remote commit `6e8756207e3afb50145510d8c60ca2c16b16ab0b`.
Before/after use StringZilla enabled. These measure the review fixes against the
previous fork implementation, rather than feature-on versus feature-off.
The baseline image's VM, libjava and modules are detached, frozen copies; their
hashes were checked again after rebuilding.

AMD EPYC 9V74, CPU 0 pinned, JMH 1.37, one active processor, Serial GC, CDS off.
Each case has two isolated forks, three 500 ms warmups and five 500 ms
measurements per fork. Interpreter uses `-Xint`, C1 stops at level 1, C2 disables
tiered compilation. Builds and functional tests finish before timing.
`StringZillaLongNeedle` constructs an actual odd-byte occurrence and validates
expected results with an independent scalar model. It measures 64/256-character
needles, near-start/near-end mismatches and periodic crossed-byte input. Small
and large equality controls use the existing `StringZillaSearch` benchmark.
The long-search `length` parameter counts the repeated prefix; the full source
contains another `needleLength + 1` code units holding the odd-byte occurrence.

Use `run-bounded-benchmarks.sh TEST_JDK JMH_CLASSPATH OUTPUT_DIR [CPU]` sequentially
for before and after. JMH classpath must include both benchmark classes and
their generated harnesses. Full means, intervals, raw fork samples, VM arguments
and artifact/source hashes are recorded in `bounded-results.json`.

Means ± JMH 99.9% confidence half-width; higher before/after is faster.

| Case | Tier | Before (ns/op) | After (ns/op) | Before/after |
| --- | --- | ---: | ---: | ---: |
| near-end search, prefix 512, needle 64 | INTERPRETER | 4732.17 ± 451.23 | 794.06 ± 6.97 | 5.96× |
| near-end search, prefix 512, needle 256 | INTERPRETER | 7490.10 ± 218.38 | 604.78 ± 28.89 | 12.38× |
| near-end search, prefix 4096, needle 64 | INTERPRETER | 38069.24 ± 972.71 | 5299.17 ± 273.59 | 7.18× |
| near-end search, prefix 4096, needle 256 | INTERPRETER | 110983.04 ± 3664.84 | 4833.44 ± 113.00 | 22.96× |
| near-end search, prefix 512, needle 64 | C1 | 4412.85 ± 277.53 | 569.29 ± 27.31 | 7.75× |
| near-end search, prefix 512, needle 256 | C1 | 7578.14 ± 423.45 | 347.64 ± 10.30 | 21.80× |
| near-end search, prefix 4096, needle 64 | C1 | 39199.35 ± 2717.31 | 5127.58 ± 273.74 | 7.64× |
| near-end search, prefix 4096, needle 256 | C1 | 119869.94 ± 14224.64 | 4374.93 ± 150.79 | 27.40× |
| near-end search, prefix 512, needle 64 | C2 | 4223.54 ± 211.03 | 575.53 ± 36.38 | 7.34× |
| near-end search, prefix 512, needle 256 | C2 | 7547.39 ± 224.71 | 341.52 ± 3.17 | 22.10× |
| near-end search, prefix 4096, needle 64 | C2 | 38142.62 ± 1077.02 | 4975.38 ± 131.85 | 7.67× |
| near-end search, prefix 4096, needle 256 | C2 | 111976.96 ± 13070.82 | 4399.18 ± 169.51 | 25.45× |

Controls:

| Case | Tier | Before (ns/op) | After (ns/op) | Before/after |
| --- | --- | ---: | ---: | ---: |
| near-start search, prefix 512, needle 64 | INTERPRETER | 1327.96 ± 109.05 | 1134.37 ± 52.17 | 1.17× |
| near-start search, prefix 512, needle 64 | C1 | 1081.61 ± 34.14 | 863.70 ± 29.53 | 1.25× |
| near-start search, prefix 512, needle 64 | C2 | 1096.71 ± 46.23 | 880.04 ± 20.00 | 1.25× |
| crossed search, prefix 4096, needle 4 | INTERPRETER | 680.80 ± 60.02 | 622.01 ± 28.94 | 1.09× |
| crossed search, prefix 4096, needle 4 | C1 | 297.52 ± 22.89 | 275.63 ± 12.93 | 1.08× |
| crossed search, prefix 4096, needle 4 | C2 | 333.57 ± 55.14 | 265.52 ± 4.69 | 1.26× |
| LATIN1 equality, 4 characters, equal | C1 | 5.75 ± 0.24 | 5.60 ± 0.33 | 1.03× |
| LATIN1 equality, 4 characters, first-byte mismatch | C1 | 5.00 ± 0.38 | 4.54 ± 0.05 | 1.10× |
| LATIN1 equality, 32 characters, equal | C1 | 10.29 ± 0.39 | 9.99 ± 0.21 | 1.03× |
| LATIN1 equality, 32 characters, first-byte mismatch | C1 | 4.99 ± 0.26 | 4.69 ± 0.16 | 1.06× |
| UTF16 equality, 4 characters, equal | C1 | 8.30 ± 1.14 | 5.47 ± 0.13 | 1.52× |
| UTF16 equality, 4 characters, first-byte mismatch | C1 | 5.21 ± 0.46 | 4.64 ± 0.16 | 1.12× |
| UTF16 equality, 32 characters, equal | C1 | 10.24 ± 0.46 | 10.15 ± 0.41 | 1.01× |
| UTF16 equality, 32 characters, first-byte mismatch | C1 | 5.00 ± 0.23 | 4.62 ± 0.26 | 1.08× |
| LATIN1 equality, 131072 characters, equal | C1 | 2552.43 ± 105.78 | 2595.41 ± 44.34 | 0.98× |
| UTF16 equality, 131072 characters, equal | C1 | 5271.75 ± 528.03 | 5224.65 ± 326.56 | 1.01× |
| LATIN1 equality, 131072 characters, equal | C2 | 2487.99 ± 95.20 | 2394.93 ± 83.61 | 1.04× |
| UTF16 equality, 131072 characters, equal | C2 | 5547.35 ± 959.88 | 4793.76 ± 182.09 | 1.16× |

No slower control has separated 99.9% intervals in this matrix. Small mean differences with overlapping intervals do not establish a throughput change. This selected experiment does not establish zero regressions for every workload.

A scalar alignment filter and a baseline-target-only C filter were rejected because they slowed the crossed-byte controls. The retained function-target annotation lets the compiler vectorize the same portable C loop under the existing AVX2 gate. A verifier that repeated its filtered boundaries was also rejected; the final interior-only verifier preserves the near-start control. Superseded measurements are kept separately in the JSON artifact.

## Safepoint-response probe

`StringZillaSafepointProbe.java` runs a reverse UTF-16 search with 262,144
repeated characters, a 4,096-character needle, a penultimate mismatch and an
actual odd-byte occurrence. A second thread requests twelve WhiteBox safepoints
during repeated searches. This measures safepoint response, not a GC pause
distribution. It has no timing assertion and provides no wall-clock guarantee.

Compile the probe against the test WhiteBox classes. Run each frozen image
sequentially with two active processors, CPUs 0/1 pinned, Serial GC, CDS off,
`-Xbatch -XX:TieredStopAtLevel=1`, WhiteBox enabled and
`-XX:CompileCommand=dontinline,StringZillaSafepointProbe::probe`. Include the
WhiteBox classes on the boot classpath. Samples and commands are retained in
`bounded-results.json`.

| Safepoint response | Before | After |
| --- | ---: | ---: |
| Median of 12 requests | 110.535 ms | 0.112 ms |
| Maximum observed | 122.312 ms | 2.591 ms |

## Validation and remaining scope

The new public oracle checks byte/work/window boundaries, overlapping matches,
long same/mixed-coder needles, supplementary pairs, odd-byte matches, builder
logical capacity and large equality. It has eight interpreter/compiler/JNI/
opt-out modes. WhiteBox tests force chunk helpers and public callers through
C1/C2, preserve sixteen live values across equality, exercise private/checked
method handles, and assert that large equality does not deoptimize its C1 caller.

Native tests exercise all eight capability masks and every executable table.
They reject oversized byte/work requests using null pointers before any read,
compare Java/native limit constants, and check aligned matches at batch-lane
boundaries in both directions. Native ASan plus UBSan passes with alignment
instrumentation excluded for upstream unaligned loads, as in the earlier report.
This is native-kernel coverage, not a sanitized whole-JDK build.

Final release validation: **159 tests passed, zero failures/errors** across
`java/lang/String` (94), `StringBuilder` (16), `StringBuffer` (25), and
`compiler/intrinsics/string` (24). The two remaining HotSpot tests retain their
platform exclusions. This final run executed 5,138 framework cases
(5,032 TestNG and 106 JUnit).

The five targeted fastdebug tests passed, covering availability, equality,
compilation, bounded helpers and the eight-mode public oracle. Equality and
chunk-helper checks also passed with `StressLinearScan`; the bounded public
oracle passed with C1 only. The release search oracle passed with `UseAVX=0`
and `UseAVX=2`. Release image creation and all four CDS archives passed.
After the final kernel change, the native-kernel, bounded public and helper tests
passed again in fastdebug, along with native ASan/UBSan.

AArch64 cross-compilation passed. Under QEMU, all 26 public callers compiled in
C1/C2, and equality, chunk helpers, default/opt-out availability, C1 search and
the C1 bounded public oracle passed. The ARM native driver passed against the
final kernel. Earlier interpreter/C2 bridge checks remain applicable to their
unchanged VM/Java code. This is functional coverage,
not ARM hardware performance evidence.

GCC 11 compilation of the actual native-test source with its jtreg flags passed,
as did compilation of `stringZilla.cpp` with the configured Zero-port flags.
These are targeted compile checks, not a full Zero build. The repository's
include checker passed for `src/hotspot/share`; vendor integrity and
`git diff --check` passed. Artifact and source hashes accompany the timing data.
The subsequent test-only [GCC 10 CI fix](CI_FOLLOWUP.md) does not change the
benchmarked VM, Java helpers or production kernels.

Mixed UTF-16/Latin-1 needles beyond 64 code units still use Java. Coverage now
includes 63/64/65 and longer needles, but this is not an acceleration claim.
Increasing the fixed stack buffer without a measured bounded algorithm is not
justified. MSVC x64 still selects serial upstream kernels and has not been built
or timed here. ARM cross-compilation and QEMU establish functional coverage;
ARM hardware throughput remains unmeasured. Full local tier1/tier2 and
whole-JDK sanitizers remain outside this selected validation. These measurements
do not establish zero regressions for every application or backend.
