# PR2 Linux x64 qualification

Retain the integration enabled by default for the qualified Linux x64 configuration. Correctness and the Java dialect are mandatory and passed. The final paired medians versus original baseline show roughly 2.5–4.5× faster bulk code-point counts, 8.1× faster 4K UTF-16 BMP String construction, and 3.0–3.8× faster tested bulk UTF-32 constructions. Short UTF-32 BMP remains faster than original baseline in default tiered, C1 and interpreter modes, with substantially less allocation. These are per-configuration observations, not an aggregate score or a claim that every input improves.

The final implementation is published at **496abc6005eac4d38f3f754ac58772aa683805d3** on the existing PR2 branch. It preserves the subsequent Teamoffy attribution commit 7eb4007358c. The source was frozen for complete-image correctness and all four measured role orders. The earlier published increment 8646a0ce149 preserves qualified runtime 5091f852a192 outside copyright lines.

The costs are material and remain in the decision:

- Negative Shift_JIS admission: E/B paired median 1.612 [0.979, 3.403], with absolute medians 25.0 versus 16.1 ns. It is roughly flat against the preceding qualified runtime (E/O 0.965). This generic-charset eligibility/cache guard cost is accepted for the wide-codec benefit; common built-in UTF-8/ASCII/Latin-1 paths remain specialized. The large spread limits precise attribution of small differences.
- Misaligned UTF-16 String fallback: E/B 1.197 [1.065, 1.428], but E/O 0.699 [0.440, 0.936]. The alignment repair removes an impossible whole-array bulk attempt and improves every pair against the predecessor, at +48 B/op versus that predecessor and +160 B/op versus original baseline. This remains a slower fallback than baseline and is accepted for the much larger aligned-input benefit.
- Misaligned UTF-32 fallback: E/B 1.272 [1.103, 2.278] and E/O 1.290 [1.102, 2.003]. The optimized native conversion cannot admit this offset and the rejected specialization plus generic fallback remain a cost. The exact contribution of JIT/profile behavior is not resolved to individual instructions. I accept this uncommon-offset loss against the valid aligned bulk gains; it is not dismissed as noise or presented as repaired.
- Small supplementary UTF-32: E/B 1.092 [0.822, 1.397], E/O 0.956 [0.247, 1.058]. The targeted BOM repair substantially reduced the previous baseline loss (the broader parent panel had E/B 1.369 with every pair losing), but does not establish a universal win for this smallest native-ineligible case. The more invasive census-hoist repair was rejected after it regressed C1.
- Short Latin-1 UTF-32 regressed against the preceding qualified runtime in this final panel: C1 E/O 1.252 [0.887, 1.772], interpreter 1.324 [1.110, 1.423]. Both still improve materially over original baseline (E/B 0.263 and 0.320), with 56 versus 328 B/op. Retaining the C2 BOM word load and tier separation is the chosen tradeoff; the regressions are not hidden.
- Staged read-only UTF-16 decoding: E/O 1.621 [1.050, 7.311], while E/B 0.457 [0.153, 2.248]. This route retains a measured loss against its predecessor, and one pair also loses to original baseline. Non-array staging incurs approximately 12–16 KiB/op versus near-zero baseline allocation in the tested buffer APIs. The staged routes remain because their measured median throughput benefit over baseline is substantial and their generic buffer/scope semantics are preserved. They are not described as allocation wins.
- Other losses against the preceding runtime, including prefixed-pair char-array count, bulk Latin-1 UTF-32 and controls, are visible in the complete table. The counter's final prefixed-pair char-array E/O is 1.121 [0.678, 1.491], while E/B is 0.220. Every individual loss is retained in paired-observations.csv.

The original disabled-mode dense String count loss motivated a separate experiment. Restoring the original String surrogate-helper fallback improved all four diagnostic pairs; the final full-image dense String D/B median is 0.989. Char-array masks remain because their alternative had mixed tradeoffs. Opt-out is not claimed cost-free for all paths: final D/B aligned UTF-16 construction is 1.409 [1.291, 1.724], and other disabled-mode costs remain visible.

First-use results are separate. Small BMP first-call E/B is 0.958 [0.519, 1.365], negative admission 0.569 [0.429, 0.826], and bulk Latin-1 UTF-32 0.569 [0.416, 0.660]. Wide ranges and differing whole-process times prevent a blanket startup claim. The final choice weighs practical gains and explicit costs; passing CI alone is not the acceptance criterion.

## Source identities

| Role in final follow-up | Exact measured source | Meaning |
|---|---|---|
| B | `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9` | Original baseline |
| O | `5091f852a19284e263e3b43d949c9139a6d1f35e` | Previous qualified runtime; published 8646a0ce149 preserves these runtime/test bodies and changes copyright lines only |
| E | `496abc6005eac4d38f3f754ac58772aa683805d3` | Final follow-up image |
| D | `496abc6005eac4d38f3f754ac58772aa683805d3` | Identical E image, -XX:-UseSIMDUTFIntrinsics |

The earlier 35-configuration panel used O=9d5639bd4c1e4ce8878a1ddff374cc8ad05c502f and E/D=5091f852a19284e263e3b43d949c9139a6d1f35e. That complete panel is retained separately, with its original identities, in qualification-5091.md and the raw directories. No measurement is relabelled as another commit. The attribution merge preserving 7eb4007358c was verified byte-for-byte outside copyright lines; attribution-merge-validation.json records the check.

## Correctness

The final image passed 24 jtreg records, 49 main and 17 driver executions, all eight targeted AOT regressions, 140 source-labelled fixture output checks across B/O/E/D, and twelve AOT record/create/strict/auto commands in both enabled/disabled flag directions. MetaspaceAllocGaps was run separately without target VM options to satisfy vm.flagless. Raw .jtr files, stdout and exact commands are retained.

The semantic checks include Java UTF-32 surrogate-valued input, malformed/error and replacement behavior, BOM/order handling, bounds, partial buffers, read-only and inaccessible storage, segment lifetime/ranges, compact and UTF-16 String storage, mutable input, large leaves/chunk boundaries, JNI fallback, opt-out, C1, C2 and interpretation. New tests independently walk code points across surrogate classes, subranges, vector tails and leaf boundaries.

## Final full-image comparison

27 configurations with bookended controls, four fixed interleaved orders OBED/DEBO/BDOE/EODB: 464 JVM invocations. Each role occupies each order position once. Each invocation uses one benchmark thread and independent fork, three 1-second warmups, three 500-ms measurements, GC profiling, 512 MiB heap, two active processors and CPUs 2/3. Per-pair ratios use JMH fork scores (means of three measurements) from matching order and configuration position. Tables give the median and observed minimum/maximum across four independent process pairs; bookended controls have eight pairs. Lower ratios are faster. Every loss, iteration, failed experiment and host snapshot is retained; no score filtering, tight noise gate or retry-until-pass was used.

| Configuration | E/B median [range] | E/O median [range] | E/D median [range] | E alloc B/op | B alloc B/op |
|---|---|---|---|---|---|
| fallbackConstructString charsetName=Shift_JIS, size=32; default tiered | 1.612 [0.979, 3.403] | 0.965 [0.796, 1.535] | 1.563 [0.782, 3.531] | 56.00 | 56.00 |
| constructString charsetName=UTF-32, content=BMP, size=16; default tiered | 0.618 [0.523, 0.686] | 0.797 [0.631, 1.068] | 0.663 [0.431, 0.829] | 72.00 | 216.00 |
| constructString charsetName=UTF-32, content=BMP, size=16; C1 | 0.380 [0.320, 0.586] | 0.985 [0.280, 1.155] | 0.608 [0.437, 0.728] | 72.00 | 368.01 |
| constructString charsetName=UTF-32, content=BMP, size=16; interpreter | 0.229 [0.134, 0.242] | 0.976 [0.760, 1.123] | 0.240 [0.224, 0.280] | 72.05 | 368.20 |
| constructString charsetName=UTF-16BE, content=BMP, size=4096; default tiered | 0.124 [0.111, 0.174] | 0.937 [0.881, 1.459] | 0.084 [0.070, 0.135] | 8232.02 | 28712.17 |
| constructString charsetName=UTF-32LE, content=SUPPLEMENTARY, size=65536; default tiered | 0.329 [0.211, 0.470] | 0.885 [0.458, 1.594] | 0.344 [0.296, 0.496] | 131112.92 | 458794.92 |
| constructUnalignedString charsetName=UTF-16BE, content=BMP, size=4096; default tiered | 1.197 [1.065, 1.428] | 0.699 [0.440, 0.936] | 0.976 [0.811, 1.178] | 28872.21 | 28712.19 |
| constructUnalignedString charsetName=UTF-32LE, content=BMP, size=4096; default tiered | 1.272 [1.103, 2.278] | 1.290 [1.102, 2.003] | 1.108 [0.521, 1.551] | 45208.42 | 45096.31 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=65536; default tiered | 0.261 [0.195, 0.317] | 1.184 [0.665, 1.502] | 0.238 [0.116, 0.322] | 65577.13 | 589860.55 |
| charArrayCodePointCount size=1048576; default tiered | 0.319 [0.180, 0.364] | 0.733 [0.442, 1.127] | 0.310 [0.274, 0.353] | 1.42 | 4.56 |
| codePointCount size=1048576; default tiered | 0.404 [0.337, 0.446] | 0.883 [0.487, 0.986] | 0.409 [0.401, 0.434] | 1.40 | 3.52 |
| prefixedPairCharArrayCodePointCount size=1048576; default tiered | 0.220 [0.108, 0.297] | 1.121 [0.678, 1.491] | 0.214 [0.139, 0.286] | 1.66 | 8.42 |
| prefixedPairCodePointCount size=1048576; default tiered | 0.255 [0.125, 0.307] | 0.950 [0.770, 1.049] | 0.204 [0.170, 0.301] | 1.51 | 5.85 |
| bmpCharArrayCodePointCount size=1048576; default tiered | 0.242 [0.198, 0.339] | 1.001 [0.459, 1.114] | 0.258 [0.223, 0.348] | 1.41 | 6.78 |
| sparsePairCharArrayCodePointCount size=1048576; default tiered | 0.228 [0.208, 0.459] | 0.939 [0.645, 2.128] | 0.251 [0.233, 0.488] | 1.55 | 6.09 |
| lateMalformedCharArrayCodePointCount size=1048576; default tiered | 0.365 [0.205, 0.377] | 0.974 [0.935, 1.033] | 0.247 [0.154, 0.369] | 1.44 | 3.94 |
| decodeBuffer charsetName=UTF-16BE, content=BMP, size=4096, sourceKind=READ_ONLY, destinationKind=HEAP; default tiered | 0.457 [0.153, 2.248] | 1.621 [1.050, 7.311] | 0.404 [0.192, 2.506] | 16400.08 | 0.19 |
| getSegmentString charsetName=UTF-32LE, content=BMP, size=4096, memoryKind=NATIVE; default tiered | 0.512 [0.353, 0.716] | 1.020 [0.008, 1.827] | 0.417 [0.343, 0.602] | 24608.18 | 61488.35 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=16; C1 | 0.263 [0.200, 0.381] | 1.252 [0.887, 1.772] | 0.296 [0.246, 0.451] | 56.00 | 328.01 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=16; interpreter | 0.320 [0.288, 0.345] | 1.324 [1.110, 1.423] | 0.278 [0.233, 0.306] | 56.05 | 328.17 |
| constructString charsetName=UTF-32BE, content=SUPPLEMENTARY, size=16; default tiered | 1.092 [0.822, 1.397] | 0.956 [0.247, 1.058] | 1.335 [0.924, 1.388] | 152.00 | 152.00 |
| constructString charsetName=UTF-32LE, content=BMP, size=4096; C1 | 0.293 [0.231, 0.850] | 0.883 [0.554, 1.960] | 0.283 [0.197, 0.709] | 8232.30 | 45249.02 |
| constructString charsetName=UTF-32LE, content=BMP, size=4096; interpreter | 0.155 [0.119, 0.192] | 0.859 [0.812, 0.962] | 0.184 [0.170, 0.248] | 8238.36 | 45286.03 |
| decodeBuffer charsetName=UTF-16BE, content=BMP, size=4096, sourceKind=HEAP, destinationKind=HEAP; default tiered | 0.024 [0.015, 0.025] | 0.781 [0.601, 0.938] | 0.026 [0.015, 0.033] | 0.00 | 0.20 |
| decodeBuffer charsetName=UTF-16BE, content=BMP, size=4096, sourceKind=HEAP, destinationKind=DIRECT; default tiered | 0.293 [0.255, 0.934] | 0.828 [0.473, 1.031] | 0.271 [0.253, 1.692] | 16400.05 | 0.20 |
| arrayCopy ; default tiered | 1.121 [0.692, 1.462] | 1.041 [0.754, 1.755] | 0.924 [0.759, 1.522] | 0.00 | 0.00 |
| toStringSmall size=500; default tiered | 1.191 [0.358, 3.243] | 0.945 [0.155, 1.941] | 1.105 [0.257, 1.665] | 16000.08 | 16000.07 |

All absolute timings and allocations are in absolute-forks.csv. Every individual paired ratio is in paired-observations.csv; paired summaries are in paired-results.csv. Counts near zero allocation can include profiler/background overhead and are not interpreted as allocations by the native reduction.

## First use

Four independent fresh-process pairs per configuration, in the same four role orders. Wire bytes are constructed manually, without warming the codec through encoding. These are first calls in a default VM after charset lookup and allocation-counter setup, not warmed C2 timings. Whole-process elapsed times and host snapshots are also retained.

| Case | E/B first-call median [range] | E/O | E/D | E call us median [range] | E allocated bytes median [range] |
|---|---|---|---|---|---|
| UTF-32, 16, BMP | 0.958 [0.519, 1.365] | 0.993 [0.543, 1.251] | 0.548 [0.478, 0.972] | 417.86 [351.50, 552.53] | 1064 [1064, 1064] |
| Shift_JIS, 32, LATIN1 | 0.569 [0.429, 0.826] | 0.916 [0.722, 1.089] | 1.015 [0.725, 1.076] | 1126.92 [812.16, 1484.58] | 36520 [36520, 36520] |
| UTF-32LE, 65536, LATIN1 | 0.569 [0.416, 0.660] | 0.893 [0.723, 1.491] | 0.480 [0.363, 0.645] | 8324.80 [6833.55, 12432.21] | 66696 [66696, 66696] |

## Repairs and retained alternatives

The AOT failure came from a synthetic static assertion-state field in the anonymous Charset accessor. Assertions and assignment now live in Charset itself, leaving the accessor without declared fields. The eight previously failing x64/AArch64 AOT tests pass locally on x64.

The initial pending reader change produced large C2 losses. Compile logs showed a 3,464-byte Kind-dispatch nmethod versus 584 bytes in the published predecessor and callers refusing to inline it. The repair restores UTF-16 array word loads and separates the C2 UTF-32 word census/copy from the portable census and low-byte copy. The C2 BOM read uses the same word reader. Both censuses retain scalar-range checks, surrogate fallback and mutable-input storage checks. The copied UTF-32 MemorySegment route is retained.

The exact native counter counts adjacent high/low surrogate pairs directly, preserving Java isolated-surrogate semantics without validation plus a second pass. A single loop is inlined into a GCC/Clang AVX2-targeted function selected only after HotSpot verifies AVX/AVX2 and enables UseAVX>=2; generic code remains for other compilers/CPUs and lower UseAVX. Baseline-x64 and v3 standalone builds both passed 4,096 patterns at 23 lengths against an independent code-point walk, with YMM instructions confirmed in each targeted function. The actual JDK object and compile command are retained.

The String UTF-16 fallback returns to its original surrogate helpers. The disabled-mode diagnostic showed a consistent dense String improvement, while char-array tradeoffs were mixed, so its mask form remains. Whole-array UTF-16 bulk dispatch now rejects odd source offsets/incomplete units before the bulk helper; staging remains available when either buffer lacks an accessible array. Its diagnostic had a 26% paired median latency gain and an additional 48 B/op, both retained in the decision.

All rejected variants remain source-labelled. The forced large census, packed separate census, single mixed word/portable reader, and hoisted early-eligibility experiment were not relabelled or rerun until passing. Patched-class experiments uniformly patched both sides and are diagnostic only. Their base VM and patch-source hashes are explicit in each plan.

## Build and host limits

Fresh matched release images used GCC 14.2.0, boot JDK 27+35, x86-64-v3/generic tuning, the same headless/G1/serial/Z configuration, disabled javac server and no native debug symbols. Image manifests record exact source/tree, configure/compiler arguments, executable/module hashes and build times. Complete images and toolchains are excluded from the evidence archive.

This was native Linux x64 on an Ice Lake Xeon 8370C KVM guest, four-CPU quota, 16 GiB RAM. Initial panels used CPUs 0/1; extreme spikes coincided with 50–78% steal there. One affinity change to CPUs 2/3 was made from host counters, and all older data remain separate. Later controls still show substantial variation, limiting precision for small changes. No score is adjusted or filtered by host counters. Benchmark JVMs run without the process-local child reaper used for builds/tests.

Native AArch64 and macOS performance are separate and are not inferred from these x64 timings. Ordinary GitHub CI status for the exact published head is in ci-status.json.

## Provenance and reproduction

The existing continuation runner, analyser and fixture 87f93e1cc6014c05b521c6c7492b8b30912fd9a2 were reused. Original input archive qualification-evidence.zip matched 9,204,057 bytes and SHA-256 f5119e15cc708f89acaeaa7de297e4d13759647f619041e27fe05276c2f51e55; all 2,873 internal manifest entries matched. Reports, commands and pending patch were inspected before execution. The pending patch hash was 72f0a199c82cff8f611247a32efa9f213017cfb825a657c0a6b2b67d0388d1c7.

The evidence contains plans, commands, source-labelled raw JMH JSON/logs, test results, build/test scripts, a source bundle, fixture sources/jar and a SHA-256 manifest. Paths were transparently adapted to /workspace/work/pr2, /workspace/work/pr2-evidence/fresh and /workspace/toolchains. Build/test and timing phases were kept separate.
