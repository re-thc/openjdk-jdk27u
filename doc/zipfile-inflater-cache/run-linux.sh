#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
# Invoke only through supervise-linux.py after execution is authorized.
set -euo pipefail
: "${ZIP_QUAL_SUPERVISED:?Use the outer supervisor}"
ROOT=${1:?fresh supervised workspace}
C=${2:?full reviewed commit SHA}
shift 2
configure_options=("$@")
for option in "${configure_options[@]}"; do
  case "$option" in
    --with-toolchain-path=*|--with-freetype=*|--with-freetype-include=*|--with-freetype-lib=*|\
    --with-cups-include=*|--with-fontconfig-include=*|--with-alsa-include=*|--with-alsa-lib=*|\
    --x-includes=*|--x-libraries=*) ;;
    *) echo "Only installed dependency-path options are accepted: $option" >&2; exit 2 ;;
  esac
done
: "${BOOT_JDK:?installed Boot JDK 27 required}"
: "${JTREG_HOME:?installed jtreg 8.3 required}"
phase() {
  printf "%s\n" "$1" > "$ROOT/.qualification-phase.next"
  mv -f -- "$ROOT/.qualification-phase.next" "$ROOT/.qualification-phase"
}
jdk_image() {
  printf '%s/%s/build/zip-qual/images/jdk\n' "$ROOT" "$1"
}
phase source-check
python3 -E -B "${BASH_SOURCE[0]%/*}/test-image-layout.py"
phase checkout
B=89885a6288e7aaabd01678a704a586272c0f96e3
git fetch origin master review/zipfile-compact-inflater-cache
test "$(git rev-parse "$C^{commit}")" = "$C"
git cat-file -e "$C:doc/zipfile-inflater-cache/run-qualification.py"
test "$(git rev-parse "$C:src/java.base/share/classes/java/util/zip/ZipFile.java")" = 9943e4f9635c2480f58bdf7c0116432eee00ad51
test "$(git rev-parse "$C:test/jdk/java/util/zip/ZipFile/InflaterCache.java")" = f79e29971e1c8b6dcedea8420a74ad80db914bd1
test "$(git rev-parse "$C:doc/zipfile-inflater-cache/ZipCacheFootprint.java")" = e720f00727bb6c030896d6f914f94dad8d664a47
git worktree add --detach "$ROOT/base" "$B"
git worktree add --detach "$ROOT/candidate" "$C"
mkdir -p "$ROOT/results" "$ROOT/classes"
{
  printf 'baseline=%s\ncandidate=%s\n' "$B" "$C"
  gcc --version
  g++ --version
  "$BOOT_JDK/bin/java" -version
} > "$ROOT/results/input-identities.log" 2>&1
for tree in base candidate; do
  cd "$ROOT/$tree"
  phase "build-$tree"
  timeout --kill-after=30s 10m bash bin/configure-dev --with-conf-name=zip-qual --with-debug-level=release \
    --with-jobs=4 --with-memory-size=8192 --with-boot-jdk="$BOOT_JDK" \
    --with-jtreg="$JTREG_HOME" --with-zlib=system "${configure_options[@]}" \
    > "$ROOT/results/$tree-configure.log" 2>&1
  timeout --kill-after=30s 90m make CONF=zip-qual JOBS=4 jdk-image \
    > "$ROOT/results/$tree-build.log" 2>&1
  image=$(jdk_image "$tree")
  test -x "$image/bin/java" || { echo "Missing packaged launcher: $image/bin/java" >&2; exit 1; }
  for file in release lib/modules lib/server/libjvm.so lib/libzip.so include/jni.h include/linux/jni_md.h; do
    test -f "$image/$file" || { echo "Missing packaged image file: $image/$file" >&2; exit 1; }
  done
  cp build/zip-qual/spec.gmk "$ROOT/results/$tree-spec.gmk"
  cp "$image/release" "$ROOT/results/$tree-release"
  sha256sum "$image/lib/modules" "$image/lib/server/libjvm.so" \
    "$image/lib/libzip.so" > "$ROOT/results/$tree-image-sha256.txt"
done
BASE_JDK=$(jdk_image base)
CANDIDATE_JDK=$(jdk_image candidate)
Q="$ROOT/candidate/doc/zipfile-inflater-cache"

phase correctness
cache_tests="test/jdk/java/util/zip/InflaterClose.java
test/jdk/java/util/zip/DeflaterDictionaryTests.java
test/jdk/java/util/zip/InflaterInputStream/MarkReset.java
test/jdk/java/util/zip/InflaterInputStream/TestAvailable.java
test/jdk/java/util/zip/InflaterInputStream/UnexpectedEndOfZlibStream.java
test/jdk/java/util/zip/ZipFile/DeleteTempJarTest.java
test/jdk/java/util/zip/ZipFile/FinalizeInflater.java
test/jdk/java/util/zip/ZipFile/InflaterCache.java
test/jdk/java/util/zip/ZipFile/InvalidCompressedSizeTest.java
test/jdk/java/util/zip/ZipFile/MultiThreadedReadTest.java
test/jdk/java/util/zip/ZipFile/ReadAfterClose.java
test/jdk/java/util/zip/ZipFile/ReleaseInflater.java
test/jdk/java/util/zip/ZipFile/ShortRead.java
test/jdk/java/util/zip/ZipFile/TestCleaner.java
test/jdk/java/util/zip/ZipFile/ZipFileSharedSourceTest.java"
consumer_tests="test/jdk/java/net/URLClassLoader/JarLoaderCloseTest.java
test/jdk/java/util/ServiceLoader/basic/ServiceLoaderBasicTest.java
test/jdk/java/util/jar/JarFile/mrjar/MultiReleaseJarAPI.java
test/jdk/java/util/jar/JarFile/VerifySignedJar.java
test/jdk/java/util/jar/JarFile/SignedJarFileGetInputStream.java
test/jdk/java/util/jar/JarFile/SignedJarPendingBlock.java"
for gc in Serial G1 Z; do
  (cd "$ROOT/base" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test JDK_IMAGE_DIR="$BASE_JDK" \
    TEST="$consumer_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m -Djava.io.tmpdir=$ROOT/tmp") \
    > "$ROOT/results/base-$gc-tests.log" 2>&1
  cp -a "$ROOT/base/build/zip-qual/test-results" "$ROOT/results/base-$gc-test-results"
  (cd "$ROOT/candidate" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test JDK_IMAGE_DIR="$CANDIDATE_JDK" \
    TEST="$cache_tests $consumer_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m -Djava.io.tmpdir=$ROOT/tmp") \
    > "$ROOT/results/candidate-$gc-tests.log" 2>&1
  cp -a "$ROOT/candidate/build/zip-qual/test-results" "$ROOT/results/candidate-$gc-test-results"
done
phase allocation
"$BOOT_JDK/bin/javac" -d "$ROOT/classes" "$Q/ZipCacheQualification.java" \
  "$Q/ZipCacheFootprint.java" "$Q/ZipInflaterProbe.java"
"$BOOT_JDK/bin/jar" --create --file "$ROOT/workload.jar" -C "$ROOT/classes" .
printf 'Premain-Class: ZipCacheFootprint\n' > "$ROOT/agent.mf"
"$BOOT_JDK/bin/jar" --create --file "$ROOT/footprint-agent.jar" \
  --manifest "$ROOT/agent.mf" -C "$ROOT/classes" .
gcc -shared -fPIC -O2 -I"$CANDIDATE_JDK/include" -I"$CANDIDATE_JDK/include/linux" \
  "$Q/zipalloc.c" -o "$ROOT/libzipalloc.so" -ldl
"$BOOT_JDK/bin/java" -cp "$ROOT/workload.jar" ZipCacheQualification prepare "$ROOT/fixtures"
for gc in Serial G1 Z; do
  for label in base candidate; do
    image=$(jdk_image "$label")
    timeout --kill-after=5s 30s "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC -Djava.io.tmpdir="$ROOT/tmp" \
      -cp "$ROOT/workload.jar" ZipCacheQualification lifecycle "$ROOT/fixtures" \
      > "$ROOT/results/$label-$gc-lifecycle.log" 2>&1
    timeout --kill-after=5s 30s "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC -Djava.io.tmpdir="$ROOT/tmp" \
      --add-opens java.base/java.util.zip=ALL-UNNAMED \
      --add-opens java.base/java.util=ALL-UNNAMED -javaagent:"$ROOT/footprint-agent.jar" \
      -cp "$ROOT/workload.jar" ZipCacheFootprint > "$ROOT/results/$label-$gc-footprint.log" 2>&1
    "$image/bin/java" -Xms128m -Xmx128m -XX:+Use${gc}GC -XX:+PrintFlagsFinal -version \
      > "$ROOT/results/$label-$gc-flags.log" 2>&1
    for width in 1 32; do
      LD_PRELOAD="$ROOT/libzipalloc.so" timeout --kill-after=5s 30s "$image/bin/java" \
        -Xms128m -Xmx128m -XX:+Use${gc}GC -Djava.io.tmpdir="$ROOT/tmp" --enable-native-access=ALL-UNNAMED \
        --add-opens java.base/java.util.zip=ALL-UNNAMED -Dmeasure=true \
        -Dallocator="$ROOT/libzipalloc.so" -cp "$ROOT/workload.jar" \
        ZipInflaterProbe "$width" 65536 1024 8 > "$ROOT/results/$label-$gc-native$width.log" 2>&1
    done
  done
done
python3 -E "$Q/check-allocation.py" "$ROOT/results"
# The supervisor acknowledges only after finishing any in-flight disk scan and
# checking the timing-log reserve. Atomic phase publication prevents empty reads.
phase timing-wait
while [[ ! -f "$ROOT/.timing-ready" ]]; do sleep 0.1; done
phase timing

python3 "$Q/run-qualification.py" --baseline "$BASE_JDK" --candidate "$CANDIDATE_JDK" \
  --workload-jar "$ROOT/workload.jar" --fixture "$ROOT/fixtures" \
  --out "$ROOT/results/timing"

phase complete
