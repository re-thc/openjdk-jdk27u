# Development profile measurements

Initial GC/CPU/cache/linker measurements were made on 2026-10-05 against master
`33e539f2d4a847f283a3793df6eebd41b9d1dfac`, before the final desktop module
omission. The separate module-omission measurement below was made on 2026-10-06.
These are local Linux x64 measurements, not projections for every CI runner.
[Raw measurements and repeated samples](development-performance-results.json)
are included for review.

## Build and size

| Measurement | Upstream profile | Initial development profile | Reduction |
| --- | ---: | ---: | ---: |
| Default expanded CI jobs | 96 | 57 | 40.6% |
| Native build jobs | 23 | 8 | 65.2% |
| Tier1 test jobs | 72 | 48 | 33.3% |
| Cold `make images` | 1,058.419 s | 1,047.254 s | 1.1% |
| Clean rebuild, warm ccache | 1,058.419 s (no cache) | 231.273 s | 78.1% |
| `libjvm.so` link, identical 1,231 objects | 1.925 s (GNU ld) | 0.440 s (mold) | 77.2% |
| JDK image, summed regular-file bytes | 420,044,154 | 417,416,965 | 0.6% |
| Shipped `libjvm.so` bytes | 29,585,104 | 28,936,736 | 2.2% |
| Production HotSpot C++ objects | 1,231 | 1,114 | 9.5% |

The original default matrix had six native targets plus cross-compilation,
JVM variants, static libraries and documentation builds. The new matrix has
Linux x64/ARM64, macOS ARM64 and Windows x64, with release and fastdebug
builds and all twelve tier1 shards per target. The reduced test-job count
comes entirely from dropping two targets; no tier1 shard is removed.

Both local image builds used GCC 16.2.0, boot JDK 27+35, four make jobs,
release mode, external level-1 native debug information, no bundled symbols,
and `--with-jmod-compress=zip-1`. The host was Debian 13 with five available
CPUs on an Intel Xeon Platinum 8573C and about 17 GiB RAM. Baseline native
code used the upstream CPU baseline, all collectors, GUI support, GNU ld
2.44 and no ccache. The timed candidate enabled Serial/G1/ZGC, Linux
headless-only mode, x86-64-v3, mold 3.0.0 and ccache 4.11.2; desktop modules
were still present. Neither timed image build included GTest; GTest and the test
image were built afterward for validation. Elapsed times use Python's
monotonic clock around successful `make images` processes.

The warm measurement followed `make clean` and reused only the populated
compiler cache; Java compilation and image generation ran again. Cold cache:
0/1,688 hits. Warm cache: 1,688/1,688 hits (1,538 direct, 150 preprocessed).
This is the same-source best case, not a promise that every changed-source
CI build will save 78%. The cold results are single samples and do not
establish a statistically significant cold-build improvement.

The linker comparison relinked the baseline's identical objects and flags
six times per linker, discarded the first run, and reports the median of
five measurements. It isolates link time from the GC/CPU/headless changes.

## Desktop module omission on every target

The final profile omits desktop modules and tools on Linux, macOS and Windows.
An isolated Linux x64 size comparison links the same validated initial-profile
jmods twice, with identical options, changing only the selected module set.
Both images keep the selected packaged jmods. Source ZIPs copied by `make images`
are outside this comparison; these are linked-image sizes, not complete source
build timings.

| Linked image | Modules | Regular-file bytes | Reduction |
| --- | ---: | ---: | ---: |
| Initial profile, including desktop modules | 65 | 294,285,200 | — |
| Desktop-free profile | 56 | 239,108,429 | 18.7% |

The desktop-free image passed Serial/G1/ZGC allocation and collection checks,
rejection of Epsilon/Parallel/Shenandoah, and checks that desktop modules and
native GUI libraries are absent. Only image size is compared; no linking or
source-build speedup is inferred from this measurement. Fresh hosted runners validate
the complete source builds and retained tier1 tests for the final profile.

## Native symbols

| Same development-profile library | Bytes | Executable `.text` changed? |
| --- | ---: | --- |
| Internal level-1 debug information | 111,502,880 | No |
| External debug information, stripped from library | 28,936,632 | No |
| All static symbols stripped as well | 24,078,512 | No |
| Separate external debug companion | 87,428,560 | N/A |

These variants were made from one relink of the same objects. Their `.text`
SHA-256 was identical. The actual image's library adds a 104-byte difference
for the debug-companion link. External symbols reduce deployed file size
without losing the locally retained debug companion. Full stripping saves
another 16.8% of the library, but removes native symbol names useful in crash
diagnosis. Non-loaded debug sections do not represent executable code or a
measured runtime speedup.

Compiling `arguments.cpp`, `g1Allocator.cpp`, `zPageAllocator.cpp`,
`compileBroker.cpp` and `os_linux.cpp` three times each without ccache gave
combined medians of 15.893 s with `-g1` and 15.327 s without debug information:
3.6% less compile time for this sample. This is not a whole-build result.
Keep external level-1 symbols and exclude companions from CI bundles, as
before. Developers can explicitly choose `--with-native-debug-symbols=none`
for disposable local builds. This symbol choice retains native diagnostics;
desktop-dependent tools are omitted separately by the module profile.

## LLVM BOLT experiment

BOLT 23.1.2 rejected the final mold-linked library while decoding its PLT:
`unable to disassemble instruction in PLT section .plt at offset 0x10`.
To evaluate BOLT beyond that incompatibility, the same candidate objects
were relinked with GNU ld and `--emit-relocs`. BOLT instrumentation produced
a profile from the G1 allocation workload. The optimized library used
`-reorder-blocks=ext-tsp -reorder-functions=hfsort+ -split-functions
-split-all-cold`. A separate JDK image used that library and passed the
Serial/G1/ZGC and excluded-collector smoke checks.

| GNU-linked input versus BOLT output | Before | After | Change |
| --- | ---: | ---: | ---: |
| Fully stripped library | 23,906,104 B | 34,196,104 B | 43.0% larger |
| `java -version`, median of 20 starts | 32.180 ms | 31.447 ms | 2.3% faster |
| Serial allocation workload, median of 7 | 296.395 ms | 308.071 ms | 3.9% slower |
| G1 allocation workload, median of 7 | 265.791 ms | 263.821 ms | 0.7% faster |
| ZGC allocation workload, median of 7 | 296.551 ms | 292.850 ms | 1.2% faster |

Process order alternated between input and optimized libraries; the first
pair was discarded. The fixed workload allocated 50,000 32-KiB arrays,
retained the last 512 arrays and requested a full GC every 8,192 iterations,
with `-Xms128m -Xmx128m`. These short microbenchmarks do not establish a
production throughput gain. The G1 profile was deliberately checked against
Serial and ZGC as well. Hardware `perf` cycle counters were unavailable;
BOLT's instrumentation supplied the profile instead.

BOLT is not enabled: it adds profiling and relinking steps, currently rejects
the chosen mold output, grows the library, and did not show a consistent
runtime gain.
