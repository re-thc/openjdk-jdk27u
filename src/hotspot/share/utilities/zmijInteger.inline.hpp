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

// The bridge is shared by the VM and the guarded-buffer verifier. Bounds packs
// the array's byte length above its exclusive character end index. The vendor
// may store 17/21 bytes for a signed int/long; Java reserves only the exact text.
inline int hotspot_zmij_integer(void* output, uint64_t bounds, uint64_t bits, int format,
                               char* (*write_int)(char*, int32_t),
                               char* (*write_long)(char*, int64_t)) {
  uint32_t byte_length = uint32_t(bounds >> 32);
  uint32_t index = uint32_t(bounds);
  int coder = (format & 2) >> 1;
  if (index > (byte_length >> coder)) {
    return -1;
  }
  char scratch[32] = {};
  char* end;
  if ((format & 1) != 0) {
    int64_t value;
    memcpy(&value, &bits, sizeof(value));
    end = write_long(scratch, value);
  } else {
    uint32_t raw = uint32_t(bits);
    int32_t value;
    memcpy(&value, &raw, sizeof(value));
    end = write_int(scratch, value);
  }
  uint32_t length = uint32_t(end - scratch);
  if (index < length) {
    return -1;
  }
  uint32_t start = index - length;
  if (coder == 0) {
    memcpy(static_cast<char*>(output) + start, scratch, length);
  } else {
    uint16_t* utf16 = static_cast<uint16_t*>(output) + start;
    for (uint32_t i = 0; i < length; ++i) {
      utf16[i] = uint8_t(scratch[i]);
    }
  }
  return int(start);
}

#endif // SHARE_UTILITIES_ZMIJINTEGER_INLINE_HPP
