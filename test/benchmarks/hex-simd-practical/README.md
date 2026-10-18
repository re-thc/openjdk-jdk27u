# Complete-call HexFormat A/B comparison

Product source: `8568d8fca5ea4752e7673934690301ac526044cc`.
Baseline source: `89885a6288e7aaabd01678a704a586272c0f96e3`.
This source-only package stays in Git history outside the product diff. It
contains no raw results or host data, and does not run in normal builds/CI.

Use native Linux x64/AVX2 release images, the same installed toolchain and
Serial/G1/ZGC profile, and a quiet host. Compile the harness once, then use the
same class files, corpus and relevant flags in every state:

```sh
"$CANDIDATE/bin/javac" -J-Xmx512m -J-XX:ActiveProcessorCount=2 \
  -d "$CLASSES" PracticalHex.java
python3 -B compare.py --baseline "$BASELINE" --candidate "$CANDIDATE" \
  --classes "$CLASSES" --output "$FRESH_RESULTS" \
  --candidate-revision 8568d8fca5ea4752e7673934690301ac526044cc \
  --rounds 6 --gc G1 --cold
python3 -B summarize.py "$FRESH_RESULTS"
```

`--cases` selects a fixed comma-separated case list; choose it before measuring.
`--gc` supports Serial/G1/Z, and `--rounds 3` uses a position-balanced Latin
cycle; six rounds include every permutation of baseline/enabled/disabled.
Baseline and disabled use the runtime opt-out. The launcher uses the first two
available CPUs, two active processors, a fixed 512 MiB heap and compact strings.
It clears inherited Java-option/preload environment variables. It never retries
or discards an observation, and has no numerical acceptance/precision gate.

Each process rotates case order equally in all three states. Each case has
400 ms warmup and five 80 ms samples, including allocation, public API dispatch,
JNI transitions and region copies. A volatile result escapes each call. The
seeded corpus rotates sixteen inputs. Allocation is Java thread allocation,
not total native RSS. Fractional bytes/call can include amortized counter costs.

Cold calls use fresh JVMs, internal call timing and a blocking process wait for
wall timing. Library logging distinguishes lazy loading. The fixed session is
128 pairs of 64 KiB encode/decode, including first use. An invalid first pair
must keep the library unloaded. Cold setup is outside the public-call interval
and inside process wall time. The first eligible call can be slower because it
loads the library; report that cost rather than hiding it in warmup.

Size suffixes are binary bytes. `mixed:65536` contains 100 small 32-byte pairs
and one 64 KiB pair. `sha256:65536` hashes 64 KiB and formats the 32-byte digest.
The offset encoder converts `[7, size-7)`, so its converted length is size-14.
Decorated, CharSequence, Appendable, upper-case, ranges, early/late invalid and
UTF16-invalid cases exercise relevant fallbacks. Ordinary jtreg correctness is
required independently of timing.

The JSON plan binds both images, compiled classes, harness and driver hashes.
Every argv, stdout/stderr, return code, process duration and raw observation is
retained. `summary.json` reports medians of per-process sample medians, paired
speedup medians, every ratio, direction count and min/max spread. Interpret
baseline, disabled and enabled together. A fallback which does not consult
native availability is also a negative control; flag-independent timing
variation must not be labelled native-kernel cost.

Prior practical work also retained explicit same-VM patched controls,
encode-only crossover comparisons and diagnostic test-only cutoffs of one byte.
Those tests located encode crossover between 512 and 1,024 bytes and decode
near 64-128 bytes, with clear losses for tiny JNI calls. Production retains
1,024/128 byte cutoffs. The renamed reference and old narrow-gate protocol are
not used here. Historical failed protocol results remain historical failures.
No ARM/Windows performance or default-on qualification follows from x64 data.
