# int-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 380.80 | 403.91 | 395.44 | 0.898 | 0.742..0.986 | 0.981 |
| isBlank | gateAt | 5 | 6745.68 | 1381.03 | 7191.11 | 5.012 | 4.381..5.754 | 5.207 |
| isBlank | longBlank | 5 | 190268.89 | 2379.49 | 195919.99 | 76.304 | 60.504..87.990 | 79.731 |
| isBlank | longBoth | 5 | 191583.70 | 2307.07 | 200039.07 | 84.519 | 71.277..86.776 | 85.027 |
| isBlank | longClean | 5 | 209.79 | 220.54 | 205.18 | 0.931 | 0.835..1.085 | 0.925 |
| isBlank | probeAfter | 5 | 1058.12 | 1260.33 | 1037.62 | 0.844 | 0.753..0.924 | 0.802 |
| isBlank | probeAt | 5 | 928.26 | 1183.49 | 1043.51 | 0.784 | 0.713..0.841 | 0.818 |
| isBlank | shortBlank | 5 | 695.07 | 766.48 | 768.41 | 0.910 | 0.790..0.934 | 0.996 |
| isBlank | shortClean | 5 | 217.26 | 217.06 | 204.66 | 0.971 | 0.952..1.010 | 0.949 |
| isBlank | tailProbeAfter | 5 | 214.26 | 214.35 | 202.69 | 1.000 | 0.430..1.064 | 0.943 |
| isBlank | tailProbeAt | 5 | 208.86 | 213.33 | 205.12 | 1.007 | 0.920..1.050 | 0.961 |
| linesCount | dense | 5 | 345337.76 | 348647.34 | 344925.46 | 0.990 | 0.892..1.062 | 1.006 |
| linesCount | gateAt | 5 | 9708.35 | 3111.96 | 9945.19 | 3.089 | 2.888..3.327 | 3.165 |
| linesCount | immediate | 5 | 118598.82 | 4299.92 | 111149.49 | 26.147 | 24.401..27.937 | 26.032 |
| linesCount | lines128 | 5 | 967168.55 | 382857.21 | 1013801.51 | 2.524 | 2.393..2.730 | 2.647 |
| linesCount | lines16 | 5 | 197057.32 | 199575.60 | 192959.33 | 1.023 | 0.920..1.173 | 1.023 |
| linesCount | lines80 | 5 | 635691.96 | 371995.72 | 692097.69 | 1.716 | 1.641..1.794 | 1.855 |
| linesCount | longLines | 5 | 461553.00 | 10917.78 | 418826.68 | 42.275 | 38.316..49.375 | 38.362 |
| linesCount | noMatch | 5 | 113864.96 | 4021.33 | 106601.06 | 27.957 | 25.570..30.582 | 26.707 |
| linesCount | probeAfter | 5 | 113249.04 | 5767.63 | 109868.76 | 19.847 | 19.081..22.393 | 19.730 |
| linesCount | probeAt | 5 | 118810.43 | 5668.69 | 114962.18 | 21.173 | 20.449..22.174 | 20.280 |
| linesCount | short | 5 | 3077.57 | 3014.87 | 2877.77 | 1.026 | 0.967..1.066 | 0.970 |
| linesFirst | dense | 5 | 1906.91 | 1891.59 | 1880.24 | 1.008 | 0.963..1.095 | 1.004 |
| linesFirst | gateAt | 5 | 9830.79 | 3043.86 | 9910.64 | 3.179 | 2.955..3.382 | 3.256 |
| linesFirst | immediate | 5 | 1616.87 | 1673.00 | 1577.58 | 1.026 | 0.849..1.039 | 0.943 |
| linesFirst | lines128 | 5 | 5545.67 | 3099.96 | 5921.56 | 1.831 | 1.710..1.878 | 1.915 |
| linesFirst | lines16 | 5 | 2389.74 | 2428.91 | 2370.63 | 0.984 | 0.926..1.055 | 0.993 |
| linesFirst | lines80 | 5 | 4254.80 | 3070.51 | 4402.89 | 1.404 | 1.243..1.493 | 1.441 |
| linesFirst | longLines | 5 | 112606.90 | 3945.22 | 108764.37 | 27.984 | 26.465..32.399 | 27.703 |
| linesFirst | noMatch | 5 | 113740.74 | 3901.62 | 112734.37 | 29.152 | 27.981..31.137 | 28.516 |
| linesFirst | probeAfter | 5 | 3039.55 | 3031.79 | 2896.06 | 0.948 | 0.828..1.126 | 0.943 |
| linesFirst | probeAt | 5 | 2932.67 | 3139.21 | 2896.90 | 0.924 | 0.900..0.954 | 0.900 |
| linesFirst | short | 5 | 2115.24 | 2083.87 | 1914.27 | 1.006 | 0.594..1.119 | 0.916 |
| strip | early | 5 | 102609.44 | 2181.65 | 102917.64 | 47.064 | 41.725..53.260 | 46.006 |
| strip | gateAt | 5 | 6658.01 | 1240.18 | 7214.74 | 5.289 | 4.873..5.736 | 5.580 |
| strip | longBlank | 5 | 191108.75 | 2262.11 | 198379.37 | 88.365 | 73.354..89.796 | 87.250 |
| strip | longBoth | 5 | 400830.00 | 4653.65 | 414014.66 | 84.552 | 77.280..90.837 | 88.966 |
| strip | longClean | 5 | 285.65 | 288.31 | 274.35 | 0.991 | 0.915..1.044 | 0.952 |
| strip | probeAfter | 5 | 1868.54 | 2182.65 | 2010.31 | 0.872 | 0.773..0.895 | 0.900 |
| strip | probeAt | 5 | 1995.52 | 2337.45 | 2114.91 | 0.839 | 0.710..0.947 | 0.889 |
| strip | shortBlank | 5 | 679.49 | 730.03 | 738.32 | 0.935 | 0.857..1.156 | 1.025 |
| strip | shortClean | 5 | 294.29 | 283.77 | 276.76 | 1.036 | 0.708..1.331 | 0.978 |
| strip | tailProbeAfter | 5 | 2069.13 | 2297.50 | 2120.59 | 0.897 | 0.813..0.969 | 0.910 |
| strip | tailProbeAt | 5 | 2044.89 | 2253.30 | 2010.37 | 0.910 | 0.803..0.951 | 0.885 |
| stripLeading | early | 5 | 1052.82 | 1133.33 | 1111.59 | 0.944 | 0.907..1.012 | 1.011 |
| stripLeading | gateAt | 5 | 6418.68 | 1208.41 | 7417.74 | 5.388 | 5.117..5.590 | 6.109 |
| stripLeading | longBlank | 5 | 181330.56 | 2208.20 | 196742.47 | 82.212 | 80.656..86.988 | 89.156 |
| stripLeading | longBoth | 5 | 193606.63 | 3040.85 | 215308.01 | 64.601 | 61.310..68.246 | 70.805 |
| stripLeading | longClean | 5 | 190.86 | 184.53 | 198.10 | 1.017 | 0.943..1.034 | 0.986 |
| stripLeading | probeAfter | 5 | 1705.42 | 2095.40 | 2149.76 | 0.835 | 0.807..0.870 | 1.025 |
| stripLeading | probeAt | 5 | 1745.34 | 2099.53 | 1961.17 | 0.902 | 0.808..0.991 | 0.923 |
| stripLeading | shortBlank | 5 | 681.80 | 754.98 | 750.36 | 0.905 | 0.818..0.936 | 1.018 |
| stripLeading | shortClean | 5 | 183.74 | 186.87 | 179.80 | 1.001 | 0.869..1.014 | 0.962 |
| stripLeading | tailProbeAfter | 5 | 187.56 | 186.60 | 180.65 | 0.991 | 0.898..1.062 | 0.968 |
| stripLeading | tailProbeAt | 5 | 184.55 | 183.02 | 181.78 | 1.016 | 0.932..1.087 | 0.979 |
| stripTrailing | early | 5 | 102556.92 | 1630.87 | 107059.16 | 61.516 | 53.416..66.744 | 61.742 |
| stripTrailing | gateAt | 5 | 6739.08 | 1242.59 | 7750.36 | 5.381 | 5.176..5.575 | 6.189 |
| stripTrailing | longBlank | 5 | 190518.29 | 2209.44 | 193979.79 | 86.959 | 80.337..95.260 | 88.921 |
| stripTrailing | longBoth | 5 | 196978.31 | 3109.61 | 198403.53 | 63.242 | 61.447..67.876 | 63.803 |
| stripTrailing | longClean | 5 | 186.39 | 190.24 | 182.04 | 1.026 | 0.913..1.036 | 0.965 |
| stripTrailing | probeAfter | 5 | 187.05 | 189.30 | 183.33 | 1.006 | 0.933..1.051 | 0.998 |
| stripTrailing | probeAt | 5 | 190.86 | 189.88 | 185.16 | 1.007 | 0.945..1.049 | 0.967 |
| stripTrailing | shortBlank | 5 | 738.00 | 744.15 | 785.75 | 0.980 | 0.886..1.028 | 1.056 |
| stripTrailing | shortClean | 5 | 189.01 | 185.97 | 183.37 | 1.031 | 0.968..1.051 | 0.994 |
| stripTrailing | tailProbeAfter | 5 | 1916.60 | 2175.02 | 2026.85 | 0.887 | 0.843..1.001 | 0.938 |
| stripTrailing | tailProbeAt | 5 | 1861.63 | 2128.90 | 1988.20 | 0.868 | 0.830..0.938 | 0.923 |
| trim | early | 5 | 45717.41 | 1333.72 | 52354.44 | 34.679 | 31.842..37.714 | 39.714 |
| trim | gateAt | 5 | 2857.21 | 807.24 | 3734.45 | 3.697 | 3.052..4.857 | 4.734 |
| trim | longBlank | 5 | 35943.52 | 930.15 | 43360.00 | 38.355 | 33.589..41.617 | 45.069 |
| trim | longBoth | 5 | 94240.42 | 2166.18 | 100738.33 | 40.110 | 37.270..47.930 | 47.543 |
| trim | longClean | 5 | 131.71 | 128.93 | 125.11 | 1.039 | 0.998..1.085 | 0.982 |
| trim | probeAfter | 5 | 1179.69 | 1601.63 | 1348.40 | 0.782 | 0.690..0.801 | 0.844 |
| trim | probeAt | 5 | 1220.48 | 1585.78 | 1346.82 | 0.768 | 0.709..0.830 | 0.908 |
| trim | shortBlank | 5 | 305.06 | 371.08 | 353.36 | 0.819 | 0.740..0.911 | 0.956 |
| trim | shortClean | 5 | 130.36 | 124.05 | 121.57 | 1.050 | 0.994..1.142 | 0.973 |
| trim | tailProbeAfter | 5 | 1399.69 | 1665.45 | 1512.48 | 0.842 | 0.704..1.079 | 0.917 |
| trim | tailProbeAt | 5 | 1348.26 | 1674.76 | 1444.71 | 0.805 | 0.750..1.197 | 0.861 |

## Every measured paired loss

- trim/probeAt: 0.768x, paired candidate delta +374.93 ns/op.
- trim/probeAfter: 0.782x, paired candidate delta +351.04 ns/op.
- isBlank/probeAt: 0.784x, paired candidate delta +255.23 ns/op.
- trim/tailProbeAt: 0.805x, paired candidate delta +326.50 ns/op.
- trim/shortBlank: 0.819x, paired candidate delta +67.47 ns/op.
- stripLeading/probeAfter: 0.835x, paired candidate delta +354.64 ns/op.
- strip/probeAt: 0.839x, paired candidate delta +383.85 ns/op.
- trim/tailProbeAfter: 0.842x, paired candidate delta +260.33 ns/op.
- isBlank/probeAfter: 0.844x, paired candidate delta +187.57 ns/op.
- stripTrailing/tailProbeAt: 0.868x, paired candidate delta +281.93 ns/op.
- strip/probeAfter: 0.872x, paired candidate delta +278.62 ns/op.
- stripTrailing/tailProbeAfter: 0.887x, paired candidate delta +244.39 ns/op.
- strip/tailProbeAfter: 0.897x, paired candidate delta +230.20 ns/op.
- isBlank/early: 0.898x, paired candidate delta +45.30 ns/op.
- stripLeading/probeAt: 0.902x, paired candidate delta +196.60 ns/op.
- stripLeading/shortBlank: 0.905x, paired candidate delta +71.62 ns/op.
- isBlank/shortBlank: 0.910x, paired candidate delta +71.54 ns/op.
- strip/tailProbeAt: 0.910x, paired candidate delta +202.34 ns/op.
- linesFirst/probeAt: 0.924x, paired candidate delta +236.45 ns/op.
- isBlank/longClean: 0.931x, paired candidate delta +15.27 ns/op.
- strip/shortBlank: 0.935x, paired candidate delta +47.12 ns/op.
- stripLeading/early: 0.944x, paired candidate delta +67.09 ns/op.
- linesFirst/probeAfter: 0.948x, paired candidate delta +153.97 ns/op.
- isBlank/shortClean: 0.971x, paired candidate delta +6.91 ns/op.
- stripTrailing/shortBlank: 0.980x, paired candidate delta +14.93 ns/op.
- linesFirst/lines16: 0.984x, paired candidate delta +39.18 ns/op.
- linesCount/dense: 0.990x, paired candidate delta +3521.20 ns/op.
- strip/longClean: 0.991x, paired candidate delta +2.66 ns/op.
- stripLeading/tailProbeAfter: 0.991x, paired candidate delta +1.70 ns/op.
- isBlank/tailProbeAfter: 1.000x, paired candidate delta +0.08 ns/op.
