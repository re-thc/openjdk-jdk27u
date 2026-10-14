#!/usr/bin/env bash
set -euo pipefail
kind=${1:-base}
root=$DIAGNOSTIC_ROOT
here=$(cd "$(dirname "$0")" && pwd)
source_dir=$root/source
mkdir -p "$root/evidence" "$root/images"
export PATH="$root/mold/bin:$PATH"
export CC=gcc-16 CXX=g++-16
if [[ $kind == base ]]; then
  git clone --filter=blob:none --no-checkout https://github.com/re-thc/openjdk-jdk27u "$source_dir"
  git -C "$source_dir" fetch origin 6d264328aefdc3ceff659360ead6567a8e36190c
  git -C "$source_dir" checkout --detach 6d264328aefdc3ceff659360ead6567a8e36190c
  cd "$source_dir"
  bash configure --with-conf-name=diagnostic --disable-desktop --enable-headless-only \
    --enable-jvm-feature-serialgc --enable-jvm-feature-g1gc --enable-jvm-feature-zgc \
    --disable-jvm-feature-epsilongc --disable-jvm-feature-parallelgc --disable-jvm-feature-shenandoahgc \
    --with-boot-jdk="$root/boot" --with-debug-level=fastdebug --with-jobs=4 \
    --with-version-opt=port-audit --with-version-build=1 --with-extra-ldflags=-fuse-ld=mold
  make CONF=diagnostic JOBS=4 BUILD_LIBJVM_handshake.cpp_CXXFLAGS=-Wno-error=nonnull images
  cp -aL build/diagnostic/images/jdk "$root/images/base"
  cp build/diagnostic/spec.gmk "$root/evidence/spec.gmk"
  cp build/diagnostic/configure.log "$root/evidence/configure.log"
  git rev-parse HEAD HEAD^{tree} > "$root/evidence/baseline-source.txt"
  git status --porcelain --untracked-files=no >> "$root/evidence/baseline-source.txt"
  sha256sum src/hotspot/share/opto/vectornode.cpp > "$root/evidence/baseline-vectornode.sha256"
  mkdir -p "$root/wb" "$root/profiler"
  "$root/boot/bin/javac" -sourcepath test/lib -d "$root/wb" test/lib/jdk/test/whitebox/WhiteBox.java
  "$root/boot/bin/javac" -cp "$root/wb:$root/jmh/*" -d "$root/profiler" "$here/DiagnosticProfiler.java" "$here/CaptureAgent.java"
  printf 'Premain-Class: diagnostic.CaptureAgent\n' > "$root/agent-manifest.mf"
  "$root/boot/bin/jar" --create --file "$root/capture-agent.jar" --manifest "$root/agent-manifest.mf" -C "$root/profiler" .
  gcc-16 --version > "$root/evidence/toolchain.txt"
  g++-16 --version >> "$root/evidence/toolchain.txt"
  mold --version >> "$root/evidence/toolchain.txt"
  lscpu > "$root/evidence/hardware.txt"
else
  cd "$source_dir"
  git fetch origin 81ed5dfcfc5118b20857dceabe3571c37ea57827
  file=src/hotspot/share/opto/vectornode.cpp
  git show 81ed5dfcfc5118b20857dceabe3571c37ea57827:"$file" > "$root/evidence/candidate-vectornode.cpp"
  echo "607366a00d75c9e67dfc4a7149622c337c45a1a2c4d14f06f6e840d685870561  $root/evidence/candidate-vectornode.cpp" | sha256sum -c
  test "$(git diff --name-only 6d264328aefdc3ceff659360ead6567a8e36190c 81ed5dfcfc5118b20857dceabe3571c37ea57827 -- src)" = "$file"
  cp "$file" "$root/evidence/baseline-vectornode.cpp"
  restore() { cp "$root/evidence/baseline-vectornode.cpp" "$file"; }
  trap restore EXIT
  cp "$root/evidence/candidate-vectornode.cpp" "$file"
  git diff --binary > "$root/evidence/candidate-production.patch"
  make CONF=diagnostic JOBS=4 BUILD_LIBJVM_handshake.cpp_CXXFLAGS=-Wno-error=nonnull hotspot
  cp -a "$root/images/base" "$root/images/candidate"
  cp build/diagnostic/support/modules_libs/java.base/server/libjvm.so "$root/images/candidate/lib/server/libjvm.so"
  restore
  trap - EXIT
fi
