# c2-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 7.55 | 4.60 | 4.42 | 1.506 | 1.188..1.984 | 0.991 |
| isBlank | empty | 5 | 1.34 | 1.36 | 1.31 | 0.984 | 0.890..1.044 | 0.979 |
| isBlank | gateAt | 5 | 262.15 | 30.28 | 169.79 | 8.090 | 5.748..8.656 | 5.539 |
| isBlank | gateBefore | 5 | 256.13 | 142.31 | 148.51 | 1.609 | 1.313..1.852 | 1.036 |
| isBlank | lateNbsp | 5 | 3502.61 | 141.64 | 1816.68 | 24.729 | 18.861..27.957 | 12.827 |
| isBlank | longBlank | 5 | 3275.24 | 135.24 | 1838.68 | 24.218 | 21.324..25.479 | 13.524 |
| isBlank | longBoth | 5 | 3793.99 | 138.17 | 1822.40 | 25.776 | 20.982..30.270 | 13.349 |
| isBlank | longClean | 5 | 1.93 | 1.99 | 2.00 | 0.963 | 0.916..0.981 | 1.006 |
| isBlank | longLeading | 5 | 3628.51 | 141.62 | 1894.40 | 24.569 | 21.232..26.633 | 13.376 |
| isBlank | longTrailing | 5 | 1.91 | 1.96 | 1.96 | 0.971 | 0.964..1.024 | 1.000 |
| isBlank | nul | 5 | 1.91 | 1.98 | 1.99 | 0.961 | 0.916..1.028 | 1.002 |
| isBlank | prefix8 | 5 | 8.26 | 5.31 | 5.29 | 1.453 | 1.139..1.837 | 0.964 |
| isBlank | prefix9 | 5 | 8.95 | 5.42 | 5.22 | 1.648 | 1.324..1.881 | 0.956 |
| isBlank | probeAfter | 5 | 29.97 | 24.58 | 19.89 | 1.093 | 0.905..1.306 | 0.787 |
| isBlank | probeAt | 5 | 28.81 | 26.74 | 19.62 | 1.055 | 0.902..1.167 | 0.792 |
| isBlank | shortBlank | 5 | 21.73 | 18.90 | 18.99 | 1.167 | 0.924..1.209 | 1.010 |
| isBlank | shortClean | 5 | 2.00 | 1.80 | 1.77 | 1.084 | 1.060..1.178 | 0.992 |
| isBlank | shortPad | 5 | 2.96 | 3.37 | 3.23 | 0.878 | 0.786..1.392 | 0.980 |
| isBlank | suffix8 | 5 | 1.90 | 1.95 | 1.85 | 0.968 | 0.931..1.067 | 1.002 |
| isBlank | suffix9 | 5 | 1.93 | 1.87 | 1.80 | 1.062 | 0.965..1.075 | 0.986 |
| isBlank | tailProbeAfter | 5 | 1.89 | 2.03 | 1.97 | 0.929 | 0.856..1.077 | 0.993 |
| isBlank | tailProbeAt | 5 | 1.96 | 2.14 | 2.03 | 0.913 | 0.798..1.003 | 0.908 |
| isBlank | utf16 | 5 | 8172.16 | 7324.36 | 7129.71 | 1.116 | 1.000..1.181 | 0.967 |
| isBlank | window | 5 | 114135.98 | 3708.53 | 39089.18 | 28.908 | 19.412..32.595 | 10.244 |
| linesCount | dense | 5 | 11710.66 | 11386.07 | 11230.75 | 1.046 | 0.945..1.090 | 1.019 |
| linesCount | empty | 5 | 3.28 | 3.70 | 3.28 | 0.870 | 0.768..0.988 | 0.915 |
| linesCount | gateAt | 5 | 113.25 | 57.70 | 125.39 | 1.946 | 1.643..2.149 | 2.083 |
| linesCount | gateBefore | 5 | 115.40 | 125.45 | 120.11 | 0.921 | 0.887..0.975 | 0.970 |
| linesCount | immediate | 5 | 1723.01 | 520.07 | 1788.89 | 3.323 | 3.101..3.411 | 3.440 |
| linesCount | lines128 | 5 | 14050.47 | 9805.61 | 14562.34 | 1.433 | 1.279..1.496 | 1.508 |
| linesCount | lines16 | 5 | 4229.31 | 4840.03 | 4350.40 | 0.874 | 0.798..1.170 | 0.895 |
| linesCount | lines80 | 5 | 9932.04 | 8923.38 | 10944.00 | 1.136 | 0.940..1.151 | 1.226 |
| linesCount | longLines | 5 | 6604.81 | 1968.03 | 6833.17 | 3.356 | 3.332..3.442 | 3.472 |
| linesCount | noMatch | 5 | 1785.69 | 513.47 | 1777.13 | 3.465 | 3.362..3.589 | 3.482 |
| linesCount | prefix8 | 5 | 1709.74 | 532.98 | 1756.15 | 3.208 | 2.788..3.456 | 3.326 |
| linesCount | prefix9 | 5 | 1749.33 | 519.41 | 1788.33 | 3.297 | 3.105..3.672 | 3.531 |
| linesCount | probeAfter | 5 | 1823.77 | 561.27 | 1824.96 | 3.336 | 2.907..3.456 | 3.437 |
| linesCount | probeAt | 5 | 1751.17 | 576.36 | 1796.93 | 3.024 | 2.878..3.473 | 3.196 |
| linesCount | short | 5 | 38.84 | 45.63 | 43.87 | 0.836 | 0.793..0.910 | 0.948 |
| linesCount | utf16 | 5 | 8901.86 | 8341.66 | 8115.53 | 1.073 | 0.983..1.170 | 0.956 |
| linesCount | windowCRLF | 5 | 58828.70 | 15563.96 | 55410.78 | 3.681 | 3.274..3.869 | 3.574 |
| linesFirst | dense | 5 | 32.23 | 32.42 | 31.44 | 0.984 | 0.843..1.037 | 0.982 |
| linesFirst | empty | 5 | 17.82 | 17.71 | 18.33 | 1.006 | 0.909..1.237 | 1.037 |
| linesFirst | gateAt | 5 | 134.42 | 73.98 | 134.99 | 1.851 | 1.761..1.883 | 1.862 |
| linesFirst | gateBefore | 5 | 132.15 | 134.56 | 130.84 | 0.982 | 0.948..1.185 | 0.973 |
| linesFirst | immediate | 5 | 24.12 | 24.20 | 24.26 | 0.997 | 0.923..1.055 | 1.002 |
| linesFirst | lines128 | 5 | 76.00 | 62.26 | 81.09 | 1.221 | 1.102..1.339 | 1.327 |
| linesFirst | lines16 | 5 | 38.11 | 41.14 | 37.68 | 0.926 | 0.888..0.993 | 0.926 |
| linesFirst | lines80 | 5 | 58.73 | 61.47 | 62.99 | 0.975 | 0.761..1.021 | 1.025 |
| linesFirst | longLines | 5 | 1788.19 | 543.87 | 1842.82 | 3.239 | 2.412..3.395 | 3.257 |
| linesFirst | noMatch | 5 | 1792.28 | 529.63 | 1771.04 | 3.308 | 2.784..3.621 | 3.361 |
| linesFirst | prefix8 | 5 | 33.70 | 34.33 | 33.63 | 0.983 | 0.854..1.075 | 0.973 |
| linesFirst | prefix9 | 5 | 34.78 | 35.10 | 35.15 | 0.960 | 0.871..1.147 | 1.024 |
| linesFirst | probeAfter | 5 | 42.20 | 54.87 | 46.21 | 0.789 | 0.756..0.912 | 0.825 |
| linesFirst | probeAt | 5 | 41.60 | 54.00 | 45.36 | 0.783 | 0.698..0.918 | 0.825 |
| linesFirst | short | 5 | 32.55 | 32.34 | 32.63 | 0.989 | 0.960..1.116 | 1.019 |
| linesFirst | utf16 | 5 | 2278.08 | 2224.63 | 2170.32 | 1.026 | 0.930..1.081 | 1.038 |
| linesFirst | windowCRLF | 5 | 29324.68 | 8014.31 | 28973.03 | 3.720 | 2.730..4.066 | 3.554 |
| strip | early | 5 | 1248.39 | 149.35 | 936.36 | 8.314 | 7.402..9.398 | 6.288 |
| strip | empty | 5 | 1.35 | 1.36 | 1.32 | 0.940 | 0.809..1.149 | 0.996 |
| strip | gateAt | 5 | 173.50 | 29.48 | 94.20 | 5.953 | 5.698..6.426 | 3.305 |
| strip | gateBefore | 5 | 177.74 | 107.32 | 109.62 | 1.636 | 1.604..1.796 | 1.029 |
| strip | lateNbsp | 5 | 3238.36 | 150.61 | 1777.12 | 22.008 | 19.378..23.847 | 12.406 |
| strip | longBlank | 5 | 3089.75 | 138.72 | 1865.94 | 22.563 | 19.652..24.155 | 12.971 |
| strip | longBoth | 5 | 5177.27 | 296.01 | 3949.65 | 16.820 | 16.176..19.517 | 13.317 |
| strip | longClean | 5 | 2.73 | 3.42 | 3.45 | 0.782 | 0.779..0.812 | 0.986 |
| strip | longLeading | 5 | 3312.28 | 147.22 | 1877.09 | 21.832 | 21.123..25.250 | 12.750 |
| strip | longTrailing | 5 | 1863.48 | 160.24 | 2445.97 | 11.751 | 11.431..15.474 | 15.402 |
| strip | nul | 5 | 2.91 | 3.37 | 3.31 | 0.806 | 0.612..0.887 | 0.972 |
| strip | prefix8 | 5 | 305.34 | 303.57 | 345.39 | 1.035 | 0.683..1.195 | 1.171 |
| strip | prefix9 | 5 | 317.47 | 305.73 | 341.08 | 1.034 | 0.731..1.147 | 1.116 |
| strip | probeAfter | 5 | 348.60 | 374.12 | 382.48 | 0.932 | 0.725..1.190 | 0.952 |
| strip | probeAt | 5 | 308.89 | 353.02 | 401.23 | 0.934 | 0.670..1.273 | 0.924 |
| strip | shortBlank | 5 | 15.14 | 9.06 | 8.84 | 1.670 | 1.618..1.744 | 0.976 |
| strip | shortClean | 5 | 2.48 | 2.76 | 2.79 | 0.874 | 0.844..0.932 | 0.993 |
| strip | shortPad | 5 | 13.68 | 15.75 | 15.20 | 0.820 | 0.753..0.916 | 0.965 |
| strip | suffix8 | 5 | 388.30 | 321.68 | 351.79 | 1.160 | 0.755..2.278 | 1.044 |
| strip | suffix9 | 5 | 292.92 | 297.98 | 344.83 | 1.001 | 0.739..1.364 | 0.971 |
| strip | tailProbeAfter | 5 | 371.14 | 373.39 | 384.51 | 1.061 | 0.721..1.440 | 0.924 |
| strip | tailProbeAt | 5 | 347.23 | 379.13 | 378.39 | 0.916 | 0.611..1.193 | 0.907 |
| strip | utf16 | 5 | 16441.97 | 14871.14 | 14459.81 | 1.093 | 0.891..1.243 | 0.992 |
| strip | window | 5 | 79468.53 | 3745.66 | 40093.97 | 21.784 | 18.089..26.568 | 10.610 |
| stripLeading | early | 5 | 310.95 | 356.85 | 355.59 | 0.893 | 0.754..1.243 | 0.996 |
| stripLeading | empty | 5 | 1.30 | 1.36 | 1.37 | 0.952 | 0.833..1.029 | 0.993 |
| stripLeading | gateAt | 5 | 99.38 | 34.75 | 99.68 | 2.918 | 2.746..3.192 | 2.896 |
| stripLeading | gateBefore | 5 | 104.19 | 130.71 | 129.98 | 0.793 | 0.716..0.879 | 0.982 |
| stripLeading | lateNbsp | 5 | 2292.04 | 149.19 | 1845.07 | 15.554 | 13.937..16.240 | 12.202 |
| stripLeading | longBlank | 5 | 2657.51 | 147.20 | 1825.45 | 19.806 | 13.461..20.776 | 13.396 |
| stripLeading | longBoth | 5 | 2384.68 | 491.99 | 2165.71 | 4.896 | 4.213..4.926 | 4.447 |
| stripLeading | longClean | 5 | 1.90 | 1.71 | 1.66 | 1.111 | 1.032..1.203 | 0.985 |
| stripLeading | longLeading | 5 | 2425.18 | 145.03 | 1865.30 | 16.848 | 14.322..18.732 | 12.689 |
| stripLeading | longTrailing | 5 | 1.95 | 1.71 | 1.66 | 1.140 | 0.875..1.203 | 0.956 |
| stripLeading | nul | 5 | 1.99 | 1.69 | 1.66 | 1.177 | 1.133..1.248 | 0.991 |
| stripLeading | prefix8 | 5 | 308.83 | 343.28 | 394.99 | 0.888 | 0.818..1.120 | 1.046 |
| stripLeading | prefix9 | 5 | 316.00 | 335.50 | 362.88 | 0.969 | 0.721..1.347 | 1.058 |
| stripLeading | probeAfter | 5 | 320.80 | 381.85 | 374.54 | 0.798 | 0.698..1.095 | 1.004 |
| stripLeading | probeAt | 5 | 317.76 | 398.37 | 370.71 | 0.811 | 0.706..1.034 | 1.046 |
| stripLeading | shortBlank | 5 | 12.64 | 10.30 | 10.33 | 1.212 | 1.111..1.564 | 1.021 |
| stripLeading | shortClean | 5 | 1.91 | 1.66 | 1.66 | 1.142 | 1.111..1.240 | 1.021 |
| stripLeading | shortPad | 5 | 12.87 | 12.78 | 13.11 | 0.999 | 0.861..1.059 | 1.043 |
| stripLeading | suffix8 | 5 | 2.02 | 1.73 | 1.71 | 1.152 | 0.987..1.340 | 0.959 |
| stripLeading | suffix9 | 5 | 2.04 | 1.71 | 1.68 | 1.162 | 1.125..1.248 | 0.981 |
| stripLeading | tailProbeAfter | 5 | 1.92 | 1.74 | 1.76 | 1.120 | 0.998..1.216 | 0.977 |
| stripLeading | tailProbeAt | 5 | 1.90 | 1.77 | 1.69 | 1.112 | 0.991..1.153 | 0.989 |
| stripLeading | utf16 | 5 | 11167.92 | 9291.71 | 9062.48 | 1.204 | 1.167..1.373 | 0.992 |
| stripLeading | window | 5 | 39660.83 | 3744.82 | 39942.16 | 10.746 | 10.153..12.962 | 10.738 |
| stripTrailing | early | 5 | 2523.30 | 147.28 | 948.91 | 17.129 | 16.021..29.389 | 6.456 |
| stripTrailing | empty | 5 | 1.40 | 1.53 | 1.37 | 0.966 | 0.755..1.113 | 0.864 |
| stripTrailing | gateAt | 5 | 174.83 | 31.72 | 77.91 | 5.512 | 5.151..6.329 | 2.531 |
| stripTrailing | gateBefore | 5 | 174.20 | 109.63 | 110.94 | 1.633 | 1.478..2.715 | 1.045 |
| stripTrailing | lateNbsp | 5 | 2.07 | 1.95 | 1.91 | 1.082 | 1.018..1.209 | 0.991 |
| stripTrailing | longBlank | 5 | 2494.82 | 148.36 | 2832.91 | 16.683 | 15.962..18.104 | 18.698 |
| stripTrailing | longBoth | 5 | 3105.57 | 520.80 | 3132.46 | 5.924 | 5.867..6.111 | 6.073 |
| stripTrailing | longClean | 5 | 1.98 | 1.88 | 1.99 | 1.041 | 0.893..1.090 | 1.043 |
| stripTrailing | longLeading | 5 | 1.97 | 1.91 | 1.95 | 1.056 | 0.980..1.096 | 1.036 |
| stripTrailing | longTrailing | 5 | 2520.24 | 159.56 | 2897.65 | 15.242 | 15.072..16.451 | 18.071 |
| stripTrailing | nul | 5 | 2.13 | 1.86 | 2.03 | 1.091 | 0.579..1.303 | 1.026 |
| stripTrailing | prefix8 | 5 | 2.13 | 1.86 | 1.88 | 1.120 | 0.957..1.288 | 1.017 |
| stripTrailing | prefix9 | 5 | 1.99 | 1.89 | 1.90 | 1.081 | 0.977..1.166 | 1.002 |
| stripTrailing | probeAfter | 5 | 1.95 | 1.94 | 1.87 | 1.018 | 0.910..1.077 | 0.968 |
| stripTrailing | probeAt | 5 | 1.95 | 1.86 | 1.86 | 1.075 | 1.014..1.133 | 0.975 |
| stripTrailing | shortBlank | 5 | 13.60 | 12.47 | 11.55 | 1.083 | 1.066..1.155 | 0.956 |
| stripTrailing | shortClean | 5 | 2.02 | 1.98 | 1.94 | 0.998 | 0.977..1.324 | 0.957 |
| stripTrailing | shortPad | 5 | 14.76 | 16.25 | 14.03 | 0.937 | 0.843..2.055 | 0.860 |
| stripTrailing | suffix8 | 5 | 344.52 | 322.99 | 363.14 | 0.958 | 0.877..1.249 | 0.949 |
| stripTrailing | suffix9 | 5 | 331.15 | 327.85 | 370.76 | 0.991 | 0.838..1.209 | 0.983 |
| stripTrailing | tailProbeAfter | 5 | 345.28 | 365.39 | 376.75 | 0.896 | 0.821..1.099 | 1.033 |
| stripTrailing | tailProbeAt | 5 | 338.82 | 347.14 | 374.24 | 0.935 | 0.764..1.131 | 0.867 |
| stripTrailing | utf16 | 5 | 10783.94 | 11062.10 | 11100.02 | 0.994 | 0.889..1.028 | 0.998 |
| stripTrailing | window | 5 | 2.07 | 1.93 | 2.11 | 1.093 | 1.032..1.184 | 1.012 |
| trim | early | 5 | 1257.20 | 164.72 | 911.06 | 7.720 | 6.963..7.898 | 5.087 |
| trim | empty | 5 | 1.25 | 1.41 | 1.31 | 0.882 | 0.792..1.015 | 1.019 |
| trim | gateAt | 5 | 101.21 | 28.29 | 170.60 | 3.521 | 3.043..6.236 | 6.124 |
| trim | gateBefore | 5 | 90.27 | 58.93 | 59.44 | 1.538 | 1.014..3.051 | 0.996 |
| trim | lateNbsp | 5 | 1310.38 | 139.56 | 2626.47 | 9.501 | 8.951..19.803 | 19.212 |
| trim | longBlank | 5 | 1197.12 | 132.56 | 2397.98 | 9.370 | 8.552..18.724 | 18.199 |
| trim | longBoth | 5 | 2522.52 | 275.45 | 3493.81 | 9.218 | 6.125..15.269 | 11.882 |
| trim | longClean | 5 | 2.41 | 2.15 | 2.12 | 1.160 | 0.998..1.200 | 1.016 |
| trim | longLeading | 5 | 1281.64 | 141.11 | 2532.75 | 9.105 | 8.863..20.985 | 17.948 |
| trim | longTrailing | 5 | 1238.30 | 148.62 | 882.94 | 8.407 | 5.068..10.009 | 5.994 |
| trim | nul | 5 | 1258.59 | 133.13 | 2498.25 | 9.321 | 8.673..19.598 | 18.873 |
| trim | prefix8 | 5 | 312.13 | 328.91 | 355.16 | 0.908 | 0.800..1.265 | 1.043 |
| trim | prefix9 | 5 | 303.57 | 320.19 | 340.24 | 0.928 | 0.872..1.269 | 0.971 |
| trim | probeAfter | 5 | 322.22 | 352.34 | 374.44 | 0.870 | 0.795..1.498 | 0.985 |
| trim | probeAt | 5 | 299.00 | 352.22 | 364.42 | 0.854 | 0.726..1.227 | 0.982 |
| trim | shortBlank | 5 | 9.92 | 9.07 | 9.27 | 1.093 | 1.035..1.190 | 1.021 |
| trim | shortClean | 5 | 2.34 | 1.90 | 1.85 | 1.225 | 1.155..1.298 | 0.998 |
| trim | shortPad | 5 | 13.69 | 13.77 | 13.31 | 1.003 | 0.935..1.316 | 0.964 |
| trim | suffix8 | 5 | 313.20 | 308.71 | 355.92 | 0.966 | 0.840..1.309 | 1.028 |
| trim | suffix9 | 5 | 308.09 | 338.70 | 357.79 | 0.917 | 0.813..1.474 | 1.034 |
| trim | tailProbeAfter | 5 | 306.51 | 367.53 | 373.89 | 0.856 | 0.748..1.098 | 1.015 |
| trim | tailProbeAt | 5 | 305.42 | 367.17 | 378.12 | 0.832 | 0.681..1.162 | 0.958 |
| trim | utf16 | 5 | 3.20 | 3.16 | 3.26 | 1.004 | 0.654..1.035 | 1.059 |
| trim | window | 5 | 39576.85 | 3723.39 | 84879.20 | 10.818 | 10.098..24.539 | 23.009 |

## Every measured paired loss

- strip/longClean: 0.782x, paired candidate delta +0.74 ns/op.
- linesFirst/probeAt: 0.783x, paired candidate delta +12.35 ns/op.
- linesFirst/probeAfter: 0.789x, paired candidate delta +12.08 ns/op.
- stripLeading/gateBefore: 0.793x, paired candidate delta +26.52 ns/op.
- stripLeading/probeAfter: 0.798x, paired candidate delta +75.14 ns/op.
- strip/nul: 0.806x, paired candidate delta +0.64 ns/op.
- stripLeading/probeAt: 0.811x, paired candidate delta +67.60 ns/op.
- strip/shortPad: 0.820x, paired candidate delta +2.77 ns/op.
- trim/tailProbeAt: 0.832x, paired candidate delta +61.75 ns/op.
- linesCount/short: 0.836x, paired candidate delta +7.44 ns/op.
- trim/probeAt: 0.854x, paired candidate delta +49.01 ns/op.
- trim/tailProbeAfter: 0.856x, paired candidate delta +53.10 ns/op.
- linesCount/empty: 0.870x, paired candidate delta +0.48 ns/op.
- trim/probeAfter: 0.870x, paired candidate delta +45.79 ns/op.
- linesCount/lines16: 0.874x, paired candidate delta +610.72 ns/op.
- strip/shortClean: 0.874x, paired candidate delta +0.34 ns/op.
- isBlank/shortPad: 0.878x, paired candidate delta +0.41 ns/op.
- trim/empty: 0.882x, paired candidate delta +0.17 ns/op.
- stripLeading/prefix8: 0.888x, paired candidate delta +36.82 ns/op.
- stripLeading/early: 0.893x, paired candidate delta +34.51 ns/op.
- stripTrailing/tailProbeAfter: 0.896x, paired candidate delta +40.72 ns/op.
- trim/prefix8: 0.908x, paired candidate delta +27.48 ns/op.
- isBlank/tailProbeAt: 0.913x, paired candidate delta +0.18 ns/op.
- strip/tailProbeAt: 0.916x, paired candidate delta +31.90 ns/op.
- trim/suffix9: 0.917x, paired candidate delta +26.34 ns/op.
- linesCount/gateBefore: 0.921x, paired candidate delta +9.96 ns/op.
- linesFirst/lines16: 0.926x, paired candidate delta +3.03 ns/op.
- trim/prefix9: 0.928x, paired candidate delta +25.38 ns/op.
- isBlank/tailProbeAfter: 0.929x, paired candidate delta +0.14 ns/op.
- strip/probeAfter: 0.932x, paired candidate delta +25.52 ns/op.
- strip/probeAt: 0.934x, paired candidate delta +21.75 ns/op.
- stripTrailing/tailProbeAt: 0.935x, paired candidate delta +20.88 ns/op.
- stripTrailing/shortPad: 0.937x, paired candidate delta +1.03 ns/op.
- strip/empty: 0.940x, paired candidate delta +0.08 ns/op.
- stripLeading/empty: 0.952x, paired candidate delta +0.06 ns/op.
- stripTrailing/suffix8: 0.958x, paired candidate delta +12.97 ns/op.
- linesFirst/prefix9: 0.960x, paired candidate delta +1.42 ns/op.
- isBlank/nul: 0.961x, paired candidate delta +0.08 ns/op.
- isBlank/longClean: 0.963x, paired candidate delta +0.07 ns/op.
- stripTrailing/empty: 0.966x, paired candidate delta +0.05 ns/op.
- trim/suffix8: 0.966x, paired candidate delta +10.52 ns/op.
- isBlank/suffix8: 0.968x, paired candidate delta +0.06 ns/op.
- stripLeading/prefix9: 0.969x, paired candidate delta +9.94 ns/op.
- isBlank/longTrailing: 0.971x, paired candidate delta +0.06 ns/op.
- linesFirst/lines80: 0.975x, paired candidate delta +1.60 ns/op.
- linesFirst/gateBefore: 0.982x, paired candidate delta +2.41 ns/op.
- linesFirst/prefix8: 0.983x, paired candidate delta +0.58 ns/op.
- isBlank/empty: 0.984x, paired candidate delta +0.02 ns/op.
- linesFirst/dense: 0.984x, paired candidate delta +0.51 ns/op.
- linesFirst/short: 0.989x, paired candidate delta +0.35 ns/op.
- stripTrailing/suffix9: 0.991x, paired candidate delta +3.06 ns/op.
- stripTrailing/utf16: 0.994x, paired candidate delta +66.69 ns/op.
- linesFirst/immediate: 0.997x, paired candidate delta +0.08 ns/op.
- stripTrailing/shortClean: 0.998x, paired candidate delta +0.00 ns/op.
- stripLeading/shortPad: 0.999x, paired candidate delta +0.02 ns/op.

## Direct comparison with the preserved pre-refinement candidate

Old/candidate greater than 1 favors the refinement. Every row and every loss remain visible.

| Operation | Workload | Old ns | Candidate ns | Paired old/candidate | Paired range | Candidate minus old ns |
|---|---|---:|---:|---:|---:|---:|
| isBlank | early | 3.95 | 4.60 | 0.858 | 0.839..0.932 | +0.64 |
| isBlank | empty | 1.34 | 1.36 | 0.982 | 0.816..1.038 | +0.02 |
| isBlank | gateAt | 23.58 | 30.28 | 0.784 | 0.737..0.809 | +6.99 |
| isBlank | gateBefore | 94.34 | 142.31 | 0.662 | 0.643..0.753 | +48.05 |
| isBlank | lateNbsp | 137.02 | 141.64 | 0.948 | 0.895..1.059 | +7.48 |
| isBlank | longBlank | 137.28 | 135.24 | 1.014 | 0.988..1.087 | -1.92 |
| isBlank | longBoth | 146.24 | 138.17 | 1.003 | 0.983..1.073 | -0.49 |
| isBlank | longClean | 1.97 | 1.99 | 0.978 | 0.943..1.042 | +0.04 |
| isBlank | longLeading | 140.35 | 141.62 | 0.997 | 0.944..1.037 | +0.37 |
| isBlank | longTrailing | 1.92 | 1.96 | 0.986 | 0.940..1.039 | +0.03 |
| isBlank | nul | 1.92 | 1.98 | 0.962 | 0.941..0.990 | +0.07 |
| isBlank | prefix8 | 4.33 | 5.31 | 0.822 | 0.792..0.876 | +0.94 |
| isBlank | prefix9 | 4.30 | 5.42 | 0.836 | 0.774..0.881 | +0.86 |
| isBlank | probeAfter | 16.76 | 24.58 | 0.717 | 0.608..0.737 | +6.70 |
| isBlank | probeAt | 17.42 | 26.74 | 0.649 | 0.620..0.766 | +9.58 |
| isBlank | shortBlank | 22.40 | 18.90 | 1.173 | 1.016..1.223 | -3.27 |
| isBlank | shortClean | 2.05 | 1.80 | 1.127 | 1.036..1.213 | -0.23 |
| isBlank | shortPad | 2.90 | 3.37 | 0.871 | 0.827..0.961 | +0.41 |
| isBlank | suffix8 | 1.86 | 1.95 | 0.940 | 0.865..1.043 | +0.12 |
| isBlank | suffix9 | 1.85 | 1.87 | 0.985 | 0.939..1.058 | +0.03 |
| isBlank | tailProbeAfter | 1.94 | 2.03 | 0.945 | 0.905..0.984 | +0.11 |
| isBlank | tailProbeAt | 1.98 | 2.14 | 0.961 | 0.850..1.081 | +0.08 |
| isBlank | utf16 | 7318.91 | 7324.36 | 1.044 | 0.890..1.057 | -321.68 |
| isBlank | window | 3665.37 | 3708.53 | 0.979 | 0.938..1.026 | +76.30 |
| linesCount | dense | 11894.30 | 11386.07 | 1.039 | 0.973..1.082 | -424.99 |
| linesCount | empty | 3.70 | 3.70 | 0.976 | 0.892..1.076 | +0.09 |
| linesCount | gateAt | 58.36 | 57.70 | 1.045 | 0.842..1.079 | -2.59 |
| linesCount | gateBefore | 121.83 | 125.45 | 0.979 | 0.951..1.024 | +2.59 |
| linesCount | immediate | 502.93 | 520.07 | 0.996 | 0.839..1.055 | +2.25 |
| linesCount | lines128 | 9336.11 | 9805.61 | 0.969 | 0.866..0.987 | +301.86 |
| linesCount | lines16 | 4479.20 | 4840.03 | 0.962 | 0.879..1.028 | +183.44 |
| linesCount | lines80 | 8813.33 | 8923.38 | 0.966 | 0.865..1.053 | +303.68 |
| linesCount | longLines | 1925.54 | 1968.03 | 0.956 | 0.937..1.021 | +85.61 |
| linesCount | noMatch | 509.85 | 513.47 | 0.991 | 0.954..1.133 | +4.47 |
| linesCount | prefix8 | 511.67 | 532.98 | 0.960 | 0.845..0.981 | +21.30 |
| linesCount | prefix9 | 538.78 | 519.41 | 1.024 | 0.977..1.169 | -12.23 |
| linesCount | probeAfter | 532.26 | 561.27 | 0.939 | 0.901..1.115 | +34.38 |
| linesCount | probeAt | 530.87 | 576.36 | 0.945 | 0.858..1.074 | +29.91 |
| linesCount | short | 46.17 | 45.63 | 1.020 | 0.878..1.057 | -0.90 |
| linesCount | utf16 | 8668.65 | 8341.66 | 1.042 | 0.899..1.147 | -348.93 |
| linesCount | windowCRLF | 16920.58 | 15563.96 | 1.035 | 0.953..1.325 | -538.92 |
| linesFirst | dense | 35.68 | 32.42 | 1.100 | 0.881..1.120 | -3.26 |
| linesFirst | empty | 17.79 | 17.71 | 1.005 | 0.893..1.107 | -0.08 |
| linesFirst | gateAt | 69.55 | 73.98 | 0.939 | 0.832..1.035 | +4.48 |
| linesFirst | gateBefore | 134.65 | 134.56 | 1.001 | 0.982..1.017 | -0.09 |
| linesFirst | immediate | 26.56 | 24.20 | 1.106 | 1.011..1.117 | -2.62 |
| linesFirst | lines128 | 62.21 | 62.26 | 0.931 | 0.900..1.162 | +4.32 |
| linesFirst | lines16 | 39.25 | 41.14 | 0.976 | 0.939..1.092 | +0.95 |
| linesFirst | lines80 | 57.03 | 61.47 | 0.895 | 0.758..1.028 | +6.45 |
| linesFirst | longLines | 564.22 | 543.87 | 1.040 | 0.729..1.079 | -21.61 |
| linesFirst | noMatch | 524.52 | 529.63 | 1.002 | 0.803..1.093 | -0.86 |
| linesFirst | prefix8 | 35.73 | 34.33 | 1.041 | 0.902..1.085 | -1.40 |
| linesFirst | prefix9 | 35.38 | 35.10 | 1.008 | 0.933..1.163 | -0.28 |
| linesFirst | probeAfter | 54.42 | 54.87 | 1.002 | 0.925..1.194 | -0.09 |
| linesFirst | probeAt | 52.09 | 54.00 | 1.007 | 0.882..1.135 | -0.39 |
| linesFirst | short | 35.24 | 32.34 | 1.071 | 1.055..1.147 | -2.24 |
| linesFirst | utf16 | 2230.26 | 2224.63 | 1.006 | 0.865..1.050 | -13.08 |
| linesFirst | windowCRLF | 8421.74 | 8014.31 | 1.067 | 0.739..1.078 | -558.93 |
| strip | early | 146.18 | 149.35 | 0.957 | 0.870..1.048 | +6.44 |
| strip | empty | 1.52 | 1.36 | 1.139 | 0.948..2.644 | -0.18 |
| strip | gateAt | 28.55 | 29.48 | 1.003 | 0.932..1.012 | -0.08 |
| strip | gateBefore | 98.26 | 107.32 | 0.922 | 0.875..0.936 | +8.25 |
| strip | lateNbsp | 141.98 | 150.61 | 0.965 | 0.888..1.050 | +5.17 |
| strip | longBlank | 133.84 | 138.72 | 0.961 | 0.885..1.036 | +5.43 |
| strip | longBoth | 284.04 | 296.01 | 0.973 | 0.866..1.008 | +7.88 |
| strip | longClean | 2.88 | 3.42 | 0.834 | 0.811..0.868 | +0.56 |
| strip | longLeading | 142.36 | 147.22 | 0.978 | 0.908..1.005 | +3.13 |
| strip | longTrailing | 153.55 | 160.24 | 0.969 | 0.933..1.031 | +4.89 |
| strip | nul | 3.26 | 3.37 | 0.959 | 0.619..1.044 | +0.14 |
| strip | prefix8 | 290.74 | 303.57 | 0.986 | 0.705..1.090 | +4.21 |
| strip | prefix9 | 289.12 | 305.73 | 0.962 | 0.774..1.077 | +12.47 |
| strip | probeAfter | 389.55 | 374.12 | 0.954 | 0.873..1.511 | +17.46 |
| strip | probeAt | 346.68 | 353.02 | 1.048 | 0.756..1.058 | -15.94 |
| strip | shortBlank | 10.17 | 9.06 | 1.141 | 1.029..1.172 | -1.33 |
| strip | shortClean | 2.65 | 2.76 | 0.938 | 0.877..1.000 | +0.17 |
| strip | shortPad | 13.34 | 15.75 | 0.847 | 0.774..0.871 | +2.28 |
| strip | suffix8 | 292.15 | 321.68 | 0.888 | 0.827..1.001 | +36.04 |
| strip | suffix9 | 312.47 | 297.98 | 1.068 | 0.732..1.134 | -19.78 |
| strip | tailProbeAfter | 349.20 | 373.39 | 0.910 | 0.898..1.191 | +33.77 |
| strip | tailProbeAt | 353.35 | 379.13 | 0.960 | 0.839..1.007 | +15.34 |
| strip | utf16 | 14594.18 | 14871.14 | 0.997 | 0.838..1.022 | +53.74 |
| strip | window | 3664.36 | 3745.66 | 0.993 | 0.843..1.002 | +27.00 |
| stripLeading | early | 315.70 | 356.85 | 0.885 | 0.805..1.196 | +41.15 |
| stripLeading | empty | 1.44 | 1.36 | 1.083 | 0.924..1.221 | -0.11 |
| stripLeading | gateAt | 32.06 | 34.75 | 0.938 | 0.867..1.034 | +2.16 |
| stripLeading | gateBefore | 102.08 | 130.71 | 0.796 | 0.687..0.902 | +26.47 |
| stripLeading | lateNbsp | 154.13 | 149.19 | 1.011 | 0.908..1.138 | -1.72 |
| stripLeading | longBlank | 135.30 | 147.20 | 0.917 | 0.836..1.056 | +12.18 |
| stripLeading | longBoth | 479.32 | 491.99 | 0.952 | 0.816..0.994 | +23.50 |
| stripLeading | longClean | 1.82 | 1.71 | 1.053 | 0.940..1.105 | -0.09 |
| stripLeading | longLeading | 142.51 | 145.03 | 0.980 | 0.934..1.019 | +2.91 |
| stripLeading | longTrailing | 1.77 | 1.71 | 1.039 | 0.885..1.062 | -0.07 |
| stripLeading | nul | 1.80 | 1.69 | 1.085 | 1.018..1.128 | -0.14 |
| stripLeading | prefix8 | 328.64 | 343.28 | 0.914 | 0.870..1.128 | +29.42 |
| stripLeading | prefix9 | 336.87 | 335.50 | 0.960 | 0.841..1.144 | +13.30 |
| stripLeading | probeAfter | 355.77 | 381.85 | 0.907 | 0.764..1.082 | +35.36 |
| stripLeading | probeAt | 345.13 | 398.37 | 0.864 | 0.787..1.061 | +54.12 |
| stripLeading | shortBlank | 12.56 | 10.30 | 1.212 | 1.088..1.319 | -2.19 |
| stripLeading | shortClean | 1.81 | 1.66 | 1.095 | 1.025..1.199 | -0.16 |
| stripLeading | shortPad | 12.59 | 12.78 | 0.944 | 0.862..1.033 | +0.70 |
| stripLeading | suffix8 | 1.82 | 1.73 | 1.086 | 0.972..1.130 | -0.14 |
| stripLeading | suffix9 | 1.78 | 1.71 | 1.043 | 0.969..1.088 | -0.07 |
| stripLeading | tailProbeAfter | 1.78 | 1.74 | 1.046 | 0.966..1.111 | -0.08 |
| stripLeading | tailProbeAt | 1.77 | 1.77 | 1.061 | 0.888..1.070 | -0.10 |
| stripLeading | utf16 | 9248.45 | 9291.71 | 0.990 | 0.902..0.995 | +96.87 |
| stripLeading | window | 3781.28 | 3744.82 | 1.024 | 0.896..1.046 | -90.36 |
| stripTrailing | early | 146.80 | 147.28 | 0.997 | 0.928..1.113 | +0.48 |
| stripTrailing | empty | 3.10 | 1.53 | 2.099 | 1.809..2.370 | -1.63 |
| stripTrailing | gateAt | 32.43 | 31.72 | 0.983 | 0.955..1.273 | +0.53 |
| stripTrailing | gateBefore | 177.91 | 109.63 | 1.673 | 1.487..1.768 | -71.57 |
| stripTrailing | lateNbsp | 3.23 | 1.95 | 1.651 | 1.562..1.781 | -1.27 |
| stripTrailing | longBlank | 143.62 | 148.36 | 0.995 | 0.874..1.440 | +0.82 |
| stripTrailing | longBoth | 485.63 | 520.80 | 0.926 | 0.917..1.257 | +37.86 |
| stripTrailing | longClean | 3.08 | 1.88 | 1.656 | 1.354..1.706 | -1.23 |
| stripTrailing | longLeading | 3.08 | 1.91 | 1.644 | 1.486..1.674 | -1.21 |
| stripTrailing | longTrailing | 162.89 | 159.56 | 1.011 | 0.897..1.057 | -1.72 |
| stripTrailing | nul | 3.13 | 1.86 | 1.638 | 0.847..1.887 | -1.19 |
| stripTrailing | prefix8 | 3.12 | 1.86 | 1.661 | 1.480..1.781 | -1.21 |
| stripTrailing | prefix9 | 3.06 | 1.89 | 1.660 | 1.495..1.690 | -1.22 |
| stripTrailing | probeAfter | 3.13 | 1.94 | 1.631 | 1.455..1.802 | -1.23 |
| stripTrailing | probeAt | 3.15 | 1.86 | 1.679 | 1.602..1.731 | -1.27 |
| stripTrailing | shortBlank | 16.34 | 12.47 | 1.310 | 1.241..1.405 | -3.87 |
| stripTrailing | shortClean | 3.23 | 1.98 | 1.652 | 1.410..1.735 | -1.29 |
| stripTrailing | shortPad | 14.76 | 16.25 | 0.907 | 0.857..1.146 | +1.51 |
| stripTrailing | suffix8 | 304.20 | 322.99 | 0.867 | 0.863..0.990 | +43.12 |
| stripTrailing | suffix9 | 317.89 | 327.85 | 0.928 | 0.792..1.066 | +23.49 |
| stripTrailing | tailProbeAfter | 344.32 | 365.39 | 0.918 | 0.807..1.052 | +30.08 |
| stripTrailing | tailProbeAt | 356.29 | 347.14 | 0.933 | 0.776..1.105 | +23.35 |
| stripTrailing | utf16 | 8256.86 | 11062.10 | 0.761 | 0.654..0.823 | +2593.77 |
| stripTrailing | window | 3.13 | 1.93 | 1.643 | 1.415..1.983 | -1.22 |
| trim | early | 171.23 | 164.72 | 1.029 | 0.940..1.110 | -4.61 |
| trim | empty | 1.31 | 1.41 | 1.019 | 0.801..1.234 | -0.03 |
| trim | gateAt | 27.33 | 28.29 | 1.009 | 0.941..1.087 | -0.24 |
| trim | gateBefore | 131.31 | 58.93 | 2.197 | 1.535..2.260 | -70.57 |
| trim | lateNbsp | 137.79 | 139.56 | 0.991 | 0.960..1.008 | +1.30 |
| trim | longBlank | 131.23 | 132.56 | 0.992 | 0.939..1.032 | +1.02 |
| trim | longBoth | 277.43 | 275.45 | 0.977 | 0.819..1.024 | +6.23 |
| trim | longClean | 3.54 | 2.15 | 1.634 | 1.433..1.958 | -1.53 |
| trim | longLeading | 147.81 | 141.11 | 1.047 | 0.976..1.112 | -6.70 |
| trim | longTrailing | 152.10 | 148.62 | 1.008 | 0.771..1.156 | -1.17 |
| trim | nul | 136.35 | 133.13 | 1.016 | 0.942..1.089 | -2.04 |
| trim | prefix8 | 320.49 | 328.91 | 0.995 | 0.916..1.187 | +1.60 |
| trim | prefix9 | 313.78 | 320.19 | 0.980 | 0.891..1.148 | +6.41 |
| trim | probeAfter | 341.85 | 352.34 | 0.976 | 0.817..1.074 | +8.61 |
| trim | probeAt | 332.16 | 352.22 | 0.924 | 0.840..1.106 | +27.54 |
| trim | shortBlank | 8.76 | 9.07 | 0.965 | 0.894..1.046 | +0.32 |
| trim | shortClean | 1.82 | 1.90 | 1.010 | 0.879..1.086 | -0.02 |
| trim | shortPad | 13.09 | 13.77 | 0.986 | 0.921..1.170 | +0.18 |
| trim | suffix8 | 324.21 | 308.71 | 1.047 | 0.756..1.155 | -14.40 |
| trim | suffix9 | 317.43 | 338.70 | 0.937 | 0.843..1.114 | +22.76 |
| trim | tailProbeAfter | 344.28 | 367.53 | 0.981 | 0.783..1.308 | +6.64 |
| trim | tailProbeAt | 356.99 | 367.17 | 1.064 | 0.725..1.188 | -26.64 |
| trim | utf16 | 1.93 | 3.16 | 0.645 | 0.539..1.131 | +1.06 |
| trim | window | 3916.36 | 3723.39 | 1.061 | 0.941..1.086 | -220.47 |

### Every measured loss against the pre-refinement candidate

- trim/utf16: 0.645x, paired candidate delta +1.06 ns/op.
- isBlank/probeAt: 0.649x, paired candidate delta +9.58 ns/op.
- isBlank/gateBefore: 0.662x, paired candidate delta +48.05 ns/op.
- isBlank/probeAfter: 0.717x, paired candidate delta +6.70 ns/op.
- stripTrailing/utf16: 0.761x, paired candidate delta +2593.77 ns/op.
- isBlank/gateAt: 0.784x, paired candidate delta +6.99 ns/op.
- stripLeading/gateBefore: 0.796x, paired candidate delta +26.47 ns/op.
- isBlank/prefix8: 0.822x, paired candidate delta +0.94 ns/op.
- strip/longClean: 0.834x, paired candidate delta +0.56 ns/op.
- isBlank/prefix9: 0.836x, paired candidate delta +0.86 ns/op.
- strip/shortPad: 0.847x, paired candidate delta +2.28 ns/op.
- isBlank/early: 0.858x, paired candidate delta +0.64 ns/op.
- stripLeading/probeAt: 0.864x, paired candidate delta +54.12 ns/op.
- stripTrailing/suffix8: 0.867x, paired candidate delta +43.12 ns/op.
- isBlank/shortPad: 0.871x, paired candidate delta +0.41 ns/op.
- stripLeading/early: 0.885x, paired candidate delta +41.15 ns/op.
- strip/suffix8: 0.888x, paired candidate delta +36.04 ns/op.
- linesFirst/lines80: 0.895x, paired candidate delta +6.45 ns/op.
- stripTrailing/shortPad: 0.907x, paired candidate delta +1.51 ns/op.
- stripLeading/probeAfter: 0.907x, paired candidate delta +35.36 ns/op.
- strip/tailProbeAfter: 0.910x, paired candidate delta +33.77 ns/op.
- stripLeading/prefix8: 0.914x, paired candidate delta +29.42 ns/op.
- stripLeading/longBlank: 0.917x, paired candidate delta +12.18 ns/op.
- stripTrailing/tailProbeAfter: 0.918x, paired candidate delta +30.08 ns/op.
- strip/gateBefore: 0.922x, paired candidate delta +8.25 ns/op.
- trim/probeAt: 0.924x, paired candidate delta +27.54 ns/op.
- stripTrailing/longBoth: 0.926x, paired candidate delta +37.86 ns/op.
- stripTrailing/suffix9: 0.928x, paired candidate delta +23.49 ns/op.
- linesFirst/lines128: 0.931x, paired candidate delta +4.32 ns/op.
- stripTrailing/tailProbeAt: 0.933x, paired candidate delta +23.35 ns/op.
- trim/suffix9: 0.937x, paired candidate delta +22.76 ns/op.
- stripLeading/gateAt: 0.938x, paired candidate delta +2.16 ns/op.
- strip/shortClean: 0.938x, paired candidate delta +0.17 ns/op.
- linesCount/probeAfter: 0.939x, paired candidate delta +34.38 ns/op.
- linesFirst/gateAt: 0.939x, paired candidate delta +4.48 ns/op.
- isBlank/suffix8: 0.940x, paired candidate delta +0.12 ns/op.
- stripLeading/shortPad: 0.944x, paired candidate delta +0.70 ns/op.
- linesCount/probeAt: 0.945x, paired candidate delta +29.91 ns/op.
- isBlank/tailProbeAfter: 0.945x, paired candidate delta +0.11 ns/op.
- isBlank/lateNbsp: 0.948x, paired candidate delta +7.48 ns/op.
- stripLeading/longBoth: 0.952x, paired candidate delta +23.50 ns/op.
- strip/probeAfter: 0.954x, paired candidate delta +17.46 ns/op.
- linesCount/longLines: 0.956x, paired candidate delta +85.61 ns/op.
- strip/early: 0.957x, paired candidate delta +6.44 ns/op.
- strip/nul: 0.959x, paired candidate delta +0.14 ns/op.
- strip/tailProbeAt: 0.960x, paired candidate delta +15.34 ns/op.
- linesCount/prefix8: 0.960x, paired candidate delta +21.30 ns/op.
- stripLeading/prefix9: 0.960x, paired candidate delta +13.30 ns/op.
- strip/longBlank: 0.961x, paired candidate delta +5.43 ns/op.
- isBlank/tailProbeAt: 0.961x, paired candidate delta +0.08 ns/op.
- isBlank/nul: 0.962x, paired candidate delta +0.07 ns/op.
- linesCount/lines16: 0.962x, paired candidate delta +183.44 ns/op.
- strip/prefix9: 0.962x, paired candidate delta +12.47 ns/op.
- strip/lateNbsp: 0.965x, paired candidate delta +5.17 ns/op.
- trim/shortBlank: 0.965x, paired candidate delta +0.32 ns/op.
- linesCount/lines80: 0.966x, paired candidate delta +303.68 ns/op.
- linesCount/lines128: 0.969x, paired candidate delta +301.86 ns/op.
- strip/longTrailing: 0.969x, paired candidate delta +4.89 ns/op.
- strip/longBoth: 0.973x, paired candidate delta +7.88 ns/op.
- trim/probeAfter: 0.976x, paired candidate delta +8.61 ns/op.
- linesFirst/lines16: 0.976x, paired candidate delta +0.95 ns/op.
- linesCount/empty: 0.976x, paired candidate delta +0.09 ns/op.
- trim/longBoth: 0.977x, paired candidate delta +6.23 ns/op.
- strip/longLeading: 0.978x, paired candidate delta +3.13 ns/op.
- isBlank/longClean: 0.978x, paired candidate delta +0.04 ns/op.
- isBlank/window: 0.979x, paired candidate delta +76.30 ns/op.
- linesCount/gateBefore: 0.979x, paired candidate delta +2.59 ns/op.
- stripLeading/longLeading: 0.980x, paired candidate delta +2.91 ns/op.
- trim/prefix9: 0.980x, paired candidate delta +6.41 ns/op.
- trim/tailProbeAfter: 0.981x, paired candidate delta +6.64 ns/op.
- isBlank/empty: 0.982x, paired candidate delta +0.02 ns/op.
- stripTrailing/gateAt: 0.983x, paired candidate delta +0.53 ns/op.
- isBlank/suffix9: 0.985x, paired candidate delta +0.03 ns/op.
- strip/prefix8: 0.986x, paired candidate delta +4.21 ns/op.
- isBlank/longTrailing: 0.986x, paired candidate delta +0.03 ns/op.
- trim/shortPad: 0.986x, paired candidate delta +0.18 ns/op.
- stripLeading/utf16: 0.990x, paired candidate delta +96.87 ns/op.
- trim/lateNbsp: 0.991x, paired candidate delta +1.30 ns/op.
- linesCount/noMatch: 0.991x, paired candidate delta +4.47 ns/op.
- trim/longBlank: 0.992x, paired candidate delta +1.02 ns/op.
- strip/window: 0.993x, paired candidate delta +27.00 ns/op.
- stripTrailing/longBlank: 0.995x, paired candidate delta +0.82 ns/op.
- trim/prefix8: 0.995x, paired candidate delta +1.60 ns/op.
- linesCount/immediate: 0.996x, paired candidate delta +2.25 ns/op.
- strip/utf16: 0.997x, paired candidate delta +53.74 ns/op.
- stripTrailing/early: 0.997x, paired candidate delta +0.48 ns/op.
- isBlank/longLeading: 0.997x, paired candidate delta +0.37 ns/op.
