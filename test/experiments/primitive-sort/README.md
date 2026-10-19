# Primitive sort backend comparison

This standalone Linux x64 experiment compares the public JDK sort, Google
Highway VQSort, IPS2Ra with fresh/reused contexts, Rust ipnsort, full upstream
x86-simd-sort AVX2/AVX-512, std::sort and pdqsort. Sources are fetched from exact
official revisions by `src/fetch.sh`; no prototype archive is required.

Use a JDK 27 toolchain, GCC 16.2 and Rust 1.99.0
(`b940084d7eb6a299eb4bfeb8e34901bc051e7ac4`, LLVM 23.1.1). The saved environment
can activate these with `/workspace/toolchains/activate.sh`. The scripts expect
this environment; adapt the setup line to use an equivalent toolchain elsewhere.
The C++ TBB runtime is needed for the separate parallel experiment.

`BackendBench` measures a normal JNI transition, fresh native buffer allocation,
16,384-element copies, native sort/context costs, and copy back. Its `leaf` mode
uses a critical FFM heap boundary capped at 65,536 elements; it is an experiment,
not a proposed production GC strategy. `guards.cpp` checks both guard-page
placements and independently sorted complete outputs, counts requested C++
allocations, and injects allocation failure. `BoundaryStress` exercises copied
sorts concurrently with G1/Serial/ZGC.

`PublicBench` calls the actual public array APIs. `leaf.cpp` substitutes only the
native sort entry in a copied complete image, forwarding existing partition and
small-sort operations to the original library. Preserve `BASE_SIMDSORT` and set
`PRIMITIVE_BACKEND=1/3/4` to test Highway/reused IPS2Ra/Rust. Its activation
counters distinguish 4,096-element warmup calls from 65,536-element calls.
The Java dispatch patch is generated from a clean baseline by `make-patch.py`.
The copied public-path prototype uses `jdk.util.Arrays.backendCopy=true`.
This experimental backend selector is not part of the product implementation.

Public measurements use fixed interleaved orders, medians of all measurement
windows and paired fork directions. Reset copies and oracle checks are outside
timing; copies that are part of the native boundary are inside timing. The
sorting Java thread is pinned to CPU 2, while the process starts on CPUs 0/1/3/4.
Adjust the affinity for another host. Use representative mixed warmup when
qualifying steady state: random-only warmup can deoptimize the new top-level
intrinsic entry on its first ordered case and leave later calls in Java.
Cold calls and fresh-process startup must be measured separately.

`final-campaign.py` compares complete baseline/candidate/opt-out images, including
fixed holdout sizes and offsets, neighboring thresholds, whole-array overloads,
protected Java paths and memory-bandwidth-size inputs. Every observation must be
retained. `SafepointBench` records GC overlap and uses `-Xlog:safepoint` for the
reaching-safepoint component. `NativeActivation` verifies native frames and the
opt-out. `fail-malloc.c` injects failure only into the product library's malloc
calls, testing Java fallback after a potentially mutating run scan.

The prior unavailable Java production sorter is for objects/collections, not
primitive arrays. It is not represented as a primitive baseline. Float/double
are outside the backend scope; raw VQSort and Rust total_cmp are not asserted
to preserve Java NaN payload or signed-zero semantics.

Raw measurements, host journals, binaries, images and downloaded dependencies
belong outside the repository. This source bundle does not include them.

Reproduction layout and commands (run from this experiment directory):

```sh
bash src/fetch.sh
bash src/build.sh
# Put immutable complete images in images/base and images/candidate-e9.
# Use the matching product source for the regression test class:
javac -d build "$JDK_SOURCE/test/jdk/java/util/Arrays/NativePrimitiveSort.java"
./build/guards > evidence/guards.txt
bash src/run-boundaries.sh "$PWD/images/base/bin/java"
python3 src/make-patch.py --jdk-source "$JDK_SOURCE" --revision e5
# For the leaf prototype, copy images/base to images/leaf; replace only its
# lib/libsimdsort.so with build/libsimdsort.so. The driver sets BASE_SIMDSORT.
python3 src/public-screen.py
python3 src/public-e5.py
SORT_EXPERIMENT=e9 SORT_CANDIDATE_IMAGE="$PWD/images/candidate-e9" \
  python3 src/final-campaign.py scope
SORT_EXPERIMENT=e9 SORT_CANDIDATE_IMAGE="$PWD/images/candidate-e9" \
  python3 src/final-campaign.py protected
# Holdout and verification are distinct experiments; never tune on either.
SORT_EXPERIMENT=e9 SORT_CANDIDATE_IMAGE="$PWD/images/candidate-e9" \
  python3 src/final-campaign.py verification
python3 src/public-summary.py evidence/e9-verification
SORT_EXPERIMENT=e9 SORT_CANDIDATE_IMAGE="$PWD/images/candidate-e9" \
  python3 src/cold-campaign.py
SORT_CANDIDATE_IMAGE="$PWD/images/candidate-e9" ISA_ONLY=1 \
  python3 src/post-campaign.py
```

`post-campaign.py` without `ISA_ONLY` also runs the unaffected primitive types,
parallel and safepoint experiments. It derives private Highway dispatch offsets
from the exact supplied product ELF and verifies the function-table entries.
This is a test companion; the product does not expose a feature-mask override.
Use the measured CPU's official Highway target name in that probe on another
microarchitecture. `UseAVX=2` restricts HotSpot, not Highway's hardware dispatch.

`diagnostic-campaign.py` is the fixed post-holdout diagnosis of revision 294bf944a5c:
200 case warmups, 25ms windows, tiered/C2-only/no-intrinsic compilation modes,
and two balanced pairs. Its observations supplement the original short-call
losses and must not replace them. E9 adds sampled-monotonic routing to the
original Java entry and defers library initialization until native admission;
its thresholds and native boundary remain unchanged. `verification` uses new
sizes, offsets and seed; it is not a second blind algorithm-selection holdout.

The malloc tracer is glibc-specific and records library-owned requested malloc
bytes. It does not measure all allocator/loader/thread overhead. The selected
static C++ runtime retains a 72KiB process pool; the measured library's PT_TLS
is 40 bytes per OS thread, plus loader alignment/overhead. Sort buffers are
4MiB/8MiB at the upper bound, owned and freed by each call. Do not equate RSS
with live owned allocations. IPS2Ra reused contexts and parallel worker pools
have separate ownership and cleanup costs; they are not shipped by the product.

`fault-seed-component.sh IMAGE OBJECT_DIR HIGHWAY_DIR` rebuilds only the RNG
object in a fresh test copy and throws `std::bad_alloc` inside the product's own
static C++ component. It verifies the native catch boundary and RAII cleanup.
`throw-seed.cpp` preserves an unsuccessful diagnostic: throwing from a foreign
preloaded component aborted across isolated static unwinders. It is not a
qualification pass or a recipe used by the selected implementation.

For final tests, use full release and fastdebug images with jtreg8.3, rather than
a patched class or native-kernel image. Run `Sorting`,
`SortingNearlySortedPrimitive`, `NativePrimitiveSort`,
`NativePrimitiveSortDeoptimization`, plus HotSpot's `SortingDeoptimizationTest`
and `TestOffsetSorting`. Exercise G1/Serial/ZGC, interpreter, C1, C2-only, opt-out,
HotSpot intrinsic disablement, AVX flags, compact/wide object headers, small
stacks, concurrent sorting and forced native allocation failure. No test here
qualifies floating-point semantics or non-x64 performance.

Final scope decision: E9 rejected the default int backend after repeated
79.1% skewed-int65K losses in all four directions, with a near-baseline
same-image opt-out control. E10 retains only long[]. Int public APIs and
int run-scan visibility are restored to baseline, and no int native entry or
kernel is linked. Historical int/C2 and all-family prototypes remain in this
harness so the rejection can be reproduced. `NativeActivation` defaults to
long-only expectations; set `-DnativeInt=true` for the earlier int+long image.
The final product owns at most an8MiB sort buffer per call. Its default
thresholds and long admission are unchanged from E9.

On the final product, the post driver also runs four balanced baseline/actual
AVX2 pairs through `NativeAVX2Bench` and the identical `PublicBench` driver.
The feature mask is set only in the external test companion; the product has
no forced-ISA property. A separate fixed compiler diagnostic captures
HotSpot CITime and full LogCompilation XML for both images. Do not equate a
sum of overlapping compile-task intervals with actual compiler CPU time.

For E10, set `SORT_EXPERIMENT=e10` and the final image path in the commands
above. The post driver compiles the ISA companion with the same x86-64-v3 and
HWY_WANT_AVX3_ZEN4 target mask as the product. Its `SORT_AUX_OUT` directory must
be new. `SORT_EXPERIMENT=e10 python3 src/ancillary-summary.py evidence/e10-ancillary` summarizes those outputs and the matching cold CSVs.
Keep fixed thresholds/inputs and record any source revision as a new experiment;
all losses and failed-initialization diagnostics belong in the retained evidence.

Product implementation and review: https://github.com/re-thc/openjdk-jdk27u/pull/57
Final product source: fd19ce8f58945e0b86afb2935598d358353b0182.
Use that source/image in a separate checkout; this harness branch starts from the original baseline.
