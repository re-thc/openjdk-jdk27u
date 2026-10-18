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
Foundation's OS-transitive graphics mappings are separate from compilation of
excluded JDK desktop code. The shared `splashscreen.h` contains declarations,
not splash implementations; native symbol and compiler-input checks establish
which code is present.

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
The prebuilt regression runs the real entry point through generated-spec
discovery and child test execution, checking that the synthetic spec retains
the headless module graph and rejects incompatible desktop and collector
overrides.
The macOS notification regression interposes the dynamic-store observer to
inject both watched keys through real native scheduling and the built image's
callback. It checks automatic Java configuration refresh, unrelated keys,
exception recovery and process exit without privileged system changes. It
does not exercise the OS daemon's delivery of real configuration changes.

At `1f9f7312aa3`, Linux x64 and AArch64 CI passed release and fastdebug builds,
make suites and full profiles. Each profile recorded 56 product javac lists;
native-record totals were 1,634 on x64 and 1,578 on AArch64, including host
objects. Five prebuilt jtreg smokes passed locally across HotSpot command-line
and GC selection, JDK, langtools and lib-test with CI's pinned Boot JDK 26 and
jtreg 8.2.1. Complete tier1 CI remains pending.

Native macOS AArch64 images built at `f0824d88112` passed compilation-database,
profile and direct-link checks under Command Line Tools, without Metal
discovery or artifacts. At `1f9f7312aa3`, both retained configurations passed
`test-make-headless` with AUTOCONF unset. This included prebuilt-spec execution
and override rejection, launcher/archive checks, and Kerberos callbacks on a
real dispatch worker for both watched keys and refresh-exception recovery,
without JNI warnings or exceptions. The image manifests remained byte-identical,
and the intervening changes affected tests, documentation and the prebuilt
runner spec, preserving product equivalence. No configure, rebuild or clean
was needed. The callback regression does not exercise real configd delivery.

The earlier Mac baseline at `5b3534b7` passed 29 runtime smokes per image,
including console errors/exit, JNI invocation and signal handling. Those
smokes, profiles and link inspections were not repeated for the latest
make-suite confirmation.

Native Windows x64 validation remains required: inspect `dumpbin /imports` for
`jli.dll` and `jvm.dll`, check console errors and JNI launch, and confirm
`javaw.exe` is absent. JLI_Launch embedding remains unrun. Foreign-platform
graphs, stubbed probes and mocked console I/O do not replace native checks.

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
