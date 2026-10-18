# Complete-image qualification at 2550a210

Runtime source: `2550a2100281b5a6d6aa7a9310a9e6b047937e2c`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

This completed cohort covers 232 manifest rows, 205 distinct benchmark/parameter inputs, 1,540 matched backend/tier triplets and 4,620 control measurements. It qualifies this recorded source; subsequent fixes require their own complete-image measurements.

[Every measured mean, error and loss](RESULTS.md). Each backend's `primary` and `tail` files retain the three controls separately; `metadata` files contain source, compiler, complete-image fingerprints, diagnostics and successful job receipts. The primary and supplemental fingerprints match for all five backends.

Units are ns/op. Each control has two forks with five measured iterations per fork. All higher enabled means are marked; overlapping intervals do not establish equivalence.

| Backend | Triplets | Higher than original | Higher than disabled |
| --- | ---: | ---: | ---: |
| serial | 238 | 68 | 74 |
| avx2 | 348 | 72 | 72 |
| avx512 | 348 | 46 | 60 |
| neon | 311 | 66 | 72 |
| msvc | 295 | 95 | 116 |

The serial backend identifies callback selection. Native compiler instruction selection follows the recorded complete-image profile; `UseAVX=0` controls HotSpot and backend selection.
