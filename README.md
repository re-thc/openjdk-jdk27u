# Welcome to the JDK!

For build instructions please see the
[online documentation](https://git.openjdk.org/jdk/blob/master/doc/building.md),
or either of these files:

- [doc/building.html](doc/building.html) (html version)
- [doc/building.md](doc/building.md) (markdown version)

Use `bin/configure-dev` for this fork's reduced native build: no desktop or audio
modules, Serial/G1/ZGC only, and the CPU baselines selected by the script. Linux
uses mold; set `CONFIGURE_DEV_NO_MOLD=1` to use the default linker. Ordinary
`bash configure` retains upstream defaults and is required for documentation
targets. During upstream updates, review the `ENABLE_DESKTOP` build guards and
module/collector requirements in retained tests.

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
