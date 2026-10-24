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

#include <cinttypes>
#include <cstdio>

#define ZMIJ_HOTSPOT_SHORTEST_ONLY
#include "zmij.cc"
#include "utilities/zmijMetadata.inline.hpp"

int main() {
  static_assert(sizeof(double) == 8 && sizeof(float) == 4);
  static_assert(sizeof(decltype(zmij::detail::to_decimal(1.0).sig)) == 8);
  for (int e = -307; e <= 341; ++e) {
    auto cache = static_data.pow10_significands[e];
    printf("T %d %" PRIx64 " %" PRIx64 "\n", e, cache.hi, cache.lo);
  }
  uint64_t bits;
  while (scanf("%" SCNx64, &bits) == 1) {
    uint64_t packed = hotspot_zmij_decimal_metadata(bits);
    uint64_t sig = 0;
    int exp = 0;
    if (bits > 128 && bits < UINT64_C(0x7ff0000000000000)) {
      double value;
      memcpy(&value, &bits, sizeof(value));
      auto decimal = zmij::detail::to_decimal(value);
      sig = decimal.sig;
      exp = decimal.exp;
    }
    printf("M %" PRIx64 " %" PRIx64 " %" PRIu64 " %d\n",
           bits, packed, sig, exp);
  }
}
