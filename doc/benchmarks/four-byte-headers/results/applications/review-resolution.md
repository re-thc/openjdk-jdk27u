# PR #8 review resolution

The attached `PR8_REVIEW.md` was checked against `bd500907d778`. Its findings
are review evidence; changes below follow the user's request to fix confirmed
issues. This record distinguishes observed defects from proposed race paths
whose reachability was not established.

| Finding | Resolution |
| --- | --- |
| M1: Shenandoah legacy heap limit | Restore `FullGCForwarding::initialize_flags(MaxHeapSize)` at its original initialization point. A native test verifies that an oversized eight-byte heap disables compact headers. Four-byte mode retains its separate encoding. |
| M2: young compaction point | Reset the destination point before comparing it with the source address, matching the old-generation path. Add generational Shenandoah full-GC coverage to the region/hash test. |
| M3: failed evacuation CAS | Compare publication against the snapshot used for allocation and hash initialization. A non-forwarding header change discards the allocation and retries the complete copy; self-forwarding retries with the updated mark. Native tests force stale hash/age snapshots and competing forwardees. |
| Minor 1: concurrent-copy hash state | The Shenandoah snapshot/publication change covers intervening hash changes without publishing an undersized copy. The claimed ZGC mutator race is unproven: load barriers and stack watermarks relocate before mutator access. `initialize_hash_if_necessary(oop)` reads the destination's copied mark, not a second source mark. Document that ZGC invariant; retain relocation/hash stress coverage. |
| Minor 2: forwarding bits decoded as klass | Guard the x64/AArch64 monitor lookup and C2 hash intrinsic before class/hash dispatch. Monitor-table C++ lookup uses the same sampled mark and rejects real forwardees. `get_hash` asserts its resolved-header precondition before class decoding. Preserve self-forwarded headers, which retain valid metadata; native tests cover both forwarded rejection and stored-zero/self-forwarded lookup. No normal barrier path permitting a mutator to consume a real forwardee was identified. |
| Minor 3: G1 survivor accounting | Count the expanded allocation size, consistent with its age table and allocation accounting. |
| Minor 4: G1 alignment assertion | Subtract one object-alignment unit, rather than one heap word. The new WhiteBox boundary test verifies hash/payload preservation and actual growth at both eight- and sixteen-byte alignment. It reproduces the allocator assertion on the previous debug image at sixteen-byte alignment. |
| Minor 5: monitor double read | Pass one sampled mark through hash extraction and the zero-hash presence check. |
| Minor 6: expansion instrumentation | Remove unused counters and repeated debug-only size calculations; compute base size and hash offset once. |
| Minor 7: mirror assertion | Restore the `java_lang_Class::as_Klass` instance assertion. Archive and GC tests validate it. |
| Minor 8: shipped archives | Use `-Xint` for four-byte image and jlink dumps, enabling deterministic dump-only hash inputs; remove the extra experimental unlock. The old-layout dump options remain as before. |
| Minor 9: forwarding tags | Use the captured source hash state consistently for non-atomic and atomic forwarding. Document that full forwarding overwrites the source array length and that sizing reads the copy. |
| Minor 10: preserved marks | Assert that hash control is restored from a relocated object's header, never a forwarding pointer. Make the synthetic native test model copied destination headers. |
| Minor 11: JVMTI module filter | Retain the minimal baseline test correction: layer enumeration excludes dynamic named modules with no layer. The original failed on both stock-eight and fork-four; the corrected test passed both. The unrelated proxy expansion was removed in `bd500907d778`. |
| Minor 12: class metadata size | Retain the required hash-offset field. It has a metadata/padding cost; object-heap savings do not imply equal process or metadata savings. |

Other review nits are addressed: redundant hash-control masks, introduced
whitespace, unused mirror temporaries/assertions, obsolete header unlock flags,
the duplicate test unlock, finite no-fallback forwarding statistics, consistent
Parallel collector closure names, winning-copy sizes in ZGC relocation
statistics, and the correct klass shift in x64 diagnostic output. Comments
document C2 allocation-store ordering, the synthetic klass-load offset and the
SA FastHash cross-reference. Experimental unlocks needed for `hashCode` and
Shenandoah tuning options remain.

The two rejected findings remain unchanged in behavior. Clone destinations are
base-sized and need `init_mark`, not an expanded source hash state. Compact
headers force the monitor table on, so Serial marking preserves valid class
and hash metadata in locked/inflated marks. Comments record both invariants.

Validation of these runtime changes is pending the new builds, local tests and
CI. Earlier benchmark tables describe their pinned `9b75f196c2a` image, not
this review revision; fresh application checks must be recorded separately.
