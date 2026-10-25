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

#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/simdutfSupport.hpp"
#include "runtime/vm_version.hpp"
#include "simdutf.h"

static const simdutf::implementation* simdutf_implementation = nullptr;

void SimdUTF::initialize() {
  if (!UseSIMDUTFIntrinsics) {
    return;
  }
  const auto& implementations = simdutf::get_available_implementations();
  const simdutf::implementation* impl = nullptr;
#if defined(AMD64) && !defined(ZERO)
  // Check the target attributes independently: simdutf's masks omit some
  // features and have aliased feature bits. HotSpot also checks OS vector state.
  bool sse = VM_Version::supports_sse3() &&
      VM_Version::supports_ssse3() && VM_Version::supports_sse4_1() && VM_Version::supports_sse4_2();
  bool avx = sse && VM_Version::supports_avx() && VM_Version::supports_avx2();
  if (UseAVX >= 3 && avx && VM_Version::supports_evex() &&
      VM_Version::supports_avx512dq() && VM_Version::supports_avx512cd() &&
      VM_Version::supports_avx512bw() && VM_Version::supports_avx512vl() &&
      VM_Version::supports_avx512_vbmi() && VM_Version::supports_avx512_vbmi2() &&
      VM_Version::supports_avx512_vpopcntdq() && VM_Version::supports_bmi1() &&
      VM_Version::supports_bmi2() && VM_Version::supports_clmul() &&
      VM_Version::supports_lzcnt() && VM_Version::supports_popcnt()) {
    impl = implementations["icelake"];
  }
  if (impl == nullptr || !impl->supported_by_runtime_system()) {
    impl = UseAVX >= 2 && avx && VM_Version::supports_bmi1() &&
        VM_Version::supports_bmi2() && VM_Version::supports_lzcnt() && VM_Version::supports_popcnt()
        ? implementations["haswell"] : nullptr;
  }
  if (impl == nullptr || !impl->supported_by_runtime_system()) {
    impl = UseSSE >= 4 && sse && VM_Version::supports_popcnt()
        ? implementations["westmere"] : nullptr;
  }
#elif defined(AARCH64) && !defined(ZERO)
  impl = implementations["arm64"];
#endif
  if (impl == nullptr || !impl->supported_by_runtime_system()) {
    return;
  }
  simdutf_implementation = impl;
  simdutf::get_active_implementation() = impl;
}

bool SimdUTF::available() {
  return simdutf_implementation != nullptr;
}

// String owns the immutable Latin1 input and allocates worst-case UTF-8 room.
// Intrinsic callers bound this non-safepointing leaf to one MiB of source bytes.
JRT_LEAF(jint, SimdUTF::encode_latin1_utf8(const jbyte* src, jint length, jbyte* dst))
  assert(length > 0 && length <= 1024 * 1024, "bounded conversion");
  return static_cast<jint>(simdutf::convert_latin1_to_utf8(
      reinterpret_cast<const char*>(src), length, reinterpret_cast<char*>(dst)));
JRT_END

// One validating conversion from immutable String storage into private output.
// Malformed UTF-16 is handled by the original Java loop, not a replacement API.
JRT_LEAF(jint, SimdUTF::encode_utf16_utf8(const jbyte* src, jint length, jbyte* dst))
  assert(length > 0 && length <= 1024 * 1024, "bounded conversion");
  simdutf::result result = simdutf::convert_utf16_to_utf8_with_errors(
      reinterpret_cast<const char16_t*>(src), length, reinterpret_cast<char*>(dst));
  return result.error == simdutf::SUCCESS ? static_cast<jint>(result.count) : -1;
JRT_END

// String owns either its constructor snapshot or the input transferred to
// newStringOrThrow. Private output has one UTF-16 unit per remaining input byte.
JRT_LEAF(jint, SimdUTF::decode_utf8_utf16(const jbyte* src, jint length, jbyte* dst))
  assert(length > 0 && length <= 1024 * 1024, "bounded conversion");
  simdutf::result result = simdutf::convert_utf8_to_utf16_with_errors(
      reinterpret_cast<const char*>(src), length, reinterpret_cast<char16_t*>(dst));
  return result.error == simdutf::SUCCESS ? static_cast<jint>(result.count) : -1;
JRT_END

// The existing String character-search entries supply a single Latin1 byte or
// UTF-16 code unit. Supplementary code points remain in String's Java pair search.
JRT_LEAF(jint, SimdUTF::index_of_latin1(const jbyte* src, jint length, jint ch))
  assert(length > 0 && length <= 1024 * 1024, "bounded search");
  const char* begin = reinterpret_cast<const char*>(src);
  const char* found = simdutf::find(begin, begin + length, static_cast<char>(ch));
  return found == begin + length ? -1 : static_cast<jint>(found - begin);
JRT_END

JRT_LEAF(jint, SimdUTF::index_of_utf16(const jbyte* src, jint length, jint ch))
  assert(length > 0 && length <= 1024 * 1024, "bounded search");
  const char16_t* begin = reinterpret_cast<const char16_t*>(src);
  const char16_t* found = simdutf::find(begin, begin + length, static_cast<char16_t>(ch));
  return found == begin + length ? -1 : static_cast<jint>(found - begin);
JRT_END

// encodeBlock supplies complete three-byte groups. Java owns padding and MIME
// line breaks; this conversion writes directly to the existing output array.
JRT_LEAF(void, SimdUTF::encode_base64(const jbyte* src, jint length, jbyte* dst, jboolean url))
  assert(length > 0 && length <= 1024 * 1024 && length % 3 == 0, "bounded complete groups");
  simdutf::binary_to_base64(reinterpret_cast<const char*>(src), length,
      reinterpret_cast<char*>(dst), url ? simdutf::base64_url : simdutf::base64_default);
JRT_END

// Keep the final quartet in Java so its padding and tail rules remain intact.
// The caller declines MIME and aliased arrays. MIME needs Java's consumed-input
// accounting. On failure, the intrinsic falls back within this block entry.
JRT_LEAF(jint, SimdUTF::decode_base64(const jbyte* src, jint length, jbyte* dst, jint capacity, jboolean url))
  assert(length > 4 && length <= 1024 * 1024 && capacity >= 0, "bounded decode");
  size_t count = capacity;
  const size_t input_length = (length - 1) & ~size_t(3);
  simdutf::result result = simdutf::base64_to_binary_safe(
      reinterpret_cast<const char*>(src), input_length, reinterpret_cast<char*>(dst), count,
      url ? simdutf::base64_url_no_whitespace : simdutf::base64_default_no_whitespace,
      simdutf::only_full_chunks);
  // Without skipped characters, each complete output group consumes one quartet.
  return result.error == simdutf::SUCCESS ? static_cast<jint>(count) : -1;
JRT_END

// decode0 owns the full MIME operation; Java handles errors on native decline.
JRT_LEAF(jint, SimdUTF::decode_base64_mime(const jbyte* src, jint length, jbyte* dst, jint capacity))
  size_t count = capacity;
  simdutf::result result = simdutf::base64_to_binary_safe(
      reinterpret_cast<const char*>(src), length, reinterpret_cast<char*>(dst), count,
      simdutf::base64_java_mime);
  return result.error == simdutf::SUCCESS ? static_cast<jint>(count) : -1;
JRT_END
