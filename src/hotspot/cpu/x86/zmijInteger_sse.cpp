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

#include "utilities/zmijInteger.hpp"

#if defined(AMD64) && !defined(ZERO)
#if defined(__clang__)
#pragma clang attribute push(__attribute__((target("sse4.1"))), apply_to = function)
#elif defined(__GNUC__)
#pragma GCC push_options
#pragma GCC target("sse4.1")
#endif
#define ZMIJ_USE_SSE4_1 1
#define ZMIJ_USE_AVX2 0
#define ZMIJ_USE_FMA 0
#define ZMIJ_HOTSPOT_INTEGER_ONLY
#define zmij hotspot_zmij_integer_sse41
#include "utilities/zmij/zmij-int-impl.hpp"
#undef zmij
#include "utilities/zmijInteger.inline.hpp"

int ZmijInteger::format_sse41(void* output, uint64_t bounds, uint64_t bits, int format) {
  return hotspot_zmij_integer(output, bounds, bits, format,
                             hotspot_zmij_integer_sse41::detail::itoa_signed<int32_t>,
                             hotspot_zmij_integer_sse41::detail::itoa_signed<int64_t>);
}
#if defined(__clang__)
#pragma clang attribute pop
#elif defined(__GNUC__)
#pragma GCC pop_options
#endif
#endif // AMD64 && !ZERO
