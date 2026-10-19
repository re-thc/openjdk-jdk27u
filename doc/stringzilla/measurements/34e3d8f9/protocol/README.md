# Benchmark protocol

The qualification uses complete original `416d7db3` and fork `916ba895` images. Enabled and disabled controls use the same fork image; no patched classes are used. The production code is identical to `34e3d8f9`. The later PR head `c73d3586` changes only a native test range guard.

The frozen workload set contains **1,886 unique backend/tier/input triplets**: 1,828 stock-manifest cases, 30 periodic controls and 28 UTF-16 negative controls. Each triplet runs original/enabled/disabled sequentially on one host, with two forks, three 500 ms warmups and five 500 ms measurements per fork. Every control retains its ten samples, score, error and original JMH JSON binding. Compilation diagnostics are separate from timing evidence.

The matched inherited release profiles are Linux x64 `-march=x86-64-v3 -mtune=generic`, Linux ARM64 `-march=armv8.2-a -mtune=generic`, and MSVC `/arch:AVX2`. “Serial” names the selected library backend and can contain compiler-generated SIMD.

[PROTOCOL.json](PROTOCOL.json) records immutable commit/path/blob and SHA-256 bindings for the 351-row manifest, frozen measurement helpers, external periodic/UTF-16 fixtures, three Java microbenchmark classes, planned key sets and all 45 backend/tier/phase projections. Each `model-*.json` contains the exact projected TSV bytes and expected physical keys. The model's original run/head identifies protocol preparation; actual result receipts bind each tier to its recorded consumer run and validated producer pair.

The protocol index describes the fixed experiment. Completion and performance conclusions require the separately accepted result receipts and saved original JMH files.
