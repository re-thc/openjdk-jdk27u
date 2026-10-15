# Measuring memory and buffer operations

The PR's comparison table and linked evidence archive contain the individual
results, image/source hashes, toolchain and host identity, commands, independent
fork means and allocation measurements. The archive also retains rejected
prototypes and their losses. Only the final selected source belongs in the PR.

## Environment and controls

The current reference baseline is master
`e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`, including four-byte headers. Both
baseline and patched images were built from that source with the same full
release configuration, GCC 16.2.0, mold, boot JDK 27 and JMH 1.37. The machine is
an AMD EPYC 9V74 under KVM, with AVX2/AVX-512 exposed, Linux x86-64 and glibc
2.41. Measurements use CPU 2, a 256 MiB fixed Java heap and no concurrent build
or test load. This is one host; native AArch64 speed is not established here.

Execution modes are separate:

| Mode | VM options |
| --- | --- |
| Interpreter | `-Xint` |
| C1 | `-Xbatch -XX:TieredStopAtLevel=1` |
| Default tiered | No compiler-tier override |
| Warmed C2 | `-Xbatch -XX:-TieredCompilation` |

The broad initial survey uses one short, unforked run to locate costs. It covers
the public mismatch/equals/compare operations, typed mismatch in both byte
orders, segment copy/fill, buffer bulk transfers/compact, byte-swapped copy,
hashing, UTF-8 decoding and full/isolated NUL-string operations. These survey
numbers are exploratory, not acceptance evidence.

Qualification uses one fork per image per independent block, three 300 ms
warmup iterations and three 300 ms measurements, with `-prof gc`. Two-image
blocks alternate image order; three-image controls use all six permutations.
The unchanged PR image is a separate control for the regression repair. The
table reports average complete-operation latency and baseline/patched ratio.
Uncertainty is a 95% percentile bootstrap interval over paired independent
blocks, with 20,000 resamples and seed 817291. Iterations in one fork are not
independent processes. Raw results retain outliers, individual losses and the
earlier three-fork qualification against master `87edd79d3104ff502f7befec034716b081436f49`.
Profiler background allocation near zero is not presented as application allocation.

The enabled, baseline-disabled and patched-disabled cases use the same fixtures.
The disabled control passes
`-XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic`. Public API
checks, staging, ownership and result processing are included. Fixtures are
prepared outside steady-state measurements. Fresh-process measurements record
setup, first complete operation, allocated bytes, cleanup and total process
time separately; creating views is included in the first typed operation.
First-use preparation itself calls ordinary bulk operations, so these results
are not a claim that no relevant class or native mechanism has been initialized.
RSS, binary size, allocation, startup, latency and throughput are distinct
outcomes. No startup or footprint improvement is claimed from scan throughput.

## Fixtures and reproduction

The recovered material from
`3d712a1d59dcfa0902869f9d629c181c2d4a35e2` contributed exactly six test/benchmark
files over its original baseline, and no production changes. Its implementation
ancestors were not imported. Copyright notices are retained.

`MemoryBufferOperations` covers heap, confined/shared native, direct, mapped and
both mixed-storage orders. `DIRECT` and `MAPPED` measure segment-backed buffer
views. `PLAIN_DIRECT` and `PLAIN_MAPPED` measure ordinary NIO slices with no
segment proxy; cleanup explicitly releases their owned roots. Sizes include zero, tiny, 4 KiB, 64 KiB
and 1 MiB, with alignment 0/1/7 and equal/first/middle/last differences. The
qualification adds 63/64/65 and 65535/65536/65537-byte boundaries. Equal data uses
nonzero bytes; differing data and logical buffer regions are verified in setup.
Typed views use native and opposite orders. Floating-point contracts are
validated separately in jtreg.

Build each image and the microbenchmark jar using the same configuration:

```sh
make CONF=release images test-image
```

For example, run the complete mismatch qualification for each image and tier:

```sh
taskset -c 2 "$JAVA" -cp benchmarks.jar org.openjdk.jmh.Main \
  'MemoryBufferOperations.(bufferMismatch|segmentMismatch|intMismatch)$' \
  -jvmArgs '-Xms256m -Xmx256m -Xbatch -XX:-TieredCompilation' \
  -f 3 -wi 3 -i 3 -w 300ms -r 300ms -prof gc \
  -p size=8,65536 -p storage=HEAP,DIRECT -p alignment=1 \
  -p difference=MATCH,FIRST -rf json -rff results.json
```

Use the archive's exact commands to reproduce the extended boundary/mapped/mixed
matrix, disabled controls and fresh-process measurements. Longer iterations and
additional native machines are appropriate before extrapolating these results.

`SegmentGetString` separates `getString` from `StringSupport`'s isolated scan.
It includes first/second/prefix-boundary/middle/last terminators and no terminator;
the last case includes the public API's expected exception cost. Full operations
copy and decode their actual prefix, not the entire segment to enter a kernel.

## External comparators and preserved paths

The optional comparator benchmarks use libc `memchr` and StringZilla v5.3.0,
pinned to `86d73f1021e6cce022c3cceb1f7837eb50338774` (Apache-2.0). The source is
from [StringZilla's maintained repository](https://github.com/ashvardanian/StringZilla).
The archive records the CMake command, source pin, library hash and license.
Reproduction builds that exact pin and supplies
`-Dstringzilla.library=/absolute/path/libstringzilla_shared.so` to each fork;
it does not fetch an unpinned latest release. Updating the comparator requires
checking the upstream release, C ABI and supported dispatch again. No library
is bundled or added as a runtime dependency by this change; PR #4 owns the
fork's StringZilla integration.

```sh
taskset -c 2 "$JAVA" -cp benchmarks.jar org.openjdk.jmh.Main \
  'SegmentLibraryString.(getString|libcGetString|libraryGetString|jdkScan|libcScan|libraryScan)$' \
  -jvmArgs '-Xms256m -Xmx256m -Xbatch -XX:-TieredCompilation --enable-native-access=ALL-UNNAMED --add-exports=java.base/jdk.internal.foreign=ALL-UNNAMED -Dstringzilla.library=/absolute/path/libstringzilla_shared.so' \
  -f 3 -wi 3 -i 3 -w 300ms -r 300ms -prof gc \
  -p size=64,65536 -p storage=CONFINED -p alignment=1 \
  -p terminator=FIRST,LAST -rf json -rff strings.json
```

At 64 KiB on warmed C2, baseline early-NUL `getString` measured 2.10 ns/op and
zero application allocation, versus 10.02/10.10 ns and 8 B/op for the libc and
StringZilla complete comparators. With a late NUL, the baseline measured
11,768 ns versus 6,808/7,140 ns, all allocating approximately 65,560 B/op. C1 and
interpreter comparators also lose for early NUL. Faster isolated scanning does
not justify an unconditional adapter; string production remains unchanged.
These FFM benchmarks use owned fixtures, and do not prove mapped-fault,
concurrent-close, critical-call duration or production lifetime equivalence.

StringZilla's equality comparator has no index-returning mismatch operation.
Unequal data needs a second public scan. Heap inputs above 64 bytes retain the
public implementation instead of using a long critical downcall. This is a
measurement of complete hybrid cost, not a production acceleration layer.

Copy/fill and contiguous bulk transfers already call existing native atomic
copy/fill mechanisms in early tiers. Buffer hashing has a specified signed
element polynomial, and opposite-order and floating-point comparisons retain
their logical rules. Direct charset conversion and interpreter mismatch have
measured remaining costs; they are not relabeled as wins or replaced with an
incompatible kernel. Native AArch64, macOS and Windows validation and current-head
CI status are reported in the PR rather than inferred from this x86-64 host.

## Validation

Run focused tests on the release image and compiler IR matching on fastdebug:

```sh
make CONF=release test TEST='test/jdk/java/foreign test/jdk/java/nio/Buffer test/jdk/java/nio/MappedByteBuffer' JTREG='KEYWORDS=!manual'
make CONF=fastdebug test TEST='test/hotspot/jtreg/compiler/intrinsics/NativeVectorizedMismatchTest.java test/hotspot/jtreg/compiler/intrinsics/VectorizedMismatchTest.java'
make CONF=fastdebug test TEST='test/hotspot/jtreg/compiler/intrinsics/unsafe test/hotspot/jtreg/runtime/Unsafe test/hotspot/jtreg/runtime/handshake test/hotspot/jtreg/runtime/cds/appcds/aotCode'
```

The PR reports executed suites and failures explicitly. Additional focused runs
exercise opt-out, ISA limits, header sizes and GC configurations. Ordinary direct
buffers are tested under concurrent GC; arena-backed buffers cover confinement
and closed-session precedence. Mapped truncation tests intentionally touch
inaccessible pages and require `InternalError`, including C1's existing stub,
C2's bounded stub and inlined word accesses. Boundary tests use unequal sentinels
outside logical regions to catch overreads affecting results.
