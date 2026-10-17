// Copyright (c) 2026, Harry Chan. All rights reserved.
// This code is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License version 2 only.

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
