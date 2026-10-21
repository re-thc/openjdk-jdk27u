# Approved retained-image follow-up

Product: `2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1`; comparison predecessor:
`456afea88231bc9ebf17dfa48811db90a8bae8b8`. Parser:
`afee2c32e1b8070a20214e8728079d6759663c8f`; every full parser source is hashed
in `cloud-parser-probe/full-parser-sources.json`.

The default-off `pr43_full_parser_sve` input selects only two jobs. There are
no JDK builds, product modifications, retries, replacement samples or Apple runs.
Full parsing uses retained matched release images artifact 12347874804 from
run 39602216233, verified by artifact digest plus executed java/libjvm hashes.
SVE uses fastdebug artifact 12194059473 and JTReg artifact 12192388544 from
run 39266688701; the fastdebug source is ordinary CI merge
`f09e3bcdd4ab29af3270136ca02bc12674b337e1`, with its tree and parents bound.

Full-parser timing includes UTF-8 validation, structural indexing, DOM/tape
construction and immediate traversal of decoded results. The three corpora are
unchanged from the indexing comparison. Independent expected-value checks and
malformed JSON/UTF-8 controls precede timing. Two diagnostic JVMs are limited to
180 seconds each; 24 timing JVMs form 12 alternating AB/BA adjacent pairs. Each
JVM gets 15 seconds warmup and 30 seconds measurement across three workloads.
A 30-minute comparison step fits within a 45-minute job. SVE has a separate
15-minute job, with a 10-minute test/audit step; it requires actual successful
IR matching for both SVE exclusion rules, effective UseSVE=1, and retained
Matching-phase nodes. A missing host feature or skipped assertion is a failure.

Every timing observation, process failure, compilation event and GC log is
retained. No universal-win threshold or A/A veto applies. Full results and a
conservative stability subset are separate. That subset audits all compiled
org.simdjson methods, including the harness; installation/runtime events inside
measurement and prior invalidation without a replacement are disclosed, never
replaced with extra samples. GC remains part of end-to-end measured work.

The compare.py runtime reader now reads runtime events nested in `<tty>` while
excluding compiler-task trap descriptions. The original controller remains in
commit 9368efa7513ffc337563eaaa737cdfc069f90731 and the original run artifact.
The corrected historical offline audit found 96 warmup events and no overlapping
measurement events across all 72 windows; its original source data is unchanged.
Reader tests cover runtime nesting, invalidations, replacements, boundaries,
and multiple parser methods. Historical fixture auditing is optional in CI;
synthetic reader tests always execute.
