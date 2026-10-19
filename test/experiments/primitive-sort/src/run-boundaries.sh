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
root=$(cd "$(dirname "$0")/.." && pwd)
java="$1"
common=(--enable-native-access=ALL-UNNAMED -Xms1g -Xmx2g -XX:CICompilerCount=2 -Dbackend.lib="$root/build/libbackends.so" -cp "$root/build")
# Fixed campaign: five interleaved algorithm rounds per cell. Every observation retained.
taskset -c 0,1,3,4 "$java" "${common[@]}" -Dmode=copy BackendBench > "$root/evidence/boundary-copy.csv" 2> "$root/evidence/boundary-copy.err"
taskset -c 0,1,3,4 "$java" "${common[@]}" -Dmode=leaf -Dsizes=0,1,15,31,43,44,45,64,257,1023,1024,1025,4095,4096,4097,16384,65535,65536 BackendBench > "$root/evidence/boundary-leaf.csv" 2> "$root/evidence/boundary-leaf.err"
