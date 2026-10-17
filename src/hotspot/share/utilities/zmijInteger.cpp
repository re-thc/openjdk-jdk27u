/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

#include "runtime/vm_version.hpp"
#include "utilities/zmijInteger.hpp"

#define ZMIJ_HOTSPOT_INTEGER_ONLY
#define ZMIJ_USE_SSE4_1 0
#define ZMIJ_USE_AVX2 0
#define ZMIJ_USE_FMA 0
#include "utilities/zmij/zmij-int-impl.hpp"
#include "utilities/zmijInteger.inline.hpp"

ZmijInteger::Formatter ZmijInteger::formatter() {
#if defined(AMD64) && !defined(ZERO)
  if (VM_Version::supports_sse4_1()) {
    return format_sse41;
  }
#endif
  return format;
}

int ZmijInteger::format(void* output, uint64_t bounds, uint64_t bits, int format) {
  return hotspot_zmij_integer(output, bounds, bits, format,
                             zmij::detail::itoa_signed<int32_t>, zmij::detail::itoa_signed<int64_t>);
}
