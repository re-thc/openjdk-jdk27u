# Sealed configurations and approved object cleanup

`staging.py` supports complete manifests, exact dry runs and the narrow
`compile-objects-after-consumers-v1` policy. The default campaign option is
`--storage-cleanup=dry-run`: it does not remove objects. The policy option
authorizes removal only when the campaign itself has been explicitly released
with that cleanup scope. Source availability or a successful dry run is not
execution, deletion or publication permission.

## Retention and source order

Every normal build still uses `bin/configure-dev` and
`make CONF=... JOBS=4 images test-image-hotspot-gtest`. The complete configuration
is cataloged after successful build shutdown and prospective toolchain checks.
The catalog includes file hashes/identity/modes, directories and link targets;
the whole `images/` tree, packaged gtest runtime, canonical native runtime and
normal JDK must be present. Image links must resolve inside the images tree.
Manifests stay outside the configuration. Complete JDK/test images, jmods,
symbols, generated headers, source, static archives, command files, dependency
files and build/configuration logs remain at their original paths.

The finite object plan selects only regular `.o` files directly inside these
directories:

* `hotspot/variant-server/libjvm/objs`
* `hotspot/variant-server/libjvm/gtest/objs`
* `hotspot/variant-server/libjvm/gtest/launcher-objs`
* `hotspot/variant-server/libjvm/libgtest/objs`
* `hotspot/variant-server/tools/adlc/objs`
* `support/native/<module>/<library>`

No other extension/location, nested arbitrary directory, shared hardlink,
symlink, image, symbol or evidence file can enter the plan. It records every
selected relative path, original SHA-256 and inode metadata, and the estimated
reclaimable allocation. It binds the campaign, one of the four configuration
names, its exact root and the complete seal hash. New files are never selected
by a wildcard at deletion time. No directory is removed.

| Configuration | Final compile consumer before cleanup |
| --- | --- |
| B-release | Successful normal build, complete sealing and receipts |
| C-release | Native tests, old-header negative control, release correctness |
| C-fastdebug | Native tests and fastdebug correctness |
| C-release-asan | ASan native tests |

The old-header control links both ordinary JVM and gtest objects. Keep that
entire closure, response/command files, libgtest archive, generated headers and
source until the control finishes. Its separately generated old object/library,
preprocessed sources, shared-input hashes, XML and proof are always retained.
A failure before a final consumer leaves that configuration's objects intact.
No configuration may be rebuilt after its objects have been discarded.

## Checks, ownership and partial failure

All campaign staging is untimed, at an empty-child boundary, under the existing
independent supervisor, cancellation and original stage/global deadlines.
Each staging operation has an additional local cap of 180 seconds, clipped to
those bounds. The live storage guard remains active during hashing and cleanup.
Source revision verification for a fresh campaign also occurs in the owned
controller; `--harness-commit` is required for every entry point.
Entry points suppress local Python bytecode caches before importing harness
modules; offline subprocesses inherit that setting, keeping source admission clean.

Every new matched pair, including a fresh campaign without continuation, checks
the actual configured CC/CXX against the captured native roots and BOOT_JDK
against the captured boot image. Compiler paths/versions and profile fields must
match the new B spec. These checks run immediately after configure, before make,
and again in each post-build receipt. Missing catalogs/fields, duplicate fields,
out-of-root compilers, an uncaptured boot JDK or a mismatched candidate spec fail
closed. Unchanged but irrelevant cataloged roots cannot substitute for the
selected tools. Offline fresh-mode regressions cover both compiler roots,
every matched field, pre-make refusal and post-build spec drift.

Cleanup rereads both canonical manifests with pinned byte hashes. It compares
the complete current configuration with the seal before the first unlink.
Directory descriptors and `O_NOFOLLOW` pin every ancestor; changed roots,
parents, paths, file identity, bytes, modes or links fail closed. A shared object
inode is refused. Each intent and completed unlink is flushed to a journal.
Cancellation/deadline checks occur between entries and hash chunks. Afterward
the entire retained tree must equal the original seal minus exactly the planned
objects. Retained configurations are checked before correctness/performance
and again before final acceptance.

This requires exclusive ownership of configuration writes: no compiler or test
consumer may still be active, and no external writer may modify that tree.
POSIX unlink does not provide a transaction against hostile simultaneous
same-user writes. Observed drift, partial cleanup, signal, exhausted budget or
child-audit uncertainty yields HOLD and keeps the journal/receipts; it cannot
be replayed as a successful cleanup. Outer-controller death still requires the
independent owner's cleanup and final audit. A partially pruned configuration
is never silently rebuilt or resumed.

The storage receipt preserves before/after free space, observed net free-space
change and minimum observed free. Untimed minima are sampled at admission,
polls and finish; measured commands only sample their boundaries. Neither is
an exact instantaneous peak. Measured commands receive no new in-interval disk
probe. The initial and conditional-debug gates remain **12 GiB**, the live
reserve remains **1 GiB**, and measured admission still reserves **256 MiB**.
Debug/ASan peak space is unmeasured. Capacity failure retains evidence and stops.

## Read-only preparation and pinned dry run

These commands never build, launch a JVM or remove a file. Use new manifest and
receipt names outside the configuration, with an existing output directory.
They create local evidence only; the CLI deliberately has no apply command.
Each read-only operation has cancellation checks and a maximum 180-second local
deadline. They do not launch the campaign or replace its independent owner.

```sh
PYTHONDONTWRITEBYTECODE=1 python3 staging.py prepare \
  --campaign-root /path/to/retained-campaign --configuration B-release \
  --seal /path/to/evidence/full-seal.json \
  --manifest /path/to/evidence/object-plan.json \
  --receipt /path/to/evidence/prepare-receipt.json

PYTHONDONTWRITEBYTECODE=1 python3 staging.py dry-run \
  --campaign-root /path/to/retained-campaign --configuration B-release \
  --seal /path/to/evidence/full-seal.json --seal-sha256 APPROVED_SEAL_SHA256 \
  --manifest /path/to/evidence/object-plan.json --manifest-sha256 APPROVED_PLAN_SHA256 \
  --receipt /path/to/evidence/dry-run-receipt.json
```

The exact approved plan is immutable. Changed bytes, scope or retained entries
fail the dry run. The campaign's apply path exists only behind
`--storage-cleanup=compile-objects-after-consumers-v1` and the final-consumer
boundaries above. It cannot clean an earlier failed campaign. Retrospective
cleanup of such a campaign needs separately reviewed/approved exact scope and
an owned finite invocation. `supervise.py --cleanup-only` supplies that explicit
old-B-only route, with a 240-second outer cap (including the usual 30-second
cleanup and five-second report reserves). Its owned child has at most 180
seconds, verifies the clean reviewed Git revision before reading either pinned
manifest, keeps the storage guard/empty-child audit active and writes a distinct
cleanup receipt/journal. Source validation does not grant its execution scope.
It cannot combine with `--continuation`, run tests, build, qualify or reuse an
old image. No unowned destructive CLI or arbitrary-command owner is added.

After approval of the exact old manifest, publication and execution scope:

```sh
python3 supervise.py --execute --cleanup-only \
  --owner-output /path/to/new-cleanup-owner -- \
  --campaign-root /path/to/retained-campaign --configuration B-release \
  --seal /path/to/evidence/full-seal.json --seal-sha256 APPROVED_SEAL_SHA256 \
  --manifest /path/to/evidence/object-plan.json --manifest-sha256 APPROVED_PLAN_SHA256 \
  --receipt /path/to/evidence/new-exact-cleanup-receipt.json \
  --harness-commit REVIEWED_COMMIT \
  --storage-cleanup=compile-objects-after-consumers-v1
```

Success requires owner COMPLETED/exit zero, complete cleanup/final child audit
and the separate exact-cleanup APPLIED_AND_VERIFIED receipt. These receipts
never count as a qualification pass. A later new campaign needs its own release
and new owner/output directories.

## Review and runtime scope

The first failed attempt remains HOLD. Its retained baseline is ineligible for
qualification reuse because historical boot modules/compiler byte hashes were
not captured. Existing continuation UTC/phase cutoffs are unchanged; staging
does not reset or extend them. If the original release-build window is no
longer feasible, stop. A new campaign needs explicit revised scope and a new
recorded release. It must build both product revisions normally with prospective
toolchain provenance and all fixed correctness/benefit/performance/debug gates.

Offline tests use synthetic files, fake children/clocks and mocked unlink;
successful unlink mocks move synthetic bytes into a holding directory. They
exercise the real post-cleanup namespace verification without deleting campaign
files. This source validation is not native cleanup or JVM qualification.
