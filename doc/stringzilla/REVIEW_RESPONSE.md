# PR #4 review follow-up

The review covered an earlier default-off revision. This fork remains enabled by
default, with `-XX:-UseStringZillaIntrinsics` as the opt-out. The findings below
are checked against the current implementation.

## Findings and resolutions

| Finding | Resolution and evidence |
| --- | --- |
| F1: the mixed-coder stack bound depended on callers | `search_impl` now rejects negative counts and counts above the actual 64-element buffer capacity before reading the needle, widening it, or doubling its byte length. This protects both forward and reverse kernels in release builds. Public Java searches with longer needles still use the original scalar path. |
| F2: small/boundary inputs can have slower means | The complete tables and raw samples remain intact. The benchmark notes explicitly identify the short-input/crossover limitation and distinguish repeated-prefix interpreter worst cases from tiered workloads. The 256-byte gates are retained; one CPU's borderline character case does not justify a new universal threshold. |
| F3: C1 equality is newly accelerated | The tier descriptions explicitly cover interpreter length/first-byte checks, the C1 eight-byte prefix and leaf, and unchanged C2 equality. Existing default/on/off availability checks verify the flag gate in both compilers. |
| F4: serial-only ports/toolchains and validation limits | The README now explicitly describes MSVC x64 serial selection, other ports' generic JNI interpreter entries and serial shared-C2 leaves, and which toolchains remain unbuilt. Kernel sanitizer scope is recorded below. ARM validation is functional under QEMU, with no hardware timing claim. |
| F5: initialization is called twice | Both calls are intentionally retained: `System.registerNatives` publishes kernels for bootstrap equality; the class initialization entry also initializes its JNI dependency. The comment and README describe this idempotent behavior. The direct test verifies that repeated initialization republishes the same immutable table for every capability mask. No per-search initialization or allocation is added. |

## Native regression test

`StringZillaKernelsTest.java` and `libStringZillaKernelsTest.c` are integrated with
normal native jtreg builds. The C test includes the production kernels with
isolated capability/publication callbacks, so Java length gates and VM debug
assertions cannot hide the native bug.

It checks selection for all eight capability masks and executes every selected
table supported by the running CPU. Forward/reverse checks cover empty needles,
1/63/64 characters, multiple matches, misses, short haystacks, unsigned Latin-1
widening, and negative/65/128/4096/INT_MAX counts. Invalid counts use null pointers
and both empty and INT_MAX-length haystacks to verify rejection before any read.
The x86 host executes serial, AVX2 and AVX-512 tables; AArch64/QEMU executes
serial and NEON tables. Unsupported ISA tables are checked for selection without
executing their instructions.

A standalone 65-character reproducer compiled against the pre-fix source fails
with **ASan stack-buffer-overflow**, also diagnosed by UBSan's bounds check.
The same reproducer passes against the fixed source. The full direct kernel test
passes ASan and UBSan with alignment instrumentation excluded. Unfiltered UBSan
reports upstream unaligned word loads in `types.h` / `find/serial.h`; those
vendored files remain unmodified. This is kernel-only sanitizer coverage, not a
whole-JDK sanitizer run.

Reproduce the automated regression test with:

```sh
make CONF=cloud test 'TEST=jtreg:test/jdk/java/lang/String/StringZillaKernelsTest.java'
```

Standalone sanitizer reproduction on Linux, from the repository root:

```sh
stringzilla_test_dir=$(mktemp -d)
cat > "$stringzilla_test_dir/driver.c" <<'EOF'
#include "libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    int line = check_kernels();
    printf("Kernel check failing line: %d\n", line);
    return line != 0;
}
EOF
cc -O1 -g -fno-strict-aliasing -fno-omit-frame-pointer \
  -fsanitize=address,undefined -fno-sanitize=alignment \
  -Itest/jdk/java/lang/String \
  -Isrc/java.base/share/native/libjava \
  -Isrc/java.base/share/native/libjava/stringzilla \
  -Isrc/hotspot/share/include -Isrc/hotspot/os/posix/include \
  -I"$TEST_JDK/include" -I"$TEST_JDK/include/linux" \
  "$stringzilla_test_dir/driver.c" -o "$stringzilla_test_dir/check"
ASAN_OPTIONS=detect_leaks=0 UBSAN_OPTIONS=halt_on_error=1 "$stringzilla_test_dir/check"
```

Set `TEST_JDK` to the built image, for example `build/cloud/images/jdk`.

## Validation of the hardened images

Recorded 2026-10-05 (Asia/Taipei):

* x86 release image and all four CDS archives rebuilt; x86 fastdebug and
  AArch64 cross-release libjava rebuilt.
* Selected default-on jtreg suites: **156 passed, 2 platform skips, zero failures
  or errors**. String: 93; StringBuilder: 16; StringBuffer: 25; HotSpot string
  intrinsics: 22 passed / 2 skipped. This includes the new direct kernel test.
* Release and fastdebug: all eight public scalar-oracle modes passed, including
  default-on interpreter/C1/C2, forced C2 startup, compact strings off,
  interpreter/compiled JNI fallback, and explicit opt-out. Default/on/off
  availability checks and forced compilation/execution of all 22 callers at
  levels 1 and 4 passed. Release checks include CDS/G1.
* Release: `UseAVX=0` and `UseAVX=2` public oracles passed; default and opt-out
  flag origins remain `{default}` true and `{command line}` false.
* The direct native test passed in release, fastdebug and AArch64/QEMU. ARM
  default/opt-out availability and all 22 C1/C2 callers passed.
* ARM default-on interpreter, C1 and C2 public search oracles passed.
* Vendor verification still reports 28 unmodified upstream files.

Full tier1/tier2, whole-JDK sanitizers, MSVC/other-port builds and ARM hardware
timing remain untested. The earlier review's pending CI observation is historical:
GitHub reported no commit statuses or PR workflow runs for the pre-follow-up head
when checked. Local test results above are independently recorded.

| Hardened artifact | SHA-256 |
| --- | --- |
| `build/cloud/images/jdk/lib/server/libjvm.so` | `ccd136760d4d94b60c9eb5046e27533778d2e2fda69da692bdaa5e21c3f8db15` |
| `build/cloud/images/jdk/lib/libjava.so` | `6fc1aed08c1aa301b86df317f24c5045f3a9eae9f75eae192834a60227f7a4f3` |
| `build/cloud/images/jdk/lib/modules` | `d8dc91b7adc3f3bf0bc2298982f397c019ac1e1e3809fdd7b2351177649c06b5` |
| `build/stringzilla-fastdebug/support/modules_libs/java.base/server/libjvm.so` | `cda8a26daf04dfe0bb0675353d9162c1084c0c52637d5ae72675c84e315e4461` |
| `build/stringzilla-fastdebug/support/modules_libs/java.base/libjava.so` | `fefb658778bc0ae9530c0dfc3906f092a7d033a19b190518ad21d87c9067c881` |
| `build/stringzilla-aarch64/jdk/lib/server/libjvm.so` | `58cdabb75e71bbcb50a73b6593a22169f627cf500abc0517b2d87499bf04f85f` |
| `build/stringzilla-aarch64/jdk/lib/libjava.so` | `383916027752f5721ca3c82399cf35d6baebd70d3d3c4cd95045c7b7b8bd464d` |

## Guard performance comparison

The main 259-pair benchmark matrix predates this native hardening and remains
unchanged in `results.json`. A separate targeted comparison uses the exact same
default-on release VM and modules, explicitly enables StringZilla in both states,
and changes only libjava between the pre-guard and hardened versions. It measures
mixed-coder forward/reverse misses in interpreter/C1/C2, with 4096-character
haystacks and 4/64-character needles. CPU 0 is pinned; runs are sequential with
two isolated forks, three 500 ms warmups and five 500 ms measurements per fork.
Builds and functional tests finish before timing. All 12 pairs have overlapping
JMH confidence intervals; the higher means are retained below. This is a focused
check of mixed-coder misses, rather than a rerun of the full matrix. C2 forward
search is a control using the existing platform intrinsic; C2 reverse reaches
the guarded native kernel. [Raw samples, confidence intervals, VM arguments,
source and before/after artifact hashes](review-results.json) record all 24
measurements.

| Tier | Operation | Needle characters | Before guard ns/op | After guard ns/op | Before/after |
| --- | --- | ---: | ---: | ---: | ---: |
| interpreter | indexOf | 4 | 535.489 | 527.413 | 1.02x |
| interpreter | indexOf | 64 | 486.126 | 495.575 | 0.98x |
| interpreter | lastIndexOf | 4 | 567.715 | 568.402 | 1.00x |
| interpreter | lastIndexOf | 64 | 486.204 | 496.430 | 0.98x |
| c1 | indexOf | 4 | 243.180 | 232.078 | 1.05x |
| c1 | indexOf | 64 | 265.163 | 250.087 | 1.06x |
| c1 | lastIndexOf | 4 | 297.099 | 296.916 | 1.00x |
| c1 | lastIndexOf | 64 | 273.089 | 291.855 | 0.94x |
| c2 | indexOf | 4 | 753.306 | 732.759 | 1.03x |
| c2 | indexOf | 64 | 770.559 | 721.819 | 1.07x |
| c2 | lastIndexOf | 4 | 272.440 | 257.546 | 1.06x |
| c2 | lastIndexOf | 64 | 293.841 | 279.028 | 1.05x |

To reproduce each state with the existing microbenchmark classpath, use the
appropriate tier option (`-Xint`, `-XX:TieredStopAtLevel=1`, or
`-XX:-TieredCompilation`) in both the launcher and fork arguments:

```sh
taskset -c 0 "$TEST_JDK/bin/java" -XX:ActiveProcessorCount=1 -XX:+UseSerialGC \
  -Xshare:off "$TIER_OPTION" -XX:+UseStringZillaIntrinsics \
  -cp "$JMH_CLASSPATH" org.openjdk.jmh.Main \
  'StringZillaSearch.(indexOf|lastIndexOf)$' \
  -p length=4096 -p coder=MIXED -p position=MISS -p needleLength=4,64 \
  -f 2 -wi 3 -w 500ms -i 5 -r 500ms -jvm "$TEST_JDK/bin/java" \
  -jvmArgs "-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off $TIER_OPTION -XX:+UseStringZillaIntrinsics" \
  -rf json -rff "$OUTPUT_JSON"
```

## CI compatibility follow-up

Recorded 2026-10-05 (Asia/Taipei). The subsequent CI failures exposed three
build/source-check gaps:

* GCC 11 diagnoses the vendored `#pragma region` directives when the native
  test includes the production kernels. Its flags now suppress only
  `unknown-pragmas`, matching production libjava's vendor-warning handling.
  The option is limited to GCC/Clang; MSVC receives no GNU warning flag.
* Zero defines the host architecture macros but does not provide x86 CPU flags
  or the x86 `VM_Version::supports_*` methods. Both architecture branches in
  `StringZilla::capabilities()` now exclude `ZERO`, leaving the serial result.
* The repository's `SortIncludes.java --update` corrected exactly the four
  reported files: `c1_LIRGenerator.cpp`, `c1_Runtime1.cpp`, `library_call.cpp`
  and `stringZilla.cpp`. No unrelated include lists changed.

Validation:

* The original native test flags reproduce `-Werror=unknown-pragmas` with
  GCC 11.3.0; the fixed flags compile cleanly with `-Werror` retained.
  GCC 11 release/debug native libraries both compile, link and pass the JNI
  regression test. The debug check omits GCC 14's optional
  `-ftrivial-auto-var-init=pattern` flag, which configure does not enable for
  GCC 11.
* Release and fastdebug HotSpot/native-test builds pass; the release JDK
  image and all four CDS archives rebuild successfully. The AArch64
  cross-release HotSpot build also passes after the include-order fixes.
* Actual Zero-configured flags reproduce the old `UseAVX`/`supports_*` errors;
  the fixed production source compiles. Its capabilities function emits
  `xor eax,eax; ret`, returning the serial value. This is a Zero source-object
  compilation check, not a full Zero JDK build or runtime test.
* `TestIncludesAreSorted` and `StringZillaKernelsTest` both pass jtreg against
  fastdebug, with no tests skipped. A separate full source-order scan passes.
* All eight default-on/opt-out public oracle modes and the default/on/off
  availability checks pass again in release and fastdebug; all 22 callers
  compile and execute at C1/C2 levels. The default remains true.
* Vendor verification still reports 28 unmodified upstream files.
