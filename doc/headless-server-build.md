# Headless server build

This fork builds a server JDK on Linux x64/AArch64, macOS AArch64 and
Windows x64. Both plain `configure` and `bin/configure-dev` enforce:

* Desktop disabled and headless enabled.
* Exactly Serial, G1 and ZGC in every configured target JVM variant.
* No `java.desktop`, `java.datatransfer`, `java.se`, `jdk.accessibility`,
  `jdk.editpad`, `jdk.hotspot.agent`, `jdk.jconsole`, `jdk.jpackage` or
  `jdk.unsupported.desktop` product compilation.

Incompatible desktop/headless or collector overrides in configure or make are
errors. Collector policy is in `make/autoconf/jvm-features.m4`; the module
exclusion set is in `make/common/Modules.gmk`. The development wrapper adds CPU,
linker and ccache choices to the same product policy.

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

Windows HotSpot retains `user32` for window-station visibility checks that
preserve service logoff behavior, and `winmm` for timer-resolution APIs. These
uses do not enable dialog or audio code. GDI, printing and common-dialog
libraries are omitted from its link inputs. Fatal-error prompts use standard
error and read a response only from an attached console. Callers without a
console, including services and JNI applications, return immediately.

On macOS, the instrumentation agent uses its JDK libraries, iconv and zlib.
Kerberos configuration retains Foundation collections, Kerberos credentials
and SystemConfiguration services. Configuration-change notifications run on a
private serial dispatch queue, independent of the launcher's main thread.
Foundation's OS-transitive graphics mappings
are separate from compilation of excluded JDK desktop code. The shared
`splashscreen.h` contains declarations, not splash implementations; native
symbol and compiler-input checks establish which code is present.

## Build and validation

Use GNU make, the normal platform toolchain and a supported boot JDK. Choose
unused configuration names for clean release and fastdebug builds. For example:

```sh
set -eu
for level in release fastdebug; do
  conf="server-$level"
  bash configure --with-conf-name="$conf" --with-boot-jdk="$BOOT_JDK" \
    --with-debug-level="$level" --with-jobs=4
  make CONF="$conf" images compile-commands
  make CONF="$conf" test-make-headless
  bash .github/scripts/check-dev-profile.sh \
    "build/$conf/images/jdk" "build/$conf/spec.gmk"
done
```

To exercise the development wrapper, use `bash bin/configure-dev` with the
same arguments. On Linux it expects mold unless `CONFIGURE_DEV_NO_MOLD=1` is
set. Use `gmake` where that is the GNU make command.
Configure-generating tests locate Autoconf on PATH when a cached configure run
recorded no executable; a valid configured Autoconf path is still honored.

Reconfiguration rejects output directories from a desktop build or a different
collector set. Use a new `--with-conf-name`, or `make CONF="$conf" dist-clean`
before reusing a configuration. The build also rejects stale excluded module
directories; `make CONF="$conf" clean` clears its build outputs.

`check-dev-profile.sh` requires the build tree as well as its image. It checks
actual product javac file lists, native compilation records, GC objects,
classes/generated outputs, jmods and image files. It runs allocation and GC,
virtual-thread socket, crypto/TLS initialization, JMX, JFR and attach/jcmd
smokes, C1/C2 arithmetic compilation, source-file launch, javac, javadoc, jar
and jlink. It verifies that Epsilon, Parallel and Shenandoah cannot start.
Native test bundles also omit tests for collectors absent from every configured
JVM variant.

`make:headless` exercises the four supported module/launcher graphs, imported
source generation and product compilation, compiled descriptor semantics,
direct-target rejection, stale outputs and configure/make overrides. It covers
open modules, static/transitive requires, Unicode-escaped braces, qualified
exports/opens, Windows path conversion and the portable console helper.
It also checks launcher archive diagnostics, valid jar launch and native
instrumentation. On macOS it checks direct framework links and native Kerberos
configuration initialization; an unconfigured Kerberos store is allowed.
The macOS notification regression interposes the dynamic-store observer to
inject both watched keys through real native scheduling and the built image's
callback. It checks automatic Java configuration refresh, unrelated keys,
exception recovery and process exit without privileged system changes. It
does not exercise the OS daemon's delivery of real configuration changes.

Validated on Linux x64 on 2026-10-17: release with GCC 16.2 and fastdebug with
GCC 14.2 passed incremental image builds, make regressions and profile checks.
Each had 56 product javac lists covering 11,198 Java inputs, 1,405 product native
compilation records with matching objects, and 56 image jmods. No excluded
product source or object was found. The profile reports 1,418 native records
including 13 ADLC host objects. Fastdebug's compilation database also includes
its precompiled-header command. Linux collector, compiler, server-tool and
runtime smokes passed.

Native macOS AArch64 validation at `5b3534b7` recorded successful release and
fastdebug builds, profile checks and 29 runtime smokes per image under Command
Line Tools, with no Metal discovery or artifacts. Each image had 56 modules/
jmods, 11,196 Java inputs and 1,366 product native commands with matching objects.
The release formal make suite passed; fastdebug's formal suite failed at
Autoconf discovery. Its test-discovery fix and the subsequent launcher/framework
and notification changes require targeted native confirmation, including the
new callback-delivery regression; the earlier passed runtime scope
remains applicable to the unchanged code.

Native Linux AArch64 and Windows x64 validation remains required.
For macOS, configure with existing Command Line Tools selected through a
process-local `DEVELOPER_DIR`, verify no Metal discovery, inspect `otool -L`
for `libjli.dylib` and `libjvm.dylib`, and exercise console launch, JNI invocation,
signals and process exit. For Windows, inspect `dumpbin /imports` for `jli.dll`
and `jvm.dll`, check console errors and JNI launch, and confirm `javaw.exe` is
absent. Linux AArch64 needs native collector/compiler smokes. Foreign-platform
graphs, stubbed probes and mocked console I/O do not replace these native checks.

Excluded source/target counts establish removed compilation work. A build-time
speedup requires measurements with matching hardware, compiler, debug level,
cache state and build settings; no measured speedup is claimed here.

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
