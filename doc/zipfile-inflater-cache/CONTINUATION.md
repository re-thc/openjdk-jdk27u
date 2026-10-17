# Retained-image ZIP qualification continuation

Prepared source only. No continuation correctness, allocation or timing process
has been launched. Execution needs separate authorization after this complete
command path is reviewed.

The attempt at `559703d10cbbaba18e59b8147a532eb81b1b77be` successfully built both
normal packaged images and passed six baseline Serial controls. Its multiline
`TEST` value failed make initialization before any candidate test. Both builds,
all six pass records and the terminal attempt remain intact. This continuation
uses those exact inputs; it does not rebuild, patch or resume the failed process.
It is the explicitly prepared exception to the generic fresh-run instructions
in [QUALIFICATION.md](QUALIFICATION.md).

## Complete invocation, after execution approval

Use the same installed GCC 16.2, Boot JDK 27 and jtreg 8.3. Resolve their existing
paths/PATH without installation. From a clean checkout of the reviewed new C,
PREVIOUS names the preserved terminal attempt and ROOT is an absent absolute
output directory without whitespace. Their canonical paths must be disjoint.

```sh
: "${C:?full reviewed continuation SHA}" "${ROOT:?new absolute output}"
: "${PREVIOUS:?preserved 559703d10cb terminal attempt}"
: "${BOOT_JDK:?same installed Boot JDK 27}" "${JTREG_HOME:?same installed jtreg 8.3}"
Q="$(git rev-parse --show-toplevel)/doc/zipfile-inflater-cache"
python3 "$Q/supervise-linux.py" --resume-from "$PREVIOUS" "$ROOT" "$C"
```

No configure options are accepted. The supervisor still owns four CPUs,
16 GiB sampled aggregate RSS, 30 GiB sampled apparent scratch and bounded
TERM/KILL cleanup. Scratch includes **both** roots. It charges the prior
1801.973281452 seconds against the original four-hour allowance, leaving one
non-resetting **12598.026718548-second** work deadline. That deadline starts
before expensive verification. The existing 30-second shared cleanup/postflight
allowance remains; the previous elapsed time is conservatively charged including
its cleanup. Time waiting for review/execution approval is not campaign work.

## Bound inputs and preserved evidence

[retained-builds.json](retained-builds.json) pins the two source HEADs and full
image-tree digests, including directory/file names, modes, symlink targets and
file bytes. It also pins analysis/status/build/spec/release/hash records, six
individual jtreg pass records and tool identities. The pinned analysis binds all
226 prior evidence files. No absolute host paths, binary contents or raw host
logs are published in this binding.

[retained-images.py](retained-images.py) checks these inputs, clean source
worktrees, unchanged measured Java/native/driver sources, the Boot JDK release,
`java`/`javac`/`jar` launchers, modules and `libjvm`, the full jtreg `lib` tree,
and GCC versions. It refuses evidence of a prior allocation/timing phase. Checks
run initially and before timing. After successful initial validation, the EXIT
trap attempts another check on both success and failure; forced termination can
prevent that check and is rejected by the supervisor. Changing either old image,
evidence, source or reviewed harness invalidates the continuation. Verification
is read-only; old results are never overwritten.

The six completed baseline Serial controls are copied to the new evidence
directory and explicitly labelled **reused**, not rerun. The remaining order is:

1. Candidate Serial: 21 per-source jtreg selections.
2. Baseline G1: 6; candidate G1: 21.
3. Baseline ZGC: 6; candidate ZGC: 21.
4. All original lifecycle, container and native-reuse checks on both images and
   Serial/G1/ZGC, followed by the unchanged fixed performance sequence.

There are **75 unexecuted correctness selections**. One necessary scope
correction replaces HTTP-dependent `DeleteTempJarTest` with local-only
`EnumerateAfterClose`; the former's helper starts the built-in HTTP server and
opens a `jar:http:` URL, excluded by the task. The replacement creates a local
compressed ZIP, checks enumeration after close and deletes it. No other selected
test/helper executes HTTP. The old attempt's historical selection is preserved.

## Argument regression and direct jtreg

[test-selections.sh](test-selections.sh) declares arrays and joins each make
selection once into a single space-separated line. The full-run entry point is
fixed too. [test-test-selection.py](test-test-selection.py) invokes GNU make with
the repository's actual `PreInitSupport.gmk` parser and crosses its sub-make argv
boundary. It proves 6/21 distinct existing paths survive and no test path leaks
as an assignment or target; the original mixed-newline fixture fails at the
exact reported boundary. This fixture launches no build, jtreg or JVM.

The continuation invokes [run-retained-jtreg.py](run-retained-jtreg.py) directly
instead of make, preventing image/test-image regeneration and old-report writes.
It preserves the saved **one jtreg invocation per source** isolation, two-worker
setting, timeout factor, assertions, agent VM, exclusions and VM/java option
ordering, including the protected GC and final 128 MiB heap. Every selected file
must actually report one passing test; skipped/excluded selections fail the gate.
The selected Linux tests need no separate native test image. jtreg retains the
original TEST.ROOT, MR-JAR properties, signed JAR and keystore as source inputs.

Harness/JVM tmp, cwd, work, report, command and partial-output logs all live under
fresh ROOT. The [shared stage script](run-stages.sh) preserves the original
allocation oracles, workload, collector order, 18 batch/48 startup process limit,
warm-filesystem fresh-JVM startup meaning, fixed sample counts and 30-minute
performance deadline. Consistent loss remains HOLD even within the proposed
2%/3% resolution bounds. No failed gate is retried or relaxed.

The timing handshake still waits for completed disk scans; no recursive scratch
scan or image verification overlaps the timed sequence. Exit provenance checks
occur only after the timed runner exits. A failed final integrity check rejects
the result and preserves the original stage exit alongside its provenance exit.

Offline preparation checks are the selection fixture, image-layout fixture,
supervisor ancestry fixture, shell/Python syntax and read-only retained-input
verification. These do not qualify the pending runtime campaign.
