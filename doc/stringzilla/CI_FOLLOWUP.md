# CI compiler update and native-test compatibility

## GCC 14 for Linux CI

All Linux GCC workflow inputs now select GCC 14. This updates the x64
release/debug, Zero, minimal, optimized, no-PCH, static JDK, static-library,
documentation and cross-compilation jobs. Linux AArch64 already selected GCC 14.
The runners already use Ubuntu 24.04; a runner OS upgrade is unnecessary.
Ubuntu 24.04 package indexes supply both native GCC/G++ 14 and the required
ARM32, s390x, PowerPC64LE and RISC-V cross toolchains.

The release, fastdebug and AArch64 local builds documented in
[the bounded-work review](BOUNDED_REVIEW.md) already use GCC 14. The newer
workflow keeps the existing platform/build/test matrix. The CPUID compatibility
fix below remains useful for users building the fork with older supported
compilers.

## Earlier GCC 10 failure

The GitHub Actions run for PR #4 at
`6e8756207e3afb50145510d8c60ca2c16b16ab0b`
([run 37324920426](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37324920426))
completed with 66 successful jobs, five failed jobs, one cancelled job and three
skipped jobs. This is the observed result before this follow-up, not an all-green
CI claim.

Both Linux x64 release/debug builds failed while compiling
`libStringZillaKernelsTest.c`: GCC 10 rejects
`__builtin_cpu_supports("lzcnt")` with
`error: parameter to builtin not valid: lzcnt`.
The earlier GCC 11 compile checks did not catch this compatibility difference.

The test now checks LZCNT through `<cpuid.h>` using extended CPUID leaf
`0x80000001`, ECX bit 5. It retains the AVX2/BMI/BMI2 and AVX-512 checks before
executing those tables. The conditional include excludes non-x86 and MSVC
builds. This changes test dispatch only; the production VM capability checks
and StringZilla sources are unchanged by this fix.

Local verification used GCC 10.5.0, the compiler family configured by CI:

* The old CPU check reproduced the exact CI error.
* The fixed release and fastdebug native libraries compiled and linked with
  their jtreg warning flags and `-Werror`. The GCC-14-generated debug option
  `-ftrivial-auto-var-init=pattern` was omitted because the GCC 10 configuration
  does not generate that option.
* `StringZillaKernelsTest` passed through jtreg against both release and
  fastdebug VMs using those GCC 10 libraries. It verifies publication for all
  eight capability masks and runs each table executable on the host, including
  native work limits and UTF-16 alignment cases.
* The vendor verifier still passed for all 28 unmodified upstream files; the
  shared HotSpot include checker and `git diff --check` passed.

The three failed macOS/Windows test jobs had empty step lists, no corresponding
test-result artifacts, and inaccessible logs (`BlobNotFound`). The Windows ARM
cancelled job also had no steps or accessible logs. These results do not establish
a test failure or its cause. A new run of the updated PR must produce actual
results before declaring CI successful.

The [bounded-work review](BOUNDED_REVIEW.md) records the accompanying production
changes and their separate 159-test local validation and benchmark evidence.
