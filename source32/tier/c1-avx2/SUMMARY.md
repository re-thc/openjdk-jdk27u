# c1-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 11.50 | 11.15 | 11.84 | 1.049 | 0.867..1.061 | 1.025 |
| isBlank | gateAt | 5 | 273.93 | 49.87 | 261.30 | 5.450 | 5.299..6.302 | 5.188 |
| isBlank | longBlank | 5 | 4532.21 | 167.45 | 5082.50 | 27.066 | 23.675..37.985 | 30.352 |
| isBlank | longBoth | 5 | 4571.60 | 168.41 | 5040.31 | 27.246 | 24.007..31.280 | 29.570 |
| isBlank | longClean | 5 | 5.56 | 5.28 | 5.08 | 1.067 | 0.926..1.131 | 0.975 |
| isBlank | probeAfter | 5 | 34.82 | 42.18 | 35.31 | 0.854 | 0.718..1.134 | 0.808 |
| isBlank | probeAt | 5 | 32.51 | 41.69 | 33.62 | 0.777 | 0.679..0.950 | 0.813 |
| isBlank | shortBlank | 5 | 20.57 | 23.34 | 21.50 | 0.820 | 0.764..0.971 | 0.919 |
| isBlank | shortClean | 5 | 5.53 | 5.35 | 5.16 | 1.043 | 0.796..1.134 | 0.978 |
| isBlank | tailProbeAfter | 5 | 5.08 | 5.34 | 5.35 | 0.951 | 0.845..1.069 | 1.003 |
| isBlank | tailProbeAt | 5 | 5.28 | 5.31 | 5.23 | 1.031 | 0.916..1.111 | 1.012 |
| linesCount | dense | 5 | 15969.25 | 17243.17 | 16906.11 | 0.930 | 0.646..1.004 | 0.903 |
| linesCount | gateAt | 5 | 280.53 | 94.85 | 278.02 | 2.989 | 2.336..3.219 | 2.851 |
| linesCount | immediate | 5 | 3874.05 | 903.53 | 3870.89 | 4.343 | 3.445..4.530 | 4.151 |
| linesCount | lines128 | 5 | 31985.73 | 16514.38 | 33215.16 | 1.937 | 1.599..2.331 | 2.047 |
| linesCount | lines16 | 5 | 7787.98 | 8243.64 | 7607.67 | 1.003 | 0.834..1.218 | 0.962 |
| linesCount | lines80 | 5 | 21130.47 | 13548.69 | 21191.73 | 1.542 | 1.028..1.655 | 1.491 |
| linesCount | longLines | 5 | 16694.71 | 3763.40 | 17759.23 | 4.773 | 4.231..4.842 | 4.719 |
| linesCount | noMatch | 5 | 3514.59 | 626.46 | 3675.33 | 5.759 | 4.847..6.422 | 5.647 |
| linesCount | probeAfter | 5 | 4185.22 | 961.94 | 4071.63 | 4.245 | 3.669..4.708 | 4.233 |
| linesCount | probeAt | 5 | 3898.98 | 959.86 | 4074.21 | 4.046 | 3.820..4.648 | 4.307 |
| linesCount | short | 5 | 90.83 | 95.82 | 90.26 | 0.960 | 0.737..0.993 | 0.920 |
| linesFirst | dense | 5 | 71.43 | 85.22 | 75.87 | 0.817 | 0.774..1.039 | 0.919 |
| linesFirst | gateAt | 5 | 307.89 | 121.90 | 300.40 | 2.581 | 2.319..2.778 | 2.519 |
| linesFirst | immediate | 5 | 62.72 | 65.97 | 64.43 | 0.929 | 0.672..1.114 | 0.951 |
| linesFirst | lines128 | 5 | 169.47 | 123.49 | 179.81 | 1.358 | 1.117..1.595 | 1.441 |
| linesFirst | lines16 | 5 | 87.28 | 91.44 | 87.84 | 0.963 | 0.894..1.056 | 0.940 |
| linesFirst | lines80 | 5 | 133.68 | 114.22 | 140.60 | 1.171 | 1.128..1.439 | 1.212 |
| linesFirst | longLines | 5 | 3899.55 | 1021.56 | 4275.49 | 3.840 | 3.473..4.435 | 4.333 |
| linesFirst | noMatch | 5 | 3689.53 | 670.53 | 3609.41 | 5.349 | 4.229..6.548 | 5.489 |
| linesFirst | probeAfter | 5 | 108.07 | 115.25 | 99.29 | 0.923 | 0.780..1.593 | 0.862 |
| linesFirst | probeAt | 5 | 101.59 | 113.57 | 104.96 | 0.856 | 0.806..1.819 | 0.893 |
| linesFirst | short | 5 | 73.90 | 81.86 | 80.15 | 0.943 | 0.726..0.989 | 0.883 |
| strip | early | 5 | 3934.00 | 185.00 | 3887.19 | 21.058 | 19.761..23.647 | 20.317 |
| strip | gateAt | 5 | 273.88 | 52.36 | 262.57 | 5.160 | 4.932..5.849 | 5.020 |
| strip | longBlank | 5 | 4591.44 | 167.44 | 4968.94 | 27.421 | 23.353..29.314 | 29.518 |
| strip | longBoth | 5 | 10346.54 | 366.19 | 10378.82 | 29.046 | 25.283..33.003 | 28.327 |
| strip | longClean | 5 | 10.77 | 11.03 | 10.92 | 0.985 | 0.860..1.123 | 0.958 |
| strip | probeAfter | 5 | 763.60 | 812.58 | 762.62 | 1.032 | 0.864..1.298 | 0.998 |
| strip | probeAt | 5 | 776.47 | 747.51 | 790.19 | 1.044 | 0.877..1.249 | 0.996 |
| strip | shortBlank | 5 | 23.43 | 24.69 | 24.15 | 0.921 | 0.892..1.094 | 0.978 |
| strip | shortClean | 5 | 10.80 | 10.67 | 10.60 | 1.001 | 0.962..1.506 | 0.997 |
| strip | tailProbeAfter | 5 | 803.55 | 895.70 | 742.39 | 1.031 | 0.822..1.246 | 0.842 |
| strip | tailProbeAt | 5 | 746.85 | 850.11 | 727.44 | 1.013 | 0.833..1.328 | 0.898 |
| stripLeading | early | 5 | 778.74 | 838.43 | 752.05 | 0.929 | 0.829..1.342 | 0.937 |
| stripLeading | gateAt | 5 | 268.46 | 49.34 | 264.09 | 5.403 | 5.153..6.104 | 5.373 |
| stripLeading | longBlank | 5 | 4598.92 | 159.96 | 5008.54 | 27.655 | 26.798..31.638 | 31.311 |
| stripLeading | longBoth | 5 | 5371.34 | 848.56 | 5623.39 | 6.266 | 5.537..7.658 | 6.435 |
| stripLeading | longClean | 5 | 5.93 | 5.72 | 6.29 | 1.037 | 0.945..1.130 | 1.099 |
| stripLeading | probeAfter | 5 | 757.47 | 734.16 | 778.67 | 1.016 | 0.875..1.238 | 1.083 |
| stripLeading | probeAt | 5 | 771.94 | 736.19 | 758.18 | 1.030 | 0.910..1.242 | 1.003 |
| stripLeading | shortBlank | 5 | 21.61 | 24.76 | 24.23 | 0.889 | 0.838..0.899 | 0.973 |
| stripLeading | shortClean | 5 | 6.26 | 5.79 | 5.74 | 1.025 | 0.984..1.146 | 0.998 |
| stripLeading | tailProbeAfter | 5 | 6.07 | 5.72 | 5.86 | 1.054 | 0.955..1.101 | 1.030 |
| stripLeading | tailProbeAt | 5 | 5.87 | 5.67 | 5.90 | 1.036 | 0.957..1.094 | 1.056 |
| stripTrailing | early | 5 | 3696.41 | 167.33 | 3891.98 | 22.556 | 19.572..22.935 | 23.987 |
| stripTrailing | gateAt | 5 | 261.70 | 49.75 | 353.52 | 5.346 | 4.975..6.177 | 7.322 |
| stripTrailing | longBlank | 5 | 5219.36 | 175.46 | 5338.51 | 28.382 | 26.780..37.235 | 30.756 |
| stripTrailing | longBoth | 5 | 5985.84 | 903.15 | 6094.66 | 6.418 | 6.321..7.683 | 7.073 |
| stripTrailing | longClean | 5 | 5.93 | 6.37 | 6.17 | 0.931 | 0.872..1.203 | 0.968 |
| stripTrailing | probeAfter | 5 | 5.87 | 6.08 | 6.16 | 0.951 | 0.885..1.007 | 1.007 |
| stripTrailing | probeAt | 5 | 5.75 | 6.06 | 6.37 | 0.949 | 0.931..1.091 | 1.034 |
| stripTrailing | shortBlank | 5 | 23.49 | 24.81 | 25.41 | 0.924 | 0.853..1.039 | 1.024 |
| stripTrailing | shortClean | 5 | 5.80 | 6.18 | 6.24 | 0.922 | 0.879..1.002 | 0.994 |
| stripTrailing | tailProbeAfter | 5 | 726.29 | 790.44 | 729.51 | 0.917 | 0.899..1.119 | 0.968 |
| stripTrailing | tailProbeAt | 5 | 767.64 | 782.42 | 756.75 | 0.967 | 0.887..1.328 | 0.970 |
| trim | early | 5 | 3103.04 | 191.56 | 3135.45 | 16.331 | 15.172..17.262 | 16.428 |
| trim | gateAt | 5 | 240.86 | 43.51 | 182.80 | 5.564 | 4.700..5.608 | 4.147 |
| trim | longBlank | 5 | 2912.03 | 148.47 | 2613.55 | 19.613 | 17.481..21.195 | 16.766 |
| trim | longBoth | 5 | 6587.29 | 321.91 | 5494.44 | 20.463 | 19.538..21.368 | 17.286 |
| trim | longClean | 5 | 6.67 | 5.44 | 5.10 | 1.227 | 1.029..1.488 | 0.950 |
| trim | probeAfter | 5 | 790.36 | 779.00 | 783.64 | 0.965 | 0.844..1.425 | 1.002 |
| trim | probeAt | 5 | 744.80 | 755.65 | 781.54 | 0.998 | 0.947..1.178 | 1.027 |
| trim | shortBlank | 5 | 15.78 | 18.80 | 18.71 | 0.847 | 0.757..0.937 | 0.981 |
| trim | shortClean | 5 | 6.38 | 5.86 | 5.31 | 1.117 | 0.988..1.262 | 0.920 |
| trim | tailProbeAfter | 5 | 758.16 | 732.76 | 744.32 | 1.088 | 0.910..1.209 | 1.021 |
| trim | tailProbeAt | 5 | 774.51 | 734.63 | 764.50 | 1.083 | 0.848..1.249 | 1.049 |

## Every measured paired loss

- isBlank/probeAt: 0.777x, paired candidate delta +9.34 ns/op.
- linesFirst/dense: 0.817x, paired candidate delta +15.63 ns/op.
- isBlank/shortBlank: 0.820x, paired candidate delta +4.25 ns/op.
- trim/shortBlank: 0.847x, paired candidate delta +2.97 ns/op.
- isBlank/probeAfter: 0.854x, paired candidate delta +6.17 ns/op.
- linesFirst/probeAt: 0.856x, paired candidate delta +16.30 ns/op.
- stripLeading/shortBlank: 0.889x, paired candidate delta +2.69 ns/op.
- stripTrailing/tailProbeAfter: 0.917x, paired candidate delta +65.66 ns/op.
- strip/shortBlank: 0.921x, paired candidate delta +2.01 ns/op.
- stripTrailing/shortClean: 0.922x, paired candidate delta +0.48 ns/op.
- linesFirst/probeAfter: 0.923x, paired candidate delta +9.05 ns/op.
- stripTrailing/shortBlank: 0.924x, paired candidate delta +1.88 ns/op.
- stripLeading/early: 0.929x, paired candidate delta +59.69 ns/op.
- linesFirst/immediate: 0.929x, paired candidate delta +4.53 ns/op.
- linesCount/dense: 0.930x, paired candidate delta +1210.84 ns/op.
- stripTrailing/longClean: 0.931x, paired candidate delta +0.44 ns/op.
- linesFirst/short: 0.943x, paired candidate delta +4.48 ns/op.
- stripTrailing/probeAt: 0.949x, paired candidate delta +0.31 ns/op.
- stripTrailing/probeAfter: 0.951x, paired candidate delta +0.30 ns/op.
- isBlank/tailProbeAfter: 0.951x, paired candidate delta +0.26 ns/op.
- linesCount/short: 0.960x, paired candidate delta +3.77 ns/op.
- linesFirst/lines16: 0.963x, paired candidate delta +3.38 ns/op.
- trim/probeAfter: 0.965x, paired candidate delta +27.15 ns/op.
- stripTrailing/tailProbeAt: 0.967x, paired candidate delta +24.35 ns/op.
- strip/longClean: 0.985x, paired candidate delta +0.16 ns/op.
- trim/probeAt: 0.998x, paired candidate delta +1.65 ns/op.
