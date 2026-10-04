# Rust regex is enabled by default

This fork includes the Rust adapter by default on GNU Linux and macOS
x86_64/AArch64. `UseRustRegex` defaults to true when the adapter is included,
and `UseRustRegexIntrinsics` remains true. Applications require no enable flag.
The existing eligibility, reuse and positive-result gates remain unchanged.

Users can opt out at runtime with `-XX:-UseRustRegex`, or select the JNI
fallback with `-XX:-UseRustRegexIntrinsics`. Builders can omit the adapter
and Rust toolchain requirement with `--disable-rust-regex`. Unsupported targets
omit it automatically; explicit enable requests there produce a configure error.
A supported default build fails with guidance when Rust is missing, rather
than silently producing a fork without acceleration. Builds which omit the
adapter have `UseRustRegex=false` by default and issue no availability warning
unless the user explicitly requests it.

The Linux/macOS CI workflows install the stable Rust toolchain and its matching
standard-library copyright notices before configure. Windows, other CPU
architectures and Linux musl targets retain their existing build requirements.

## Validation

- Full x86_64 and AArch64 configure runs without a Rust enable option select
  `RUST_REGEX_ENABLED=true`.
- A full configure run with `--disable-rust-regex` succeeds with Cargo and
  rustc absent from PATH. The supported default configuration in the same
  environment rejects missing Rust and identifies the build opt-out.
- An isolated harness invoking the actual configure macro checks eight default
  and opt-out combinations and three unsupported explicit-enable requests.
  GNU Linux and macOS x86_64/AArch64 default on; Windows, riscv64 and musl
  default off. These are configure-decision checks, not native platform builds.
- The runtime flag initializer compiles with `INCLUDE_RUST_REGEX=0` and
  initializes `UseRustRegex` to zero.
- The updated workflow/action YAML parses and the installer passes Bash syntax
  validation. Its rustup options are supported by the installed rustup.
- The GNU Linux x86_64 packaged JDK and AArch64 release HotSpot build complete
  with the adapter selected by default. All four x86 CDS archives are generated.
- `PrintFlagsFinal` reports `UseRustRegex=true` and
  `UseRustRegexIntrinsics=true` with default origins. Explicit filtering disable
  reports false; disabling only intrinsics retains `UseRustRegex=true`.
- The updated x86 startup driver passes all ten configurations: both code-cache
  sizes with default settings, explicit disable/enable and JNI selection, plus
  C1 and C2 searches. Each search checks the effective VM flag against actual
  native DFA compilation. Separate unflagged C1/C2 runs confirm the intrinsic
  in compiler logs after 12,000 searches.
- AArch64 QEMU execution passes the same eight interpreter configurations and
  C1/C2 searches. Default settings compile a native DFA; explicit disable does
  not. Compiler logs confirm `RustRegex::mayMatch0` is intrinsic on both tiers.
- All eight differential modes pass as separate JVMs, each with 5,248 bound/state
  comparisons plus edge cases, concurrent use/GC and serialization. These include
  an unflagged default run, explicit off/on, JNI, interpreter, C1, C2 and
  uncompressed Strings.
- The broad regex, Scanner, String and PathMatcher jtreg run passes 101 entries
  and all 5,980 framework cases, with two platform skips. One resource-limited
  String concurrency entry passes on rerun: **102 distinct jtreg entries pass**.

### Cloud process-quota limitation

The container accumulated orphaned build logging processes and exhausted its
process quota. Builds complete with sequential jobs, a helper which reaps new
logging children, and bounded tool JVMs. Test JVMs use explicit CPU/collector
limits; the jtreg harness runs in interpreter mode, while the broad test run
uses normal mixed mode and the differential program's explicit C1/C2 modes
remain compiled.

Four selected entries still exceed that quota inside jtreg:
`RustRegexTest`, `IndexOf#id0`, `IntrinsicAvailableTest` and
`IntrinsicDisabledTest`. Their failures are native thread creation errors
(`EAGAIN`), not assertion failures. The unchanged test programs pass outside
the extra harness JVM: all eight regex actions, the IndexOf driver, all five
intrinsic-availability modes and all three intrinsic-disable modes. The latter
two use previously compiled, unchanged test classes against the new packaged
JDK. The updated Rust startup driver is also executed directly as described above.
These standalone passes do not relabel the failed jtreg entries as jtreg passes.

Exact commands, summaries and compiler evidence are recorded in
[rust-regex-default-validation.txt](rust-regex-default-validation.txt).
No semantic failures were observed in the executed test programs. Native macOS
builds, physical ARM performance and the full JDK suite remain untested. ARM
emulation uses the cross-built VM, updated Java modules and stock ARM launcher
and native libraries, with CDS/SVE disabled.

The existing benchmark tables compare explicit disabled/enabled states. The
measured enabled state now corresponds to the fork's default; the Rust adapter
and matching algorithm did not change in this defaults revision.
