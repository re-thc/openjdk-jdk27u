# Measurement evidence

The [current report](../BENCHMARKS.md) identifies the measured source, baseline,
dispatch rules and validation scope. Each dataset pins its own source and images;
historical receipts do not qualify later revisions.

## Current complete-image qualification

| Evidence | Contents |
| --- | --- |
| [All comparisons](NATIVE_IMAGE_BENCHMARKS.md) | Every matched original/enabled/disabled triplet, both speedup ratios and every higher enabled mean |
| [Raw records](native-image-results.json) | JMH fork samples, confidence half-widths, source/image/harness hashes, compiler settings, CPU, JVM arguments and backend attestations |
| [Native validation](native-sanitizer-validation.json) | Executed kernel backends, sanitizer results and MSVC baseline-instruction checks, with exact source scope |
| [Workload manifest](../native-cases.tsv) | Inputs and applicable backends/tiers |

Enabled and disabled use the same complete fork distribution. Original controls
use complete source-built baseline distributions. No current control uses patched
classes or substituted native objects. The manual
[StringZilla performance workflow](../../../.github/workflows/stringzilla-performance.yml)
builds matched images and runs correctness checks before timing.

## Previous complete-image evidence

| Snapshot | Evidence |
| --- | --- |
| `da3ae24b030d` native qualification | [405 triplets](native-image-candidates/DA3AE24_BENCHMARKS.md) and [all raw records](native-image-candidates/da3ae24-results.json), retaining every measured loss |
| `90e763c6758` broad qualification | [99-workload report](../PREVIOUS_BENCHMARKS.md), [606 triplets](COMPLETE_IMAGE_BENCHMARKS.md) and [raw records](complete-image-results.json) |
| `90e763c6758` mixed fallback supplement | [45 triplets](MIXED_FALLBACK_BENCHMARKS.md) and [raw records](mixed-fallback-results.json) |
| `90e763c6758` mixed prefix supplement | [45 triplets](MIXED_PREFIX_BENCHMARKS.md) and [raw records](mixed-prefix-results.json) |
| `90e763c6758` native batch supplement | [Nine triplets](NATIVE_BATCH_BENCHMARKS.md) and [raw records](native-batch-results.json) |
| `90e763c6758` correctness | [Local validation](complete-image-validation.json) and [57-job CI receipt](complete-image-ci.json) |

Earlier candidate experiments and patched-class controls remain available in the
[immutable historical index](https://github.com/re-thc/openjdk-jdk27u/blob/da3ae24b030d8c9c0694bbb5b33412f76c27780c/doc/stringzilla/measurements/README.md).
Their original tables and raw records, including all losses, are preserved there.
They are excluded from current performance claims.

The separate [serial equality investigation](https://github.com/re-thc/openjdk-jdk27u/blob/404e6d0033b72513a8ebd0fad8e6be7de1ee71d6/doc/stringzilla/measurements/serial-equality-investigation/README.md)
retains compiler output, sanitizer checks and all measurements of rejected word-load
variants. Those variants are not shipped.
