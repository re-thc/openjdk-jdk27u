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

#ifndef SHARE_UTILITIES_ZMIJ_HPP
#define SHARE_UTILITIES_ZMIJ_HPP

#include "memory/allStatic.hpp"
#include "utilities/globalDefinitions.hpp"

class Zmij : AllStatic {
 public:
  // Format bit 0 selects binary64 (otherwise binary32).
  // Bit 1 selects UTF16 output.
  // The caller reserves MAX_CHARS characters. Return 0 for Java fallback.
  typedef int (*Formatter)(void* output, uint64_t bits, int format);
  // Chosen while generating an intrinsic; no dispatch remains in its hot path.
  static Formatter formatter();
  static uint64_t decimal(uint64_t bits);
  static int format(void* output, uint64_t bits, int format);
#if defined(AMD64) && !defined(ZERO)
  static int format_sse41(void* output, uint64_t bits, int format);
#endif
 private:
  typedef char* (*DoubleWriter)(char* buffer, double value);
  typedef char* (*FloatWriter)(char* buffer, float value);
  static inline int format_impl(void* output, uint64_t bits, int format,
                                DoubleWriter double_writer, FloatWriter float_writer) {
    bool is_double = (format & 1) != 0;
    uint64_t magnitude = bits & (is_double ? UINT64_C(0x7fffffffffffffff) : UINT64_C(0x7fffffff));
    if (magnitude <= 128 || magnitude >= (is_double ? UINT64_C(0x7ff0000000000000) : UINT64_C(0x7f800000))) {
      return 0;
    }
    // Wide upstream stores stay in this initialized stack buffer.
    char buffer[40] = {};
    char* end;
    if (is_double) {
      double value;
      memcpy(&value, &bits, sizeof(value));
      end = double_writer(buffer, value);
    } else {
      uint32_t raw = uint32_t(bits);
      float value;
      memcpy(&value, &raw, sizeof(value));
      end = float_writer(buffer, value);
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
};

#endif // SHARE_UTILITIES_ZMIJ_HPP
