# Experimental four-byte object headers

This port adds an optional four-byte object header to JDK 27u. The default
eight-byte compact header and `-XX:-UseCompactObjectHeaders` twelve-byte
layout remain available. The experimental layout supports Serial, G1, ZGC,
Parallel and Shenandoah on x64 and AArch64. Other 64-bit architectures disable
the four-byte option with a warning. The flag is unavailable in 32-bit builds.

Enable it with a supported collector, for example:

```sh
java -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseG1GC Main
java -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseSerialGC Main
java -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseZGC Main
```

`UseFourByteObjectHeaders` implies `UseCompactObjectHeaders`. The new flag
defaults to false. Object alignment remains configurable; its default is
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
hash algorithms disable the experimental layout with a warning.

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

CDS archives encode the selected header layout. This port changes the archive
format, so recreate custom CDS and AOT caches when switching from an unmodified
JDK. Archives created with one header layout are rejected by another layout.
JDK images include matching default archives for all three layouts, with and
without compressed oops. The four-byte variants are `classes_fourbyte.jsa` and
`classes_nocoops_fourbyte.jsa`.

## Validation and measurement

The regression tests in `runtime/CompactObjectHeaders` exercise flags, field
and array layout, archive compatibility, the class-space boundary, identity
hashes, and ZGC relocation. `gc/stress/ihash` covers movement and hash retention
across the collectors. The JDK instrumentation test checks expanded object
sizes under C1 and C2.

The [benchmark harness](benchmarks/four-byte-headers/run.sh) measures allocated
bytes, exact retained graph sizes, post-GC heap use on Renaissance workloads,
identity-hash and `IdentityHashMap` costs, and startup with matching CDS archives.
Run timing measurements while the machine is idle. The
[validation and benchmark report](benchmarks/four-byte-headers/results/validation.md)
compares the original eight-byte default with four-byte mode and records the
tested platform, raw results and limitations, including measured hashing costs.
