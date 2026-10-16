This unpublished wiring prepares native validation of classifier product head
`5e2a1a63d4451b54069a365ac1d69dfcd208ee9d`. It does not qualify the classifier
or alter PR14. Publishing the diagnostic branch would trigger hosted work and
requires a new explicit owner approval after independent review.

Two new HotSpot builds are necessary. The old cumulative candidate images
do not contain the phase-owned classifier, CPU matcher members or shared
Matcher integration. Release must exercise its actual old-arena destruction
paths, including code omitted by NOT_DEBUG in fastdebug; fastdebug supplies
assertions and IR verification. Saved same-level rebuilt-b3 images supply
unchanged Java modules, overlay templates and historical correctness controls.
No control or Java-module rebuild is planned. These controls are not a newly
matched-toolchain performance pair, and compiler-task values are diagnostic.

The proposed workflow is restricted to a new diagnostic branch,
`codex/vector-api-classifier-preflight`. Its branch does not match any of the
four existing vector qualification/timing workflow triggers. It contains only
the two-level candidate-build matrix and dependent correctness/IR preflight.
One matrix job runs at a time, with fail-fast enabled, one make worker and no
job retries (run_attempt must be one). A producer failure prevents preflight.
The existing three-file producer, verifier and timing workflows are untouched.

Job caps are 90 minutes release, 90 fastdebug and 120 preflight: at most
300 runner-minutes, excluding queue time. Soft deadlines start before checkout
at 80/80/100 minutes. Long build, unpack and verification/test steps are bounded
by the remaining soft deadline; partial logs and failure records are uploaded
with always(), leaving capture margins before the job caps. The producer also
records failed status and terminates its command process group on interruption
or command failure. Both checkouts have five-minute limits; clock setup has
one minute, metadata checks five, downloads ten each, jtreg verification two,
and native tool setup eighteen. After the soft deadline, metadata capture has
two minutes, textual export three, and uploads five. Every step is bounded.
There are no automatic build/test retries or runtime measurement cohorts.

classifier-provenance.json pins the reviewed source/test/make/bin trees,
configure profile, five-file product delta and exact product-patch hash. It
also binds every tracked workflow and qualification input to the executing
Git HEAD: bytes, Git blob/type/executable mode and actual working-tree mode
are recorded. Dirty, untracked and ignored inputs are rejected. The complete
input binding must agree between producer and consumer; no fixed checkout
umask is assumed. The provenance separately pins the historical build
plan/results as canonical JSON values,
their source heads and the four control image file hashes and lengths. The
producer verifies these controls and its release boot image before building
one candidate HotSpot overlay. It records source identity, tools before/after,
commands, compiler environment, configure/spec/build/version evidence and
image bytes. Complete template and candidate manifests cover every file,
directory, symlink target and permission mode. Their entry sets and all
contents/modes must agree except for lib/server/libjvm.so content; its type
and mode must still agree. The consumer independently manifests its saved
historical template and candidate and compares them with producer records.
Thus the four historical file fingerprints remain provenance anchors rather
than being presented as a complete image comparison. The consumer
requires completed new-candidate provenance, exact current workflow/source
binding and an independently verified historical control/boot binding. It
rejects stale control VMs, altered evidence, incomplete builds, wrong levels,
module changes and matched-toolchain labels. No GITHUB_SHA spoofing or old
verifier relaxation is used.

The preferred jtreg input is artifact 12015894519 from run 38813879807,
bundles-jtreg-8.2.1+1: 10159213 bytes, GitHub digest
204a593fc22cb7f3b4f635848816c4aa4d196cc3b5b203c9604ec6d95085a088,
expiry 2026-10-21T00:23:49Z. Its metadata matches the older artifact 11790243299
from run 38349570655, so there is no 18 October dependency. Consumer bytes remain
to be checked. Before either build and again at preflight, the workflow hashes
all seven JARs against the separately retained local 8.2.1+1 equivalent. That
tar's SHA-256 is 07d1a51162d5b60c2709fecb5438c7ba9d3d698a9ac7673256e4e6c5364a2201;
all seven extracted JARs match it and its manifest says 8.2.1-dev+1. These JAR
pins come from that preserved tar, not from previously unread GitHub ZIP bytes.
A mismatch stops work before native compilation; it does not authorize an
automatic substitute. Raw GitHub ZIP byte identity is not claimed by local
fixtures. Metadata is checked through GitHub's authorized API, artifacts use
the pinned download action, and needed consumer bytes are checked independently.
Blocked local image/retention transfers are not retried or bypassed.

Frozen WhiteBox and class directories have complete entry/type/content pins.
All five class hashes match retained native input records. Historical records
did not retain their permission modes, so those consumer modes are recorded
without inventing archive-mode pins. The preflight verifies these payloads
and the executed-input source binding before its first JVM invocation.

The initial preflight has 70 top-level commands: four flag probes, four clean
jtreg drivers, javac/javap, 48 finite compiler-task processes, eight separate
matching probes, two actual isolated OSR-negative probes and two stress drivers.
There are 16 clean and 2 stress JTR cases. Nested jtreg JVM counts are recorded
at execution rather than assumed to equal the driver count. Both default SVE
and UseSVE=0 are required; positive and negative IR checks must actually run.
Graph printing stays outside the finite compiler-task processes. The
--historical-control option changes attribution labels only; thresholds,
workloads and clean/stress assertions remain unchanged.

For offline review, test_classifier_images.py runs the real producer with
inert tool/JDK files and intercepted native actions, packs the actual workflow
upload selection, unpacks its candidate and calls the production consumer.
It checks source/artifact/evidence corruption, incomplete outputs, control
substitution, failure stops, trigger isolation, caps and a real bounded Python
child timeout. Grandchild fixtures cover both successful and failing leaders
whose descendants ignore SIGTERM. Cleanup polls group liveness independently
of leader exit, escalates to SIGKILL and verifies that no live members remain;
zombies awaiting the enclosing subreaper cannot execute. It executes no
compiler or JVM. Native build/link and full
consumer artifact verification still require the separately approved run.

The earlier five non-inferiority misses, unexplained timing bands and caller/
direct code identity, OSR mixed incoming Phi, vector-argument ABI materialization,
wide fallback and MAX insert allocations remain open. No recovery/retention
timings, full Vector API suites, tier/cold or allocation campaigns, assembly
cohorts or security-stopped header probes are launched by this wiring.
