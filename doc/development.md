# Development build profile

Use `bash bin/configure-dev` instead of `bash configure` for the same native
build profile as this fork's CI. All usual configure arguments can follow it:

```sh
bash bin/configure-dev --with-boot-jdk=/path/to/jdk26 --with-jtreg=/path/to/jtreg \
  --with-gtest=/path/to/googletest --with-debug-level=fastdebug
make images test-image
make test TEST=tier1 JTREG='JAVA_OPTIONS=-Djava.awt.headless=true;KEYWORDS=!headful'
```

The profile enables Serial, G1 and ZGC, and disables Epsilon, Parallel and
Shenandoah using upstream configure options. G1 remains the default collector.
No HotSpot collector implementation or Java API is changed.

| Native target | CPU baseline | CI runner | Native linker / cache |
| --- | --- | --- | --- |
| Linux x64 | x86-64-v3, generic tuning | ubuntu-26.04 | mold 3.0.0 / ccache |
| Linux ARM64 | ARMv8.2-A, generic tuning | ubuntu-26.04-arm | mold 3.0.0 / ccache |
| macOS ARM64 | Apple M1 | macos-26, Xcode 26.6 | Apple linker / ccache |
| Windows x64 | MSVC AVX2 | windows-2025, VS 2026 / MSVC 14.44 | MSVC linker |

These images require CPUs supporting their baseline; they are not suitable for
older x64 or ARMv8.0 hardware. Linux CI installs and verifies GCC 16 from
Ubuntu 26.04 packages. MSVC's AVX2 option is not an exact x86-64-v3
equivalent. CPU flags affect native code; the JVM still chooses Java JIT
instructions at runtime. There is no use of `-march=native`.

Linux requires mold and enables `--enable-headless-only`, so X11 libraries and
the X11 AWT implementation are not built. Install the usual non-X11 build
dependencies, plus `mold` and optionally `ccache`. On macOS, install
`autoconf make ccache` with Homebrew. OpenJDK does not support headless-only
builds on macOS or Windows; those retain the platform desktop libraries. CI
sets `java.awt.headless=true` and excludes `headful` tests on every target.
Headless Java2D and font rendering remain supported and tested.

CI builds both release and fastdebug images and keeps all twelve existing
tier1 test shards per target, including native GTests.
The macOS ARM64 serviceability shard runs one jtreg worker to leave memory
for its debugger/debuggee processes and the runner on the 7 GiB host.
All tests in that shard still run.

Collector tests use jtreg's existing `@requires` checks to skip collectors absent
from the image.
Mixed-collector CDS, compressed-oop and management tests check Parallel
availability. Generic non-G1 archive and compiler regression tests use Serial;
Parallel-specific heap-monitor and JFR tests require Parallel support. The
generic jlink add-options check uses Serial. Option-range
validation uses the running collector instead of forcing Parallel for a shared
TLAB option.
Every image also runs `.github/scripts/check-dev-profile.sh` to verify the
three supported collectors, rejection of excluded collectors, and headless
rendering before upload.

Compiler caches are separated by OS, architecture, debug level, toolchain and
configure profile. Each cache is capped at 750 MB. A source revision provides
a new save key, while the matching prefix restores the previous cache.
OpenJDK configures ccache's precompiled-header support. Windows does not use
ccache because the upstream build enables it only for GCC and Clang.
Build duration and cache statistics are written to each job's summary.

The default workflow runs all four targets on pushes and PRs to master.
Manual dispatch can select individual targets or the aliases `linux`, `macos`,
`windows`, `x64`, and `aarch64`. Removed environments cannot be selected.
`JDK_SUBMIT_PLATFORMS` still selects targets and `JDK_SUBMIT_FILTER` still
limits push runs to `submit/` branches when set. Dry runs are explicit,
so syncing master no longer silently skips builds and tests.

For a generic upstream build, use `bash configure` directly. Explicit arguments
to `configure-dev` override its defaults, for example
`--with-extra-cflags=-march=x86-64 --with-extra-cxxflags=-march=x86-64`.

See [measured build, symbol and BOLT results](development-performance.md).
