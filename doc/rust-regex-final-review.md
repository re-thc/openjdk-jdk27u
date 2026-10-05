# Final Rust regex review

This pass on 2026-10-05 reviewed the default-enabled integration, its fallback
gates, pattern lifetime, native compiler, startup tests and performance controls.
It found four avoidable costs and one test configuration gap:

- Short and mutable searches queried the Rust enable state before testing their
  input eligibility. Moving the constant size/type/root checks first leaves the
  backend uninitialized for those searches.
- UTF-16 and non-default-flag searches learned misses and attempted to compile
  filters which they could never use. Only default-flag Latin-1 misses now learn
  the reuse gate. A UTF-16 search following eight Latin-1 misses also defers
  compilation. The already-compiled warm path retains its single backing-array
  lookup.
- Native compilation parsed the same expression three times and built a separate
  regex engine solely to check empty matches. It now parses once, reads minimum
  match length from that representation, and reuses it for prefix extraction and
  the Thompson NFA. Captures are unnecessary in this rejection filter. The NFA
  now has an explicit 2 MiB limit before DFA determinization, in addition to the
  existing 2 MiB DFA and 4 MiB determinization workspace limits.
- C1 could not inline the cached-filter lookup because it contained the cold
  compilation path. The lookup and miss gate are now small methods, with native
  preparation and input qualification in separate cold helpers. The volatile
  publication check and synchronized compilation still protect shared handles.
- Startup and differential tests now account for `-XX:-CompactStrings`: native
  support can be enabled while every String is stored as UTF-16. That setting
  must avoid filter compilation.

The feature remains enabled by default. Java still evaluates every candidate;
the changes do not add native positive matching or broaden the syntax gate.
The live release check still returns regex 1.13.1. C1 runtime logs confirm
that the 29-byte cached lookup and 22-byte miss gate inline, while
`RustRegex::mayMatch0` remains an intrinsic.

## Native compilation measurements

Old and reviewed optimized adapters were linked into separate DSOs in one
CPU-pinned process on the Xeon Platinum 8573C cloud host. Each expression used
100 warmup compilations and 12 alternating pairs of 500 compile/free calls.
The baseline adapter is unchanged between the default-enabled build
`b8aeb8e96e5` and CI repair `0a33196a2f2`. Values are medians in microseconds
per compile/free call. This measures native filter construction shared by all
execution tiers; it does not measure `Pattern.compile()` or an entire search.

| Expression | Before µs | After µs | Speedup |
| --- | ---: | ---: | ---: |
| `error[0-9]+` | 84.43 | 27.34 | 3.09× |
| `(?:error\|warn)[0-9]+` | 222.18 | 74.40 | 2.99× |
| `[0-9]{3}-[0-9]{2}-[0-9]{4}` | 400.92 | 100.63 | 3.98× |
| `a.*b` | 41.45 | 13.75 | 3.01× |

[Raw native pairs](rust-regex-final-native-results.csv) and the
[benchmark source](rust-regex-final-native.cpp) are checked in. The DSOs export
only the three C ABI entry points, preventing symbol interposition between
revisions.

The same process repeated 12 alternating pairs of 100,000 warm native searches.
At 4,096 bytes, the medians were 167.67 ns before and 164.52 ns after; at
32,768 bytes, 1,405.33 ns before and 1,309.22 ns after. The search body is
unchanged, and these small differences are not claimed as a general speedup.

## Warm Java measurements

JMH 1.37 compared the default-enabled baseline packaged JDK with the reviewed
exploded JDK. CDS was disabled in both. The first exploratory round used three
fresh JVMs per revision/tier, alternating revision order, with 2×500 ms warmup
and 3×500 ms measurements for each of eight parameter combinations. It covered
64/4,096-character inputs and negative, positive, UTF-16 and non-default-flag
searches in interpreter, C1 and C2 modes.

The container's exhausted process quota prevented standard JMH forks: the second
simultaneous JVM failed native thread creation (`EAGAIN`). The recorded runs
therefore use `-f 0`, with all VM arguments on the actual command line. Subsequent
confirmations used one parameter combination per fresh JVM, three alternating
before/after pairs, CPU affinity, 3×1 s warmup and 5×1 s measurements. This avoids
profile sharing between parameter combinations while fitting the process quota.

Several exploratory C1 controls appeared slower. Longer isolated repeats and
another CPU did not reproduce a consistent slowdown. Timing variation also
prevents claiming a general warm-path improvement from the smaller C1 helpers.
Their inlining is confirmed in runtime logs. Native construction improved in
all 12 measured pairs for every expression; the 3–4× construction result is the
strong performance finding from this pass.

Final C1 confirmation results are medians of three process means in ns/op;
parentheses show their minimum–maximum. The opposite short-miss estimates on
CPUs 0 and 4 illustrate the timing uncertainty. These are controls, not claimed
speedups.

| CPU | Characters | Scenario | Before ns/op | After ns/op | After / before |
| ---: | ---: | --- | ---: | ---: | ---: |
| 0 | 64 | miss | 138.91 (121.95–222.02) | 191.53 (145.46–235.65) | 1.379 |
| 0 | 64 | hit | 95.77 (94.26–98.34) | 100.39 (96.43–127.72) | 1.048 |
| 0 | 4,096 | miss | 392.35 (327.03–441.88) | 308.07 (235.86–321.04) | 0.785 |
| 0 | 4,096 | hit | 102.48 (100.98–123.83) | 159.12 (99.82–180.89) | 1.553 |
| 4 | 64 | miss | 181.21 (122.74–217.99) | 121.99 (115.85–163.46) | 0.673 |
| 4 | 4,096 | hit | 119.47 (107.52–140.72) | 119.20 (105.65–153.00) | 0.998 |

[Raw Java samples](rust-regex-final-java-results.json) preserve all rounds,
including exploratory C1 slowdowns, interim measurements before outlining and
the final confirmations. [Exact commands](rust-regex-final-java-commands.txt)
record the runtime, flags and timing options. The original forked long-miss
measurements remain in the earlier reports, with their original source scope.

## Final validation

- The Linux x86_64 release JDK rebuild passed after the final Java helper change.
- Five Rust unit tests passed in native debug/release builds and in an optimized
  AArch64 binary under QEMU. Clippy with warnings denied and rustfmt passed.
  The new cases compare the parsed NFA against the reference bytes engine over
  2,816 seeded input/fixture combinations and test NFA limits/empty matches.
- All eight `RustRegexTest` configurations passed again after outlining: default,
  disabled, explicitly enabled, JNI, interpreter, C1, C2 and disabled compact
  Strings. Each retains 5,248 bound/state comparisons, plus input/flag gates,
  edge cases, concurrent sharing/GC and serialization.
- The new initialization driver passed its three child configurations. All
  twenty startup/search configurations passed as individual JVMs, covering
  64/256 MiB caches, default/off/on/JNI, C1/C2, and compact/uncompressed Strings.
  The startup driver itself exceeded the container thread quota while creating
  output-reader threads; its direct child runs are not called jtreg passes.
- AArch64 release HotSpot rebuilt and all ten default/off/on/JNI/cache/compiler
  smoke configurations passed under QEMU. Native compilation and C1/C2
  intrinsic selection are checked in their output. This uses the cross-built
  libjvm with the final Java base classes patched over the ARM launcher/native
  libraries, with CDS and SVE disabled. It is functional emulation coverage.
- The final focused regex jtreg attempt failed in the JDK version probe with
  native thread creation `EAGAIN`, before any test ran. A restricted, networkless
  Debian test container with read-only source/JDK mounts also could not start:
  Docker/runc failed to obtain its child PID, before executing Java. Neither
  attempt is reported as a jtreg pass. Earlier successful jtreg coverage retains
  its original source scope; CI must validate the new tests on a healthy runner.

The [validation transcript](rust-regex-final-validation.txt) records commands,
build/test summaries, C1 inlining and ARM intrinsic evidence, and the failed
harness attempts.

## Scope of remaining performance work

Reused, long, negative Latin-1 searches remain the accelerated workload. UTF-16,
positive matching, anchored `matches`/`lookingAt`, unsupported syntax/flags,
one-shot Patterns and independent XML regex engines still use Java. The new
gates remove wasted preparation; they do not accelerate those Java scans.
Literal-only expressions also retain Java's Boyer-Moore path; comparing a
literal-specific native filter with that path is another performance opportunity.
There is still a cost for the first native candidate when a negative workload
becomes positive, after which the adaptive gate pauses probing. Extending these
cases needs separate semantic and performance evidence. ARM timing requires
physical hardware; QEMU is used only for functional checks.
