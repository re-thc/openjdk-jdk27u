/*
 * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2024, Alibaba Group Holding Limited. All Rights Reserved.
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

#ifndef SHARE_UTILITIES_ZMIJMETADATA_INLINE_HPP
#define SHARE_UTILITIES_ZMIJMETADATA_INLINE_HPP

// Included after zmij-impl.hpp. The vendor updater compiles this same bridge
// and checks its table/representation assumptions with exact integer arithmetic.
inline uint64_t hotspot_zmij_decimal_metadata(uint64_t bits) {
  // This pure entry is total, even if C2 removes or commons repeated calls.
  if (bits <= 128 || bits >= UINT64_C(0x7ff0000000000000)) {
    return 0;
  }
  double value;
  memcpy(&value, &bits, sizeof(value));
  auto decimal = zmij::detail::to_decimal(value);
  int bq = int(bits >> 52);
  int q = bq == 0 ? -1074 : bq - 1075;
  uint64_t c = (bits & UINT64_C(0xfffffffffffff)) | (bq != 0 ? UINT64_C(1) << 52 : 0);
  bool irregular = c == (UINT64_C(1) << 52) && q != -1074;
  // Use DoubleToDecimal's exponent so the significand and both flags fit in
  // one long. Zmij.split derives this same exponent without a native call.
  int k = int((int64_t(q) * INT64_C(661971961083) - (irregular ? INT64_C(274743187321) : 0)) >> 41);
  uint64_t f = decimal.sig;
  if (decimal.exp < k) {
    return 0;
  }
  for (int e = decimal.exp; e > k; --e) {
    if (f > ((UINT64_C(1) << 57) - 1) / 10) {
      return 0;
    }
    f *= 10;
  }
  if (f >= (UINT64_C(1) << 57)) {
    return 0;
  }

  // MathUtils' g = floor(normalized 10**(-k) / 4) + 1, with g split into
  // 63-bit limbs. Reuse Żmij's downward-rounded 128-bit power table instead
  // of duplicating MathUtils' table. The following round-to-odd computation
  // is the one in DoubleToDecimal. It distinguishes exactness and direction
  // without floating-point arithmetic or an allocation.
  auto cache = static_data.pow10_significands[-k];
  uint64_t g1 = cache.hi >> 1;
  uint64_t g0 = (((cache.hi & 1) << 62) | (cache.lo >> 2)) + 1;
  if (g0 >> 63) {
    g0 = 0;
    ++g1;
  }
  int h = q + int((int64_t(-k) * INT64_C(913124641741)) >> 38) + 2;
  uint64_t cp = (c << 2) << h;
  uint64_t x1 = umul128_hi64(g0, cp);
  uint64_t y0 = g1 * cp;
  uint64_t y1 = umul128_hi64(g1, cp);
  uint64_t z = (y0 >> 1) + x1;
  uint64_t vb = (y1 + (z >> 63)) |
                (((z & UINT64_C(0x7fffffffffffffff)) + UINT64_C(0x7fffffffffffffff)) >> 63);
  return f | (uint64_t((f << 2) == vb) << 62) | (uint64_t((f << 2) > vb) << 63);
}

#endif // SHARE_UTILITIES_ZMIJMETADATA_INLINE_HPP
