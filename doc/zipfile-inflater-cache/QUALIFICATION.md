# Staged compact ZIP cache qualification

The attempt at `559703d10cbbaba18e59b8147a532eb81b1b77be` built both normal
packaged images and passed six baseline Serial controls, then stopped before
candidate tests on a multiline `TEST` serialization error. All evidence and
images remain intact; no allocation or performance phase ran. The complete
[retained-image continuation](CONTINUATION.md) is prepared for review and separate
execution approval. It reuses those images without rebuilding. The fresh-build
instructions below are a reproduction reference, not authorization to rerun.
Compact-cache startup/throughput remain unmeasured; default eviction is rejected.

## Subject and existing evidence

Baseline B is `89885a6288e7aaabd01678a704a586272c0f96e3`. Product source was
published at `4c24619ebb6cb14e1c96d1c1029568dcc3585840`; subsequent qualification
files do not change it. Set C to the full reviewed head of
`review/zipfile-compact-inflater-cache`, record it once and use that exact checkout.
The expected Git blobs are:

| File | Blob |
| --- | --- |
| src/java.base/share/classes/java/util/zip/ZipFile.java | 9943e4f9635c2480f58bdf7c0116432eee00ad51 |
| test/jdk/java/util/zip/ZipFile/InflaterCache.java | f79e29971e1c8b6dcedea8420a74ad80db914bd1 |
| doc/zipfile-inflater-cache/ZipCacheFootprint.java | e720f00727bb6c030896d6f914f94dad8d664a47 |

The normal Linux x64 GCC 16.2 build and 15 targeted tests under each of
Serial/G1/ZGC passed for this product source. That build used generic configure
flags, not the repository's configure-dev native profile. Instrumentation showed
16/64 bytes per unused/serial cache eliminated under default Serial/G1 layouts,
24/112 under ZGC, without resource growth or promoted-cache changes. These are
heap-container counts, excluding one shared closed marker. Linux/plain-zlib
1.3.1 accounting showed unchanged one/32-stream native requests, no replacement
inflaters and complete release at close. Earlier eviction startup/performance
results do not qualify this compact representation. No current result proves
startup/throughput neutrality, native/RSS savings or other-platform performance.

## Stage 1: decide value on Linux first

Use one native Linux x64-v3 host and the repository profile, Serial/G1/ZGC only.
No other native host is a prerequisite. Use installed compatible Boot JDK 27,
jtreg 8.3, GCC 16, mold, GNU make/coreutils timeout, autoconf, Python 3 and system
plain zlib headers.
No JMH, unmanaged installation, binary transfer or CI is required. The owner
resolves ordinary installed tool/dependency paths and runs the complete stage
after execution is authorized. ROOT is a fresh absolute writable workspace;
BOOT_JDK and JTREG_HOME name installed tools; C is the reviewed full commit SHA.

### One outer supervisor invocation

From a clean checkout of the full reviewed C, with ROOT an absent absolute path
without whitespace, run the entire sequence through the supervisor after the
single bounded run is authorized:

```sh
: "${C:?full reviewed commit SHA}" "${ROOT:?new absolute workspace}"
: "${BOOT_JDK:?installed Boot JDK 27}" "${JTREG_HOME:?installed jtreg 8.3}"
Q="$(git rev-parse --show-toplevel)/doc/zipfile-inflater-cache"
python3 "$Q/supervise-linux.py" "$ROOT" "$C"
```

Installed dependency-prefix configure arguments may follow C (after `--`); the
same options are passed to both builds, and profile/collector/tuning overrides
are rejected. The authoritative [run-linux.sh](run-linux.sh) contains the complete
checkout, build, correctness, allocation and measurement sequence. Do not run
its phases independently or bypass the outer supervisor. The wrapper verifies
its own reviewed checkout and clean qualification sources; the sequence verifies
B/C and the three product/test/probe blobs above. No existing build directory or
private binary is copied. Source/tool/spec, module/native-library hashes and all
outcomes stay in ROOT, without automatic publication.

Both builds use `make CONF=zip-qual JOBS=4 jdk-image`, producing each checkout's
`build/zip-qual/images/jdk`. One shell helper supplies this path to image-file
checks, release metadata, module/native-library hashes, both explicit test
`JDK_IMAGE_DIR` arguments, JNI headers and every lifecycle/allocation/performance
JVM. Boot JDK compilation, archive packaging and fixture preparation remain
separate setup tools. Build specs and jtreg reports stay in their normal
`build/zip-qual` locations. `make jdk` only produces the exploded
`build/zip-qual/jdk` layout and cannot satisfy the packaged `lib/modules` check.
The failed attempt is terminal; do not copy it into a new run, relabel it as a
packaged build or resume it under this correction.

[supervise-linux.py](supervise-linux.py) starts one owned process tree and stops
all work at four hours. It pins that tree to four available CPUs, gives it
owned temporary/cache directories and disables core dumps. At completion, error,
interruption or deadline it sends TERM, then KILL after ten seconds, to individual
owned descendants, including orphaned jobs adopted through Linux subreaping.
Each candidate child is reread and must retain its captured birth and parent PID
before the parent's owned birth identity is revalidated; the fresh child record
is retained. PID handles verify leaf identities before signalling.
This avoids killing reused/unrelated PIDs. Cleanup
and the final disk check share at most thirty seconds of postflight grace beyond
the work deadline. No broad pkill or machine-wide cleanup is used; logs and
checkouts are retained. Remaining owned
processes or uncertain cleanup are recorded as a non-pass in
`supervisor-status.json`, not reported as successful termination.

Ceilings: four CPUs, 16 GiB supervised-family aggregate RSS stop threshold,
30 GiB scratch apparent bytes and four hours work plus the shared postflight
grace. RSS is conservatively
summed (shared pages can be counted twice) and sampled, not a kernel memory
quota or a memory-saving result. Scratch usage uses `du -sb` apparent bytes,
not allocated disk blocks, and is sampled outside timing; a 128 MiB
log reserve is checked before timing and usage is checked again afterward. The
shell publishes phases atomically and waits for the supervisor's acknowledgment
before timing; that acknowledgment follows completion of any in-flight disk scan
and the reserve check, so no recursive disk scan overlaps the timed sample.
A strict instantaneous RAM/filesystem quota, if required, belongs to the managed
host allocation. Two normal build images maximum, JOBS=4, two jtreg workers;
configuration/build/correctness sublimits are 10/90/30 minutes. The existing
30-minute timing deadline and per-process limits below remain inside the outer
four-hour deadline. Linux /proc, Python 3.9+ pidfds and subreaper support are
required; their absence stops before the sequence starts, without installation.

Run the offline ownership regression with
`python3 -E -B doc/zipfile-inflater-cache/test-supervise-linux.py`.
Its synthetic process records exercise the ownership function without starting
the supervisor, reading real /proc records or signalling processes; this does
not qualify the runtime campaign.
The static layout regression is
`python3 -E -B doc/zipfile-inflater-cache/test-image-layout.py`.
It reads source only, rejects the original exploded-build/packaged-hash mismatch
and checks every image consumer; the supervised sequence runs it before fetching
or building. Neither offline check establishes that a packaged image exists.

Use a quiet host; do not change governors, disable security or flush OS caches.
Do not overlap other builds/checks with timing. Preserve every outcome; no
threshold sweep or favorable reruns. New profile checks close the configuration
gap instead of repeating the old generic-profile campaign. Stop on identity
drift, missing tools, unsupported collector, build/test failure, content/provider
mismatch, worker failure, lifecycle failure or exhausted budget. Any source or
driver fix records a new reviewed head and requires separate authorization for
another run; do not patch and resume a failed attempt. A baseline failure
invalidates the comparison.

### Correctness, retained containers and native reuse

Run fifteen local cache/ZIP tests plus six protected local JAR consumer
tests on C; the six consumer tests also run on B as controls. Do not sweep the
whole URLClassLoader directory, which includes unrelated HTTP-server tests.
DeleteTempJarTest is excluded HTTP coverage. EnumerateAfterClose adds local
lifecycle coverage; it does not cover the excluded HTTP path.
[CONTINUATION.md](CONTINUATION.md) explains the scope and original absolute deadline.

The exact twenty-one candidate and six baseline paths are in test-selections.sh;
shared per-stage timeouts and unique log labels are in run-stages.sh. The sequence
then compiles the Java workload,
footprint agent and native allocator probe from this checkout, creates fixtures
once, and runs lifecycle/container/native checks separately from timing. The
allocation checker must pass before the uninstrumented runner starts.

The allocator helper requires Linux/glibc and dynamically linked plain zlib;
it fails if interposition is absent. Requested live client bytes exclude its
metadata. It also reports `observed-zalloc-calls`: cumulative allocator-callback
calls for each tracked inflater, summed across those clients. The probe retains
their last observed counters after end; zero live bytes at close does not reset
the cumulative count. JNI z_stream allocation and diagnostic metadata allocation
are outside this zalloc-call counter. Counters count callback attempts, including
failed attempts; an allocation failure stops the run.

Empty/singleton containers must disappear without resource growth; promoted
containers, live native requests and identities must match B, with zero replacement
inflaters. Read/idle/repeated-idle native bytes, blocks and cumulative calls must
stay equal after the initial read: stable live bytes alone cannot rule out native
allocation churn. The final retained counter must match the last live observation,
and close must release every live client block. Counter comparisons and live-byte
checks are separate. These are client-allocation/lifetime observations, not RSS,
OS release or allocator-retained memory savings; diagnostic usable bytes are not
savings either. No instrumented duration is reported or used for performance.

### Fixed representative startup and throughput

The supervised sequence invokes run-qualification.py only after all prior gates
pass. Do not invoke it as a way to bypass the outer work/resource limits.

Seven cases protect metadata-only opens, serial full/partial 4 KiB reads,
four independent readers sharing one ZIP, repeated 32-stream bursts with serial
reuse, first two-stream promotion on fresh ZIPs, and local 32-JAR class/resource/
service loading. The loader checks 128 generated Runnable classes and the exact
32-provider set, with eight STORED and 24 compressed archives. Reads check CRC/
length; joined Futures propagate worker failures. Signed/multi-release positive
and negative verification are correctness tests, not timing claims. The lifecycle
case closes a loader with active/idle streams, deletes/recreates its archive and
verifies a reopened full read.

The runner permits 18 batch JVMs and 48 startup JVMs total across Serial/G1/ZGC.
Batch: three independent paired forks, AB/BA/AB order; eight rounds per case,
first three warmup, process median from the last five. Startup: two warmup pairs
and six measured pairs per GC, alternating order. It measures the prepared local
JAR application's fresh JVM with warm filesystem caches, not cold-disk boot.
Heap is 128 MiB, ActiveProcessorCount=4; -Xbatch is used only for batch work.
Batch/startup timeouts are 90/15 seconds and the whole runner has a 30-minute
deadline. Output directories cannot be reused; observations and partial timeout
output are preserved. Any failed/inconclusive gate exits nonzero.

The proposed 1.02 warm / 1.03 startup upper-ratio bounds describe measurement
resolution checks; they are **not user approval to accept a 2% or 3% slowdown**.
For each row the summary retains all paired ratios, sample count, geometric mean
and lower/upper per-row one-sided 95% log-ratio t bounds (constants 2.919986 for
three process pairs, 2.015048 for six). Small samples do not establish exact
zero cost, normality or simultaneous/family-wise confidence. No pooled win may
hide a protected loss; no samples are added to rescue uncertain results.

A row is flagged for explicit trade-off review if all its independent paired
ratios are slower than baseline, or its lower bound exceeds one. This observed
consistency is a review flag, not a claim of statistical certainty. The runner
exits 3 for such rows even when they meet the proposed resolution bounds. It
exits 2 for unresolved/out-of-resolution bounds without a consistent-loss flag.
It exits zero only for no detected consistent loss within the proposed resolution;
that status is neither “regression-free” nor permission to accept a slowdown.
Mixed signs and positive point estimates also remain visible for human review.

Stage 1 ends with one evidence report. Failed correctness/allocation or unresolved
timing does not proceed automatically. A consistent measured loss requires an
explicit user trade-off decision, with its magnitude, uncertainty and modest heap
saving presented together; do not accept it by citing 2%/3%. If Linux is worthwhile
without accepting an unauthorized loss, recommend normal PR correctness review/CI
with Linux-only performance evidence. Otherwise preserve the non-pass/review
outcome, without requesting three more performance hosts or retuning the sample.

## Stage 2: normal supported-platform PR correctness, if worthwhile

After a worthwhile Linux result and separate authorization to create the PR,
use the repository's normal PR CI for its supported Linux x64/AArch64, macOS
AArch64 and Windows x64 builds/checks. Retain the repository Serial/G1/ZGC profile;
do not invent a new CI workflow, dispatch a manual performance campaign or require
native host provisioning before Stage 1. Confirm the focused regression is
covered and record which collector actually ran it; a CI label does not prove
all collectors were exercised. If normal CI omits that test or reveals a
collector-relevant failure, address that specific gap through the normal
supported-platform correctness path rather than invent a full extra matrix.
This document does not authorize PR creation or any CI launch.

Passing Linux timings is not evidence of other-platform performance neutrality.
Nevertheless, shared Java reference storage has no architecture-specific speedup
claim requiring three automatic native timing campaigns. Request a native
performance follow-up only for concrete evidence: a platform regression, changed
JIT/locking behavior in the affected path, or a proposed target-specific speedup.
Name that hypothesis and run only the smallest relevant protected case/collector
on that target. A general claim of universal throughput neutrality would require
more evidence; omit it instead of making it an integration prerequisite.

The owner owns checkouts, installed-tool discovery, builds/checks, bounded
analysis and source repairs. A fresh Stage 1 depends on review of this complete
correction and separate execution authorization, not on other hosts. Stage 2
depends on later PR authorization and normal CI availability. Source/runner
repair is not completed runtime qualification; no campaign, install, PR or CI
was launched while preparing this correction.
