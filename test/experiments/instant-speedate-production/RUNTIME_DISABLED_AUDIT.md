# Runtime-disabled dispatch: source correction; launch HOLD

This is a retained-evidence and source investigation, not a new performance
result. On 2026-10-17 no JDK, test, benchmark, build, CI job or installation was
run. Only existing CSV data were re-analyzed by `analyze_disabled_evidence.py`.
The source correction below removes proven unnecessary work. Whether it removes
the historical time difference, and whether a residual compiler/layout effect
remains, are unmeasured. **Do not launch the broad qualification matrix yet.**

## Exact evidence and what is missing

`retained-disabled/MANIFEST.json` pins byte-for-byte copies from integration
commit `2a62302b1e46de454584a2ea68f0f3f0669c2ce5`. Its original RESULTS/PROTOCOL
and all 360 rows remain unchanged, including their original conclusions. This
audit narrows those conclusions; an old PASS does not cover runtime disabling.
Original trailing whitespace/blank lines in raw captures are retained to preserve
their hashes; source-diff whitespace checks exclude these unchanged raw bytes.
Reproduce the data analysis without launching Java:

```bash
python3 test/experiments/instant-speedate-production/analyze_disabled_evidence.py
```

| Identity | Retained value / limit |
|---|---|
| Supplied baseline | `89885a6288e7aaabd01678a704a586272c0f96e3`; production src/make matches prototype commit `fdb9621ae74b4495cb23f7e66f30f9083a914b78` |
| Measured baseline image | `/tmp/instant-baseline-source/build/qualification-baseline/images/jdk`; release SOURCE `.:git:fdb9621ae74b`; normal full-image build log retained |
| Measured enabled and runtime-off image | `/workspace/openjdk-jdk27u/build/instant-speedate/images/jdk`; release SOURCE `.:git:fdb9621ae74b+`, a dirty integration checkout; the two routes share this one image |
| Baseline `lib/modules` SHA256 | `b40e907171268f487898618a8fa568838ceb0d101ad405cfe1ffd27ac7411e18` |
| Enabled/runtime-off `lib/modules` SHA256 | `694c112e12bfa8ca62673d3670b4dd7818e92c766fc8264f2cbf1d7bffa65764` |
| Enabled `libinstant.so` SHA256 | `6a67eb10af08647bd598918b3bfeee8d8f49036f3a39414e5bcda7e7f0c19f5f` (disabled calls never invoke it) |
| Runtime | Linux x86_64, AMD EPYC9V74 under KVM; OpenJDK27.0.2 internal, release/server HotSpot; C1/C2 features enabled; no HotSpot src delta baseline to integration |
| Native compilers/profile | GCC/G++16.2.0, mold selected through profile/link flags; `-march=x86-64-v3 -mtune=generic`; Rust1.99.0 `b940084d7`, Cargo1.99.0 `5f94df478`, x86_64-unknown-linux-gnu/x86-64-v3; boot JDK27+35-2325 |
| Driver source | Original `run.py` Git blob `6aa4fc12554a0f7574635036fe2897abd5b5e080`; retained next to data |
| Workload source | `ProductionProbe.java` Git blob `341be4b8917533314fb71d76e38636f872d36334`, identical at integration2a62302b1e4 and review779753e390e; Java source and counts are not a hash of executed class bytes |
| Parser before this correction | `InstantParser.java` Git blob `ba3443f7a48361e16b67117c7ed8f9d07e842f2e`, identical at integration2a62302b1e4 and review779753e390e |
| Timing flags | `-Xms256m -Xmx256m -XX:ActiveProcessorCount=2 -XX:+UseG1GC -Xbatch`, explicit `-XX:+CompactStrings` or `-XX:-CompactStrings`; disabled adds only `-Djdk.time.instantSpeedate=false` |
| Compiler evidence missing | No production-disabled LogCompilation, PrintInlining, compilation-ID/level/OSR record, compiler-time counter, deoptimization record or generated-code identity; no historical `libjvm.so`/probe-class/cached-patch-class SHA256, full baseline configure capture or effective runtime-flags/environment capture |

The dirty image's tracked diff summary plus later identical committed Java/C/Rust
sources support attribution to the earlier integration, not an exact complete
build-input manifest or qualification of review779753e390e. The cached Java
control patched a baseline module: it was not a separate normal image, and its
unretained class hash prevents exact binary reconstruction. Do not present its
speed as evidence of identical compiler state. The retained trace is explicitly
the older `SpeedateInstant` prototype's **invalid** corpus; it cannot establish
production-disabled inlining. GCC/rustc identities do not identify C2 decisions.
The configure linker probe reports GNUld2.44 while the profile adds the mold
selection flag; no retained mold executable hash/version identifies the actual
linker binary. No exact native/JIT binary identity is inferred from that probe.

## Workload, controls and warmup

The canonical HAPPY corpus has eight fixed literals: years2026/2000/1969/0000/
9999/1970/1900/2400 and fractional lengths0/6/6/6/1/2/3/5. Every input is eligible.
MIXED rotates eight entries: four native hits, a9-digit input, an offset, and two
invalid calendar dates. INVALID rotates twelve entries, only two of which reach
native calendar validation in an enabled image. Runtime-off invokes Java for
every entry. The loop consumes `(epochSecond ^ nano)` or parse error index and
stores each result/exception in a volatile sink. Baseline/disabled checksums and
allocation volume agree in all six storage/corpus groups (HAPPY1209B/op in both).
That establishes neither identical escape analysis nor identical instructions.

The fixed driver ran three JVMs per route/corpus/storage group, 400000 warmup
calls, then five200000-call rounds. Round0 alone was excluded, so each retained
round follows at least600000 calls. `loop()` is entered once for warmup and once
per measurement; printing/formatting happens between rounds. These facts make
first-use class initialization an implausible direct contribution to each
retained round. They do not establish compiled-code stationarity: `-Xbatch`
waits for requested compilation, not for all future recompilation/deoptimization
to stop. There are no retained compile/GC counters. A400k single loop can promote
OSR code without proving final normal-entry caller inlining.
The phase change is visible: compact-on disabled HAPPY round0 is about497ns in
all three forks, then retained medians407–428ns; enabled round0 is197–212ns
versus retained99–121ns. This is another reason a warmup count alone cannot
establish a plateau or assign the difference to the initial property lookup.

Order rotates only three of four possible orders: B,C,E,R; C,E,R,B; E,R,B,C.
There is no R,B,C,E order, independent before/after identical-baseline sentinel,
or fixed-frequency/host-interference evidence. Both storage modes were run in
separate successive groups. There is an unchanged baseline route per group but
no evidence that its generated code and host conditions stayed unchanged.

| Corpus / CompactStrings | Baseline pooled ns | Runtime-off pooled ns | Pooled loss | Per-fork median losses |
|---|---:|---:|---:|---|
| happy / on |368.849|411.132|11.463%|17.031%,6.404%,19.975%|
| happy / off |412.2125|438.566|6.393%|2.332%,7.542%,6.694%|
| mixed / on |755.981|775.529|2.586%|0.035%,4.009%,1.332%|
| mixed / off |739.6405|784.567|6.074%|4.379%,7.436%,8.987%|
| invalid / on |1171.6775|1143.0385|-2.444%|-2.027%,-0.343%,-7.922%|
| invalid / off |1254.835|1257.249|0.192%|0.533%,2.648%,-8.771%|

Canonical is slower in all three forks in both modes; off-mode mixed is also
slower in all three. These are credible regression concerns, not a reason to
ignore the signal as noise. However the precise6–11.5% recurring cost is not
established independently of compilation/layout/warmup and host effects.
For example compact-on HAPPY fork0 baseline retained344.753–394.046ns
(max/min1.143), disabled406.524–508.848ns (1.252). Fork2 baseline1.252 and
disabled1.143 also fail the new1.10 spread screen. Conversely compact-on HAPPY
fork1 and off-mode HAPPY fork1/2 have small spreads and still lose6.4–7.5%.
No old row is discarded retrospectively. `reanalysis.txt` gives all per-fork
medians, spreads and two-block-tail/head ratios; these are descriptive, not
application of a new six-block acceptance protocol to four old blocks.

## Startup, dispatch and code shape

Previously a public String call reached `eligible(text)` first, then the VM boot
check, the volatile `failed` read, and `Library.available()`. The initial eligible
disabled call initialized the holder/AtomicInteger, read the saved property and
stored UNAVAILABLE. Every subsequent eligible call still scanned its input and
read the AtomicInteger state. There is no JNI call on this route. Ineligible
String calls also paid their portion of eligibility before original Java parsing.

Initialization/property lookup is one-time; it is paid during warmup. It may
influence subsequent compilation/profile state but cannot directly be charged
once per retained operation. Early compilation/OSR and caller inlining changes,
branch/volatile-load costs and compiled-code placement are distinct hypotheses.
The source proves recurring work exists, not its nanosecond decomposition.
Historical fresh-process first parse medians were9.005ms disabled vs9.100ms
baseline and whole-process41.076ms vs41.663ms. Those separate unpaired first-use
cohorts used ten fresh JVMs per route, CompactStrings-on/G1/256MiB/CPU2 and no
-Xbatch; route groups ran successively. They do not explain warmed losses or
prove a startup improvement.

The correction uses this order:

```
!VM.isBooted() || !RuntimeConfig.ENABLED || failed || !eligible(text)
```

`RuntimeConfig.ENABLED` is a final boolean from the same saved startup property
and the same exact lowercase`false` rule. The boot short circuit is mandatory:
VM.getSavedProperty throws before saveProperties, and preboot calls must not
freeze a temporary disabled state. The holder does only the saved-map lookup;
it performs no loader operation. Disabled calls bypass input inspection,
failure-state reads and Library initialization/state. The nonwaiting CAS/load
algorithm, native ABI, grammar/calendar validation and original formatter call
are unchanged. Later live property mutations still cannot enable the route.

C2 may fold the final property value after holder initialization. That is not
proof of elimination at the caller: the VM boot volatile read, public
instanceof/helper wrapper and possible call boundaries remain. Reordering the
guard cannot guarantee original runtime-disabled bytecode or inlining/layout.
A second mutable cache with a Stable annotation could try to bypass the boot
read after startup, but adds publication/compiler assumptions without a retained
trace demonstrating that remaining cost. No such tuning is justified here.
Putting a saved-property initializer directly in Instant's class initialization
would make early startup depend on saved-property availability; changing VM boot
or the formatter to restore exact public shape would broaden this repair.
Configure-disabled images retain the compile-time constant that removes the
hook; they remain the exact-bytecode control, subject to a fresh full-image proof.

The new standalone jtreg test covers both CompactStrings modes, preboot parsing
without RuntimeConfig/Library initialization, a live-property mutation before
VM boot completes, the private null guard-order sentinel, unchanged public
values/errors including null/custom sequences, and an uninitialized Library.
It is **written and statically reviewed, not executed**. No historical result
qualifies this source correction.

## Minimum fixed comparison before the broad matrix

Launch remains HOLD. After a separately authorized execution, first run the
focused regression on normal enabled/configure-off images and existing
bootstrap/JNI_OnLoad/oracle checks. Then use **one fixed canonical G1 comparison**
with these predeclared controls, not a search over warmup lengths or tiny repeats:

* Normal pre-correction image from779753e390e and corrected image from the frozen
  commit containing this audit, both with startup propertyfalse; normal complete
  configure-off image from the same corrected commit. Record actual image/module/
  libjvm/release and probe-class hashes, source cleanliness, build/config/tool
  identities and effective flags. Never silently rebuild or change a cohort.
* For each image use two separately compiled copies of QualificationProbe.java,
  identical except for the one `Instant.parse(values[i%values.length])` call in
  `loop`: public versus `DateTimeFormatter.ISO_INSTANT.parse(values[i%values.length],
  Instant::from)`. Keep the class/method name, corpus, sink and loop bytecode
  otherwise unchanged; separate classpath directories, no module patch. Retain
  both sources/classes and the exact one-line diff. This within-image direct
  formatter route is an unchanged work control, not an alternative product.
* Same eight HAPPY literals, both storage modes, G1/256MiB/ActiveProcessorCount2/
  -Xbatch. Two forks per route, all six routes forward then reversed:24 timing
  JVMs. Each uses the existing64x125000 warmup (8million) and six500000 blocks.
  No extra samples, warmup extensions, dropped blocks or acceptance from pooling
  disagreeing forks. Keep separate compiler diagnostics for all12 combinations,
  outside timing; require C2 normal-entry as well as OSR distinctions and retain
  full inlining/compilation/deoptimization records.
* Apply the frozen stability/allocation/compiler/GC checks from QUALIFICATION.
  Record all144 measured blocks and24 per-process medians without
  converting missing/unstable controls into success. A reproducible public-only
  reduction in the corrected image, with direct controls/configure-off stable,
  supports dispatch removal. A shift in both call forms supports image/host/code
  effects. Residual public-only loss requires inspection of the corresponding
  C2 caller/callee boundaries and layout, not another guard guessed from timings.
* Both corrected forks losing against the configure-off public route is HOLD,
  even below3%. Disagreement, unstable unchanged controls, absent compile proof,
  or shifts inside unresolved noise are INCONCLUSIVE/HOLD; no GO. Source-level
  guard removal alone cannot release this gate. Keep every established failure
  or HOLD even if a later check times out. Correctness/safety failure is NO-GO.
  In each fork the old-to-new public improvement must also exceed the maximum
  observed absolute control movement (new-direct/old-direct, off-public/off-direct,
  new-direct/off-direct). This fixed conservative envelope is not a statistical
  confidence interval; it prevents declaring tiny changes inside observed control
  movement a causal success without adding samples.
  The normalized public change `(new-public/old-public)/(new-direct/old-direct)`
  must be<1 in both forks. Each unchanged-control ratio must be<1 and within3%;
  consistent positive loss, opposite signs or exact equality do not pass as
  resolved noise. All normal-entry C2 loop compilations being invalidated or
  deoptimized is INCONCLUSIVE, as is interleaved/truncated reporting. Separate
  compiler JVMs cannot prove timing-fork generated-code identity or exclude
  compilation smaller than the millisecond counter's resolution.

This is264million timed+warmup public/direct parses plus diagnostics, not the
2.068billion-parse broad timing matrix. It does not establish mixed/fallback,
collector or platform performance; those remain in the subsequent full packet.
`disabled_comparison.py` and the causal mode of `build_and_qualify.sh` freeze the
comparison in Git. Their source is unexecuted and requires separate execution
authorization; this document does not authorize or launch it.

## Boundaries and access

Only Instant is included. No LocalDate/LocalDateTime results or changes are
transferred. No handwritten date parser, assembly or timezone replacement was
added. An unrelated read-only recursive enumeration encountered permission
denial on `/tmp/codex-daemon-1000`; it was not bypassed. All relevant retained
evidence and source files were accessible. No approval action was rejected.
