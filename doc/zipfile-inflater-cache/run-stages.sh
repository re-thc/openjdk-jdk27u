#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
# Sourced by the supervised fresh or retained-image entry point.
source "$Q/test-selections.sh"
phase correctness
for gc in Serial G1 Z; do
  if [[ ${ZIP_REUSE_MODE:-0} == 1 ]]; then
    if [[ $gc != Serial ]]; then
      timeout --kill-after=30s 30m python3 -E "$Q/run-retained-jtreg.py" \
        "$BASE_TREE" "$BASE_JDK" "$ROOT" base "$gc" "$consumer_tests" \
        > "$ROOT/results/base-$gc-tests.log" 2>&1
    fi
    timeout --kill-after=30s 30m python3 -E "$Q/run-retained-jtreg.py" \
      "$CANDIDATE_TREE" "$CANDIDATE_JDK" "$ROOT" candidate "$gc" "$candidate_tests" \
      > "$ROOT/results/candidate-$gc-tests.log" 2>&1
  else
    (cd "$BASE_TREE" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test JDK_IMAGE_DIR="$BASE_JDK" \
      TEST="$consumer_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m -Djava.io.tmpdir=$ROOT/tmp") \
      > "$ROOT/results/base-$gc-tests.log" 2>&1
    cp -a "$BASE_TREE/build/zip-qual/test-results" "$ROOT/results/base-$gc-test-results"
    (cd "$CANDIDATE_TREE" && timeout --kill-after=30s 30m make CONF=zip-qual JOBS=4 test JDK_IMAGE_DIR="$CANDIDATE_JDK" \
      TEST="$candidate_tests" JTREG="JOBS=2;JAVA_OPTIONS=-XX:+Use${gc}GC -Xmx128m -Djava.io.tmpdir=$ROOT/tmp") \
      > "$ROOT/results/candidate-$gc-tests.log" 2>&1
    cp -a "$CANDIDATE_TREE/build/zip-qual/test-results" "$ROOT/results/candidate-$gc-test-results"
  fi
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
    if [[ $label == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi
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
if [[ ${ZIP_REUSE_MODE:-0} == 1 ]]; then
  python3 -E "$Q/retained-images.py" "$PREVIOUS" \
    > "$ROOT/results/before-timing-provenance.json"
fi
phase timing-wait
while [[ ! -f "$ROOT/.timing-ready" ]]; do sleep 0.1; done
phase timing

python3 "$Q/run-qualification.py" --baseline "$BASE_JDK" --candidate "$CANDIDATE_JDK" \
  --workload-jar "$ROOT/workload.jar" --fixture "$ROOT/fixtures" \
  --out "$ROOT/results/timing"

phase complete
