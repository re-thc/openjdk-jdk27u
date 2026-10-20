# C2 losses below 0.95x, final refined fixed study

All rows below 0.95x are listed. Input metadata follows the benchmark first variant; all 16 variants have the same lengths and predicate positions. Size is bytes for Latin1, chars for UTF16. Native admission describes the enabled candidate, not the off control. These are path classifications, not proofs of JIT causes. Off/candidate below 1 means feature-off is faster. All-pairs means every same-round ratio loses, not statistical significance. Raw five-round values remain in the full table.

| Operation | Workload | Size | Path | Base/candidate | All pairs lose | Off/candidate | Candidate minus off ns | Off faster all pairs | Old/candidate | Candidate minus old ns |
|---|---|---:|---|---:|---|---:|---:|---|---:|---:|
| isBlank | shortPad | 5 | short Java scan | 0.878 | False | 0.980 | +0.07 | False | 0.871 | +0.41 |
| isBlank | tailProbeAfter | 4129 | immediate unchanged/nonblank Java path | 0.929 | False | 0.993 | +0.01 | False | 0.945 | +0.11 |
| isBlank | tailProbeAt | 4128 | immediate unchanged/nonblank Java path | 0.913 | False | 0.908 | +0.20 | False | 0.961 | +0.08 |
| linesCount | empty | 0 | empty Java path | 0.870 | True | 0.915 | +0.28 | False | 0.976 | +0.09 |
| linesCount | gateBefore | 287 | short Java path | 0.921 | True | 0.970 | +3.82 | False | 0.979 | +2.59 |
| linesCount | lines16 | 4608 | early-line Java path | 0.874 | False | 0.895 | +507.34 | False | 0.962 | +183.44 |
| linesCount | short | 13 | short Java path | 0.836 | True | 0.948 | +2.34 | False | 1.020 | -0.90 |
| linesFirst | lines16 | 4608 | early-line Java path | 0.926 | True | 0.926 | +3.03 | False | 0.976 | +0.95 |
| linesFirst | probeAfter | 4131 | native probe edge | 0.789 | True | 0.825 | +9.60 | True | 1.002 | -0.09 |
| linesFirst | probeAt | 4130 | native probe edge | 0.783 | True | 0.825 | +9.44 | True | 1.007 | -0.39 |
| strip | empty | 0 | empty Java path | 0.940 | False | 0.996 | +0.01 | False | 1.139 | -0.18 |
| strip | longClean | 4096 | immediate unchanged/nonblank Java path | 0.782 | True | 0.986 | +0.05 | False | 0.834 | +0.56 |
| strip | nul | 4096 | immediate unchanged/nonblank Java path | 0.806 | True | 0.972 | +0.09 | False | 0.959 | +0.14 |
| strip | probeAfter | 4129 | native probe edge | 0.932 | False | 0.952 | +15.86 | False | 0.954 | +17.46 |
| strip | probeAt | 4128 | native probe edge | 0.934 | False | 0.924 | +25.17 | False | 1.048 | -15.94 |
| strip | shortClean | 16 | immediate unchanged/nonblank Java path | 0.874 | True | 0.993 | +0.02 | False | 0.938 | +0.17 |
| strip | shortPad | 5 | short Java scan | 0.820 | True | 0.965 | +0.55 | False | 0.847 | +2.28 |
| strip | tailProbeAt | 4128 | native probe edge | 0.916 | False | 0.907 | +30.91 | False | 0.960 | +15.34 |
| stripLeading | early | 4096 | early-match Java path | 0.893 | False | 0.996 | +1.26 | False | 0.885 | +41.15 |
| stripLeading | gateBefore | 287 | short Java scan | 0.793 | True | 0.982 | +2.37 | False | 0.796 | +26.47 |
| stripLeading | prefix8 | 4104 | early-match Java path | 0.888 | False | 1.046 | -17.40 | False | 0.914 | +29.42 |
| stripLeading | probeAfter | 4129 | native probe edge | 0.798 | False | 1.004 | -1.70 | False | 0.907 | +35.36 |
| stripLeading | probeAt | 4128 | native probe edge | 0.811 | False | 1.046 | -18.44 | False | 0.864 | +54.12 |
| stripTrailing | shortPad | 5 | short Java scan | 0.937 | False | 0.860 | +2.27 | True | 0.907 | +1.51 |
| stripTrailing | tailProbeAfter | 4129 | native probe edge | 0.896 | False | 1.033 | -13.73 | False | 0.918 | +30.08 |
| stripTrailing | tailProbeAt | 4128 | native probe edge | 0.935 | False | 0.867 | +47.70 | False | 0.933 | +23.35 |
| trim | empty | 0 | empty Java path | 0.882 | False | 1.019 | -0.02 | False | 1.019 | -0.03 |
| trim | prefix8 | 4104 | early-match Java path | 0.908 | False | 1.043 | -14.71 | False | 0.995 | +1.60 |
| trim | prefix9 | 4105 | early-match Java path | 0.928 | False | 0.971 | +10.29 | False | 0.980 | +6.41 |
| trim | probeAfter | 4129 | native probe edge | 0.870 | False | 0.985 | +4.74 | False | 0.976 | +8.61 |
| trim | probeAt | 4128 | native probe edge | 0.854 | False | 0.982 | +5.66 | False | 0.924 | +27.54 |
| trim | suffix9 | 4105 | early-match Java path | 0.917 | False | 1.034 | -9.94 | False | 0.937 | +22.76 |
| trim | tailProbeAfter | 4129 | native probe edge | 0.856 | False | 1.015 | -5.76 | False | 0.981 | +6.64 |
| trim | tailProbeAt | 4128 | native probe edge | 0.832 | False | 0.958 | +13.47 | False | 1.064 | -26.64 |

Counts by operation: {'isBlank': 3, 'linesCount': 4, 'linesFirst': 3, 'strip': 8, 'stripLeading': 5, 'stripTrailing': 3, 'trim': 8}

Counts by path: {'short Java scan': 4, 'immediate unchanged/nonblank Java path': 5, 'empty Java path': 3, 'short Java path': 2, 'early-line Java path': 2, 'native probe edge': 13, 'early-match Java path': 5}
