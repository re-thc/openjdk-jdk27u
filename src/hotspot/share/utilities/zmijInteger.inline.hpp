/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

#ifndef SHARE_UTILITIES_ZMIJINTEGER_INLINE_HPP
#define SHARE_UTILITIES_ZMIJINTEGER_INLINE_HPP

#include <type_traits>

// The caller reserves exact text. Use bounded stores when supported; otherwise
// isolate the vendor wide stores in scratch.
template <typename Int, bool utf16>
inline int hotspot_zmij_integer(void* output, int index, Int value) {
  static_assert(std::is_signed_v<Int>, "The signed adapter requires a signed type");
  using Unsigned = std::make_unsigned_t<Int>;
  if (Unsigned(value) + 9 <= 18) {
    using Char = std::conditional_t<utf16, uint16_t, char>;
    Char* chars = static_cast<Char*>(output);
    bool negative = value < 0;
    chars[--index] = Char('0' + (negative ? -value : value));
    if (negative) {
      chars[--index] = '-';
    }
    return index;
  }
#if ZMIJ_USE_U64_LANE_CHAIN
  if constexpr (sizeof(Int) == 8 && !utf16) {
    // The preceding exact-store fast path covered -9..9. Every remaining
    // signed long has 2..19 magnitude digits. Keep output bounds exact.
    bool negative = value < 0;
    uint64_t magnitude = negative ? -uint64_t(value) : uint64_t(value);
    int digits = zmij::detail::count_digits(magnitude, zmij::detail::static_data);
    int start = index - digits - int(negative);
    char* destination = static_cast<char*>(output) + start;
    if (negative) *destination++ = '-';
    zmij::detail::itoa_impl<uint64_t, true>(destination, magnitude, digits);
    return start;
  }
#endif
  char scratch[32] = {};
  char* end = zmij::detail::itoa_signed<Int>(scratch, value);
  int length = int(end - scratch);
  int start = index - length;
  if constexpr (!utf16) {
    memcpy(static_cast<char*>(output) + start, scratch, length);
  } else {
    uint16_t* chars = static_cast<uint16_t*>(output) + start;
    for (int i = 0; i < length; ++i) {
      chars[i] = uint8_t(scratch[i]);
    }
  }
  return start;
}

#endif // SHARE_UTILITIES_ZMIJINTEGER_INLINE_HPP
