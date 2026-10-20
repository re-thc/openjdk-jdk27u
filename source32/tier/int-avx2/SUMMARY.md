# int-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 382.06 | 400.69 | 388.16 | 0.943 | 0.897..1.083 | 1.001 |
| isBlank | gateAt | 5 | 6801.97 | 1202.36 | 7029.60 | 5.685 | 5.397..5.929 | 5.719 |
| isBlank | longBlank | 5 | 191997.20 | 2100.12 | 197835.42 | 95.472 | 86.186..97.740 | 96.326 |
| isBlank | longBoth | 5 | 185059.60 | 2016.36 | 199707.78 | 98.345 | 84.840..107.096 | 100.546 |
| isBlank | longClean | 5 | 221.81 | 214.41 | 223.56 | 1.055 | 0.898..1.115 | 1.043 |
| isBlank | probeAfter | 5 | 988.70 | 1127.64 | 1012.73 | 0.875 | 0.834..0.947 | 0.884 |
| isBlank | probeAt | 5 | 999.86 | 1158.72 | 1022.79 | 0.857 | 0.811..0.925 | 0.883 |
| isBlank | shortBlank | 5 | 725.98 | 791.53 | 734.01 | 0.860 | 0.655..0.934 | 0.927 |
| isBlank | shortClean | 5 | 212.28 | 217.04 | 219.17 | 1.012 | 0.929..1.054 | 1.048 |
| isBlank | tailProbeAfter | 5 | 218.90 | 214.38 | 214.52 | 1.011 | 0.991..1.043 | 1.005 |
| isBlank | tailProbeAt | 5 | 210.27 | 214.88 | 223.34 | 0.959 | 0.939..1.042 | 0.994 |
| linesCount | dense | 5 | 347431.45 | 370052.34 | 366889.02 | 0.968 | 0.890..0.989 | 0.987 |
| linesCount | gateAt | 5 | 9848.85 | 3285.17 | 10369.44 | 2.966 | 2.783..3.214 | 3.158 |
| linesCount | immediate | 5 | 117233.26 | 4387.70 | 118499.64 | 27.643 | 21.512..29.054 | 26.665 |
| linesCount | lines128 | 5 | 966849.90 | 371445.01 | 1092970.97 | 2.547 | 2.426..3.022 | 3.015 |
| linesCount | lines16 | 5 | 215830.23 | 210802.61 | 217316.90 | 1.027 | 0.584..1.163 | 1.002 |
| linesCount | lines80 | 5 | 630531.52 | 385697.40 | 816017.20 | 1.619 | 1.560..1.849 | 2.091 |
| linesCount | longLines | 5 | 431921.61 | 11305.69 | 433401.82 | 39.092 | 35.395..43.230 | 39.218 |
| linesCount | noMatch | 5 | 124049.28 | 4561.22 | 108493.59 | 27.790 | 22.994..32.180 | 24.054 |
| linesCount | probeAfter | 5 | 109575.91 | 5865.06 | 120592.68 | 20.210 | 15.107..21.825 | 19.475 |
| linesCount | probeAt | 5 | 118845.12 | 5814.00 | 120943.85 | 20.781 | 18.851..23.837 | 22.244 |
| linesCount | short | 5 | 3243.74 | 3006.80 | 3122.21 | 1.035 | 0.961..1.518 | 1.043 |
| linesFirst | dense | 5 | 1979.93 | 1911.31 | 2124.58 | 1.055 | 0.902..1.708 | 1.074 |
| linesFirst | gateAt | 5 | 10748.06 | 3040.10 | 9990.05 | 3.574 | 2.951..3.881 | 3.322 |
| linesFirst | immediate | 5 | 1653.15 | 1600.07 | 1571.63 | 1.021 | 0.929..1.367 | 0.971 |
| linesFirst | lines128 | 5 | 5744.96 | 3122.72 | 6177.81 | 1.807 | 1.383..2.622 | 1.901 |
| linesFirst | lines16 | 5 | 2430.75 | 2405.68 | 2489.60 | 1.015 | 0.899..1.201 | 1.004 |
| linesFirst | lines80 | 5 | 4463.92 | 3222.35 | 4717.24 | 1.420 | 1.089..1.740 | 1.497 |
| linesFirst | longLines | 5 | 112184.43 | 3957.71 | 120793.70 | 28.395 | 25.656..34.559 | 27.907 |
| linesFirst | noMatch | 5 | 110212.34 | 3950.26 | 114356.18 | 28.420 | 23.676..32.397 | 27.545 |
| linesFirst | probeAfter | 5 | 3011.87 | 3235.05 | 3119.24 | 0.958 | 0.839..1.035 | 0.940 |
| linesFirst | probeAt | 5 | 2970.39 | 3384.49 | 2925.31 | 0.915 | 0.838..0.991 | 0.928 |
| linesFirst | short | 5 | 1923.36 | 2128.41 | 1930.02 | 0.962 | 0.901..1.007 | 0.970 |
| strip | early | 5 | 107568.95 | 1917.92 | 102401.32 | 57.095 | 55.070..66.831 | 53.576 |
| strip | gateAt | 5 | 6812.52 | 1124.75 | 7514.03 | 6.273 | 5.559..9.647 | 6.528 |
| strip | longBlank | 5 | 204129.69 | 2214.68 | 191512.56 | 95.503 | 84.537..128.782 | 84.727 |
| strip | longBoth | 5 | 411222.42 | 4500.55 | 431501.21 | 92.558 | 84.009..114.761 | 92.870 |
| strip | longClean | 5 | 303.15 | 305.44 | 301.94 | 0.978 | 0.959..1.053 | 0.974 |
| strip | probeAfter | 5 | 2043.84 | 2027.47 | 1913.48 | 1.007 | 0.866..1.534 | 0.945 |
| strip | probeAt | 5 | 2038.71 | 2185.81 | 2005.28 | 0.933 | 0.858..1.299 | 0.919 |
| strip | shortBlank | 5 | 732.51 | 688.63 | 695.14 | 1.058 | 0.952..1.080 | 0.997 |
| strip | shortClean | 5 | 302.73 | 298.61 | 293.05 | 1.023 | 0.986..1.066 | 0.999 |
| strip | tailProbeAfter | 5 | 2139.29 | 2253.59 | 2194.42 | 0.935 | 0.752..0.996 | 0.952 |
| strip | tailProbeAt | 5 | 2074.85 | 2283.19 | 2083.34 | 0.947 | 0.890..1.143 | 0.941 |
| stripLeading | early | 5 | 1079.33 | 1137.40 | 1128.00 | 1.020 | 0.916..1.129 | 1.013 |
| stripLeading | gateAt | 5 | 6716.47 | 1176.53 | 7436.63 | 5.838 | 5.670..6.910 | 6.459 |
| stripLeading | longBlank | 5 | 193416.63 | 2155.17 | 194773.02 | 91.371 | 87.224..105.389 | 95.134 |
| stripLeading | longBoth | 5 | 192804.64 | 2984.81 | 197541.56 | 63.479 | 58.400..88.001 | 67.989 |
| stripLeading | longClean | 5 | 199.49 | 185.46 | 195.77 | 1.067 | 0.725..1.120 | 1.040 |
| stripLeading | probeAfter | 5 | 1852.28 | 1926.73 | 1816.25 | 0.920 | 0.885..1.086 | 0.955 |
| stripLeading | probeAt | 5 | 1923.94 | 2020.19 | 1875.91 | 0.924 | 0.842..1.124 | 0.946 |
| stripLeading | shortBlank | 5 | 708.36 | 703.20 | 724.25 | 1.022 | 0.953..1.289 | 1.030 |
| stripLeading | shortClean | 5 | 196.23 | 190.11 | 187.55 | 1.073 | 0.984..1.314 | 0.987 |
| stripLeading | tailProbeAfter | 5 | 193.29 | 185.80 | 199.61 | 1.006 | 0.854..1.112 | 1.032 |
| stripLeading | tailProbeAt | 5 | 198.02 | 184.58 | 190.24 | 1.073 | 0.983..1.243 | 1.024 |
| stripTrailing | early | 5 | 104518.92 | 1686.34 | 106071.79 | 59.061 | 55.774..86.643 | 64.517 |
| stripTrailing | gateAt | 5 | 7274.80 | 1258.37 | 7528.61 | 5.628 | 5.365..6.556 | 6.245 |
| stripTrailing | longBlank | 5 | 192765.60 | 2192.29 | 207416.87 | 92.039 | 72.999..103.252 | 90.609 |
| stripTrailing | longBoth | 5 | 207624.84 | 3122.31 | 205622.93 | 67.093 | 55.096..85.111 | 64.518 |
| stripTrailing | longClean | 5 | 194.45 | 196.85 | 189.91 | 1.055 | 0.881..1.113 | 1.009 |
| stripTrailing | probeAfter | 5 | 190.19 | 191.33 | 185.56 | 0.979 | 0.954..1.060 | 0.966 |
| stripTrailing | probeAt | 5 | 191.68 | 199.35 | 182.91 | 0.992 | 0.871..1.322 | 0.937 |
| stripTrailing | shortBlank | 5 | 734.60 | 740.08 | 720.77 | 1.006 | 0.978..1.352 | 0.979 |
| stripTrailing | shortClean | 5 | 193.98 | 191.62 | 184.13 | 0.964 | 0.929..1.120 | 0.994 |
| stripTrailing | tailProbeAfter | 5 | 2116.43 | 2224.07 | 2183.13 | 0.940 | 0.723..1.078 | 0.989 |
| stripTrailing | tailProbeAt | 5 | 1905.67 | 2153.71 | 1921.71 | 0.818 | 0.764..0.965 | 0.879 |
| trim | early | 5 | 46944.39 | 1376.89 | 57690.73 | 34.205 | 31.910..36.833 | 40.922 |
| trim | gateAt | 5 | 2570.17 | 817.57 | 3568.57 | 3.144 | 2.817..4.031 | 4.355 |
| trim | longBlank | 5 | 37414.59 | 915.05 | 43913.58 | 40.778 | 29.965..48.005 | 51.338 |
| trim | longBoth | 5 | 97712.59 | 2148.56 | 109077.37 | 45.478 | 30.217..51.227 | 50.421 |
| trim | longClean | 5 | 137.40 | 131.06 | 133.67 | 1.030 | 0.949..1.078 | 1.008 |
| trim | probeAfter | 5 | 1206.47 | 1706.35 | 1294.90 | 0.766 | 0.662..0.855 | 0.822 |
| trim | probeAt | 5 | 1292.09 | 1742.82 | 1488.76 | 0.739 | 0.616..0.910 | 0.895 |
| trim | shortBlank | 5 | 298.11 | 360.33 | 339.71 | 0.804 | 0.656..0.963 | 0.925 |
| trim | shortClean | 5 | 134.48 | 128.24 | 130.73 | 1.061 | 0.965..1.208 | 1.012 |
| trim | tailProbeAfter | 5 | 1456.94 | 1827.04 | 1482.64 | 0.783 | 0.762..1.013 | 0.856 |
| trim | tailProbeAt | 5 | 1440.54 | 1806.02 | 1573.91 | 0.810 | 0.699..0.937 | 0.858 |

## Every measured paired loss

- trim/probeAt: 0.739x, paired candidate delta +439.89 ns/op.
- trim/probeAfter: 0.766x, paired candidate delta +406.11 ns/op.
- trim/tailProbeAfter: 0.783x, paired candidate delta +391.50 ns/op.
- trim/shortBlank: 0.804x, paired candidate delta +70.62 ns/op.
- trim/tailProbeAt: 0.810x, paired candidate delta +342.14 ns/op.
- stripTrailing/tailProbeAt: 0.818x, paired candidate delta +383.35 ns/op.
- isBlank/probeAt: 0.857x, paired candidate delta +159.62 ns/op.
- isBlank/shortBlank: 0.860x, paired candidate delta +112.73 ns/op.
- isBlank/probeAfter: 0.875x, paired candidate delta +142.07 ns/op.
- linesFirst/probeAt: 0.915x, paired candidate delta +288.83 ns/op.
- stripLeading/probeAfter: 0.920x, paired candidate delta +160.96 ns/op.
- stripLeading/probeAt: 0.924x, paired candidate delta +159.51 ns/op.
- strip/probeAt: 0.933x, paired candidate delta +147.10 ns/op.
- strip/tailProbeAfter: 0.935x, paired candidate delta +145.56 ns/op.
- stripTrailing/tailProbeAfter: 0.940x, paired candidate delta +144.58 ns/op.
- isBlank/early: 0.943x, paired candidate delta +22.94 ns/op.
- strip/tailProbeAt: 0.947x, paired candidate delta +126.49 ns/op.
- linesFirst/probeAfter: 0.958x, paired candidate delta +141.85 ns/op.
- isBlank/tailProbeAt: 0.959x, paired candidate delta +8.91 ns/op.
- linesFirst/short: 0.962x, paired candidate delta +75.79 ns/op.
- stripTrailing/shortClean: 0.964x, paired candidate delta +7.01 ns/op.
- linesCount/dense: 0.968x, paired candidate delta +11828.28 ns/op.
- strip/longClean: 0.978x, paired candidate delta +6.56 ns/op.
- stripTrailing/probeAfter: 0.979x, paired candidate delta +4.31 ns/op.
- stripTrailing/probeAt: 0.992x, paired candidate delta +1.57 ns/op.
