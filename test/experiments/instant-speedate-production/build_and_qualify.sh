#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
# UNEXECUTED proposal. Enter only through the bounded PID namespace launcher.
set -euo pipefail
trap 'printf "%s\n" "STOPPED at line $LINENO; retained inner verdicts remain authoritative" > "$QUAL_ROOT/stage-stop.txt"' ERR
source /workspace/toolchains/activate.sh
export RUSTC=/workspace/toolchains/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rustc
export CARGO=/workspace/toolchains/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/cargo
unset CARGO_ENCODED_RUSTFLAGS RUSTC_WRAPPER RUSTC_WORKSPACE_WRAPPER CARGO_BUILD_RUSTC_WRAPPER CARGO_TARGET_DIR
export QUAL_BOOT=/workspace/toolchains/jdk27 QUAL_JTREG=/workspace/toolchains/jtreg83
tools="$QUAL_REVIEW/test/experiments/instant-speedate-production"
mkdir "$QUAL_ROOT/logs"
run=(python3 "$tools/deadline.py" --started "$QUAL_STARTED" --launch-audit "$QUAL_LAUNCH_AUDIT")
variants=(baseline cached enabled configured-off)
if test "$QUAL_STAGE" = causal; then variants=(previous enabled configured-off); fi
for variant in "${variants[@]}"; do
  revision=$QUAL_SHA
  case "$variant" in
    baseline|cached) revision=89885a6288e7aaabd01678a704a586272c0f96e3 ;;
    previous) revision=779753e390e43508372ac860fdf944a801c869c8 ;;
  esac
  "${run[@]}" --max-seconds 300 --log "$QUAL_ROOT/logs/checkout-$variant.log" --cwd "$QUAL_REVIEW" -- \
    git worktree add --detach "$QUAL_ROOT/$variant" "$revision"
done
if test "$QUAL_STAGE" = full; then
  "${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/prepare-cached.log" --cwd "$QUAL_REVIEW" -- \
    python3 "$tools/prepare_java_control.py" "$QUAL_ROOT/cached"
fi
"${run[@]}" --max-seconds 300 --log "$QUAL_ROOT/logs/cargo-cache.log" --cwd "$QUAL_ROOT/enabled" -- \
  "$CARGO" fetch --locked --offline --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
# Capture every configuration before generating the frozen provenance manifest.
for variant in "${variants[@]}"; do
  extra=()
  case "$variant" in enabled|previous) extra+=(--enable-instant-speedate) ;; configured-off) extra+=(--disable-instant-speedate) ;; esac
  "${run[@]}" --max-seconds 300 --log "$QUAL_ROOT/logs/configure-$variant.log" --cwd "$QUAL_ROOT/$variant" -- \
    bash bin/configure-dev --with-conf-name=qualification --with-jobs=4 \
      --with-debug-level=release --disable-javac-server \
      --with-boot-jdk="$QUAL_BOOT" --with-jtreg="$QUAL_JTREG" \
      --with-toolchain-path=/workspace/toolchains/gcc16/bin "${extra[@]}"
done
python3 - "$QUAL_ROOT" "$QUAL_SHA" "$QUAL_STARTED" "$tools" "${variants[@]}" <<'PY'
import sys
from pathlib import Path
sys.dont_write_bytecode=True
root=Path(sys.argv[1]);sys.path.insert(0,sys.argv[4])
from deadline import spec_values,write_provenance
values=spec_values(root/'enabled/build/qualification/spec.gmk')
pins={name:values[key] for name,key in [('make','MAKE'),('cc','CC'),('cxx','CXX'),('linker','LD')]}
pins.update({'boot-java':values['BOOT_JDK']+'/bin/java','boot-javac':values['BOOT_JDK']+'/bin/javac',
    'jtreg-jar':values['JT_HOME']+'/lib/jtreg.jar','mold':'/workspace/toolchains/mold/bin/mold'})
rust=Path(values['RUSTC_EXECUTABLE']).parent.parent
drivers=list((rust/'lib').glob('librustc_driver*.so'))
stdlibs=list((rust/'lib/rustlib'/values['SPEEDATE_RUST_TARGET']/'lib').glob('libstd-*.rlib'))
if len(drivers)!=1 or len(stdlibs)!=1:raise SystemExit('HOLD: ambiguous installed Rust compiler/std identity')
pins.update({'rustc-driver':drivers[0],'rust-std':stdlibs[0]})
# Pin the selected Rust sysroot libraries as well as the direct executables.
for path in (rust/'lib/rustlib'/values['SPEEDATE_RUST_TARGET']/'lib').glob('*'):
    if path.is_file():pins['rustlib:'+path.name]=path
for name in ['deadline.py','job_entry.py','launch_qualification.sh','build_and_qualify.sh',
        'qualification_matrix.py','disabled_comparison.py','QualificationProbe.java','ProductionProbe.java','OnLoad.c',
        'prepare_java_control.py','QUALIFICATION.md','RUNTIME_DISABLED_AUDIT.md']:
    pins['harness:'+name]=Path(sys.argv[4])/name
write_provenance(root/'provenance.json',root,sys.argv[2],float(sys.argv[3]),pins,sys.argv[5:])
PY
run+=(--provenance "$QUAL_ROOT/provenance.json")
check() {
  local name=$1
  local variant=$2
  shift 2
  if "${run[@]}" --max-seconds 600 --log "$QUAL_ROOT/logs/$name.log" --cwd "$QUAL_ROOT/$variant" -- "$@"; then
    return 0
  else
    local status=$?
    python3 - "$QUAL_ROOT" "$name" <<'PY'
import hashlib,json,re,sys
from pathlib import Path
root=Path(sys.argv[1]);name=sys.argv[2];log=root/'logs'/(name+'.log')
text=log.read_text(errors='replace') if log.is_file() else ''
proved=bool(re.search(r'TEST FAILURE|test result: FAILED|WARNING in native method|FATAL ERROR in native method|JNI DETECTED ERROR',text)
    or re.search(r'^(?:Exception in thread "[^"]+" )?java\.lang\.AssertionError(?:[:\s]|$)',text,re.MULTILINE))
path=root/'normal-check-stop.json'
if not path.exists():
    path.write_text(json.dumps(dict(status='NO-GO' if proved else 'INCONCLUSIVE',stage=name,
        reason='retained check failure' if proved else 'check did not complete; inspect raw log',
        log=str(log),sha256=hashlib.sha256(log.read_bytes()).hexdigest() if log.is_file() else None),indent=2)+'\n')
PY
    return "$status"
  fi
}
for variant in "${variants[@]}"; do
  "${run[@]}" --max-seconds 1800 --log "$QUAL_ROOT/logs/images-$variant.log" --cwd "$QUAL_ROOT/$variant" -- \
    make CONF=qualification JOBS=4 images
done
tests='test/jdk/java/time/test/java/time/TestInstantSpeedate.java test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java'
for variant in enabled configured-off; do
  check "junit-$variant" "$variant" \
    make CONF=qualification JOBS=1 run-test "TEST=$tests" \
      'TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m' \
      'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0'
done
if test "$QUAL_STAGE" = full; then
  tests='test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java'
  check junit-cached cached \
    make CONF=qualification JOBS=1 run-test "TEST=$tests" \
      'TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m' \
      'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0'
fi
readarray -t rust_values < <(python3 -c 'import json,sys; r=json.load(open(sys.argv[1]))["rust"]; print(r["cargo"]); print(r["rustc"]); print(r["target"]); print(r["cpu"])' "$QUAL_ROOT/provenance.json")
check rust-tests enabled \
  env -u CARGO_ENCODED_RUSTFLAGS CARGO_BUILD_JOBS=2 "RUSTC=${rust_values[1]}" \
    "RUSTFLAGS=-C target-cpu=${rust_values[3]} -C panic=unwind" "${rust_values[0]}" \
    test --frozen --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml \
    --target "${rust_values[2]}" --target-dir "$QUAL_ROOT/rust-tests"
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/rustc-version.log" --cwd "$QUAL_REVIEW" -- "$RUSTC" --version
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/cargo-version.log" --cwd "$QUAL_REVIEW" -- "$CARGO" --version
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/nm.log" --cwd "$QUAL_REVIEW" -- \
  nm -D --defined-only "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/readelf.log" --cwd "$QUAL_REVIEW" -- \
  readelf -W -l "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/ldd.log" --cwd "$QUAL_REVIEW" -- \
  ldd "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/os.log" --cwd "$QUAL_REVIEW" -- uname -a
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/cpu.log" --cwd "$QUAL_REVIEW" -- lscpu
"${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/cc-version.log" --cwd "$QUAL_REVIEW" -- \
  /workspace/toolchains/gcc16/bin/gcc --version
for variant in "${variants[@]}"; do
  image="$QUAL_ROOT/$variant/build/qualification/images/jdk"
  "${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/javap-$variant.log" --cwd "$QUAL_REVIEW" -- \
    "$image/bin/javap" -J-XX:ActiveProcessorCount=2 -J-Xms64m -J-Xmx512m \
      --system "$image" -p -c java.time.Instant
  "${run[@]}" --max-seconds 120 --log "$QUAL_ROOT/logs/vm-$variant.log" --cwd "$QUAL_REVIEW" -- \
    "$image/bin/java" -XX:ActiveProcessorCount=2 -Xms64m -Xmx512m \
      -XX:+PrintCommandLineFlags -XshowSettings:vm -version
done
if test "$QUAL_STAGE" = causal; then
  python3 "$tools/disabled_comparison.py" --repo "$QUAL_ROOT/enabled" \
    --root "$QUAL_ROOT" --candidate-sha "$QUAL_SHA" --started "$QUAL_STARTED" \
    --launch-audit "$QUAL_LAUNCH_AUDIT" --provenance "$QUAL_ROOT/provenance.json"
else
  python3 "$tools/qualification_matrix.py" --repo "$QUAL_ROOT/enabled" \
    --candidate-sha "$QUAL_SHA" --started "$QUAL_STARTED" \
    --launch-audit "$QUAL_LAUNCH_AUDIT" --provenance "$QUAL_ROOT/provenance.json" \
    --baseline "$QUAL_ROOT/baseline/build/qualification/images/jdk" \
    --cached "$QUAL_ROOT/cached/build/qualification/images/jdk" \
    --enabled "$QUAL_ROOT/enabled/build/qualification/images/jdk" \
    --configured-off "$QUAL_ROOT/configured-off/build/qualification/images/jdk" \
    --out "$QUAL_ROOT/runtime"
fi
