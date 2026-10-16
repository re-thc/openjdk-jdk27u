Reduce JVM native allocation and retained-memory overhead

Reclaim dead nmethods one collection earlier for Serial/Parallel/G1, remove
obsolete ParkEvent padding while preserving immortal recycling and the fork's
allocation tag, and repair temporary NIO buffer replacement/carrier access.
Also bound C2 interface-set scratch lifetime and fix a second word-to-byte
multiplication in C-heap metadata arrays used by AOT training snapshots.

Five integrated upstream donors retain their authorship and legal headers;
source provenance and build/test instructions are in
[the integration notes](memory-overhead.md). The observer is separate.

Historical matched Linux x64 release results show49,152code-heap used bytes
reusable one GC earlier,256fewer NMT requested bytes per ParkEvent, and zero
retained fixture allocations after the tested NIO replacements versus2,224,128
baseline bytes. These are bounded used-capacity/requested-allocation results,
not RSS/PSS or uncommit claims. The metadata-array correction removes an exact
source-level factor-of-eight over-allocation on LP64 for that allocation only;
the C2scratch benefit has no local quantified result.

The original core passed18selected jtreg IDs. Separate NIO validation completed
a fresh default pair plus16cases, including four jtreg runs. This rebased combined
branch and the added Array/ParkEvent/C2/carrier regressions have not been built
or executed. Source review confirms current upstream ancestry, the full donor
changes and no path overlap with the15currently open fork PRs, including PR44.

Performance qualification remains open. Noisy unchanged-code controls establish
no no-regression bound; some slower estimates and worse pause samples remain
unresolved. Material risks include pin/unpin and cache-line costs, code coldness/
recompilation behavior, compiler scratch lifetime and AOT snapshot correctness.
No startup, RSS/PSS, representative throughput or pause-tail gain is claimed.
The larger G1 redesign, bespoke tuning, Shenandoah and HTTP/2 are excluded.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
