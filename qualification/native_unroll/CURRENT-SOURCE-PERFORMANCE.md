# Staged current-source PR14 performance decision

This prospective plan replaces the four-image / 648-timed-JVM Mac proposal.
It is source-only preparation, not authorization to build, observe or time.
It is maintained on the existing classifier diagnostic branch. No new branch,
patch handoff, CI dispatch, PR metadata change or product edit is required.
Schema2 deliberately rejects saved schema1 plans; old approvals do not carry over.

## The first question and matched images

Does current PR14 reintroduce a material legacy-header conversion slowdown
against its **current integration base**, and does it preserve a small declared
set of compact-header paths and controls? Build only two full release images:

| Role | Exact source |
| --- | --- |
| master | `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda` |
| candidate | `6b99b2d237904f78fa1b6933c56b2202d8323d83` |

Repository: `https://github.com/re-thc/openjdk-jdk27u.git`.
Use one native compiler/linker/boot JDK/SDK/make/configuration. Both source
worktrees use configure profile blob `2ecd0af5f39cde720ec453bd6346a99c97d3600d`.
Each full image retains its own source-appropriate modules/runtime: no b3-module
or VM-only overlay. Candidate/master measures this PR's total current source
effect, including Java identity paths, rather than an isolated classifier cost.

The exact harness commit and executed bytes are independent of product refs.
Planning binds both roots, product trees, tool invocation names/canonical
identities, complete boot payload, jtreg, decoder, host/PATH and Linux CPU affinity.
The boot manifest includes runtime libraries such as libjvm/libjli, file bytes,
entry modes and symlink targets. Recheck it at stage boundaries and before and
after every preparation command, so a changed boot library between image builds
stops preparation. These file checks are included in the existing shared cap.
Preparation binds configuration specs and complete image payloads, and compiles
one shared kernel/controller/WhiteBox class set once. WhiteBox source is master;
all processes consume the same class bytes. Stage boundaries recheck complete
images; every command rechecks core metadata, specs, source and exact classes.
The already completed candidate Mac correctness/codegen receipt is reused;
no repeat, private binary or user-uploaded image is requested.

## Fixed stages, workload list and supported decisions

Mac runs native NEON (`UseSVE=0`). Linux runs default SVE and `UseSVE=0` in
separate cells; no ISA pooling. All kernels use 128-bit vectors. Header modes
are legacy (`-XX:-UseCompactObjectHeaders`), default four-byte (no override), and
eight-byte (`-XX:-UseFourByteObjectHeaders`).

1. **Prepare:** two complete release images and one common class compilation.
   This supports source/tool/image compatibility admission, not a performance claim.
2. **Legacy assembly:** separate observed ordinary-entry release processes for
   legacy `conversion`, both roles, default unrolling and `LoopMaxUnroll=1`.
   This records the actual installed code and diagnostic unroll correspondence;
   it does not substitute diagnostic performance for default performance.
3. **Legacy timing:** candidate/master legacy `conversion`, default unrolling.
   This is the first go/no-go decision on the motivating current-base slowdown.
   Evaluate once after all twelve pairs per declared ISA. Failure or an
   inconclusive bound stops before any control assembly/timing. A pass supports
   only this workload on this OS/ISA; it does not establish original87 recovery.
4. **Controls assembly:** only after the legacy gate passes, observe both roles
   for the six cells below. Missing/incompatible code stops before control timings.
5. **Controls timing:** only after that admission and separately authorized
   control scope, run twelve pairs for each of these fixed cells per ISA:

| Header | Kernel | Reason retained in the small set |
| --- | --- | --- |
| four | conversion | Default compact conversion path |
| eight | conversion | Alternate compact conversion path |
| legacy | rawBits | Reinterpretation control under the motivating header layout |
| four | rawBits | Default compact raw-chain path with the large prior gain |
| legacy | directBits | Direct reinterpretation control beside the legacy regression |
| legacy | arithmetic | Arithmetic control without the conversion/identity chain |

A controls pass supports only these six current-base non-regression/allocation
claims. It does not cover every kernel/header combination: eight-byte rawBits,
compact directBits/arithmetic, OSR mixed-Phi, vector-argument ABI materialization,
MAX/dynamic-insert/wide fallback and full-suite/stress/interpreter/C1/cold
coverage remain open. A shorter matrix is useful because it can reject a bad
current PR before historical recovery work; it cannot qualify all Vector API.

## Prospective statistics and failure rules

Sample counts are **unchanged** from the reviewed criterion: twelve adjacent
balanced process pairs per contrast, six AB and six BA. The reduced cost comes
from two references and seven declared contrasts per ISA, not fewer samples or
shorter measured windows. No interim sample-size adjustment, optional stopping,
conditional cell selection, outlier discard, retry or pooled headline average.
The six controls are frozen before the legacy result; a passing legacy result
admits that existing set, not a result-selected replacement set.

Keep identical per-process history: 61,001 primer kernel calls, 1,000 zero-call
metadata windows, then 10,000 warmup and 1,000 calibration calls. Five fixed
100,000-call windows contribute one process mean. Pair ratios, not individual
windows, are uncertainty units. Use the geometric mean and fixed-seed 20,000
process-pair bootstrap, reporting a two-sided 95% interval for each contrast.
All declared contrasts must have upper ratio **<=1.02** and candidate maximum
allocation **<=0.01 B/call in every window**. No strict improvement criterion is
asserted against master. A wide interval is a legitimate inconclusive result,
not permission to top up samples until it passes. Report each cell separately;
this is bounded selected-workload evidence, not simultaneous zero-regression
assurance over the whole API.

For a complete cell: upper<=1.02 and allocation bound met means pass; lower>1.02
means a demonstrated >2% regression; an interval crossing the limit means
inconclusive; excess allocation means allocation failure. Every non-pass stops
the staged plan. A timeout, source/tool/image change, scalar checksum mismatch,
missing/dead ordinary C2 kernel/caller, incomplete machine bytes, missing SVE,
negative/malformed counters, compilation during a timed window or failed command
also stops, retaining partial evidence. No automatic resume is implemented.

Timing JVMs omit WhiteBox observation, logs, graph/assembly printing and unroll
controls. Separate observed JVMs use 1,000-call windows whose times are excluded.
They require level4 ordinary kernel entry, live ordinary invoke/window callers,
scalar agreement and decoded full kernel/caller bytes. Candidate NEON conversion
must retain its grouped conversion/reduction recurrence. Raw/control machine
code is preserved for both roles; equality to historical b3 is not a gate in a
comparison that neither builds nor claims to reproduce b3. Naturally installed
caller entries and runtime compatibility remain unproven until execution; absent
code stops without forcing compilation or changing the common history.

## Fixed maximum scope and cost

| Stage | Mac NEON | Linux default SVE + NEON |
| --- | ---: | ---: |
| Full release builds | 2 | 2 |
| Legacy observed JVMs | 4 | 8 |
| Legacy pairs / timed JVMs | 12 / **24** | 24 / **48** |
| Controls observed JVMs, only after legacy pass | 12 | 24 |
| Controls pairs / timed JVMs | 72 / 144 | 144 / 288 |
| Maximum contrasts / pairs / timed JVMs | 7 / 84 / **168** | 14 / 168 / **336** |
| Maximum observed + timed probe JVMs | **184** | **368** |
| Shared prepare cap | 150 min | 150 min |
| Legacy assembly / legacy timing caps | 10 / 15 min | 20 / 30 min |
| First decision cumulative active cap | **175 min (2 h 55)** | **200 min (3 h 20)** |
| Controls assembly / controls timing caps | 15 / 45 min | 30 / 90 min |
| Whole-plan cumulative active cap | **235 min (3 h 55)** | **320 min (5 h 20)** |

These are fixed maximum counts/caps, not runtime estimates or a request to
spend them now. A failed first decision consumes no controls budget. Preparation
also has one jtreg-version JVM and two javac invocations; normal image-build
helper JVMs/tools are covered by the prepare cap, not counted as probes. Each
configure command caps at10min, each full image build at60min, other commands
and probes at3min. Per-command maxima cannot extend the shared stage cap.
The five one-shot stages together cannot authorize more compute than shown.
Group cleanup permits about25s bounded process waits per interrupted stage
(125s across five interrupted stages), plus receipt hashing/writing I/O without
an independent hard I/O deadline; this never extends workloads. Run stages
serially on a quiet native host. Any unfinished stage is a stop, not an invitation
to rebuild or rerun inside a newly reset budget.

Mac answers only NEON questions. Linux needs native SVE hardware plus its own
correctness receipt explicitly covering `platform=linux` and
`sve_modes=["default","0"]`. Apple-hosted NEON-only Linux Docker cannot supply
that scope. Disk space for two full worktrees/builds/images must already exist;
no package install, artifact download, object deletion or CI launch is included.

## Reproduce and inspect, with no workload launch

Use Python3.11+, installed Capstone ARM64 decoder, native boot JDK27, compatible
installed jtreg meeting the suite minimum, GNU make4+, normal native build
prerequisites, and whitespace-free absolute paths. Mac uses Xcode/SDK and gmake;
Linux uses GCC16/g++16, mold and taskset. Preserve the selected PATH between
planning and stages. Compiler invocation names such as clang++ are not resolved
away. Supply a clean existing diagnostic-branch harness checkout and a separate
product clone containing the two exact refs above. OUT must be new and external.

```bash
set -euo pipefail
export PYTHONDONTWRITEBYTECODE=1
export HARNESS=/absolute/path/existing-diagnostic-checkout
export PRODUCT=/absolute/path/product-clone
export BOOT_JDK=/absolute/path/native-jdk27
export JTREG=/absolute/path/installed-jtreg83
export RECEIPT=/absolute/path/existing-codegen-result.json
export OUT=/absolute/path/new-staged-current-output
export PLAN=/absolute/path/staged-current-plan.json
export SCOPE=mac # linux requires its own native SVE/NEON scope
unset JAVA_TOOL_OPTIONS JDK_JAVA_OPTIONS _JAVA_OPTIONS CLASSPATH
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" plan \
  --product-repo "$PRODUCT" --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" \
  --correctness-receipt "$RECEIPT" --out "$OUT" --platform "$SCOPE" > "$PLAN"
for stage in prepare legacy-assembly legacy controls-assembly controls; do
  python3 "$HARNESS/qualification/native_unroll/current_campaign.py" "$stage" --plan "$PLAN"
done
```

Planning reads metadata/files/Git and compiler-path discovery; it runs no JVM,
build or probe. The five dry commands report only the immutable saved scope.
The existing Mac receipt may use raw `source` or separately attributed
`source_head` with clean/full-image/checked-marker fields. No repeat or binary
handoff is requested. An uncommitted harness is deliberately rejected.

## Conditional executable commands

No execution is authorized now. These document the complete sequence for later
explicitly authorized stages. A SHA flag prevents accidentally using another
plan; it does not grant actual user permission. Legacy-only authorization does
not authorize controls or either historical follow-up.

```bash
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" prepare --plan "$PLAN" --execute
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" legacy-assembly --plan "$PLAN" --execute
# Only after authorization of the fixed legacy measured scope:
export PLAN_SHA="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["sha256"])' "$PLAN")"
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" legacy \
  --plan "$PLAN" --execute --authorized-plan-sha "$PLAN_SHA"
# Only after legacy passes AND the fixed controls scope is authorized:
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" controls-assembly --plan "$PLAN" --execute
python3 "$HARNESS/qualification/native_unroll/current_campaign.py" controls \
  --plan "$PLAN" --execute --authorized-plan-sha "$PLAN_SHA"
```

Keep complete plan/input/spec/image identities, command/cleanup logs, observed
assembly/XML, pair rows and gate/failure JSON. `qualified=false` remains set even
if these selected cells pass. PR14 stays draft; metadata editing is unrelated.

## Historical questions are separate conditional follow-ups

Original87 is `87edd79d3104ff502f7befec034716b081436f49`; b3 is
`b3ce67e362c3b1678fcf3d18ee714182b2395c86`. Neither is built, observed, timed,
required as a source dependency or pooled into the current decision.

- **Original87 follow-up:** only if a distinct absolute historical recovery or
  compact-gain claim is needed. A current-master pass cannot prove it, because
  intervening master changes may shift both sides. Freeze a separate matched
  full-image pair and only its claim-relevant cells before new authorization.
- **b3 follow-up:** only if the distinct question is retention versus the prior
  PR state, or attribution of an old failing control. It includes integration
  changes and cannot be labeled the isolated current PR/compiler effect.

A failing/inconclusive current decision first returns its concrete code/pair
results for diagnosis; it does not automatically launch historical controls.
No historical extension is executable or budgeted in this runner. A future
follow-up needs its own fixed matrix, samples, caps and authorization. The
superseded four-image plan's unspent budget is not a reusable allowance.

Offline orchestration check, with inert files and mocked builds/probes only:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 "$HARNESS/qualification/native_unroll/test_current_campaign.py"
```
