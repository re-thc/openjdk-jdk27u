# PR4 final assessment

**Recommendation: keep PR4 draft; do not merge the current default-enabled Java-dispatch approach.** The native acceleration produces substantial bulk wins, and the recovery fixes several real regressions and integration defects. Consistent remaining losses on ordinary fallback/boundary paths, together with the narrow whole-process results, do not justify enabling this approach by default. This is a concrete performance rejection, not an unresolved correctness failure or a request for another benchmark campaign.

PR63 is merged into PR4's branch with its original eight commits. The best tested implementation is preserved at product `b454fd484ab8b9c113f713bdecadc5976a9ca1a1`. PR4 is unmerged.

## Final product and image identity

Measurements use complete images of actual GitHub merge `cd785f1c66fb72404c12b150d5f3d8e0fe0a4776`, whose parents are matched master `8d030adbd245b19e6339e3ccd052eb7fe3635319` and runtime product `2538e2fd80a363ea19d45044950701df62a0162f`.

The final product adds only explicit compiler-cache input hashes for intrinsic registry definitions. All `src`, `make`, `test` and `bin` Git trees are identical between measured and final products, and between their actual merges. A normal clean-checkout build of final merge `04a393ae1460da39e741f6eb0cc75725e49e05e4` verifies that **every image file is byte-identical to the measured Linux image except the `release` file's SOURCE revision label**. Executables, native libraries, modules and CDS archives are unchanged. Raw results retain the measured source identity. See [source equality](cache-fix-source-equivalence.json), [complete-image equality](cache-final-image-equivalence.json) and [final image seal](cache-final-local-seal.json).

Fresh native master and candidate images were built normally, with no class overlays. All payload files in all four retained native images were independently hashed against their producer inventories. [Image verification](verify-native-images.py) is reproducible from the pinned ZIPs and metadata in the archive. Native producer `a068c05c1ace6c29c600e742e618669b25c77624`, [run 39734131176](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39734131176), finished successfully on both NEON and MSVC.

## What was recovered and corrected

- Retained the tracked reverse-overlap and MSVC baseline-bit-operation vendor fixes, bounded native windows, physical-range validation and Java polls between windows.
- Applied per-file MSVC HIGHEST optimization to the production kernel; generated native release commands use `/O2`. Make-variable checks separately establish `/O2` for release/fastdebug and `/Od` for slowdebug.
- Added the allocation header required by the native test fixture on strict compilers.
- Reused bounded equality for one/two-candidate UTF16 C1 reverse fallbacks, with an initial code-unit filter and checked physical ends. The 129-character control now runs about 6.3 times faster than matched master on Linux/NEON and 3.3 times faster on Windows.
- Restored direct full-array Java whitespace loops when native scans are unavailable. The final serial Linux blank control improves in every paired round against prior922: P/C 1.1438 [1.0638, 1.2757]. Its 1,555 ns median is close to master's 1,534 ns; the remaining paired loss is retained. Native scan probes are preserved.
- Moved the existing tier-query intrinsic to initialized String, keeping its ID, signature and flag controls. Updated availability/dispatch tests. The optional StringZilla enabled state follows the short C1 tier check.
- Fixed cached-build integration after the owner change. Restored PCH caches produced an unrecognized-intrinsic warning and invalid CDS class list. Explicit registry-header hashes in `CCACHE_EXTRAFILES` make both final release/debug CI builds pass without suppressing intrinsic checks. The [failed run](2538-cache-build-failure.receipt.json) and its logs/specifications remain archived. The cache/PCH diagnosis is supported by the cached failure, uncached native successes and corrected cached-build successes; ccache documents its [PCH macro limitations and explicit hash inputs](https://ccache.dev/manual/4.12.3.html#_precompiled_headers).

The [source review](SOURCE-REVIEW.md) and [retained prototype rows](PROTOTYPES.md) explain the changes. Earlier rejected/accepted experiments keep their own patches, sources and raw data.

## Completed comparisons

The focused final study covers serial, AVX2, AVX512, NEON and MSVC with 30 Linux and 22 cases per native platform. Five complete-image controls compare independent original416, matched master8d, prior branch922, candidate enabled and candidate disabled. Each case has five balanced rotating rounds, one ordinary JMH fork per control/round, three 300 ms warmups and five 300 ms samples. Full compiler/boot-JDK identities and build settings match within each platform. Forced interpreter/C1/C2 settings and actual backend identity are recorded per case.

All **74 groups, 1,850 JMH files and 9,250 samples** passed independent raw-data auditing. Paired medians favor master in 26 selected cases and the independent original in 25; 64 rows have some paired/median/mean loss against at least one control. These focused counts describe this manifest, not a population-wide regression rate. No noise gate is applied. Every JMH mean/error, sample, command and observed paired spread is retained in [all comparisons](COMPARISONS.md), [the union of losses](LOSSES.md), [machine-readable rows](rows.json) and [the verified raw archive](final-complete-measurements.receipt.json).

Representative results follow. Times are ns per complete public operation, shown as medians of round medians. M/C is the median of same-round master/candidate median ratios; above 1 favors the candidate. Brackets are observed min/max, not confidence intervals.

| Platform / case | Master ns | Candidate ns | M/C [range] |
|---|---:|---:|---|
| linux / follow-c1-avx2-utf16-uniform-129 | 106.851 | 16.700 | 6.3102 [6.0292, 6.7727] |
| neon / follow-c1-avx2-utf16-uniform-129 | 135.152 | 21.499 | 6.2863 [6.2403, 6.3148] |
| msvc / follow-c1-avx2-utf16-uniform-129 | 68.036 | 20.422 | 3.3314 [3.3014, 3.3553] |
| linux / follow-c2-avx0-isBlank-longBlank | 1534.368 | 1555.106 | 0.9739 [0.9325, 1.0295] |
| msvc / c2-isBlank-longBlank | 1342.949 | 976.208 | 1.3700 [1.2141, 1.4385] |
| linux / c2-isBlank-longBlank | 1587.897 | 139.357 | 11.4309 [11.0570, 12.6903] |
| neon / follow-c2-avx2-dense-suffix-65 | 16525.128 | 495.402 | 33.3570 [33.3010, 34.5510] |
| linux / c2-avx3-lastIndexOf-LATIN1-4096-4-MISS | 732.168 | 124.826 | 5.8866 [5.4707, 6.2004] |
| linux / c2-avx0-lastIndexOf-UTF16-4096-9-END | 7.417 | 8.279 | 0.8158 [0.7609, 0.9077] |
| linux / c2-avx0-lastIndexOf-UTF16-4096-17-END | 11.296 | 14.946 | 0.7288 [0.6615, 0.8571] |
| neon / c1-avx2-lastIndexOf-UTF16-127-4-MISS | 87.321 | 101.192 | 0.8653 [0.8594, 0.8671] |
| msvc / follow-c2-avx2-dense-suffix-64 | 8245.322 | 8882.314 | 0.9354 [0.8523, 0.9459] |
| msvc / follow-c2-avx2-dense-suffix-65 | 8371.084 | 8946.939 | 0.9249 [0.9090, 0.9356] |
| msvc / selected-c2-prefix-dense-65 | 8330.336 | 9235.515 | 0.9032 [0.8872, 0.9109] |
| linux / c2-isBlank-prefix40 | 10.760 | 18.083 | 0.5754 [0.5527, 0.6443] |
| neon / c2-isBlank-prefix40 | 12.979 | 20.334 | 0.6383 [0.6081, 0.6659] |

## Ordinary processes and decision

Nine whole-process workloads completed: startup, javac and fixed source indexing on Linux, NEON and Windows, each with eight balanced rotating rounds and original/master/enabled/disabled controls. The driver verified source-index outputs, compiled program bytes, input hashes and unchanged complete images. All 288 reported process times and output streams are retained. [Process comparisons](PROCESS-COMPARISONS.md) show all spreads and all paired/median/mean losses.

Startup paired medians favor the candidate on all three platforms, with mixed individual rounds. All six javac/source-index paired medians favor master, by approximately 0.8–2.5%, and their observed ranges cross 1. These narrow workloads do not establish a general application benefit. Source indexing improves against the disabled candidate, while its master comparison remains below 1 on every platform; the disabled candidate is therefore not a substitute for the independent controls.

The remaining blockers are concrete:

- NEON's 127-character C1 miss is about 101 ns versus master's 87 ns, losing in every paired round. Moving the tier-query owner did not remove it.
- Windows dense C2 full/partial-prefix searches lose in every paired round, approximately 7–11% by the paired latency ratios. Deriving bounds in the separate scalar helper did not restore baseline performance.
- At the SIMD whitespace probe boundary, a 40-byte prefix costs about 18 versus 11 ns on Linux and 20 versus 13 ns on NEON, losing in every round. Short C2 UTF16 immediate searches also retain approximately 1–4 ns costs.

The native kernels, ABI, bounded-work machinery, PR63 predicates and correctness tests are useful salvage. A mergeable successor should restore the baseline Java shapes for small/unsupported operations and select bounded native acceleration at tier-specific compiler/interpreter boundaries. Physical-array checks, bounded windows, overlap semantics and safepoint behavior remain required. That is a structural dispatch change with its own source review and affected-path measurements. This report rejects continuing to qualify the current default-enabled Java dispatch as merge-ready.

## Validation and retained evidence

The combined prototype passed 166 of 171 local String/StringBuilder/StringBuffer/intrinsic descriptions, with five platform skips and no failures/errors. The clean measured merge then passed 35 of 38 focused/search/scan/intrinsic descriptions, with three platform skips. Its four shipped String-family classes exactly match the full-suite prototype. Both native jobs passed contracts, dispatch, physical bounds, overlap, safepoint and opt-out checks; NEON also passed ASan/UBSan/alignment checks. Native generated production compiler commands are retained.

Final-head ordinary CI [39736005456](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39736005456) uses product b454 and actual merge04a393. Release/debug Linux builds passed after the cache correction; the remaining platform pipeline is running. Complete terminal CI evidence will be added here. Performance rejection remains the recommendation.

The [raw archive receipt](final-complete-measurements.receipt.json) pins every one of its 4,670 members. Complete SDK ZIPs remain outside the product PR, with pinned artifact digests and independently verified image inventories. Historical [branch922 results](../selected-20261022/RESULTS.md) and [earlier complete campaign](../measurements/34e3d8f9/RESULTS.md) retain their original source identities, losses and coverage gaps. They are diagnosis and provenance for their own revisions.
