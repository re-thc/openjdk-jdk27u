# Scalar downcall templates: source and test reproduction

This candidate moves classfile construction for one exact default scalar
`int -> int` downcall recipe to the normal JDK build. The producer calls the
production `BindingSpecializer` emitter and requires identical bytes for the
Linux x86_64 SysV and AArch64 recipes. Each runtime downcall still defines its
own hidden class with its current leaf method handle as class data. Native
entry points, ABI moves, transitions, invocation bytecode, symbol checks and
scope acquire/finally release retain the existing implementation.

Unsupported platforms and recipes are rejected before generated metadata is
initialized or ABI storage tables are scanned. Potential matches still require
the complete recipe and ABI/storage checks. A producer whose native byte order
cannot generate the supported recipe emits empty metadata instead of failing
the cross build. Missing, incompatible or corrupt template data uses the
existing runtime emitter. There is no new production flag or public API.

Formatting and test hardening do not change the emitter, recipe, encoded bundle
format or validation algorithm. Content-derived source/build IDs will refresh
on a normal rebuild because the source files are identity inputs. Do not reuse
an old ID to make a new image appear source-identical.

These are source-level changes, not a qualified speedup. In particular, the
earlier handwritten adapter has a control-passing retained C2 slowdown hold
(baseline/candidate elapsed ratio 0.95767, 95% CI [0.87993, 0.99977]). Its cause
is unresolved. The generated-adapter design avoids that helper's parameter-leaf
disadvantage, but matching invocation bytes does not establish equal retained
performance. Later template measurements failed unchanged controls. Neither
this source repair nor its tests clears either limitation.

## Build and test from source

Start in a clean checkout of this candidate on a native Linux x86_64 host. Use
ordinary build dependencies as described in [building.md](building.md), an
installed Boot JDK 26 or 27, and compatible jtreg. Set `FFM_BOOT_JDK`,
`FFM_JTREG` and `FFM_JOBS` to their installed paths and fixed build parallelism.
No prebuilt experimental image or external BUILD_JDK is required: normal make
creates the in-tree build JDK. Run the baseline first in the same checkout so
the candidate can reuse the unchanged native objects.

The following commands are instructions for a future authorized run. They have
not been executed for this source revision. Use a new `FFM_RESULTS` directory
and retain all logs and outputs; do not overwrite an earlier experiment.

```sh
FFM_BASE=02324e6bd026411407983df06284cd79460c33f6
FFM_CANDIDATE=$(git rev-parse HEAD)
git diff --check
git status --short
# Require a clean checkout before switching revisions.
git switch --detach "$FFM_BASE"
export SOURCE_DATE_EPOCH="$(git show -s --format=%ct "$FFM_BASE")"
bash configure --with-conf-name=ffm-release --with-debug-level=release \
    --with-boot-jdk="$FFM_BOOT_JDK" --with-jtreg="$FFM_JTREG"
make CONF=ffm-release JOBS="$FFM_JOBS" images
cp -a build/ffm-release/images/jdk "$FFM_RESULTS/base-jdk"

git switch --detach "$FFM_CANDIDATE"
make CONF=ffm-release JOBS="$FFM_JOBS" images
cp -a build/ffm-release/images/jdk "$FFM_RESULTS/candidate-jdk"
make CONF=ffm-release JOBS="$FFM_JOBS" test \
    TEST="test/jdk/java/foreign/DowncallTemplateTest.java test/jdk/java/foreign/TestLinker.java test/jdk/java/foreign/callarranger"
```

`DowncallTemplateTest` has separate `fallback` and `templates-required` test
descriptions. The first runs optional default selection and forced verification
fallback, allowing intentional empty-metadata images. The second runs explicit
`required` mode: on supported native Linux images, empty metadata, a missing or
invalid bundle, nondefault specializer configuration, or null selection fails
the test. Unsupported hosts explicitly report fallback. A supported-image
qualification must pass the required description; fallback coverage alone
cannot qualify template installation.

The test compares bytes against both ABI emitters; checks identity, version,
checksum, malformed headers and truncated header/payload rejection; rejects ABI
and binding storage mismatches, capture state, options and unsupported recipes;
and exercises heap-symbol, closed/wrong-thread scope rejection, throwing-leaf
cleanup and concurrent independent specializations. Synthetic leaves avoid
native calls, so this does not replace native ABI coverage. Record the source
commit/diff, configure arguments, toolchain and build-JDK identities, generated
source binding, native-file hashes and extracted module differences. Unexpected
native differences must be explained before timing. A clean candidate build
must also confirm that success does not depend on stale incremental assets.

## Next complete qualification milestone

One bounded execution authorization should cover the following complete Linux
x86_64 milestone, including preparation, diagnostics, collection and analysis.
Successful stages proceed without another per-step approval request. An invalid
stage stops the job with all evidence retained. This source-review publication
does not authorize execution.

1. **Prepare images and correctness evidence.** Use one native Linux x86_64
   executor with ordinary installed build dependencies, enough resources for a
   normal JDK build, and coherent child/process/accounting visibility. Pin the
   base, candidate, harness and toolchain. Build the release pair by the normal
   commands above; check native/module identities, template installation and
   exact x64/AArch64 payload equality. Run both new jtreg descriptions, targeted
   linker/callarranger and native ABI/lifetime tests, then the broader foreign
   tests. Confirm a clean candidate build and normal cache invalidation/reuse;
   run candidate fastdebug correctness separately. Preserve logs and failures.
   Capture actual child/TID placement, cgroup membership, counter units and read
   bounds during this ordinary preparation; a synthetic fixture or requested
   taskset mask does not attest the Java child. No namespace/security changes,
   tool installation or CPU reselection after failed admission is included.
2. **Freeze measurement inputs.** After preparation passes, record image,
   source, native library, harness, command-line, CDS and plan hashes. Produce
   separate compiler diagnostics establishing the intended loop levels with
   the same warmup/counts, then end build/test/diagnostic activity before timing.
   Freeze the complete fork order and all acceptance rules below. There is no
   separate five-second provenance-only experiment and no adaptive tuning.
3. **Collect and decide once.** Run the startup stage and its controls, then
   retained calls only if the earlier gates pass. Assess both unchanged control
   labels and candidate comparisons. Report end-to-end wall/process CPU,
   construction, first invocation, early calls and retained calls separately,
   with uncertainty, actual tier evidence and every raw record. A failed control
   or consistent slowdown blocks qualification; source similarity cannot
   override it. The whole job ends without a retry or settings change.

The fixed core matrix has 12 randomized paired blocks and three labels:
baseline, identical-baseline control and candidate. Use default CDS and common
flags `-Xms128m -Xmx128m --enable-native-access=ALL-UNNAMED`, with identical
module/native-library settings for all labels. Retained calls use these counts:

| Policy | VM flags | Calls per batch |
|---|---|---:|
| Interpreter | `-Xint` | 10,000 |
| C1 | `-XX:TieredStopAtLevel=1` | 100,000 |
| Tiered ceiling 3 | `-XX:TieredStopAtLevel=3` | 100,000 |
| Default tiered | none | 100,000 |
| C2 | `-XX:-TieredCompilation -Xbatch` | 1,000,000 |

Keep 30 warm batches, 10 retained samples, startup's 1,000 early calls and
randomization seed 20261014. Startup precedes retained collection. There are
at most 540 startup forks (empty/framework/int) and 720 retained forks (four
bound/unbound/variable forms), 1,260 timing forks total. Separate diagnostics
must establish the intended active loop levels; they are not timed-PC proof.

Preserve control point bounds [0.95, 1.05], whole 95% CI bounds [0.90, 1.10],
10,000 paired bootstrap resamples with seed 20261016, and the original slowdown
hold: an interval entirely below one, or slower than both baseline labels in
at least 9 of 12 paired blocks, blocks the candidate. Crossing intervals alone
do not establish equivalence. Any invalid fork or failed control stops later
stages. Keep every record; no retry, exclusions, pooling, settings changes,
sample expansion or acceptable-loss margin. This document authorizes no run.

Native Linux AArch64, fastdebug, actual cross/build-host execution, broader
foreign/native checks, unsupported-first-shape and repeated-descriptor
performance remain separate requirements before a PR can claim improvement.
The core scalar matrix does not cover those cases. Review measured benefit
against the generator's maintenance cost before expanding recipe coverage.
The remote head/PR-overlap refresh is blocked by the recorded Forbidden
responses and has not been retried. No push, publication or merge is included.
