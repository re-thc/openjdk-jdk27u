# Original intrinsic source recovery

Source-only recovery for PR3 rows 24/26 and PR5 row 30. Publication to a separate checkpoint branch in re-thc/openjdk-jdk27u is authorized; no runtime or existing PR change is included.

## PR3

`pr3/DecimalResiduals.java` is the original standalone model and embedded correctness driver. It groups up to nine Integer or eighteen Long ASCII digits and delegates other cases to the existing public parser. Its eight-digit writer handles a byte[] destination only. The retained correctness output reports 300,036 checks. There is no decimal timing, production patch, UTF16 writer, or char[] writer in this handoff.

## PR5

`pr5/regex.original.patch` is the original Pattern overlay diff. `pr5/Pattern.normalized.patch` normalizes diff headers/paths, removing old timestamps and using the repository path. Both reconstruct the same retained candidate from exact f360 source. `RegexCorrectness.java` is the original digest driver; `PublicCallerProbe.java` is the exact historical timed harness, containing seven relevant regex cases among 41 total. Do not run the unrelated cases under PR5 authorization. The original reconstruction script is preserved as provenance and expects the producer's old directory layout.

The retained Pattern correctness digests match for 83,268 outcomes. Long reused String cases showed leads in the old screen, but small cases were noisy and Pattern construction allocated more, including 128 extra bytes per operation for the 32-character compile+match case. This is f360 class-overlay evidence on a retained older runtime, not current PR5 or full-image qualification.

## Identity, licensing and limits

Read PROVENANCE.json and evidence/source-result-links.json. Every original source is byte-preserved and all historical output claims are explicitly labelled retained, not rerun. No original model Git commit is known. Any next checkpoint is new recovery provenance.

The Pattern target retains its OpenJDK GPLv2/ClassPath notices; the pinned repository LICENSE and complete Pattern notice are included. The reconstruction script also embeds Pattern fragments and is explicitly covered by this provenance discussion. Original audit drivers have no per-file license headers. SOURCE_ORIGIN.json documents their audit roles and the inspected source evidence without assigning a copyright owner, inventing a license, or asserting legal clearance. No source bytes or historical hashes were changed to add headers.

No binaries, full runtime images, large raw logs, credentials, Library dependency or hard-coded local runtime launcher are included. Original detailed evidence remains local. Hash manifests cover the staged payload; independent review will be included when complete. No build, Java process, benchmark, or publication was run to assemble this package.
