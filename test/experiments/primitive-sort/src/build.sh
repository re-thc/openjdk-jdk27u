#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

set -euo pipefail
if [[ -f ${TOOLCHAIN_SETUP:-/workspace/toolchains/activate.sh} ]]; then
  source "${TOOLCHAIN_SETUP:-/workspace/toolchains/activate.sh}"
fi
root=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$root/build" "$root/evidence"
cd "$root/build"
deps="$root/deps"
rustc -Vv > "$root/build/rustc-version.txt"
task_rust_sysroot=$(rustc --print sysroot)
sha256sum "$task_rust_sysroot"/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-*.rlib > "$root/build/rust-libcore.sha256"
if ! rg -q 'commit-hash: b940084d7eb6a299eb4bfeb8e34901bc051e7ac4' "$root/build/rustc-version.txt"; then
  echo 'This experiment requires the pinned Rust 1.99.0 implementation.' >&2
  exit 1
fi
rustc --edition=2024 --crate-type=staticlib -C opt-level=3 -C target-cpu=x86-64-v3 -C panic=abort "$root/src/rust.rs" -o librustsort.a
rustc --edition=2024 --crate-name=primitive_sort_host --crate-type=cdylib -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C lto=thin -C panic=abort "$root/src/rust-host.rs" -o librustsort_host.so
g++ -O3 -DNDEBUG -fPIC -std=c++17 -march=x86-64-v3 -I"$deps/xss/src" -c "$root/src/xss.cpp" -o xss2.o
g++ -O3 -DNDEBUG -fPIC -std=c++17 -march=x86-64-v4 -DXSS_NAME=xss5 -I"$deps/xss/src" -c "$root/src/xss.cpp" -o xss5.o
flags=(-O3 -DNDEBUG -fPIC -std=c++17 -march=x86-64-v3 -DHWY_WANT_AVX3_ZEN4 -I"$deps/highway")
for name in hwy/abort hwy/targets hwy/os_rng hwy/print hwy/contrib/sort/vqsort_i32a hwy/contrib/sort/vqsort_i64a; do
  g++ "${flags[@]}" -c "$deps/highway/$name.cc" -o "$(basename "$name").o"
done
g++ "${flags[@]}" -I"$deps/ips2ra/include" -I"$deps/tbb/usr/include" -I"$deps/pdqsort" -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -c "$root/src/backends.cpp" -o backends.o
g++ -shared -Wl,-z,noexecstack -Wl,-rpath,"$root/build" -L. -o libbackends.so backends.o xss2.o xss5.o abort.o targets.o os_rng.o print.o vqsort_i32a.o vqsort_i64a.o librustsort.a -lrustsort_host -ldl -lpthread
g++ -O3 -fPIC -c "$root/src/leaf.cpp" -o leaf.o
g++ -shared -Wl,-z,noexecstack -Wl,-rpath,"$root/build" -o libsimdsort.so leaf.o -L. -lbackends -ldl
g++ -O2 -std=c++17 -rdynamic "$root/src/guards.cpp" -L. -Wl,-rpath,"$root/build" -lbackends -o guards
g++ "${flags[@]}" -I"$deps/ips2ra/include" -I"$deps/tbb/usr/include" -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -shared "$root/src/parallel.cpp" -pthread -Wl,-l:libtbb.so.12 -o libparallel.so
g++ "${flags[@]}" -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -shared "$root/src/isa-probe.cpp" -ldl -o libisaprobe.so
gcc -O2 -fPIC -shared "$root/src/fail-malloc.c" -ldl -o fail-malloc.so
gcc -O2 -fPIC -shared -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" "$root/src/malloc-trace.c" -ldl -o malloc-trace.so
javac -d . "$root"/src/*.java
