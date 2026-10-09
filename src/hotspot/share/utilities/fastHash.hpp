/*
 * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
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

#ifndef SHARE_UTILITIES_FASTHASH_HPP
#define SHARE_UTILITIES_FASTHASH_HPP

#include "memory/allStatic.hpp"

class FastHash : public AllStatic {
private:
  static void fullmul32(uint32_t& hi, uint32_t& lo, uint32_t op1, uint32_t op2) {
    const uint64_t product = static_cast<uint64_t>(op1) * op2;
    hi = static_cast<uint32_t>(product >> 32);
    lo = static_cast<uint32_t>(product);
  }

  static uint32_t ror32(uint32_t x, uint32_t distance) {
    distance = distance & (32 - 1);
    if (distance == 0) {
      return x;
    }
    return (x >> distance) | (x << (32 - distance));
  }

public:
  static uint32_t get_hash32(uint32_t x, uint32_t y) {
    const uint32_t M  = 0x337954D5;
    const uint32_t A  = 0xAAAAAAAA; // REPAA
    const uint32_t H0 = (x ^ y), L0 = (x ^ A);

    uint32_t U0, V0;
    fullmul32(U0, V0, L0, M);
    const uint32_t Q0 = (H0 * M);
    const uint32_t L1 = (Q0 ^ U0);

    uint32_t U1, V1;
    fullmul32(U1, V1, L1, M);
    const uint32_t P1 = (V0 ^ M);
    const uint32_t Q1 = ror32(P1, L1);
    const uint32_t L2 = (Q1 ^ U1);
    return V1 ^ L2;
  }
};

#endif // SHARE_UTILITIES_FASTHASH_HPP
