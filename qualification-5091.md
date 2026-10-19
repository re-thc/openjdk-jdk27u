# PR2 fresh Linux x64 qualification

This is the broader, completed qualification of runtime 5091f852a19284e263e3b43d949c9139a6d1f35e, published through the copyright-only merge 8646a0ce149. It is retained as historical evidence for all 35 configurations against original baseline e206bae32 and published predecessor 9d5639bd. Later repairs and their exact full-image measurements are reported separately in qualification-report.md. No old measurements are relabelled as the follow-up source.

## Images

| Role | Meaning | Source |
|---|---|---|
| B | Original baseline | `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9` |
| O | Preceding published PR head | `9d5639bd4c1e4ce8878a1ddff374cc8ad05c502f` |
| E | Qualified candidate | `5091f852a19284e263e3b43d949c9139a6d1f35e` |
| D | Same E image, -XX:-UseSIMDUTFIntrinsics | `5091f852a19284e263e3b43d949c9139a6d1f35e` |

All images were freshly built with GCC 14.2.0, boot JDK 27+35, the same release configure options, x86-64-v3/generic tuning, 512 MiB benchmark heaps and two active processors. Exact trees, file hashes, configure/compiler commands and build dates are in images-final.json.

## Correctness

Passed 24 jtreg records, 49 main and 17 driver executions, all eight targeted AOT regressions, 140 fixture output checks across B/O/E/D, and 12 enabled/disabled AOT record/create/strict/auto commands. MetaspaceAllocGaps was run separately without target VM options to satisfy vm.flagless. Raw results are in validation-final.json and the .jtr files.

## Complete final panel

Four fixed interleaved role orders OBED, DEBO, BDOE, EODB; every role occupies every order position once. One independent JVM fork per invocation, one benchmark thread, three 1-second warmups, three 500-ms measurements and GC profiling. A paired observation divides the JMH fork score (mean of its three measurements) by the corresponding role score in the same order and configuration position. The table reports the median and observed minimum/maximum of those paired ratios. There are four independent pairs per workload and eight for bookended controls. Lower ratios are faster. All iterations, processes, losses and host counters are retained; no filtering, tight noise gate or retry-until-pass was used.

| Workload | E/B median [range] | E/O median [range] | E/D median [range] | E allocation B/op |
|---|---|---|---|---|
| fallbackConstructString charsetName=Shift_JIS, size=32; default tiered | 1.293 [1.149, 2.092] | 0.759 [0.241, 1.603] | 1.260 [0.974, 2.324] | 56.00 |
| fallbackConstructString charsetName=Shift_JIS, size=32; C1 | 1.063 [0.910, 3.870] | 1.017 [0.676, 4.665] | 1.006 [0.359, 2.502] | 128.00 |
| fallbackConstructString charsetName=Shift_JIS, size=32; interpreter | 0.888 [0.819, 1.413] | 1.226 [0.683, 1.486] | 1.141 [0.802, 1.707] | 128.02 |
| constructString charsetName=UTF-32, content=BMP, size=16; default tiered | 0.570 [0.550, 0.646] | 1.021 [1.015, 1.488] | 0.652 [0.645, 0.918] | 72.00 |
| constructString charsetName=UTF-32, content=BMP, size=16; C1 | 0.369 [0.245, 1.057] | 0.903 [0.817, 2.538] | 0.400 [0.309, 0.472] | 72.00 |
| constructString charsetName=UTF-32, content=BMP, size=16; interpreter | 0.259 [0.203, 0.445] | 0.840 [0.336, 4.945] | 0.302 [0.067, 1.784] | 72.06 |
| constructString charsetName=UTF-16BE, content=BMP, size=4096; default tiered | 0.118 [0.080, 0.183] | 0.914 [0.541, 2.152] | 0.131 [0.113, 0.237] | 8232.02 |
| constructString charsetName=UTF-32LE, content=SUPPLEMENTARY, size=65536; default tiered | 0.264 [0.053, 0.351] | 1.032 [0.605, 1.580] | 0.239 [0.133, 0.378] | 131112.96 |
| arrayCopy ; default tiered | 1.015 [0.461, 2.001] | 0.827 [0.209, 1.323] | 1.122 [0.513, 1.913] | 0.00 |
| toStringSmall size=500; default tiered | 0.993 [0.868, 9.766] | 0.999 [0.913, 8.328] | 0.989 [0.673, 9.648] | 16000.09 |
| constructUnalignedString charsetName=UTF-16BE, content=BMP, size=4096; default tiered | 1.551 [1.475, 1.842] | 1.027 [0.440, 1.141] | 1.502 [1.047, 2.115] | 28824.36 |
| constructUnalignedString charsetName=UTF-32LE, content=BMP, size=4096; default tiered | 1.044 [0.883, 1.342] | 0.896 [0.511, 1.297] | 0.829 [0.670, 1.099] | 45208.37 |
| constructString charsetName=UTF-16BE, content=LATIN1, size=65536; default tiered | 0.285 [0.276, 0.417] | 0.814 [0.455, 0.944] | 0.276 [0.113, 0.344] | 65576.83 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=65536; default tiered | 0.242 [0.117, 0.263] | 0.974 [0.862, 1.059] | 0.246 [0.112, 0.272] | 65577.09 |
| charArrayCodePointCount size=1048576; default tiered | 0.396 [0.246, 0.571] | 0.453 [0.312, 0.627] | 0.317 [0.195, 0.350] | 1.57 |
| codePointCount size=1048576; default tiered | 0.367 [0.306, 0.430] | 0.442 [0.354, 0.636] | 0.249 [0.218, 0.325] | 1.66 |
| prefixedPairCharArrayCodePointCount size=1048576; default tiered | 0.231 [0.168, 0.678] | 0.441 [0.388, 1.266] | 0.237 [0.222, 0.394] | 1.64 |
| prefixedPairCodePointCount size=1048576; default tiered | 0.268 [0.247, 0.307] | 0.460 [0.313, 0.486] | 0.240 [0.233, 0.258] | 1.47 |
| bmpCharArrayCodePointCount size=1048576; default tiered | 0.269 [0.148, 0.304] | 0.707 [0.612, 0.759] | 0.265 [0.257, 0.287] | 1.50 |
| sparsePairCharArrayCodePointCount size=1048576; default tiered | 0.152 [0.110, 0.566] | 0.607 [0.472, 0.863] | 0.259 [0.237, 0.396] | 1.46 |
| lateMalformedCharArrayCodePointCount size=1048576; default tiered | 0.364 [0.350, 0.787] | 0.302 [0.238, 0.698] | 0.329 [0.202, 0.607] | 2.09 |
| decodeBuffer charsetName=UTF-32LE, content=SUPPLEMENTARY, size=4096, sourceKind=DIRECT, destinationKind=HEAP; default tiered | 0.428 [0.310, 0.753] | 1.169 [0.828, 1.821] | 0.404 [0.243, 0.757] | 16400.08 |
| decodeBuffer charsetName=UTF-16BE, content=BMP, size=4096, sourceKind=READ_ONLY, destinationKind=HEAP; default tiered | 0.282 [0.213, 0.894] | 1.140 [0.499, 1.335] | 0.293 [0.234, 0.744] | 16400.06 |
| encodeBuffer charsetName=UTF-32LE, content=SUPPLEMENTARY, size=4096, sourceKind=SEGMENT, destinationKind=SEGMENT; default tiered | 0.424 [0.380, 0.445] | 1.027 [0.973, 1.119] | 0.440 [0.380, 0.482] | 12304.08 |
| getSegmentString charsetName=UTF-32LE, content=BMP, size=4096, memoryKind=NATIVE; default tiered | 0.410 [0.248, 1.013] | 1.086 [0.927, 3.182] | 0.435 [0.347, 1.310] | 24608.19 |
| getSegmentString charsetName=UTF-16BE, content=BMP, size=4096, memoryKind=NATIVE; default tiered | 0.237 [0.180, 0.246] | 1.102 [0.755, 1.134] | 0.233 [0.126, 0.249] | 16416.05 |
| setSegmentString charsetName=UTF-32LE, content=SUPPLEMENTARY, size=4096, memoryKind=NATIVE; default tiered | 0.517 [0.483, 0.804] | 1.075 [0.542, 1.520] | 0.661 [0.531, 0.800] | 8200.08 |
| malformedCharsetDecode size=4096; default tiered | 0.837 [0.498, 1.118] | 1.053 [0.502, 1.150] | 0.906 [0.740, 1.231] | 1.22 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=16; C1 | 0.205 [0.113, 0.343] | 0.640 [0.534, 0.747] | 0.292 [0.135, 0.346] | 56.00 |
| constructString charsetName=UTF-32LE, content=LATIN1, size=16; interpreter | 0.223 [0.169, 0.480] | 0.460 [0.255, 0.631] | 0.277 [0.248, 0.385] | 56.05 |
| constructString charsetName=UTF-32BE, content=SUPPLEMENTARY, size=16; default tiered | 1.369 [1.266, 1.384] | 1.216 [1.097, 1.420] | 1.351 [1.002, 1.387] | 152.00 |
| constructString charsetName=UTF-16BE, content=LATIN1, size=4096; C1 | 0.642 [0.577, 0.833] | 0.686 [0.373, 1.380] | 0.676 [0.348, 0.991] | 4136.40 |
| constructString charsetName=UTF-16BE, content=LATIN1, size=4096; interpreter | 0.825 [0.670, 0.885] | 0.983 [0.856, 1.050] | 0.839 [0.475, 0.907] | 4153.52 |
| constructString charsetName=UTF-32LE, content=BMP, size=4096; C1 | 0.299 [0.199, 0.349] | 0.657 [0.454, 1.484] | 0.343 [0.278, 0.525] | 8232.39 |
| constructString charsetName=UTF-32LE, content=BMP, size=4096; interpreter | 0.207 [0.149, 0.249] | 0.601 [0.490, 0.725] | 0.198 [0.172, 0.214] | 8238.59 |

All absolute scores, allocations and identities are in absolute-forks.csv; each pair is in paired-observations.csv, and summaries are in paired-results.csv. Small normalized count allocations can include profiler/background overhead; they are not interpreted as new per-call allocations in the native reduction.

## First use

Four fresh-process pairs per case, using the same balanced role orders, 512 MiB heap, two active processors and affinity. Wire bytes were assembled manually, avoiding a preparatory codec conversion. Time and thread allocation cover the first String construction after charset lookup and allocation-counter setup; whole-process elapsed time is also retained. These are default-VM cold-call measurements, not warmed C2 measurements.

| Case | E/B first-call median [range] | E/O | E/D | E first call us median [range] | E allocated bytes median [range] |
|---|---|---|---|---|---|
| UTF-32, 16, BMP | 1.399 [0.299, 3.345] | 1.322 [0.323, 4.844] | 0.942 [0.494, 6.010] | 580.80 [462.20, 3117.72] | 1064 [1064, 1064] |
| Shift_JIS, 32, LATIN1 | 1.299 [0.682, 1.594] | 0.818 [0.716, 0.993] | 0.838 [0.512, 1.172] | 1701.80 [1312.98, 1928.71] | 36520 [36520, 36520] |
| UTF-32LE, 65536, LATIN1 | 0.448 [0.297, 0.491] | 0.599 [0.345, 1.062] | 0.421 [0.395, 0.553] | 8826.85 [7840.58, 12341.56] | 66696 [66696, 66696] |

## Diagnostics and limitations

The accepted native counter was also compared with preceding full image 470757fc62ca5e2f226a019db05ffe0b3374cb71 in 72 fixed invocations. Pair-rich medians improved 42–70%, sparse pairs 33% and late malformed input 67%; BMP was roughly flat, with individual losses retained. The native reduction implements Java isolated-surrogate semantics directly, avoiding validation followed by a second count pass. Its tests cover surrogate classes, subranges, vector tails and leaf boundaries.

Five earlier reader alternatives and the initial full-image panel are retained separately and source-labelled. Patched-class timings are diagnostic only. They are not presented as full-image qualification, and neither the initial 7c20b817 image nor the earlier 04ed6e6 measurements are relabelled as 2c533541 or the final candidate.

The native Linux x64 host is an Ice Lake Xeon 8370C KVM guest with a four-CPU quota and 16 GiB RAM. Initial panels used CPUs 0/1; observed extreme spikes coincided with high per-CPU steal. One change to CPUs 2/3 was made for subsequent panels based on host counters. Earlier scores remain separate. Controls on the later placement also vary substantially, limiting precision for small changes. Scores are not adjusted using host counters. Native AArch64 and macOS performance are separate; no x64 timing claim is extended to them.

## Reproduction and provenance

The existing continuation runner/analyser and fixture pin 87f93e1cc6014c05b521c6c7492b8b30912fd9a2 were reused. Plans, exact commands, raw JMH JSON/logs, source patches, build/test scripts and SHA-256 manifests are included. Paths were adapted transparently to /workspace/work/pr2, /workspace/work/pr2-evidence/fresh and /workspace/toolchains. Complete images and toolchains are excluded from the evidence archive.

The input qualification-evidence.zip was verified at 9,204,057 bytes and SHA-256 f5119e15cc708f89acaeaa7de297e4d13759647f619041e27fe05276c2f51e55; all 2,873 internal manifest entries matched. Attached reports and commands were inspected before execution.

Ordinary current-head CI is recorded separately in ci-status.json.
