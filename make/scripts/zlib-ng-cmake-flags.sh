#!/usr/bin/env bash
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

# Preserve argument boundaries when passing MSVC flags through CMake.
set -euo pipefail
cache_file=$1
path_tool=$2
shift 2
: > "$cache_file"
variable=
flags=
write_flags() {
    [[ -n $variable ]] || return 0
    local equals='='
    while [[ $flags == *"]$equals]"* ]]; do
        equals+="="
    done
    printf 'set(%s [%s[%s]%s] CACHE STRING "" FORCE)\n' \
        "$variable" "$equals" "$flags" "$equals" >> "$cache_file"
}
for flag in "$@"; do
    case $flag in
        --cflags | --ldflags)
            write_flags
            if [[ $flag == --cflags ]]; then
                variable=CMAKE_C_FLAGS
            else
                variable=CMAKE_EXE_LINKER_FLAGS
            fi
            flags=
            continue
            ;;
    esac
    flag=$("$path_tool" -m print "$flag")
    # Native paths from configure's /pathmap settings also need mixed form.
    case $flag in
        -I* | /I* | -libpath:* | /libpath:* | -pathmap:* | /pathmap:*)
            flag=${flag//\\//}
            ;;
    esac
    flag=${flag//\\/\\\\}
    flag=${flag//\"/\\\"}
    flags+=" \"$flag\""
done
write_flags
