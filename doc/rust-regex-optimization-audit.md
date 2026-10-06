# Rust regex optimization audit

Audited against the live [regex 1.13.1 performance guide](https://github.com/rust-lang/regex/blob/1.13.1/src/lib.rs#L430-L548) on 2026-10-06 (Asia/Taipei). The guide describes workload choices, not a switch that makes every expression faster. The adapter uses regex-automata's meta engine so it can reuse captures, control mutable caches and account for native storage.

| Upstream recommendation | Integration |
| --- | --- |
| Ask only for the information needed | No user captures: `search_with`, returning match bounds. User captures: `search_captures_with`. Matcher must retain offsets/captures even though find/matches return a boolean. Short plans avoid the native boundary altogether. |
| Avoid unnecessary Unicode work | Latin-1 byte matching with `unicode(false)`, `utf8(false)` and `utf8_empty(false)`; default Java ASCII shorthand classes. The exact ASCII short plan can also answer Unicode Strings without encoding. Other Unicode operations use Java. |
| Use literal acceleration | Automatic literal extraction/prefilters and memchr/Aho-Corasick SIMD are enabled by the default `std`/`perf` Cargo features. Baseline CPU code remains portable; SIMD dispatch is at runtime. |
| Reuse compiled expressions and allocations | Patterns retain the selected engine. A bounded weak cache shares identical live engines. Short-only digit-tail workloads defer native construction entirely. Search caches are reused. |
| Avoid shared mutable-cache contention | Immutable engines are shared; the separate cache pool gives concurrent calls separately owned mutable state and a fast owner-thread path. Cache creation and growth remain budgeted. |

Cargo's default performance features include literal prefilters, aggressive inlining, lazy DFAs, one-pass captures, DFA and bounded-backtracker implementations, and cache pooling. Runtime engine selection is a separate decision: full DFA construction and the bounded backtracker are deliberately disabled. Thompson/PikeVM fallback remains available. Native release code uses `opt-level = 3`, `codegen-units = 1` and `panic = "unwind"`. Unwinding is required for the C ABI panic containment; `panic = "abort"` would terminate the JVM. `target-cpu=native` would break portable binaries and is not used.

## Option trials

Five isolated offline copies of the adapter tested the current configuration, ThinLTO, full DFAs with the upstream small-pattern limits, bounded backtracking, and a 128 KiB lazy-DFA cache instead of 32 KiB. No trial setting was applied to the production adapter. The same vendored dependencies and release profile were used throughout.

Linux x86_64, Xeon Platinum 8573C, one pinned CPU. Three reordered processes per variant; each case warms 4,096 calls, then measures three 100 ms search samples. Search figures are medians of nine samples. Construction figures are means of three 64-construction batches. The harness calls the C ABI through an opaque function pointer. These measure the native adapter, excluding Java/JNI/JIT costs, and do not establish complete Pattern-lifetime gains. Short samples and shared-host variation limit small differences.

| Native search case | Current ns | ThinLTO ns | Full DFA ns | Backtracker ns | 128 KiB cache ns |
| --- | ---: | ---: | ---: | ---: | ---: |
| Prefix miss, 4,096 bytes | 235.6 | 268.2 | 239.4 | 253.4 | 216.3 |
| Prefix and long digit tail | 14,816.6 | 15,721.3 | 14,537.1 | 15,378.8 | 14,251.7 |
| Named captures, early hit | 112.4 | 110.2 | 97.9 | 112.8 | 102.9 |
| SSN miss | 106.5 | 106.7 | 119.7 | 109.5 | 107.4 |
| SSN hit | 82.7 | 80.4 | 90.3 | 85.4 | 82.8 |
| Alternation captures | 312.8 | 288.3 | 324.5 | 314.7 | 291.6 |
| Email captures | 301.5 | 264.2 | 262.9 | 386.2 | 251.7 |
| Email miss | 92.1 | 94.0 | 91.6 | 112.9 | 99.7 |
| Nullable captures | 98.1 | 106.9 | 89.8 | 93.9 | 91.1 |
| Greedy alternation | 111.2 | 115.8 | 110.4 | 104.9 | 99.9 |
| Late capture | 833.3 | 907.9 | 954.8 | 861.5 | 882.9 |

ThinLTO improves some capture cases but slows prefix misses and late captures. Full DFA construction improves some searches while making SSN-miss construction about 3x more expensive (282 to 855 microseconds) and slowing that search. The backtracker slows the email cases and would also require accounting for its visited bitmap/stack before enabling it. A larger lazy cache has mixed search results and increases growth allowances. None provides a broad gain that justifies applying it to every Pattern in this sample.

The 32 KiB lazy cache, bounded NFA/one-pass construction, disabled full
DFA/backtracker, and 64 MiB aggregate accounting ceiling are retained.
The sample does not support a global change to these options.

## Reproduction

```sh
python3 make/scripts/benchmark-rust-regex-options.py --output build/rust-regex-option-audit
```

The script builds serially with `cargo build --frozen --release`, changes only temporary copies, pins benchmark children where supported, and writes raw JSONL records. [Recorded measurements](rust-regex-optimization-audit.jsonl) contain all 165 process/case records. The native adapter and release configuration used for these measurements are
unchanged by the Java short-plan and end-state changes. End-to-end costs are
measured in [the performance report](rust-regex-performance.md).
