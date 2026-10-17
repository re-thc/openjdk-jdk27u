# Adjacent integer threshold qualification

This directory preserves the evidence for the narrow C2 guard fix and supplies
one bounded qualification plan. The strengthened compiler/test source commit is
`57f567fcb9ad7dddbd7fb2b2d9b443309681fc0f`. Publication of these files does not authorize
running that plan. No benchmark, CI, dependency installation, or new VM build
campaign was launched to prepare this handoff.

The fix recognizes `x <= c` and `x < c+1` only in `IfNode::search_identical`'s
existing bounded dominator search. The comparison domains and left input must
match, and the bound must not wrap. `same_condition`, CastII propagation,
RangeCheck equivalence, counted-loop exits, and opaque guard shapes retain their
existing behavior. This keeps the change separate from the vector-check lead.

## Existing evidence and strengthened tests

Read [EVIDENCE.md](EVIDENCE.md) first. The address-free
[evidence-original.json](evidence-original.json) identifies the exact original
C2 compilations, IR phase, guard instructions, trap, and code sizes.
[evidence-strengthening.json](evidence-strengthening.json) records the added
canonical `IfFalse` and long mixed-domain cases against the saved VMs.

The scalar predicate was extracted without changing its expressions into
`src/hotspot/share/opto/constantThreshold.hpp`. The new native tests directly
call that production predicate, avoiding Java endpoint conditions that fold
before reaching the graph helper. All four native test bodies / 26 assertions
ran through a local standalone shim. Removing each signed/unsigned endpoint
exclusion for each width makes exactly one assertion fail. This establishes
predicate coverage, not GoogleTest registration or VM linkage.

The existing candidate VM passed all 30 Java test methods / 28 IR rules; the
saved baseline failed all 23 positive IR methods and passed the five negative
cases. Both executed the semantic checks successfully. The changed C2 source
passed `-fsyntax-only` using its saved GCC16.2 compilation flags.

**Still pending:** a VM built with the scalar extraction and normal filtered
GoogleTest execution. The saved VM is the original `6bb477a6d0e0b18ee59c2c956f54ca0b27ffad5e`
implementation, not a newly built extraction. GoogleTest is neither configured
(`GTEST_FRAMEWORK_SRC` is empty) nor installed in this environment. No substitute
is claimed to validate the normal harness. Once the framework is supplied and
development build execution is authorized, use the existing configuration and
run the four `opto.constant_threshold_*` tests, followed by the one Java IR class.
With a matching GTest-enabled existing configuration, the filtered command is:

```sh
make CONF=threshold-fastdebug test-only TEST='gtest:opto.constant_threshold_*'
```

See the repository's [gtest test syntax](../testing.md#gtest).
Do not use this handoff as permission to install the framework or start builds.

## Required future inputs

Use one Linux x86-64 machine and a matched **release** VM pair. Existing
fastdebug codegen evidence is diagnostic evidence, not a release throughput
result. Supply the pair; this runner never creates it. Baseline source is
`2c3ecf578a57f2eb4d5ed30d395e537764e0fa99` (fork head plus the common GCC repair).
Candidate source is `57f567fcb9ad7dddbd7fb2b2d9b443309681fc0f`, with that same repair.
The later documentation-only tip does not change compiler/test sources.
Both need identical compiler, boot JDK and normalized configure arguments.
Normalize only build-root/conf-name paths, not optimization or JVM feature flags.

Each VM's `build_manifest` is existing build provenance with these fields:

```json
{
  "source_commit": "EXACT_40_DIGIT_SOURCE_SHA",
  "common_prerequisite": "2c3ecf578a57f2eb4d5ed30d395e537764e0fa99",
  "debug_level": "release",
  "compiler": "EXACT_COMPILER_VERSION",
  "boot_jdk": "PINNED_BOOT_JDK_IDENTITY",
  "normalized_configure_arguments": ["EXACT_MATCHED_BUILD_ARGUMENTS"],
  "libjvm_sha256": "SHA256_OF_THIS_VM"
}
```

Also supply:

- The existing, unchanged jzstd source checkout, compiled codec/driver artifacts,
  exact rolling-decoder driver arguments and method JVM descriptor.
- The existing encoder/decoder correctness corpus and driver. A corpus manifest
  is a JSON array of `{"path": "...", "sha256": "..."}` entries. Its actual
  coverage must be listed; do not add fixtures, fabricate success markers or
  silently substitute a round-trip smoke test.
- A prebuilt JMH benchmark jar containing the existing controls listed below.
  No new benchmark classes or downloaded dependencies are part of this plan.

Hash every codec classpath entry and the JMH jar. For a directory,
`qualify.digest` hashes sorted relative file names, a zero byte, and each file's
binary SHA-256 digest. An existing build record must connect the codec artifact
to its source pin. Independently check that the unchanged correctness command
actually consumes the exact manifest set. The runner checks declared hashes and
success markers; those checks cannot establish source provenance or corpus
consumption by themselves. These two checks are technical preflight review work.

These inputs are **not available here**: no matched release pair, jzstd driver /
corpus, or configured/prebuilt JMH jar. The example preflight fails accordingly;
there has been no codec or non-codec performance execution.

## Executable plan

Copy [qualification.example.json](qualification.example.json) outside the
repository and replace every placeholder with the existing inputs above.
Keep the original guard driver's inlining/training flags and unchanged
arguments. The print directive must select `BlockDecoder::decodeSequencesRolling`;
`guard_method` pins its full owner, name and descriptor. Shared heap, code cache
and processor options belong to the plan, not per-driver overrides.

```sh
# Safe default: print the exact 40 commands; execute none.
python3 doc/c2-constant-threshold/qualify.py /qualified/config.json > /qualified/plan.json

# Read-only input checks; no Java or qualification command is launched.
python3 doc/c2-constant-threshold/qualify.py /qualified/config.json --check

# ONLY after separate qualification execution authorization:
python3 doc/c2-constant-threshold/qualify.py /qualified/config.json \
  --execute --output /qualified/new-private-results
```

No shell is used for workload arguments. The result directory must be new.
`JAVA_TOOL_OPTIONS`, `JDK_JAVA_OPTIONS` and `_JAVA_OPTIONS` must be unset. Input
hashes, commands and results remain private; the script never pushes or uploads.
The JMH options are checked against the
[OpenJDK JMH command-line implementation](https://github.com/openjdk/jmh/blob/master/jmh-core/src/main/java/org/openjdk/jmh/runner/options/CommandLineOptions.java).

## Sequence and gates

| Stage | Fixed workload | Commands / bounds | Required evidence |
|---|---|---|---|
| Codec code shape | Existing rolling-decoder driver, same classpath and corpus | One per VM; 90 seconds each | C2 compile IDs for the exact method/descriptor, printed assembly and inline scope identifying the slice-width guard |
| Codec correctness | Existing complete encoder/decoder corpus command | One per VM; 180 seconds each | Exit zero, actual existing complete-success marker, unchanged input hashes and declared coverage |
| Non-codec throughput | Four existing controls below | Three paired fresh forks; 24 commands; each has 3x1s warmup + 5x1s measurement, 35s wall timeout | Per-fork JMH JSON and paired candidate/baseline throughput ratios |
| Compiler cost | Existing SimpleRepeatCompilation baseline and repeat-C2 controls | Three paired fresh forks per control; 12 commands; 45s wall timeout each | One single-shot invocation, no warmup iterations/forks, accepted RepeatCompilation=500, actual target C2 compilation, JMH timing and C2 CITime |

The four throughput controls are:

1. `org.openjdk.bench.vm.compiler.UnsignedComparison.intConDirect`
2. `org.openjdk.bench.vm.compiler.UnsignedComparison.longConDirect`
3. `org.openjdk.bench.vm.compiler.IfMinMax.testReductionInt`
4. `org.openjdk.bench.java.util.HashMapBench.put`, only `size=16384,mapType=HASH_MAP`

Compiler controls are
`org.openjdk.bench.vm.compiler.overhead.SimpleRepeatCompilation.mixHashCode_baseline`
and `mixHashCode_repeat_c2`. Warmup is zero because it would hide the first
invocation's repeat-compilation cost. The selected C2 repeat target is
`SimpleRepeatCompilation.mixHashCode`, not just the benchmark wrapper.

The pair order alternates A/B, B/A, A/B. Do not average unrelated cases. Capture
`LogCompilation` for each non-codec fork. `compilation-metrics.json` compares the
latest regular C2 nmethod for identical benchmark or generated JMH-stub signatures
and includes compile IDs. These are **total nmethod bytes**, including metadata,
not the main-instruction byte count reported for the minimal probe. OSR and C1
entries are excluded. Missing common C2 targets or changed compilation sets
require investigation; do not treat missing evidence as zero code growth.

For the codec method, inspect the original slice-width branch and its inlined
mask guard using the matching inline/bytecode scope, separately for baseline and
candidate. The candidate must remove that redundant guard/trap while preserving
the first guard and semantics. A global count of `cmp 64` is insufficient: the
four component-width guards are separate. Save the exact selected compile IDs.
The script requires a C2 compilation of the pinned method and leaves this
specific branch review to the reviewer.

Stop on a crash, semantic mismatch, missing target compilation, incomplete corpus,
input drift or resource limit. Flag throughput median loss over 3%, compiler-time
increase over 5%, code-size increase over 3%, or changed compilation sets. These
are investigation thresholds for a small screen, not significance tests or a
claim that smaller effects are absent. Examine all three paired results and
per-fork logs; do not automatically retry, extend the matrix, or select a better
looking subset. Flags or missing evidence prevent a qualification GO until
explained and reviewed.

## Resource budget and interpretation

The runner issues exactly 40 commands sequentially, with one JMH measured fork
at a time. Fork heap is 512 MiB, JMH launcher heap 256 MiB, reserved code cache
128 MiB, and active processor count four. Plan for roughly 1.5–2 GiB peak RSS
with these controls; this is a planning bound, not an OS-enforced RSS ceiling.
The existing corpus must fit 64 MiB encoded and its declared decoded bound of
at most 512 MiB. If the unchanged corpus does not fit, stop and revise the plan
before execution; do not truncate or expand it.

Expected runtime is 12–22 minutes after inputs exist. Global execution stops at
30 minutes, plus at most about six seconds for process-group cleanup. Upper CPU
planning budget is two core-hours at four active processors. The 512 MiB output
value is a polled stop threshold with possible final-write/polling overshoot;
reserve 1 GiB local result space. Typical logs should be well below 100 MiB.
Every timeout/error cleans up only its own process group, including JMH forks.
No limit is automatically raised. No further build time is included in this
budget: supplied release VMs and GoogleTest integration are prerequisites.
If matched release artifacts must be produced, budget that separately at up to
roughly two hours on four CPUs and 12 GiB scratch for the pair. A first GTest
framework/test build can take tens of minutes even when existing HotSpot
objects are reused; do not assume the filtered test command supplies its
missing framework. Those are preparation estimates, not authorized work or
performance results.

A GO from this plan means the narrow guard change passes unchanged codec
correctness, targeted codegen review and these bounded non-codec controls. It
**does not measure codec throughput or explain the Java/native encoder/decoder
gap**. The four component-width guards remain a separate propagation lead.
