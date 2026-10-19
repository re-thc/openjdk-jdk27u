# PR4 complete-image assessment

Product: [`7048d6f2c74e25737850789812da063900ec18c0`](https://github.com/re-thc/openjdk-jdk27u/commit/7048d6f2c74e25737850789812da063900ec18c0).
Independent original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

**Do not merge yet.** The source corrections and fourteen local targeted test
descriptions pass. Final x64 measurements complete 58 triplets with all eight
loss-table rows retained. Windows reports a successful complete-image build,
native contracts and targeted bounds/safepoint tests; its comparisons are
running. The 40 native-platform triplets remain pending completion, while ARM
and ordinary CI await runners. This is incomplete qualification, not evidence
that the implementation failed. Preceding measurements retain their original
revisions.

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
| [Final physical-range guard, x64](final7048-summary/COMPARISONS.md) | `7048d6f2` | 58 of 98 planned triplets, 522 JMH files, 2,610 samples; all eight loss-table rows |

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

The [final-head x64 comparisons](final7048-summary/COMPARISONS.md) and
[all eight loss rows](final7048-summary/LOSSES.md) retain 58 triplets. Selected
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

The final losses also include the scalar C1 minimum-overlap case and variable
equality controls. Seven rows lose by paired-ratio median, six by control
median and seven by pooled mean; their union contains eight rows. These counts
are distinct measures. In particular, the AVX-512 short C1 loss against original
has disabled/enabled paired median 1.0017, whereas AVX2's corresponding value is
0.9653. Neither an enabled/disabled comparison nor a single summary statistic
captures the full original-versus-product cost.

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
and workload shape matter alongside their ratios.

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
bounded native jobs. The [ordinary exact-head CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015)
also records `7048d6f2`. Neither preceding green builds nor queued jobs are
counted as successful checks of this head. No duplicate jobs are dispatched.

The checked [scope receipt](scope7048.json) identifies every pending native case.
The first retained status snapshot has no assigned runners. Windows subsequently
completed its build, compiler-command check, contracts and targeted tests and is
measuring; its [job snapshot](native7048-windows-active-job.json) and
[retained complete image](native7048-artifacts.json) record that progress. ARM
and CI's Prepare job still have `runner_id: 0` and empty steps. The queued actions
were accepted; none was denied. There is no failed native test or accepted
final-head native measurement to diagnose yet. Rerunning would duplicate work.

## Decision

Retain the corrected implementation and the measured x64 tradeoff. Bulk and
interpreter/C1 improvements survive the required range guard, while real short
and dense-suffix losses remain. The present results do not call for another
unbounded tuning campaign, a universal performance claim or a zero-loss gate.

**PR4 remains draft and is not ready to merge.** The concrete remaining blocker
is completion and review of the existing exact-head native jobs and ordinary CI,
including ARM physical-bounds tests and the 40 pending paired comparisons.
A green preceding revision does not satisfy that requirement. If those jobs
complete, add their original artifacts and losses to this report and assess
their actual result; do not automatically promote the PR. No merge or upstream
push has been performed.
