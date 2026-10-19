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
# Replace only the RNG object in a PRIVATE copy of a complete product image.
# C++ exceptions must originate in the same static C++ runtime/unwinder as
# the product boundary. A foreign LD_PRELOAD throw is not a valid substitute.
root=$(cd "$(dirname "$0")/.." && pwd)
image=${1:?complete product image}
objects=${2:?configured java.base libprimitivesort object directory}
highway=${3:?product Highway source directory}
test_image="$root/images/seed-failure-test"
if [[ -e "$test_image" ]]; then echo 'Use a fresh test-image destination.' >&2; exit 1; fi
mkdir -p "$root/build" "$root/images" "$root/evidence"
cp -a "$image" "$test_image"
g++ -O3 -fPIC -fvisibility=hidden -fno-rtti -std=c++17 -I"$highway" -c "$root/src/throw-seed-component.cpp" -o "$root/build/throw-seed-component.o"
native_objects=("$objects/PrimitiveSort.o" "$objects/abort.o" "$root/build/throw-seed-component.o" "$objects/targets.o")
nm -C "$image/lib/libprimitivesort.so" > "$root/build/seed-product-symbols.txt"
if rg -q 'SortI32Asc' "$root/build/seed-product-symbols.txt"; then native_objects+=("$objects/vqsort_i32a.o"); fi
native_objects+=("$objects/vqsort_i64a.o")
sha256sum "${native_objects[@]}" > "$root/evidence/seed-product-objects.sha256"
g++ -shared -m64 -fuse-ld=mold -Wl,-z,defs,-z,relro,-z,now,--no-as-needed,--exclude-libs,ALL,-z,noexecstack,-O1 -Wl,-soname,libprimitivesort.so -o "$test_image/lib/libprimitivesort.so" "${native_objects[@]}" -static-libstdc++ -static-libgcc -lm
# Compile NativePrimitiveSort from the matching product source into build first.
LD_PRELOAD="$root/build/malloc-trace.so" "$test_image/bin/java" -Xmx1g -cp "$root/build" NativePrimitiveSort quick > "$root/evidence/seed-failure.out" 2> "$root/evidence/seed-failure.err"
