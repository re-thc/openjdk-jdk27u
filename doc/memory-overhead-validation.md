# Current integration validation

The release/server JDK and test image built successfully from source
`770f5cd0ef89bceae11a5f66c014815bfa3b4b73`. The 13 jtreg results below retain that source and image identity. Subsequent
changes repair only the two new native test sources and update documentation;
production sources remain byte-identical to that commit.

Environment: Linux x86-64, Intel Xeon Platinum 8573C, four-CPU cgroup quota,
GCC/G++ 16.2.0, boot JDK 27+35-2325, Make 4.4.1, autoconf 2.72, mold and installed
jtreg 8.3-dev+1. The target identifies itself as
27.0.2-internal-memory-overhead-review. Build parallelism was four; the
`images test-image` invocation completed in 32m47s within a 40-minute bound.
The only warnings were the existing deprecated SourcePositions API and three
mold version-script sentinel-symbol warnings. No OOM event occurred.

## Executed correctness checks

All 13 selected jtreg test IDs passed, with zero failures, errors and skips.
Tests were sequential (`JOBS=1`, `TEST_JOBS=1`, `JTREG JOBS=1`), pinned to CPUs 0–3,
with 256 MiB test heap and 600-second outer bounds per group. No tests failed and
required a product-code repair. No benchmark/observer ran.

| Group | Tests | Result |
| --- | --- | --- |
| Code-cache unloading | `gc/TestCodeCacheUnload.java#serial`, `#parallel`, `#g1`, `#z`; `gc/g1/TestCodeCacheUnloadDuringConcurrentMark.java` | 5 passed; the flagless concurrent-mark case executed |
| C2 | `compiler/types/TestInterfaceSetScratch.java`; `compiler/stringopts/TestLongStringConcat.java` | 2 passed; the new test unconditionally requires both regular level 4 compilations and validates results before/after |
| NIO | `sun/nio/ch/TemporaryBufferCarrier.java`; `sun/nio/ch/TempBuffer.java`; `java/nio/channels/FileChannel/TempDirectBuffersReclamation.java` | 3 passed; both carrier modes complete 32 tasks × 8 rounds with checksum 1627136 |
| Thread API | `java/lang/Thread/SleepWithDuration.java`; `java/lang/Thread/JoinWithDuration.java` | 2 passed; 3 and 8 JUnit checks respectively |
| AOT | `runtime/cds/appcds/aotCode/AOTCodeTest.java#g1` | 1 passed with actual record/create/on workflow and `AOTVerifyTrainingData` enabled in all child commands |

The AOT record phase produced a 27,385,856-byte configuration; assembly produced
a 28,631,040-byte cache; production used that cache. The test's positive code-cache
assembly/load/adapter assertions passed. The configured workflow enables
AOTRecordTraining ergonomically in the native `CDSConfig::setup_compiler_args`.
These are functional AOT artifacts, not requested-allocation measurements or a
proof of every dependency-list boundary. Successful scratch logs were cleaned
by jtreg's normal retention policy; commands, artifact sizes and pass status
remain in the JTR. No rerun was made to obtain additional logging.

For repository-based reproduction, use the configuration/dependency directions
in `memory-overhead.md` and the valid test paths below. Use `test-only` after
building when no compiled source has changed:

```sh
make CONF=memory-review JOBS=1 TEST_JOBS=1 test-only \
  TEST="test/hotspot/jtreg/gc/TestCodeCacheUnload.java#serial test/hotspot/jtreg/gc/TestCodeCacheUnload.java#parallel test/hotspot/jtreg/gc/TestCodeCacheUnload.java#g1 test/hotspot/jtreg/gc/TestCodeCacheUnload.java#z test/hotspot/jtreg/gc/g1/TestCodeCacheUnloadDuringConcurrentMark.java test/hotspot/jtreg/compiler/types/TestInterfaceSetScratch.java test/hotspot/jtreg/compiler/stringopts/TestLongStringConcat.java" \
  JTREG="JOBS=1;TIMEOUT_FACTOR=1;JAVA_OPTIONS=-Xmx256m"
make CONF=memory-review JOBS=1 TEST_JOBS=1 test-only \
  TEST="test/jdk/sun/nio/ch/TemporaryBufferCarrier.java test/jdk/sun/nio/ch/TempBuffer.java test/jdk/java/nio/channels/FileChannel/TempDirectBuffersReclamation.java test/jdk/java/lang/Thread/SleepWithDuration.java test/jdk/java/lang/Thread/JoinWithDuration.java" \
  JTREG="JOBS=1;TIMEOUT_FACTOR=1;JAVA_OPTIONS=-Xmx256m"
make CONF=memory-review JOBS=1 TEST_JOBS=1 test-only \
  TEST="test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeTest.java#g1" \
  JTREG="JOBS=1;TIMEOUT_FACTOR=1;JAVA_OPTIONS=-Xmx256m -XX:+UnlockDiagnosticVMOptions -XX:+AOTVerifyTrainingData"
```

Apply the same external 10-minute timeout and CPU-affinity bound when repeating
these groups on a compatible host. Do not force `TEST_VM_FLAGLESS` to bypass
requirements. The earlier invalid `hotspot:path`/`jdk:path` selector syntax
selected no tests; it is corrected in the integration instructions.

## Binary identity and remaining limits

Tested image SHA256:

| File | SHA256 |
| --- | --- |
| `bin/java` | `3649ae636874ae1d46bd1335b12a89841cf7f978bdd9700fe650581f3e4d397e` |
| `lib/modules` | `4a072ac9b8d17e162fbc019a75d31bebdddfaae4c8f2883e7ba322cb143b9665` |
| `lib/server/libjvm.so` | `98be99a3e688df318bb970289aaa612e64b7629f1b7b134699007294137b0138` |

A standard `make test` prerequisite repackaged the image after the documentation
selector correction. All 524 image files remained identical except `release`,
whose SOURCE metadata changed from `.:git:770f5cd0ef89` to
`.:git:770f5cd0ef89+`. That actual dirty suffix is preserved, not rewritten;
it denotes the documentation edit. No product or test source changed, and the
launcher, module archive, libjvm and all CDS archive bytes stayed identical.
Thirteen JTRs and hashes for 479 test class files were retained privately, together
with complete image manifests and build/test receipts; none is a required build
input or substitutes for an executed test.

## Focused native correctness checks

The documented managed-source route in `doc/building.md` and the repository's
`GTEST_VERSION=1.14.0` pin supplied both GoogleTest and GoogleMock. The official
`v1.14.0` checkout resolves to `f8d7d77c06936315286eb55f8de22cd23c188571`.
Sources were fetched into ignored `build/dependencies/googletest`, configured
with `--with-gtest`, and built using `make CONF=memory-review JOBS=4
test-image-hotspot-gtest`. No unmanaged tools or system packages were installed.
The original compiler/configuration/source date were retained; PCH is disabled.

Two test-only repairs were necessary: use standard `ASSERT_NE(nullptr, value)`
in place of an unavailable assertion macro, and remove the obsolete
`INCLUDE_NMT` guard that silently compiled Array's test out. The initial empty
Array selection is an unsuccessful check, not a pass; its receipts are retained.
No product repair was needed.

| Exact filter | Executed | Skipped | Failed assertions | Exit |
| --- | ---: | ---: | ---: | ---: |
| `Array.c_heap_allocation_size_vm`, fixed header | 1 | 0 | 0 | 0 |
| `ParkEvent.natural_alignment_and_recycled_events_vm` | 1 | 0 | 0 | 0 |
| `Array.c_heap_allocation_size_vm`, separately compiled old header | 1 | 0 | 12, all requested-size assertions | 2 (expected) |

Each invocation used CPUs 0–3, `-XX:NativeMemoryTracking=summary -Xmx256m
-XX:ActiveProcessorCount=4`, the preserved jtreg-tested JDK via `-jdk`, XML output,
and a 60-second bound. The two positive cases have empty stderr. The negative
case reports only the launcher's expected `RUN_ALL_TESTS() failed. Error 1` on
stderr. Tag, length, zero initialization and element access assertions pass
in both Array artifacts. ParkEvent exercises eight concurrently held events
across sixteen recycling rounds, including pending permits; it does not block
or delete immortal events.

The old header is the exact `oops/array.inline.hpp` from baseline
`89885a6288e7aaabd01678a704a586272c0f96e3` (SHA256
`1deb4794bf0809680b8a602770145fd4641293550044bbf3fbe751b8a697843e`).
To reproduce this control after building the fixed tests:

1. Export that header into a separate `headers/oops` directory. Parse the actual
   `gtest/objs/test_array.o.cmdline` compiler recipe as an argument vector,
   remove dependency-output options, prepend `-I` for the separate headers, and
   compile the same current test source to a separate object. Preserve all other
   compiler flags and disable PCH. Never overwrite the fixed object.
2. Preprocess both translation units using those same include paths and flags.
   Confirm fixed `AllocateHeap(size, flags)` versus old
   `AllocateHeap(size * BytesPerWord, flags)` in the MemTag allocator.
3. Copy the response-file contents referenced by
   `gtest/objs/BUILD_GTEST_LIBJVM_run_ld.cmdline`, replacing exactly the one
   `test_array.o` path. Link to a separate `libjvm.so` using the same recipe,
   unchanged production/test objects and libgtest. Copy the identical launcher
   alongside it. The executed control verified hashes of all 1,456 shared
   response-file inputs remained unchanged.
4. Run the exact Array filter with the same image and flags. Require one executed
   case, zero skips, and exactly twelve failures, each at the requested-size
   equality. A crash, empty selection or additional failure is inconclusive.

The fixed requested sizes are 8–8,008 bytes across the twelve type/length
combinations; the old artifact requests eight times each size. For example,
length-zero `u1` requests 64 bytes instead of 8. These are actual NMT requested
allocation sizes, not RSS/PSS or allocator-rounded physical bytes.

Artifact SHA256:

| Artifact | SHA256 |
| --- | --- |
| Fixed gtest libjvm | `9fe1502931445dffe07d00420b8c9840f2a0d2fda8cc8f1f645019d455bb1dc9` |
| Old-header gtest libjvm | `1ae3277271f846ac8125c5859b651d802cfbae8cd563a517770edd51ae5db860` |
| Identical gtest launchers | `d807aa99761c8fe3df61b1d45766969fdba3d879ab0083b5d2a1faffa8784551` |
| Old-header test object | `9395c977a4ea19b7c5d3bd32bcd514f44eccfc1dd20e426664bc130cbaf7b49f` |

The gtest libjvm is a separate artifact linked from the existing product objects
and current tests. It is not the product libjvm previously used by jtreg.
The preserved JDK's launcher/modules/product-libjvm hashes still match the table
above. All thirteen original jtreg results remain preserved without rerunning.

No fastdebug/full-tier or other-platform result is established. No local
per-helper C2 entry/peak-memory measurement, fresh matched NMT memory comparison,
startup, RSS/PSS, representative throughput or pause-tail qualification was
performed. Historical NIO memory results do not become measurements of this
rebased image merely because its functional tests pass. The separate observer
fixture was neither compiled nor run. No dedicated Shenandoah or HTTP/2 test, hosted CI, provisioning or previously
stopped probe was run.
