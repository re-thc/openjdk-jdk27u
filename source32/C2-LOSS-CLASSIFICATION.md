# C2 losses below 0.95x, source32 fixed study

All 44 rows are listed. Input metadata follows the benchmark first variant; all 16 variants have the same lengths and predicate positions. Size is bytes for Latin1, chars for UTF16. Native admission describes the enabled candidate, not the off control. These are path classifications, not proofs of JIT causes. Off/candidate below 1 means feature-off is faster. All-pairs means every same-round ratio loses, not statistical significance. Raw five-round values remain in the full table.

| Operation | Workload | Size | Path | Base/candidate | All pairs lose | Off/candidate | Candidate minus off ns | Off faster all pairs |
|---|---|---:|---|---:|---|---:|---:|---|
| isBlank | shortClean | 16 | immediate unchanged/nonblank Java path | 0.923 | True | 0.969 | +0.06 | False |
| linesCount | empty | 0 | empty Java path | 0.889 | False | 1.095 | -0.37 | False |
| linesCount | short | 13 | short Java path | 0.883 | True | 1.090 | -3.93 | False |
| linesFirst | immediate | 4098 | early-line Java path | 0.934 | False | 1.120 | -3.12 | False |
| linesFirst | prefix8 | 4106 | early-line Java path | 0.874 | True | 0.972 | +1.03 | False |
| linesFirst | probeAfter | 4131 | native probe edge | 0.807 | True | 0.895 | +5.40 | True |
| linesFirst | probeAt | 4130 | native probe edge | 0.743 | True | 0.855 | +8.51 | True |
| strip | empty | 0 | empty Java path | 0.859 | False | 2.167 | -1.81 | False |
| strip | nul | 4096 | immediate unchanged/nonblank Java path | 0.832 | True | 1.749 | -2.40 | False |
| strip | prefix8 | 4104 | early-match Java path | 0.894 | True | 1.039 | -16.31 | False |
| strip | probeAfter | 4129 | native probe edge | 0.772 | False | 0.812 | +78.10 | False |
| strip | probeAt | 4128 | native probe edge | 0.809 | False | 0.796 | +87.92 | False |
| strip | shortClean | 16 | immediate unchanged/nonblank Java path | 0.900 | False | 1.514 | -1.40 | False |
| strip | shortPad | 5 | short Java scan | 0.913 | True | 1.109 | -1.42 | False |
| strip | tailProbeAfter | 4129 | native probe edge | 0.872 | True | 0.851 | +53.05 | False |
| strip | tailProbeAt | 4128 | native probe edge | 0.871 | True | 0.876 | +48.79 | False |
| strip | utf16 | 8193 | UTF16 control | 0.942 | False | 1.001 | -16.81 | False |
| stripLeading | early | 4096 | early-match Java path | 0.898 | False | 1.007 | -2.45 | False |
| stripLeading | empty | 0 | empty Java path | 0.865 | False | 2.192 | -1.78 | False |
| stripLeading | prefix8 | 4104 | early-match Java path | 0.933 | False | 0.950 | +19.11 | False |
| stripLeading | prefix9 | 4105 | early-match Java path | 0.943 | False | 0.978 | +7.83 | False |
| stripLeading | probeAt | 4128 | native probe edge | 0.781 | False | 0.899 | +37.40 | False |
| stripTrailing | empty | 0 | empty Java path | 0.450 | True | 1.160 | -0.49 | False |
| stripTrailing | lateNbsp | 4097 | immediate unchanged/nonblank Java path | 0.600 | True | 1.123 | -0.41 | False |
| stripTrailing | longClean | 4096 | immediate unchanged/nonblank Java path | 0.605 | True | 1.113 | -0.35 | False |
| stripTrailing | longLeading | 4097 | immediate unchanged/nonblank Java path | 0.633 | True | 1.143 | -0.45 | False |
| stripTrailing | nul | 4096 | immediate unchanged/nonblank Java path | 0.609 | True | 1.203 | -0.62 | False |
| stripTrailing | prefix8 | 4104 | immediate unchanged/nonblank Java path | 0.650 | True | 1.275 | -0.82 | False |
| stripTrailing | prefix9 | 4105 | immediate unchanged/nonblank Java path | 0.607 | True | 1.124 | -0.41 | False |
| stripTrailing | probeAfter | 4129 | immediate unchanged/nonblank Java path | 0.613 | True | 1.140 | -0.42 | False |
| stripTrailing | probeAt | 4128 | immediate unchanged/nonblank Java path | 0.609 | True | 1.167 | -0.56 | False |
| stripTrailing | shortBlank | 16 | short Java scan | 0.800 | True | 0.865 | +2.21 | True |
| stripTrailing | shortClean | 16 | immediate unchanged/nonblank Java path | 0.626 | True | 1.220 | -0.71 | False |
| stripTrailing | tailProbeAfter | 4129 | native probe edge | 0.841 | False | 0.831 | +68.19 | False |
| stripTrailing | tailProbeAt | 4128 | native probe edge | 0.893 | False | 0.823 | +71.65 | False |
| stripTrailing | window | 131090 | immediate unchanged/nonblank Java path | 0.637 | True | 1.173 | -0.55 | False |
| trim | empty | 0 | empty Java path | 0.923 | True | 0.970 | +0.04 | False |
| trim | longClean | 4096 | immediate unchanged/nonblank Java path | 0.694 | True | 1.052 | -0.17 | False |
| trim | prefix8 | 4104 | early-match Java path | 0.880 | False | 0.980 | +6.36 | False |
| trim | probeAfter | 4129 | native probe edge | 0.934 | False | 1.042 | -13.40 | False |
| trim | probeAt | 4128 | native probe edge | 0.854 | False | 0.906 | +34.23 | False |
| trim | suffix9 | 4105 | early-match Java path | 0.931 | False | 0.995 | +1.72 | False |
| trim | tailProbeAfter | 4129 | native probe edge | 0.887 | True | 0.924 | +28.57 | False |
| trim | tailProbeAt | 4128 | native probe edge | 0.865 | False | 0.987 | +4.25 | False |

Counts by operation: {'isBlank': 1, 'linesCount': 2, 'linesFirst': 4, 'strip': 10, 'stripLeading': 5, 'stripTrailing': 14, 'trim': 8}

Counts by path: {'immediate unchanged/nonblank Java path': 14, 'empty Java path': 5, 'short Java path': 1, 'early-line Java path': 2, 'native probe edge': 13, 'early-match Java path': 6, 'short Java scan': 2, 'UTF16 control': 1}
