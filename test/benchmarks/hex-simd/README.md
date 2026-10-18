# Complete-call HexFormat comparison

The product is PR #49, commit `7312c0e6e91fc1316aee8d63b549a20f1e43cce4`.
Baseline: `89885a6288e7aaabd01678a704a586272c0f96e3`.
Portable Java workload sources and decision gates come from existing ancestor
`1c344bde55df568fe4c06e774c87f4446f5ae310`. `SOURCE.json` records identities.
No library pin, operation, size, fork count or acceptance gate has been changed.

These are source-only benchmark and reproduction tools. They do not run during
normal builds or jtreg, and publication of the sources implies no performance
result. Run a complete grid only when authorized. No raw results or host data
are included.

## Which host can answer which question

* A native Apple Silicon Mac can decide the macOS ARM64/NEON end-to-end benefit.
  Use a native ARM64 shell, native Boot JDK and `aarch64-apple-darwin` Rust.
  Do not use Rosetta. The repository profile uses `-mcpu=apple-m1`.
* A native Linux ARM64 **glibc** container can decide Linux ARM64/NEON benefit.
  Its hardware must support the repository's ARMv8.2-A profile; Rust host is
  `aarch64-unknown-linux-gnu`. Do not use QEMU/amd64 emulation or Alpine/musl.
  A container on Apple Silicon uses the Linux VM's JNI/GC/OS path, not macOS's.
* ARM results do not validate AVX2 or x64 thresholds. An AVX2 claim needs one
  native Linux x64-v3/AVX2 host, matching baseline/candidate builds and the same
  complete grid. The already built x64 images remain preserved in the cloud;
  they are historical evidence and must not be reused as the repaired candidate
  or copied into ARM builds.

Ordinary prerequisites: repository-supported C/C++ compiler or Xcode and SDK,
Autoconf and normal JDK build dependencies, native Boot JDK 27, installed
Rust/Cargo >=1.85 with matching runtime notices, Python >=3.9 and jtreg 8.3.
Only Rust 1.99 was executed in the prior work; the declared 1.85 minimum is not
claimed tested. Use two build jobs, an otherwise quiet host, preferably 16 GiB
physical memory and 30 GiB free disk for the source/build pair. Each timed JVM
has a 512 MiB heap (cold: 128 MiB) and two active processors.

For the user's existing Linux ARM64 build image, ordinary container limits are:

```sh
docker info --format '{{.Architecture}}'  # native ARM64 engine, not an x64/QEMU host
docker run --rm --init --platform linux/arm64 --cpus=2 --memory=8g \
  --mount type=bind,source="$HEX_WORK",target=/work \
  --workdir /work "$ARM_BUILD_IMAGE" bash
```

Use an existing managed build image with the prerequisites. No image build or
tool installation is part of this handoff. `--init` uses Docker's ordinary init
for orphan reaping; do not run a tail-PID1 container. This launcher uses no
`/proc` scans, pidfds, subreaper, compiler watchdog or replacement init. On native
macOS, normal launchd provides orphan reaping. The Python launcher kills/reaps
only its own direct Popen Java child on interruption/timeout. It does not make
an aggregate RSS or CPU-affinity enforcement claim on macOS. Use external OS/
container limits if those are required; disk remains the provided filesystem.

## Build the two native images normally

Set `HEX_WORK` to an absolute, fresh, space-free directory. Set `BOOT_JDK` and
`JTREG_HOME` to existing native tools. Use the full immutable execution-package
revision from the review handoff as `HEX_PACKAGE`. The live product head does
not carry qualification machinery; the package stays reachable in Git history.
No measurement command below is authorized merely by receiving it.

```sh
git clone --branch review/hexformat-simd https://github.com/re-thc/openjdk-jdk27u.git "$HEX_WORK/repo"
git -C "$HEX_WORK/repo" worktree add --detach "$HEX_WORK/package" "$HEX_PACKAGE"
export HEX_HANDOFF="$HEX_WORK/package/test/benchmarks/hex-simd"
git -C "$HEX_WORK/repo" worktree add --detach "$HEX_WORK/candidate" 7312c0e6e91fc1316aee8d63b549a20f1e43cce4
git -C "$HEX_WORK/repo" worktree add --detach "$HEX_WORK/baseline" 89885a6288e7aaabd01678a704a586272c0f96e3
export RUSTUP_AUTO_INSTALL=0
# On Linux only: normal supported choice avoids adding a mold prerequisite.
export CONFIGURE_DEV_NO_MOLD=1
cargo fetch --locked --manifest-path "$HEX_WORK/candidate/src/java.base/share/native/libhexsimd/rust/Cargo.toml"
(cd "$HEX_WORK/candidate" && bash bin/configure-dev --with-conf-name=hex-candidate \
  --with-debug-level=release --with-jobs=2 --with-memory-size=8192 \
  --with-version-opt=hex-compare --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --enable-hex-simd && make CONF=hex-candidate JOBS=2 images)
(cd "$HEX_WORK/baseline" && bash bin/configure-dev --with-conf-name=hex-base \
  --with-debug-level=release --with-jobs=2 --with-memory-size=8192 \
  --with-version-opt=hex-compare --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  && make CONF=hex-base JOBS=2 images)
export HEX_BASE_JDK="$HEX_WORK/baseline/build/hex-base/images/jdk"
export HEX_CANDIDATE_JDK="$HEX_WORK/candidate/build/hex-candidate/images/jdk"
```

Both sides must use the same native compiler/toolchain/profile. Enabled cross
builds are intentionally rejected. Configure locates the actual Rust compiler's
license/copyright files, or accepts `--with-rust-runtime-notices=PATH` for that
same compiler release. Do not substitute a different release's notices.

On this new ARM target, run normal candidate HexFormat jtreg correctness with
`-vmoption:-Dhexsimd.expectNative=true`, JNI checking and Serial/G1/ZGC, using
the existing BulkHexFormatTest's two compact-string modes. The prior Linux x64
correctness is completed, but it is not native ARM evidence. Stop on a genuine
build/correctness failure; do not reinterpret it as a measured loss or tune the
performance workload to get past it.

## Compile the existing portable Java harness

```sh
export HEX_HARNESS="$HEX_WORK/harness"
mkdir -p "$HEX_HARNESS/reference/java/util" "$HEX_HARNESS/patch" "$HEX_HARNESS/classes"
git -C "$HEX_WORK/repo" show 89885a6288e7aaabd01678a704a586272c0f96e3:src/java.base/share/classes/java/util/HexFormat.java > "$HEX_HARNESS/reference/HexFormat.original"
python3 - "$HEX_HARNESS" <<'PY'
import re,sys
from pathlib import Path
r=Path(sys.argv[1])
(r/'reference/java/util/HexFormatReference.java').write_text(re.sub(r'\bHexFormat\b','HexFormatReference',(r/'reference/HexFormat.original').read_text()))
(r/'reference/javac.options').write_text('-g\n-XDstringConcat=inline\n')
PY
"$HEX_CANDIDATE_JDK/bin/javac" -J-Xmx512m -J-XX:ActiveProcessorCount=2 -J-XX:+UseG1GC \
  @"$HEX_HARNESS/reference/javac.options" \
  --patch-module "java.base=$HEX_HARNESS/reference" -d "$HEX_HARNESS/patch" \
  "$HEX_HARNESS/reference/java/util/HexFormatReference.java"
"$HEX_CANDIDATE_JDK/bin/javac" -J-Xmx512m -J-XX:ActiveProcessorCount=2 -J-XX:+UseG1GC \
  --patch-module "java.base=$HEX_HARNESS/patch" --add-exports java.base/jdk.internal.util=ALL-UNNAMED \
  -d "$HEX_HARNESS/classes" "$HEX_HANDOFF/Bench.java" "$HEX_HANDOFF/Protected.java" "$HEX_HANDOFF/FirstUse.java"
```

The reference uses java.base's `-XDstringConcat=inline` setting; the options file
is part of the frozen harness inventory. A receipt declares the provenance of
the compiled classes and binds that declaration to their hashes; it cannot
retroactively attest how arbitrary supplied binaries were compiled.

Only the unchanged reference class is patched. Production Java and JNI code come
from the full normal builds. The existing Java sources can also be recovered
directly with `git show 1c344bde55df568fe4c06e774c87f4446f5ae310:test/benchmarks/hex-simd/NAME.java`.

Check the repaired classfile shape and all reference method bodies without
starting Java (constant-pool entries normalize the deliberate class rename):

```sh
python3 -B "$HEX_HANDOFF/CheckClassShape.py" \
  --baseline-jmod "$HEX_BASE_JDK/jmods/java.base.jmod" \
  --candidate-class "$HEX_CANDIDATE_JDK/jmods/java.base.jmod" \
  --reference-class "$HEX_HARNESS/patch/java/util/HexFormatReference.class"
```

The scalar formatter must retain the baseline's normalized bytecode, the
eligibility helper must fit the 35-byte ordinary inline budget, and range
parsing must stay below x64's 325-byte hot inline budget. These are structural
checks, not proof that any particular caller inlines or becomes faster.

## Freeze and check identities before timing

The retained `dfa1a6da197` images and receipt belong to the failed historical
comparison. They cannot qualify this repaired product or the recompiled
reference. Preserve them unchanged. A future authorized comparison requires
normal images from the exact source pins above and a newly compiled reference;
record their receipt only after their normal build and correctness checks.
The repaired source was tested with patched classes, not a rebuilt image; no
new image receipt or timing authority is implied by those development tests.
Always retain the independent receipt SHA-256; never regenerate a receipt
around changed artifacts merely to make checks pass.

For a future authorized native build, immediately after the normal build, native
correctness and harness compilation above, record those outputs without running
another build, Java process or measurement:

```sh
python3 -B "$HEX_HANDOFF/identity.py" --record-receipt "$HEX_WORK/build-receipt.json" \
  --source-root "$HEX_WORK" --baseline "$HEX_BASE_JDK" --candidate "$HEX_CANDIDATE_JDK" \
  --harness "$HEX_HARNESS" --package-revision "$HEX_PACKAGE"
```

Retain the printed SHA-256 with the source/build/correctness records. Set
`HEX_RECEIPT` and `HEX_RECEIPT_SHA` to the frozen receipt and expected hash before
authorizing timing. Recording is an identity declaration of the normal build
steps; it does not retroactively attest the source of arbitrary supplied binaries.

The runner fails closed on a changed receipt, source/package revision, dirty
checkout, source hash, Cargo lock, release/native build profile, module/JVM/
native-library hash, CDS archive, compiled Java harness or reference patch.
The complete harness inventory and baseline reference derivation are verified.
The declared Java sources must match the build receipt's workload source hashes.
The configured spec snapshot must match both the receipt and actual output spec.

Before the first timed process, logging checks require the exact candidate
library path and platform suffix (`.so` or `.dylib`), require empty/tiny calls
to keep it unloaded, and reject unexpected names/paths or duplicate loads.
Separate unmeasured first-use checks require the expected baseline/disabled/
enabled native availability. These checks are not cold timing observations.
Identity checks run again after execution, including after a run failure; a
post-run mismatch overrides any provisional performance win. `result.json`
is authoritative; `acceptance.json` alone is insufficient.

Offline regressions use temporary fixtures and mock all process creation:

```sh
python3 -B -m unittest discover -s "$HEX_HANDOFF" -p 'Test*.py'
```

## One complete comparison, only after authority and source review

```sh
python3 -B "$HEX_HANDOFF/compare.py" --execute \
  --baseline "$HEX_BASE_JDK" --candidate "$HEX_CANDIDATE_JDK" \
  --harness "$HEX_HARNESS" --output "$HEX_WORK/arm-results" \
  --receipt "$HEX_RECEIPT" --receipt-sha256 "$HEX_RECEIPT_SHA" \
  --package-revision "$HEX_PACKAGE"
```

The standard subprocess launcher uses the source-derived grid and unchanged
numerical thresholds: 72 steady JVMs, 225 fresh cold JVMs; baseline, same-binary
disabled and enabled states; three steady forks; Serial/G1/ZGC and G1 compact
strings off; tiny/cutoff/large, fixed mixed, digest, decorated, ranges,
CharSequence/Appendable and malformed fallbacks. Cold uses empty/tiny, first
eligible calls and one fixed 128-pair session. All allocation, conversion and
JNI costs remain in complete public calls. No UUID work is present.

The launcher bounds measurement work to two hours, uses a fresh output directory
and preserves stdout/stderr, argv/exit status, raw samples, allocation, process
wall/call intervals and pre/post identities. Gates run after each completed
process: steady comparisons need one complete five-sample operand per relevant
state; cold comparisons need five distinct rounds per relevant state/mode.
A failing comparison writes `early-stop.json` and stops before launching another
process, even if the third state or later collectors/forks have not run. Missing
operands are pending, never passes. Only a complete grid can produce a successful
`acceptance.json`; `result.json` remains authoritative, including if final identity
verification overrides an early numerical result. Cancellation kills/reaps the
direct child and records its exit status before final identity verification.

The original acceptance/noise/regression gates are retained; there is no automatic retry, threshold tuning, extra fork,
new workload or required x64 campaign. A positive result applies to the actual
host/backend. A clean gate failure rejects the current optimization there;
noise/incomplete evidence does not justify default enablement. The adoption
policy is proven default-on with an opt-out or do not merge; keeping this draft
opt-in indefinitely is not a successful adoption result. This repair authorizes
no timing campaign and makes no new performance claim.

## Repair validation and remaining limits

The repair's ordinary development validation compiled just the changed Java
classes with the normal java.base string-concatenation setting and patched
them into the retained native JDK for correctness testing. HexFormatTest and
BulkHexFormatTest passed, including Serial/G1/ZGC, both compact-string modes,
and disabled/absent native-library fallbacks. Classfile checks found the scalar
formatter equal to baseline (269 bytes), the plain-format helper at 24 bytes,
and range parsing at 303 bytes. All 45 compiled reference method bodies now
match baseline after the deliberate rename is normalized. An inlining log
confirmed the small helper inlined; some range-parser calls still refused
inlining because compiled code was large. No runtime inlining or speedup is
guaranteed by the repaired bytecode budget.

The offline tests cover partial/pairwise gates, five-round cold completeness,
reversed state arrival, all numerical gate families, preserved failed records,
full-grid-only success, cancellation/timeout cleanup, final result status and
post-identity precedence. No live campaign, new supervisor, infrastructure
repair or new performance sample was used. Thresholds, workloads, sizes and
forks are unchanged. The shared Supplier invocation profile in Bench remains
a possible compilation confound; early control checks reject observed drift
rather than attributing it. The repair has not established a crossover or
default-on adoption on any platform. No timing run is currently authorized.
