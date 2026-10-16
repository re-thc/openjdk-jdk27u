PR9 still has an open native ARM archive gate. The historical run contains four
enabled-only failures of one test. The current source has a narrow change that
addresses a concrete mechanism for both reported constant-pool differences;
this investigation establishes source attribution, not native execution proof.
No JVM, build, test, hosted launch, rerun, or stopped probe was executed here.

The current checkout is clean `e41d7823bf6de77c4bfba52e896bf325221488cb`.
PR9 remains open and non-draft at published head
`c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`. Neither the PR nor its source branch
was modified. See `pr-metadata.json` for the read-only metadata check.

All four failing records from run 38640541680, job 116114620734, name
`runtime/cds/FourByteHeaderArchiveDeterminism.java#z`. They are separate
repetitions, not four different test programs. Every failure exits jtreg with
code 2. Every corresponding same-block baseline and flag-off record exits 0
and reports `Passed. Execution successful`.

| Block / retained case directory | Enabled failure assertion | Baseline seconds | Flag-off seconds | Enabled seconds | Log line |
| --- | --- | ---: | ---: | ---: | ---: |
| 01 / `archive-results/01-pr-on` | byte #1784920, b0 = -64, b1 = 0 | 53.485897 | 53.228044 | 48.819421 | 579 |
| 02 / `archive-results/02-pr-on` | byte #1784920, b0 = 0, b1 = -64 | 53.210126 | 53.488536 | 39.011796 | 583 |
| 03 / `archive-results/03-pr-on` | byte #1784920, b0 = -64, b1 = 0 | 53.549530 | 53.217777 | 39.234156 | 585 |
| 14 / `archive-results/14-pr-on` | byte #92542, b0 = 7, b1 = 100 | 53.356787 | 53.619549 | 39.285447 | 619 |

The exact common exception prefix is:

```text
runtime/cds/FourByteHeaderArchiveDeterminism.java#z  Failed. Execution failed: `main' threw exception: java.lang.RuntimeException: File content different at byte #...
```

`historical-failure-control-excerpts.txt` contains the four complete logged
failure summaries and eight paired control summaries, with original log line
numbers. `failure-and-controls.json` preserves their timestamps, mismatches,
exits and unrounded durations. Across all 20 blocks, baseline passed 20/20,
flag-off passed 20/20, and flag-on passed 16/20. The workflow explicitly tolerates
nonzero block exits that contain archive mismatch text. Its green status does
not establish a clean test run. The supplied handoff also reports that the
additional all-collector selection passed Serial/G1 and failed Z when enabled;
those per-collector results were written to the unavailable artifact rather
than printed in this log, so they are not independently reverified here.

The retained command recipe is in `historical-command-construction.txt`.
For each failing block it constructs the following jtreg argument vector
(historical quotation only, not a proposed execution):

```text
{baseline_image}/bin/java -jar {root}/jtreg/lib/jtreg.jar
  -jdk:{pr_image} -othervm -conc:1 -timeoutFactor:4
  -retain:all -verbose:fail,error,time
  "-vmoptions:-XX:MaxRAMPercentage=12.5 -XX:+UseCommonIntrinsics"
  -javaoptions:-XX:-CreateCoredumpOnCrash
  -w:{root}/archive-results/{block:02}-pr-on/work
  -r:{root}/archive-results/{block:02}-pr-on/report
  {root}/pr/test/hotspot/jtreg/runtime/cds/FourByteHeaderArchiveDeterminism.java#z
```

The cwd is `{root}/pr`. `{root}` is `Path.cwd()` in the historical job.
Each image is the unique parent-of-parent of `bin/java` under
`{root}/images/{baseline,pr}`, extracted from the corresponding
`bundles/{baseline,pr}/jdk-linux-aarch64-debug.tar.gz`. The logged recipe does
not print that extracted folder basename or the expanded command stored in
`results.json`; these placeholders make that limit explicit. The host harness
uses the baseline JDK, while `-jdk` selects the tested PR JDK. The same-block
off control substitutes `-XX:-UseCommonIntrinsics`; baseline omits that flag
and uses the baseline image/source. Block order rotates through all six
permutations of baseline/off/on. No ordering or result has been discarded.

The unchanged test's `#z` action is
`main/othervm/timeout=480 -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions
-XX:+WhiteBoxAPI FourByteHeaderArchiveDeterminism Z`. It calls
`DeterministicDump.doTest(false, "-XX:+UseZGC", "-XX:+UseFourByteObjectHeaders")`
and then the same method with `true`. Each uses `-Xmx128M -Xms128M -Xmn120M`
and the corresponding `-/+UseCompressedOops`, compares two ordinary dumps,
then compares the first with an archive-relocated dump. Dumps use `-Xint`,
CDS/GC debug logging, an AOT map trace per archive, and `-Xshare:dump` through
`CDSTestUtils`. Child creation prepends jtreg's test VM/Java options. The
byte comparison throws at `DeterministicDump.java:139` after the archive
header; this is distinct from the later ergonomic-heap dump exit assertion.

The original full JTRs, archives, maps and manifest are unavailable locally.
The supported transfers plus the one permitted local retry exhausted; the
approved artifact transfer reports `Tunnel connection failed: 403 Forbidden`.
`original-arm-transfer-blockers.json` preserves exact Library identities,
versions, expected hashes/sizes and the limitation. Therefore this packet
cannot identify the failed archive pair, compressed-oop setting, or which of
the two compare call sites failed in each block. It does not invent a stack
trace or treat the test's approximate map excerpt as actual offset ownership.

The historical identities remain distinct:

| Role | Commit |
| --- | --- |
| Actual tested JVM | `d8fc74ba01f7e6ed0a77e94f89b1a0922a79a776` |
| Checked-out PR test source | `8bf01e9ed8a3df53fd8836d61216ed511ad3e591` |
| Baseline | `87edd79d3104ff502f7befec034716b081436f49` |
| Historical workflow | `f88580c372fb96ce91e39faa41fa04121ca197e6` |
| Current local candidate | `e41d7823bf6de77c4bfba52e896bf325221488cb` |

The tested JVM Git object was fetched read-only and compared directly with the
current candidate. Its whole source tree equals the test checkout tree
`7f756e250381a3c55b9a906771f9b2dd8ba28609`; that equality does not make it a
test of the current candidate. The direct diff changes 17 files (871 insertions,
187 deletions): ten runtime files, four tests, three documentation files.
`tested-to-current.patch`, its stat, commit list, and `source-identities.json`
retain this comparison. Eighteen relevant files were verified byte-identical
between tested/current, including both ARM/x64 entry generators, the Java
ArraysSupport/Long bodies, archive class cleanup and AOT resolution policy,
and the original failure test/harness files.

The source supports this mechanism for the reported differences:

1. The ARM common entry polls for a safepoint before executing its result.
   A pending poll takes `slow_path` to the ordinary `zerolocals` Java entry;
   successful scalar/leaf paths return directly. The x64 generator has the same
   policy. Other guarded fallback reasons exist; the exact historical trigger
   has not been isolated.
2. Java `ArraysSupport.vectorizedHashCode`'s unsigned-byte case casts to `[B`
   and invokes `unsignedHashCode(int,byte[],int,int)`. The common leaf can bypass
   those bytecodes. Executing the Java body can resolve both the class and
   call-site method entries. This matches the inherited raw-map attribution
   for blocks 01/02/03 (method pointer/null and resolved/unresolved `[B`).
   The reversed byte ordering in block 02 is consistent with nondeterministic
   resolution state, not a distinct method or a demonstrated second bug.
3. Java `Long.numberOfLeadingZeros` invokes `Integer.numberOfLeadingZeros`;
   the common scalar path emits the result directly. This matches the inherited
   attribution for block 14 (Integer method entry and class tag 7/100).
4. Invoke/checkcast resolution publishes those states. Archive cleanup may
   retain already-resolved eligible methods/classes. Its deterministic-resolution
   test proves a reference's meaning is stable, not that prior execution
   resolved the same set of references. Hence mixed fast/Java execution can
   persist different states in two otherwise equivalent dumps.

The map ownership in points 2/3 is inherited from the supplied raw analysis;
it has not been rederived from unavailable bytes. The source path is verified
independently and recorded with exact current line numbers in
`current-source-excerpts.txt`.

Commit `7454b15f85f20d7ed6688256b52c126603e3ff06` is the narrow candidate repair
for both causes. Shared entry generation now excludes static archive assembly
unless it is an AOT training preimage. For the historical `-Xshare:dump`
command, argument parsing sets static-dump state, the preimage flag stays false
(AOT flags cannot be mixed with classic CDS flags), and the common table remains
zero-initialized. Entry selection then chooses the ordinary Java route for
both Long and ArraysSupport. Ordinary execution and dynamic CDS retain common
entries. Preimage cleanup explicitly removes the resolution states above.
This is a source-level explanation of why the candidate should address the
reported fields; it is not proof that every ARM archive difference is fixed.

The other intervening changes defer/prepare BigInteger stubs at safe call
sites, refresh resolved methods after blocking preparation/redefinition,
share duplicate entries, and place optional entries after ordinary bytecodes.
They address startup, method publication and interpreter layout. They do not
normalize the reported Long/ArraysSupport archived entries. The cpCache diff
changes invocation caching, not its archive-cleanup routines. No new runtime
patch is justified solely by the retained failure summaries; broadening CDS
cleanup or globally disabling common intrinsics would be speculative.

The failed native replacement build run is a separate issue. Run 38829832202,
workflow `12fb0c876b9ec3b23ce59f003badc086e2b0f368`, requested current e41d source.
ARM fastdebug job 116759287247 and Windows fastdebug job 116759287279 both
completed their build and development-profile checks, then exited 1 in
`Verify actual JVM source and retain core payload identity`. The two release
jobs were cancelled by fail-fast. The identity step first tests full checkout
HEAD, then requires the entire release line to equal
`SOURCE=".:git:e41d7823bf6d"`, before creating its receipt directory. There is
no shell tracing or printed HEAD/SOURCE at that point. Thus the exact failing
assertion and actual release line cannot be recovered from these logs. Missing
native images prevent a later retrospective identity check.

`SourceRevision.gmk` supports a forest of repositories and emits one revision
token per discovered repository; dirty repositories receive `+`. The workflow
checks out GTest as a nested repository. A valid line containing the correct
top-level token plus GTest can fail the whole-line grep. This is a concrete
checker counterexample and a plausible explanation, not observed native
metadata. A changed HEAD or dirty/wrong source has not been excluded by the
missing receipt. Do not silently relax the check or label these binaries verified.

`identity-repair-identity-diagnostics.patch` is the already-prepared, unapplied
diagnostic repair (SHA256
`5e2fa0a118e81ac444c877d292fe995120c3b84fa6dff5c60279d499e55619f6`).
It captures checkout status/release before assertions, traces the checks,
preserves failure status, uploads the receipt and unverified bundles after a
successful build even if identity fails, and stops matrix fail-fast from hiding
independent results. It keeps the strict assertions. Eighteen YAML-contained
bash syntax checks and three synthetic capture fixtures passed previously;
no hosted execution of this patch has occurred. A future semantic checker
repair should validate the exact clean top-level token/full checkout separately
from preserved nested-repository provenance, after actual metadata is available.

The minimum next scope is a proposal only:

- First recover the existing raw ARM JTR/map packet through an authorized,
  functioning transfer. Current permitted attempts are exhausted; no further
  attempt or bypass is part of this proposal. Analyze only the four failed
  cases, their exact archive-pair metadata, and the reported actual offsets.
  This requires zero builds or test executions.
- If the parent authorizes replacement native building, start with one native
  Linux ARM fastdebug image of exact e41d source, using the reviewed diagnostic
  patch, one job at a time, at most two build workers, 60-minute wall cap and
  no automatic retry. Capture full HEAD/tree/status before build; retain release,
  core hashes, configuration and unverified bundle on identity failure. If the
  identity check fails, stop at the captured assertion. Do not launch Windows,
  release variants, tier1/tier2 or performance as a consequence of that build.
- Review the captured identity before selecting any native test. While the stop
  remains active, the archive stress execution budget is zero, including
  `CommonIntrinsicArchiveDeterminism`, which also enables four-byte headers.
  A replacement name, collector, machine or execution route is not a remedy.
  Native confirmation of these four failures remains blocked on separate
  clearance; a passing unrelated semantic test would not close that gate.
- After attribution and separate authorization, select only the necessary
  native release counterpart/targeted semantic checks; do not rebuild the four
  platform/configuration matrix. ARM speed and Windows AVX-512 remain separate
  hardware/qualification gates, with no results inferred from Linux x64.
- The local ordinary selected coverage already completed at e41d. Remaining
  performance stays held. If the parent resumes it, reuse the exact completed
  records, inspect the retained C1 slowdown/control signals first, then consume
  only missing cold/startup/C1/C2 warm/control cells in separate phases. Proposed
  caps: one VM at a time, at most six named missing phase groups, 60 minutes per
  phase, durable checkpoint after each, no automatic rerun or extension. A cap
  leaves an explicit gap rather than a pass. This is not authorization to start.

The existing local evidence checkpoint is
`997322b5829b701d26189605643869577e785f7e`, under
`.github/qualification/chain-checkpoint/layout-local-followup-20261016-080542`.
Its 11,681 passing records and explicit baseline/environment limitations remain
unchanged. No current-source ARM proof, complete performance gate, clean tier2
claim, speedup approval, PR-ready conclusion or merge follows from this packet.
