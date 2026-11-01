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

#include <array>
#include <charconv>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include "zmij-int.cc"
#include "utilities/zmijInteger.inline.hpp"

static uint64_t checks;

static void check(uint64_t bits, bool wide) {
  int64_t signed64;
  int32_t signed32;
  uint32_t raw32 = uint32_t(bits);
  memcpy(&signed64, &bits, sizeof(signed64));
  memcpy(&signed32, &raw32, sizeof(signed32));
  char text[32];
  auto expected = wide ? std::to_chars(text, text + sizeof(text), signed64)
                       : std::to_chars(text, text + sizeof(text), signed32);
  int length = int(expected.ptr - text);
  for (int coder = 0; coder <= 1; ++coder) {
    for (int offset : {0, 1, 7}) {
      std::array<uint16_t, 64> storage;
      memset(storage.data(), 0xa5, sizeof(storage));
      unsigned char* output = reinterpret_cast<unsigned char*>(storage.data()) + 16;
      int index = offset + length;
      int start = wide
          ? (coder == 0 ? hotspot_zmij_integer<int64_t, false>(output, index, signed64)
                        : hotspot_zmij_integer<int64_t, true>(output, index, signed64))
          : (coder == 0 ? hotspot_zmij_integer<int32_t, false>(output, index, signed32)
                        : hotspot_zmij_integer<int32_t, true>(output, index, signed32));
      if (start != offset) __builtin_abort();
      for (int n = 0; n < length; ++n) {
        if (coder == 0) {
          if (output[offset + n] != uint8_t(text[n])) __builtin_abort();
        } else {
          uint16_t c;
          memcpy(&c, output + (offset + n) * 2, 2);
          if (c != uint8_t(text[n])) __builtin_abort();
        }
      }
      auto* all = reinterpret_cast<unsigned char*>(storage.data());
      int begin = 16 + (offset << coder);
      int end = begin + (length << coder);
      for (size_t n = 0; n < sizeof(storage); ++n) {
        if ((int(n) < begin || int(n) >= end) && all[n] != 0xa5) __builtin_abort();
      }
      ++checks;
    }
  }
}

int main() {
  for (uint64_t bits : {UINT64_C(0), UINT64_C(1), UINT64_C(9), UINT64_C(10),
                        UINT64_C(99), UINT64_C(100), UINT64_C(0x7fffffff),
                        UINT64_C(0x80000000), UINT64_C(0x7fffffffffffffff),
                        UINT64_C(0x8000000000000000), UINT64_MAX}) {
    check(bits, false);
    check(bits, true);
  }
  for (uint64_t power = 1; power <= UINT64_C(10000000000000000000); power *= 10) {
    for (uint64_t bits : {power - 1, power, power + 1, -power - 1, -power, -power + 1}) {
      check(bits, false);
      check(bits, true);
    }
    if (power == UINT64_C(10000000000000000000)) break;
  }
  std::mt19937_64 random(0x1deca1);
  for (int n = 0; n < 100000; ++n) {
    uint64_t bits = random();
    check(bits, false);
    check(bits, true);
  }
  printf("%llu guarded production-bridge checks passed\n", (unsigned long long) checks);
}
