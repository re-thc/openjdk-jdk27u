# Staged storage and artifact lifecycle

The workflow requires **20 GiB initially free**, while the current VM has roughly
25 GiB free. It keeps all four source checkouts and completed JDK images for
unchanged final input verification, with only **one build's intermediates live**.
The former 70 GiB reservation added products that need not coexist; it was not
a measured peak requirement. No existing data needs to be deleted.

## Evidence and bound

A read-only audit found a complete normal release build occupying about 6.18 GiB
and its runnable JDK image 0.39 GiB. The other observed 3.74 / 4.20 GiB trees are
partial exploded builds, so they are not treated as complete-image peak results.
The source checkout is below 1 GiB. Raw allocation paths and filesystem details
remain in the private handoff. These observations support the staged allowance;
they do not measure the peak of a future campaign or guarantee every toolchain
finishes inside it. Native debug symbols and PCH remain disabled identically
for all four planned builds; the allowance includes room for normal JMH/GTest.

| Simultaneously live component | Conservative limit |
|---|---:|
| Four source checkouts, using shared existing Git objects | 4 GiB total; 1 GiB each |
| One active normal build, including its image and JMH/GTest products | 9 GiB |
| Three previously completed runnable JDK images | 1.875 GiB total; 640 MiB each |
| Retained JMH jar and standard GTest artifacts | 0.5 GiB |
| Downloads, unpacked dependencies, codec checkout/classes/corpus | 0.5 GiB |
| Input manifests | 0.25 GiB |
| Outer logs, copied build/test evidence and results | 1 GiB |
| **Component sum** | **17.125 GiB** |
| Campaign allocation stop threshold, with additional metadata/headroom | **18 GiB** |
| Free-space floor beyond that campaign allocation | **2 GiB** |
| **Initial free-space requirement** | **20 GiB** |

The active build includes its own image, so only three earlier images are added.
The retained-test allowance conservatively includes artifacts even if some
still fall inside the active build. Boot JDK/toolchain inputs already exist;
hashing them creates manifests rather than copying their contents. Local
`git clone --shared` reuses the existing object database, without another full
Git object-store allocation per checkout. All four source working trees remain.

The 20 GiB requirement exceeds the component sum plus the 2 GiB floor. The
roughly 25 GiB currently available gives further margin. These are explicit stop
limits, not promises of completion or automatically adjustable reservations.
If the future build exceeds a bound, the workflow stops and preserves its
remaining inputs/evidence for review. It never frees unrelated data or raises
a limit to continue.

Allocated-byte checks do not follow disposable symlinks and count hardlinks
once. Complete JDK images are subject to their retained limit after provenance
capture; transient image construction is covered by the active-build bound.
Whole-tree checks run between commands; checks also run every 30 seconds during
make/configure. During measured forks, only the existing free-space/log polls
run, avoiding recursive storage scans while compiler work is timed. Free space
is polled every 2 seconds. Polling can overshoot a threshold between samples.
Private `storage/usage.json` records sampled maxima/minima and component sizes;
prune journals record exact before/after allocations. There is no machine-wide
queue, reservation service, cleanup sweep or mutation of shared task data.

## Last consumers and retained artifacts

| Variant | Last consumer of generated build intermediates | Retain at original paths |
|---|---|---|
| Baseline release | Normal `make build-microbenchmark`, followed by selected-name verification | Entire source; complete `images/jdk`; `images/test/micro/benchmarks.jar`; original spec/configure log |
| Candidate release | Normal `make images` and source/image provenance capture | Entire source; complete `images/jdk`; original spec/configure log |
| Baseline fastdebug | Normal `make images` and source/image provenance capture | Entire source; complete `images/jdk`; original spec/configure log |
| Candidate fastdebug | Standard GTest image build, filtered `make test-only`, four-test success verification | Entire source; complete `images/jdk`; complete `images/test/hotspot/gtest`; original spec/configure log |

After each last consumer succeeds, pruning finishes before the next variant is
cloned or configured. There is no later make invocation for a pruned variant.
Java IR/stress/nearby regressions use retained source and the complete candidate
JDK image; none of the selected tests needs a discarded native-test library.
Codec compilation, codec validation and JMH controls use complete JDK images,
identical codec classes and the retained standalone benchmark jar.

The exact selection is computed from that variant's new `build/qualified`:

- Retain `images`, `spec.gmk`, `configure.log`; all other generated entries can
  be removed after evidence capture. This includes HotSpot objects/link products,
  exploded `jdk`, `support` objects/generated classes/jars, bootstrap `buildtools`,
  make/configure scratch and generated test-result containers.
- Within `images`, retain the complete `jdk` and the required test-artifact
  subtree above. Remove separate `jmods` and other unused image products.
- For baseline release, retain only `images/test/micro/benchmarks.jar` in the
  test image. The selected controls are pure Java; generated JMH sources/classes
  and native benchmark libraries are no longer needed after the jar is built
  and selected names are verified.
- For candidate fastdebug, retain the complete `images/test/hotspot/gtest`.
  HotSpot/GTest object/link products are unnecessary after normal tests pass and
  that test image is frozen. Keep copied detailed standard GTest reports.

Before removing any of these entries, copy normal build logs, configure-support,
build-timing and test-result evidence to `results/build-evidence/<variant>`.
Retain all original source/image/configuration paths and manifests. **No source
retirement, image relocation, manifest replacement or weaker provenance check
is involved.** All frozen inputs remain available for premeasurement and final
drift verification.

## Ownership, interruption and review

Execution must create a new private campaign root. Its marker binds the root's
canonical path, device/inode and exact plan hash. Pruning requires that identity,
the expected source commit, existing original manifests and successful records
for the specified last consumers. It verifies the original inputs before and
after pruning, freezes retained test/evidence artifacts, and journals every
selected path and completed removal.

Symlinked build ancestors are rejected. Any retained input referencing a removal
target is rejected before deletion. Descriptor-protected removal unlinks a
disposable symlink rather than following it to another task's data. An interrupted
prune stays marked incomplete, stops the campaign and counts as an active build;
it cannot permit another full build to start. Failure/cancellation still runs
the existing bounded final input check. The process-local Linux subreaper
reaps adopted descendants only in the owned group after preserving its launcher
status; dead zombies do not count as live workers, while unknown/live states
remain failures. Logs and all required inputs survive.

Existing build trees, prior evidence, source checkout, toolchains, caches and
other tasks' data are never removal targets. There is no command for adopting
or pruning an old campaign. No campaign cleanup was executed to prepare this
package. Lifecycle tests remove only data they newly create inside temporary
fixtures, including tests for drift, incomplete consumers, ownership mismatch,
symlink boundaries and interruption.
