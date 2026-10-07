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

## Validation

Runtime fixes are at `d222c871c122`. Follow-up `d07555c47f45` adds the explicit
native-test include required without precompiled headers, sorts production
includes, and selects regular young regions for generational Shenandoah
coverage. The final follow-up strengthens payload checks and keeps the first
adjacent regular regions live; runtime statements remain unchanged.
New contributions use Teamoffy Pte. Ltd.; existing notices remain.

The rebuilt release and fastdebug images pass **102 jtreg executions**: 42
focused cases per flavor, ten instrumentation/jlink cases, six C2
arraycopy/vector cases with IR verification enabled, and two source checks.
Coverage includes Serial, G1, ZGC, Parallel and both Shenandoah modes. All
**4,206 enabled native executions** pass: 1,402 in each of four-byte,
eight-byte and legacy modes, with 15 upstream disabled cases per layout.
The new flags test compiles without precompiled headers. All **126 JCStress
configurations** pass, 42 each under Serial/G1/ZGC, without failed
configurations, soft errors or hard errors. The temporary local compiler
worker bound is restored; IR assertions remain enabled.

The new G1 boundary test reproduces the previous debug image's allocator
assertion at sixteen-byte alignment and passes on both rebuilt images at
eight- and sixteen-byte alignment. The strengthened generational Shenandoah
case also passes the prior image: additional coverage, not a defect reproduction.

Initial local attempts exhausted the container's native-thread limit during
compiler or native-test child JVM startup. One compiler JVM crashed after a
GC worker failed to start. These attempts remain in local logs; bounded reruns
pass. They are not counted as successful runs or attributed to an executing
collector regression. Serial JCStress was interrupted by an environment
restart; all three collector runs restarted and completed before timings.

The first review-fix CI run found the missing explicit include and source
ordering, both corrected in `d07555c4`. Two replacement workflows failed
before creating jobs with GitHub's annotation "Internal server error"; the
correlation IDs are recorded in [the manifest](manifest.json). The subsequent
[three-layout run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37656205271)
and [standard sanity run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37656180956)
validate the unchanged runtime at `6f028e4f146`. Their exact recorded status is
in [the CI snapshot](review-ci-snapshot.json); pending jobs are not counted as
passes. Any later test/evidence commit has its own PR checks.

[Per-case local results](review-test-results.csv), [image fingerprints and
measurement provenance](manifest.json), and [fresh application measurements](../applications.md)
accompany this review. Earlier image measurements are retained in Git history
and are not used to validate the runtime fixes.
