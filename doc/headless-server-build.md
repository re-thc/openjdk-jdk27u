# Headless server build

This fork builds a server JDK on Linux x64/AArch64, macOS AArch64 and
Windows x64. Both plain `configure` and `bin/configure-dev` enforce:

* Desktop disabled and headless enabled.
* Exactly Serial, G1 and ZGC in every configured JVM variant.
* No `java.desktop`, `java.datatransfer`, `java.se`, `jdk.accessibility`,
  `jdk.editpad`, `jdk.hotspot.agent`, `jdk.jconsole`, `jdk.jpackage` or
  `jdk.unsupported.desktop` product compilation.

Incompatible desktop/headless or collector overrides in configure or make are
errors. Collector
policy is in `make/autoconf/jvm-features.m4`; the module exclusion set is in
`make/common/Modules.gmk`. The development wrapper adds CPU, linker and ccache
choices to the same product policy.

The excluded modules depend on desktop APIs. In particular, the serviceability
agent includes its GUI and requires `java.desktop`. Server diagnostics through
attach, jcmd, jmap, jstack, JMX, JDWP and JFR remain available, as do javac,
javadoc, jdeps, JShell, jlink, jar, crypto, networking and the standard runtime.

Upstream desktop sources remain in the checkout. Exclusion happens before
Java, generated-source, native, static-library, launcher and jmod targets are
created. Direct excluded-module phase invocations fail too. Javac and javadoc
receive explicit source paths for included modules; imported binary module
paths are filtered. Generated descriptors remove qualified exports/opens to
excluded modules without turning them into unqualified directives.

Desktop font/image libraries and macOS Metal tools are not discovered. Zlib is
retained. The core launcher compiles out splash support, macOS Cocoa startup
and dock integration, and Windows AWT preload/dialog initialization. The
Windows `javaw` launcher is omitted. Normal console launchers remain.

## Build and validate

Use the normal platform toolchain and a supported boot JDK. Start with a new
configuration directory. For example, on Linux:

```sh
bash configure --with-conf-name=server --with-boot-jdk="$BOOT_JDK" --with-jobs=4
make CONF=server images compile-commands
bash .github/scripts/check-dev-profile.sh build/server/images/jdk build/server/spec.gmk
make CONF=server test-make-headless
```

To exercise the development wrapper, use `bash bin/configure-dev` with the
same arguments. On Linux it expects mold unless `CONFIGURE_DEV_NO_MOLD=1` is
set. Add `--with-debug-level=fastdebug` for an assertion-enabled build.

Reconfiguration rejects output directories from a desktop build or a different
collector set. Use a new `--with-conf-name`, or `make CONF=server dist-clean`
before configuring that directory again. The build also rejects stale excluded
module directories. `make CONF=server clean` clears that configuration's build
outputs. No source deletion is part of this workflow.

`check-dev-profile.sh` requires the build tree as well as its image. It checks
actual product javac file lists, native compilation records, GC objects,
classes/generated outputs, jmods and image files. It runs allocation and GC,
virtual-thread socket, crypto/TLS initialization, JMX, JFR and attach/jcmd
smokes, C1/C2 arithmetic compilation, source-file launch, javac, javadoc, jar
and jlink. It verifies that Epsilon, Parallel and Shenandoah cannot start.
The existing platform CI development-profile step runs this stronger check.
Native test bundles also omit tests for collectors absent from every configured
JVM variant.

`make:headless` exercises the four supported module/launcher graphs, imported
modules, direct-target rejection, stale outputs, descriptor pruning and
configure override/probe guards. Foreign platform tool lookups are stubbed to
fail on desktop discovery; these tests do not substitute for native builds.

## Host tools and compatibility data

The boot JDK is an external tool and can contain desktop modules. The build
compiles interim javac/javadoc and the generators needed for target modules;
these are host/bootstrap tools under `buildtools`, not installed target
modules. Desktop-only Nimbus, font-config, DTD, icon and X11 generators are
excluded. Static HTML, image and font resources used by javadoc remain data.
When cross compiling, the build-managed host JDK retains its upstream Serial/G1
collector subset; the target JDK still requires Serial/G1/ZGC. Its graph is
covered by the make regression test.

Building the JDK's own API documentation uses the boot JDK's compiled API
symbols to resolve retained comments that link to desktop types. That optional
target requires a boot JDK containing those symbols; it still processes only
the included target module sources. Ordinary use of the installed javadoc tool
does not require a desktop JDK.

`ct.sym` and historical javadoc element lists preserve compiler compatibility
with older Java releases, including historical desktop API signatures. These
are generated from symbol data, not compilation of current desktop product
sources. Their presence does not add desktop modules to the target runtime.

## Native platform validation

Each supported target needs a clean native release/fastdebug build and the
profile check above. On macOS AArch64, also configure with Command Line Tools
and no Metal toolchain, inspect `otool -L` for the resulting `libjli.dylib`,
and exercise console launch, JNI invocation, signal handling and process exit.
On Windows x64, inspect `dumpbin /imports` for `jli.dll`, verify console error
reporting and JNI launch, and confirm that `javaw.exe` is absent. Linux AArch64
needs its own native collector/compiler smoke runs.

Build time comparisons require matching hardware, compiler, debug level,
cache state and build settings. Excluded source/target counts establish removed
work; they do not by themselves establish a measured speedup.

## Validation snapshot: 2026-10-17

On a Linux x64 VM, release with GCC 16.2 and a clean fastdebug build with
GCC 14.2 both completed `images compile-commands` and the expanded profile
check. Each had 56 runtime modules/jmods, 56 product javac input lists covering
11,198 files, and 1,405 product native object commands with existing outputs.
The native build also compiled 13 ADLC host-tool objects. Fastdebug's compilation
database includes one additional precompiled-header command. No excluded
product source appeared in these inputs or objects.

Serial, G1, ZGC, C1, C2, source-file launching, virtual-thread sockets, TLS/crypto
initialization, JMX, JFR, attach/jcmd, javac, javadoc, jar and jlink passed their
smokes in both images. The release image also passed javac compatibility smokes
for releases 8, 17 and 26, jdeps and JShell. The 49 retained API documentation
modules and the test image built successfully. The focused make regression
suite passed, including the four target graphs, host-build subset, imported
modules, stale outputs, configure/make overrides and Windows path conversion.

The preserved tree contains 120 excluded collector `.cpp` files across its
architectures. The nine excluded modules and five desktop generator packages
were absent from the product/host-tool compilation inputs. No build-time or
resource speedup is claimed. Native Linux AArch64, macOS AArch64 and Windows
x64 builds remain to be run as described above.
