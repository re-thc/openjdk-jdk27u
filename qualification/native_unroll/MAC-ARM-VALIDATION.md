# Focused native Mac Vector validation

Start with the focused scope on an Apple Silicon Mac. It builds only the pinned
b3 fastdebug image and the exact classifier fastdebug HotSpot overlay. It runs
three generic harness smoke tests, three control semantics tests and five
candidate semantics/IR tests with NEON (`UseSVE=0`). It does not require release
images, original87, full suites, 72 phase processes, seven gap audits or timings.
The maximum campaign duration is four hours; every stage and child process group
is bounded. No runtime execution is authorized by this document.

From the exact review commit supplied in the publication handoff, inspect:

```bash
export BOOT_JDK=/absolute/path/to/native/jdk27/Contents/Home
export JTREG=/absolute/path/to/installed/jtreg
export QUAL_OUT=/absolute/path/outside/checkout/vector-mac-focused-v1
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --platform mac --scope focused --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT"
# Only after explicit approval of this one focused execution, use the same command with --execute.
```

Python 3.11 or newer is required (`hashlib.file_digest` is used). Supply an
installed jtreg satisfying the checked-in suites' minimum **8.2.1+1**; **8.3+0
is compatible by numeric release ordering**. A newer release does not need build
1. Generic admission hashes the selected distribution's JARs, including dependency
symlink targets, without requiring historical filenames or bytes. The optional
`verify-installed` command checks one known distribution exactly; it is not an
execution prerequisite. Actual WhiteBox, driver/othervm and C2 IR compatibility
must still pass before the candidate overlay is built.

Use an installed native JDK 27 and normal OpenJDK build prerequisites. Discover
JDK installations with `/usr/libexec/java_home -V`; select the actual
`Contents/Home` root containing `bin/java`, `bin/javac` and
`lib/server/libjvm.dylib`. Locate jtreg with `command -v jtreg` and inspect its
installation root for `lib/jtreg.jar`. Do not assume a launcher symlink's parent
is that root. Inspect the manifest without launching Java if execution is not
approved. Do not download, install or rebuild a harness to change a valid `+0`.

The runner requires native Darwin arm64, validates thin Mach-O arm64 boot and
built Java/javac/libjvm files, resolves clang/clang++/ld/ar through `xcrun`, binds
the SDK path and SDKSettings identity, and requires GNU make 4 or newer (`gmake`
preferred over Apple's BSD make). The same tool and SDK bytes are checked across
builds. Candidate modules and all template entries remain identical to b3 except
`lib/server/libjvm.dylib`. Missing tools, wrong architecture or an unavailable
SDK stop execution; no installation is attempted. Paths may contain spaces and
are passed as separate arguments. The checkout path must contain no whitespace
because the generic smoke's jtreg external library root requires it.

Existing matching images are optional acceleration, never private prerequisites.
`--reuse-builds /path/to/previous/campaign` admits only a same-commit, same-platform
campaign whose source worktrees, configuration arguments/specs, complete image
payloads, toolchain, boot JDK, SDK and harness identities still match. A mismatch
stops rather than silently using or replacing an image. PR43 binaries are not
assumed to contain this classifier. A clean host can build everything from Git.

## Expected focused evidence

Keep the entire fresh output directory, including failures. Success requires:

- `plan.json` with platform `mac`, scope `focused`, two builds and zero timed JVMs.
- `campaign.json` with exact source, tools/SDK, harness and image/build receipts.
- `harness-smoke/result.json` and its three passing `.jtr` reports, including
  `HARNESS_MINIMUM_SMOKE_OK`, `HARNESS_WHITEBOX_OTHERVM_OK`,
  `HARNESS_IR_ASSERTION_PASSED` and `HARNESS_IR_ENABLED=true WHITEBOX_API_READY=true`.
- `focused/gate.json` with both control and candidate configurations passed, and
  their work/report directories. All eight selected reports must pass. Both
  semantics tests must show actual interpreter 0, C1 1, C2 4 and cold 0 evidence
  (`ROUNDTRIP_REDUCTION_PASS` / `ROUNDTRIP_EDGES_PASS`). Candidate IR reports must
  contain `-DShouldDoIRVerification=true`; disabled matching of the essential
  `carried128` / `reversed` positive rule is rejected. The two zero-seed IR tests
  also execute their width, strict-order and matcher assertions.
- `qualification-result.json` with scope `focused`, `timing_executed=false`,
  `release_assembly=false`, `full_suites=false` and `qualified=false`.

A pass does not qualify the historical Linux/SVE regression or close independent
OSR, call-boundary, wide fallback or dynamic-insert allocation gaps. There is no
SVE coverage on this Mac. Any failed or missing gate stops without a rerun.

## Separately selectable release assembly

After separate execution approval, inspect and run the assembly scope in a fresh
output directory. It builds b3 fastdebug for generic compatibility, then b3
release and its classifier release overlay. It compiles common probes once and
captures **14 separate observed JVMs**: two release images, three headers,
conversion/raw controls, plus two legacy unroll-one controls. It requires an
installed compatible capstone decoder, but no original87 or timed campaign.
Its Mac cap is six hours. Candidate fastdebug IR remains independently required
through the focused scope; assembly alone cannot substitute for it.

```bash
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --platform mac --scope assembly --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" \
  --out /absolute/path/outside/checkout/vector-mac-assembly-v1
# Add --execute only with separate approval of this assembly scope.
```

Expect `source-inputs-correctness.json` (scope `assembly`),
`assembly/assembly-index.json`, raw `.out`/`.xml` logs,
`assembly/installed-assembly-gate.json` and `qualification-result.json`.
The decoder requires actual ordinary-entry machine code, NEON conversion dataflow,
scalar recurrence and unchanged raw-control loops. These diagnostics never enter
timed JVMs.

The later `--scope correctness` option includes release/fastdebug suites, compiler
stress and the 72 phase/seven gap processes, without timing or original87.
`--scope complete` additionally builds original87 and runs the separate Mac
paired experiment: 18 assembly JVMs and at most 360 timed JVMs, 15 independent
contrasts with 12 balanced AB/BA process pairs each. It retains the 1.02 upper
paired 95% non-regression bound, strict compact gains, 0.01 B/call allocation
bound and no pooling. Both later scopes have a 24-hour Mac cap and require their
own execution approval. Linux/SVE recovery remains a separate experiment.

## Ready-to-send local agent prompt

Replace `REVIEW_COMMIT_FROM_HANDOFF` with the exact 40-character commit in the
publication handoff before sending; it must equal the fetched branch head. This
avoids a self-referential commit hash in this committed file.

> Work in https://github.com/re-thc/openjdk-jdk27u.git, review branch
> `codex/vector-api-classifier-jtreg83-review`, pinned commit
> `REVIEW_COMMIT_FROM_HANDOFF`. Read repository instructions and
> `qualification/native_unroll/MAC-ARM-VALIDATION.md`. Fetch that branch, verify
> its head equals the supplied pin, and check out the exact commit in a clean
> checkout with no whitespace in its path. Keep PR14 draft and unchanged; do not
> merge, force-push or launch CI. First inspect only: require native Darwin arm64,
> Python 3.11+, installed GNU make 4+, working Xcode clang/SDK paths, a native
> JDK 27 (`/usr/libexec/java_home -V`) and an installed jtreg root containing
> `lib/jtreg.jar`. Accept the suites' minimum 8.2.1+1 or newer numeric release,
> including 8.3+0; do not fetch or install anything. Existing binaries are optional
> and must pass the runner's full reuse identity checks. Set absolute BOOT_JDK,
> JTREG and a fresh QUAL_OUT outside the checkout. Print the smallest plan with
> `PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py --platform mac --scope focused --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT"`.
> No JVM or build is authorized by this prompt alone: obtain explicit approval
> for this one four-hour focused scope before adding `--execute`. Execute once
> only if approved. Do not expand to assembly, full suites, phase/gap audits or
> timing. Stop on missing prerequisites, wrong architecture, denied access,
> identity mismatch, cap exhaustion or any failed/skipped essential IR gate;
> preserve all output and do not retry or substitute routes. Report the exact
> checkout pin, command, tools and scope; send `harness-smoke/result.json`,
> `focused/gate.json`, `qualification-result.json`, and actual tier/IR markers
> listed above, or the precise failed action/log. A focused pass is not historical
> Linux/SVE performance qualification and does not close the separate allocations.
