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

#ifndef SHARE_RUNTIME_SIMDUTFSUPPORT_HPP
#define SHARE_RUNTIME_SIMDUTFSUPPORT_HPP

#include "memory/allocation.hpp"
#include "utilities/globalDefinitions.hpp"

class SimdUTF : AllStatic {
 public:
  static void initialize();
  static bool available();
  static jint encode_latin1_utf8(const jbyte* src, jint length, jbyte* dst);
  static jint encode_utf16_utf8(const jbyte* src, jint length, jbyte* dst);
  static jint decode_utf8_utf16(const jbyte* src, jint length, jbyte* dst);
  static jint index_of_latin1(const jbyte* src, jint length, jint ch);
  static jint index_of_utf16(const jbyte* src, jint length, jint ch);
  // Charset coder leaves. Each converts the longest prefix of complete, valid
  // input whose output fits the capacity, and returns the consumed source units
  // in the high word and the produced destination units in the low word. The
  // caller's Java loop handles whatever follows, including malformed input.
  static jlong decode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong decode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong utf8_to_latin1_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // Leaves for the String coding boundaries that only C2 implements with stubs. They
  // are exact for every length, so the interpreter and C1 call them unconditionally.
  static jint count_positives(const jbyte* src, jint length);
  static void inflate_latin1(const jbyte* src, jbyte* dst, jint length);
  static jint compress_utf16(const jbyte* src, jbyte* dst, jint length);
  static void encode_base64(const jbyte* src, jint length, jbyte* dst, jboolean url);
  static jint decode_base64_mime(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jint decode_base64(const jbyte* src, jint length, jbyte* dst, jint capacity, jboolean url);
};

#endif // SHARE_RUNTIME_SIMDUTFSUPPORT_HPP
