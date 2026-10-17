# Production decision: local Linux x64-v3 go, opt-in only

The actual packaged entry point passes all six predefined gates. Keep the bounded
native implementation opt-in. No module patch or external library path was used
on production warmed/first-call routes. Linux AArch64, macOS arm64 and Windows
x64 remain unbuilt and untested; their instructions are in PLATFORM_VALIDATION.md.
Do not infer a default cross-platform rollout from this host.

The original prototype commit fdb9621ae74 and its different protocol/results are
preserved. The normal baseline image was freshly built from that commit: its
production source is byte-identical to supplied 89885a6288e7. Production uses the
same installed GCC16.2, Rust1.99/Cargo1.99, mold and native CPU profile. Source,
release metadata and image/library hashes are in evidence/environment.txt.
Pinned speedate0.18.0/upstream6a323c655ac8ec055b895b19c3c509ea022d4ea8 is unchanged.

## Correctness and lifetime

All 14 routes (baseline/cached/production/runtime-disabled/missing-library/native-
miss/missing-symbol, each with both CompactStrings modes) passed 100308 exact
comparisons: 1404312 total. Full output digest is
`a0c9818f610a52c4a5429fe59d286443efec207525cd6f1a64876f2bdd45ed8a`.
Native routes proved 49680 canonical library hits each. Errors compare class,
message, parsed input and error index. Both pair-camouflage ASCII and Unicode
cases pass coarse eligibility but are rejected by mandatory native grammar.

Six Serial/G1/ZGC × CompactStrings stress runs passed 90000 comparisons each,
with fresh Strings, pressure, real collections and -Xcheck:jni. Bootstrap parsing
before VM.isBooted falls back, then postboot native loading succeeds once.
Concurrent cold init passed 8000 calls. Forced actual per-library-lock contention
with a separate JNI_OnLoad callback passed callback fallback and subsequent
native coverage. This is a defensive contention regression, not evidence of a
global loader lock or a reachable production JNI_OnLoad cycle. Loading occurs
outside class initialization; concurrent calls never wait for the holder state.
The normal JDK JUnit test and both Rust unit tests pass. Independent date and
GC/boundary reviews passed after fixes. See evidence/qualification.txt and jtreg.txt.

A configure-disabled normal gensrc plus javac proof produces exactly the old
Instant.parse formatter bytecode (evidence/disabled-parse-bytecode.txt). This is
not a separate full disabled-JDK build. Enabled normal make images/run-test/CDS
builds passed. libinstant.so is 420048 bytes, exposes only the JNI symbol, has
non-executable GNU_STACK and no Rust runtime-library dependency. Cargo-managed
MIT/BSD dependency and compiler std notices are packaged in legal/java.base.

## Fixed integrated comparison

All 72 JVMs  / 360 rows retained; one predefined run, three serial forks, 400000
warmup calls, five 200000-call rounds, first round excluded. G1/256MiB/two active
processors/-Xbatch. Result escapes through a volatile sink. Timing includes
actual public call, eligibility, JNI, String copying, speedate validation and
epoch conversion, Java decoding and construction. All checksums agree.
Numbers are median ns/op. Fork ranges and Java allocation are in summary.csv;
all rows are in measurements.csv. Native allocation is not measured by the
Java ThreadMXBean; the ordinary path uses native stack values by source review.


CompactStrings=True:

| Corpus | Current | Cached Java | Native | Speedup/current | Current → native Java B/op |
|---|---:|---:|---:|---:|---:|
| happy | 368.8 | 366.5 | 104.1 | 3.54× | 1209.0 → 16.0 |
| mixed | 756.0 | 758.2 | 644.7 | 1.17× | 1513.0 → 922.0 |
| invalid | 1171.7 | 1139.8 | 1165.5 | 1.01× | 2066.7 → 2066.7 |

CompactStrings=False:

| Corpus | Current | Cached Java | Native | Speedup/current | Current → native Java B/op |
|---|---:|---:|---:|---:|---:|
| happy | 412.2 | 344.3 | 88.2 | 4.68× | 1209.0 → 16.0 |
| mixed | 739.6 | 715.2 | 623.0 | 1.19× | 1543.0 → 952.0 |
| invalid | 1254.8 | 1107.8 | 1260.8 | 1.00× | 2200.7 → 2200.7 |

Canonical gains against the cached Java control are 3.52×/3.91×. Mixed gains
against current JDK are 1.17×/1.19×. Invalid-only medians are 0.53% faster/0.48%
slower; fork ranges overlap and support only the predefined within 3% gate.
No claim of a meaningful invalid-only speedup is made.

The cached Java control allocates less but gives little canonical throughput
benefit in CompactStrings-on here, unlike the earlier prototype cohort. Preserve
that observation; it does not remove the independently measured native gain.
Runtime-disabled canonical medians are 411.1/438.6ns vs 368.8/412.2 baseline.
That route still executes eligibility/availability checks and has measurable
CPU overhead; configure-disabled builds eliminate the hook instead.

## Invalid-path cost trace

The prototype's fixed invalid corpus admitted 4/12 native attempts (nonleap
February29, April31, month00, day00) then paid the original exception path.
Its Java allocation was unchanged; retained HotSpot trace shows the complete
Java shape/digit scan inlined and native call recognized as native. This supports
extra guard/JNI/failed-validation CPU work, not extra Java allocation; it is not
a precise decomposition of the earlier 5.1% loss. The production guard removes
the duplicated digit scan and rejects independent month/day/time range failures,
reducing attempts to 2/12. Those two require real calendar validation by speedate.
No handwritten Gregorian parser was introduced. The frozen production run above
passes its invalid gate; this is a new protocol, not a rewrite of old evidence.

## First use and loader cost

Ten fresh JVMs per route; medians in milliseconds:

| Route | First public parse | Whole subprocess |
|---|---:|---:|
| baseline | 9.100 | 41.663 |
| cached | 11.521 | 109.420 |
| production | 0.661 | 40.480 |
| disabled | 9.005 | 41.076 |

Cold production parse includes lazy loading and binding. Its full process wall
range overlaps baseline; do not claim a JVM-startup improvement. Original
separate holder-load measurements (loads.csv) include cold reflection setup and
have 4.279ms median; that scaffold dominates and cannot be called pure loader cost.
A separately identified direct-loader diagnostic was therefore added after the
fixed run, without repeating any acceptance cohort. LibraryLoadProbe adds only a
bootstrap measurement class through patch-module; it directly invokes the same
BootLoader loader, then calls the public parser. Its median load is
0.344ms and subsequent first parse 0.170ms.
The diagnostic's patched process startup is not compared with production startup.
All original observations remain in first.csv/loads.csv/direct-loads.csv.
Reproduce the diagnostic with run.py load-diagnostic and the same arguments.

## Routine corrections and limits

An initial repeated scratch-image copy could not overwrite read-only legal
files (preserved scratch-copy-readonly-failure.txt); setup now deletes/recreates
only its scratch tree. An initial Cargo version probe omitted tool activation,
failed on read-only default rustup home, and was corrected without installation
(environment.txt). An absolute baseline configure command initially ran from
the wrong working directory; generated files were moved aside and the known-
clean source Makefile restored before configuring inside the isolated worktree.
No automatic approval review denied an action. No remaining local blocker.
Only this native Linux host is qualified. Crashes/aborts/VM-fatal errors are not
recoverable fallback events; ordinary parse misses, Rust unwinds, load/link
failures preserve the original Java path. No CI, publication, PR or merge.
