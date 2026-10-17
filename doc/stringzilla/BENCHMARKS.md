# StringZilla benchmarks

Qualification compares runtime source `2550a2100281b5a6d6aa7a9310a9e6b047937e2c`
with original fork baseline `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

## Method

Each host compares three controls: an untouched complete original JDK, the complete
fork with acceleration enabled, and that same fork image with
`-XX:-UseStringZillaIntrinsics`. The original and fork are built with matched
GCC/G++ 16 or MSVC 19.44 profiles, source date and version options. Measurements
use two forks, three 500 ms warmup iterations and five 500 ms measurement iterations
per fork, Serial GC, disabled CDS and one CPU affinity. Control order rotates.
The runner fingerprints complete images and the compiled benchmark harness before
and after measurement; it checks compiler settings and attests selected backends.

The frozen [220-row primary specification](https://github.com/re-thc/openjdk-jdk27u/blob/2550a2100281b5a6d6aa7a9310a9e6b047937e2c/doc/stringzilla/native-cases.tsv)
contains 1,404 matched triplets across serial, AVX2, AVX-512, native ARM64/NEON and
MSVC serial controls. The [combined reproduction specification](native-cases.tsv)
includes the supplemental controls below.
Supplemental controls add 136 triplets using the same archived complete images:
ordinary 32/64-code-unit immediate matches and misses, mixed interpreter matches,
repeated suffixes and uniform long UTF-16 inputs. They do not repeat primary
backend/tier/input configurations. Supplemental benchmark classes are external
to the runtime images and are compiled once with the original JDK for all three controls.

The [native qualification run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39073742791)
includes vendoring checks, jtreg smoke and dispatch/bounds tests, and native
ASan/UBSan/alignment checks on executable Linux kernels. The [standard PR checks](https://github.com/re-thc/openjdk-jdk27u/pull/4/checks)
build release/debug JDKs and run tier1 tests. Qualification is in progress; these runs do not
yet establish final performance or test results.

## Evidence

[The measurement index](measurements/README.md) preserves preceding complete-image
campaigns, every higher enabled mean and raw samples at immutable commits.
Those results qualify their own recorded revisions. They are not substituted for
current original/enabled/disabled comparisons, and enabled-versus-enabled gains
are not advertised as improvements over original Java.
