# Four-byte object headers in this fork

This fork uses four-byte object headers by default on x64 and AArch64.
Serial, G1, ZGC, Parallel and Shenandoah are supported. The ordinary upstream
JDK 27u default remains eight-byte compact headers. This fork retains that
layout with `-XX:-UseFourByteObjectHeaders` and the twelve-byte layout with
`-XX:-UseCompactObjectHeaders`. Other 64-bit architectures and Zero keep their
existing defaults; explicit four-byte requests there are disabled with a
warning. The flag is unavailable in 32-bit builds.

Run normally, or select a supported collector:

```sh
java Main
java -XX:+UseSerialGC Main
java -XX:+UseZGC Main
java -XX:-UseFourByteObjectHeaders Main
```

`UseFourByteObjectHeaders` is an ordinary product option and requires no
experimental unlock. An explicit request for four-byte headers implies
`UseCompactObjectHeaders`; an explicit legacy-layout request disables the
four-byte default. Header opt-outs also work through `JAVA_TOOL_OPTIONS`,
`_JAVA_OPTIONS`, `JDK_JAVA_OPTIONS` and VM flag files, including inherited AOT
assembly options. Object alignment remains configurable; its default is
eight bytes. Smaller headers reduce allocation and retained object size when
alignment permits it. For example, an object containing one `int` occupies
eight bytes instead of sixteen with the default alignment.

## Layout and identity hashes

| Mark bits | Purpose |
| --- | --- |
| 31–13 | 19-bit compressed class identifier |
| 12–11 | Identity-hash state |
| 10–7 | Reserved |
| 6–3 | Age |
| 2 | Self forwarding |
| 1–0 | Lock state |

Ordinary instance fields can start at offset four. Arrays store their length
at offset four, followed by aligned elements. References use the ordinary
compressed-oop rules of the selected collector; ZGC retains its wider
references.

The default identity hash is derived from the object address. Before moving
a hashed object, a collector preserves the hash in an existing four-byte gap
or extends the object and installs a hidden hash slot. The extension follows
object and collector alignment. A hashed object may therefore lose its
initial size saving after movement. Unhashed objects retain their smaller
size. Explicit `-XX:hashCode=2` is also supported for tests. Other explicit
hash algorithms disable the four-byte layout with a warning.

ZGC handles this growth during relocation, including in-place relocation.
The old layouts retain their original forwarding encoding. C1 and C2 use the
native `Instrumentation.getObjectSize` implementation in four-byte mode so
it includes hidden hash slots; the fixed-size intrinsics remain enabled for
the old layouts. This can affect profilers that call this API frequently.

## Class space and archives

Four-byte mode limits compressed class space to 512 MiB. There is no fallback
class encoding. Applications that exhaust that space fail with
`OutOfMemoryError: Compressed class space`; disable the option for applications
that need more space. The number of loadable classes depends on their metadata
size and is not a fixed 512K-class allowance.
The per-class hash-offset field also has a metadata and alignment cost;
object-heap savings do not imply equivalent savings in class metadata or RSS.

CDS archives encode the selected header layout. This port changes the archive
format, so recreate custom CDS and AOT caches when switching from an unmodified
JDK. Archives created with one header layout are rejected by another layout.
JDK images include matching default archives for all three layouts, with and
without compressed oops. Interpreter-only classic static dumps derive identity
hash inputs from class names for mirrors and heap-relative addresses for
other objects, so address randomization and regenerated mirror allocation
do not change the archive. Already-hashed archived objects retain those hash values.
The four-byte variants are `classes_fourbyte.jsa` and
`classes_nocoops_fourbyte.jsa`.
The jlink `--generate-cds-archive` plugin also generates all six variants.
Image and jlink four-byte archive dumps use `-Xint` to select those deterministic
static-dump hash inputs.
JFR old-object sampling remains available with Serial and G1; leak-context
edge indices use the JDK 27 side table and do not consume header bits.

## Validation and measurement

The regression tests in `runtime/CompactObjectHeaders` exercise flags, field
and array layout, archive compatibility, the class-space boundary, identity
hashes, C2 monitor-table lookup and ZGC relocation. `gc/stress/ihash` covers
movement and hash retention across the collectors. The JDK instrumentation test checks expanded object
sizes under C1 and C2.

The [benchmark harness](benchmarks/four-byte-headers/run.sh) measures allocated
bytes, exact retained graph sizes, post-GC heap use on Renaissance workloads,
identity-hash and `IdentityHashMap` costs, and startup with matching CDS archives.
Run timing measurements while the machine is idle. The
[validation and benchmark report](benchmarks/four-byte-headers/results/validation.md)
compares the original eight-byte default with four-byte mode and records the
tested platform, raw results and limitations, including measured hashing costs.
The [fork-default application report](benchmarks/four-byte-headers/results/applications.md)
compares database and Spring Petclinic workloads against the upstream eight-byte
default, including the monitor-lookup regression found and fixed during testing.
