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

`DowncallTemplateTest` has two separate VM runs: default selection and forced
verification fallback. It compares template bytes against both ABI emitters;
checks source identity, version, checksum and framing guards; rejects options,
unsupported shapes and platforms; and exercises independent class-data leaves,
closed/wrong-thread scopes and cleanup on a throwing leaf. Synthetic leaves
avoid native calls, so this test does not replace native ABI coverage.

Empty metadata intentionally tests fallback. For the normal supported image,
also require the default run to print `selected=true` for its Linux platform;
a fallback-only pass does not validate template installation. Record the source
commit/diff, configure arguments, toolchain and build-JDK identities, generated
source binding, native-file hashes and extracted module differences. Unexpected
native differences must be explained before timing. A clean candidate build
must also confirm that success does not depend on stale incremental assets.

## Next complete qualification milestone

The next milestone is one normal native Linux x86_64 release build pair,
targeted correctness/native tests, and the existing full paired qualification.
Keep builds, tests and compiler diagnostics outside timing. The executor must
provide coherent ordinary process/accounting visibility; synthetic accounting
fixtures do not attest the real Java child. Do not change namespaces, security
settings or CPU selection after a failed admission.

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
