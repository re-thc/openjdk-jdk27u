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

Windows retains `user32` for service logoff checks and the launcher's
`CharNextExA` multibyte command-line traversal, and `winmm` for timer-resolution
APIs. These uses do not enable dialog or audio code. GDI, printing and
common-dialog libraries are omitted from HotSpot's link inputs. Fatal-error
prompts use standard error and read a response only from an attached console.
Callers without a console, including services and JNI applications, return
immediately.

On macOS, the instrumentation agent uses its JDK libraries, iconv and zlib.
Kerberos configuration retains Foundation collections, Kerberos credentials
and SystemConfiguration services. Configuration-change notifications run on a
private serial dispatch queue, independent of the launcher's main thread.
Foundation can load graphics libraries transitively through the OS; this does
not add excluded JDK desktop code to the product.

## Building

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
Tests that generate configure scripts use the recorded Autoconf executable or
find one on PATH.

Reconfiguration rejects output directories from a desktop build or a different
collector set. Use a new `--with-conf-name`, or `make CONF="$conf" dist-clean`
before reusing a configuration. The build also rejects stale excluded module
directories; `make CONF="$conf" clean` clears its build outputs.

`test-make-headless` checks build-policy enforcement, module imports and
launcher behavior. On macOS it also checks native Kerberos callbacks without
changing system configuration. That notification check injects changes; it
does not exercise real configd delivery.

`check-dev-profile.sh` needs the build tree as well as its image. It audits
compiler inputs, collector objects and image contents, and runs server-runtime
and tool checks. It rejects excluded collectors and desktop, audio or Metal
outputs.

## Host tools and compatibility data

The boot JDK is an external tool and can contain desktop modules. The build
compiles interim javac/javadoc and the generators needed for target modules;
these are host/bootstrap tools under `buildtools`, not installed target
modules. Desktop-only Nimbus, font-config, DTD, icon and X11 generators are
excluded. Static HTML, image and font resources used by javadoc remain data.
When cross compiling, the build-managed host JDK retains its upstream Serial/G1
collector subset; the target JDK still requires Serial/G1/ZGC.

Building the JDK's own API documentation uses the boot JDK's compiled API
symbols to resolve retained comments that link to desktop types. That optional
target requires a boot JDK containing those symbols; it still processes only
the included target module sources. Ordinary use of the installed javadoc tool
does not require a desktop JDK.

`ct.sym` and historical javadoc element lists preserve compiler compatibility
with older Java releases, including historical desktop API signatures. These
are generated from symbol data, not compilation of current desktop product
sources. Their presence does not add desktop modules to the target runtime.
