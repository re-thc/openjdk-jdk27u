/*
 * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2024, Alibaba Group Holding Limited. All Rights Reserved.
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

#include "runtime/globals.hpp"
#include "runtime/os.hpp"
#include "utilities/zmij.hpp"

#define ZMIJ_HOTSPOT_SHORTEST_ONLY
#define ZMIJ_MALLOC(size) os::malloc(size, mtInternal)
#define ZMIJ_FREE(ptr) os::free(ptr)
#include "utilities/zmij/zmij-impl.hpp"
#include "utilities/zmijMetadata.inline.hpp"

bool Zmij::is_enabled() {
#if defined(VM_LITTLE_ENDIAN) && (defined(AMD64) || defined(AARCH64))
  return UseZmijIntrinsics;
#else
  return false;
#endif
}

int Zmij::format(void* output, uint64_t bits, int format) {
  bool is_double = (format & 1) != 0;
  // Wide upstream stores stay in this initialized stack buffer.
  char buffer[40] = {};
  char* end;
  if (is_double) {
    double value;
    memcpy(&value, &bits, sizeof(value));
    end = zmij::detail::write<double>(buffer, value);
  } else {
    uint32_t raw = uint32_t(bits);
    float value;
    memcpy(&value, &raw, sizeof(value));
    end = zmij::detail::write<float>(buffer, value);
  }
  int length = int(end - buffer);
  if ((format & 2) != 0) {
    uint16_t* utf16 = static_cast<uint16_t*>(output);
    for (int i = 0; i < length; ++i) {
      utf16[i] = uint8_t(buffer[i]);
    }
  } else {
    // Constant-sized copies avoid libc. Padding remains within MAX_CHARS.
    if (is_double) {
      memcpy(output, buffer, 24);
    } else {
      memcpy(output, buffer, 15);
    }
  }
  return length;
}

uint64_t Zmij::decimal(uint64_t bits) {
  return hotspot_zmij_decimal_metadata(bits);
}
