# StringZilla performance

The complete-image matrix compares original OpenJDK, the fork with StringZilla
enabled, and the same fork image with `-XX:-UseStringZillaIntrinsics`.

[Results, every measured loss and raw evidence](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/measurements/34e3d8f9/RESULTS.md)
identify the exact source, image, compiler, workload and workflow hashes.
Qualification belongs to those identities. Planned cases and preceding revisions
are not measurements of the final source.

## Coverage

The matrix contains 1,886 backend/tier/workload triplets across 318 distinct
benchmark/parameter combinations: 5,658 control records and 56,580 iteration
samples. It includes all 630 preceding diagnostic triplets.

| Dimension | Coverage |
| --- | --- |
| Backends | x86 serial, AVX2, AVX-512; native AArch64 NEON; MSVC x64 serial |
| Execution | Interpreter, C1, C2 |
| Operations | Substring, mixed-coder and character search; equality; builder/buffer delegation |
| Inputs | Short inputs, thresholds, immediate matches, misses, repeated prefixes/suffixes, odd-byte UTF-16 occurrences and overlaps |
| AVX2 C2 span boundaries | Latin-1 needle 257 at source lengths 288/289/290; UTF-16 needle 129 at 144/145/146 |
| New dispatch boundaries | NEON reverse UTF-16 character lengths 767/768/769; bounded immediate-verification widths and failed candidates |

The [dispatch description](README.md#search-dispatch) gives the exact rules.

## Controls and method

| Control | Complete image |
| --- | --- |
| Original | Baseline `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda` |
| Enabled | Qualified fork source, default flag enabled |
| Disabled | The identical fork image with the flag disabled |

All three controls use the same benchmark classes, compiled once by the original
JDK. No patched `java.base`, class overlays or mixed runtime images are used.
Original archives are reused only after checking their immutable artifact
digests, full image inventories, source identities and matching build settings.
Fork images are rebuilt from the qualified source.

Linux builds use Ubuntu 26.04 and GCC 16; Windows builds use MSVC 19.44.
The original and fork use the same pinned boot JDK, release configuration,
architecture baseline, version settings and source date. Receipts retain their
exact versions and hashes. Native tests run on executable backends; Linux native
contracts also run with address, undefined-behavior and alignment sanitizers.

Each JMH control uses two independent JVM forks, three 500 ms warmup iterations
and five 500 ms measurement iterations. Controls run sequentially on one pinned
worker CPU, with rotating order, Serial GC and CDS disabled. The table reports
ns/op and JMH 99.9% error estimates from all ten samples.

Every higher enabled mean remains visible against both original and disabled.
Nonoverlapping reported intervals are marked separately; the marker is a
diagnostic, not a guarantee about every machine or workload. Native-only timings
are identified separately and do not establish speedups over Java.
Compilation traces are separate from timed samples.

## Evidence

The result index binds source and runtime trees, image inventories, projected
workload manifests, JVM flags, actual job conclusions, artifact digests, raw JMH
JSON and all iteration samples. AVX-512 workers prove CPU eligibility and elect
one host per tier before timing; other candidates perform no measurements.

[Preceding complete-image results](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/measurements/e036e637/RESULTS.md)
retain all 630 diagnostic triplets.
[Earlier complete-image results](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/measurements/4592230b/README.md)
retain all 1,700 triplets from that source. Their losses and raw samples remain
available. Older patched-class campaigns and enabled-versus-enabled comparisons
are historical evidence only.
