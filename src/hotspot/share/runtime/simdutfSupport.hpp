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

#include "classfile/vmIntrinsics.hpp"
#include "memory/allocation.hpp"
#include "utilities/globalDefinitions.hpp"

class SimdUTF : AllStatic {
 public:
  static void initialize();
  static bool available();
  // Whether the stock Base64 decoding stub is the AVX-512 VBMI kernel, which on the same
  // hardware decodes faster than the library. C2 then keeps the stub for decoding.
  static bool stock_base64_decode_is_faster();
  // The leaf behind a prefix or String coding intrinsic, and its name for runtime calls,
  // or nullptr for any other intrinsic.
  static address leaf_for(vmIntrinsics::ID id, const char** name = nullptr);
  static jint encode_latin1_utf8(const jbyte* src, jint length, jbyte* dst);
  static jint encode_utf16_utf8(const jbyte* src, jint length, jbyte* dst);
  static jint decode_utf8_utf16(const jbyte* src, jint length, jbyte* dst);
  static jint index_of_latin1(const jbyte* src, jint length, jint ch);
  static jint index_of_utf16(const jbyte* src, jint length, jint ch);
  // Charset coder leaves. Each converts a prefix of complete, valid input whose
  // output fits the capacity, and returns the consumed source units in the high
  // word and the produced destination units in the low word, or 0 if it declines.
  // A call may stop short of the longest prefix, for example below a few units
  // from the end or after one bounded chunk, so callers call again until it
  // makes no progress. The caller's Java loop handles whatever follows,
  // including malformed input. The counts are consistent with the output even
  // if the caller changes the input concurrently.
  static jlong decode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong decode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // UTF-32 in big-endian byte order, on little-endian hosts, which swap the units in blocks.
  static jlong decode_utf32be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf32be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong utf8_to_latin1_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // The UTF-16 leaves count 16-bit units, in the order of the name for the bytes and in
  // the order of the host for the chars.
  static jlong decode_utf16le_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong decode_utf16be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf16le_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_utf16be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // The ISO-8859-1 and US-ASCII leaves convert one char per byte, and stop at the first
  // byte or char that the charset does not map, so the counts of both halves are equal.
  static jlong decode_latin1_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_latin1_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong decode_ascii_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jlong encode_ascii_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // Latin-1 bytes of a compact string to UTF-8, which the output bounds.
  static jlong encode_latin1_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity);
  // Leaves for the String coding boundaries that only C2 implements with stubs. They
  // are exact for every length, so the interpreter and C1 call them unconditionally.
  static jint count_positives(const jbyte* src, jint length);
  static void inflate_latin1(const jbyte* src, jbyte* dst, jint length);
  static jint encode_ascii_array(const jbyte* src, jbyte* dst, jint length);
  static jint compress_utf16(const jbyte* src, jbyte* dst, jint length);
  static void encode_base64(const jbyte* src, jint length, jbyte* dst, jboolean url);
  static jint decode_base64_mime(const jbyte* src, jint length, jbyte* dst, jint capacity);
  static jint decode_base64(const jbyte* src, jint length, jbyte* dst, jint capacity, jboolean url);
};

#endif // SHARE_RUNTIME_SIMDUTFSUPPORT_HPP
