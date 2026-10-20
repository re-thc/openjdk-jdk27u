# c2-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 1 | 6.29 | 4.58 | 3.44 | 1.373 | 1.373..1.373 | 0.750 |
| isBlank | gateAt | 1 | 99.04 | 20.69 | 220.39 | 4.786 | 4.786..4.786 | 10.650 |
| isBlank | longBlank | 1 | 2852.87 | 197.66 | 1891.18 | 14.433 | 14.433..14.433 | 9.568 |
| isBlank | longBoth | 1 | 2410.47 | 155.59 | 2108.79 | 15.492 | 15.492..15.492 | 13.554 |
| isBlank | longClean | 1 | 2.38 | 2.32 | 2.46 | 1.025 | 1.025..1.025 | 1.063 |
| isBlank | probeAfter | 1 | 5.47 | 18.16 | 5.30 | 0.301 | 0.301..0.301 | 0.292 |
| isBlank | probeAt | 1 | 6.00 | 17.01 | 4.21 | 0.353 | 0.353..0.353 | 0.248 |
| isBlank | shortBlank | 1 | 10.27 | 12.28 | 10.19 | 0.836 | 0.836..0.836 | 0.830 |
| isBlank | shortClean | 1 | 2.30 | 2.39 | 2.17 | 0.962 | 0.962..0.962 | 0.906 |
| isBlank | tailProbeAfter | 1 | 1.96 | 2.48 | 2.67 | 0.791 | 0.791..0.791 | 1.076 |
| isBlank | tailProbeAt | 1 | 2.20 | 2.48 | 2.66 | 0.886 | 0.886..0.886 | 1.073 |
| linesCount | dense | 1 | 15275.20 | 17009.22 | 11380.10 | 0.898 | 0.898..0.898 | 0.669 |
| linesCount | gateAt | 1 | 175.30 | 45.68 | 106.53 | 3.838 | 3.838..3.838 | 2.332 |
| linesCount | immediate | 1 | 2718.15 | 679.41 | 2522.63 | 4.001 | 4.001..4.001 | 3.713 |
| linesCount | lines128 | 1 | 19691.99 | 9560.99 | 16267.90 | 2.060 | 2.060..2.060 | 1.701 |
| linesCount | lines16 | 1 | 6896.71 | 7678.93 | 4459.01 | 0.898 | 0.898..0.898 | 0.581 |
| linesCount | lines80 | 1 | 16193.26 | 8079.66 | 9997.12 | 2.004 | 2.004..2.004 | 1.237 |
| linesCount | longLines | 1 | 9593.92 | 2265.45 | 7818.11 | 4.235 | 4.235..4.235 | 3.451 |
| linesCount | noMatch | 1 | 2266.03 | 605.34 | 1646.79 | 3.743 | 3.743..3.743 | 2.720 |
| linesCount | probeAfter | 1 | 2452.98 | 603.78 | 1946.64 | 4.063 | 4.063..4.063 | 3.224 |
| linesCount | probeAt | 1 | 2480.50 | 578.77 | 2820.46 | 4.286 | 4.286..4.286 | 4.873 |
| linesCount | short | 1 | 70.58 | 50.82 | 52.23 | 1.389 | 1.389..1.389 | 1.028 |
| linesFirst | dense | 1 | 57.83 | 48.92 | 45.32 | 1.182 | 1.182..1.182 | 0.926 |
| linesFirst | gateAt | 1 | 228.93 | 114.43 | 198.78 | 2.001 | 2.001..2.001 | 1.737 |
| linesFirst | immediate | 1 | 47.44 | 28.31 | 30.88 | 1.676 | 1.676..1.676 | 1.091 |
| linesFirst | lines128 | 1 | 94.60 | 63.19 | 87.65 | 1.497 | 1.497..1.497 | 1.387 |
| linesFirst | lines16 | 1 | 70.32 | 50.04 | 37.86 | 1.405 | 1.405..1.405 | 0.757 |
| linesFirst | lines80 | 1 | 94.60 | 57.90 | 76.84 | 1.634 | 1.634..1.634 | 1.327 |
| linesFirst | longLines | 1 | 2291.74 | 747.90 | 1758.78 | 3.064 | 3.064..3.064 | 2.352 |
| linesFirst | noMatch | 1 | 2184.86 | 792.21 | 1872.03 | 2.758 | 2.758..2.758 | 2.363 |
| linesFirst | probeAfter | 1 | 56.46 | 49.79 | 41.69 | 1.134 | 1.134..1.134 | 0.837 |
| linesFirst | probeAt | 1 | 52.42 | 45.19 | 54.86 | 1.160 | 1.160..1.160 | 1.214 |
| linesFirst | short | 1 | 43.62 | 33.33 | 32.97 | 1.309 | 1.309..1.309 | 0.989 |
| strip | early | 1 | 940.49 | 159.73 | 952.00 | 5.888 | 5.888..5.888 | 5.960 |
| strip | gateAt | 1 | 274.94 | 26.38 | 88.09 | 10.422 | 10.422..10.422 | 3.339 |
| strip | longBlank | 1 | 5814.92 | 153.10 | 2928.71 | 37.982 | 37.982..37.982 | 19.130 |
| strip | longBoth | 1 | 7088.35 | 310.16 | 4509.29 | 22.854 | 22.854..22.854 | 14.538 |
| strip | longClean | 1 | 3.11 | 6.11 | 3.69 | 0.509 | 0.509..0.509 | 0.605 |
| strip | probeAfter | 1 | 324.20 | 377.82 | 307.25 | 0.858 | 0.858..0.858 | 0.813 |
| strip | probeAt | 1 | 307.18 | 417.10 | 337.11 | 0.736 | 0.736..0.736 | 0.808 |
| strip | shortBlank | 1 | 12.63 | 17.29 | 11.43 | 0.731 | 0.731..0.731 | 0.661 |
| strip | shortClean | 1 | 2.78 | 3.02 | 3.95 | 0.921 | 0.921..0.921 | 1.307 |
| strip | tailProbeAfter | 1 | 314.53 | 366.68 | 358.51 | 0.858 | 0.858..0.858 | 0.978 |
| strip | tailProbeAt | 1 | 307.29 | 401.57 | 313.07 | 0.765 | 0.765..0.765 | 0.780 |
| stripLeading | early | 1 | 338.44 | 403.37 | 409.66 | 0.839 | 0.839..0.839 | 1.016 |
| stripLeading | gateAt | 1 | 153.33 | 20.68 | 136.56 | 7.413 | 7.413..7.413 | 6.603 |
| stripLeading | longBlank | 1 | 2418.61 | 184.83 | 3173.52 | 13.086 | 13.086..13.086 | 17.170 |
| stripLeading | longBoth | 1 | 2879.95 | 548.95 | 2510.23 | 5.246 | 5.246..5.246 | 4.573 |
| stripLeading | longClean | 1 | 2.32 | 2.21 | 5.60 | 1.046 | 1.046..1.046 | 2.529 |
| stripLeading | probeAfter | 1 | 336.93 | 393.58 | 393.53 | 0.856 | 0.856..0.856 | 1.000 |
| stripLeading | probeAt | 1 | 336.21 | 459.87 | 347.03 | 0.731 | 0.731..0.731 | 0.755 |
| stripLeading | shortBlank | 1 | 14.19 | 12.66 | 19.50 | 1.121 | 1.121..1.121 | 1.540 |
| stripLeading | shortClean | 1 | 2.96 | 2.08 | 3.44 | 1.423 | 1.423..1.423 | 1.651 |
| stripLeading | tailProbeAfter | 1 | 4.22 | 3.35 | 5.71 | 1.258 | 1.258..1.258 | 1.703 |
| stripLeading | tailProbeAt | 1 | 2.56 | 2.38 | 5.18 | 1.078 | 1.078..1.078 | 2.182 |
| stripTrailing | early | 1 | 1539.68 | 225.34 | 2299.31 | 6.833 | 6.833..6.833 | 10.204 |
| stripTrailing | gateAt | 1 | 103.84 | 35.64 | 194.98 | 2.913 | 2.913..2.913 | 5.470 |
| stripTrailing | longBlank | 1 | 2154.98 | 148.41 | 2660.74 | 14.521 | 14.521..14.521 | 17.929 |
| stripTrailing | longBoth | 1 | 2360.76 | 634.74 | 3192.92 | 3.719 | 3.719..3.719 | 5.030 |
| stripTrailing | longClean | 1 | 3.89 | 3.06 | 5.04 | 1.271 | 1.271..1.271 | 1.645 |
| stripTrailing | probeAfter | 1 | 2.21 | 4.73 | 3.50 | 0.467 | 0.467..0.467 | 0.739 |
| stripTrailing | probeAt | 1 | 2.22 | 4.47 | 4.19 | 0.497 | 0.497..0.497 | 0.938 |
| stripTrailing | shortBlank | 1 | 14.92 | 14.19 | 13.93 | 1.052 | 1.052..1.052 | 0.982 |
| stripTrailing | shortClean | 1 | 2.12 | 2.34 | 3.21 | 0.908 | 0.908..0.908 | 1.374 |
| stripTrailing | tailProbeAfter | 1 | 326.20 | 463.54 | 384.56 | 0.704 | 0.704..0.704 | 0.830 |
| stripTrailing | tailProbeAt | 1 | 338.80 | 453.11 | 388.61 | 0.748 | 0.748..0.748 | 0.858 |
| trim | early | 1 | 1253.95 | 174.38 | 3281.29 | 7.191 | 7.191..7.191 | 18.817 |
| trim | gateAt | 1 | 197.78 | 25.49 | 131.66 | 7.759 | 7.759..7.759 | 5.166 |
| trim | longBlank | 1 | 2799.74 | 136.87 | 2547.73 | 20.456 | 20.456..20.456 | 18.614 |
| trim | longBoth | 1 | 3326.96 | 319.39 | 5239.56 | 10.417 | 10.417..10.417 | 16.405 |
| trim | longClean | 1 | 2.37 | 7.55 | 9.93 | 0.314 | 0.314..0.314 | 1.315 |
| trim | probeAfter | 1 | 304.25 | 367.34 | 475.62 | 0.828 | 0.828..0.828 | 1.295 |
| trim | probeAt | 1 | 313.39 | 415.13 | 340.14 | 0.755 | 0.755..0.755 | 0.819 |
| trim | shortBlank | 1 | 10.92 | 10.33 | 14.26 | 1.058 | 1.058..1.058 | 1.381 |
| trim | shortClean | 1 | 1.99 | 2.99 | 4.02 | 0.666 | 0.666..0.666 | 1.347 |
| trim | tailProbeAfter | 1 | 355.05 | 318.40 | 389.58 | 1.115 | 1.115..1.115 | 1.224 |
| trim | tailProbeAt | 1 | 388.89 | 381.19 | 338.18 | 1.020 | 1.020..1.020 | 0.887 |

## Every measured paired loss

- isBlank/probeAfter: 0.301x, paired candidate delta +12.69 ns/op.
- trim/longClean: 0.314x, paired candidate delta +5.18 ns/op.
- isBlank/probeAt: 0.353x, paired candidate delta +11.01 ns/op.
- stripTrailing/probeAfter: 0.467x, paired candidate delta +2.52 ns/op.
- stripTrailing/probeAt: 0.497x, paired candidate delta +2.25 ns/op.
- strip/longClean: 0.509x, paired candidate delta +3.00 ns/op.
- trim/shortClean: 0.666x, paired candidate delta +1.00 ns/op.
- stripTrailing/tailProbeAfter: 0.704x, paired candidate delta +137.34 ns/op.
- strip/shortBlank: 0.731x, paired candidate delta +4.66 ns/op.
- stripLeading/probeAt: 0.731x, paired candidate delta +123.66 ns/op.
- strip/probeAt: 0.736x, paired candidate delta +109.92 ns/op.
- stripTrailing/tailProbeAt: 0.748x, paired candidate delta +114.31 ns/op.
- trim/probeAt: 0.755x, paired candidate delta +101.74 ns/op.
- strip/tailProbeAt: 0.765x, paired candidate delta +94.28 ns/op.
- isBlank/tailProbeAfter: 0.791x, paired candidate delta +0.52 ns/op.
- trim/probeAfter: 0.828x, paired candidate delta +63.09 ns/op.
- isBlank/shortBlank: 0.836x, paired candidate delta +2.01 ns/op.
- stripLeading/early: 0.839x, paired candidate delta +64.93 ns/op.
- stripLeading/probeAfter: 0.856x, paired candidate delta +56.65 ns/op.
- strip/tailProbeAfter: 0.858x, paired candidate delta +52.15 ns/op.
- strip/probeAfter: 0.858x, paired candidate delta +53.63 ns/op.
- isBlank/tailProbeAt: 0.886x, paired candidate delta +0.28 ns/op.
- linesCount/dense: 0.898x, paired candidate delta +1734.02 ns/op.
- linesCount/lines16: 0.898x, paired candidate delta +782.22 ns/op.
- stripTrailing/shortClean: 0.908x, paired candidate delta +0.21 ns/op.
- strip/shortClean: 0.921x, paired candidate delta +0.24 ns/op.
- isBlank/shortClean: 0.962x, paired candidate delta +0.09 ns/op.
