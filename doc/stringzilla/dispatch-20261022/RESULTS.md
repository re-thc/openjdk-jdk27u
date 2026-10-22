# Final StringZilla 5.3.0 comparisons

The retained implementation includes PR63's Latin-1 scans, bounded native dispatch,
checked short UTF-16 comparisons and the corrected MSVC ending-character filter.
The losing U scalar experiment was removed. The final performance tradeoff favors
retaining this implementation; the complete four-platform CI verdict is tracked
[on PR4](https://github.com/re-thc/openjdk-jdk27u/pull/4).

Measured product: `73d8c5581d76e6a395a85ba2ff3f1c2a2be2fc5e`; measured merge:
`93a0e98a80ea4807a45cc59a5334483a44b8cec6`. Final product:
`426d70bbf4f81af2d955f1d3435142567c4cd74c`; final merge:
`8727f91b22406ffc9ccd97aab6837dc65b521287`.
[Git tree proof](v-source-equivalence.json) confirms identical `src`, `make` and
`test` trees; later differences concern documentation and bounded CI setup.

Five balanced interleaved rounds compare complete matched SDKs: independent original
`416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`, current master
`8d030adbd245b19e6339e3ccd052eb7fe3635319`, prior candidate
`c17c5cb06297e25681b4dab2eddbd60ceffe0300`, and final enabled/disabled.
The focused final set contains 41 platform-cases, 1,025 original JMH files and
5,125 samples, including serial, AVX2, actual AVX-512, NEON, MSVC and forced
interpreter/C1/C2 paths. This focused follow-on is distinct from the older full
matrix and does not relabel that matrix as final-source qualification.

Every ratio below is control time / final enabled time: above 1 favors the
candidate. Each center is the median of paired round ratios; brackets retain the
minimum and maximum across all rounds. These can differ from a ratio of pooled
medians. No noise gate, loss removal or outlier removal was applied.

## Ordinary Java processes

Eight balanced rounds use ordinary defaults for startup, javac and one fixed
source-indexing task, with independent original/master and final enabled/disabled
controls (288 measured processes). These are workload-specific observations,
not a general application speed claim. The raw process receipt calls master
`prior`; its source is explicitly `8d030ad`, not the earlier candidate.

| Platform | Workload | Master / final paired ratio [all-round range] |
| --- | --- | ---: |
| Linux x64 | startup | 0.989× [0.937, 1.064] |
| Linux x64 | javac | 0.944× [0.896, 1.068] |
| Linux x64 | source-index | 1.181× [1.103, 1.417] |
| Linux AArch64 | startup | 1.003× [0.948, 1.264] |
| Linux AArch64 | javac | 1.001× [0.966, 1.023] |
| Linux AArch64 | source-index | 1.145× [1.034, 1.198] |
| Windows x64 | startup | 0.997× [0.974, 1.012] |
| Windows x64 | javac | 0.990× [0.970, 1.005] |
| Windows x64 | source-index | 1.080× [1.063, 1.141] |

All eight source-index pairs favor the candidate on each platform. Linux javac's
paired center is about 6% slower than master and startup about 1% slower;
both ranges cross parity. ARM/Windows startup and javac are near parity with
their full spread retained above and in the audit receipts.

## Every final focused JMH case

These tables retain every final case, including 9/41 paired centers below master.
Across all four controls, 33 platform-case rows have at least one loss by paired
center, pooled median or mean (Linux 16, ARM 9, Windows 8); every criterion and
every paired round is retained in each complete rows file. Raw JMH also retains
the individual samples, means and errors.

### Linux x64

| Case | Backend / tier | Final median ns | Master median ns | Master / final paired ratio [all-round range] |
| --- | --- | ---: | ---: | ---: |
| v-c2-utf16-9-END | avx2 / c2 | 4.533 | 4.733 | 1.043× [1.033, 1.074] |
| v-c2-utf16-10-END | avx2 / c2 | 4.588 | 4.877 | 1.063× [1.025, 1.098] |
| v-c2-utf16-11-END | avx2 / c2 | 4.575 | 7.082 | 1.524× [1.063, 1.600] |
| v-c2-utf16-12-END | avx2 / c2 | 4.508 | 5.545 | 1.228× [1.161, 1.625] |
| v-c2-utf16-17-END | avx2 / c2 | 8.230 | 8.417 | 0.997× [0.888, 1.054] |
| v-c2-utf16-9-START | avx2 / c2 | 225.351 | 543.745 | 2.421× [2.364, 5.423] |
| v-c2-utf16-9-FALSE_ENDING | avx2 / c2 | 229.335 | 1206.788 | 5.215× [5.169, 5.331] |
| v-c2-utf16-9-MISS | avx2 / c2 | 224.049 | 384.442 | 1.723× [1.646, 1.741] |
| c1-avx2-lastIndexOf-UTF16-127-4-MISS | avx2 / c1 | 60.435 | 83.676 | 1.385× [1.362, 1.609] |
| c2-isBlank-prefix40 | avx2 / c2 | 3.637 | 6.129 | 1.704× [1.673, 1.723] |
| follow-c2-avx2-dense-suffix-65 | avx2 / c2 | 266.320 | 8513.516 | 32.106× [31.236, 32.380] |
| v-c2-utf16-9-END-avx0 | serial / c2 | 4.520 | 4.609 | 1.031× [0.921, 1.050] |
| v-c2-utf16-17-END-avx0 | serial / c2 | 8.423 | 6.536 | 0.787× [0.742, 1.013] |
| v-c2-utf16-9-END-avx3 | avx512 / c2 | 4.465 | 4.694 | 1.048× [1.043, 1.052] |
| v-c2-utf16-17-END-avx3 | avx512 / c2 | 8.208 | 7.407 | 0.907× [0.866, 1.024] |
| v-c2-utf16-9-FALSE_ENDING-avx3 | avx512 / c2 | 131.463 | 1183.362 | 9.017× [8.809, 9.205] |
| c1-avx2-lastIndexOf-UTF16-127-4-MISS-avx3 | avx512 / c1 | 59.888 | 83.996 | 1.399× [1.366, 1.454] |
| v-c1-avx3-utf16-uniform129 | avx512 / c1 | 12.822 | 67.171 | 5.276× [5.081, 5.729] |
| v-interpreter-avx3-utf16-4096-MISS | avx512 / interpreter | 523.574 | 119692.059 | 229.478× [223.700, 234.706] |

Complete controls, losses and spreads: [rows](v-linux-rows.json), [audit receipt](v-linux-audit.json), [original raw files](v-linux-raw.tar.gz), [member hashes](v-linux-raw-members.json).

### Linux AArch64

| Case | Backend / tier | Final median ns | Master median ns | Master / final paired ratio [all-round range] |
| --- | --- | ---: | ---: | ---: |
| v-c2-utf16-9-END | neon / c2 | 8.357 | 6.804 | 0.814× [0.809, 0.817] |
| v-c2-utf16-10-END | neon / c2 | 8.348 | 6.608 | 0.792× [0.792, 0.794] |
| v-c2-utf16-11-END | neon / c2 | 8.340 | 12.574 | 1.508× [0.884, 1.520] |
| v-c2-utf16-12-END | neon / c2 | 8.294 | 13.040 | 1.572× [0.971, 1.669] |
| v-c2-utf16-17-END | neon / c2 | 14.738 | 14.549 | 0.987× [0.708, 0.989] |
| v-c2-utf16-9-START | neon / c2 | 623.697 | 803.848 | 1.290× [1.256, 3.130] |
| v-c2-utf16-9-FALSE_ENDING | neon / c2 | 625.082 | 1981.079 | 3.172× [3.160, 3.239] |
| v-c2-utf16-9-MISS | neon / c2 | 612.320 | 731.056 | 1.195× [1.187, 1.196] |
| c1-avx2-lastIndexOf-UTF16-127-4-MISS | neon / c1 | 83.454 | 87.568 | 1.052× [1.044, 1.057] |
| c2-isBlank-prefix40 | neon / c2 | 4.801 | 13.308 | 2.772× [2.693, 2.804] |
| follow-c2-avx2-dense-suffix-65 | neon / c2 | 495.712 | 16564.916 | 33.368× [33.312, 34.515] |

Complete controls, losses and spreads: [rows](v-neon-rows.json), [audit receipt](v-neon-audit.json), [original raw files](v-neon-raw.tar.gz), [member hashes](v-neon-raw-members.json).

### Windows x64

| Case | Backend / tier | Final median ns | Master median ns | Master / final paired ratio [all-round range] |
| --- | --- | ---: | ---: | ---: |
| v-c2-utf16-9-END | msvc / c2 | 8.665 | 7.820 | 0.904× [0.807, 0.999] |
| v-c2-utf16-10-END | msvc / c2 | 8.653 | 8.069 | 0.943× [0.903, 1.030] |
| v-c2-utf16-11-END | msvc / c2 | 8.613 | 11.411 | 1.325× [1.302, 1.355] |
| v-c2-utf16-12-END | msvc / c2 | 8.557 | 11.833 | 1.382× [1.379, 1.400] |
| v-c2-utf16-17-END | msvc / c2 | 14.542 | 13.611 | 0.934× [0.892, 0.936] |
| v-c2-utf16-9-START | msvc / c2 | 236.767 | 1144.332 | 4.828× [4.821, 4.864] |
| v-c2-utf16-9-FALSE_ENDING | msvc / c2 | 271.193 | 2607.879 | 9.630× [9.372, 10.357] |
| v-c2-utf16-9-MISS | msvc / c2 | 210.977 | 745.995 | 3.537× [3.528, 3.544] |
| c1-avx2-lastIndexOf-UTF16-127-4-MISS | msvc / c1 | 127.837 | 128.534 | 1.011× [0.895, 1.131] |
| c2-isBlank-prefix40 | msvc / c2 | 13.824 | 14.467 | 1.051× [1.020, 1.156] |
| follow-c2-avx2-dense-suffix-65 | msvc / c2 | 153.203 | 14010.982 | 91.384× [91.127, 91.723] |

Complete controls, losses and spreads: [rows](v-msvc-rows.json), [audit receipt](v-msvc-audit.json), [original raw files](v-msvc-raw.tar.gz), [member hashes](v-msvc-raw-members.json).

Windows width-9 early matching improves from 2,619 ns in prior S to 237 ns
(4.83× faster than master); the false-ending case is 9.63× faster than master.
The bounded ending filter increases the absent-match cost from 131 to 211 ns
versus S, while remaining 3.54× faster than master. This is a retained tradeoff.
Immediate end-match costs on some paths are approximately 0.6–1.9 ns; ARM widths
9/10 retain 1.55/1.74 ns costs. The U ARM scalar alternative took about 12 ns
where the retained checked-word implementation takes 8.35 ns.

## Independent verification and permanent files

- [Native producer](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39798393906)
  and [Linux producer](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39798410962)
  retain matched compiler/boot/configuration, actual backend and complete-image identity.
- [SDK audit](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39806466970)
  rehashed every shipped SDK file, checked real GCC `-O3` / MSVC `/O2` kernel
  commands and confirmed all four shipped String classes match across platforms.
  [Permanent SDK proof](v-sdk-proof.json).
- [Raw audit](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39808185117)
  independently rechecked all 1,025 original JSON files, samples, summaries,
  paired ratios and eight-round process records. Archived member bytes and
  SHA-256 hashes were verified before publication.
- Focused tier, JNI, opt-out, physical bounds, overlap, safepoint and native
  ASan/UBSan/alignment checks passed in the producer runs.
- [Final exact-head four-platform CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39812822993)
  and its [automatic independent audit](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39834664110)
  provide the final merge gate. The read-only audit follows the existing run,
  requires all 57 jobs to succeed, checks all 58 StringZilla descriptions and
  source hashes, and retains the original CI logs. Its single Linux job is
  bounded to six hours and fails if the source changes or validation fails.

## Earlier experiments retain their own identity

U measures merge `15da3c455ba3f15993f581150c775bb7a941fccd` and includes the
rejected ARM scalar experiment. Its 48 cases / 1,200 JMH files / 6,000 samples
are diagnostic evidence, not final V qualification.
[U raw audit](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39825472551)
and [U SDK audit](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39794106271)
verify the original files and complete SDK identities:
[ARM raw](u-neon-raw.tar.gz), [Windows raw](u-msvc-raw.tar.gz),
[Linux raw](u-linux-raw.tar.gz), [SDK proof](u-sdk-proof.json).
Each raw archive has adjacent `-raw-members.json`, `-rows.json` and `-audit.json`
files retaining all controls, losses and spread.

S was already permanently preserved in
[5647ab3](https://github.com/re-thc/openjdk-jdk27u/commit/5647ab36d15fad53b99a0e722dce9216d3485999):
[ARM raw](s-neon-raw.tar.gz), [Windows raw](s-msvc-raw.tar.gz),
[Linux raw](s-linux-raw.tar.gz), with adjacent member inventories, complete rows
and audit receipts. S measures `c17c5cb`, preceding the final MSVC correction.
Earlier complete-matrix evidence remains at
[34e3d8f9/RESULTS.md](../measurements/34e3d8f9/RESULTS.md);
its identities and missing AVX-512 interpreter/C1 cases remain unchanged.
