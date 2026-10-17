# Scalar downcall templates

This change moves classfile construction for one exact default scalar
`int -> int` downcall recipe to the JDK build. The producer calls the production
`BindingSpecializer` emitter and requires identical bytes for Linux x86_64
SysV and Linux AArch64. Each runtime downcall still defines its own hidden class
with its current leaf method handle as class data. Native entry points, ABI
moves, transitions, invocation bytecode, symbol checks and scope acquire/finally
release retain the existing implementation.

Selection checks the complete calling sequence, linker options and ABI storage,
including zero allocation, no capture state, no return buffer and no address
pairs. Unsupported platforms and recipes are rejected before generated metadata
is initialized or ABI storage tables are scanned. Missing, incompatible or
corrupt data uses the existing runtime emitter. A producer whose byte order
cannot generate the supported recipe emits empty metadata. There is no new
production flag or public API.

Emission-only class and method descriptors initialize when fallback generation
or an upcall needs them. A template hit avoids constructing those descriptors.
The outer specializer still freezes its configuration and classfile version at
the same point. The build cache binds source, target, compiler and execution JDK
identities and validates complete assets before installation and reuse. It
archives class bytes and ABI metadata, never native addresses.

Matched construction still decodes and checksums the bundle. First use can
initialize `CRC32` and `ZipUtils` and request `libzip` through the boot loader;
whether the library is already loaded depends on earlier process activity.
Those costs remain part of startup qualification.

## Build and tests

Use the ordinary dependencies in [building.md](building.md), an installed Boot
JDK 26 or 27, and compatible jtreg. Set `FFM_BOOT_JDK`, `FFM_JTREG` and
`FFM_JOBS` to the installed paths and build parallelism. The normal build creates
its own build-host JDK; no experimental prebuilt image is required.

```sh
bash configure --with-conf-name=ffm-release --with-debug-level=release \
    --with-boot-jdk="$FFM_BOOT_JDK" --with-jtreg="$FFM_JTREG"
make CONF=ffm-release JOBS="$FFM_JOBS" images
make CONF=ffm-release JOBS="$FFM_JOBS" test \
    TEST="test/jdk/java/foreign/DowncallTemplateTest.java test/jdk/java/foreign/TestLinker.java test/jdk/java/foreign/callarranger"
make CONF=ffm-release JOBS="$FFM_JOBS" test TEST=test/jdk/java/foreign
```

Repeat with a separate `--with-conf-name=ffm-fastdebug` and
`--with-debug-level=fastdebug` for debug validation. Use the same installed
toolchain and native test libraries for a matched baseline/candidate comparison.

`DowncallTemplateTest` has four descriptions. `fallback` checks optional default
selection and forced-verification fallback. `templates-required` fails if a
supported native Linux image has empty metadata, invalid data or null selection;
unsupported hosts explicitly exercise fallback. `unsupported-first` and
`upcall-first` use fresh VMs to check emitter initialization and invocation when
the first recipe cannot use a template.

The test compares payload bytes against both ABI emitters; checks source
identity, classfile version, checksum and malformed/truncated data; rejects
incompatible recipes and ABI storage; and verifies lazy initialization. Synthetic
leaves cover independent class data, concurrent specialization, heap symbols,
closed/wrong-thread scopes and cleanup after a throwing leaf. These checks
complement the native linker, call-arranger and foreign suites; they do not
replace native AArch64 execution.

## Validation and performance limits

The runtime and regression-test source at `2378c7becb2` passed the following
ordinary development checks on Linux x86_64:

| Check | Result |
| --- | --- |
| Normal release image build | Passed |
| New template jtreg descriptions | 4 passed |
| Targeted linker and call-arranger jtreg descriptions | 8 passed |
| Full foreign jtreg suite | 118 passed, 0 failed/errors; 140,291 framework cases |
| Native scalar ABI/lifetime harness | 337 assertions passed under each of five VM policies |
| x86_64/AArch64 generated payload comparison | Identical, 1,314 bytes |

The five native-harness policies were default, `-Xint`,
`-XX:TieredStopAtLevel=1`, `-XX:TieredStopAtLevel=3`, and
`-Xbatch -XX:-TieredCompilation`; these flags alone are not proof of compiled
loop levels. The foreign suite excluded 21 manual `TestMatrix` descriptions and
one platform-restricted `critical/TestStressAllowHeap` description. jtreg emitted
a post-run result-cache worker exception; all 118 retained test result files
report successful execution, but cache consistency was not established.

Fastdebug build and tests are blocked by host process exhaustion: even a serial
build could not start the Boot JDK's Reference Handler thread. Native Linux
AArch64, cross-build execution, and unsupported-target/build-host validation
remain unverified. Source review and synthetic ABI byte comparisons do not
replace those checks.

No qualified speedup or regression-free performance result is claimed. The
earlier handwritten adapter, which is excluded from this change, has an
unresolved retained C2 slowdown hold: baseline/candidate elapsed ratio 0.95767,
95% CI [0.87993, 0.99977]. Later generated-template measurements failed unchanged
controls. Identical invocation bytes and passing correctness tests do not clear
those limitations.

Performance qualification must compare complete matched images, retaining
source/toolchain/native/module/CDS identities, fork order, raw results and
uncertainty. Measure process startup, construction, first invocation, early calls
and reused bound/unbound/variable handles separately under interpreter, C1,
default-tiered and proven C2 execution. Include unchanged controls, repeated and
distinct descriptors, unsupported first recipes and pointer/struct/upcall/capture/
variadic fallbacks. Failed controls invalidate the measurements; a consistent
slowdown holds the candidate. The maintenance cost of the generator must be
justified by valid end-to-end results before recipe coverage expands.
