# Initial 32-byte-probe candidate: fixed-study assessment

Runtime source a5576dd33ea9bd905ffc0b84b158cb57d6a0b133, assertions4aa7d23.
All three configurations completed five alternating baseline/candidate/off
rounds, each row using three 100 ms measurements after two 100 ms warmups.

| Configuration | Rows | Median ratios below 1 | Below 0.95 | isBlank/longBlank | trim/longBlank | linesCount/noMatch |
|---|---:|---:|---:|---:|---:|---:|
| C2 AVX2 |154|68|44|23.322x|18.689x|3.442x|
| C1 AVX2 |77|26|18|27.066x|19.613x|5.759x|
| Interpreter AVX2 |77|25|17|95.472x|40.778x|27.790x|

Counts describe the measured rows, not an application distribution or aggregate
benefit. All raw samples and every loss remain in the tables. Cold validation
requires all 378 samples; its 14 operation/input summaries retain call and full
process latency separately. Long first-call API medians generally improved;
some empty operations lost fractions of a microsecond and paired ranges were
wide. These do not isolate StringZilla initialization or cold disk startup.

The 44 C2 rows below 0.95x classify into 13 native probe-edge calls and 31 paths that
cannot incur native setup. Independent review confirmed the classification.
Twelve of 13 native-edge cases also lost against same-image feature-off; the
other 31 need separate Java/profile analysis. Unchanged/empty stripTrailing and
clean trim repeatedly cost about 1–2 ns. Allocating probe-edge median costs were
roughly 45–95 ns. The full classification retains operation, size, path, off
comparison, and whether all five pairs lost.

A selected-case compilation diagnostic shows both baseline and candidate trim
and reverse-whitespace helpers inline hot. Thus a missed inline is not proven
as the cause. The diagnostic is not a performance qualification and has its
own commands/logs. Reducing duplicated loop bodies and merge paths remains a
testable code-shape hypothesis.

The next planned refinement shares one scalar loop between short fallback and
the 32-byte probe, with explicit immediate exits and private DontInline
continuations only after 32 successful probes. It preserves thresholds and
keeps 7/8/9-byte matches out of the added calls. It does not move the admission
cliff to fit the measured boundary. A preserved source32 image supplies a
direct additional C2 control for the one planned fixed refinement study.

The preserved image exactly matches all four runtime-file hashes captured
before testing. make test refreshed release metadata at 03:14 UTC after the
pre-test capture; source32-image-identity.json retains the actual post-test
release text/hash and the original receipt. Runtime modules/libraries did not
change. Normal tests passed 98 String + 29 intrinsic descriptions, with 2 skips.
