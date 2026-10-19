#!/usr/bin/env python3
import json
from pathlib import Path

root=Path('/workspace/work/spill-sharing')
folder=root/'followup'
def pct(value):return f'{(value-1)*100:+.2f}%'
def table(path):
    rows=json.loads(path.read_text())
    lines=['| Cell | Median paired change | Per-cell 95% interval | AB / BA |',
           '|---|---:|---:|---:|']
    for x in rows:
        lo,hi=x['bootstrap95']
        lines.append(f"| {x['cell']} | {pct(x['median_paired_ratio'])} | {pct(lo)} to {pct(hi)} | "
                     f"{pct(x['order_medians']['AB'])} / {pct(x['order_medians']['BA'])} |")
    return '\n'.join(lines)

report='''# PR56: activated state checks and negative-result investigation

## Outcome

The integration gap is closed in product/test head
`6deaa92f1f63e239bee76a7d5a5f688c920c9f77`. Keep the existing v5 optimization
policy; neither tested profitability policy has demonstrated a better overall
balance. The new test requires actual sharing in **the exact installed C2
compilations exercised during moving GC, active deoptimization, aliases and
ordered exceptions**. It passes with both ordinary integer spilling and forced
FPU spilling. Original state/output tests remain unchanged.

The controlled same-image experiment independently confirms target-method
decoder gains: **source +4.31% [1.52%, 7.56%]**, **dense +7.01% [6.22%, 8.45%]**.
The synthetic estimate is **+0.18% [-6.13%, 3.51%]**, so no reliable speedup or
loss is established there. Copy remains **-2.41% [-5.69%, 3.29%]** despite matching
code/registers/stack offsets and external-call identities. A strict A/A copy
placebo estimates **+2.43% [-3.24%, 8.63%]** with identical JVM arguments. This
demonstrates relevant variation; it does not prove that every negative is noise,
justify subtracting a calibration, or exclude meaningful losses.

All original whole-JVM stock-v5 measurements, including adverse estimates and
startup RSS +2.65 MiB, remain in the parent report. This targeted experiment is
separate from that qualification, not a replacement or favorable resample.

## Same-method activation and state proof

`TestSharedSpillSharingState` loads 24 arbitrary long values, computes an integer
index, and crosses a noninlined barrier. Its ordinary index copies supply
eligible sibling reloads. The kernel reads four arrays and writes output,
then crosses another barrier and reads output again before its independent
24-value sum and object-state return. The return depends on the transformed
computations as well as all primitive values and roots.

Mode 1 collects **before** the shared array uses, checking moved references used
by transformed code. Modes 2 and 3 collect and actively deoptimize **after** those
uses, keeping their computed partial result, index, output reference, long values
and object roots live. Deoptimization uses both WhiteBox.deoptimizeMethod and
deoptimizeFrames. The interpreter must resume with correct computed values.

Immediately before each checked call, WhiteBox obtains the installed non-OSR
C2 nmethod and its compile ID. In each child VM the driver independently matches
every exercised ID to a positive, unexhausted SHARED_RELOAD_SUMMARY for this exact
kernel. The debug-only summary now includes C->compile_id(). A rewrite in another
method, an earlier discarded compilation or the separate synthetic trigger cannot
satisfy this assertion. Missing C2 compilation fails too.

Both UseFPUForSpilling=false and true are mandatory. Each child passes:

* Four GC/deoptimization states, three forced collections and two active deopts.
* Forty alias cases: output aliases each input, or all arrays alias; boundary
  indices and random values are included. Every array element is compared.
* Sixteen null/bounds exception-order cases, checking exception class/bounds
  details and complete output, including stores preceding the failure.
* Seven exercised C2 compilation IDs, each with eight accepted rewrites and
  exhausted=0 under v5 (five rewrites with the short policy).

That is **120 activation-backed exercises across both spilling modes**. All
11 watched objects move at each of three collections in the observed runs,
33 movements per child. Post-call compilation state confirms active deoptimization.
The original semantic cases, aliases/exceptions and caller-root GC test remain.

The stronger staged fixture passes on the actual unflagged product debug image,
the short-policy debug image and the temporary control build. An explicit negative
control disables sharing only in this checked kernel: its child still completes
all 60 state/output cases and GC/deopt counts, but the driver correctly fails for
missing a positive rewrite. This directly tests the integration assertion that
was absent from the original GC and alias/exception fixtures.

## Source identity and local qualification

Main history is fee0b841 -> c872018 (new fixture and debug compile ID) -> 774c1c0
(both spill modes) -> 6deaa92 (computed state live across deoptimization). The
native product optimization is unchanged. Source diffs prove there is no Oracle
switch, hybrid lambda or changed search distance in PR56.

A complete release rebuild at c872 produces libjvm SHA-256
`a94c99422b9f9cd3404d438d72922e369af38947a8df5e762c8ee61d9dfc53db`,
**identical to the originally measured release VM**. Later commits only change
the separately compiled test. The original source-matched whole-JVM results
therefore remain applicable to the product runtime.

Local GCC14 qualification includes native13 and the complete regalloc group plus
current-master constant-threshold IR selector (14 selectors). After each test-only
change the affected activation fixture was rerun, including the latest staged
120 checks. Earlier codec70/frame85 qualification remains retained; the app,
benchmark classes, exact compressed frames and decoder output are unchanged.

GCC16_STATUS

## Tested policies: six-pair exploratory screen

Before scores, PROTOCOL.md fixed two bounded alternatives:

| Policy | Source commit | Behavior |
|---|---|---|
| Short | `1f4890eda34383c7db7a5babc8b300f621711268` | Search at most eight scheduled instructions instead of 64 |
| Hybrid | `08cac62512bf7ca5c39534c4ae51c5d0bed3b055` | Eight-instruction extensions; farther same-block pairs only within an existing retained live interval |

Both were built as complete release/fastdebug images. Both pass the state/trace
selectors, retain real decoder activation and net savings versus stock. The
later both-mode and staged integration fixture also passes on the short image.
No safety guard was relaxed. Source branches are retained and published.

The screen compares unchanged v5 against each option: six AB/BA pairs per cell,
source/dense/positive/copy, rotating cell and option order. **96 fresh JVM forks,
all exit zero**, no exclusions/retries. Intervals below are exploratory per-cell
95%; six pairs do not establish a final profitable policy.

### Short versus v5

'''+table(folder/'screen/short/analysis.json')+'''

### Hybrid versus v5

'''+table(folder/'screen/hybrid/analysis.json')+'''

The short synthetic point estimate is similar in both order groups, but its
interval spans zero. It gives back some real decoder stack savings: versus v5,
source rolling adds 11 loads/3 stores; dense execute adds 11 loads and removes
one store; dense rolling adds five loads/three stores. Its synthetic normal path
adds one load, one register copy and two instructions, with unchanged stores and
frame. Thus it does not meet the predeclared static-transport promotion gate.
It remains a possible lifetime/latency tradeoff, not an established improvement.

Hybrid accepts exactly the same pairs and emits the same decoder/trigger counts
as short in these captures, but spends extra bounded compiler work. It fails
the predeclared source -2% point-estimate gate and has severe synthetic order
sensitivity. **Reject it as the proposed fix** rather than retune after scores.

Do not promote either policy from these data. An independent short-confirmation
protocol was prepared but **not executed or used as qualification**: the subsequent
causal study does not establish the intrinsic synthetic loss that the policy was
intended to fix, while the policy gives back decoder transport. Retain the patch
and protocol for a separately justified future experiment, without claiming its
gate passed or erasing its observations.

## Same-image targeted on/off experiment

PROTOCOL-SAME-IMAGE.md was fixed before this diagnostic build/timing. Temporary
control source `ab8ff48840705cc85c4a856b94dc014013b93282` adds an Oracle boolean
DisableSpillCopySharing, default false, queried only to skip sharing in selected
methods. Its branch later contains the staged test at a30f307. **This switch is
not part of PR56**. Both experimental arms use the exact same complete release
image (libjvm `9df6e6b5468c0ac4b5b230398dafcc87192bd046153a8bbfbe633c9cf14345f3`).

Equal-length command-file paths select the same target patterns and boolean type:
A disables sharing in those methods; B enables it. Other methods retain v5 policy
in both arms. Source/dense targets are executeSequencesDirect and
decodeSequencesRolling; synthetic targets its original kernel; copy targets its
actual JMH copy stub, a mechanism-negative control. Only the original synthetic
cell forces FPU spilling in both arms. The application and benchmark are unmodified.

Exactly **12 alternating AB/BA pairs per cell, 96 fresh forks**, interleaved and
rotated by pair, one JMH thread, affinity0-3, SerialGC512MiB, ActiveProcessorCount4,
explicit CDS-on, three1s warmups and five1s measurements. Median of five per fork,
median paired B/A ratios; 20k whole-pair bootstrap seed20261019. No build/test/
diagnostic JVM overlaps primary timing. All96 exit zero, all118 payload files,
directive files and the VM hash remain unchanged. Full raw scores/orders retained.

'''+table(folder/'same-image/analysis.json')+'''

These are **local target-method effects inside one JVM build**, not whole-JVM
stock-v5 estimates and not simultaneous confidence guarantees. Source/dense gains
survive both order groups. The synthetic is not a demonstrated speedup; its
interval still permits meaningful loss. Copy's adverse estimate remains visible.

Before timing, both arms passed85 full-output/offset/canary frame checks. Default
policy passed the staged120 integration checks and native13. Complete allocated
C2 code was captured for source/dense plus actual JMH dense/synthetic/copy. The
synthetic removes eight stack loads and five instructions, adds three register
copies, no stores/frame growth. Its JMH stub is unchanged. Copy has identical
canonical instructions, registers, stack offsets, internal targets and external
call identities. The original replacement-spill explanation is **not supported**.

Full fixed-operation captures retain net transport removal in the decoders.
Actual JMH dense rolling removes12 loads/six stores with two extra register moves;
dense execute removes four loads but adds two stores (static load bytes -4,
store bytes +20), frame unchanged. Preserve that adverse local transport detail;
do not claim every individual path wins. These are static counts, not hardware
executed-load/cycle measurements. Fastdebug profile estimates in prior evidence
are qualitative and cannot be applied as exact product weights.

One generic parse found eight missing bytes in a C1 OSR diagnostic stub where
console output interleaved. It is retained. account-c2.py explicitly selects
**all C2 headers, including OSR**, with the original full-coverage assertions;
no C2 record is dropped for missing bytes. Every selected C2 record is complete
with zero undecoded bytes/unknown stack widths. Logging-fork throughput is never
used as primary data.

## Strict A/A copy placebo

PROTOCOL-PLACEBO.md fixed a separate null test before timing: both nominal arms
use the same image, same command-file path/content and identical benchmark-JVM
arguments. Twelve AB/BA pairs,24 fresh forks, same settings/statistics as above.
All24 pass; command equality is asserted.

'''+table(folder/'placebo-copy/analysis.json')+'''

This null variation is comparable to the negative copy point estimate. It does
not identify a single cause, justify adjusting/subtracting earlier estimates,
or establish regression-free behavior. Keep the original unfavorable cohorts,
the same-image adverse estimate and all uncertainty. Do not repeatedly sample
until the control becomes favorable.

## Runtime-image controls and retained failures

Initial new policy builds differed from an older v5 reference in generated
classlist/CDS contents: sandboxed classlist generation omitted several IPv6/network
classes. This was caught **before any option timing**. An unmodified v5 reference
was rebuilt under the same conditions. All three modules archives, classlists and
CDS archives then matched byte-for-byte,521 runtime files matched, and only VM,
its containing jmod and release identity differed. All Java paths were52 characters
and explicit CDS-on preflight passed. No complete runtime image was patched to
equalize contents. The old mismatched copies remain retained.

Keep the rejected unprofiled first fixture, sandbox loopback failures, deliberately
failed activation control and generic C1 parse failure. A missing activation was
fixed by supplying real profile/fixture preconditions, not weakening the assertion.
Temporary compiler controls, prototypes and benchmarks live in this evidence and
separate branches, never in the focused product diff.

## CI status

CI_STATUS

## Reproduction

Raw measurements live in screen/short, screen/hybrid, same-image and placebo-copy.
The same-image and placebo analyses use the unchanged numeric12-pair method in
the parent tools/analyze.py. analyze-screen.py changes only pair count to six
and resolves result basenames locally. Protocols and runners are included.

```sh
python3 ../tools/analyze.py same-image
python3 ../tools/analyze.py placebo-copy
python3 analyze-screen.py screen/short
python3 analyze-screen.py screen/hybrid
```

Per-fork JMH JSON retains all five iterations. runs.json retains commands, order,
status and controls. Code comparison JSON includes complete source records and
the emitted .bin/.asm files. jtr/child logs prove installed C2 IDs and GC/deopt,
alias/output/exception state. Oversized raw decoder TraceSpilling transcripts
remain locally retained with path/size/SHA inventory; complete target code,
activation records and state-test child logs are published. Full JVM images and
build trees remain local and hashed. Parent evidence and historical branches are
unchanged. SHA256SUMS at the experiment root covers the final published package.
'''
gcc=folder/'gcc16-final-status.md'
ci=folder/'ci-final-status.md'
report=report.replace('GCC16_STATUS',gcc.read_text() if gcc.exists() else 'A clean complete GCC16.2.0 build/check is in progress; do not treat it as passed.')
report=report.replace('CI_STATUS',ci.read_text() if ci.exists() else 'GitHub current-head workflow39193137827 remains queued before its Prepare job receives a runner. Repository diagnosis found16queued runs, none executing, with the oldest over six hours old; official runner documentation confirms the ubuntu26.04 labels are valid. No other work was cancelled and no workflow/settings change was made without evidence. This is pending provider execution, not a passed CI result.')
report += '\n![All targeted and strict null observations](targeted-and-placebo.png)\n\n![Both policy screens, every observation](policy-screen.png)\n'
(folder/'README.md').write_text(report)
print('Wrote final follow-through report with explicit current status')
