# StringZilla performance

The complete-image matrix compares original OpenJDK, the fork with StringZilla
enabled, and the same fork image with `-XX:-UseStringZillaIntrinsics`.

[Combined PR4/PR63 results, every measured loss and raw evidence](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/selected-20261022/RESULTS.md)
identify the exact source, image, compiler, workload and workflow hashes.
Qualification belongs to those identities. Planned cases and preceding revisions
are not measurements of the final source.

## Coverage

The preceding complete-image campaign completed 1,624 of 1,886 planned triplets
on runtime `916ba895`: 4,872 control records and 48,720 samples. Those results
diagnose the earlier dispatch and do not qualify later corrections.

The [preceding paired comparisons](https://github.com/re-thc/openjdk-jdk27u/tree/codex/stringzilla-final-artifacts/doc/stringzilla/qualification-20261019)
use a fixed focused manifest covering losing dispatch paths, bulk wins, equality,
overlaps and boundary controls. Its receipts report actual completed scope,
source, compiler and image identities; planned cases are not results.

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

Hosted Linux builds use Ubuntu 26.04 and GCC 16; Windows builds use MSVC 19.44.
Local Linux comparisons record their own GCC 16.2 build and machine profile.
The original and fork use the same pinned boot JDK, release configuration,
architecture baseline, version settings and source date. Receipts retain their
exact versions and hashes. Native tests run on executable backends; Linux native
contracts also run with address, undefined-behavior and alignment sanitizers.

The final focused protocol uses three paired rounds. Each round runs original,
enabled and disabled in rotating order, one independent JVM fork per control,
three 300 ms warmup iterations and five 300 ms measurement iterations. Every
control occupies each order position once. Processes run sequentially on one
pinned CPU with Serial GC and CDS disabled. The summary reports the median of
the three paired ratios, their range, and all control medians, means, JMH errors
and samples. Earlier campaigns retain their original two-fork 500 ms protocol.

Every measured loss remains visible against both original and disabled, including
small differences and disagreeing rounds. No noise threshold removes results.
Native-only timings are identified separately and do not establish speedups over Java.
Compilation traces are separate from timed samples.

## Evidence

The result index binds source and runtime trees, image inventories, projected
workload manifests, JVM flags, actual job conclusions, artifact digests, raw JMH
JSON and all iteration samples. The final local AVX-512 run attests the actual
runtime backend on the available host. Historical host-election receipts apply
only to their own earlier campaigns.

[Preceding complete-image results](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/measurements/e036e637/RESULTS.md)
retain all 630 diagnostic triplets.
[Earlier complete-image results](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/measurements/4592230b/README.md)
retain all 1,700 triplets from that source. Their losses and raw samples remain
available. Older patched-class campaigns and enabled-versus-enabled comparisons
are historical evidence only.
