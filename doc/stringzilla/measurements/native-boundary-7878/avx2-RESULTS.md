# Native inline-boundary candidate: avx2

These are native component measurements against the already-enabled production adapter at 4592230b. They do not measure Java, JIT dispatch, JNI overhead, safepoints, or original-Java performance. The isolated candidate is unpromoted.

Both native contracts and all149 independent fixture checks passed with address/undefined/alignment sanitizers before timing. All298 fixture byte hashes match the prior screen. Timing uses unsanitized code, one pinned CPU, three warmups and15 alternating samples per control; uncertainty below is SEM across those batches.

Source kernel: `7878b10e6cfbecab376d87e8b5fe638ff9b2ceb7`. Compiler: `16.0.1`.

| Case | H/N units | Baseline459 ns ± SEM | Candidate ns ± SEM | Baseline/candidate | Candidate change | Higher mean |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| latin-immediate | 4096/4 | 13.085 ± 0.292 | 13.220 ± 0.396 | 0.990× | 1.03% | yes |
| latin-64-immediate | 4096/64 | 68.713 ± 0.040 | 68.696 ± 0.053 | 1.000× | -0.03% | — |
| latin-overlap-258 | 258/257 | 14.306 ± 0.053 | 15.651 ± 0.047 | 0.914× | 9.40% | yes |
| latin-period2 | 4096/512 | 416.132 ± 0.897 | 576.496 ± 1.191 | 0.722× | 38.54% | yes |
| latin-period3 | 4095/513 | 422.584 ± 1.683 | 581.870 ± 0.808 | 0.726× | 37.69% | yes |
| utf16-512-9-end | 512/9 | 13.852 ± 0.028 | 13.857 ± 0.034 | 1.000× | 0.04% | yes |
| utf16-64-immediate | 4096/64 | 16.180 ± 0.017 | 16.774 ± 0.028 | 0.965× | 3.67% | yes |
| utf16-overlap-bulk | 2048/257 | 416.218 ± 0.792 | 151.905 ± 0.666 | 2.740× | -63.50% | — |
| utf16-period3 | 2047/257 | 11602.073 ± 13.454 | 157.899 ± 0.884 | 73.478× | -98.64% | — |
| extra-utf16-odd-512-32-end | 512/32 | 16.319 ± 0.031 | 16.073 ± 0.035 | 1.015× | -1.50% | — |

Every measured higher candidate mean is retained. This small fixed set qualifies only the new x86 helper-boundary correction; it does not replace the wider native screen or whole-JDK original/enabled/disabled controls.
