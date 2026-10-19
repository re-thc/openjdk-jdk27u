# Comparing memory benefits and runtime costs

Use a matched native baseline/candidate pair and make an engineering decision
for the tested profile. Native Linux x64 is sufficient for a scoped Linux x64
decision. ARM64, macOS and Windows performance remain separate claims.

The earlier [formal native proposal at 2533274](https://github.com/re-thc/openjdk-jdk27u/blob/253327429ee386c2d9c5a6ed07a59fcf0af06262/doc/memory-overhead-native-decision.md)
is historical. Its fixed interval family and resource reservation are not the
acceptance criteria for the current practical comparison. Preserve historical
results with their original source/image identities.

## Match source, images and inputs

Freeze the baseline and candidate commit/tree identities. The candidate must
include the chosen baseline; comparing a newer master with an unmerged topic
that forked an older master also measures unrelated changes. Record any common
test-only additions separately from production source.

Use the normal `bin/configure-dev` headless Serial/G1/ZGC profile and the same
installed boot JDK, native compiler/linker, configuration, source date, build
jobs and timed JVM options on both sides. Do not silently enable the excluded
Parallel, Epsilon or Shenandoah collectors. In particular, the imported Parallel
code-cache path is not qualified by this profile.

For example, configure both source checkouts with the same values:

```sh
bash bin/configure-dev --with-conf-name=memory-release \
  --with-debug-level=release --with-jobs=4 --disable-precompiled-headers \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-gtest="$GTEST_SOURCE" --with-source-date="$SOURCE_DATE" \
  --with-version-opt=memory-comparison
make CONF=memory-release JOBS=4 images test-image-hotspot-gtest
bash .github/scripts/check-dev-profile.sh \
  build/memory-release/images/jdk build/memory-release/spec.gmk
```

Use one compatible existing jtreg installation and normal managed test inputs.
Record actual selected CC/CXX/BOOT_JDK and profile fields from each `spec.gmk`,
compiler/runtime/header identities, complete image/library hashes and worker
closure. Verify both images with `.github/scripts/check-dev-profile.sh`.
A make exit alone does not establish that its workers have stopped.

Compile diagnostic/JMH inputs once with the built baseline javac, retain their
hashes and reuse identical bytes. The verified javac and positive-byte file-I/O
adapters are committed under
[`fcda62c:test/manual/jvm-memory/qualification`](https://github.com/re-thc/openjdk-jdk27u/tree/fcda62c58ce42701c690e4eee504ff3c64da1efb/test/manual/jvm-memory/qualification).
Use their Java workload sources, not the historical execution controllers or
hard-coded analyzers. New regression sources absent from the baseline checkout
can be run from the candidate test tree with the baseline selected as the
JDK under test. Candidate-only earlier-reclamation/sharing assertions belong
only on the candidate.

Check native ISA, available CPUs/memory/storage and ordinary process behavior
before building. Use the existing execution boundary and normal shutdown;
stop on an actual capacity or execution blocker rather than creating runner
infrastructure. Keep earlier unique results and build evidence. Supported
fastdebug/native-symbol options may differ from the timed release pair when
explicitly recorded; assertions must remain enabled in fastdebug.

## Establish attributable benefits

Run the exact native Array/ParkEvent cases with NMT enabled and executed,
unskipped XML receipts, the focused code-cache/C2/NIO/thread/AOT tests, and
Formatter ownership/serialization cases under the supported collectors. Use
actual AOT record/create/replay actions and training-data verification.

Keep these estimands separate:

- **Array:** record actual NMT allocation-header request sizes for all twelve
  type/length cases. A common old-header baseline control deliberately fails
  the size assertions; distinguish it from a correctness failure. Scope the
  saving to these C-heap metadata allocations, whose production use is AOT
  training dependency snapshots.
- **ParkEvent:** measure native size/alignment with the normal compiler and
  generated headers. Attribute requested bytes/counts using complete NMT
  detail at warm, 64-worker, 192-worker and 192-worker-reuse phases. The
  `CALLER_PC` allocation tag can identify constructor callers rather than a
  `ParkEvent::` frame; inspect actual callsites. Do not equate aggregate
  Internal movement, layout size or immortal-pool reuse with returned RSS.
- **NIO:** run the committed fixed aligned-cache lifecycle fixture and cache
  controls, recording actual alignment exposure and complete absolute Other
  category/detail reconciliation before and after worker exit. Preserve
  disabled-cache and threshold cases. Missing exposure is inconclusive;
  do not hunt addresses or sizes for a favorable leak.
- **Formatter:** use `DateFormatSymbolsFootprint allocation` with its agent.
  Record unique arrays, reference slots, shallow array bytes, instance size,
  deduplicated ownership-snapshot bytes and thread allocation per operation.
  Include instance/snapshot overhead alongside the array saving. Verify actual
  header/reference widths
  for each collector; this fork's four-byte headers and ZGC reference widths
  differ from conventional assumptions. Exclude strings/time zones and avoid
  turning reachable shallow storage into a process-retention estimate.
- **Code cache:** retain dead/live method identities, compilation levels,
  reported blob bytes, reused addresses and used/committed/reserved capacity.
  Diagnostic activity can itself add code; compare matched changes and live
  controls. Earlier reuse does not establish uncommit or RSS reduction.
- **C2 scratch:** verify release/fastdebug semantics and compilation costs.
  The independent type-arena copy justifies the ResourceMark lifetime, but
  helper-entry and peak-byte measurements are not supplied by Java allocation
  counters. Do not invent a quantified C2 memory or sanitizer claim.

Use fixed independent diagnostic repetitions and retain all observations.
Do not add native requested bytes, Java shallow bytes and code-heap capacity
into an RSS total.

## Protect representative costs

Select a compact workload/collector list before sampling. Include allocation,
javac, thread start/churn, verified file I/O/carriers, bounded code reclamation
and recompilation, startup, and Formatter construction/cloning/format/parse.
The DateFormatSymbols cost probe includes a shared read-only clone prototype
with initialized or lazy time-zone tables, and first-write serialization of a
fresh instance; it never shares a mutable SimpleDateFormat between workers.
Its serialization setup checks a round trip.

Use normal release images with fixed inputs, heap, locale/timezone, processor
bound and collector; NMT/agents/profilers are off for timing. The current
comparison uses four initial interleaved AB/BA pairs, one JMH fork per command,
three one-second warmups and four one-second measurements, average time in
ns/op. Require correct selected methods/run shape and positive work. The I/O
adapters must report positive equal operation/byte counts in every iteration.

Interleave unchanged baseline/baseline controls in representative conditions.
Retain individual fork/iteration results and report paired directions, medians,
range/IQR and controls. Inspect warmup trends, work validity and plausible
causes before attributing a loss. A further balanced batch for noisy or
materially slower conditions is appropriate; retain the original batch and
report both. Do not retry until passing or delete unfavorable valid forks.
No arbitrary one/two/three-percent precision gate invalidates the whole packet.

Retain complete nonrotating per-fork GC logs. Separate completed pauses from
concurrent cycles, record actual event counts, and identify whole-fork versus
measurement scope. Sparse tails are unqualified, not manufactured by extra
favorable sampling or a reason to hold unrelated proven components hostage.

Build a normal assertions-enabled fastdebug image and run affected checks.
Use relevant supported sanitizer execution where practical, preserving NMT
header poisoning; the Array/ParkEvent cases do not imply C2 sanitizer coverage.
A build-only sanitizer result is not an execution pass.

## Decide and report

Adopt components with valid correctness, observable useful benefits and
acceptable evidenced costs for the tested profile. Repair attributable defects
and retest affected pieces. Narrow or remove an idea that does not justify its
tradeoffs instead of indefinitely blocking the rest of the change.

Report exact source/common-input/image identities, coverage/exclusions,
component byte/retention results, all slower cases, variability, controls and
remaining platform/workload limits. Keep raw host evidence, binaries and
execution journals outside the product PR. The current executed findings are
in [the validation record](memory-overhead-validation.md).
