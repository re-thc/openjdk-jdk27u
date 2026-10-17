# Previous native complete-image benchmarks (da3ae24)

This snapshot precedes the fixes prompted by these measurements. It is retained as candidate evidence, including every loss.

Matched untouched-original, enabled and disabled controls on native x86-64, ARM64 and MSVC hosts. Each backend uses its own pair of complete source-built JDK images; enabled and disabled use the same fork distribution. Results from different hosts are not compared.

Runtime sources are identical across the measured fork revisions. The Windows qualification revision changes only workflow/helper files; source identities, actual backend attestations, full-image fingerprints and all raw samples are in [raw samples and provenance](da3ae24-results.json). The untouched original is `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`.

| Backend | Fork revision | Distinct inputs | Triplets | Measurements |
| --- | --- | ---: | ---: | ---: |
| serial | `da3ae24b030d` | 53 | 93 | 279 |
| avx2 | `da3ae24b030d` | 64 | 126 | 378 |
| neon | `da3ae24b030d` | 53 | 93 | 279 |
| msvc | `5ff470b02689` | 53 | 93 | 279 |

64 distinct inputs produce 405 matched triplets, 1215 measurements and 2430 isolated JVM forks. The [manifest](https://github.com/re-thc/openjdk-jdk27u/blob/da3ae24b030d8c9c0694bbb5b33412f76c27780c/doc/stringzilla/native-cases.tsv) defines every input and its applicable backends/tiers. This targeted campaign follows the broader 99-workload campaign on the previous runtime revision; their samples are kept separate.

JMH 1.37 average time, ns/op: two forks, three 500 ms warmups and five 500 ms measurements per fork. One CPU affinity is inherited by the forked JVMs, with one active processor, Serial GC and CDS disabled. Control order rotates. Build profiles and compiler settings match within each backend; provenance records CPU, OS, compiler commands, flags, harness hashes and image hashes before/after timing. No control uses patched classes or substituted native objects.

Tables show mean ± JMH 99.9% confidence half-width. Ratios are control/enabled; above 1 favors enabled. Every higher enabled mean is flagged, including overlapping intervals. Interval overlap does not establish equivalence; these comparisons have no multiple-testing correction.

There are **142 higher enabled means** across 810 control comparisons; **77** have non-overlapping intervals. All remain in the table and raw evidence.

## Higher means with non-overlapping intervals

| Backend | Tier | Input | Compared with | Original | Disabled | Enabled |
| --- | --- | --- | --- | ---: | ---: | ---: |
| serial | interpreter | `tiny-latin` | original | 364.35 ± 22.25 | 414.42 ± 22.05 | 422.16 ± 12.59 |
| serial | interpreter | `tiny-utf16` | original | 621.88 ± 19.55 | 669.56 ± 18.24 | 680.05 ± 18.41 |
| serial | interpreter | `lower-latin1-32-end` | original | 452.28 ± 28.28 | 509.63 ± 12.45 | 498.00 ± 10.51 |
| serial | interpreter | `lower-utf16-15-end` | original | 976.77 ± 24.53 | 1,054.73 ± 24.02 | 1,062.43 ± 11.19 |
| serial | c2 | `threshold-latin1-255` | original | 51.01 ± 0.08 | 51.54 ± 0.16 | 132.31 ± 0.68 |
| serial | c2 | `threshold-latin1-255` | disabled | 51.01 ± 0.08 | 51.54 ± 0.16 | 132.31 ± 0.68 |
| serial | c1 | `threshold-utf16-127` | disabled | 166.85 ± 0.34 | 91.43 ± 0.59 | 128.26 ± 0.50 |
| serial | c2 | `threshold-utf16-127` | original | 28.94 ± 1.76 | 29.67 ± 0.15 | 86.65 ± 0.30 |
| serial | c2 | `threshold-utf16-127` | disabled | 28.94 ± 1.76 | 29.67 ± 0.15 | 86.65 ± 0.30 |
| serial | c1 | `immediate-utf16` | disabled | 10.40 ± 0.03 | 9.66 ± 0.03 | 10.28 ± 0.02 |
| serial | c1 | `mixed-end-9` | disabled | 15.96 ± 0.10 | 15.04 ± 0.06 | 15.65 ± 0.06 |
| avx2 | interpreter | `tiny-latin` | original | 288.34 ± 1.41 | 311.62 ± 3.53 | 313.24 ± 2.36 |
| avx2 | interpreter | `lower-latin1-31-miss` | original | 570.18 ± 3.03 | 603.82 ± 1.65 | 608.77 ± 4.80 |
| avx2 | interpreter | `lower-latin1-31-end` | original | 336.26 ± 9.79 | 356.60 ± 2.16 | 356.09 ± 3.10 |
| avx2 | interpreter | `lower-latin1-32-end` | original | 333.95 ± 1.80 | 363.34 ± 2.20 | 361.66 ± 1.51 |
| avx2 | interpreter | `lower-latin1-33-end` | original | 334.15 ± 0.67 | 362.62 ± 1.69 | 358.49 ± 5.90 |
| avx2 | c2 | `threshold-latin1-255` | original | 50.49 ± 0.53 | 50.54 ± 0.12 | 125.71 ± 0.95 |
| avx2 | c2 | `threshold-latin1-255` | disabled | 50.49 ± 0.53 | 50.54 ± 0.12 | 125.71 ± 0.95 |
| avx2 | c1 | `threshold-utf16-127` | disabled | 197.96 ± 7.23 | 81.40 ± 0.95 | 117.38 ± 0.23 |
| avx2 | c2 | `threshold-utf16-127` | original | 28.28 ± 0.08 | 28.77 ± 0.09 | 58.07 ± 6.91 |
| avx2 | c2 | `threshold-utf16-127` | disabled | 28.28 ± 0.08 | 28.77 ± 0.09 | 58.07 ± 6.91 |
| avx2 | c1 | `immediate-utf16` | original | 7.74 ± 0.52 | 7.49 ± 0.07 | 8.88 ± 0.10 |
| avx2 | c1 | `immediate-utf16` | disabled | 7.74 ± 0.52 | 7.49 ± 0.07 | 8.88 ± 0.10 |
| avx2 | interpreter | `immediate-latin` | original | 334.88 ± 0.92 | 363.46 ± 3.21 | 351.79 ± 3.34 |
| avx2 | c1 | `mixed-end-9` | original | 12.04 ± 0.04 | 11.80 ± 0.27 | 17.94 ± 0.07 |
| avx2 | c1 | `mixed-end-9` | disabled | 12.04 ± 0.04 | 11.80 ± 0.27 | 17.94 ± 0.07 |
| avx2 | c2 | `mixed-end-9` | original | 6.98 ± 0.01 | 7.12 ± 0.15 | 15.50 ± 0.11 |
| avx2 | c2 | `mixed-end-9` | disabled | 6.98 ± 0.01 | 7.12 ± 0.15 | 15.50 ± 0.11 |
| avx2 | c1 | `dense-latin-miss` | original | 66.45 ± 2.10 | 66.71 ± 0.71 | 89.36 ± 1.59 |
| avx2 | c1 | `dense-latin-miss` | disabled | 66.45 ± 2.10 | 66.71 ± 0.71 | 89.36 ± 1.59 |
| avx2 | c2 | `dense-latin-miss` | original | 21.49 ± 0.14 | 21.24 ± 0.06 | 83.58 ± 1.96 |
| avx2 | c2 | `dense-latin-miss` | disabled | 21.49 ± 0.14 | 21.24 ± 0.06 | 83.58 ± 1.96 |
| neon | interpreter | `lower-latin1-32-end` | original | 356.87 ± 21.61 | 393.17 ± 15.53 | 407.13 ± 9.12 |
| neon | interpreter | `lower-latin1-33-end` | original | 355.42 ± 13.51 | 399.16 ± 15.26 | 408.81 ± 9.66 |
| neon | interpreter | `lower-utf16-15-end` | original | 798.11 ± 16.58 | 842.12 ± 22.11 | 838.90 ± 22.02 |
| neon | c2 | `threshold-latin1-255` | original | 52.69 ± 0.36 | 51.50 ± 0.10 | 151.15 ± 2.02 |
| neon | c2 | `threshold-latin1-255` | disabled | 52.69 ± 0.36 | 51.50 ± 0.10 | 151.15 ± 2.02 |
| neon | c1 | `threshold-utf16-127` | disabled | 88.82 ± 1.02 | 85.39 ± 1.35 | 88.30 ± 0.85 |
| neon | c2 | `threshold-utf16-127` | original | 32.87 ± 0.23 | 33.39 ± 0.21 | 75.36 ± 0.50 |
| neon | c2 | `threshold-utf16-127` | disabled | 32.87 ± 0.23 | 33.39 ± 0.21 | 75.36 ± 0.50 |
| neon | c2 | `threshold-utf16-128` | original | 30.80 ± 3.49 | 33.41 ± 0.17 | 50.92 ± 0.06 |
| neon | c2 | `threshold-utf16-128` | disabled | 30.80 ± 3.49 | 33.41 ± 0.17 | 50.92 ± 0.06 |
| neon | interpreter | `immediate-latin` | original | 352.22 ± 12.58 | 409.28 ± 23.87 | 396.49 ± 11.16 |
| neon | c1 | `mixed-end-9` | original | 15.68 ± 0.13 | 14.30 ± 0.07 | 28.54 ± 0.05 |
| neon | c1 | `mixed-end-9` | disabled | 15.68 ± 0.13 | 14.30 ± 0.07 | 28.54 ± 0.05 |
| neon | c2 | `mixed-end-9` | original | 7.92 ± 0.02 | 8.18 ± 0.04 | 25.11 ± 0.12 |
| neon | c2 | `mixed-end-9` | disabled | 7.92 ± 0.02 | 8.18 ± 0.04 | 25.11 ± 0.12 |
| neon | c2 | `mixed-end-63` | original | 26.01 ± 0.03 | 26.41 ± 0.05 | 26.97 ± 0.09 |
| neon | c2 | `mixed-end-63` | disabled | 26.01 ± 0.03 | 26.41 ± 0.05 | 26.97 ± 0.09 |
| neon | c2 | `mixed-end-65` | original | 27.02 ± 0.04 | 27.51 ± 0.23 | 33.65 ± 0.30 |
| neon | c2 | `mixed-end-65` | disabled | 27.02 ± 0.04 | 27.51 ± 0.23 | 33.65 ± 0.30 |
| neon | c2 | `equal-latin1-32` | original | 3.53 ± 0.03 | 3.56 ± 0.01 | 3.58 ± 0.02 |
| neon | c2 | `equal-utf16-4096` | original | 503.20 ± 2.70 | 505.59 ± 3.82 | 507.74 ± 1.22 |
| neon | c1 | `overlap-min-latin` | original | 643.44 ± 1.08 | 643.72 ± 1.20 | 980.29 ± 6.21 |
| neon | c1 | `overlap-min-latin` | disabled | 643.44 ± 1.08 | 643.72 ± 1.20 | 980.29 ± 6.21 |
| neon | c2 | `overlap-min-latin` | original | 233.64 ± 5.76 | 229.14 ± 0.36 | 977.18 ± 2.42 |
| neon | c2 | `overlap-min-latin` | disabled | 233.64 ± 5.76 | 229.14 ± 0.36 | 977.18 ± 2.42 |
| neon | c1 | `overlap-min-utf16` | original | 264.76 ± 0.35 | 265.23 ± 1.49 | 778.72 ± 5.80 |
| neon | c1 | `overlap-min-utf16` | disabled | 264.76 ± 0.35 | 265.23 ± 1.49 | 778.72 ± 5.80 |
| neon | c2 | `overlap-min-utf16` | original | 117.56 ± 0.12 | 119.20 ± 0.81 | 690.32 ± 0.70 |
| neon | c2 | `overlap-min-utf16` | disabled | 117.56 ± 0.12 | 119.20 ± 0.81 | 690.32 ± 0.70 |
| msvc | interpreter | `tiny-latin` | original | 168.06 ± 11.25 | 198.55 ± 41.02 | 190.84 ± 9.33 |
| msvc | interpreter | `lower-latin1-32-end` | original | 203.95 ± 14.04 | 254.27 ± 11.82 | 243.95 ± 16.36 |
| msvc | c2 | `threshold-latin1-255` | original | 28.37 ± 1.59 | 27.73 ± 1.01 | 79.61 ± 3.13 |
| msvc | c2 | `threshold-latin1-255` | disabled | 28.37 ± 1.59 | 27.73 ± 1.01 | 79.61 ± 3.13 |
| msvc | c2 | `threshold-utf16-127` | original | 16.28 ± 0.60 | 15.87 ± 0.84 | 35.69 ± 1.46 |
| msvc | c2 | `threshold-utf16-127` | disabled | 16.28 ± 0.60 | 15.87 ± 0.84 | 35.69 ± 1.46 |
| msvc | c1 | `threshold-utf16-128` | disabled | 83.70 ± 3.84 | 63.53 ± 3.31 | 87.42 ± 7.36 |
| msvc | c2 | `mixed-miss-64` | original | 383.83 ± 15.93 | 467.63 ± 13.98 | 420.98 ± 16.06 |
| msvc | c1 | `bulk-utf16` | original | 2,016.90 ± 116.68 | 1,544.79 ± 63.65 | 2,290.67 ± 71.26 |
| msvc | c1 | `bulk-utf16` | disabled | 2,016.90 ± 116.68 | 1,544.79 ± 63.65 | 2,290.67 ± 71.26 |
| msvc | c2 | `bulk-utf16` | original | 384.96 ± 12.65 | 394.52 ± 14.86 | 2,345.49 ± 127.32 |
| msvc | c2 | `bulk-utf16` | disabled | 384.96 ± 12.65 | 394.52 ± 14.86 | 2,345.49 ± 127.32 |
| msvc | c2 | `long-utf16-64-512` | original | 243.70 ± 10.70 | 194.67 ± 7.94 | 422.79 ± 24.93 |
| msvc | c2 | `long-utf16-64-512` | disabled | 243.70 ± 10.70 | 194.67 ± 7.94 | 422.79 ± 24.93 |
| msvc | c2 | `long-utf16-64-4096` | original | 1,985.93 ± 77.78 | 2,016.11 ± 88.89 | 3,174.68 ± 127.24 |
| msvc | c2 | `long-utf16-64-4096` | disabled | 1,985.93 ± 77.78 | 2,016.11 ± 88.89 | 3,174.68 ± 127.24 |

## Complete results

| Backend | Tier | Input | Original | Disabled | Enabled | Original/enabled | Disabled/enabled | Higher enabled mean |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| serial | interpreter | `tiny-latin` | 364.35 ± 22.25 | 414.42 ± 22.05 | 422.16 ± 12.59 | 0.86 | 0.98 | original, disabled |
| serial | interpreter | `tiny-utf16` | 621.88 ± 19.55 | 669.56 ± 18.24 | 680.05 ± 18.41 | 0.91 | 0.98 | original, disabled |
| serial | interpreter | `lower-latin1-31-miss` | 777.62 ± 56.54 | 874.98 ± 40.97 | 865.25 ± 47.60 | 0.90 | 1.01 | original |
| serial | interpreter | `lower-latin1-31-end` | 459.55 ± 30.65 | 507.63 ± 16.85 | 506.00 ± 24.54 | 0.91 | 1.00 | original |
| serial | interpreter | `lower-latin1-32-miss` | 832.63 ± 115.41 | 893.48 ± 26.13 | 500.16 ± 16.49 | 1.66 | 1.79 | — |
| serial | interpreter | `lower-latin1-32-end` | 452.28 ± 28.28 | 509.63 ± 12.45 | 498.00 ± 10.51 | 0.91 | 1.02 | original |
| serial | interpreter | `lower-latin1-33-miss` | 828.24 ± 60.11 | 993.75 ± 134.32 | 509.12 ± 11.15 | 1.63 | 1.95 | — |
| serial | interpreter | `lower-latin1-33-end` | 462.84 ± 24.79 | 505.86 ± 13.57 | 495.79 ± 16.86 | 0.93 | 1.02 | original |
| serial | interpreter | `lower-utf16-15-miss` | 1,307.10 ± 54.11 | 1,474.29 ± 276.88 | 1,362.78 ± 39.61 | 0.96 | 1.08 | original |
| serial | interpreter | `lower-utf16-15-end` | 976.77 ± 24.53 | 1,054.73 ± 24.02 | 1,062.43 ± 11.19 | 0.92 | 0.99 | original, disabled |
| serial | interpreter | `lower-utf16-16-miss` | 1,353.38 ± 44.00 | 1,437.92 ± 68.33 | 732.71 ± 48.22 | 1.85 | 1.96 | — |
| serial | interpreter | `lower-utf16-16-end` | 986.38 ± 43.05 | 1,058.44 ± 33.29 | 630.28 ± 13.03 | 1.56 | 1.68 | — |
| serial | interpreter | `lower-utf16-17-miss` | 1,417.88 ± 57.77 | 1,511.68 ± 44.04 | 731.87 ± 12.88 | 1.94 | 2.07 | — |
| serial | interpreter | `lower-utf16-17-end` | 990.11 ± 28.36 | 1,039.02 ± 37.79 | 632.37 ± 14.80 | 1.57 | 1.64 | — |
| serial | interpreter | `threshold-latin1-255` | 4,178.62 ± 523.96 | 5,083.70 ± 183.71 | 618.21 ± 10.16 | 6.76 | 8.22 | — |
| serial | c1 | `threshold-latin1-255` | 248.80 ± 1.19 | 254.41 ± 26.61 | 256.27 ± 29.16 | 0.97 | 0.99 | original, disabled |
| serial | c2 | `threshold-latin1-255` | 51.01 ± 0.08 | 51.54 ± 0.16 | 132.31 ± 0.68 | 0.39 | 0.39 | original, disabled |
| serial | interpreter | `threshold-latin1-256` | 4,394.24 ± 393.73 | 4,775.16 ± 381.52 | 602.15 ± 15.41 | 7.30 | 7.93 | — |
| serial | c1 | `threshold-latin1-256` | 249.93 ± 3.26 | 256.61 ± 31.86 | 152.84 ± 5.96 | 1.64 | 1.68 | — |
| serial | c2 | `threshold-latin1-256` | 51.67 ± 0.20 | 51.91 ± 0.21 | 23.06 ± 0.44 | 2.24 | 2.25 | — |
| serial | interpreter | `threshold-utf16-127` | 8,193.34 ± 471.15 | 8,488.66 ± 174.40 | 741.43 ± 6.80 | 11.05 | 11.45 | — |
| serial | c1 | `threshold-utf16-127` | 166.85 ± 0.34 | 91.43 ± 0.59 | 128.26 ± 0.50 | 1.30 | 0.71 | disabled |
| serial | c2 | `threshold-utf16-127` | 28.94 ± 1.76 | 29.67 ± 0.15 | 86.65 ± 0.30 | 0.33 | 0.34 | original, disabled |
| serial | interpreter | `threshold-utf16-128` | 8,383.56 ± 289.85 | 8,461.96 ± 309.12 | 717.66 ± 26.78 | 11.68 | 11.79 | — |
| serial | c1 | `threshold-utf16-128` | 170.67 ± 11.17 | 92.10 ± 0.36 | 35.52 ± 0.28 | 4.81 | 2.59 | — |
| serial | c2 | `threshold-utf16-128` | 29.37 ± 1.84 | 30.17 ± 0.36 | 29.90 ± 0.60 | 0.98 | 1.01 | original |
| serial | interpreter | `immediate-utf16` | 987.38 ± 53.12 | 1,051.99 ± 33.34 | 611.74 ± 11.42 | 1.61 | 1.72 | — |
| serial | c1 | `immediate-utf16` | 10.40 ± 0.03 | 9.66 ± 0.03 | 10.28 ± 0.02 | 1.01 | 0.94 | disabled |
| serial | c2 | `immediate-utf16` | 6.07 ± 0.01 | 5.79 ± 0.02 | 5.00 ± 0.01 | 1.21 | 1.16 | — |
| serial | interpreter | `immediate-latin` | 454.86 ± 18.91 | 505.34 ± 23.15 | 468.89 ± 14.80 | 0.97 | 1.08 | original |
| serial | c1 | `immediate-latin` | 12.32 ± 0.04 | 11.99 ± 0.36 | 10.09 ± 0.09 | 1.22 | 1.19 | — |
| serial | c2 | `immediate-latin` | 6.88 ± 0.01 | 7.49 ± 1.49 | 6.57 ± 0.02 | 1.05 | 1.14 | — |
| serial | c1 | `mixed-end-9` | 15.96 ± 0.10 | 15.04 ± 0.06 | 15.65 ± 0.06 | 1.02 | 0.96 | disabled |
| serial | c2 | `mixed-end-9` | 10.34 ± 0.07 | 11.12 ± 0.38 | 7.73 ± 0.02 | 1.34 | 1.44 | — |
| serial | c1 | `mixed-end-63` | 72.11 ± 0.33 | 66.53 ± 1.08 | 64.70 ± 0.47 | 1.11 | 1.03 | — |
| serial | c2 | `mixed-end-63` | 28.51 ± 0.07 | 26.13 ± 0.17 | 22.59 ± 0.26 | 1.26 | 1.16 | — |
| serial | c1 | `mixed-end-64` | 72.87 ± 0.45 | 67.32 ± 1.24 | 61.78 ± 0.33 | 1.18 | 1.09 | — |
| serial | c2 | `mixed-end-64` | 28.54 ± 0.08 | 30.25 ± 12.16 | 24.03 ± 0.58 | 1.19 | 1.26 | — |
| serial | c1 | `mixed-end-65` | 73.81 ± 0.30 | 73.66 ± 0.56 | 62.79 ± 0.71 | 1.18 | 1.17 | — |
| serial | c2 | `mixed-end-65` | 29.43 ± 0.05 | 27.12 ± 0.63 | 23.43 ± 0.05 | 1.26 | 1.16 | — |
| serial | interpreter | `mixed-miss-64` | 252,869.92 ± 12,162.22 | 256,925.26 ± 10,375.13 | 908.80 ± 16.83 | 278.25 | 282.71 | — |
| serial | c1 | `mixed-miss-64` | 5,048.82 ± 7.80 | 2,534.42 ± 6.37 | 464.90 ± 4.88 | 10.86 | 5.45 | — |
| serial | c2 | `mixed-miss-64` | 723.30 ± 1.14 | 724.77 ± 2.10 | 478.53 ± 35.91 | 1.51 | 1.51 | — |
| serial | interpreter | `mixed-miss-65` | 257,071.15 ± 7,164.01 | 262,770.85 ± 13,490.23 | 2,451.76 ± 17.64 | 104.85 | 107.18 | — |
| serial | c1 | `mixed-miss-65` | 5,051.84 ± 10.13 | 2,536.96 ± 13.94 | 1,919.56 ± 7.06 | 2.63 | 1.32 | — |
| serial | c2 | `mixed-miss-65` | 723.43 ± 0.76 | 726.03 ± 1.33 | 294.94 ± 2.23 | 2.45 | 2.46 | — |
| serial | interpreter | `equal-latin1-32` | 825.16 ± 23.62 | 857.67 ± 53.22 | 194.01 ± 5.73 | 4.25 | 4.42 | — |
| serial | c1 | `equal-latin1-32` | 33.89 ± 0.40 | 35.09 ± 3.53 | 23.54 ± 0.29 | 1.44 | 1.49 | — |
| serial | c2 | `equal-latin1-32` | 4.09 ± 2.07 | 3.16 ± 0.01 | 3.16 ± 0.01 | 1.29 | 1.00 | disabled |
| serial | interpreter | `equal-latin1-4096` | 87,955.15 ± 6,027.09 | 83,767.23 ± 4,666.73 | 873.98 ± 959.22 | 100.64 | 95.85 | — |
| serial | c1 | `equal-latin1-4096` | 3,603.18 ± 74.80 | 3,620.27 ± 124.22 | 1,308.57 ± 6.76 | 2.75 | 2.77 | — |
| serial | c2 | `equal-latin1-4096` | 126.58 ± 0.45 | 126.37 ± 0.36 | 120.43 ± 10.57 | 1.05 | 1.05 | — |
| serial | interpreter | `equal-utf16-32` | 1,535.61 ± 84.61 | 1,479.66 ± 103.45 | 208.88 ± 15.63 | 7.35 | 7.08 | — |
| serial | c1 | `equal-utf16-32` | 63.93 ± 5.62 | 70.76 ± 0.84 | 40.56 ± 0.41 | 1.58 | 1.74 | — |
| serial | c2 | `equal-utf16-32` | 4.28 ± 0.21 | 4.17 ± 0.19 | 4.12 ± 0.03 | 1.04 | 1.01 | — |
| serial | interpreter | `equal-utf16-4096` | 169,816.16 ± 12,921.18 | 164,581.78 ± 9,111.85 | 3,069.92 ± 1,167.51 | 55.32 | 53.61 | — |
| serial | c1 | `equal-utf16-4096` | 7,169.31 ± 171.64 | 7,133.09 ± 11.55 | 2,586.77 ± 9.69 | 2.77 | 2.76 | — |
| serial | c2 | `equal-utf16-4096` | 232.29 ± 22.95 | 239.57 ± 0.79 | 239.43 ± 0.66 | 0.97 | 1.00 | original |
| serial | interpreter | `overlap-min-latin` | 10,741.49 ± 1,163.06 | 11,800.12 ± 811.72 | 1,498.12 ± 26.87 | 7.17 | 7.88 | — |
| serial | c1 | `overlap-min-latin` | 662.16 ± 1.70 | 701.47 ± 155.61 | 664.88 ± 3.54 | 1.00 | 1.06 | original |
| serial | c2 | `overlap-min-latin` | 210.40 ± 0.24 | 195.66 ± 18.94 | 157.92 ± 2.34 | 1.33 | 1.24 | — |
| serial | interpreter | `overlap-min-utf16` | 29,568.76 ± 1,578.56 | 31,376.94 ± 1,291.22 | 1,494.05 ± 19.03 | 19.79 | 21.00 | — |
| serial | c1 | `overlap-min-utf16` | 261.47 ± 0.49 | 260.95 ± 0.30 | 120.20 ± 0.40 | 2.18 | 2.17 | — |
| serial | c2 | `overlap-min-utf16` | 114.82 ± 0.19 | 97.14 ± 0.19 | 59.79 ± 0.19 | 1.92 | 1.62 | — |
| serial | interpreter | `bulk-latin1` | 65,512.94 ± 10,470.37 | 76,473.63 ± 4,741.22 | 2,563.03 ± 7.58 | 25.56 | 29.84 | — |
| serial | c1 | `bulk-latin1` | 4,042.80 ± 600.64 | 3,850.91 ± 15.47 | 2,105.71 ± 2.17 | 1.92 | 1.83 | — |
| serial | c2 | `bulk-latin1` | 771.74 ± 60.03 | 735.10 ± 2.37 | 280.17 ± 103.03 | 2.75 | 2.62 | — |
| serial | interpreter | `bulk-utf16` | 253,177.51 ± 15,443.16 | 268,712.88 ± 8,077.24 | 958.62 ± 9.85 | 264.11 | 280.31 | — |
| serial | c1 | `bulk-utf16` | 5,129.29 ± 8.17 | 2,571.84 ± 3.43 | 269.26 ± 4.36 | 19.05 | 9.55 | — |
| serial | c2 | `bulk-utf16` | 735.51 ± 1.59 | 737.35 ± 3.49 | 259.44 ± 0.75 | 2.83 | 2.84 | — |
| serial | interpreter | `long-utf16-64-512` | 91,979.62 ± 4,434.72 | 95,373.51 ± 1,866.95 | 727.53 ± 152.89 | 126.43 | 131.09 | — |
| serial | c1 | `long-utf16-64-512` | 1,081.04 ± 1.74 | 1,044.28 ± 3.80 | 53.30 ± 1.00 | 20.28 | 19.59 | — |
| serial | c2 | `long-utf16-64-512` | 453.47 ± 201.80 | 403.91 ± 1.08 | 48.80 ± 0.18 | 9.29 | 8.28 | — |
| serial | interpreter | `long-utf16-64-4096` | 817,614.07 ± 45,235.04 | 793,054.57 ± 37,107.35 | 935.11 ± 14.05 | 874.35 | 848.09 | — |
| serial | c1 | `long-utf16-64-4096` | 8,922.98 ± 36.14 | 8,925.43 ± 207.64 | 315.98 ± 1.15 | 28.24 | 28.25 | — |
| serial | c2 | `long-utf16-64-4096` | 2,979.51 ± 34.99 | 2,951.42 ± 101.78 | 312.50 ± 0.74 | 9.53 | 9.44 | — |
| serial | interpreter | `short-forward-latin1` | 695.87 ± 23.50 | 722.09 ± 33.79 | 263.17 ± 69.75 | 2.64 | 2.74 | — |
| serial | interpreter | `short-forward-utf16` | 2,167.95 ± 137.58 | 2,219.80 ± 37.86 | 254.97 ± 4.01 | 8.50 | 8.71 | — |
| serial | interpreter | `short-forward-mixed` | 2,138.77 ± 64.93 | 2,156.10 ± 75.31 | 232.44 ± 7.69 | 9.20 | 9.28 | — |
| serial | interpreter | `lower-mixed-15` | 1,201.63 ± 46.93 | 1,221.85 ± 29.46 | 1,186.10 ± 44.09 | 1.01 | 1.03 | — |
| serial | interpreter | `lower-mixed-16` | 1,272.94 ± 79.86 | 1,283.99 ± 48.79 | 566.80 ± 15.57 | 2.25 | 2.27 | — |
| serial | interpreter | `lower-mixed-17` | 1,330.24 ± 35.20 | 1,308.58 ± 75.31 | 564.97 ± 8.93 | 2.35 | 2.32 | — |
| serial | interpreter | `mixed-fallback-127-miss` | 4,341.38 ± 163.78 | 4,543.49 ± 107.71 | 572.89 ± 15.91 | 7.58 | 7.93 | — |
| serial | interpreter | `mixed-fallback-127-end` | 5,005.37 ± 259.41 | 4,949.86 ± 188.90 | 652.04 ± 19.21 | 7.68 | 7.59 | — |
| serial | interpreter | `mixed-fallback-128-miss` | 4,462.05 ± 221.73 | 4,605.54 ± 220.08 | 573.23 ± 10.66 | 7.78 | 8.03 | — |
| serial | interpreter | `mixed-fallback-128-end` | 5,333.18 ± 580.46 | 4,927.47 ± 171.77 | 641.01 ± 6.80 | 8.32 | 7.69 | — |
| serial | interpreter | `mixed-prefix-end-128` | 9,526.47 ± 628.43 | 9,341.48 ± 245.39 | 5,531.04 ± 144.97 | 1.72 | 1.69 | — |
| serial | interpreter | `mixed-prefix-end-129` | 9,299.79 ± 481.74 | 9,319.28 ± 545.81 | 5,644.23 ± 183.83 | 1.65 | 1.65 | — |
| serial | interpreter | `mixed-prefix-miss-128` | 249,385.30 ± 17,086.68 | 254,778.76 ± 12,024.54 | 2,407.20 ± 11.30 | 103.60 | 105.84 | — |
| serial | interpreter | `mixed-prefix-miss-129` | 246,302.97 ± 9,834.87 | 252,414.64 ± 16,352.80 | 2,637.07 ± 846.27 | 93.40 | 95.72 | — |
| serial | c1 | `mixed-probe-end-31` | 38.91 ± 0.20 | 41.86 ± 17.47 | 37.87 ± 0.14 | 1.03 | 1.11 | — |
| serial | c1 | `mixed-probe-end-32` | 39.98 ± 0.20 | 36.72 ± 0.29 | 24.97 ± 15.38 | 1.60 | 1.47 | — |
| serial | c1 | `mixed-probe-end-33` | 42.07 ± 1.21 | 37.90 ± 0.21 | 37.32 ± 7.27 | 1.13 | 1.02 | — |
| avx2 | interpreter | `tiny-latin` | 288.34 ± 1.41 | 311.62 ± 3.53 | 313.24 ± 2.36 | 0.92 | 0.99 | original, disabled |
| avx2 | interpreter | `tiny-utf16` | 488.75 ± 7.70 | 497.26 ± 3.04 | 493.82 ± 4.10 | 0.99 | 1.01 | original |
| avx2 | interpreter | `lower-latin1-31-miss` | 570.18 ± 3.03 | 603.82 ± 1.65 | 608.77 ± 4.80 | 0.94 | 0.99 | original, disabled |
| avx2 | interpreter | `lower-latin1-31-end` | 336.26 ± 9.79 | 356.60 ± 2.16 | 356.09 ± 3.10 | 0.94 | 1.00 | original |
| avx2 | interpreter | `lower-latin1-32-miss` | 581.78 ± 4.39 | 619.99 ± 1.68 | 380.91 ± 3.71 | 1.53 | 1.63 | — |
| avx2 | interpreter | `lower-latin1-32-end` | 333.95 ± 1.80 | 363.34 ± 2.20 | 361.66 ± 1.51 | 0.92 | 1.00 | original |
| avx2 | interpreter | `lower-latin1-33-miss` | 587.54 ± 2.32 | 633.22 ± 2.59 | 381.14 ± 3.59 | 1.54 | 1.66 | — |
| avx2 | interpreter | `lower-latin1-33-end` | 334.15 ± 0.67 | 362.62 ± 1.69 | 358.49 ± 5.90 | 0.93 | 1.01 | original |
| avx2 | interpreter | `lower-utf16-15-miss` | 953.49 ± 24.29 | 942.37 ± 3.82 | 943.97 ± 11.19 | 1.01 | 1.00 | disabled |
| avx2 | interpreter | `lower-utf16-15-end` | 729.12 ± 3.23 | 731.45 ± 3.56 | 725.36 ± 3.20 | 1.01 | 1.01 | — |
| avx2 | interpreter | `lower-utf16-16-miss` | 995.73 ± 7.64 | 997.53 ± 26.24 | 555.02 ± 3.01 | 1.79 | 1.80 | — |
| avx2 | interpreter | `lower-utf16-16-end` | 730.36 ± 6.70 | 737.58 ± 4.64 | 484.76 ± 7.59 | 1.51 | 1.52 | — |
| avx2 | interpreter | `lower-utf16-17-miss` | 1,028.90 ± 8.20 | 1,028.08 ± 2.83 | 558.08 ± 6.32 | 1.84 | 1.84 | — |
| avx2 | interpreter | `lower-utf16-17-end` | 735.42 ± 8.42 | 742.39 ± 20.34 | 481.07 ± 1.15 | 1.53 | 1.54 | — |
| avx2 | interpreter | `threshold-latin1-255` | 2,685.74 ± 12.13 | 2,867.56 ± 17.75 | 389.24 ± 4.78 | 6.90 | 7.37 | — |
| avx2 | c1 | `threshold-latin1-255` | 424.22 ± 9.55 | 418.52 ± 6.88 | 419.48 ± 19.72 | 1.01 | 1.00 | disabled |
| avx2 | c2 | `threshold-latin1-255` | 50.49 ± 0.53 | 50.54 ± 0.12 | 125.71 ± 0.95 | 0.40 | 0.40 | original, disabled |
| avx2 | interpreter | `threshold-latin1-256` | 2,698.35 ± 12.20 | 2,876.05 ± 12.57 | 390.10 ± 12.91 | 6.92 | 7.37 | — |
| avx2 | c1 | `threshold-latin1-256` | 427.08 ± 8.62 | 419.58 ± 12.11 | 35.53 ± 3.56 | 12.02 | 11.81 | — |
| avx2 | c2 | `threshold-latin1-256` | 50.77 ± 0.15 | 51.14 ± 0.12 | 31.53 ± 0.89 | 1.61 | 1.62 | — |
| avx2 | interpreter | `threshold-utf16-127` | 5,419.61 ± 13.86 | 5,321.57 ± 17.21 | 559.27 ± 3.04 | 9.69 | 9.52 | — |
| avx2 | c1 | `threshold-utf16-127` | 197.96 ± 7.23 | 81.40 ± 0.95 | 117.38 ± 0.23 | 1.69 | 0.69 | disabled |
| avx2 | c2 | `threshold-utf16-127` | 28.28 ± 0.08 | 28.77 ± 0.09 | 58.07 ± 6.91 | 0.49 | 0.50 | original, disabled |
| avx2 | interpreter | `threshold-utf16-128` | 5,488.36 ± 165.28 | 5,403.87 ± 116.33 | 554.14 ± 4.79 | 9.90 | 9.75 | — |
| avx2 | c1 | `threshold-utf16-128` | 204.50 ± 4.41 | 81.90 ± 0.43 | 40.33 ± 0.27 | 5.07 | 2.03 | — |
| avx2 | c2 | `threshold-utf16-128` | 27.20 ± 2.24 | 29.30 ± 0.58 | 27.68 ± 0.93 | 0.98 | 1.06 | original |
| avx2 | interpreter | `immediate-utf16` | 737.72 ± 15.33 | 735.43 ± 2.95 | 470.85 ± 2.18 | 1.57 | 1.56 | — |
| avx2 | c1 | `immediate-utf16` | 7.74 ± 0.52 | 7.49 ± 0.07 | 8.88 ± 0.10 | 0.87 | 0.84 | original, disabled |
| avx2 | c2 | `immediate-utf16` | 4.51 ± 0.02 | 4.78 ± 0.02 | 4.19 ± 0.02 | 1.08 | 1.14 | — |
| avx2 | interpreter | `immediate-latin` | 334.88 ± 0.92 | 363.46 ± 3.21 | 351.79 ± 3.34 | 0.95 | 1.03 | original |
| avx2 | c1 | `immediate-latin` | 7.90 ± 0.22 | 8.37 ± 0.38 | 7.72 ± 0.29 | 1.02 | 1.08 | — |
| avx2 | c2 | `immediate-latin` | 4.80 ± 0.04 | 4.95 ± 0.01 | 4.37 ± 0.03 | 1.10 | 1.13 | — |
| avx2 | c1 | `mixed-end-9` | 12.04 ± 0.04 | 11.80 ± 0.27 | 17.94 ± 0.07 | 0.67 | 0.66 | original, disabled |
| avx2 | c2 | `mixed-end-9` | 6.98 ± 0.01 | 7.12 ± 0.15 | 15.50 ± 0.11 | 0.45 | 0.46 | original, disabled |
| avx2 | c1 | `mixed-end-63` | 57.99 ± 0.18 | 57.90 ± 0.21 | 19.96 ± 0.21 | 2.91 | 2.90 | — |
| avx2 | c2 | `mixed-end-63` | 22.69 ± 0.18 | 21.50 ± 0.04 | 17.31 ± 0.26 | 1.31 | 1.24 | — |
| avx2 | c1 | `mixed-end-64` | 58.80 ± 0.21 | 60.82 ± 1.18 | 18.40 ± 0.42 | 3.20 | 3.31 | — |
| avx2 | c2 | `mixed-end-64` | 22.99 ± 0.07 | 22.15 ± 0.48 | 15.44 ± 0.54 | 1.49 | 1.43 | — |
| avx2 | c1 | `mixed-end-65` | 59.73 ± 0.12 | 59.66 ± 0.23 | 16.05 ± 0.78 | 3.72 | 3.72 | — |
| avx2 | c2 | `mixed-end-65` | 23.42 ± 0.22 | 22.55 ± 0.09 | 21.23 ± 0.23 | 1.10 | 1.06 | — |
| avx2 | interpreter | `mixed-miss-64` | 159,729.00 ± 565.83 | 158,477.04 ± 1,488.02 | 737.32 ± 7.32 | 216.63 | 214.94 | — |
| avx2 | c1 | `mixed-miss-64` | 4,609.07 ± 32.26 | 2,217.08 ± 20.42 | 405.84 ± 3.44 | 11.36 | 5.46 | — |
| avx2 | c2 | `mixed-miss-64` | 666.49 ± 1.55 | 736.84 ± 2.00 | 404.70 ± 10.58 | 1.65 | 1.82 | — |
| avx2 | interpreter | `mixed-miss-65` | 159,990.15 ± 472.53 | 158,813.36 ± 4,983.39 | 629.42 ± 19.45 | 254.19 | 252.32 | — |
| avx2 | c1 | `mixed-miss-65` | 4,611.15 ± 27.55 | 2,248.46 ± 93.48 | 254.56 ± 19.90 | 18.11 | 8.83 | — |
| avx2 | c2 | `mixed-miss-65` | 665.54 ± 1.70 | 738.53 ± 1.51 | 211.90 ± 2.19 | 3.14 | 3.49 | — |
| avx2 | interpreter | `equal-latin1-32` | 486.00 ± 8.52 | 560.48 ± 2.10 | 126.02 ± 3.13 | 3.86 | 4.45 | — |
| avx2 | c1 | `equal-latin1-32` | 26.52 ± 2.77 | 24.76 ± 0.30 | 8.99 ± 0.05 | 2.95 | 2.76 | — |
| avx2 | c2 | `equal-latin1-32` | 2.17 ± 0.01 | 2.11 ± 0.14 | 2.17 ± 0.02 | 1.00 | 0.97 | original, disabled |
| avx2 | interpreter | `equal-latin1-4096` | 42,550.69 ± 68.38 | 49,727.54 ± 438.26 | 192.38 ± 1.34 | 221.18 | 258.49 | — |
| avx2 | c1 | `equal-latin1-4096` | 2,363.71 ± 7.86 | 2,378.33 ± 55.58 | 69.09 ± 0.18 | 34.21 | 34.42 | — |
| avx2 | c2 | `equal-latin1-4096` | 90.12 ± 3.29 | 93.22 ± 8.93 | 89.30 ± 2.25 | 1.01 | 1.04 | — |
| avx2 | interpreter | `equal-utf16-32` | 826.27 ± 18.69 | 950.88 ± 1.75 | 125.72 ± 1.50 | 6.57 | 7.56 | — |
| avx2 | c1 | `equal-utf16-32` | 42.99 ± 1.35 | 48.16 ± 3.13 | 9.26 ± 0.04 | 4.64 | 5.20 | — |
| avx2 | c2 | `equal-utf16-32` | 2.59 ± 0.04 | 2.58 ± 0.01 | 2.64 ± 0.09 | 0.98 | 0.98 | original, disabled |
| avx2 | interpreter | `equal-utf16-4096` | 84,897.89 ± 132.56 | 99,396.17 ± 980.80 | 264.97 ± 15.82 | 320.40 | 375.12 | — |
| avx2 | c1 | `equal-utf16-4096` | 4,698.30 ± 13.53 | 4,703.19 ± 11.10 | 156.98 ± 0.98 | 29.93 | 29.96 | — |
| avx2 | c2 | `equal-utf16-4096` | 186.17 ± 5.56 | 186.88 ± 4.38 | 182.67 ± 0.89 | 1.02 | 1.02 | — |
| avx2 | interpreter | `overlap-min-latin` | 6,510.09 ± 6.53 | 6,544.86 ± 9.26 | 339.95 ± 0.98 | 19.15 | 19.25 | — |
| avx2 | c1 | `overlap-min-latin` | 490.92 ± 9.58 | 490.45 ± 6.13 | 488.97 ± 1.34 | 1.00 | 1.00 | — |
| avx2 | c2 | `overlap-min-latin` | 152.20 ± 0.42 | 153.46 ± 1.67 | 117.61 ± 0.70 | 1.29 | 1.30 | — |
| avx2 | interpreter | `overlap-min-utf16` | 19,309.02 ± 52.65 | 18,201.80 ± 37.82 | 538.70 ± 2.83 | 35.84 | 33.79 | — |
| avx2 | c1 | `overlap-min-utf16` | 189.08 ± 0.40 | 189.60 ± 0.61 | 104.99 ± 8.05 | 1.80 | 1.81 | — |
| avx2 | c2 | `overlap-min-utf16` | 73.75 ± 0.43 | 75.73 ± 1.65 | 43.38 ± 1.11 | 1.70 | 1.75 | — |
| avx2 | interpreter | `latin-span-31` | 99,683.53 ± 176.02 | 99,801.32 ± 159.66 | 334.54 ± 2.99 | 297.97 | 298.32 | — |
| avx2 | c1 | `latin-span-31` | 7,746.81 ± 23.49 | 7,758.53 ± 46.65 | 13.98 ± 0.41 | 554.17 | 555.01 | — |
| avx2 | c2 | `latin-span-31` | 2,412.46 ± 54.64 | 2,409.39 ± 4.35 | 140.20 ± 0.43 | 17.21 | 17.18 | — |
| avx2 | interpreter | `latin-span-32` | 102,766.25 ± 211.85 | 102,878.36 ± 260.07 | 333.68 ± 0.70 | 307.98 | 308.31 | — |
| avx2 | c1 | `latin-span-32` | 8,002.54 ± 92.63 | 7,994.82 ± 47.73 | 13.90 ± 0.58 | 575.57 | 575.02 | — |
| avx2 | c2 | `latin-span-32` | 2,474.72 ± 9.45 | 2,481.81 ± 9.78 | 11.09 ± 0.29 | 223.20 | 223.84 | — |
| avx2 | interpreter | `latin-span-33` | 105,689.99 ± 208.11 | 106,003.54 ± 687.66 | 339.14 ± 3.29 | 311.64 | 312.56 | — |
| avx2 | c1 | `latin-span-33` | 8,245.05 ± 59.09 | 8,354.42 ± 236.84 | 16.28 ± 0.74 | 506.48 | 513.20 | — |
| avx2 | c2 | `latin-span-33` | 2,528.39 ± 33.26 | 2,559.11 ± 10.08 | 11.71 ± 0.29 | 215.96 | 218.59 | — |
| avx2 | interpreter | `latin-span-63` | 198,495.85 ± 346.18 | 198,367.70 ± 344.60 | 335.66 ± 7.65 | 591.35 | 590.97 | — |
| avx2 | c1 | `latin-span-63` | 15,828.03 ± 1,470.93 | 15,548.87 ± 103.57 | 15.06 ± 0.50 | 1,051.00 | 1,032.46 | — |
| avx2 | c2 | `latin-span-63` | 4,730.32 ± 13.72 | 4,728.56 ± 170.31 | 11.50 ± 0.26 | 411.43 | 411.27 | — |
| avx2 | interpreter | `latin-span-64` | 201,856.65 ± 1,148.63 | 201,559.19 ± 396.04 | 756.30 ± 5.57 | 266.90 | 266.51 | — |
| avx2 | c1 | `latin-span-64` | 15,758.61 ± 94.29 | 15,809.12 ± 168.43 | 385.98 ± 54.43 | 40.83 | 40.96 | — |
| avx2 | c2 | `latin-span-64` | 4,784.62 ± 35.78 | 4,872.04 ± 17.50 | 421.61 ± 13.40 | 11.35 | 11.56 | — |
| avx2 | interpreter | `utf16-span-15` | 150,793.79 ± 697.93 | 143,436.31 ± 321.87 | 528.18 ± 1.51 | 285.50 | 271.57 | — |
| avx2 | c1 | `utf16-span-15` | 1,491.63 ± 7.08 | 1,504.27 ± 7.59 | 55.43 ± 0.57 | 26.91 | 27.14 | — |
| avx2 | c2 | `utf16-span-15` | 658.36 ± 14.93 | 645.84 ± 12.62 | 49.79 ± 0.29 | 13.22 | 12.97 | — |
| avx2 | interpreter | `utf16-span-16` | 160,181.04 ± 353.67 | 152,277.95 ± 382.83 | 529.60 ± 4.45 | 302.45 | 287.53 | — |
| avx2 | c1 | `utf16-span-16` | 1,599.03 ± 34.14 | 1,596.05 ± 6.81 | 54.76 ± 4.36 | 29.20 | 29.14 | — |
| avx2 | c2 | `utf16-span-16` | 706.19 ± 5.51 | 612.30 ± 10.06 | 51.29 ± 0.18 | 13.77 | 11.94 | — |
| avx2 | interpreter | `utf16-span-17` | 169,477.95 ± 403.45 | 161,515.82 ± 585.18 | 533.96 ± 15.05 | 317.40 | 302.49 | — |
| avx2 | c1 | `utf16-span-17` | 1,680.43 ± 11.11 | 1,696.94 ± 18.47 | 54.17 ± 0.16 | 31.02 | 31.33 | — |
| avx2 | c2 | `utf16-span-17` | 756.97 ± 48.54 | 678.89 ± 31.23 | 51.46 ± 0.14 | 14.71 | 13.19 | — |
| avx2 | interpreter | `dense-latin-miss` | 1,405.83 ± 5.33 | 1,447.61 ± 3.37 | 394.86 ± 1.46 | 3.56 | 3.67 | — |
| avx2 | c1 | `dense-latin-miss` | 66.45 ± 2.10 | 66.71 ± 0.71 | 89.36 ± 1.59 | 0.74 | 0.75 | original, disabled |
| avx2 | c2 | `dense-latin-miss` | 21.49 ± 0.14 | 21.24 ± 0.06 | 83.58 ± 1.96 | 0.26 | 0.25 | original, disabled |
| avx2 | interpreter | `dense-latin-start` | 4,483.18 ± 10.00 | 4,559.68 ± 157.16 | 403.35 ± 1.63 | 11.11 | 11.30 | — |
| avx2 | c1 | `dense-latin-start` | 307.16 ± 1.40 | 307.70 ± 3.56 | 93.98 ± 1.41 | 3.27 | 3.27 | — |
| avx2 | c2 | `dense-latin-start` | 149.51 ± 1.17 | 140.83 ± 0.34 | 90.35 ± 1.08 | 1.65 | 1.56 | — |
| avx2 | interpreter | `dense-latin-end` | 3,387.81 ± 6.49 | 3,431.00 ± 7.77 | 336.83 ± 6.95 | 10.06 | 10.19 | — |
| avx2 | c1 | `dense-latin-end` | 244.60 ± 0.78 | 244.98 ± 0.58 | 14.09 ± 0.34 | 17.36 | 17.38 | — |
| avx2 | c2 | `dense-latin-end` | 68.74 ± 0.44 | 68.08 ± 0.31 | 11.71 ± 0.87 | 5.87 | 5.81 | — |
| avx2 | interpreter | `bulk-latin1` | 39,114.41 ± 382.70 | 41,281.40 ± 131.15 | 516.15 ± 8.44 | 75.78 | 79.98 | — |
| avx2 | c1 | `bulk-latin1` | 5,329.63 ± 1,369.27 | 5,125.60 ± 1,639.10 | 172.10 ± 3.40 | 30.97 | 29.78 | — |
| avx2 | c2 | `bulk-latin1` | 704.95 ± 36.16 | 676.55 ± 1.85 | 172.00 ± 4.02 | 4.10 | 3.93 | — |
| avx2 | interpreter | `bulk-utf16` | 161,527.49 ± 589.16 | 159,837.43 ± 1,010.02 | 831.87 ± 12.93 | 194.17 | 192.14 | — |
| avx2 | c1 | `bulk-utf16` | 6,131.84 ± 268.47 | 2,233.42 ± 62.43 | 309.91 ± 0.38 | 19.79 | 7.21 | — |
| avx2 | c2 | `bulk-utf16` | 742.90 ± 4.71 | 727.04 ± 4.95 | 300.08 ± 1.42 | 2.48 | 2.42 | — |
| avx2 | interpreter | `long-utf16-64-512` | 59,152.11 ± 213.57 | 56,504.78 ± 215.62 | 561.67 ± 25.28 | 105.31 | 100.60 | — |
| avx2 | c1 | `long-utf16-64-512` | 904.83 ± 18.49 | 830.43 ± 20.42 | 74.72 ± 0.33 | 12.11 | 11.11 | — |
| avx2 | c2 | `long-utf16-64-512` | 298.32 ± 2.33 | 295.01 ± 0.59 | 70.42 ± 0.31 | 4.24 | 4.19 | — |
| avx2 | interpreter | `long-utf16-64-4096` | 503,969.19 ± 1,618.83 | 485,001.84 ± 1,305.30 | 924.65 ± 4.78 | 545.04 | 524.53 | — |
| avx2 | c1 | `long-utf16-64-4096` | 7,044.83 ± 11.36 | 7,212.13 ± 78.71 | 434.77 ± 1.19 | 16.20 | 16.59 | — |
| avx2 | c2 | `long-utf16-64-4096` | 2,490.24 ± 171.52 | 2,370.54 ± 28.85 | 429.38 ± 7.91 | 5.80 | 5.52 | — |
| avx2 | interpreter | `short-forward-latin1` | 463.41 ± 3.29 | 501.19 ± 2.82 | 188.47 ± 4.64 | 2.46 | 2.66 | — |
| avx2 | interpreter | `short-forward-utf16` | 1,423.68 ± 3.78 | 1,400.51 ± 5.29 | 188.38 ± 1.47 | 7.56 | 7.43 | — |
| avx2 | interpreter | `short-forward-mixed` | 1,421.52 ± 131.12 | 1,381.02 ± 9.49 | 173.34 ± 0.67 | 8.20 | 7.97 | — |
| avx2 | interpreter | `lower-mixed-15` | 847.32 ± 5.81 | 816.29 ± 3.08 | 814.91 ± 2.67 | 1.04 | 1.00 | — |
| avx2 | interpreter | `lower-mixed-16` | 888.79 ± 4.49 | 863.63 ± 10.27 | 415.02 ± 1.62 | 2.14 | 2.08 | — |
| avx2 | interpreter | `lower-mixed-17` | 932.95 ± 6.00 | 902.69 ± 4.53 | 418.55 ± 14.12 | 2.23 | 2.16 | — |
| avx2 | interpreter | `mixed-fallback-127-miss` | 2,908.48 ± 15.37 | 2,820.31 ± 19.15 | 406.43 ± 2.94 | 7.16 | 6.94 | — |
| avx2 | interpreter | `mixed-fallback-127-end` | 3,124.47 ± 35.76 | 3,009.00 ± 11.66 | 432.15 ± 4.58 | 7.23 | 6.96 | — |
| avx2 | interpreter | `mixed-fallback-128-miss` | 2,965.80 ± 86.83 | 2,860.80 ± 12.89 | 398.79 ± 1.15 | 7.44 | 7.17 | — |
| avx2 | interpreter | `mixed-fallback-128-end` | 3,121.58 ± 27.94 | 3,003.72 ± 14.77 | 427.14 ± 9.74 | 7.31 | 7.03 | — |
| avx2 | interpreter | `mixed-prefix-end-128` | 5,793.39 ± 31.02 | 5,552.96 ± 18.77 | 3,237.83 ± 13.63 | 1.79 | 1.72 | — |
| avx2 | interpreter | `mixed-prefix-end-129` | 5,844.65 ± 32.11 | 5,593.92 ± 10.99 | 3,288.88 ± 10.92 | 1.78 | 1.70 | — |
| avx2 | interpreter | `mixed-prefix-miss-128` | 158,039.08 ± 1,945.38 | 155,088.39 ± 763.16 | 606.89 ± 6.81 | 260.41 | 255.55 | — |
| avx2 | interpreter | `mixed-prefix-miss-129` | 157,575.56 ± 638.80 | 156,487.31 ± 2,093.28 | 616.64 ± 10.71 | 255.54 | 253.77 | — |
| avx2 | c1 | `mixed-probe-end-31` | 30.65 ± 0.12 | 30.79 ± 0.68 | 18.38 ± 0.44 | 1.67 | 1.67 | — |
| avx2 | c1 | `mixed-probe-end-32` | 31.65 ± 0.76 | 31.41 ± 0.10 | 16.01 ± 0.06 | 1.98 | 1.96 | — |
| avx2 | c1 | `mixed-probe-end-33` | 32.36 ± 0.05 | 32.26 ± 0.14 | 21.66 ± 0.33 | 1.49 | 1.49 | — |
| neon | interpreter | `tiny-latin` | 312.80 ± 21.68 | 336.47 ± 25.64 | 330.26 ± 12.69 | 0.95 | 1.02 | original |
| neon | interpreter | `tiny-utf16` | 543.15 ± 19.33 | 558.48 ± 7.20 | 556.32 ± 9.02 | 0.98 | 1.00 | original |
| neon | interpreter | `lower-latin1-31-miss` | 568.20 ± 28.66 | 590.09 ± 18.58 | 595.27 ± 33.97 | 0.95 | 0.99 | original, disabled |
| neon | interpreter | `lower-latin1-31-end` | 369.66 ± 34.49 | 384.31 ± 13.87 | 385.37 ± 20.04 | 0.96 | 1.00 | original, disabled |
| neon | interpreter | `lower-latin1-32-miss` | 576.55 ± 24.30 | 631.71 ± 14.36 | 431.12 ± 3.31 | 1.34 | 1.47 | — |
| neon | interpreter | `lower-latin1-32-end` | 356.87 ± 21.61 | 393.17 ± 15.53 | 407.13 ± 9.12 | 0.88 | 0.97 | original, disabled |
| neon | interpreter | `lower-latin1-33-miss` | 586.18 ± 28.75 | 659.85 ± 26.36 | 432.27 ± 4.33 | 1.36 | 1.53 | — |
| neon | interpreter | `lower-latin1-33-end` | 355.42 ± 13.51 | 399.16 ± 15.26 | 408.81 ± 9.66 | 0.87 | 0.98 | original, disabled |
| neon | interpreter | `lower-utf16-15-miss` | 1,024.51 ± 30.24 | 1,078.95 ± 32.74 | 1,062.41 ± 28.10 | 0.96 | 1.02 | original |
| neon | interpreter | `lower-utf16-15-end` | 798.11 ± 16.58 | 842.12 ± 22.11 | 838.90 ± 22.02 | 0.95 | 1.00 | original |
| neon | interpreter | `lower-utf16-16-miss` | 1,071.83 ± 28.19 | 1,142.51 ± 28.42 | 638.44 ± 3.55 | 1.68 | 1.79 | — |
| neon | interpreter | `lower-utf16-16-end` | 797.37 ± 14.77 | 845.85 ± 26.91 | 536.37 ± 5.25 | 1.49 | 1.58 | — |
| neon | interpreter | `lower-utf16-17-miss` | 1,101.92 ± 31.64 | 1,169.06 ± 38.77 | 637.92 ± 4.61 | 1.73 | 1.83 | — |
| neon | interpreter | `lower-utf16-17-end` | 799.47 ± 21.80 | 830.69 ± 6.78 | 536.26 ± 2.85 | 1.49 | 1.55 | — |
| neon | interpreter | `threshold-latin1-255` | 2,710.78 ± 174.50 | 2,975.67 ± 135.47 | 443.52 ± 3.49 | 6.11 | 6.71 | — |
| neon | c1 | `threshold-latin1-255` | 205.25 ± 0.16 | 205.13 ± 0.50 | 205.86 ± 0.51 | 1.00 | 1.00 | original, disabled |
| neon | c2 | `threshold-latin1-255` | 52.69 ± 0.36 | 51.50 ± 0.10 | 151.15 ± 2.02 | 0.35 | 0.34 | original, disabled |
| neon | interpreter | `threshold-latin1-256` | 2,650.01 ± 161.58 | 2,940.93 ± 111.53 | 433.28 ± 3.46 | 6.12 | 6.79 | — |
| neon | c1 | `threshold-latin1-256` | 206.11 ± 0.36 | 205.86 ± 0.40 | 42.06 ± 0.22 | 4.90 | 4.89 | — |
| neon | c2 | `threshold-latin1-256` | 53.10 ± 0.22 | 51.53 ± 0.95 | 39.19 ± 0.02 | 1.35 | 1.31 | — |
| neon | interpreter | `threshold-utf16-127` | 5,895.34 ± 300.95 | 6,158.98 ± 252.09 | 653.18 ± 5.73 | 9.03 | 9.43 | — |
| neon | c1 | `threshold-utf16-127` | 88.82 ± 1.02 | 85.39 ± 1.35 | 88.30 ± 0.85 | 1.01 | 0.97 | disabled |
| neon | c2 | `threshold-utf16-127` | 32.87 ± 0.23 | 33.39 ± 0.21 | 75.36 ± 0.50 | 0.44 | 0.44 | original, disabled |
| neon | interpreter | `threshold-utf16-128` | 5,874.28 ± 217.74 | 6,185.64 ± 110.92 | 644.59 ± 8.01 | 9.11 | 9.60 | — |
| neon | c1 | `threshold-utf16-128` | 88.92 ± 0.50 | 85.36 ± 0.17 | 55.83 ± 0.22 | 1.59 | 1.53 | — |
| neon | c2 | `threshold-utf16-128` | 30.80 ± 3.49 | 33.41 ± 0.17 | 50.92 ± 0.06 | 0.60 | 0.66 | original, disabled |
| neon | interpreter | `immediate-utf16` | 808.98 ± 17.52 | 844.40 ± 19.07 | 523.20 ± 5.07 | 1.55 | 1.61 | — |
| neon | c1 | `immediate-utf16` | 10.38 ± 0.02 | 9.86 ± 0.01 | 9.62 ± 0.03 | 1.08 | 1.02 | — |
| neon | c2 | `immediate-utf16` | 5.37 ± 0.07 | 5.49 ± 0.03 | 4.95 ± 0.01 | 1.08 | 1.11 | — |
| neon | interpreter | `immediate-latin` | 352.22 ± 12.58 | 409.28 ± 23.87 | 396.49 ± 11.16 | 0.89 | 1.03 | original |
| neon | c1 | `immediate-latin` | 10.23 ± 0.04 | 10.62 ± 0.12 | 8.38 ± 0.17 | 1.22 | 1.27 | — |
| neon | c2 | `immediate-latin` | 5.43 ± 0.14 | 5.32 ± 0.01 | 5.13 ± 0.01 | 1.06 | 1.04 | — |
| neon | c1 | `mixed-end-9` | 15.68 ± 0.13 | 14.30 ± 0.07 | 28.54 ± 0.05 | 0.55 | 0.50 | original, disabled |
| neon | c2 | `mixed-end-9` | 7.92 ± 0.02 | 8.18 ± 0.04 | 25.11 ± 0.12 | 0.32 | 0.33 | original, disabled |
| neon | c1 | `mixed-end-63` | 76.35 ± 0.09 | 68.24 ± 0.35 | 30.55 ± 0.19 | 2.50 | 2.23 | — |
| neon | c2 | `mixed-end-63` | 26.01 ± 0.03 | 26.41 ± 0.05 | 26.97 ± 0.09 | 0.96 | 0.98 | original, disabled |
| neon | c1 | `mixed-end-64` | 77.45 ± 0.05 | 69.17 ± 0.11 | 29.11 ± 0.24 | 2.66 | 2.38 | — |
| neon | c2 | `mixed-end-64` | 26.61 ± 0.27 | 27.00 ± 0.06 | 25.99 ± 0.17 | 1.02 | 1.04 | — |
| neon | c1 | `mixed-end-65` | 78.60 ± 0.12 | 70.18 ± 0.09 | 18.36 ± 0.07 | 4.28 | 3.82 | — |
| neon | c2 | `mixed-end-65` | 27.02 ± 0.04 | 27.51 ± 0.23 | 33.65 ± 0.30 | 0.80 | 0.82 | original, disabled |
| neon | interpreter | `mixed-miss-64` | 181,503.48 ± 7,425.05 | 186,696.40 ± 10,148.30 | 1,072.16 ± 1.50 | 169.29 | 174.13 | — |
| neon | c1 | `mixed-miss-64` | 2,396.36 ± 12.80 | 2,394.44 ± 5.08 | 688.68 ± 0.45 | 3.48 | 3.48 | — |
| neon | c2 | `mixed-miss-64` | 733.74 ± 12.30 | 742.62 ± 12.90 | 686.43 ± 0.35 | 1.07 | 1.08 | — |
| neon | interpreter | `mixed-miss-65` | 182,093.64 ± 5,585.02 | 184,286.01 ± 4,837.22 | 1,069.26 ± 3.97 | 170.30 | 172.35 | — |
| neon | c1 | `mixed-miss-65` | 2,396.19 ± 6.00 | 2,397.79 ± 19.08 | 620.27 ± 0.99 | 3.86 | 3.87 | — |
| neon | c2 | `mixed-miss-65` | 716.51 ± 5.91 | 739.66 ± 25.85 | 384.95 ± 1.87 | 1.86 | 1.92 | — |
| neon | interpreter | `equal-latin1-32` | 621.10 ± 8.83 | 637.16 ± 13.16 | 153.59 ± 2.96 | 4.04 | 4.15 | — |
| neon | c1 | `equal-latin1-32` | 29.25 ± 0.13 | 29.80 ± 0.23 | 12.11 ± 0.02 | 2.42 | 2.46 | — |
| neon | c2 | `equal-latin1-32` | 3.53 ± 0.03 | 3.56 ± 0.01 | 3.58 ± 0.02 | 0.99 | 0.99 | original, disabled |
| neon | interpreter | `equal-latin1-4096` | 58,218.65 ± 2,827.47 | 58,891.03 ± 2,862.16 | 310.01 ± 5.04 | 187.79 | 189.96 | — |
| neon | c1 | `equal-latin1-4096` | 3,209.39 ± 425.17 | 2,948.76 ± 4.10 | 163.26 ± 0.38 | 19.66 | 18.06 | — |
| neon | c2 | `equal-latin1-4096` | 262.90 ± 10.59 | 269.81 ± 0.66 | 270.05 ± 0.35 | 0.97 | 1.00 | original, disabled |
| neon | interpreter | `equal-utf16-32` | 1,112.63 ± 78.33 | 1,105.49 ± 79.48 | 152.79 ± 1.27 | 7.28 | 7.24 | — |
| neon | c1 | `equal-utf16-32` | 52.33 ± 0.14 | 52.96 ± 0.49 | 13.34 ± 0.03 | 3.92 | 3.97 | — |
| neon | c2 | `equal-utf16-32` | 5.61 ± 0.02 | 5.61 ± 0.04 | 5.61 ± 0.03 | 1.00 | 1.00 | disabled |
| neon | interpreter | `equal-utf16-4096` | 115,525.30 ± 3,836.18 | 114,933.09 ± 4,885.96 | 471.33 ± 3.13 | 245.11 | 243.85 | — |
| neon | c1 | `equal-utf16-4096` | 5,921.28 ± 61.84 | 5,971.32 ± 31.11 | 318.05 ± 0.67 | 18.62 | 18.77 | — |
| neon | c2 | `equal-utf16-4096` | 503.20 ± 2.70 | 505.59 ± 3.82 | 507.74 ± 1.22 | 0.99 | 1.00 | original, disabled |
| neon | interpreter | `overlap-min-latin` | 7,312.57 ± 304.58 | 7,966.93 ± 292.12 | 1,359.10 ± 4.03 | 5.38 | 5.86 | — |
| neon | c1 | `overlap-min-latin` | 643.44 ± 1.08 | 643.72 ± 1.20 | 980.29 ± 6.21 | 0.66 | 0.66 | original, disabled |
| neon | c2 | `overlap-min-latin` | 233.64 ± 5.76 | 229.14 ± 0.36 | 977.18 ± 2.42 | 0.24 | 0.23 | original, disabled |
| neon | interpreter | `overlap-min-utf16` | 21,074.19 ± 1,799.12 | 21,852.98 ± 1,287.45 | 1,265.59 ± 4.21 | 16.65 | 17.27 | — |
| neon | c1 | `overlap-min-utf16` | 264.76 ± 0.35 | 265.23 ± 1.49 | 778.72 ± 5.80 | 0.34 | 0.34 | original, disabled |
| neon | c2 | `overlap-min-utf16` | 117.56 ± 0.12 | 119.20 ± 0.81 | 690.32 ± 0.70 | 0.17 | 0.17 | original, disabled |
| neon | interpreter | `bulk-latin1` | 38,725.42 ± 2,597.76 | 44,773.05 ± 3,491.84 | 714.41 ± 8.14 | 54.21 | 62.67 | — |
| neon | c1 | `bulk-latin1` | 3,167.44 ± 7.07 | 3,174.03 ± 12.33 | 327.83 ± 1.88 | 9.66 | 9.68 | — |
| neon | c2 | `bulk-latin1` | 724.17 ± 19.02 | 727.26 ± 8.48 | 324.80 ± 0.24 | 2.23 | 2.24 | — |
| neon | interpreter | `bulk-utf16` | 174,284.06 ± 6,925.71 | 186,016.53 ± 8,621.31 | 1,210.36 ± 5.02 | 143.99 | 153.69 | — |
| neon | c1 | `bulk-utf16` | 2,532.61 ± 10.52 | 2,427.23 ± 1.46 | 602.30 ± 1.06 | 4.20 | 4.03 | — |
| neon | c2 | `bulk-utf16` | 748.59 ± 2.66 | 738.06 ± 8.73 | 597.07 ± 0.62 | 1.25 | 1.24 | — |
| neon | interpreter | `long-utf16-64-512` | 64,407.73 ± 1,828.72 | 68,014.13 ± 2,510.76 | 641.61 ± 3.62 | 100.38 | 106.01 | — |
| neon | c1 | `long-utf16-64-512` | 854.73 ± 2.98 | 871.04 ± 2.62 | 112.79 ± 0.12 | 7.58 | 7.72 | — |
| neon | c2 | `long-utf16-64-512` | 387.90 ± 1.79 | 378.76 ± 0.66 | 108.15 ± 0.73 | 3.59 | 3.50 | — |
| neon | interpreter | `long-utf16-64-4096` | 561,490.70 ± 47,835.87 | 581,325.91 ± 23,020.06 | 1,207.86 ± 12.46 | 464.86 | 481.28 | — |
| neon | c1 | `long-utf16-64-4096` | 7,223.14 ± 14.81 | 7,376.19 ± 21.67 | 676.12 ± 2.99 | 10.68 | 10.91 | — |
| neon | c2 | `long-utf16-64-4096` | 3,257.77 ± 71.04 | 3,104.74 ± 69.96 | 672.03 ± 2.79 | 4.85 | 4.62 | — |
| neon | interpreter | `short-forward-latin1` | 545.09 ± 39.79 | 571.85 ± 16.56 | 213.10 ± 0.63 | 2.56 | 2.68 | — |
| neon | interpreter | `short-forward-utf16` | 1,588.92 ± 75.42 | 1,652.44 ± 43.00 | 216.86 ± 1.10 | 7.33 | 7.62 | — |
| neon | interpreter | `short-forward-mixed` | 1,633.04 ± 115.27 | 1,720.42 ± 47.19 | 203.42 ± 0.29 | 8.03 | 8.46 | — |
| neon | interpreter | `lower-mixed-15` | 953.76 ± 23.07 | 946.28 ± 32.82 | 947.69 ± 55.24 | 1.01 | 1.00 | disabled |
| neon | interpreter | `lower-mixed-16` | 986.38 ± 18.74 | 1,005.96 ± 19.48 | 501.70 ± 3.20 | 1.97 | 2.01 | — |
| neon | interpreter | `lower-mixed-17` | 1,040.46 ± 36.73 | 1,048.61 ± 19.27 | 504.71 ± 2.49 | 2.06 | 2.08 | — |
| neon | interpreter | `mixed-fallback-127-miss` | 3,265.52 ± 148.49 | 3,300.87 ± 110.56 | 492.14 ± 5.76 | 6.64 | 6.71 | — |
| neon | interpreter | `mixed-fallback-127-end` | 3,737.69 ± 198.15 | 3,622.75 ± 165.40 | 530.90 ± 4.37 | 7.04 | 6.82 | — |
| neon | interpreter | `mixed-fallback-128-miss` | 3,310.87 ± 167.76 | 3,289.24 ± 57.48 | 480.08 ± 2.61 | 6.90 | 6.85 | — |
| neon | interpreter | `mixed-fallback-128-end` | 3,742.64 ± 213.61 | 3,584.10 ± 77.89 | 518.18 ± 4.66 | 7.22 | 6.92 | — |
| neon | interpreter | `mixed-prefix-end-128` | 6,877.31 ± 199.64 | 6,715.90 ± 230.26 | 4,144.97 ± 74.47 | 1.66 | 1.62 | — |
| neon | interpreter | `mixed-prefix-end-129` | 6,778.61 ± 327.22 | 6,799.91 ± 258.84 | 4,190.69 ± 66.33 | 1.62 | 1.62 | — |
| neon | interpreter | `mixed-prefix-miss-128` | 181,244.07 ± 8,144.37 | 181,479.90 ± 4,025.39 | 1,051.05 ± 2.07 | 172.44 | 172.67 | — |
| neon | interpreter | `mixed-prefix-miss-129` | 179,521.50 ± 3,348.07 | 180,604.98 ± 4,871.17 | 1,062.98 ± 4.69 | 168.89 | 169.90 | — |
| neon | c1 | `mixed-probe-end-31` | 40.39 ± 0.04 | 35.91 ± 0.03 | 27.34 ± 1.11 | 1.48 | 1.31 | — |
| neon | c1 | `mixed-probe-end-32` | 41.50 ± 0.04 | 36.98 ± 0.05 | 25.71 ± 0.06 | 1.61 | 1.44 | — |
| neon | c1 | `mixed-probe-end-33` | 42.61 ± 0.04 | 38.05 ± 0.05 | 31.19 ± 0.18 | 1.37 | 1.22 | — |
| msvc | interpreter | `tiny-latin` | 168.06 ± 11.25 | 198.55 ± 41.02 | 190.84 ± 9.33 | 0.88 | 1.04 | original |
| msvc | interpreter | `tiny-utf16` | 279.56 ± 11.74 | 304.31 ± 21.99 | 295.40 ± 12.76 | 0.95 | 1.03 | original |
| msvc | interpreter | `lower-latin1-31-miss` | 342.81 ± 30.49 | 386.58 ± 40.36 | 430.67 ± 58.28 | 0.80 | 0.90 | original, disabled |
| msvc | interpreter | `lower-latin1-31-end` | 199.87 ± 14.11 | 218.04 ± 6.62 | 217.45 ± 12.59 | 0.92 | 1.00 | original |
| msvc | interpreter | `lower-latin1-32-miss` | 350.03 ± 25.06 | 456.29 ± 164.50 | 260.08 ± 91.53 | 1.35 | 1.75 | — |
| msvc | interpreter | `lower-latin1-32-end` | 203.95 ± 14.04 | 254.27 ± 11.82 | 243.95 ± 16.36 | 0.84 | 1.04 | original |
| msvc | interpreter | `lower-latin1-33-miss` | 348.15 ± 90.04 | 432.23 ± 35.59 | 269.97 ± 20.53 | 1.29 | 1.60 | — |
| msvc | interpreter | `lower-latin1-33-end` | 204.33 ± 12.59 | 221.46 ± 13.70 | 222.61 ± 8.61 | 0.92 | 0.99 | original, disabled |
| msvc | interpreter | `lower-utf16-15-miss` | 589.62 ± 61.59 | 602.10 ± 40.95 | 617.50 ± 55.96 | 0.95 | 0.98 | original, disabled |
| msvc | interpreter | `lower-utf16-15-end` | 453.95 ± 23.70 | 469.73 ± 23.34 | 473.78 ± 21.19 | 0.96 | 0.99 | original, disabled |
| msvc | interpreter | `lower-utf16-16-miss` | 681.65 ± 171.26 | 768.42 ± 424.55 | 345.22 ± 27.10 | 1.97 | 2.23 | — |
| msvc | interpreter | `lower-utf16-16-end` | 461.05 ± 33.18 | 481.01 ± 21.13 | 293.39 ± 10.09 | 1.57 | 1.64 | — |
| msvc | interpreter | `lower-utf16-17-miss` | 602.69 ± 35.60 | 655.78 ± 51.52 | 339.88 ± 16.00 | 1.77 | 1.93 | — |
| msvc | interpreter | `lower-utf16-17-end` | 449.34 ± 33.35 | 494.97 ± 37.82 | 298.48 ± 17.94 | 1.51 | 1.66 | — |
| msvc | interpreter | `threshold-latin1-255` | 1,688.38 ± 381.92 | 1,959.95 ± 300.15 | 311.60 ± 13.83 | 5.42 | 6.29 | — |
| msvc | c1 | `threshold-latin1-255` | 145.83 ± 6.19 | 122.27 ± 5.53 | 119.99 ± 4.96 | 1.22 | 1.02 | — |
| msvc | c2 | `threshold-latin1-255` | 28.37 ± 1.59 | 27.73 ± 1.01 | 79.61 ± 3.13 | 0.36 | 0.35 | original, disabled |
| msvc | interpreter | `threshold-latin1-256` | 1,590.56 ± 235.39 | 1,972.95 ± 251.77 | 319.60 ± 10.23 | 4.98 | 6.17 | — |
| msvc | c1 | `threshold-latin1-256` | 148.15 ± 12.37 | 121.02 ± 4.16 | 101.35 ± 5.93 | 1.46 | 1.19 | — |
| msvc | c2 | `threshold-latin1-256` | 27.69 ± 1.37 | 27.67 ± 0.85 | 11.65 ± 0.51 | 2.38 | 2.38 | — |
| msvc | interpreter | `threshold-utf16-127` | 3,349.58 ± 212.78 | 3,617.79 ± 293.65 | 408.83 ± 22.38 | 8.19 | 8.85 | — |
| msvc | c1 | `threshold-utf16-127` | 82.54 ± 3.89 | 63.76 ± 2.33 | 62.76 ± 2.79 | 1.32 | 1.02 | — |
| msvc | c2 | `threshold-utf16-127` | 16.28 ± 0.60 | 15.87 ± 0.84 | 35.69 ± 1.46 | 0.46 | 0.44 | original, disabled |
| msvc | interpreter | `threshold-utf16-128` | 3,358.40 ± 315.51 | 3,651.48 ± 460.99 | 405.21 ± 17.48 | 8.29 | 9.01 | — |
| msvc | c1 | `threshold-utf16-128` | 83.70 ± 3.84 | 63.53 ± 3.31 | 87.42 ± 7.36 | 0.96 | 0.73 | original, disabled |
| msvc | c2 | `threshold-utf16-128` | 16.48 ± 1.25 | 15.91 ± 0.70 | 16.52 ± 0.72 | 1.00 | 0.96 | original, disabled |
| msvc | interpreter | `immediate-utf16` | 450.18 ± 25.42 | 494.17 ± 19.67 | 298.71 ± 12.14 | 1.51 | 1.65 | — |
| msvc | c1 | `immediate-utf16` | 6.45 ± 0.45 | 6.28 ± 0.75 | 6.70 ± 2.44 | 0.96 | 0.94 | original, disabled |
| msvc | c2 | `immediate-utf16` | 4.38 ± 0.22 | 4.51 ± 0.17 | 3.16 ± 0.10 | 1.38 | 1.42 | — |
| msvc | interpreter | `immediate-latin` | 208.56 ± 14.69 | 232.33 ± 16.15 | 219.97 ± 17.60 | 0.95 | 1.06 | original |
| msvc | c1 | `immediate-latin` | 7.81 ± 0.36 | 8.16 ± 0.27 | 6.50 ± 1.43 | 1.20 | 1.26 | — |
| msvc | c2 | `immediate-latin` | 4.78 ± 0.16 | 4.59 ± 0.10 | 3.89 ± 0.18 | 1.23 | 1.18 | — |
| msvc | c1 | `mixed-end-9` | 10.32 ± 0.40 | 10.86 ± 0.40 | 10.81 ± 0.52 | 0.96 | 1.00 | original |
| msvc | c2 | `mixed-end-9` | 8.21 ± 0.31 | 7.22 ± 0.36 | 5.07 ± 0.16 | 1.62 | 1.42 | — |
| msvc | c1 | `mixed-end-63` | 41.03 ± 1.65 | 64.76 ± 2.74 | 32.74 ± 3.64 | 1.25 | 1.98 | — |
| msvc | c2 | `mixed-end-63` | 17.81 ± 0.60 | 16.33 ± 0.61 | 14.60 ± 0.55 | 1.22 | 1.12 | — |
| msvc | c1 | `mixed-end-64` | 39.85 ± 1.46 | 63.46 ± 2.01 | 30.66 ± 0.86 | 1.30 | 2.07 | — |
| msvc | c2 | `mixed-end-64` | 18.48 ± 0.73 | 16.29 ± 0.49 | 14.60 ± 0.46 | 1.27 | 1.12 | — |
| msvc | c1 | `mixed-end-65` | 40.81 ± 1.65 | 64.80 ± 2.49 | 31.88 ± 1.58 | 1.28 | 2.03 | — |
| msvc | c2 | `mixed-end-65` | 18.10 ± 0.61 | 16.42 ± 0.63 | 14.02 ± 0.52 | 1.29 | 1.17 | — |
| msvc | interpreter | `mixed-miss-64` | 109,183.40 ± 12,967.81 | 118,135.39 ± 2,589.18 | 639.80 ± 22.77 | 170.65 | 184.64 | — |
| msvc | c1 | `mixed-miss-64` | 2,015.11 ± 74.48 | 1,535.25 ± 59.95 | 454.23 ± 25.38 | 4.44 | 3.38 | — |
| msvc | c2 | `mixed-miss-64` | 383.83 ± 15.93 | 467.63 ± 13.98 | 420.98 ± 16.06 | 0.91 | 1.11 | original |
| msvc | interpreter | `mixed-miss-65` | 103,979.95 ± 7,013.99 | 117,398.27 ± 4,148.03 | 1,630.38 ± 79.46 | 63.78 | 72.01 | — |
| msvc | c1 | `mixed-miss-65` | 2,051.99 ± 103.93 | 1,560.29 ± 61.24 | 1,404.06 ± 37.06 | 1.46 | 1.11 | — |
| msvc | c2 | `mixed-miss-65` | 388.50 ± 13.22 | 477.42 ± 16.69 | 118.56 ± 2.47 | 3.28 | 4.03 | — |
| msvc | interpreter | `equal-latin1-32` | 373.46 ± 23.36 | 381.58 ± 22.78 | 83.77 ± 4.29 | 4.46 | 4.56 | — |
| msvc | c1 | `equal-latin1-32` | 20.06 ± 0.92 | 20.04 ± 1.25 | 8.74 ± 0.30 | 2.30 | 2.29 | — |
| msvc | c2 | `equal-latin1-32` | 1.55 ± 0.07 | 1.62 ± 0.07 | 1.64 ± 0.04 | 0.94 | 0.99 | original, disabled |
| msvc | interpreter | `equal-latin1-4096` | 32,830.17 ± 3,537.88 | 30,521.76 ± 1,762.15 | 261.20 ± 10.24 | 125.69 | 116.85 | — |
| msvc | c1 | `equal-latin1-4096` | 1,911.35 ± 176.66 | 1,895.15 ± 84.54 | 167.74 ± 5.47 | 11.39 | 11.30 | — |
| msvc | c2 | `equal-latin1-4096` | 47.65 ± 8.49 | 56.05 ± 2.18 | 52.37 ± 2.77 | 0.91 | 1.07 | original |
| msvc | interpreter | `equal-utf16-32` | 627.68 ± 27.81 | 650.58 ± 49.18 | 115.08 ± 47.56 | 5.45 | 5.65 | — |
| msvc | c1 | `equal-utf16-32` | 34.41 ± 1.83 | 34.12 ± 1.48 | 10.05 ± 0.68 | 3.42 | 3.39 | — |
| msvc | c2 | `equal-utf16-32` | 1.86 ± 0.11 | 1.93 ± 0.11 | 1.91 ± 0.07 | 0.98 | 1.01 | original |
| msvc | interpreter | `equal-utf16-4096` | 62,584.30 ± 4,501.13 | 64,643.23 ± 5,504.89 | 397.00 ± 30.40 | 157.64 | 162.83 | — |
| msvc | c1 | `equal-utf16-4096` | 3,759.96 ± 149.13 | 3,819.16 ± 157.40 | 302.18 ± 21.19 | 12.44 | 12.64 | — |
| msvc | c2 | `equal-utf16-4096` | 89.48 ± 3.82 | 97.43 ± 10.72 | 90.28 ± 2.89 | 0.99 | 1.08 | original |
| msvc | interpreter | `overlap-min-latin` | 5,663.18 ± 792.11 | 5,011.81 ± 330.11 | 1,004.44 ± 41.27 | 5.64 | 4.99 | — |
| msvc | c1 | `overlap-min-latin` | 660.36 ± 41.31 | 361.82 ± 27.13 | 353.94 ± 10.97 | 1.87 | 1.02 | — |
| msvc | c2 | `overlap-min-latin` | 112.30 ± 4.35 | 111.44 ± 4.89 | 68.95 ± 3.01 | 1.63 | 1.62 | — |
| msvc | interpreter | `overlap-min-utf16` | 12,959.17 ± 618.10 | 13,929.08 ± 1,378.13 | 1,051.66 ± 40.81 | 12.32 | 13.24 | — |
| msvc | c1 | `overlap-min-utf16` | 155.66 ± 24.70 | 166.02 ± 8.01 | 97.88 ± 6.65 | 1.59 | 1.70 | — |
| msvc | c2 | `overlap-min-utf16` | 62.39 ± 2.61 | 56.79 ± 3.41 | 41.44 ± 1.45 | 1.51 | 1.37 | — |
| msvc | interpreter | `bulk-latin1` | 25,458.39 ± 3,830.25 | 29,641.27 ± 3,823.69 | 1,601.71 ± 69.21 | 15.89 | 18.51 | — |
| msvc | c1 | `bulk-latin1` | 1,967.67 ± 84.50 | 1,700.59 ± 66.65 | 1,326.20 ± 54.28 | 1.48 | 1.28 | — |
| msvc | c2 | `bulk-latin1` | 381.28 ± 15.67 | 386.84 ± 29.13 | 88.51 ± 3.24 | 4.31 | 4.37 | — |
| msvc | interpreter | `bulk-utf16` | 101,573.86 ± 7,197.09 | 107,727.03 ± 10,455.56 | 2,676.38 ± 92.64 | 37.95 | 40.25 | — |
| msvc | c1 | `bulk-utf16` | 2,016.90 ± 116.68 | 1,544.79 ± 63.65 | 2,290.67 ± 71.26 | 0.88 | 0.67 | original, disabled |
| msvc | c2 | `bulk-utf16` | 384.96 ± 12.65 | 394.52 ± 14.86 | 2,345.49 ± 127.32 | 0.16 | 0.17 | original, disabled |
| msvc | interpreter | `long-utf16-64-512` | 38,951.19 ± 1,463.59 | 41,514.91 ± 3,738.86 | 732.37 ± 49.35 | 53.19 | 56.69 | — |
| msvc | c1 | `long-utf16-64-512` | 671.36 ± 65.38 | 497.85 ± 19.46 | 424.93 ± 12.93 | 1.58 | 1.17 | — |
| msvc | c2 | `long-utf16-64-512` | 243.70 ± 10.70 | 194.67 ± 7.94 | 422.79 ± 24.93 | 0.58 | 0.46 | original, disabled |
| msvc | interpreter | `long-utf16-64-4096` | 341,625.84 ± 27,676.89 | 359,970.83 ± 24,214.81 | 3,525.43 ± 177.10 | 96.90 | 102.11 | — |
| msvc | c1 | `long-utf16-64-4096` | 5,835.15 ± 319.26 | 4,252.66 ± 176.57 | 3,170.99 ± 120.67 | 1.84 | 1.34 | — |
| msvc | c2 | `long-utf16-64-4096` | 1,985.93 ± 77.78 | 2,016.11 ± 88.89 | 3,174.68 ± 127.24 | 0.63 | 0.64 | original, disabled |
| msvc | interpreter | `short-forward-latin1` | 324.94 ± 29.31 | 356.47 ± 32.46 | 132.18 ± 4.41 | 2.46 | 2.70 | — |
| msvc | interpreter | `short-forward-utf16` | 980.99 ± 42.38 | 995.52 ± 70.12 | 148.60 ± 7.73 | 6.60 | 6.70 | — |
| msvc | interpreter | `short-forward-mixed` | 948.01 ± 69.36 | 966.34 ± 49.32 | 136.92 ± 14.72 | 6.92 | 7.06 | — |
| msvc | interpreter | `lower-mixed-15` | 534.09 ± 32.25 | 578.12 ± 16.07 | 568.79 ± 57.42 | 0.94 | 1.02 | original |
| msvc | interpreter | `lower-mixed-16` | 565.54 ± 21.12 | 604.94 ± 32.64 | 288.83 ± 15.85 | 1.96 | 2.09 | — |
| msvc | interpreter | `lower-mixed-17` | 577.35 ± 24.64 | 638.83 ± 8.98 | 288.82 ± 11.82 | 2.00 | 2.21 | — |
| msvc | interpreter | `mixed-fallback-127-miss` | 1,869.04 ± 130.04 | 1,967.11 ± 134.24 | 280.31 ± 16.53 | 6.67 | 7.02 | — |
| msvc | interpreter | `mixed-fallback-127-end` | 2,138.62 ± 112.63 | 2,209.97 ± 79.52 | 313.85 ± 18.05 | 6.81 | 7.04 | — |
| msvc | interpreter | `mixed-fallback-128-miss` | 1,893.40 ± 117.27 | 2,084.82 ± 154.41 | 285.19 ± 12.80 | 6.64 | 7.31 | — |
| msvc | interpreter | `mixed-fallback-128-end` | 2,253.45 ± 178.12 | 2,258.91 ± 176.45 | 300.27 ± 14.28 | 7.50 | 7.52 | — |
| msvc | interpreter | `mixed-prefix-end-128` | 4,102.56 ± 444.80 | 3,987.84 ± 276.09 | 2,397.90 ± 197.63 | 1.71 | 1.66 | — |
| msvc | interpreter | `mixed-prefix-end-129` | 4,210.35 ± 191.57 | 4,058.70 ± 264.03 | 2,466.60 ± 164.63 | 1.71 | 1.65 | — |
| msvc | interpreter | `mixed-prefix-miss-128` | 105,907.68 ± 7,350.82 | 116,486.85 ± 6,557.91 | 1,660.72 ± 75.10 | 63.77 | 70.14 | — |
| msvc | interpreter | `mixed-prefix-miss-129` | 105,805.74 ± 9,551.27 | 110,755.57 ± 7,910.84 | 1,631.29 ± 67.28 | 64.86 | 67.89 | — |
| msvc | c1 | `mixed-probe-end-31` | 22.62 ± 0.59 | 32.34 ± 1.17 | 21.77 ± 0.80 | 1.04 | 1.49 | — |
| msvc | c1 | `mixed-probe-end-32` | 22.92 ± 0.66 | 32.64 ± 1.72 | 20.38 ± 0.84 | 1.12 | 1.60 | — |
| msvc | c1 | `mixed-probe-end-33` | 23.63 ± 0.74 | 33.46 ± 1.14 | 24.08 ± 1.04 | 0.98 | 1.39 | original |

## Qualification scope

ARM64 measurements execute native NEON kernels, rather than QEMU. MSVC measurements execute the serial callback table with the recorded MSVC toolset; they do not represent the GCC serial build. GCC x86 serial dispatch in an x86-64-v3 image does not qualify physical hardware without AVX. Separate native sanitizer/bit-operation checks are recorded in [native-sanitizer-validation.json](../native-sanitizer-validation.json).
