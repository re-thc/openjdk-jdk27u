# PR4 complete-image assessment

Product: [`7048d6f2c74e25737850789812da063900ec18c0`](https://github.com/re-thc/openjdk-jdk27u/commit/7048d6f2c74e25737850789812da063900ec18c0).
Independent original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

**Performance and native qualification are complete; ordinary CI is pending.**
Final measurements complete all 98 planned triplets on serial, AVX2, AVX-512,
NEON and MSVC, with all seventeen loss-table rows retained. Fourteen local,
thirteen Windows and ten ARM targeted test descriptions pass. Both native jobs
finish successfully. Retain the corrected implementation and its documented
tradeoffs; keep PR4 in draft until the existing ordinary PR integration CI finishes.
Preceding measurements retain their original revisions.

## Implementation and correctness

The integration combines StringZilla 5.3.0 kernels, bounded Java probes and
existing JDK intrinsics. The recovery adds four concrete corrections:

- MSVC compiles `StringZillaKernels.c` with the repository's per-file `HIGHEST`
  setting. Actual generated commands verify `/O2` for release/fastdebug and `/Od`
  for slowdebug. GCC settings remain unchanged.
- The four-code-unit UTF-16 C2 immediate probe uses one bounded word equality.
- The shared reverse verifier inlines its valid bounds and compares prefixes
  through sixteen bytes with overlapping words after checking the suffix. Its
  source-then-target failure checks and mismatch indices remain intact.
- The Latin-1 reverse entry checks physical source and target ranges before any
  word probe or native dispatch. Its C1 bridge carries the already validated
  arrays and scalar values; array lengths are immutable. Expanded bounds tests
  cover both coders with valid warmup and forced interpreter/C1/C2/opt-out modes.

[Source audit](SOURCE-AUDIT.md) records the range proofs, caller invariants,
Unicode guards, C2 ownership and leaf-call contracts. All 28 upstream files and
the two existing overlap/MSVC bit-operation patches verify. No native algorithm
or vendor source changed during this recovery. Production-source native
contracts also passed address, undefined-behavior and alignment sanitizers;
their source hashes bind the unchanged native files in the current product.

The source keeps Java polls between bounded native windows. It preserves the
JDK's C2 forward-search and equality intrinsics. Gains from its existing JDK
character filter belong to the hybrid dispatch, rather than solely to a vendor
kernel. `-XX:-UseStringZillaIntrinsics` remains an additional control; its modified
Java classes do not replace an independent original baseline.

The [test binding](final7048-validation/test-binding.json) records all fourteen
passed descriptions and the normal post-commit image refresh. That refresh
recompiled no Java or native source. The final Linux native library is also
byte-identical to the sanitizer-tested revision. A separate
[current-image compilation diagnostic](final7048-jit-diagnostics/receipt.json)
shows the reverse verifier forced inline and word loads recognized as intrinsics;
its perturbed timing is excluded from the comparisons.

## Evidence identities

| Campaign | Actual candidate source | Completed scope |
|---|---|---|
| [Historical complete images](../measurements/34e3d8f9/RESULTS.md) | `916ba895` | 1,624 triplets, 4,872 JMH files, 48,720 samples; all 453 higher means retained |
| [Initial diagnosis](diagnostic-6bb14f1e/COMPARISONS.md) | `6bb14f1e` | 19 triplets; the immediate probes lose |
| [First correction pilot](diagnostic-b963d752/COMPARISONS.md) | `b963d752` | Three triplets; UTF-16 improves, Latin-1 still loses |
| [Focused five-backend campaign](final77-summary/COMPARISONS.md) | `77a60d0f` | 290 triplets, 2,610 JMH files, 13,050 samples; all 71 loss-table rows retained |
| [Copyright-only complete-image pass](finale45-summary/COMPARISONS.md) | `e45ff201` | 13 triplets, 117 JMH files, 585 samples; two loss-table rows |
| [Final physical-range guard, five backends](final7048-summary/COMPARISONS.md) | `7048d6f2` | 98 of 98 planned triplets, 882 JMH files, 4,410 samples; all seventeen loss-table rows |

The historical AVX-512 interpreter/C1 deficit stays 262 triplets in its original
campaign. Later focused work does not retroactively fill it. Both diagnostic
revisions retain their raw evidence and losses. The copyright
revision changes notice lines in 42 files: all eight affected runtime classes
have identical instruction listings, and Linux `libjava.so` is byte-identical.
The subsequent physical-range guard is an implementation change and receives
separate measurements.

The final [affected/control manifest](physical-guard-focus.tsv) has 23 rows and
98 backend/tier triplets: serial 26, AVX2 16, AVX-512 16, NEON 14, MSVC 26. It
remeasures every affected Latin-1 reverse case from the preceding focus, with
UTF-16 immediate-match and C2 equality controls. It is a bounded follow-on,
rather than a new full matrix. The preceding 290 triplets are not relabeled as
measurements of `7048d6f2`.

## Method

Every comparison uses complete ordinary JDK images: original, candidate enabled
and the identical candidate disabled. Receipts bind clean source, compiler,
boot JDK, full image inventories, generated native command, benchmark sources,
runner and manifest. There are no class overlays. Matching build settings are
checked within each pair.

Local x64 uses supplied GCC 16.2, boot JDK 27 and x86-64-v3/generic. Hosted ARM
uses GCC 16.0.1, checksum-pinned boot JDK 26+35 and armv8.2-a/generic. Windows uses
MSVC 19.44.35229 with checksum-pinned boot JDK 26+35. The original native images
are reused only through authenticated artifact digests and full-image receipts;
the candidates are rebuilt. Serial identifies the selected StringZilla backend:
the compiler may still vectorize portable loops under its architecture baseline.

The [ARM compiler/boot comparison](neon7048-compiler-comparison.json) checks the
full current and independent-original producer banners, including Ubuntu package
`16-20260322-1ubuntu1`, GCC trunk revision and boot JDK build. Matching numeric
compiler versions alone were not treated as proof.

Three paired rounds rotate original/enabled/disabled order so every control
occupies each position. Each control/round uses one JMH fork, three 300 ms
warmups and five 300 ms measurements, sequentially on one pinned CPU with Serial
GC and CDS off. A triplet retains nine JMH files and 45 samples. Tables report
the median of paired control/enabled ratios and their full range, control
medians, pooled means, individual errors and raw samples. Ratios above one favor
enabled. Paired ratios can disagree with control medians.

The loss table includes every paired-ratio, control-median or pooled-mean loss
against either control, without a cutoff. Shared-host variation is visible in
the retained rounds. No overall speedup is computed across this deliberately
diagnostic workload selection.

## Gains, losses and practical scope

The [final-head comparisons](final7048-summary/COMPARISONS.md) and
[all seventeen loss rows](final7048-summary/LOSSES.md) retain 98 triplets. Selected
final-head values below show control medians in ns/op and paired original/enabled
ratios, rather than ratios of those control medians:

| Backend/tier and case | Original | Enabled | Disabled | O/E paired median [range] |
|---|---:|---:|---:|---|
| Serial C2 Latin-1 end match, needle 9 | 9.194 | 8.092 | 9.914 | 1.1318 [1.1148, 1.1443] |
| Serial C2 UTF-16 end match, needle 4 | 5.346 | 3.391 | 5.772 | 1.6491 [1.5710, 1.7799] |
| Serial C2 Latin-1 bulk miss | 729.112 | 206.543 | 708.809 | 3.6269 [3.2940, 3.7282] |
| AVX-512 C1 Latin-1 bulk miss | 4,046.989 | 150.051 | 3,885.588 | 26.9708 [26.4369, 27.1300] |
| AVX2 C2 adversarial Latin-1 overlap, span 32 | 2,506.825 | 17.387 | 2,549.382 | 142.5008 [136.6818, 144.1755] |
| AVX2 C1 short Latin-1 miss | 30.249 | 32.262 | 30.724 | 0.9758 [0.9082, 1.0122] |
| AVX-512 C1 short Latin-1 miss | 31.038 | 36.048 | 35.691 | 0.8589 [0.7958, 1.0412] |
| Serial C2 dense-suffix miss, needle 65 | 15,608.586 | 16,187.882 | 15,406.619 | 0.9210 [0.9088, 1.0545] |
| NEON C1 Latin-1 bulk miss | 3,172.471 | 332.446 | 3,168.187 | 9.5447 [9.5354, 9.5674] |
| NEON interpreter Latin-1 bulk miss | 40,638.583 | 764.836 | 43,116.873 | 53.2952 [51.4689, 54.5807] |
| NEON C2 UTF-16 end match, needle 4 | 5.493 | 2.726 | 5.622 | 2.0159 [2.0129, 2.0181] |

The final losses also include the scalar C1 minimum-overlap case and variable
equality controls. Fifteen rows lose by paired-ratio median, fourteen by control
median and sixteen by pooled mean; their union contains seventeen rows. These counts
are distinct measures. In particular, the AVX-512 short C1 loss against original
has disabled/enabled paired median 1.0017, whereas AVX2's corresponding value is
0.9653. Neither an enabled/disabled comparison nor a single summary statistic
captures the full original-versus-product cost.

MSVC's current nine-byte immediate match is nearly flat: 5.206 to 5.208 ns,
paired O/E 0.9997 [0.9013, 1.0553]. Its width-25 immediate case retains O/E
0.9945 [0.9711, 1.0052]. Its short C1 miss loses against original in all three
rounds: 18.123 to 20.259 ns, O/E 0.9164 [0.8554, 0.9915]. These remain losses
without a threshold. The MSVC C1 minimum-overlap case improves over original
625.082 to 352.161 ns, while disabled is 349.428 ns; both comparisons remain
visible. The raw Windows JMH file bytes were checked against the artifact and
per-file digests before acceptance.

ARM adds three retained losses. Its short C1 miss is 28.428 to 29.646 ns,
O/E 0.9587 [0.9556, 0.9589]; minimum-overlap C1 is 642.817 to 647.377 ns,
0.9930 [0.9929, 0.9962]. Both lose against both controls in every round. The
interpreted immediate match is 351.127 to 379.873 ns, O/E 0.9268
[0.9243, 0.9368], although disabled is slower at 426.511 ns. The independent
original exposes that cost. Small but consistent losses remain in the table,
alongside the large bulk gains; they are not removed as noise.

The completed preceding campaign establishes large interpreter/C1 and selected
bulk reverse-search gains. Examples include C1 equality on 4,096 Latin-1 bytes:
AVX-512 3,786 to 71 ns and NEON 2,955 to 162 ns; MSVC C1 UTF-16 bulk reverse
search 2,089 to 1,344 ns; MSVC interpreted mixed-coder miss 110,632 to 502 ns.
The very large AVX2 long-overlap gain is an adversarial fixture, not a general
workload estimate. These values retain source `77a60d0f`.

That same campaign also loses in all three paired rounds against both controls
for MSVC C2 UTF-16 end match with a nine-character needle (5.641 to 8.464 ns;
original/enabled 0.6626), AVX2 C2 mixed-coder end match at width 17 (11.908 to
14.052 ns; 0.8474) and NEON C1 UTF-16 miss just below its threshold (88.144 to
101.022 ns; 0.8715). Its scalar dense-suffix loss is larger and variable. All
[preceding losses](final77-summary/LOSSES.md) remain visible. Their absolute cost
and workload shape matter alongside their ratios. This report does not claim
that the later Latin-1 guard eliminated those UTF-16 or mixed-coder losses.

Ordinary-process checks use JVM defaults including CDS, fixed work, two
independent six-round balanced blocks and complete-process wall time. Startup
runs `java -version`; javac compiles three real repository tests and verifies
identical class-file outputs; source indexing scans eight original JDK String
source files for 128 passes and verifies identical checksums. This is a small
practical workload set, not an application suite. Both blocks and every paired
round remain visible; microbenchmark gains do not establish an application gain.

The earlier process timer used Python 3.12 timeout polling, adding observation
delay. Its results remain labeled diagnostics. Corrected runs use a blocking
wait, consistent with the actual runtime source and the
[Python subprocess documentation](https://docs.python.org/3.12/library/subprocess.html#subprocess.Popen.wait).
JMH's internal nanosecond measurements are unaffected. Exact as-run process
drivers and their hashes accompany the raw records.

The [final-head process table](final7048-process-comparisons.md) retains both
blocks and all twelve paired ratios per workload:

| Workload | O/E block 1; block 2 | O/E pooled [range] | D/E pooled [range] |
|---|---|---|---|
| Startup | 0.9759; 1.0224 | 0.9919 [0.5673, 1.4499] | 0.9966 [0.5064, 1.5077] |
| javac | 1.0687; 1.0467 | 1.0467 [0.8841, 1.2246] | 0.9969 [0.8642, 1.0942] |
| Source indexing | 1.0857; 1.0129 | 1.0317 [0.9041, 1.1976] | 1.1972 [0.9411, 1.4529] |

Startup is mixed. javac favors the product over original in both block medians,
but enabled and disabled are similar. Source indexing favors enabled in both
block medians, with losing rounds retained. The workloads do not establish a
broad application speedup or a clean causal attribution of every wall-time
difference to the flag.

## Exact-head checks

The [native follow-on](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39281225979)
pins product `7048d6f2` from evidence producer `3b318ed7`. It has exactly two
bounded native jobs. The [ordinary PR CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015)
was triggered for the same head and checks GitHub's merge `7223ef03` with fork
master `70c91df3`. Its completed build log confirms that checkout. The
[source binding](ci7048-source-provenance.json) lists eleven additional files
from other merged PRs; no StringZilla file differs. This is merge-integration
qualification, separate from the exact `7048d6f2` complete-image measurements.
Neither preceding green builds nor queued jobs are counted as successful
checks. No duplicate jobs are dispatched.

The checked [scope receipt](scope7048.json) has no missing cases. The
[terminal native run](native7048-final-run.json) and
[job conclusions](native7048-final-jobs.json) confirm success for both jobs.
[Windows validation](final7048-msvc/validation) and
[ARM validation](final7048-neon/validation) retain all applicable targeted tests.
Windows also passes twelve Java contract executions and the production-source
native fixture at `/O2`. The [complete-image artifacts](native7048-artifacts.json)
are retained, and their inventories were independently checked after download.
The shipped current Windows and ARM `StringLatin1` instruction listings match
the measured Linux image, including the final range guard. No duplicate native
run or additional performance campaign is needed.

Ordinary CI's Prepare and both x64 builds pass. ARM release is compiling,
ARM debug awaits a runner, and the twelve x64 tier1 jobs are queued. Those
existing jobs remain the only unfinished qualification gate.

## Decision

Retain the corrected implementation and the measured five-backend tradeoff.
Bulk and interpreter/C1 improvements survive the required range guard, while
real short, immediate-match and dense-suffix losses remain. The independent
source/evidence recovery review also supports retaining this approach and finds
no concrete source defect requiring another change. The recorded gains support
adoption for this fork with the known costs documented; they do not establish a
universal application speedup. No zero-loss gate or new tuning campaign is used.

**PR4 remains draft and is not ready to merge.** The concrete remaining blocker
is completion and review of the existing ordinary PR integration CI. Native
correctness and all planned comparisons have completed. A green preceding
revision does not satisfy the remaining requirement, and a future green stage
must be assessed with the retained losses rather than replacing that assessment.
No merge or upstream push has been performed.
