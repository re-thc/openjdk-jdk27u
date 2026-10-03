# Library-backed shortest public floating-point strings in this fork

This is an intentional fork policy for `Double.toString(double)` and
`Float.toString(float)`. Qualified finite nonzero values use the maintained
Dragonbox scientific text API directly, with nearest-even parsing and even
selection among equal-distance decimal candidates. It minimizes significant
digits; it does not promise the smallest total number of characters.
Examples include `5E-324` for Double.MIN_VALUE, `1E-45` for Float.MIN_VALUE, and
`1.234E0` instead of `1.234`. These are intentional text changes. The original
Java canonical decimal-selection/notation contract is not preserved on this
qualified fork path. Parsed numeric bits, including subnormals, are preserved.

Only the two public `toString` origins select this library. StringBuilder append,
Formatter, `FormattedFPDecimal`, the preallocated `putDecimal` API, UTF16 writing,
and parsing retain their upstream implementations. Exact integer fast cases,
zero (`0.0`/`-0.0`), NaN (`NaN`) and infinity (`Infinity`/`-Infinity`) remain upstream.
These stock fallbacks may contain extra notation or significant digits. The
native helper emits at most 24/15 bytes without a NUL terminator. Existing Java
String construction owns allocation and copies the bounded bytes.

C2 calls the native library as a non-safepoint VM leaf, with destination capacity
proven by the compiler; otherwise it declines the intrinsic. C1 and interpreter
use a normal native entry that transitions into the VM before resolving the
array, checks its capacity, and protects the raw address with NoSafepointVerifier.
No Java array address is retained. Native code does not allocate or call the VM.
`-XX:-UseDragonboxFormatting` keeps the original text policy. Runtime availability
is currently qualified only for Linux x86_64; ARM64 is intended but unmeasured
and stays upstream until qualified. No new per-ISA arithmetic is implemented.

Run `bash make/devkit/fetchDragonbox.sh [CACHE]` to fetch the four exact upstream
files (three compilation files plus LICENSE-Boost). The cache is external to Git.
Configure with `--with-dragonbox=CACHE`. The default configure does not download
or enable a dependency; configure verifies every checksum when enabled. The pin
is beeeef91cf6fef89a4d4ba5e95d47ca64ccb3a44; changing it requires updating the
manifest, reviewing file notices and upstream changes, then rerunning correctness,
sanitizer, cold/warm, integer-subset and compiler-profile performance checks.
The selected upstream license is Boost Software License 1.0, as stated in each
compiled file, with notices in java.base/legal/dragonbox.md. Source and ISA
implementation remain upstream-owned; this fork contains only build and VM glue.

Baseline tests asserting the original canonical strings require interpretation
under this explicitly approved fork policy; they are not numeric round-trip
or bounds tests. Run the focused DragonboxRoundTrip test in addition to existing
parsing, append, formatting, compilation, GC and tooling checks. Raw library
kernel timings are not public API gains. No measured regression is accepted.
