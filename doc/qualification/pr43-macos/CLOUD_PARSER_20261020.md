# PR43 cloud parser and compiler diagnostics, 2026-10-20

PR43 source is `2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1` on the existing
`codex/aarch64-consolidated-compiler-fixes` branch. It remains draft/unmerged.
All changes from the accepted native Mac source `3afce4988dc00fba614929d5f6f10c873afde87e`
are copyright notices in 11 files; compiler and regression-test logic is unchanged.
The prior reported Mac NEON result is retained at its actual source/image identity.

## Parser source and functional result

The motivating 128-bit stage-1 path belongs to parser commit
[`afee2c32e1b8070a20214e8728079d6759663c8f`](https://github.com/simdjson/simdjson-java/commit/afee2c32e1b8070a20214e8728079d6759663c8f),
which adds 128-bit species support. This is one commit beyond current upstream
`main`, `a4044aa94deb7144c09f1030a5f40bcb73aaf26b`. That main revision does not
contain the 128-bit path. The upstream-main control rejects
`-Dorg.simdjson.species=128` with `IllegalArgumentException: Unsupported vector species: 128`.
Source and future performance claims must name the parser revision and selected species.

The four parser source files were fetched at the exact immutable commit.
StructuralIndexer and VectorUtils match Git blobs
`f4409e0a2a420e210a6c5189684ab5a9602d2605` and
`8bc208255d23475e8d7e2d2aa1bc58b20d55d6c5` respectively. They are unmodified;
the probe invokes the actual package-private indexer rather than a packing-only
substitute. Upstream parser sources are fetched and hash-checked by the probe,
not vendored into this OpenJDK branch.

[PR43ParserProbe.java](cloud-parser-probe/PR43ParserProbe.java) supplies an
independent lexical oracle and a deterministic corpus: 1,441 valid cases,
including random documents, all 192 byte alignments around 16/64-byte boundaries,
escaped strings, UTF-8 and a large document; 260 malformed-string cases must be
rejected. The 3,000-call warmup exercises the actual index128 entrypoint and both
escape paths. There is no timer, throughput measurement or JDK-version comparison.
All 1,701 checks passed with the existing Linux x64 JDK 27+35-2325.

## Current native CI and local build

Existing ordinary [run 39266688701](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39266688701),
attempt 1, passed all 57 jobs for the current head. Its actual merge source is
`f09e3bcdd4ab29af3270136ca02bc12674b337e1`, tree
`7e9be0fb61d956b8982a01d1d12279d9e1faad6b`, with parents
`e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4` and the PR head. Live master was
`70c91df3528a9c95bfde606a8fbe1bfaee957271` when this work started.
No build image is relabeled as the detached-source Mac image.

Linux AArch64 compiler job `118125028478` explicitly executed and passed both
new mask tests. The SVE launcher has a `vm.cpu.features ~= ".*sve.*"` guard,
so this job advertised the required SVE CPU feature and ran its driver.
Its effective Test VM flags, applicable-rule inventory and matching phases
are not present in the aggregate log. Compiler support for the SVE ACLE is
not used as runtime capability proof. This is supporting SVE execution
evidence, with no new detailed-exclusion acceptance claim.

The selected cloud host is Intel Xeon Platinum 8370C, Linux x86_64, five visible
logical CPUs with a four-CPU cgroup quota, and 16 GiB memory. A fresh current-head
fastdebug build uses preinstalled GCC 16.2/JDK 27 and four jobs. The initial build
exited 2 on `-Werror=nonnull` in existing `runtime/handshake.cpp`. A fresh bounded
follow-up adds only this make override:

```text
BUILD_LIBJVM_DISABLED_WARNINGS_gcc_handshake.cpp=stringop-overflow nonnull
```

The generated handshake compile command retains the original suppression and
adds `-Wno-nonnull`; other source/configuration is unchanged. This is a local
diagnostic-build adaptation, not a runtime source fix or native ARM qualification.
Each build attempt has a fresh 1,800-second controller. No package was installed.

## Actual current-head C2 records

The adapted fastdebug build completed successfully. The actual indexer passed
all 1,701 checks again on that image. Its hashes stayed unchanged:

```text
java    cbafac412314887d920af96176391ebcc2f9a88da90b4b9f058045caf6544030
libjvm  f17037b5316c568c408d8d65a2454574b6610a2042d7c748b9b23f7c4bf97f80
```

C2 installed OSR compile `618` and normal compile `619` for the 1,324-byte
`StructuralIndexer.index128` method. Both retained BEFORE_MATCHING, MATCHING
and REGISTER_ALLOCATION records, plus installed-code output. Each before-matching
graph has exactly 40 `VectorMaskToLong` nodes, all taking a single-use
`VectorStoreMask` with element-size constant 1 over a `VectorMaskCmp` of type
`#vectorx<B,16>`. Bytecode locations split into 20 loop and 20 tail sites.
This proves real parser front-end formation at the recorded x64 flags; actual
AArch64 rule selection and allocated ARM code remain separate gates.

No target compilation failure was recorded. Compile `619` stayed installed
through all 1,441 valid cases. After `PR43_VALID_COMPLETE`, the malformed-string
controls reached the unprofiled error branch at bci 1293; one `unstable_if`
runtime trap made `619` not entrant. Therefore this semantic/error-path probe
is not credited as stable C2 execution through every malformed input, nor as a
benchmark workload. Compiled trap sites are not counted as runtime events.

The original reader exit was 1 because it expected the human-readable phase
name `Before Matching` while the VM emitted `BEFORE_MATCHING`. The VM itself
completed all 1,701 checks and retained all six phase blocks. The reader now
accepts both label forms and was verified against those existing records.
No JVM rerun was needed. The original receipt and executed runner are retained
alongside the explicit review correction, so the original error is not erased.

[The evidence directory](cloud-parser-evidence/) retains raw console/C2 XML and
configure/build logs as gzip, image/source/CI receipts, complete node analysis,
the original and corrected review outcomes, and a SHA256 manifest. The earlier
native CI archive identities remain GitHub-reported archive hashes, distinct
from the locally computed x64 `java`/`libjvm` hashes above. Both scalar generated
section and complete vector m4 parity passed at current head. No compiler/runtime
source fix is justified by the available results, so product source is unchanged.

## Allocation question and exact remaining hardware work

The parser loop contains 20 source mask-toLong operations per 64-byte block,
with another 20 in the tail. If all loop sites select the fused ARM rule, each
has four weight MOVs and DUP inside its Mach node: 100 weight-materialization
instructions per source iteration, with no C2 hoisting/sharing of those pieces.
This is conditional source accounting, not installed-code or performance evidence.
The vector temporary must remain distinct from the raw mask because DUP
defines it before AND reads the raw mask. The previous spill-free byte128 and
block64 captures do not resolve the full parser's allocation and live ranges.

The [bounded probe](cloud-parser-probe/probe.py) downloads only four pinned Java
sources, verifies hashes, uses an existing stamped fastdebug JDK and a new output
directory, and retains compiler phases, compilation/deoptimization records and
installed-code output. It builds no JDK, installs nothing, dispatches nothing
and contains no performance timer. `analyze.py` associates nodes with actual
installed compile IDs and separates runtime events from compiled trap sites.
Use a fresh output directory and a new explicit budget; an existing output is rejected.

```bash
python3 cloud-parser-probe/probe.py --jdk /path/to/existing/stamped-fastdebug \
  --source-sha ACTUAL_IMAGE_SOURCE_SHA --mode neon-arm64 \
  --seconds 180 --out /new/output/directory
python3 cloud-parser-probe/analyze.py /new/output/directory
```

| Question | Suitable execution and limit |
| --- | --- |
| Parser source, scalar semantics and C2 front-end formation | Cloud x64 can answer these at the recorded source/species. It supplies no ARM matching or allocation credit. |
| Actual full-parser ARM matching, moves, spills and live ranges | Native Linux AArch64 or macOS AArch64 can answer these; Harry's local Mac is not inherently required. Retain actual nmethod bytes and decode them. Force UseSVE=0 only when deliberately probing NEON on Linux, and label that mode. |
| Apple-specific scheduling/profitability | Requires matched native Apple hardware for the claimed generation. A different Mac CI generation can answer its own codegen/functional question, not establish Apple M6 profitability. |
| Nonzero-SVE exclusion | Requires a freshly verified SVE-capable native host and effective flags/phase records. The existing guarded Linux CI execution identifies a useful pool; the Apple NEON check cannot substitute. |
| Profitability | Not measured here. Fresh native paired/interleaved runs must use identical parser source, controls, image configuration and hardware. For the new rule, compare current source with `456afea88231bc9ebf17dfa48811db90a8bae8b8`, holding C1 and earlier ARM fixes constant. x64 timing cannot answer this ARM-only change. |

The existing `make-arguments` input appends to the product/test-bundle build;
it does not replace that build or select the 12 fixed tier1 test groups. After
explicit authorization for a scoped diagnostic entrypoint, the existing
qualification branch adds a default-false `pr43_native_parser_probe` boolean
to the registered `main.yml`. Only a manual dispatch with that input true
skips ordinary preparation and runs one 15-minute job on the existing
`ubuntu-26.04-arm` pool. Push, PR and default-false dispatch behavior is preserved.

The job reuses current run `39266688701` artifact `12194059473`,
`bundles-linux-aarch64-debug`, with GitHub-reported archive digest
`sha256:b25f7a24708dea4147028dd5520d4ba09cce9b82bcedb28e652890a5f1d6857e`.
It fails closed if the product head, draft state, successful CI identity,
artifact identity, or merge tree/parents change. Its JDK source is the actual
CI merge `f09e3bcdd4ab29af3270136ca02bc12674b337e1`, not the detached PR head.
The pinned download action performs its transfer/digest check in managed CI;
the helper receives extracted files and does not independently hash the outer
ZIP. Its receipt distinguishes that API archive digest from separately computed
inner-tar, executed-java and libjvm hashes; the action's verification log is
retained with the run.

The untimed JVM has a fresh 180-second budget and forces NEON with `UseSVE=0`.
It retains full raw phases, parser results, installed nmethod bytes, native GNU
objdump output and a known-byte decoder control. Physical operands and the
four-MOV weight constant are checked for all 40 fused sites in each captured
parser nmethod. Allocation-node records and SP-relative accesses are retained
for review; SP-relative frame/call state alone is not classified as spilling.
Partial records are uploaded even if capture or analysis fails. No JDK build,
package installation, timing or historical evidence recovery is part of this
entrypoint. Native results must be reviewed at their actual run/source identity.

Independent read-only review approved helper SHA256
`98c087b4764b6808544bcb8e658034817699f78a82252f7332b59cc5cb223450` and
workflow SHA256 `5b51853d0121bd796785447c44527e4dda480e217884f56680c2a783716b4e3f`
before dispatch. Static verification compared every ordinary job, permission
and concurrency definition with the prior revision. The byte reader recovered
both complete retained x64 nmethods at their declared lengths, rejected missing
bytes, and passed positive/negative synthetic constant and physical-register
controls. Reason-specific allocation-copy extraction was checked against the
retained x64 allocation phase. These are reader/workflow checks, not native
ARM execution evidence.

No historical artifact-transfer route was retried, no new run is claimed to
recover old paired captures, and PR39 was not modified or used. Historical
capture unavailability remains the completed decision already recorded.
