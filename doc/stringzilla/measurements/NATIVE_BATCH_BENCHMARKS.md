# AVX2 aligned-batch boundary qualification

Complete source-built JDK controls at production revision `90e763c6758c08b2cb8981beb8a038cf86c279e8`.
3 measured workloads, 9 matched triplets,
27 measurements and 54 isolated JVM forks.
Means and JMH 99.9% confidence half-widths are ns/op. Ratios below one are slower enabled means.
Every higher enabled mean is marked `(slower)` using unrounded scores, even if its ratio rounds to one.
No higher enabled means were measured.
There are 0 higher non-overlapping enabled/control intervals.
Interval comparisons are descriptive, without a multiple-testing correction; overlap does not establish equivalence.

[Method](../BENCHMARKS.md#method) and [raw records, image fingerprints and build provenance](native-batch-results.json).

The UTF-16 needle has 129 code units. Padding 30/31/32 gives haystack
lengths 160/161/162, spans 31/32/33, and 32/33/34 candidate positions.
The first input uses the aligned filter (at most 32 candidates); the latter
two use upstream byte search. All three are eligible for native calls in every
measured tier and retain a valid overlapping match at zero.

| Backend | Tier | Workload | Original JDK | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| avx2 | c1 | utf16-native-batch-above | 4,043.83 ± 243.84 | 3,294.16 ± 123.28 | 653.07 ± 25.60 | 6.192× | 5.044× | faster / faster |
| avx2 | c1 | utf16-native-batch-at | 3,787.32 ± 125.76 | 3,173.02 ± 216.78 | 331.32 ± 48.02 | 11.431× | 9.577× | faster / faster |
| avx2 | c1 | utf16-native-batch-below | 3,881.43 ± 297.27 | 3,051.80 ± 65.90 | 80.44 ± 5.88 | 48.251× | 37.938× | faster / faster |
| avx2 | c2 | utf16-native-batch-above | 1,493.06 ± 58.77 | 1,249.95 ± 59.03 | 647.15 ± 19.00 | 2.307× | 1.931× | faster / faster |
| avx2 | c2 | utf16-native-batch-at | 1,519.86 ± 119.05 | 1,295.95 ± 73.37 | 304.79 ± 15.03 | 4.987× | 4.252× | faster / faster |
| avx2 | c2 | utf16-native-batch-below | 1,647.86 ± 223.32 | 1,306.87 ± 324.58 | 73.12 ± 2.70 | 22.536× | 17.872× | faster / faster |
| avx2 | interpreter | utf16-native-batch-above | 295,684.79 ± 11,383.20 | 316,515.04 ± 30,252.87 | 1,114.14 ± 49.93 | 265.394× | 284.090× | faster / faster |
| avx2 | interpreter | utf16-native-batch-at | 293,047.40 ± 21,020.05 | 310,196.73 ± 29,443.64 | 764.06 ± 45.69 | 383.537× | 405.982× | faster / faster |
| avx2 | interpreter | utf16-native-batch-below | 281,007.60 ± 15,979.39 | 294,278.13 ± 15,248.08 | 494.83 ± 14.87 | 567.890× | 594.708× | faster / faster |
