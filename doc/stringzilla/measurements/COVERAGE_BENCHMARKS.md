# Complete final-code performance coverage

This report includes all 53 distinct workloads in [coverage-cases.tsv](../coverage-cases.tsv).
AVX2 covers all 53; serial and AVX-512 each cover the same 16-case subset.
Each backend/workload uses interpreter, C1 and C2 with enabled, disabled and
original-Java controls: 255 control triplets and 765 two-fork measurements.

See [the method and interpretation](../BENCHMARKS.md) and
[raw samples and artifact hashes](coverage-results.json). Means and JMH 99.9%
confidence half-widths are in ns/op. Ratios are control / enabled; a ratio
below 1 means the enabled mean was slower. Interval labels compare enabled
with original / disabled respectively. `overlap` does not establish equivalence.

## Interval counts

| Backend | Tier | Control | Faster | Overlap | Slower |
| --- | --- | --- | ---: | ---: | ---: |
| avx2 | interpreter | original | 40 | 12 | 1 |
| avx2 | interpreter | disabled | 41 | 12 | 0 |
| avx2 | c1 | original | 45 | 8 | 0 |
| avx2 | c1 | disabled | 42 | 11 | 0 |
| avx2 | c2 | original | 15 | 35 | 3 |
| avx2 | c2 | disabled | 14 | 37 | 2 |
| serial | interpreter | original | 14 | 2 | 0 |
| serial | interpreter | disabled | 14 | 2 | 0 |
| serial | c1 | original | 14 | 1 | 1 |
| serial | c1 | disabled | 14 | 1 | 1 |
| serial | c2 | original | 8 | 5 | 3 |
| serial | c2 | disabled | 8 | 5 | 3 |
| avx512 | interpreter | original | 14 | 2 | 0 |
| avx512 | interpreter | disabled | 14 | 2 | 0 |
| avx512 | c1 | original | 15 | 1 | 0 |
| avx512 | c1 | disabled | 14 | 2 | 0 |
| avx512 | c2 | original | 11 | 5 | 0 |
| avx512 | c2 | disabled | 11 | 5 | 0 |

## avx2

| Workload | Tier | Original Java | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| `long-end-64-small` | interpreter | 56,048.64 ± 3,063.87 | 57,209.52 ± 1,663.42 | 333.67 ± 54.12 | 167.98× | 171.46× | faster / faster |
| `long-end-64-small` | c1 | 916.02 ± 64.16 | 840.88 ± 36.35 | 63.79 ± 1.75 | 14.36× | 13.18× | faster / faster |
| `long-end-64-small` | c2 | 294.14 ± 3.82 | 330.52 ± 11.87 | 61.59 ± 1.22 | 4.78× | 5.37× | faster / faster |
| `long-end-64-large` | interpreter | 467,854.69 ± 11,776.52 | 475,374.63 ± 9,005.59 | 632.07 ± 37.58 | 740.20× | 752.09× | faster / faster |
| `long-end-64-large` | c1 | 7,204.95 ± 144.33 | 7,047.25 ± 137.73 | 350.30 ± 28.06 | 20.57× | 20.12× | faster / faster |
| `long-end-64-large` | c2 | 2,407.71 ± 30.77 | 2,425.28 ± 66.63 | 343.70 ± 23.83 | 7.01× | 7.06× | faster / faster |
| `long-start-64-small` | interpreter | 1,932,234.25 ± 122,739.98 | 1,889,351.46 ± 179,821.97 | 983.10 ± 22.33 | 1965.45× | 1921.83× | faster / faster |
| `long-start-64-small` | c1 | 23,842.78 ± 608.08 | 20,240.10 ± 444.03 | 767.96 ± 21.44 | 31.05× | 26.36× | faster / faster |
| `long-start-64-small` | c2 | 7,314.64 ± 660.94 | 7,377.31 ± 272.99 | 763.32 ± 17.70 | 9.58× | 9.66× | faster / faster |
| `long-start-64-large` | interpreter | 16,501,431.43 ± 572,685.09 | 16,666,170.22 ± 459,971.73 | 6,432.73 ± 232.76 | 2565.23× | 2590.84× | faster / faster |
| `long-start-64-large` | c1 | 213,153.50 ± 5,135.20 | 194,772.99 ± 13,711.68 | 6,522.34 ± 355.37 | 32.68× | 29.86× | faster / faster |
| `long-start-64-large` | c2 | 78,627.09 ± 26,428.82 | 72,922.69 ± 18,692.78 | 6,319.95 ± 313.62 | 12.44× | 11.54× | faster / faster |
| `long-end-256` | interpreter | 471,299.93 ± 37,984.37 | 469,946.06 ± 26,416.62 | 1,558.59 ± 99.14 | 302.39× | 301.52× | faster / faster |
| `long-end-256` | c1 | 7,137.05 ± 608.23 | 6,705.26 ± 89.55 | 1,010.05 ± 17.91 | 7.07× | 6.64× | faster / faster |
| `long-end-256` | c2 | 2,641.73 ± 47.77 | 2,668.28 ± 114.21 | 1,040.83 ± 51.89 | 2.54× | 2.56× | faster / faster |
| `long-overlap-129` | interpreter | 4,347,139.68 ± 350,778.63 | 4,454,148.55 ± 262,432.77 | 937.12 ± 35.74 | 4638.83× | 4753.02× | faster / faster |
| `long-overlap-129` | c1 | 59,595.88 ± 1,606.11 | 49,310.30 ± 3,161.84 | 747.34 ± 26.90 | 79.74× | 65.98× | faster / faster |
| `long-overlap-129` | c2 | 20,752.47 ± 2,123.58 | 19,701.43 ± 772.66 | 674.06 ± 20.43 | 30.79× | 29.23× | faster / faster |
| `long-overlap-latin-257` | interpreter | 1,688,905.78 ± 245,458.18 | 1,846,884.44 ± 187,076.14 | 1,214.78 ± 51.91 | 1390.30× | 1520.34× | faster / faster |
| `long-overlap-latin-257` | c1 | 159,871.74 ± 3,259.87 | 156,101.36 ± 8,177.59 | 903.73 ± 30.39 | 176.90× | 172.73× | faster / faster |
| `long-overlap-latin-257` | c2 | 37,874.60 ± 1,745.56 | 36,289.01 ± 525.80 | 892.43 ± 14.33 | 42.44× | 40.66× | faster / faster |
| `long-crossed-4` | interpreter | 141,169.65 ± 8,695.21 | 144,200.78 ± 3,944.57 | 640.49 ± 26.55 | 220.41× | 225.14× | faster / faster |
| `long-crossed-4` | c1 | 4,641.78 ± 58.26 | 2,349.66 ± 72.49 | 293.05 ± 5.40 | 15.84× | 8.02× | faster / faster |
| `long-crossed-4` | c2 | 664.19 ± 5.45 | 677.28 ± 43.72 | 288.01 ± 10.54 | 2.31× | 2.35× | faster / faster |
| `short-latin` | interpreter | 469.84 ± 38.13 | 476.79 ± 33.73 | 496.76 ± 28.50 | 0.95× | 0.96× | overlap / overlap |
| `short-latin` | c1 | 22.63 ± 1.47 | 22.29 ± 0.74 | 23.32 ± 1.91 | 0.97× | 0.96× | overlap / overlap |
| `short-latin` | c2 | 4.57 ± 0.08 | 4.73 ± 0.38 | 5.02 ± 0.44 | 0.91× | 0.94× | overlap / overlap |
| `short-utf16` | interpreter | 1,445.71 ± 75.63 | 1,521.00 ± 88.61 | 1,488.48 ± 74.86 | 0.97× | 1.02× | overlap / overlap |
| `short-utf16` | c1 | 38.77 ± 1.54 | 23.64 ± 0.93 | 23.92 ± 2.85 | 1.62× | 0.99× | faster / overlap |
| `short-utf16` | c2 | 11.04 ± 1.07 | 10.04 ± 0.18 | 10.94 ± 1.33 | 1.01× | 0.92× | overlap / overlap |
| `short-mixed` | interpreter | 1,338.79 ± 279.77 | 1,409.49 ± 164.03 | 1,340.75 ± 51.07 | 1.00× | 1.05× | overlap / overlap |
| `short-mixed` | c1 | 18.41 ± 0.28 | 18.67 ± 0.87 | 19.20 ± 0.62 | 0.96× | 0.97× | overlap / overlap |
| `short-mixed` | c2 | 7.88 ± 0.84 | 7.62 ± 0.22 | 7.80 ± 0.32 | 1.01× | 0.98× | overlap / overlap |
| `tiny-latin-search` | interpreter | 194.59 ± 3.36 | 195.49 ± 8.45 | 191.30 ± 5.51 | 1.02× | 1.02× | overlap / overlap |
| `tiny-latin-search` | c1 | 6.01 ± 0.24 | 6.27 ± 0.20 | 6.38 ± 0.21 | 0.94× | 0.98× | overlap / overlap |
| `tiny-latin-search` | c2 | 3.66 ± 0.22 | 3.53 ± 0.03 | 3.55 ± 0.11 | 1.03× | 1.00× | overlap / overlap |
| `tiny-utf16-search` | interpreter | 436.15 ± 19.46 | 461.95 ± 66.32 | 431.11 ± 14.26 | 1.01× | 1.07× | overlap / overlap |
| `tiny-utf16-search` | c1 | 6.51 ± 0.40 | 6.63 ± 0.09 | 6.96 ± 0.27 | 0.93× | 0.95× | overlap / overlap |
| `tiny-utf16-search` | c2 | 2.89 ± 0.12 | 2.92 ± 0.08 | 2.83 ± 0.03 | 1.02× | 1.03× | overlap / overlap |
| `tiny-mixed-search` | interpreter | 249.76 ± 7.61 | 268.04 ± 5.56 | 269.79 ± 5.91 | 0.93× | 0.99× | slower / overlap |
| `tiny-mixed-search` | c1 | 6.22 ± 0.19 | 6.00 ± 0.11 | 5.98 ± 0.16 | 1.04× | 1.00× | overlap / overlap |
| `tiny-mixed-search` | c2 | 3.95 ± 0.34 | 3.81 ± 0.09 | 3.71 ± 0.08 | 1.06× | 1.03× | overlap / overlap |
| `threshold-latin-below` | interpreter | 2,657.64 ± 439.69 | 2,554.34 ± 151.81 | 2,719.80 ± 420.03 | 0.98× | 0.94× | overlap / overlap |
| `threshold-latin-below` | c1 | 225.31 ± 3.74 | 233.08 ± 29.49 | 227.06 ± 13.89 | 0.99× | 1.03× | overlap / overlap |
| `threshold-latin-below` | c2 | 45.75 ± 0.35 | 47.44 ± 1.10 | 47.22 ± 1.28 | 0.97× | 1.00× | overlap / overlap |
| `threshold-latin-at` | interpreter | 2,590.39 ± 258.12 | 2,863.47 ± 167.38 | 315.10 ± 6.33 | 8.22× | 9.09× | faster / faster |
| `threshold-latin-at` | c1 | 232.38 ± 8.92 | 234.16 ± 8.70 | 41.48 ± 3.04 | 5.60× | 5.64× | faster / faster |
| `threshold-latin-at` | c2 | 48.84 ± 3.03 | 47.96 ± 1.57 | 41.33 ± 6.04 | 1.18× | 1.16× | overlap / overlap |
| `threshold-latin-above` | interpreter | 2,559.72 ± 520.46 | 2,904.60 ± 346.15 | 311.16 ± 9.93 | 8.23× | 9.33× | faster / faster |
| `threshold-latin-above` | c1 | 229.92 ± 3.11 | 225.46 ± 7.05 | 42.31 ± 2.05 | 5.43× | 5.33× | faster / faster |
| `threshold-latin-above` | c2 | 47.00 ± 1.25 | 48.73 ± 2.44 | 40.82 ± 1.75 | 1.15× | 1.19× | faster / faster |
| `threshold-utf16-below` | interpreter | 4,822.01 ± 378.93 | 4,889.40 ± 156.63 | 4,839.47 ± 159.76 | 1.00× | 1.01× | overlap / overlap |
| `threshold-utf16-below` | c1 | 146.08 ± 2.86 | 84.25 ± 9.15 | 84.15 ± 10.15 | 1.74× | 1.00× | faster / overlap |
| `threshold-utf16-below` | c2 | 27.25 ± 0.84 | 26.15 ± 2.44 | 26.62 ± 3.80 | 1.02× | 0.98× | overlap / overlap |
| `threshold-utf16-at` | interpreter | 4,834.64 ± 182.40 | 5,024.80 ± 191.58 | 400.92 ± 19.82 | 12.06× | 12.53× | faster / faster |
| `threshold-utf16-at` | c1 | 150.05 ± 5.87 | 81.31 ± 4.11 | 54.30 ± 6.47 | 2.76× | 1.50× | faster / faster |
| `threshold-utf16-at` | c2 | 30.05 ± 1.58 | 28.56 ± 1.54 | 47.61 ± 1.39 | 0.63× | 0.60× | slower / slower |
| `threshold-utf16-above` | interpreter | 4,832.71 ± 208.98 | 5,022.09 ± 268.24 | 389.68 ± 8.06 | 12.40× | 12.89× | faster / faster |
| `threshold-utf16-above` | c1 | 149.50 ± 6.79 | 81.86 ± 6.72 | 52.05 ± 1.78 | 2.87× | 1.57× | faster / faster |
| `threshold-utf16-above` | c2 | 27.64 ± 1.78 | 26.78 ± 1.89 | 47.81 ± 1.56 | 0.58× | 0.56× | slower / slower |
| `early-latin` | interpreter | 256.68 ± 8.49 | 244.32 ± 10.61 | 241.97 ± 5.85 | 1.06× | 1.01× | faster / overlap |
| `early-latin` | c1 | 9.03 ± 0.15 | 9.23 ± 0.52 | 9.13 ± 0.29 | 0.99× | 1.01× | overlap / overlap |
| `early-latin` | c2 | 3.66 ± 0.23 | 3.74 ± 0.29 | 3.52 ± 0.15 | 1.04× | 1.06× | overlap / overlap |
| `early-utf16` | interpreter | 513.33 ± 29.18 | 519.45 ± 32.51 | 512.96 ± 29.24 | 1.00× | 1.01× | overlap / overlap |
| `early-utf16` | c1 | 10.42 ± 3.40 | 6.61 ± 0.10 | 6.59 ± 0.08 | 1.58× | 1.00× | faster / overlap |
| `early-utf16` | c2 | 4.27 ± 0.15 | 4.25 ± 0.05 | 4.32 ± 0.16 | 0.99× | 0.99× | overlap / overlap |
| `forward-latin` | interpreter | 29,911.02 ± 2,772.32 | 31,490.65 ± 4,227.85 | 431.31 ± 27.31 | 69.35× | 73.01× | faster / faster |
| `forward-latin` | c1 | 2,783.32 ± 168.56 | 2,460.07 ± 98.65 | 206.12 ± 12.32 | 13.50× | 11.93× | faster / faster |
| `forward-latin` | c2 | 385.37 ± 19.68 | 371.08 ± 6.11 | 384.47 ± 26.39 | 1.00× | 0.97× | overlap / overlap |
| `reverse-latin` | interpreter | 34,284.13 ± 1,663.66 | 39,243.98 ± 4,464.81 | 486.58 ± 5.45 | 70.46× | 80.65× | faster / faster |
| `reverse-latin` | c1 | 3,517.63 ± 108.64 | 3,560.73 ± 86.01 | 200.10 ± 2.45 | 17.58× | 17.79× | faster / faster |
| `reverse-latin` | c2 | 696.43 ± 29.98 | 683.36 ± 39.66 | 214.28 ± 11.28 | 3.25× | 3.19× | faster / faster |
| `reverse-latin-64` | interpreter | 37,137.11 ± 5,386.24 | 40,606.03 ± 3,797.01 | 465.77 ± 25.76 | 79.73× | 87.18× | faster / faster |
| `reverse-latin-64` | c1 | 3,572.30 ± 305.38 | 3,469.97 ± 138.64 | 216.44 ± 6.70 | 16.50× | 16.03× | faster / faster |
| `reverse-latin-64` | c2 | 675.85 ± 10.85 | 669.76 ± 20.32 | 223.69 ± 14.12 | 3.02× | 2.99× | faster / faster |
| `forward-utf16` | interpreter | 141,784.06 ± 5,041.73 | 142,691.92 ± 4,194.68 | 739.20 ± 20.74 | 191.81× | 193.04× | faster / faster |
| `forward-utf16` | c1 | 1,946.83 ± 107.00 | 2,446.72 ± 129.07 | 379.70 ± 10.65 | 5.13× | 6.44× | faster / faster |
| `forward-utf16` | c2 | 739.64 ± 14.26 | 746.62 ± 32.75 | 747.20 ± 26.77 | 0.99× | 1.00× | overlap / overlap |
| `mixed-forward-64` | interpreter | 144,923.19 ± 8,726.47 | 151,691.72 ± 9,475.75 | 672.08 ± 12.70 | 215.63× | 225.71× | faster / faster |
| `mixed-forward-64` | c1 | 1,912.18 ± 110.33 | 1,917.55 ± 153.38 | 433.85 ± 35.46 | 4.41× | 4.42× | faster / faster |
| `mixed-forward-64` | c2 | 745.88 ± 23.94 | 752.09 ± 25.93 | 727.83 ± 16.02 | 1.02× | 1.03× | overlap / overlap |
| `mixed-reverse-64` | interpreter | 151,933.46 ± 17,942.06 | 154,489.64 ± 5,400.48 | 731.61 ± 16.65 | 207.67× | 211.16× | faster / faster |
| `mixed-reverse-64` | c1 | 4,781.80 ± 416.04 | 3,548.70 ± 61.26 | 486.62 ± 20.58 | 9.83× | 7.29× | faster / faster |
| `mixed-reverse-64` | c2 | 679.66 ± 19.45 | 667.17 ± 10.58 | 476.96 ± 9.92 | 1.42× | 1.40× | faster / faster |
| `mixed-forward-65` | interpreter | 162,412.18 ± 38,759.00 | 148,109.99 ± 4,200.22 | 148,441.22 ± 9,611.95 | 1.09× | 1.00× | overlap / overlap |
| `mixed-forward-65` | c1 | 1,854.82 ± 72.17 | 1,993.27 ± 127.43 | 1,859.66 ± 27.50 | 1.00× | 1.07× | overlap / overlap |
| `mixed-forward-65` | c2 | 725.37 ± 7.89 | 725.58 ± 10.92 | 727.07 ± 11.42 | 1.00× | 1.00× | overlap / overlap |
| `mixed-reverse-65` | interpreter | 147,517.88 ± 8,466.31 | 159,105.78 ± 14,133.55 | 154,313.74 ± 8,488.18 | 0.96× | 1.03× | overlap / overlap |
| `mixed-reverse-65` | c1 | 4,696.60 ± 121.98 | 3,494.16 ± 47.39 | 2,812.42 ± 535.32 | 1.67× | 1.24× | faster / faster |
| `mixed-reverse-65` | c2 | 672.69 ± 35.76 | 667.56 ± 21.91 | 671.27 ± 21.02 | 1.00× | 0.99× | overlap / overlap |
| `mixed-reverse-4` | interpreter | 145,141.82 ± 4,405.69 | 160,966.47 ± 8,565.91 | 755.85 ± 20.61 | 192.03× | 212.96× | faster / faster |
| `mixed-reverse-4` | c1 | 4,777.33 ± 128.22 | 3,558.13 ± 162.50 | 437.40 ± 11.21 | 10.92× | 8.13× | faster / faster |
| `mixed-reverse-4` | c2 | 670.92 ± 6.07 | 692.28 ± 37.97 | 437.94 ± 6.37 | 1.53× | 1.58× | faster / faster |
| `equal-latin-short` | interpreter | 471.44 ± 10.10 | 498.60 ± 20.76 | 119.60 ± 2.70 | 3.94× | 4.17× | faster / faster |
| `equal-latin-short` | c1 | 31.17 ± 0.87 | 30.67 ± 0.57 | 10.37 ± 0.44 | 3.00× | 2.96× | faster / faster |
| `equal-latin-short` | c2 | 2.34 ± 0.09 | 2.32 ± 0.04 | 2.31 ± 0.08 | 1.01× | 1.00× | overlap / overlap |
| `equal-latin-tiny` | interpreter | 174.15 ± 15.81 | 183.88 ± 5.03 | 117.41 ± 2.46 | 1.48× | 1.57× | faster / faster |
| `equal-latin-tiny` | c1 | 8.44 ± 0.23 | 8.96 ± 0.28 | 5.56 ± 0.30 | 1.52× | 1.61× | faster / faster |
| `equal-latin-tiny` | c2 | 2.88 ± 0.17 | 2.98 ± 0.13 | 3.05 ± 0.27 | 0.95× | 0.98× | overlap / overlap |
| `equal-utf16-tiny` | interpreter | 217.87 ± 11.00 | 228.93 ± 10.10 | 118.30 ± 3.88 | 1.84× | 1.94× | faster / faster |
| `equal-utf16-tiny` | c1 | 12.31 ± 0.59 | 12.22 ± 0.38 | 5.57 ± 0.12 | 2.21× | 2.20× | faster / faster |
| `equal-utf16-tiny` | c2 | 2.94 ± 0.09 | 3.03 ± 0.08 | 2.96 ± 0.11 | 0.99× | 1.02× | overlap / overlap |
| `equal-latin-word` | interpreter | 209.41 ± 5.80 | 230.94 ± 8.66 | 120.65 ± 8.03 | 1.74× | 1.91× | faster / faster |
| `equal-latin-word` | c1 | 12.51 ± 0.65 | 12.62 ± 0.46 | 5.59 ± 0.25 | 2.24× | 2.26× | faster / faster |
| `equal-latin-word` | c2 | 2.88 ± 0.11 | 2.92 ± 0.07 | 2.99 ± 0.12 | 0.96× | 0.98× | overlap / overlap |
| `equal-latin-word-above` | interpreter | 224.39 ± 9.43 | 236.92 ± 8.66 | 119.76 ± 5.20 | 1.87× | 1.98× | faster / faster |
| `equal-latin-word-above` | c1 | 12.30 ± 0.07 | 12.80 ± 0.65 | 10.41 ± 0.57 | 1.18× | 1.23× | faster / faster |
| `equal-latin-word-above` | c2 | 3.17 ± 0.06 | 3.14 ± 0.05 | 3.21 ± 0.09 | 0.99× | 0.98× | overlap / overlap |
| `equal-latin-below` | interpreter | 3,028.79 ± 287.71 | 2,908.64 ± 129.54 | 119.78 ± 4.58 | 25.29× | 24.28× | faster / faster |
| `equal-latin-below` | c1 | 209.30 ± 3.78 | 215.65 ± 6.10 | 13.86 ± 0.29 | 15.10× | 15.55× | faster / faster |
| `equal-latin-below` | c2 | 6.37 ± 0.23 | 5.80 ± 0.05 | 6.20 ± 0.61 | 1.03× | 0.94× | overlap / overlap |
| `equal-latin-at` | interpreter | 3,024.46 ± 263.52 | 2,969.37 ± 142.07 | 123.08 ± 4.57 | 24.57× | 24.13× | faster / faster |
| `equal-latin-at` | c1 | 207.98 ± 2.63 | 209.84 ± 6.20 | 13.86 ± 0.85 | 15.00× | 15.13× | faster / faster |
| `equal-latin-at` | c2 | 7.04 ± 0.34 | 6.57 ± 0.31 | 7.37 ± 0.84 | 0.95× | 0.89× | overlap / overlap |
| `equal-latin-above` | interpreter | 2,967.00 ± 152.51 | 2,976.83 ± 133.72 | 122.48 ± 4.30 | 24.22× | 24.30× | faster / faster |
| `equal-latin-above` | c1 | 214.70 ± 7.55 | 210.67 ± 5.62 | 14.03 ± 0.40 | 15.30× | 15.01× | faster / faster |
| `equal-latin-above` | c2 | 7.54 ± 0.63 | 7.61 ± 0.50 | 7.77 ± 0.66 | 0.97× | 0.98× | overlap / overlap |
| `equal-utf16-short` | interpreter | 842.28 ± 101.66 | 860.34 ± 44.44 | 121.16 ± 7.16 | 6.95× | 7.10× | faster / faster |
| `equal-utf16-short` | c1 | 59.22 ± 3.02 | 58.22 ± 1.41 | 10.55 ± 0.23 | 5.61× | 5.52× | faster / faster |
| `equal-utf16-short` | c2 | 2.93 ± 0.13 | 2.89 ± 0.07 | 2.89 ± 0.13 | 1.01× | 1.00× | overlap / overlap |
| `equal-utf16-below` | interpreter | 3,042.53 ± 267.77 | 2,943.91 ± 195.47 | 117.83 ± 1.20 | 25.82× | 24.98× | faster / faster |
| `equal-utf16-below` | c1 | 218.84 ± 12.32 | 217.63 ± 8.72 | 13.02 ± 0.55 | 16.81× | 16.72× | faster / faster |
| `equal-utf16-below` | c2 | 6.65 ± 0.23 | 6.46 ± 0.38 | 6.34 ± 0.43 | 1.05× | 1.02× | overlap / overlap |
| `equal-utf16-at` | interpreter | 3,114.29 ± 364.57 | 3,041.88 ± 120.48 | 121.06 ± 2.94 | 25.72× | 25.13× | faster / faster |
| `equal-utf16-at` | c1 | 214.91 ± 5.55 | 217.03 ± 7.39 | 13.37 ± 0.17 | 16.07× | 16.23× | faster / faster |
| `equal-utf16-at` | c2 | 7.19 ± 0.33 | 6.51 ± 0.07 | 6.43 ± 0.18 | 1.12× | 1.01× | faster / overlap |
| `equal-utf16-above` | interpreter | 3,046.17 ± 259.05 | 2,997.94 ± 129.48 | 123.77 ± 7.58 | 24.61× | 24.22× | faster / faster |
| `equal-utf16-above` | c1 | 211.39 ± 4.11 | 209.84 ± 4.59 | 13.90 ± 0.82 | 15.21× | 15.10× | faster / faster |
| `equal-utf16-above` | c2 | 7.38 ± 0.80 | 8.12 ± 0.45 | 7.80 ± 0.55 | 0.95× | 1.04× | overlap / overlap |
| `equal-latin-large` | interpreter | 44,543.82 ± 1,519.86 | 46,712.82 ± 3,367.13 | 182.28 ± 3.25 | 244.37× | 256.26× | faster / faster |
| `equal-latin-large` | c1 | 3,279.14 ± 41.67 | 3,248.53 ± 61.55 | 81.63 ± 1.72 | 40.17× | 39.79× | faster / faster |
| `equal-latin-large` | c2 | 51.19 ± 1.97 | 70.77 ± 1.32 | 71.01 ± 0.84 | 0.72× | 1.00× | slower / overlap |
| `equal-latin-first` | interpreter | 127.48 ± 7.90 | 142.15 ± 5.20 | 115.62 ± 5.56 | 1.10× | 1.23× | overlap / faster |
| `equal-latin-first` | c1 | 6.22 ± 0.41 | 6.72 ± 0.22 | 4.76 ± 0.20 | 1.31× | 1.41× | faster / faster |
| `equal-latin-first` | c2 | 2.15 ± 0.07 | 2.10 ± 0.08 | 2.14 ± 0.03 | 1.01× | 0.98× | overlap / overlap |
| `equal-latin-last` | interpreter | 44,826.03 ± 1,767.15 | 45,089.48 ± 1,048.22 | 182.57 ± 1.65 | 245.53× | 246.98× | faster / faster |
| `equal-latin-last` | c1 | 3,593.21 ± 119.24 | 3,615.97 ± 116.60 | 83.12 ± 2.73 | 43.23× | 43.50× | faster / faster |
| `equal-latin-last` | c2 | 60.65 ± 11.49 | 69.82 ± 1.74 | 62.14 ± 11.65 | 0.98× | 1.12× | overlap / overlap |
| `equal-utf16-large` | interpreter | 93,183.68 ± 8,461.32 | 92,363.07 ± 5,359.37 | 264.89 ± 8.73 | 351.78× | 348.68× | faster / faster |
| `equal-utf16-large` | c1 | 6,634.12 ± 583.50 | 6,533.86 ± 84.85 | 160.61 ± 14.46 | 41.31× | 40.68× | faster / faster |
| `equal-utf16-large` | c2 | 124.18 ± 28.60 | 121.03 ± 27.41 | 124.12 ± 27.00 | 1.00× | 0.98× | overlap / overlap |
| `equal-utf16-first` | interpreter | 127.15 ± 4.06 | 139.14 ± 1.97 | 118.09 ± 9.59 | 1.08× | 1.18× | overlap / faster |
| `equal-utf16-first` | c1 | 6.12 ± 0.27 | 6.51 ± 0.12 | 4.75 ± 0.29 | 1.29× | 1.37× | faster / faster |
| `equal-utf16-first` | c2 | 2.10 ± 0.08 | 2.17 ± 0.07 | 2.18 ± 0.13 | 0.97× | 1.00× | overlap / overlap |
| `equal-utf16-last` | interpreter | 91,082.82 ± 2,928.72 | 89,823.02 ± 4,442.17 | 274.76 ± 24.04 | 331.50× | 326.91× | faster / faster |
| `equal-utf16-last` | c1 | 6,971.16 ± 180.83 | 6,894.78 ± 176.51 | 167.56 ± 5.72 | 41.60× | 41.15× | faster / faster |
| `equal-utf16-last` | c2 | 143.70 ± 8.64 | 112.05 ± 5.49 | 129.30 ± 23.35 | 1.11× | 0.87× | overlap / overlap |
| `builder-latin` | interpreter | 31,052.83 ± 5,875.45 | 32,539.12 ± 2,491.33 | 605.56 ± 38.09 | 51.28× | 53.73× | faster / faster |
| `builder-latin` | c1 | 2,664.04 ± 162.73 | 2,445.32 ± 47.05 | 208.40 ± 8.15 | 12.78× | 11.73× | faster / faster |
| `builder-latin` | c2 | 384.81 ± 13.72 | 377.90 ± 8.15 | 375.56 ± 6.95 | 1.02× | 1.01× | overlap / overlap |
| `buffer-latin` | interpreter | 34,199.59 ± 3,653.48 | 32,857.64 ± 2,859.96 | 603.50 ± 28.04 | 56.67× | 54.44× | faster / faster |
| `buffer-latin` | c1 | 2,546.36 ± 15.52 | 2,356.46 ± 5.70 | 215.60 ± 28.60 | 11.81× | 10.93× | faster / faster |
| `buffer-latin` | c2 | 392.23 ± 25.38 | 385.66 ± 9.68 | 379.55 ± 18.73 | 1.03× | 1.02× | overlap / overlap |
| `character-latin` | interpreter | 36,865.64 ± 496.24 | 38,561.25 ± 3,255.32 | 352.00 ± 22.96 | 104.73× | 109.55× | faster / faster |
| `character-latin` | c1 | 2,568.28 ± 67.99 | 2,324.31 ± 71.14 | 93.76 ± 1.39 | 27.39× | 24.79× | faster / faster |
| `character-latin` | c2 | 1,005.83 ± 14.84 | 1,023.90 ± 35.33 | 77.81 ± 2.68 | 12.93× | 13.16× | faster / faster |
| `character-utf16` | interpreter | 152,335.99 ± 8,013.46 | 155,946.52 ± 4,677.09 | 637.24 ± 4.54 | 239.06× | 244.72× | faster / faster |
| `character-utf16` | c1 | 2,367.86 ± 65.66 | 1,813.66 ± 76.67 | 384.92 ± 6.51 | 6.15× | 4.71× | faster / faster |
| `character-utf16` | c2 | 105.12 ± 2.58 | 137.18 ± 37.07 | 105.43 ± 2.25 | 1.00× | 1.30× | overlap / overlap |

## serial

| Workload | Tier | Original Java | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| `long-end-64-small` | interpreter | 59,157.52 ± 2,585.77 | 59,398.05 ± 1,965.78 | 419.92 ± 26.38 | 140.88× | 141.45× | faster / faster |
| `long-end-64-small` | c1 | 946.56 ± 44.22 | 815.48 ± 22.89 | 162.23 ± 11.28 | 5.83× | 5.03× | faster / faster |
| `long-end-64-small` | c2 | 333.07 ± 19.33 | 330.24 ± 9.48 | 152.90 ± 7.33 | 2.18× | 2.16× | faster / faster |
| `long-end-64-large` | interpreter | 512,402.49 ± 37,173.22 | 525,583.47 ± 29,823.38 | 691.31 ± 39.15 | 741.20× | 760.27× | faster / faster |
| `long-end-64-large` | c1 | 8,262.87 ± 1,412.81 | 7,035.92 ± 206.32 | 450.32 ± 14.09 | 18.35× | 15.62× | faster / faster |
| `long-end-64-large` | c2 | 2,657.84 ± 85.19 | 2,670.52 ± 60.63 | 430.87 ± 6.78 | 6.17× | 6.20× | faster / faster |
| `long-start-64-large` | interpreter | 17,966,355.02 ± 1,557,803.78 | 17,131,675.90 ± 692,958.66 | 6,543.59 ± 299.76 | 2745.64× | 2618.08× | faster / faster |
| `long-start-64-large` | c1 | 209,893.86 ± 7,270.77 | 187,286.81 ± 10,112.35 | 6,524.26 ± 546.73 | 32.17× | 28.71× | faster / faster |
| `long-start-64-large` | c2 | 92,016.50 ± 31,415.92 | 92,732.06 ± 32,286.94 | 6,235.66 ± 281.45 | 14.76× | 14.87× | faster / faster |
| `long-end-256` | interpreter | 479,057.38 ± 31,864.14 | 483,544.15 ± 16,449.61 | 2,827.03 ± 150.01 | 169.46× | 171.04× | faster / faster |
| `long-end-256` | c1 | 7,689.72 ± 310.32 | 6,863.62 ± 760.93 | 2,373.66 ± 134.30 | 3.24× | 2.89× | faster / faster |
| `long-end-256` | c2 | 2,923.36 ± 86.12 | 3,006.06 ± 269.48 | 2,350.25 ± 105.49 | 1.24× | 1.28× | faster / faster |
| `long-overlap-129` | interpreter | 4,666,342.88 ± 340,588.87 | 4,486,513.87 ± 154,742.61 | 964.66 ± 62.07 | 4837.30× | 4650.88× | faster / faster |
| `long-overlap-129` | c1 | 59,589.48 ± 1,763.69 | 49,343.46 ± 2,953.96 | 694.05 ± 46.57 | 85.86× | 71.09× | faster / faster |
| `long-overlap-129` | c2 | 24,346.53 ± 1,121.64 | 24,678.59 ± 2,508.44 | 657.22 ± 11.00 | 37.04× | 37.55× | faster / faster |
| `long-overlap-latin-257` | interpreter | 1,734,750.62 ± 221,142.22 | 1,616,817.64 ± 184,547.28 | 1,113.90 ± 16.14 | 1557.36× | 1451.49× | faster / faster |
| `long-overlap-latin-257` | c1 | 154,798.05 ± 5,845.74 | 155,640.34 ± 5,843.59 | 841.24 ± 63.32 | 184.01× | 185.01× | faster / faster |
| `long-overlap-latin-257` | c2 | 43,996.40 ± 1,698.33 | 44,889.92 ± 2,040.95 | 880.86 ± 71.52 | 49.95× | 50.96× | faster / faster |
| `long-crossed-4` | interpreter | 145,148.47 ± 11,112.17 | 154,021.64 ± 8,273.76 | 656.15 ± 34.15 | 221.21× | 234.74× | faster / faster |
| `long-crossed-4` | c1 | 4,788.93 ± 187.24 | 2,586.28 ± 446.14 | 313.63 ± 14.76 | 15.27× | 8.25× | faster / faster |
| `long-crossed-4` | c2 | 688.22 ± 17.81 | 680.92 ± 23.28 | 308.95 ± 19.92 | 2.23× | 2.20× | faster / faster |
| `short-latin` | interpreter | 500.51 ± 93.33 | 457.84 ± 35.01 | 477.61 ± 46.06 | 1.05× | 0.96× | overlap / overlap |
| `short-latin` | c1 | 23.48 ± 3.75 | 22.17 ± 0.59 | 22.78 ± 1.04 | 1.03× | 0.97× | overlap / overlap |
| `short-latin` | c2 | 5.22 ± 0.64 | 4.79 ± 0.26 | 4.66 ± 0.24 | 1.12× | 1.03× | overlap / overlap |
| `threshold-latin-at` | interpreter | 2,616.84 ± 163.07 | 2,715.03 ± 100.93 | 402.59 ± 13.03 | 6.50× | 6.74× | faster / faster |
| `threshold-latin-at` | c1 | 229.99 ± 7.94 | 232.97 ± 8.67 | 128.01 ± 5.23 | 1.80× | 1.82× | faster / faster |
| `threshold-latin-at` | c2 | 49.23 ± 2.42 | 51.52 ± 3.59 | 133.21 ± 10.45 | 0.37× | 0.39× | slower / slower |
| `threshold-utf16-at` | interpreter | 4,997.23 ± 270.80 | 5,166.61 ± 256.58 | 638.36 ± 17.15 | 7.83× | 8.09× | faster / faster |
| `threshold-utf16-at` | c1 | 153.14 ± 8.38 | 88.94 ± 17.33 | 284.40 ± 7.79 | 0.54× | 0.31× | slower / slower |
| `threshold-utf16-at` | c2 | 28.50 ± 0.92 | 30.48 ± 1.65 | 286.74 ± 9.34 | 0.10× | 0.11× | slower / slower |
| `reverse-latin` | interpreter | 33,443.70 ± 1,380.70 | 41,007.77 ± 2,844.63 | 2,075.75 ± 36.17 | 16.11× | 19.76× | faster / faster |
| `reverse-latin` | c1 | 3,571.62 ± 229.91 | 3,663.09 ± 169.20 | 1,801.63 ± 43.82 | 1.98× | 2.03× | faster / faster |
| `reverse-latin` | c2 | 686.48 ± 25.79 | 684.51 ± 10.62 | 1,888.55 ± 199.62 | 0.36× | 0.36× | slower / slower |
| `mixed-reverse-64` | interpreter | 149,226.84 ± 9,277.76 | 153,784.31 ± 14,186.48 | 586.05 ± 26.45 | 254.63× | 262.41× | faster / faster |
| `mixed-reverse-64` | c1 | 4,599.84 ± 370.77 | 3,586.61 ± 194.10 | 343.99 ± 5.21 | 13.37× | 10.43× | faster / faster |
| `mixed-reverse-64` | c2 | 687.51 ± 58.79 | 696.40 ± 45.60 | 332.87 ± 13.17 | 2.07× | 2.09× | faster / faster |
| `mixed-reverse-65` | interpreter | 145,833.35 ± 7,280.09 | 155,484.38 ± 18,328.76 | 150,750.22 ± 13,971.65 | 0.97× | 1.03× | overlap / overlap |
| `mixed-reverse-65` | c1 | 4,627.19 ± 96.83 | 3,470.95 ± 185.61 | 2,740.36 ± 481.27 | 1.69× | 1.27× | faster / faster |
| `mixed-reverse-65` | c2 | 679.68 ± 18.60 | 672.61 ± 16.79 | 695.75 ± 52.50 | 0.98× | 0.97× | overlap / overlap |
| `equal-latin-short` | interpreter | 567.50 ± 28.72 | 578.06 ± 26.23 | 127.42 ± 2.39 | 4.45× | 4.54× | faster / faster |
| `equal-latin-short` | c1 | 31.65 ± 0.83 | 30.93 ± 1.42 | 21.93 ± 0.61 | 1.44× | 1.41× | faster / faster |
| `equal-latin-short` | c2 | 2.80 ± 0.05 | 2.74 ± 0.14 | 2.71 ± 0.06 | 1.03× | 1.01× | overlap / overlap |
| `equal-latin-large` | interpreter | 53,061.40 ± 2,959.29 | 51,698.71 ± 1,815.54 | 201.32 ± 7.71 | 263.56× | 256.79× | faster / faster |
| `equal-latin-large` | c1 | 3,278.62 ± 43.06 | 3,271.96 ± 71.83 | 669.22 ± 910.46 | 4.90× | 4.89× | faster / faster |
| `equal-latin-large` | c2 | 111.50 ± 12.81 | 104.86 ± 3.82 | 101.24 ± 3.31 | 1.10× | 1.04× | overlap / overlap |
| `equal-utf16-large` | interpreter | 101,544.54 ± 8,275.83 | 103,414.09 ± 5,859.79 | 1,438.61 ± 1,828.76 | 70.59× | 71.88× | faster / faster |
| `equal-utf16-large` | c1 | 6,539.25 ± 436.88 | 6,513.57 ± 101.86 | 2,421.61 ± 135.62 | 2.70× | 2.69× | faster / faster |
| `equal-utf16-large` | c2 | 231.10 ± 10.23 | 223.94 ± 5.68 | 219.06 ± 20.35 | 1.05× | 1.02× | overlap / overlap |

## avx512

| Workload | Tier | Original Java | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| `long-end-64-small` | interpreter | 56,105.16 ± 2,290.79 | 56,783.70 ± 2,853.26 | 311.83 ± 5.41 | 179.92× | 182.10× | faster / faster |
| `long-end-64-small` | c1 | 945.37 ± 63.62 | 825.90 ± 23.85 | 68.58 ± 1.95 | 13.79× | 12.04× | faster / faster |
| `long-end-64-small` | c2 | 294.64 ± 10.81 | 327.35 ± 12.94 | 64.51 ± 1.69 | 4.57× | 5.07× | faster / faster |
| `long-end-64-large` | interpreter | 476,940.15 ± 13,056.52 | 483,633.63 ± 19,370.12 | 586.54 ± 14.35 | 813.15× | 824.56× | faster / faster |
| `long-end-64-large` | c1 | 7,336.66 ± 240.93 | 7,204.51 ± 346.69 | 346.63 ± 14.16 | 21.17× | 20.78× | faster / faster |
| `long-end-64-large` | c2 | 2,471.22 ± 114.15 | 2,428.39 ± 83.80 | 342.68 ± 9.25 | 7.21× | 7.09× | faster / faster |
| `long-start-64-large` | interpreter | 18,222,943.72 ± 2,818,596.19 | 16,800,324.57 ± 742,225.77 | 6,633.85 ± 256.38 | 2746.96× | 2532.51× | faster / faster |
| `long-start-64-large` | c1 | 215,850.70 ± 10,239.19 | 190,977.23 ± 7,712.96 | 6,229.08 ± 136.98 | 34.65× | 30.66× | faster / faster |
| `long-start-64-large` | c2 | 73,374.48 ± 22,967.06 | 72,865.72 ± 17,888.27 | 6,131.93 ± 114.73 | 11.97× | 11.88× | faster / faster |
| `long-end-256` | interpreter | 459,812.47 ± 8,468.59 | 471,922.01 ± 18,621.09 | 872.25 ± 32.84 | 527.16× | 541.04× | faster / faster |
| `long-end-256` | c1 | 7,659.29 ± 676.89 | 7,080.24 ± 434.16 | 365.50 ± 8.06 | 20.96× | 19.37× | faster / faster |
| `long-end-256` | c2 | 2,738.24 ± 104.60 | 2,648.55 ± 66.20 | 378.83 ± 10.36 | 7.23× | 6.99× | faster / faster |
| `long-overlap-129` | interpreter | 4,392,315.90 ± 230,989.55 | 4,431,329.93 ± 133,606.02 | 294.65 ± 11.28 | 14906.89× | 15039.30× | faster / faster |
| `long-overlap-129` | c1 | 58,450.91 ± 2,043.90 | 51,194.90 ± 2,927.91 | 48.96 ± 2.65 | 1193.79× | 1045.59× | faster / faster |
| `long-overlap-129` | c2 | 21,166.14 ± 1,641.16 | 19,536.82 ± 470.65 | 54.30 ± 2.29 | 389.78× | 359.77× | faster / faster |
| `long-overlap-latin-257` | interpreter | 1,594,051.53 ± 141,567.11 | 1,831,790.07 ± 161,756.75 | 321.85 ± 16.63 | 4952.71× | 5691.37× | faster / faster |
| `long-overlap-latin-257` | c1 | 166,411.58 ± 17,225.48 | 157,829.18 ± 5,157.08 | 75.60 ± 3.04 | 2201.22× | 2087.69× | faster / faster |
| `long-overlap-latin-257` | c2 | 37,018.74 ± 878.06 | 36,684.63 ± 842.48 | 73.75 ± 2.50 | 501.96× | 497.43× | faster / faster |
| `long-crossed-4` | interpreter | 142,090.40 ± 5,553.32 | 148,124.44 ± 5,255.71 | 642.60 ± 23.67 | 221.12× | 230.51× | faster / faster |
| `long-crossed-4` | c1 | 4,678.73 ± 99.29 | 2,612.75 ± 364.27 | 299.83 ± 6.21 | 15.60× | 8.71× | faster / faster |
| `long-crossed-4` | c2 | 674.66 ± 17.50 | 677.22 ± 16.80 | 296.08 ± 8.55 | 2.28× | 2.29× | faster / faster |
| `short-latin` | interpreter | 477.34 ± 39.53 | 493.60 ± 42.95 | 505.37 ± 32.68 | 0.94× | 0.98× | overlap / overlap |
| `short-latin` | c1 | 22.09 ± 0.43 | 22.19 ± 0.24 | 22.80 ± 0.66 | 0.97× | 0.97× | overlap / overlap |
| `short-latin` | c2 | 4.62 ± 0.23 | 4.49 ± 0.15 | 4.58 ± 0.08 | 1.01× | 0.98× | overlap / overlap |
| `threshold-latin-at` | interpreter | 2,556.95 ± 227.01 | 2,870.20 ± 224.97 | 293.04 ± 7.80 | 8.73× | 9.79× | faster / faster |
| `threshold-latin-at` | c1 | 235.80 ± 10.37 | 229.94 ± 7.30 | 16.27 ± 0.33 | 14.50× | 14.14× | faster / faster |
| `threshold-latin-at` | c2 | 48.19 ± 1.46 | 46.62 ± 0.76 | 15.36 ± 0.31 | 3.14× | 3.04× | faster / faster |
| `threshold-utf16-at` | interpreter | 4,807.83 ± 280.09 | 4,980.39 ± 258.05 | 375.65 ± 21.07 | 12.80× | 13.26× | faster / faster |
| `threshold-utf16-at` | c1 | 150.41 ± 3.26 | 85.34 ± 9.10 | 17.76 ± 0.64 | 8.47× | 4.81× | faster / faster |
| `threshold-utf16-at` | c2 | 29.70 ± 0.80 | 27.83 ± 1.49 | 15.25 ± 0.89 | 1.95× | 1.82× | faster / faster |
| `reverse-latin` | interpreter | 34,790.97 ± 3,452.72 | 42,048.44 ± 3,715.99 | 409.00 ± 21.01 | 85.06× | 102.81× | faster / faster |
| `reverse-latin` | c1 | 3,467.46 ± 26.66 | 3,586.52 ± 77.95 | 137.91 ± 20.29 | 25.14× | 26.01× | faster / faster |
| `reverse-latin` | c2 | 676.04 ± 15.63 | 683.33 ± 33.09 | 130.17 ± 18.92 | 5.19× | 5.25× | faster / faster |
| `mixed-reverse-64` | interpreter | 146,127.41 ± 15,014.73 | 150,592.70 ± 8,677.78 | 511.80 ± 36.81 | 285.52× | 294.24× | faster / faster |
| `mixed-reverse-64` | c1 | 4,674.48 ± 106.10 | 3,507.77 ± 67.99 | 239.65 ± 3.67 | 19.51× | 14.64× | faster / faster |
| `mixed-reverse-64` | c2 | 680.94 ± 29.07 | 672.22 ± 26.86 | 264.11 ± 34.95 | 2.58× | 2.55× | faster / faster |
| `mixed-reverse-65` | interpreter | 144,572.27 ± 7,673.68 | 161,422.58 ± 14,419.86 | 152,842.66 ± 6,531.68 | 0.95× | 1.06× | overlap / overlap |
| `mixed-reverse-65` | c1 | 4,927.86 ± 147.92 | 3,514.72 ± 58.75 | 3,101.77 ± 512.33 | 1.59× | 1.13× | faster / overlap |
| `mixed-reverse-65` | c2 | 650.19 ± 17.29 | 674.85 ± 14.76 | 693.07 ± 107.31 | 0.94× | 0.97× | overlap / overlap |
| `equal-latin-short` | interpreter | 493.56 ± 47.56 | 494.53 ± 12.14 | 123.71 ± 5.26 | 3.99× | 4.00× | faster / faster |
| `equal-latin-short` | c1 | 31.38 ± 0.67 | 32.06 ± 2.37 | 10.49 ± 0.31 | 2.99× | 3.05× | faster / faster |
| `equal-latin-short` | c2 | 2.40 ± 0.19 | 2.46 ± 0.09 | 2.40 ± 0.16 | 1.00× | 1.03× | overlap / overlap |
| `equal-latin-large` | interpreter | 44,553.81 ± 1,481.75 | 46,032.38 ± 2,352.09 | 195.86 ± 9.45 | 227.47× | 235.02× | faster / faster |
| `equal-latin-large` | c1 | 3,466.66 ± 148.54 | 3,278.83 ± 99.01 | 68.74 ± 6.42 | 50.43× | 47.70× | faster / faster |
| `equal-latin-large` | c2 | 61.99 ± 15.62 | 72.09 ± 1.62 | 64.39 ± 14.46 | 0.96× | 1.12× | overlap / overlap |
| `equal-utf16-large` | interpreter | 89,595.94 ± 3,184.31 | 92,227.51 ± 11,175.56 | 252.48 ± 10.28 | 354.87× | 365.29× | faster / faster |
| `equal-utf16-large` | c1 | 6,692.34 ± 421.90 | 6,641.45 ± 369.92 | 126.92 ± 13.85 | 52.73× | 52.33× | faster / faster |
| `equal-utf16-large` | c2 | 136.59 ± 5.82 | 137.54 ± 7.10 | 124.26 ± 30.70 | 1.10× | 1.11× | overlap / overlap |
