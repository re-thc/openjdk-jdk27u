# c2-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 7.51 | 4.22 | 4.02 | 1.779 | 1.330..1.965 | 0.926 |
| isBlank | empty | 5 | 1.36 | 1.35 | 1.38 | 1.019 | 0.979..1.109 | 1.010 |
| isBlank | gateAt | 5 | 257.48 | 23.92 | 184.39 | 10.801 | 6.942..11.504 | 7.550 |
| isBlank | gateBefore | 5 | 254.25 | 98.97 | 187.49 | 2.548 | 1.576..2.702 | 1.778 |
| isBlank | lateNbsp | 5 | 3659.32 | 140.70 | 2013.25 | 25.132 | 20.852..28.985 | 13.850 |
| isBlank | longBlank | 5 | 3231.55 | 138.75 | 1973.02 | 23.322 | 21.262..24.602 | 14.854 |
| isBlank | longBoth | 5 | 3922.01 | 144.44 | 2080.06 | 26.802 | 19.197..29.415 | 13.946 |
| isBlank | longClean | 5 | 1.94 | 1.94 | 2.14 | 1.001 | 0.918..1.093 | 1.070 |
| isBlank | longLeading | 5 | 3539.05 | 139.96 | 1987.88 | 25.038 | 19.724..29.946 | 14.396 |
| isBlank | longTrailing | 5 | 1.90 | 1.94 | 2.03 | 0.979 | 0.894..1.025 | 1.010 |
| isBlank | nul | 5 | 1.94 | 1.93 | 2.10 | 1.029 | 0.696..1.123 | 1.056 |
| isBlank | prefix8 | 5 | 8.54 | 4.53 | 4.72 | 1.879 | 1.397..1.957 | 1.042 |
| isBlank | prefix9 | 5 | 9.21 | 4.34 | 4.49 | 2.124 | 1.379..2.673 | 1.036 |
| isBlank | probeAfter | 5 | 29.88 | 17.42 | 11.81 | 1.786 | 1.215..1.833 | 0.668 |
| isBlank | probeAt | 5 | 28.49 | 17.65 | 12.08 | 1.664 | 1.044..1.735 | 0.657 |
| isBlank | shortBlank | 5 | 22.09 | 22.80 | 22.08 | 0.984 | 0.886..0.989 | 0.979 |
| isBlank | shortClean | 5 | 1.90 | 2.10 | 2.07 | 0.923 | 0.885..0.951 | 0.969 |
| isBlank | shortPad | 5 | 2.91 | 2.89 | 2.92 | 1.010 | 0.837..1.072 | 1.012 |
| isBlank | suffix8 | 5 | 1.98 | 1.84 | 1.92 | 1.089 | 0.933..1.147 | 1.047 |
| isBlank | suffix9 | 5 | 1.99 | 1.98 | 1.92 | 1.040 | 0.871..1.097 | 0.948 |
| isBlank | tailProbeAfter | 5 | 1.93 | 1.98 | 2.17 | 0.963 | 0.926..1.027 | 1.041 |
| isBlank | tailProbeAt | 5 | 1.96 | 2.02 | 2.08 | 0.983 | 0.891..1.020 | 1.027 |
| isBlank | utf16 | 5 | 8478.28 | 7471.41 | 7798.22 | 1.082 | 0.965..1.358 | 0.986 |
| isBlank | window | 5 | 114101.58 | 3835.09 | 47649.10 | 30.072 | 19.546..35.475 | 11.579 |
| linesCount | dense | 5 | 12170.22 | 12230.09 | 14811.64 | 0.960 | 0.913..1.101 | 1.228 |
| linesCount | empty | 5 | 3.27 | 3.82 | 4.26 | 0.889 | 0.782..1.363 | 1.095 |
| linesCount | gateAt | 5 | 117.05 | 58.30 | 138.93 | 2.084 | 1.694..2.202 | 2.374 |
| linesCount | gateBefore | 5 | 116.65 | 121.91 | 154.61 | 0.957 | 0.864..0.967 | 1.190 |
| linesCount | immediate | 5 | 1748.09 | 555.94 | 2054.15 | 3.172 | 2.691..3.443 | 3.345 |
| linesCount | lines128 | 5 | 14799.41 | 9616.70 | 16676.01 | 1.539 | 1.431..1.620 | 1.737 |
| linesCount | lines16 | 5 | 4439.64 | 4494.45 | 4944.09 | 0.988 | 0.960..1.050 | 1.121 |
| linesCount | lines80 | 5 | 10320.02 | 8593.02 | 11524.63 | 1.184 | 1.109..1.215 | 1.347 |
| linesCount | longLines | 5 | 7035.51 | 2011.25 | 7774.00 | 3.432 | 3.152..3.739 | 4.066 |
| linesCount | noMatch | 5 | 1837.69 | 517.26 | 1939.69 | 3.442 | 2.890..3.636 | 3.578 |
| linesCount | prefix8 | 5 | 1769.55 | 539.31 | 1886.29 | 3.358 | 3.093..3.571 | 3.461 |
| linesCount | prefix9 | 5 | 1760.82 | 545.79 | 2016.81 | 3.211 | 3.011..3.528 | 3.526 |
| linesCount | probeAfter | 5 | 1822.28 | 573.90 | 1932.57 | 3.193 | 2.931..3.442 | 3.342 |
| linesCount | probeAt | 5 | 1762.76 | 586.77 | 1892.28 | 3.101 | 2.925..3.336 | 3.380 |
| linesCount | short | 5 | 39.87 | 45.08 | 48.85 | 0.883 | 0.719..0.963 | 1.090 |
| linesCount | utf16 | 5 | 8410.63 | 8535.44 | 10708.12 | 0.985 | 0.736..1.576 | 1.180 |
| linesCount | windowCRLF | 5 | 59135.53 | 16471.59 | 64531.11 | 3.581 | 3.289..3.776 | 3.835 |
| linesFirst | dense | 5 | 32.71 | 33.83 | 36.89 | 0.963 | 0.903..0.993 | 1.054 |
| linesFirst | empty | 5 | 18.61 | 19.62 | 20.07 | 0.986 | 0.887..1.036 | 1.074 |
| linesFirst | gateAt | 5 | 134.27 | 65.93 | 146.03 | 2.060 | 1.900..2.321 | 2.197 |
| linesFirst | gateBefore | 5 | 137.31 | 132.59 | 143.19 | 1.016 | 0.965..1.106 | 1.080 |
| linesFirst | immediate | 5 | 25.32 | 26.39 | 29.20 | 0.934 | 0.869..1.032 | 1.120 |
| linesFirst | lines128 | 5 | 77.84 | 56.65 | 85.03 | 1.395 | 1.341..1.416 | 1.528 |
| linesFirst | lines16 | 5 | 38.05 | 40.04 | 44.20 | 0.950 | 0.865..1.025 | 0.977 |
| linesFirst | lines80 | 5 | 59.35 | 55.42 | 68.42 | 1.050 | 0.950..1.089 | 1.133 |
| linesFirst | longLines | 5 | 1856.00 | 571.62 | 1989.91 | 3.342 | 3.071..3.599 | 3.520 |
| linesFirst | noMatch | 5 | 1949.60 | 518.08 | 1971.26 | 3.538 | 3.260..3.889 | 3.813 |
| linesFirst | prefix8 | 5 | 34.56 | 38.87 | 40.88 | 0.874 | 0.442..0.963 | 0.972 |
| linesFirst | prefix9 | 5 | 35.32 | 37.30 | 39.52 | 0.967 | 0.792..1.008 | 1.024 |
| linesFirst | probeAfter | 5 | 44.82 | 53.74 | 46.22 | 0.807 | 0.772..0.868 | 0.895 |
| linesFirst | probeAt | 5 | 40.99 | 56.91 | 49.06 | 0.743 | 0.699..0.755 | 0.855 |
| linesFirst | short | 5 | 34.59 | 34.25 | 37.43 | 0.978 | 0.956..1.010 | 1.093 |
| linesFirst | utf16 | 5 | 2222.88 | 2202.85 | 2447.40 | 1.038 | 0.896..1.092 | 1.104 |
| linesFirst | windowCRLF | 5 | 29568.94 | 7946.11 | 31850.85 | 3.781 | 3.340..4.019 | 4.093 |
| strip | early | 5 | 1221.97 | 161.00 | 935.02 | 8.118 | 7.587..8.603 | 5.807 |
| strip | empty | 5 | 1.24 | 1.48 | 3.33 | 0.859 | 0.777..1.031 | 2.167 |
| strip | gateAt | 5 | 176.84 | 28.27 | 100.04 | 6.545 | 6.172..6.933 | 3.710 |
| strip | gateBefore | 5 | 174.93 | 98.46 | 100.59 | 1.780 | 1.704..2.208 | 1.024 |
| strip | lateNbsp | 5 | 3139.71 | 140.49 | 1914.64 | 22.753 | 21.251..25.611 | 13.231 |
| strip | longBlank | 5 | 3210.67 | 132.89 | 1897.39 | 24.217 | 22.264..28.729 | 14.278 |
| strip | longBoth | 5 | 4992.23 | 291.01 | 3720.75 | 17.466 | 16.810..18.684 | 12.723 |
| strip | longClean | 5 | 2.78 | 2.83 | 4.21 | 0.958 | 0.854..1.164 | 1.511 |
| strip | longLeading | 5 | 3196.73 | 145.22 | 1789.62 | 21.924 | 19.269..23.704 | 12.311 |
| strip | longTrailing | 5 | 1966.00 | 155.33 | 2026.49 | 12.657 | 11.542..13.896 | 12.755 |
| strip | nul | 5 | 2.64 | 3.21 | 5.79 | 0.832 | 0.754..0.877 | 1.749 |
| strip | prefix8 | 5 | 292.04 | 347.44 | 358.55 | 0.894 | 0.748..0.955 | 1.039 |
| strip | prefix9 | 5 | 320.16 | 355.41 | 356.65 | 0.988 | 0.804..1.008 | 1.091 |
| strip | probeAfter | 5 | 320.48 | 413.53 | 337.24 | 0.772 | 0.728..1.047 | 0.812 |
| strip | probeAt | 5 | 323.78 | 406.92 | 347.90 | 0.809 | 0.741..1.055 | 0.796 |
| strip | shortBlank | 5 | 14.89 | 10.06 | 10.62 | 1.477 | 1.350..1.660 | 1.055 |
| strip | shortClean | 5 | 2.44 | 2.70 | 4.11 | 0.900 | 0.858..1.075 | 1.514 |
| strip | shortPad | 5 | 12.79 | 13.66 | 16.58 | 0.913 | 0.870..0.989 | 1.109 |
| strip | suffix8 | 5 | 328.17 | 369.09 | 355.11 | 0.952 | 0.843..1.127 | 0.985 |
| strip | suffix9 | 5 | 313.20 | 346.90 | 358.05 | 0.960 | 0.770..1.090 | 0.927 |
| strip | tailProbeAfter | 5 | 315.03 | 397.16 | 343.51 | 0.872 | 0.720..0.935 | 0.851 |
| strip | tailProbeAt | 5 | 301.00 | 410.82 | 359.84 | 0.871 | 0.700..0.919 | 0.876 |
| strip | utf16 | 5 | 14694.97 | 15479.09 | 15485.54 | 0.942 | 0.925..1.169 | 1.001 |
| strip | window | 5 | 78416.07 | 3708.84 | 43277.37 | 21.189 | 20.130..21.466 | 11.669 |
| stripLeading | early | 5 | 328.94 | 359.18 | 361.63 | 0.898 | 0.795..1.121 | 1.007 |
| stripLeading | empty | 5 | 1.28 | 1.49 | 3.27 | 0.865 | 0.848..1.052 | 2.192 |
| stripLeading | gateAt | 5 | 98.40 | 32.38 | 113.70 | 3.027 | 2.804..3.499 | 3.536 |
| stripLeading | gateBefore | 5 | 101.93 | 102.19 | 107.10 | 0.968 | 0.941..1.065 | 1.056 |
| stripLeading | lateNbsp | 5 | 2612.07 | 144.33 | 1868.86 | 17.587 | 15.052..20.195 | 12.863 |
| stripLeading | longBlank | 5 | 2633.75 | 135.42 | 1849.38 | 19.148 | 17.518..22.397 | 13.962 |
| stripLeading | longBoth | 5 | 2526.74 | 532.05 | 2315.75 | 4.943 | 4.371..6.507 | 4.291 |
| stripLeading | longClean | 5 | 1.95 | 1.74 | 3.15 | 1.133 | 1.069..1.381 | 1.808 |
| stripLeading | longLeading | 5 | 2514.85 | 140.40 | 1870.06 | 16.960 | 14.602..22.050 | 12.561 |
| stripLeading | longTrailing | 5 | 1.98 | 1.76 | 3.30 | 1.123 | 1.032..1.184 | 1.943 |
| stripLeading | nul | 5 | 2.04 | 1.76 | 3.20 | 1.183 | 0.954..1.395 | 1.819 |
| stripLeading | prefix8 | 5 | 330.94 | 358.74 | 361.59 | 0.933 | 0.774..1.011 | 0.950 |
| stripLeading | prefix9 | 5 | 317.67 | 349.50 | 341.67 | 0.943 | 0.714..1.080 | 0.978 |
| stripLeading | probeAfter | 5 | 357.83 | 374.74 | 379.27 | 1.028 | 0.751..1.111 | 0.999 |
| stripLeading | probeAt | 5 | 309.74 | 391.35 | 340.13 | 0.781 | 0.728..1.102 | 0.899 |
| stripLeading | shortBlank | 5 | 13.03 | 12.83 | 13.08 | 1.015 | 0.946..1.323 | 0.986 |
| stripLeading | shortClean | 5 | 2.10 | 1.76 | 3.26 | 1.201 | 1.074..1.262 | 1.886 |
| stripLeading | shortPad | 5 | 13.51 | 12.46 | 14.92 | 1.058 | 0.632..1.211 | 1.079 |
| stripLeading | suffix8 | 5 | 1.88 | 1.82 | 3.02 | 1.041 | 0.756..1.160 | 1.599 |
| stripLeading | suffix9 | 5 | 1.85 | 1.78 | 3.14 | 1.055 | 1.027..1.165 | 1.788 |
| stripLeading | tailProbeAfter | 5 | 1.89 | 1.77 | 3.20 | 1.078 | 1.034..1.186 | 1.836 |
| stripLeading | tailProbeAt | 5 | 2.04 | 1.78 | 3.31 | 1.145 | 1.020..1.194 | 1.862 |
| stripLeading | utf16 | 5 | 11560.04 | 9117.73 | 9304.11 | 1.269 | 1.124..1.284 | 0.954 |
| stripLeading | window | 5 | 40572.59 | 3669.98 | 40713.26 | 10.714 | 10.182..11.814 | 11.063 |
| stripTrailing | early | 5 | 2493.92 | 150.11 | 1907.87 | 16.614 | 14.838..19.244 | 13.050 |
| stripTrailing | empty | 5 | 1.35 | 3.01 | 3.53 | 0.450 | 0.374..0.513 | 1.160 |
| stripTrailing | gateAt | 5 | 171.88 | 33.83 | 131.43 | 4.969 | 4.033..5.843 | 3.783 |
| stripTrailing | gateBefore | 5 | 175.00 | 179.73 | 140.98 | 0.980 | 0.921..1.091 | 0.784 |
| stripTrailing | lateNbsp | 5 | 1.93 | 3.25 | 3.72 | 0.600 | 0.485..0.647 | 1.123 |
| stripTrailing | longBlank | 5 | 2480.26 | 152.04 | 2255.24 | 16.434 | 14.806..17.023 | 15.265 |
| stripTrailing | longBoth | 5 | 2839.50 | 541.53 | 2708.49 | 5.360 | 4.998..6.032 | 5.074 |
| stripTrailing | longClean | 5 | 2.06 | 3.54 | 3.85 | 0.605 | 0.569..0.648 | 1.113 |
| stripTrailing | longLeading | 5 | 1.99 | 3.18 | 3.64 | 0.633 | 0.575..0.695 | 1.143 |
| stripTrailing | longTrailing | 5 | 2410.12 | 156.95 | 2143.36 | 15.187 | 13.947..16.059 | 13.769 |
| stripTrailing | nul | 5 | 1.94 | 3.13 | 3.68 | 0.609 | 0.606..0.693 | 1.203 |
| stripTrailing | prefix8 | 5 | 2.06 | 3.12 | 3.80 | 0.650 | 0.625..0.692 | 1.275 |
| stripTrailing | prefix9 | 5 | 1.99 | 3.27 | 3.68 | 0.607 | 0.573..0.674 | 1.124 |
| stripTrailing | probeAfter | 5 | 1.96 | 3.19 | 3.60 | 0.613 | 0.576..0.664 | 1.140 |
| stripTrailing | probeAt | 5 | 2.01 | 3.29 | 3.76 | 0.609 | 0.559..0.669 | 1.167 |
| stripTrailing | shortBlank | 5 | 13.12 | 16.41 | 14.23 | 0.800 | 0.713..0.890 | 0.865 |
| stripTrailing | shortClean | 5 | 2.04 | 3.09 | 3.91 | 0.626 | 0.581..0.692 | 1.220 |
| stripTrailing | shortPad | 5 | 14.52 | 14.24 | 14.98 | 1.019 | 0.807..1.086 | 1.047 |
| stripTrailing | suffix8 | 5 | 345.55 | 373.31 | 326.13 | 0.990 | 0.907..1.038 | 0.989 |
| stripTrailing | suffix9 | 5 | 327.64 | 368.09 | 344.31 | 0.979 | 0.702..1.035 | 0.931 |
| stripTrailing | tailProbeAfter | 5 | 319.36 | 403.87 | 333.48 | 0.841 | 0.730..1.029 | 0.831 |
| stripTrailing | tailProbeAt | 5 | 327.01 | 404.60 | 329.98 | 0.893 | 0.743..1.047 | 0.823 |
| stripTrailing | utf16 | 5 | 11403.23 | 8482.24 | 11190.73 | 1.356 | 1.213..1.405 | 1.393 |
| stripTrailing | window | 5 | 1.96 | 3.12 | 3.74 | 0.637 | 0.594..0.657 | 1.173 |
| trim | early | 5 | 1323.76 | 170.36 | 784.30 | 7.867 | 6.878..13.429 | 4.726 |
| trim | empty | 5 | 1.27 | 1.38 | 1.34 | 0.923 | 0.872..0.974 | 0.970 |
| trim | gateAt | 5 | 169.49 | 27.26 | 122.99 | 5.941 | 3.323..6.745 | 4.512 |
| trim | gateBefore | 5 | 170.26 | 133.06 | 132.66 | 1.256 | 0.675..1.380 | 0.995 |
| trim | lateNbsp | 5 | 2474.92 | 144.65 | 1841.40 | 17.109 | 7.846..19.168 | 12.389 |
| trim | longBlank | 5 | 2386.43 | 129.52 | 1787.90 | 18.689 | 8.768..19.159 | 13.841 |
| trim | longBoth | 5 | 3652.09 | 307.38 | 2522.41 | 11.534 | 7.495..14.723 | 7.945 |
| trim | longClean | 5 | 2.41 | 3.44 | 3.59 | 0.694 | 0.654..0.724 | 1.052 |
| trim | longLeading | 5 | 2488.18 | 140.16 | 1879.43 | 17.310 | 7.341..19.489 | 13.340 |
| trim | longTrailing | 5 | 1254.37 | 161.21 | 820.13 | 7.752 | 7.153..9.090 | 5.085 |
| trim | nul | 5 | 2416.59 | 140.13 | 1830.32 | 16.405 | 8.169..19.048 | 12.284 |
| trim | prefix8 | 5 | 312.45 | 333.95 | 317.31 | 0.880 | 0.661..1.045 | 0.980 |
| trim | prefix9 | 5 | 313.91 | 334.23 | 323.57 | 0.962 | 0.829..0.994 | 0.956 |
| trim | probeAfter | 5 | 337.00 | 366.98 | 358.08 | 0.934 | 0.730..1.461 | 1.042 |
| trim | probeAt | 5 | 341.87 | 364.28 | 330.04 | 0.854 | 0.788..1.022 | 0.906 |
| trim | shortBlank | 5 | 10.19 | 9.24 | 9.15 | 1.103 | 1.036..1.325 | 0.987 |
| trim | shortClean | 5 | 2.37 | 1.85 | 1.90 | 1.278 | 1.160..1.340 | 1.023 |
| trim | shortPad | 5 | 13.04 | 13.41 | 13.56 | 0.992 | 0.862..1.054 | 1.011 |
| trim | suffix8 | 5 | 334.22 | 340.21 | 348.34 | 0.975 | 0.850..1.301 | 1.024 |
| trim | suffix9 | 5 | 324.83 | 340.62 | 338.91 | 0.931 | 0.847..1.219 | 0.995 |
| trim | tailProbeAfter | 5 | 327.12 | 379.13 | 380.93 | 0.887 | 0.657..0.902 | 0.924 |
| trim | tailProbeAt | 5 | 321.23 | 371.53 | 344.40 | 0.865 | 0.707..1.407 | 0.987 |
| trim | utf16 | 5 | 3.24 | 1.79 | 1.96 | 1.843 | 0.926..1.884 | 1.087 |
| trim | window | 5 | 77581.81 | 3831.77 | 57000.63 | 19.409 | 8.891..23.626 | 14.260 |

## Every measured paired loss

- stripTrailing/empty: 0.450x, paired candidate delta +1.65 ns/op.
- stripTrailing/lateNbsp: 0.600x, paired candidate delta +1.29 ns/op.
- stripTrailing/longClean: 0.605x, paired candidate delta +1.37 ns/op.
- stripTrailing/prefix9: 0.607x, paired candidate delta +1.29 ns/op.
- stripTrailing/nul: 0.609x, paired candidate delta +1.23 ns/op.
- stripTrailing/probeAt: 0.609x, paired candidate delta +1.29 ns/op.
- stripTrailing/probeAfter: 0.613x, paired candidate delta +1.23 ns/op.
- stripTrailing/shortClean: 0.626x, paired candidate delta +1.14 ns/op.
- stripTrailing/longLeading: 0.633x, paired candidate delta +1.13 ns/op.
- stripTrailing/window: 0.637x, paired candidate delta +1.14 ns/op.
- stripTrailing/prefix8: 0.650x, paired candidate delta +1.11 ns/op.
- trim/longClean: 0.694x, paired candidate delta +1.03 ns/op.
- linesFirst/probeAt: 0.743x, paired candidate delta +14.94 ns/op.
- strip/probeAfter: 0.772x, paired candidate delta +94.85 ns/op.
- stripLeading/probeAt: 0.781x, paired candidate delta +85.68 ns/op.
- stripTrailing/shortBlank: 0.800x, paired candidate delta +3.15 ns/op.
- linesFirst/probeAfter: 0.807x, paired candidate delta +10.04 ns/op.
- strip/probeAt: 0.809x, paired candidate delta +71.04 ns/op.
- strip/nul: 0.832x, paired candidate delta +0.53 ns/op.
- stripTrailing/tailProbeAfter: 0.841x, paired candidate delta +69.24 ns/op.
- trim/probeAt: 0.854x, paired candidate delta +51.90 ns/op.
- strip/empty: 0.859x, paired candidate delta +0.20 ns/op.
- trim/tailProbeAt: 0.865x, paired candidate delta +50.30 ns/op.
- stripLeading/empty: 0.865x, paired candidate delta +0.20 ns/op.
- strip/tailProbeAt: 0.871x, paired candidate delta +50.37 ns/op.
- strip/tailProbeAfter: 0.872x, paired candidate delta +50.67 ns/op.
- linesFirst/prefix8: 0.874x, paired candidate delta +5.03 ns/op.
- trim/prefix8: 0.880x, paired candidate delta +39.36 ns/op.
- linesCount/short: 0.883x, paired candidate delta +5.48 ns/op.
- trim/tailProbeAfter: 0.887x, paired candidate delta +46.18 ns/op.
- linesCount/empty: 0.889x, paired candidate delta +0.41 ns/op.
- stripTrailing/tailProbeAt: 0.893x, paired candidate delta +45.69 ns/op.
- strip/prefix8: 0.894x, paired candidate delta +36.88 ns/op.
- stripLeading/early: 0.898x, paired candidate delta +36.80 ns/op.
- strip/shortClean: 0.900x, paired candidate delta +0.27 ns/op.
- strip/shortPad: 0.913x, paired candidate delta +1.15 ns/op.
- trim/empty: 0.923x, paired candidate delta +0.11 ns/op.
- isBlank/shortClean: 0.923x, paired candidate delta +0.17 ns/op.
- trim/suffix9: 0.931x, paired candidate delta +22.79 ns/op.
- stripLeading/prefix8: 0.933x, paired candidate delta +25.86 ns/op.
- trim/probeAfter: 0.934x, paired candidate delta +27.55 ns/op.
- linesFirst/immediate: 0.934x, paired candidate delta +1.72 ns/op.
- strip/utf16: 0.942x, paired candidate delta +894.94 ns/op.
- stripLeading/prefix9: 0.943x, paired candidate delta +20.03 ns/op.
- linesFirst/lines16: 0.950x, paired candidate delta +1.99 ns/op.
- strip/suffix8: 0.952x, paired candidate delta +17.06 ns/op.
- linesCount/gateBefore: 0.957x, paired candidate delta +5.26 ns/op.
- strip/longClean: 0.958x, paired candidate delta +0.12 ns/op.
- linesCount/dense: 0.960x, paired candidate delta +494.29 ns/op.
- strip/suffix9: 0.960x, paired candidate delta +12.17 ns/op.
- trim/prefix9: 0.962x, paired candidate delta +12.77 ns/op.
- isBlank/tailProbeAfter: 0.963x, paired candidate delta +0.07 ns/op.
- linesFirst/dense: 0.963x, paired candidate delta +1.27 ns/op.
- linesFirst/prefix9: 0.967x, paired candidate delta +1.20 ns/op.
- stripLeading/gateBefore: 0.968x, paired candidate delta +3.16 ns/op.
- trim/suffix8: 0.975x, paired candidate delta +7.66 ns/op.
- linesFirst/short: 0.978x, paired candidate delta +0.73 ns/op.
- isBlank/longTrailing: 0.979x, paired candidate delta +0.04 ns/op.
- stripTrailing/suffix9: 0.979x, paired candidate delta +7.00 ns/op.
- stripTrailing/gateBefore: 0.980x, paired candidate delta +3.82 ns/op.
- isBlank/tailProbeAt: 0.983x, paired candidate delta +0.03 ns/op.
- isBlank/shortBlank: 0.984x, paired candidate delta +0.35 ns/op.
- linesCount/utf16: 0.985x, paired candidate delta +124.81 ns/op.
- linesFirst/empty: 0.986x, paired candidate delta +0.25 ns/op.
- linesCount/lines16: 0.988x, paired candidate delta +54.81 ns/op.
- strip/prefix9: 0.988x, paired candidate delta +3.54 ns/op.
- stripTrailing/suffix8: 0.990x, paired candidate delta +3.82 ns/op.
- trim/shortPad: 0.992x, paired candidate delta +0.11 ns/op.
