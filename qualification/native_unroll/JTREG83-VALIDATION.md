# PR14 jtreg83 validation proposal

Experiment: `pr14-classifier-jtreg83-v1`. The old classifier workflow, provenance JSON,
results and product/test/make/bin trees remain unchanged. This is a harness migration,
not a compiler fix or a native performance qualification.

## Inputs and delivery

Local smoke uses `/workspace/toolchains/jtreg83` (8.3-dev+1). The separate
`jtreg83-provenance.json` pins all seven installed JARs, the retained archive and
the original experiment pin fingerprint. No default installation changes.

CI does not transfer that installed binary. In the native preflight runner it
checks out official jtreg commit `551e17adac0579859012c4c46318b8fa3cf2ff37`, builds
8.3-dev+1 once, and records all seven generated JARs, recipe files, build JDK,
dependency archives and supplied legal notices. Every candidate/control test uses
that one harness. Its exact JAR map is checked before and after the campaign.
The source-built output is explicitly NOT claimed byte-identical to the installed
dirty-source-marker distribution. Local smoke and native checks have separate
consumer inventories under this experiment identity.

The proposed code-tools archive endpoint is explicitly
`https://github.com/openjdk`, in place of the tagged recipe's git.openjdk.org
redirector. The reviewed dependency versions and upstream archive checksums remain
unchanged. This is a proposed endpoint change requiring publication/runtime
approval, not an executed fallback. A denial, checksum mismatch or build failure
stops the job; no Adoptium access, alternate endpoint fallback, shared binary
cache or retry is implemented. Other endpoints remain repo1.maven.org,
archive.apache.org and raw.githubusercontent.com (TestNG license).

No harness binary or source tree is uploaded by this workflow. Supplied notices
are inventoried; complete corresponding-source custody for bundled vendor code
is not asserted. A later public binary-delivery proposal would require its own
review. Building and using the harness inside its consumer runner avoids that
binary transfer/publication step for this experiment.

## Image availability and scope

The last classifier run stopped before either native overlay was built. Its
partial metadata artifact is not a candidate JDK. Local x86 images include older
controls/other prototypes, not this exact classifier release/fastdebug pair.
No local candidate-image reuse is claimed.

Reuse the independently pinned native b3 control/template release artifact
11978661561 and fastdebug artifact 11981413932 from run 38738016505, plus frozen
payload artifact 11881672203 from run 38539204173. Their current availability
must pass the original API metadata/expiry and consumer provenance checks at
runtime; this source-only review has not refreshed the remote inventory.

Two new HotSpot-only overlays (release and fastdebug) are necessary for the exact
classifier. Existing producer/consumer verification remains unchanged: no control
or module rebuild, no matched-toolchain performance claim. Qualification requires
the original assembly gates and predefined paired process-level performance
criteria after correctness passes. Historical images are correctness controls.

## Exact local smoke (approval required)

From the reviewed checkout, with a fresh output path:

```bash
python3 qualification/native_unroll/jtreg83_harness.py verify-installed --image /workspace/toolchains/jtreg83
python3 qualification/native_unroll/jtreg83_harness.py smoke --image /workspace/toolchains/jtreg83 --jdk /workspace/toolchains/jdk27 --out /workspace/pr14-jtreg83-local-smoke-v1
```

The second command only prints a plan. After approval add `--execute` to that
command, under the existing subreaper supervisor with a 600-second outer cap.
The smoke itself caps each of two commands at 90 seconds: runtime version and a
fresh othervm suite requiring 8.2.1+1. This verifies harness operation/minimum
admission, not compiler IR or native compatibility. No local JDK build or download.

## Native bundle (publication/runtime approval required)

Publish only the reviewed source bundle to the new diagnostic branch
`codex/vector-api-classifier-jtreg83`; its branch-scoped workflow runs once on
attempt 1. PR14 remains draft, unchanged, unmerged. No force-push.

- Two serialized candidate build jobs: 90 minutes each, 80-minute capture deadline,
  fail-fast matrix, no job retry; preserve partial evidence with `always()`.
- One native preflight job: 120-minute cap, work stops at 100 minutes to reserve
  capture. The one harness source build plus minimum smoke is capped at 20 minutes
  inside that deadline; inner build command caps at 1100 seconds.
- Maximum allocated job time is 300 runner-minutes, plus the separate local smoke
  cap of 10 minutes. Native queue time is not bounded by job timeouts.
- Ten jtreg suite invocations: four extra historical-control semantics, four
  unchanged candidate correctness/IR configurations and two unchanged stress
  configurations. All use the same native source-built harness.
- Control semantics retain the actual interpreter/C1/C2/cold checks. Only those
  extra historical-control driver runs disable new candidate-specific IR assertions;
  they do not claim repaired IR on the old VM. The candidate runner is unchanged.
- Candidate fastdebug must perform the existing applicable positive/negative IR
  checks under default SVE and UseSVE=0; missing checks/skipped positives fail.
- Keep all existing direct compiler controls, OSR exclusion, strict/non-strict
  reductions, tails, exceptional values, 48 paired chain compilation diagnostics,
  eight separate matching JVMs and two OSR JVMs. Diagnostics remain excluded from
  runtime performance qualification. No timed performance workload campaign.

The wrapper gate `jtreg83-gate.json` is written only after historical semantics,
the entire original candidate preflight, and final same-harness verification pass.
`qualified` remains false. This bundle does not close OSR allocation, ABI-boundary
materialization, MAX insert or wide-fallback gaps.

## Source-only review

`test_jtreg83_bundle.py` verifies actual installed bytes and inert failure fixtures,
CI source/run/attempt receipt binding, source preservation, planning without tool
execution, control execution markers, exact workflow bounds and shell syntax.
It starts no JVM/compiler, performs no download and launches no workflow. Execute
it from a clean local review commit so the original exact-source verifier can
bind the complete workflow/qualification tree.
