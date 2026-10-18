# Native inline-boundary candidate: serial

These are native component measurements against the already-enabled production adapter at 4592230b. They do not measure Java, JIT dispatch, JNI overhead, safepoints, or original-Java performance. The isolated candidate is unpromoted.

Both native contracts and all149 independent fixture checks passed with address/undefined/alignment sanitizers before timing. All298 fixture byte hashes match the prior screen. Timing uses unsanitized code, one pinned CPU, three warmups and15 alternating samples per control; uncertainty below is SEM across those batches.

Source kernel: `7878b10e6cfbecab376d87e8b5fe638ff9b2ceb7`. Compiler: `16.0.1`.

| Case | H/N units | Baseline459 ns ± SEM | Candidate ns ± SEM | Baseline/candidate | Candidate change | Higher mean |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| latin-immediate | 4096/4 | 10.989 ± 0.061 | 11.867 ± 0.009 | 0.926× | 8.00% | yes |
| latin-64-immediate | 4096/64 | 33.995 ± 0.175 | 34.853 ± 0.228 | 0.975× | 2.52% | yes |
| latin-overlap-258 | 258/257 | 177.484 ± 0.136 | 97.744 ± 0.155 | 1.816× | -44.93% | — |
| latin-period2 | 4096/512 | 1154.458 ± 1.010 | 1003.143 ± 1.580 | 1.151× | -13.11% | — |
| latin-period3 | 4095/513 | 1151.765 ± 1.015 | 995.826 ± 1.044 | 1.157× | -13.54% | — |
| utf16-512-9-end | 512/9 | 11.903 ± 0.019 | 12.046 ± 0.014 | 0.988× | 1.20% | yes |
| utf16-64-immediate | 4096/64 | 33.010 ± 0.074 | 34.211 ± 0.061 | 0.965× | 3.64% | yes |
| utf16-overlap-bulk | 2048/257 | 495.126 ± 0.435 | 1183.494 ± 0.336 | 0.418× | 139.03% | yes |
| utf16-period3 | 2047/257 | 7283.897 ± 16.176 | 1196.737 ± 3.221 | 6.086× | -83.57% | — |
| extra-utf16-odd-512-32-end | 512/32 | 19.616 ± 0.068 | 20.528 ± 0.180 | 0.956× | 4.65% | yes |

Every measured higher candidate mean is retained. This small fixed set qualifies only the new x86 helper-boundary correction; it does not replace the wider native screen or whole-JDK original/enabled/disabled controls.
