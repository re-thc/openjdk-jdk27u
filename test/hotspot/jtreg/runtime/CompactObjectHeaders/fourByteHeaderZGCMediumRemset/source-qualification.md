# Build and qualify medium ZGC relocation

This is a native source route for the focused medium relocation test. Use a
Linux x64 host supporting x86-64-v3, an installed boot JDK 26 or 27, jtreg 8.2.1
or later, GNU `timeout`, and the normal native build prerequisites described in
[Building the JDK](../../../../../../doc/building.md). The commands below use
four build jobs and a fastdebug JDK. They do not download a CI image or dispatch
a workflow. Other native targets supported by `bin/configure-dev` need their
normal platform toolchains.

## Source and build

Get the review branch from the public repository, or use an existing checkout
of that branch. Record the full source commit before building. Set `BOOT_JDK`
and `JTREG_HOME` to the installed tool directories on your host.

```bash
git clone --branch review/pr44-medium-remset-regression \
    https://github.com/re-thc/openjdk-jdk27u.git
cd openjdk-jdk27u
set -euo pipefail
REPO=$PWD
: "${BOOT_JDK:?Set BOOT_JDK to an installed JDK 26 or 27}"
: "${JTREG_HOME:?Set JTREG_HOME to an installed jtreg 8.2.1 or later}"
QUAL_DIR="$REPO/build/pr44-medium-tests"
mkdir -p "$QUAL_DIR"
git diff --exit-code
git diff --cached --exit-code
git rev-parse HEAD > "$QUAL_DIR/source-commit.txt"

CONFIGURE_DEV_NO_MOLD=1 timeout --kill-after=10s 300s bash bin/configure-dev \
    --with-conf-name=pr44-fastdebug \
    --with-debug-level=fastdebug \
    --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
    --with-jobs=4 --with-num-cores=4 --with-memory-size=8192 \
    --disable-jtreg-failure-handler \
    2>&1 | tee "$QUAL_DIR/configure.log"
timeout --kill-after=10s 60m make CONF=pr44-fastdebug JOBS=4 exploded-image \
    2>&1 | tee "$QUAL_DIR/build.log"
TEST_JDK="$REPO/build/pr44-fastdebug/jdk"
cp "$TEST_JDK/release" "$QUAL_DIR/release.txt"
grep -x 'DEBUG_LEVEL := fastdebug' build/pr44-fastdebug/spec.gmk \
    > "$QUAL_DIR/build-debug-level.txt"
sha256sum "$TEST_JDK/lib/server/libjvm.so" > "$QUAL_DIR/libjvm.sha256"
```

`CONFIGURE_DEV_NO_MOLD=1` selects the default Linux linker. `exploded-image` is
the standard runnable development JDK target. It builds the retained modules
and HotSpot without distribution packaging. Keep configure and build failures
in their logs; resolve a concrete failure before repeating an affected step.

## Compile and check the parser

Compile the two tests and their normal test-library dependencies with the boot
JDK. The parser uses only synthetic inputs and does not launch the GC fixture.

```bash
TEST_SRC="$REPO/test/hotspot/jtreg/runtime/CompactObjectHeaders"
mkdir -p "$QUAL_DIR/classes"
timeout --kill-after=10s 120s "$BOOT_JDK/bin/javac" -J-Xshare:off -J-Xms16m -J-Xmx256m -proc:none \
    --add-exports java.base/jdk.internal.misc=ALL-UNNAMED \
    -sourcepath "$REPO/test/lib" -d "$QUAL_DIR/classes" \
    "$TEST_SRC/FourByteHeaderZGCMediumRemset.java" \
    "$TEST_SRC/FourByteHeaderZGCMediumRemsetParser.java" \
    > "$QUAL_DIR/compile.log" 2>&1
timeout --kill-after=10s 60s "$BOOT_JDK/bin/java" -Xshare:off -Xms16m -Xmx64m \
    --add-exports java.base/jdk.internal.misc=ALL-UNNAMED \
    -cp "$QUAL_DIR/classes" FourByteHeaderZGCMediumRemsetParser \
    "$TEST_SRC/fourByteHeaderZGCMediumRemset" \
    > "$QUAL_DIR/parser.log" 2>&1
```

Require `OFFLINE SUMMARY cases=97 accepted=4 rejected=93` and exit status zero.
These outcomes validate the oracle, not the runtime relocation path.

## Run both relocation variants

Install only WhiteBox classes in the child boot-class-path directory. The
parent driver runs on the boot JDK and selects the freshly built target JDK
through `test.jdk`. Its two children run sequentially with 128 MiB heaps.

```bash
mkdir -p "$QUAL_DIR/runtime/jdk/test/whitebox"
cp "$QUAL_DIR/classes"/jdk/test/whitebox/WhiteBox*.class \
    "$QUAL_DIR/runtime/jdk/test/whitebox/"
(
    cd "$QUAL_DIR/runtime"
    timeout --kill-after=10s 180s "$BOOT_JDK/bin/java" -Xshare:off -Xms16m -Xmx128m \
        --add-exports java.base/jdk.internal.misc=ALL-UNNAMED \
        -Dtest.jdk="$TEST_JDK" -Dcompile.jdk="$TEST_JDK" \
        -Dtest.vm.opts= -Dtest.java.opts= -Dtest.timeout.factor=1 \
        -cp "$QUAL_DIR/classes" FourByteHeaderZGCMediumRemset
) > "$QUAL_DIR/runtime.log" 2>&1
```

Use normal bounded execution limits: 60 minutes for the build, 120 seconds for
compilation, 60 seconds for the parser, and 180 seconds for the runtime driver,
with a short process-group termination grace period. Preserve complete output
and exit status. A timeout or missing evidence is a failure to qualify; do not
repeat until pass or relax the assertions.

Require driver exit status zero and at least one `CORRELATED variant=normal`
and one `CORRELATED variant=in-place` record. Each admitted record joins an
actually grown medium owner to both remembered edge slots on its exact source
page and GC, then verifies movement and payload survival of its young children
after the verification minor. The oracle also rejects extra collections and
requires profitable selection across multiple young small pages. A clean exit
or a global page count alone does not establish this path.

This focused qualification does not cover other collectors, platforms, CDS,
benchmarks, or the full HotSpot regression suite.

## Observed qualification

The following run completed on 2026-10-16 from source commit
`f5fdeada58a6e37d913254b82beb58c83e0988a4`, using Debian Linux x64,
GCC 14.2.0, boot JDK 27+35-2325 and four build jobs. The generated build
configuration records both `DEBUG_LEVEL` and `HOTSPOT_DEBUG_LEVEL` as
`fastdebug`; the image release file records `SOURCE=".:git:f5fdeada58a6"`.
The native sources match PR44 head
`3f4c5e8f2de2ea4393212d06ceb79ef5b41f79a6`.

| Step | Result | Elapsed seconds |
| --- | --- | ---: |
| Configure | exit 0 | 6.204 |
| `exploded-image` build | exit 0 | 725.652 |
| Compile both tests | exit 0 | 2.261 |
| Offline parser | 97 cases; 4 accepted, 93 rejected; exit 0 | 0.533 |
| Runtime driver | both variants passed; exit 0 | 5.937 |

The driver admitted 15 normal-relocation owners and 8 in-place-relocation
owners. Both child runs measured three small pages containing Tokens; their
verification minors selected five small pages into one. Each run completed
exactly the permitted setup major, timer major and verification minor.
Representative admitted records were:

```text
CORRELATED variant=normal gc=1 owner=0 sourcePage=0x600000..0xa00000 seq=1->1
CORRELATED variant=in-place gc=1 owner=1 sourcePage=0x600000..0xa00000 seq=1->3
```

The built `lib/server/libjvm.so` was 42,491,800 bytes with SHA-256
`b1a89b9f58f4d48a648788aade41e15f63de5ed886f2788f3bdb5bbf00d5ccc7`.
This hash identifies the observed local build; builds on other hosts can differ.

This run establishes the observed medium hash-growth and remembered-set
migration paths for both modes on Linux x64. Shared-target loser-allocation
race forcing, other platforms, option boundaries and the remaining backports
need their own qualification.
