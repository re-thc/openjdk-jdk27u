# Supplementary layout and hash measurements

These measurements use historical opt-in native revision
`eac09d4f179bbb873a3b72deaf7d356ed2e4d228` against stock JDK 27u
`33e539f2d4a847f283a3793df6eebd41b9d1dfac`, whose default header is eight
bytes. They describe layout savings and hash tradeoffs; they are not measurements
of the final default-on image. See the [application report](applications.md)
for that image's results and current CI status.

Both images use GCC 16.2.0 release configuration, AMD EPYC 9V74, four active
processors, a four-CPU quota and 16 GiB memory. Baseline libjvm SHA-256:
`885daa5f89da714b4ecb15f098f3f75c93e2ea849b977e04fe9597399916ec31`;
candidate SHA-256:
`758bea9ca9c37b4d1f24bc677a1341a7429e1e9da45c7aa5fd434c227143e98d`.

## Exact retained graph

The instrumentation probe sums one million one-int objects and their retaining
reference array, verifies payload/hash preservation after movement, and excludes
the verification array and dead allocation pressure.

| Collector | Eight-byte unhashed MiB | Four-byte unhashed MiB | Reduction | Eight-byte hashed MiB | Four-byte hashed MiB |
| --- | ---: | ---: | ---: | ---: | ---: |
| Serial | 19.07 | 11.44 | 40.0% | 19.07 | 19.07 |
| G1 | 19.07 | 11.44 | 40.0% | 19.07 | 19.07 |
| ZGC | 22.89 | 15.26 | 33.3% | 22.89 | 22.89 |

A one-int object shrinks from sixteen to eight bytes before hashing/movement.
Preserving its hash after movement expands it to sixteen bytes, erasing nearly
all the initial graph saving. ZGC's wider retaining references affect its total.
[Exact byte counts](footprint-summary.csv) also retain eight-byte candidate and
twelve-byte compatibility controls.

## Hash costs

JMH 1.37 uses six independent forks per configuration, five one-second warmup
iterations and five one-second measured iterations. Each of the six possible
baseline/eight-byte-candidate/four-byte orders occurs once. Percentage changes
and exploratory 95% Welch intervals use log ratios of independent fork means.

| Collector | Operation | Eight bytes (ns) | Four bytes (ns) | Change (95% interval) |
| --- | --- | ---: | ---: | ---: |
| Serial | first identity hash | 13.44 | 15.94 | +18.6% [+16.0, +21.2] |
| G1 | first identity hash | 13.59 | 15.78 | +16.2% [+11.3, +21.4] |
| ZGC | first identity hash | 14.13 | 16.54 | +17.1% [+11.4, +23.2] |
| Serial | IdentityHashMap lookup | 2.57 | 2.75 | +6.7% [+2.9, +10.7] |
| ZGC | stored hash | 1.61 | 1.71 | +6.3% [+2.0, +10.7] |

[First-hash summary](hash-summary.csv) and [lookup/stored-hash summary](read-summary.csv)
retain candidate eight-byte controls. These measured costs rule out a universal
speedup or universal absence of performance regressions. Frequent native
`Instrumentation.getObjectSize` calls can also cost more in four-byte mode.

[Reproduction instructions](../README.md) describe the probes. Superseded matrices,
diagnostics and binary archives are omitted from the source-tree change. Complete
earlier raw evidence remains in the
[pinned historical archive](https://github.com/re-thc/openjdk-jdk27u/blob/18aa1e8aafbec83e22da0632c99b0dd2d1968235/doc/benchmarks/four-byte-headers/results/evidence.zip).
Final application samples and CI logs/artifacts supply current end-to-end proof.
