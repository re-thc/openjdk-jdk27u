# PR43 retained-evidence decisions

Product head: `3afce4988dc00fba614929d5f6f10c873afde87e`, branch
`codex/aarch64-consolidated-compiler-fixes`, draft PR43. These decisions close
the requested read-only reviews for the existing record set. **UNAVAILABLE**
means the specified evidence cannot be reviewed; it is neither a correctness
failure nor a review queued for later. No Mac check,
timing, build, diagnostic dispatch or manual CI rerun was started.

| Gate | Outcome | Evidence boundary |
| --- | --- | --- |
| New byte128 mask NEON correctness, matching and captured code | **ACCEPTED AS REPORTED** | User's completed native fastdebug check at `3afce498`, recipe `10bb6e3b`: all 32 NEON rules, 16 stable standalone C2 targets, separate IR/capture JVMs, decoded byte128/block64 code and corruption-sensitive replay. This does not qualify the older pair, nonzero SVE or profitability. |
| Older paired shifted/rotated logical selection, moves and spills | **UNAVAILABLE** | The exact old candidate/baseline source pair is known; allocated-code captures and image identity receipts are not accessible. The opcode summary cannot resolve cost/selection or call-pressure alternatives. Missing files are enumerated below. |
| Older firstTrue byte64 temporary/register pressure | **UNAVAILABLE** | Same old image pair; neither side's firstTrue allocated-code capture is accessible. The new toLong byte64 semantic/IR control is a different operator and cannot substitute. |
| Linux CI execution of the SVE launcher | **ACCEPTED** | Job `117574251027` explicitly records `TestByteMaskToLongSVE.java` driver execution and `Passed. Execution successful`. The image/source/artifact identities are below. This is an execution result, not proof of its effective SVE mode or applicable rules. |
| Detailed Linux SVE exclusion/applicability/phase gate | **UNAVAILABLE** | The retained JTR archive could not be delivered to the executor. Successful `hotspot_pid*.log` phase files are also omitted by the workflow's archive filter. Effective SVE flags, the two applicable SVE rules and their matching phases therefore cannot be inspected. |

No source/test correctness rejection is indicated by these records. Substituting
the new mask report for the old paired captures, or treating a green aggregate
CI result as detailed SVE proof, is not accepted.

## Older paired captures: exact missing records

The reported release-image sources are:

- Candidate: `bf4d2615bf435e8889ef95e48220938505905bbb`.
- C1-only baseline: `9711df62d0d019e6670f83832b09bd5dcf797dcb`.

Exact `java`/`libjvm` binary hashes, harness bytes and capture process IDs are
**unavailable**, because the identity/build receipts were not supplied. Source
SHAs alone do not identify those native images. No candidate-only CI image or
current-head image was substituted.

The committed runner and capture driver require these files under the original
Mac work root:

```text
identities.json
builds/candidate-release.json
builds/baseline-release.json
instructions/candidate/launcher.log
instructions/candidate/result.json
instructions/baseline/launcher.log
instructions/baseline/result.json
instructions/candidate/work/**/PR43InstructionCapture.jtr
instructions/baseline/work/**/PR43InstructionCapture.jtr
instructions/{candidate,baseline}/work/**/pr43-instructions-TestTruncatedLongBitwise-<pid>.log
instructions/{candidate,baseline}/work/**/pr43-instructions-TestFirstTrueMaskNormalization-<pid>.log
```

`<pid>` is the driver's actual `%p` expansion; neither those PIDs nor the old
Mac root were present in the accessible handoff. The glob denotes the jtreg
scratch/retained directory, not an invented concrete filename.

The qualification Git tree contains the runner/driver/auditor, not these output
records. A file-specific inventory of `/workspace` found none of the capture
JTR/log or image-identity receipt names (Git metadata, credentials and toolchain
directories were excluded); both relevant Git trees also contain no records.
Both known local runner roots, `/workspace/pr43-macos-work` and
`/workspace/openjdk-jdk27u/pr43-macos-work`, are absent. Library searches did not
resolve the old paired captures; the current Mac report is for `3afce498`, and
the individual PR36 qualification file is a different source/scope. The prior
handoff lookup returned unavailable for this conversation. The new report's
Mac directory is not the old pair's directory. This is a record-availability
outcome, not a reason to repeat the completed Mac checks.

## Linux SVE: exact source and image/artifact identities

- Repository/run/attempt: `re-thc/openjdk-jdk27u`, `39079268554`, attempt 1.
- PR source head: `3afce4988dc00fba614929d5f6f10c873afde87e`.
- Actual checked-out CI source: `40ed69081e6968ce4d0cbdd2b20a31c2e2191315`,
  merging that head into master `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.
- Compiler-part-1 job: `117574251027`, Linux AArch64 fastdebug.

| Artifact | ID | GitHub-reported archive SHA256 |
| --- | --- | --- |
| `bundles-linux-aarch64-debug` | `12123572142` | `f5f65c570ec0771add5abf964508b63848a2e4392c8a4ac3488c104a327e73e9` |
| `bundles-jtreg-8.2.1+1` | `12119926567` | `34d6e0ba446a0fa5dcea83d8089939a184f8b48c53e417249e0986823bdca218` |
| `results-linux-aarch64-hs_tier1_compiler_part_1` | `12128424668` | `bfcae22dcbda196aa56386702a8b9fd7bd7d2c9c3faaadb287f95524f3991450` |

These are archive identities from GitHub metadata and the test job's artifact
download log, not newly computed `java`/`libjvm.so` hashes. The job uses
`bundles/jdk/jdk-27.0.2/fastdebug`. Its log directly confirms the checkout SHA
and both new tests' execution passes.

The missing readable JTR is:

```text
artifact 12128424668 / test-support.zip /
  jtreg_test_hotspot_jtreg_tier1_compiler_1/compiler/c2/aarch64/TestByteMaskToLongSVE.jtr
```

The artifact is present and unexpired, size 1,478,749 bytes. Its authorized
delivery helper exited 1 with `download failed`, while its transfer grant was
still valid; no archive was installed. No underlying HTTP status was supplied,
so none is inferred. The failed transfer was not retried through another route.

Independently of that delivery failure, the
[executed workflow's retention policy](https://github.com/re-thc/openjdk-jdk27u/blob/40ed69081e6968ce4d0cbdd2b20a31c2e2191315/.github/workflows/test.yml)
uploads `test-support.zip` with only:

```text
*.jtr
*/hs_err*.log
*/replay*.log
```

It excludes the successful Test VM's `hotspot_pid<test-vm-pid>.log` containing
Before/After Matching data. The accessible aggregate log has no such file and
does not expose an applicable-rule inventory/effective SVE mode. The actual
Test VM PID is unavailable without its JTR. The ordinary CI command did not
request `PrintApplicableIRRules`. Thus the existing accessible records cannot
close the detailed SVE gate, even though the launcher executed successfully.

The inspected log is the
[existing compiler job](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39079268554/job/117574251027).
A scoped local review record and excerpt are retained under
`/workspace/pr43-evidence-review-39079268554`; the excerpt SHA256 is
`1092f1ffd1d64892786545c7e9ace6fe84f22e23a924a8229625b5cd410712bf`.

## Acceptance limits

The new mask Mac pass remains exactly scoped to the reported NEON fastdebug
check and the two captured nmethods. All four weight MOVs and DUP remain inside
each fused Mach node; weights are not hoisted/shared. No timing or parser-wide
pressure evidence exists. Profitability is **not established**, and instruction
counts are not a speedup or controlled JDK-version regression result.

The unavailable reviews are closed for this existing record set. They also do
not become accepted cost/SVE evidence by default. PR43 remains draft/unmerged;
any decision to accept those limits is separate from this completed read-only
review. Ordinary CI is reconciled against its terminal status separately.
