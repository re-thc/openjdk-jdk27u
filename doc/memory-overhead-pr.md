Reduce JVM native allocation and retained-memory overhead

Reclaim dead nmethods one collection earlier for Serial/Parallel/G1, remove
obsolete ParkEvent padding while preserving immortal recycling and the fork's
allocation tag, and repair temporary NIO buffer replacement/carrier access.
Also bound C2 interface-set scratch lifetime and fix a second word-to-byte
multiplication in C-heap metadata arrays used by AOT training snapshots.

Five integrated upstream donors retain their authorship and legal headers;
source provenance and build/test instructions are in
[the integration notes](memory-overhead.md). The observer is separate.

Historical matched Linux x64 release results show 49,152 code-heap used bytes
reusable one GC earlier, 256 fewer NMT requested bytes per ParkEvent, and zero
retained fixture allocations after the tested NIO replacements versus 2,224,128
baseline bytes. These are bounded used-capacity/requested-allocation results,
not RSS/PSS or uncommit claims. The metadata-array correction removes an exact
source-level factor-of-eight over-allocation on LP64 for that allocation only;
the C2 scratch benefit has no local quantified result.

The Linux x64 release integration builds and passes **13 focused jtreg IDs,
zero failures/errors/skips**: four collector unloading cases, G1 concurrent-mark
unloading, two C2 tests, three NIO tests and two sleep/join tests, plus G1 AOT
record/create/replay with training-data verification. The source is
`770f5cd0ef89bceae11a5f66c014815bfa3b4b73`; subsequent changes repair only
the two new native tests and update documentation. Production code is unchanged.
The C2 regression requires regular level 4 compilation; the new carrier test
executes both platform and virtual modes with exact content/checksum checks.

The focused Array and ParkEvent native tests also pass, one executed case each,
with zero skips or failures. Array verifies actual NMT requested sizes for twelve
type/length combinations. Its separately compiled baseline-header control fails
exactly those twelve size assertions while tag, initialization and access checks
pass. GoogleTest/GoogleMock v1.14.0 came from the repository's documented pinned
source workflow; no system installation was needed. Header reads restore ASan
poisoning before assertions. ASan-instrumented test compilation passes; no
ASan-enabled JVM image is available for runtime verification. Historical
memory results remain tied to their original images. Source review confirms
upstream ancestry and no path overlap with the 15 open fork PRs, including PR44.
[Current validation](memory-overhead-validation.md) records image identities,
commands and limits.

Performance qualification remains open. Noisy unchanged-code controls establish
no no-regression bound; some slower estimates and worse pause samples remain
unresolved. Material risks include pin/unpin and cache-line costs, code coldness/
recompilation behavior, compiler scratch lifetime and AOT snapshot correctness.
No startup, RSS/PSS, representative throughput or pause-tail gain is claimed.
The larger G1 redesign, bespoke tuning, Shenandoah and HTTP/2 are excluded.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
