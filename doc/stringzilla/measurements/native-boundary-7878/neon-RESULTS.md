# Native inline-boundary candidate: neon

These are native component measurements against the already-enabled production adapter at 4592230b. They do not measure Java, JIT dispatch, JNI overhead, safepoints, or original-Java performance. The isolated candidate is unpromoted.

Both native contracts and all149 independent fixture checks passed with address/undefined/alignment sanitizers before timing. All298 fixture byte hashes match the prior screen. Timing uses unsanitized code, one pinned CPU, three warmups and15 alternating samples per control; uncertainty below is SEM across those batches.

Source kernel: `7878b10e6cfbecab376d87e8b5fe638ff9b2ceb7`. Compiler: `16.0.1`.

No ARM timings were repeated. The compiled ARM candidate object is byte-identical to the previously measured combined object (`c557217a61351663df0aa423c992e98ec9dd84dfde06e7cb5ef7d03de03a7fb0`). Both native contracts and all149 sanitizer fixtures were rerun; this validates the architecture guard without duplicating old timing.
