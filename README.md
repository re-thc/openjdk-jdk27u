# Welcome to the JDK!

For build instructions please see the
[online documentation](https://git.openjdk.org/jdk/blob/master/doc/building.md),
or either of these files:

- [doc/building.html](doc/building.html) (html version)
- [doc/building.md](doc/building.md) (markdown version)

Normal configure uses this fork's reduced native build and CPU baselines:
Linux x64 x86-64-v3, Windows x64 AVX2, Linux ARM64 ARMv8.2-A, and macOS
ARM64 Apple M1. Below-baseline machines are unsupported. Use
`bin/configure-dev` for optional ccache and Linux mold configuration; set
`CONFIGURE_DEV_NO_MOLD=1` to use the default linker. During upstream updates,
review the `ENABLE_DESKTOP` build guards and module/collector requirements
in retained tests.

The restricted `java.desktop` module exports `java.beans` for build tools and
server frameworks: introspection, descriptors, change/veto listeners and scalar
property editors. It retains the standard module name and boot-loader mapping,
so existing `requires java.desktop` declarations and JMX lookups work. The module
has only the implicit `java.base` dependency; it adds no desktop native libraries.
XML persistence, bean contexts, Swing, imaging, printing and audio are excluded.

`java.awt` exports only the nominal `Image`, `Component`, `Graphics` and
`Rectangle` types needed to resolve public JavaBeans method signatures, including
reflective inspection. These are **not full AWT classes**: their constructors
throw `UnsupportedOperationException`, and they supply no GUI API or behavior.
`SimpleBeanInfo` has no default icons and its `loadImage` method throws
`UnsupportedOperationException`. Custom visual editors and Swing bean metadata
are unsupported. The upstream desktop sources remain available in the checkout;
only the explicit beans source list and headless signature types are compiled.

This fork builds these public charsets and their aliases: US-ASCII,
ISO-8859-1, UTF-8, UTF-16, UTF-16BE, UTF-16LE, x-UTF-16LE-BOM, UTF-32,
UTF-32BE, UTF-32LE, X-UTF-32BE-BOM and X-UTF-32LE-BOM. Other built-in
charsets are absent, including CESU-8. Applications can still install an
external `CharsetProvider`. Locale formatting data and internal modified
UTF-8 are separate and remain available.

A Unix host must use a supported filesystem encoding. The standard output and
error encodings must also be supported; if configured explicitly, they must
match the destination's encoding. Unsupported native byte conversions fail
instead of interpreting the bytes as UTF-8. On Windows, Unicode filesystem and
process APIs do not require a public ANSI-code-page charset, but native APIs
that require non-ASCII bytes from an unavailable code page cannot be used.
This includes native library paths that require such a conversion. The default
process reader and writer methods require the native encoding; pass an explicit
charset matching the child process to their overloads when needed. Setting
`file.encoding` to a removed encoding, or `COMPAT` on an unsupported native
encoding, fails at startup.

On x64 and AArch64, this fork defaults to four-byte object headers with Serial,
G1 and ZGC. `-XX:-UseFourByteObjectHeaders` selects eight-byte compact headers;
`-XX:-UseCompactObjectHeaders` selects legacy headers and overrides any
four-byte request. `UseFourByteObjectHeaders` implies `UseCompactObjectHeaders`
and needs no experimental unlock. The option is available only in 64-bit VMs;
other platforms retain their existing layouts. Unsupported architectures,
collectors and explicit `hashCode` values other than 2 or 6 disable four-byte
mode with a warning.

Four-byte mode caps compressed class space at 512 MiB, with CDS metadata and
alignment reducing the space available for new classes. Exhaustion raises
`OutOfMemoryError: Compressed class space` without falling back to a larger
header layout; use `-XX:-UseFourByteObjectHeaders` if more class space is needed.

Recreate custom CDS archives and AOT caches when moving from an unmodified
JDK: this fork uses a different archive format. Archives must match the runtime
header layout. Default four-byte archives are `classes_fourbyte.jsa` and
`classes_nocoops_fourbyte.jsa` (without compressed oops).
`jlink --generate-cds-archive` also generates matching variants.

See <https://openjdk.org/> for more information about the OpenJDK
Community and the JDK and see <https://bugs.openjdk.org> for JDK issue
tracking.
