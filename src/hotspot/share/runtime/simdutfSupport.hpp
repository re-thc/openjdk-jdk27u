/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

#ifndef SHARE_RUNTIME_SIMDUTFSUPPORT_HPP
#define SHARE_RUNTIME_SIMDUTFSUPPORT_HPP

#include "memory/allStatic.hpp"
#include "oops/oopsHierarchy.hpp"
#include "utilities/globalDefinitions.hpp"

// A single, non-safepointing entry shared by the interpreter, C1, C2 and JNI.
// Offsets and lengths are in logical elements (UTF-16 byte arrays use chars).
class SimdUTF : AllStatic {
 public:
  // Keep operation values in sync with jdk.internal.util.SimdUTF.
  enum Operation {
    COUNT_ASCII = 0,
    DECODE_UTF8 = 1,
    ENCODE_LATIN1 = 2,
    ENCODE_UTF16 = 3,
    ENCODE_ASCII = 4,
    ENCODE_LATIN1_FROM_UTF16 = 5,
    ENCODE_BASE64 = 6,
    ENCODE_BASE64_URL = 7,
    DECODE_BASE64 = 8,
    DECODE_BASE64_URL = 9,
    VALIDATE_UTF16 = 10,
    VALIDATE_ASCII = 11,
    VALIDATE_LATIN1 = 12,
    ENCODED_LENGTH_UTF16 = 13,
    ENCODED_LENGTH_LATIN1 = 14,
    ENCODE_UTF16_BE = 15,
    ENCODE_UTF16_LE = 16,
    DECODE_UTF16_BE = 17,
    DECODE_UTF16_LE = 18,
    INFLATE_LATIN1 = 19,
    ENCODE_UTF32_BE = 20,
    ENCODE_UTF32_LE = 21,
    DECODE_UTF32_BE = 22,
    DECODE_UTF32_LE = 23,
    DECODE_LATIN1 = 24,
    COUNT_CODE_POINTS = 25,
    COPY_UTF16 = 26
  };

  static jint initialize();
  // Generated code passes raw pointers. In fastdebug, oop is a non-trivial
  // C++ wrapper whose calling convention is unsuitable for this C ABI entry.
  static jint process(oopDesc* src, jint sp, jint len,
                      oopDesc* dst, jint dp, jint capacity, jint operation);
};

#endif // SHARE_RUNTIME_SIMDUTFSUPPORT_HPP
