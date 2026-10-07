# Development build profile

Use `bash bin/configure-dev` instead of `bash configure` for the same native
build profile as this fork's CI. All usual configure arguments can follow it:

```sh
bash bin/configure-dev --with-boot-jdk=/path/to/jdk26 --with-jtreg=/path/to/jtreg \
  --with-gtest=/path/to/googletest --with-debug-level=fastdebug
make images test-image
make test TEST=tier1 JTREG='KEYWORDS=!headful'
```

The profile enables Serial, G1 and ZGC, and disables Epsilon, Parallel and
Shenandoah using upstream configure options. G1 remains the default collector.
No HotSpot collector implementation is changed.

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

Every target uses `--disable-desktop --enable-headless-only`. Desktop modules
are removed before compiling Java, native libraries, launchers and images.
There is no AWT, Swing, Java2D, X11, ImageIO, audio, fonts, clipboard or printing
support. `java.desktop`, `java.datatransfer`, `java.se`, `jdk.accessibility`,
`jdk.editpad`, `jdk.hotspot.agent`, `jdk.jconsole`, `jdk.jpackage` and
`jdk.unsupported.desktop` are omitted, along with their tools and Windows'
`javaw` launcher. This is an intentionally reduced JDK, not a complete Java SE
distribution. Command-line compilation, JShell, JFR, JMX and the usual non-GUI
diagnostic tools remain.

Current-release API symbols retain every remaining documented core module,
even though the `java.se` aggregator is omitted. Historical `javac --release`
and `jdeprscan --release` API data remains available.

Linux requires mold and can use ccache; desktop development packages are not
needed. On macOS, install `autoconf make ccache` with Homebrew. Desktop demos
and native GUI test helpers are skipped too. The normal upstream configure
still includes desktop support; `--disable-desktop` opts into this fork's
module reduction on any platform.

CI builds both release and fastdebug images and keeps all twelve existing
tier1 test shards per target, including native GTests.
Tests requiring removed modules are filtered by module availability. The SA
capability check also verifies that `jdk.hotspot.agent` exists in the image.
Remaining serviceability tests use the normal jtreg concurrency.

Collector tests use jtreg's existing `@requires` checks to skip collectors absent
from the image.
Mixed-collector CDS, compressed-oop and management tests check Parallel
availability. Generic non-G1 archive and compiler regression tests use Serial;
Parallel-specific heap-monitor and JFR tests require Parallel support. The
generic jlink add-options check uses Serial. Option-range
validation uses the running collector instead of forcing Parallel for a shared
TLAB option.
Every image also runs `.github/scripts/check-dev-profile.sh` to verify the
three supported collectors, rejection of excluded collectors, and absence of
desktop and audio modules, native libraries, audio configuration and `javaw`
before upload.

Compiler caches are separated by OS, architecture, debug level, toolchain and
configure profile. Each cache is capped at 750 MB. A source revision provides
a new save key, while the matching prefix restores the previous cache.
OpenJDK configures ccache's precompiled-header support. Windows does not use
ccache because the upstream build enables it only for GCC and Clang.
Build duration and cache statistics are written to each job's summary.

The default workflow runs all four targets on pushes to master and on PRs
targeting master. Linux x64 and ARM64 build and finish all their tests first;
Windows and macOS then run in parallel if both Linux targets pass. Build and
test matrices stop their remaining jobs when a sibling fails. New commits
cancel older runs for the same PR or branch.
Manual dispatch can select individual targets or the aliases `linux`, `macos`,
`windows`, `x64`, and `aarch64`. Only selected Linux targets gate the other
platforms, so Windows- or macOS-only dispatches still work. Removed environments
cannot be selected. `JDK_SUBMIT_PLATFORMS` still selects targets. Dry runs are
explicit, so syncing master no longer silently skips builds and tests.

For a generic upstream build, use `bash configure` directly. Explicit arguments
to `configure-dev` override its defaults, for example
`--with-extra-cflags=-march=x86-64 --with-extra-cxxflags=-march=x86-64`.

See [measured build, symbol and BOLT results](development-performance.md).
