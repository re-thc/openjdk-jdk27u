# Current integration validation

The release/server JDK and test image built successfully from source
`770f5cd0ef89bceae11a5f66c014815bfa3b4b73`. The subsequent test-selector correction
and validation notes change documentation only. Production and test sources
remain byte-identical to that commit.

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

GoogleTest and GoogleMock source headers are absent; `GTEST_FRAMEWORK_SRC` is
empty. Consequently **Array.c_heap_allocation_size_vm** and
**ParkEvent.natural_alignment_and_recycled_events_vm** could not be built/run.
They are blocked, not passes/skips. Centrally supplying a normal framework
source tree (version 1.14 or later, both googletest and googlemock), configuring
`--with-gtest` and building the gtest artifact removes this dependency blocker.
No dependency was installed for this task. The old-header negative Array control
also remains pending; inline allocator code requires its own compiled artifact.

No fastdebug/full-tier or other-platform result is established. No local
per-helper C2 entry/peak-memory measurement, fresh matched NMT memory comparison,
startup, RSS/PSS, representative throughput or pause-tail qualification was
performed. Historical NIO memory results do not become measurements of this
rebased image merely because its functional tests pass. The separate observer
fixture was neither compiled nor run. No dedicated Shenandoah or HTTP/2 test, hosted CI, provisioning or previously
stopped probe was run.
