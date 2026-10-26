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

address SimdUTF::leaf_for(vmIntrinsics::ID id, const char** name) {
#define SIMDUTF_LEAF(ID, FN) \
  case vmIntrinsics::ID:     \
    if (name != nullptr) {   \
      *name = #FN;           \
    }                        \
    return CAST_FROM_FN_PTR(address, SimdUTF::FN);
  switch (id) {
  SIMDUTF_LEAF(_decodeUTF8Bulk, decode_utf8_prefix)
  SIMDUTF_LEAF(_encodeUTF8Bulk, encode_utf8_prefix)
  SIMDUTF_LEAF(_decodeUTF32Bulk, decode_utf32_prefix)
  SIMDUTF_LEAF(_encodeUTF32Bulk, encode_utf32_prefix)
  SIMDUTF_LEAF(_utf8ToLatin1Bulk, utf8_to_latin1_prefix)
  SIMDUTF_LEAF(_decodeUTF16LEBulk, decode_utf16le_prefix)
  SIMDUTF_LEAF(_decodeUTF16BEBulk, decode_utf16be_prefix)
  SIMDUTF_LEAF(_encodeUTF16LEBulk, encode_utf16le_prefix)
  SIMDUTF_LEAF(_encodeUTF16BEBulk, encode_utf16be_prefix)
  SIMDUTF_LEAF(_countPositives, count_positives)
  SIMDUTF_LEAF(_inflateStringC, inflate_latin1)
  SIMDUTF_LEAF(_inflateStringB, inflate_latin1)
  // The ISO-8859-1 encoders narrow like the UTF-16 compression does
  SIMDUTF_LEAF(_compressStringC, compress_utf16)
  SIMDUTF_LEAF(_compressStringB, compress_utf16)
  SIMDUTF_LEAF(_encodeISOArray, compress_utf16)
  SIMDUTF_LEAF(_encodeByteISOArray, compress_utf16)
  default:
    return nullptr;
  }
#undef SIMDUTF_LEAF
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

namespace {
// Remainders shorter than this are left to the caller's Java loop.
const jint ConversionTail = 16;

inline jlong pack(jint consumed, jint produced) {
  return (static_cast<jlong>(consumed) << 32) | static_cast<jlong>(static_cast<juint>(produced));
}

// The library reports positions and counts that lie within the ranges it is given. They can
// lie outside them only if the input changed while it was converted, because its scalar
// fallbacks look at the input again after a vector pass. Such a result is not used to move
// a pointer or to count output, so that a racing writer can cost a conversion but not
// memory outside the buffers or counts that the caller cannot trust.
inline bool within(size_t count, jint bound) {
  return count <= static_cast<size_t>(bound);
}

// The vector kernels assume natural alignment of their element types. Java
// arrays satisfy it, but a direct buffer view can start at any byte.
inline bool aligned(const void* address, size_t size) {
  return (reinterpret_cast<uintptr_t>(address) & (size - 1)) == 0;
}
}

// UTF-8 bytes to UTF-16 units. A UTF-8 byte yields at most one unit, so a chunk of
// min(input, room) bytes always fits. An incomplete trailing sequence, whether at
// the end of the input or at a chunk bound, is left for the next chunk or the caller.
// On malformed input the library reports the first invalid position, and the valid
// prefix before it has been converted.
JRT_LEAF(jlong, SimdUTF::decode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  const char* input = reinterpret_cast<const char*>(src);
  char16_t* output = reinterpret_cast<char16_t*>(dst);
  if (!aligned(output, sizeof(char16_t))) {
    return 0;
  }
  jint consumed = 0;
  jint produced = 0;
  for (;;) {
    jint chunk = MIN2(length - consumed, capacity - produced);
    if (chunk < ConversionTail) {
      break;
    }
    jint complete = static_cast<jint>(simdutf::trim_partial_utf8(input + consumed, chunk));
    simdutf::result result = simdutf::convert_utf8_to_utf16_with_errors(
        input + consumed, complete, output + produced);
    if (!within(result.count, complete)) {
      break;
    }
    if (result.error != simdutf::SUCCESS) {
      // The library reports where the valid prefix ends, not how much it wrote. Convert
      // the prefix again and take the count from that conversion, so the counts describe
      // the output even if the caller changes the input concurrently.
      jint valid = static_cast<jint>(result.count);
      size_t written = simdutf::convert_utf8_to_utf16(input + consumed, valid, output + produced);
      if (written > 0 && within(written, valid)) {
        consumed += valid;
        produced += static_cast<jint>(written);
      }
      break;
    }
    consumed += complete;
    produced += static_cast<jint>(result.count);
  }
  return pack(consumed, produced);
JRT_END

// UTF-16 units to UTF-8 bytes. The library bounds the output itself and reports
// both counts, stopping before an unpaired surrogate or a character that does not
// fit. A trailing high surrogate is left for the caller, which may be waiting for
// its pair.
JRT_LEAF(jlong, SimdUTF::encode_utf8_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  const char16_t* input = reinterpret_cast<const char16_t*>(src);
  if (!aligned(input, sizeof(char16_t))) {
    return 0;
  }
  simdutf::full_result result = simdutf::convert_utf16_to_utf8_safe_with_details(
      input, length, reinterpret_cast<char*>(dst), capacity);
  if (!within(result.input_count, length) || !within(result.output_count, capacity)) {
    return 0;
  }
  return pack(static_cast<jint>(result.input_count), static_cast<jint>(result.output_count));
JRT_END

// UTF-32 in native byte order to UTF-16. Code points above U+10FFFF and surrogate
// code points are errors for the library; the caller decides what they mean. A code
// point yields at most two units, which bounds each chunk.
JRT_LEAF(jlong, SimdUTF::decode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  const char32_t* input = reinterpret_cast<const char32_t*>(src);
  char16_t* output = reinterpret_cast<char16_t*>(dst);
  if (!aligned(input, sizeof(char32_t)) || !aligned(output, sizeof(char16_t))) {
    return 0;
  }
  jint consumed = 0;
  jint produced = 0;
  for (;;) {
    jint chunk = MIN2(length - consumed, (capacity - produced) / 2);
    if (chunk < ConversionTail) {
      break;
    }
    simdutf::result result = simdutf::convert_utf32_to_utf16_with_errors(
        input + consumed, chunk, output + produced);
    if (result.error != simdutf::SUCCESS) {
      if (!within(result.count, chunk)) {
        break;
      }
      jint valid = static_cast<jint>(result.count);
      size_t written = simdutf::convert_utf32_to_utf16(input + consumed, valid, output + produced);
      if (written > 0 && within(written, 2 * valid)) {
        consumed += valid;
        produced += static_cast<jint>(written);
      }
      break;
    }
    if (!within(result.count, 2 * chunk)) {
      break;
    }
    consumed += chunk;
    produced += static_cast<jint>(result.count);
  }
  return pack(consumed, produced);
JRT_END

// UTF-16 to UTF-32 in native byte order. A unit yields at most one code point, so
// min(input, room) units fit; a pair cut by the bound is reported as an error at
// the high surrogate and left for the caller.
JRT_LEAF(jlong, SimdUTF::encode_utf32_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  const char16_t* input = reinterpret_cast<const char16_t*>(src);
  char32_t* output = reinterpret_cast<char32_t*>(dst);
  jint chunk = MIN2(length, capacity);
  if (chunk < ConversionTail || !aligned(input, sizeof(char16_t)) || !aligned(output, sizeof(char32_t))) {
    return 0;
  }
  simdutf::result result = simdutf::convert_utf16_to_utf32_with_errors(input, chunk, output);
  if (!within(result.count, chunk)) {
    return 0;
  }
  if (result.error != simdutf::SUCCESS) {
    jint valid = static_cast<jint>(result.count);
    size_t written = simdutf::convert_utf16_to_utf32(input, valid, output);
    return written > 0 && within(written, valid) ? pack(valid, static_cast<jint>(written)) : 0;
  }
  return pack(chunk, static_cast<jint>(result.count));
JRT_END

// UTF-8 bytes to Latin-1, for the String decoder that tries a compact string first. A
// UTF-8 byte yields at most one Latin-1 byte, so min(input, room) bytes fit. The first
// character that is malformed or not Latin-1 ends the prefix. The library reports where
// it ends but does not define the output before an error in every implementation, so
// the prefix is converted again then; String falls back to UTF-16 from that point.
JRT_LEAF(jlong, SimdUTF::utf8_to_latin1_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  const char* input = reinterpret_cast<const char*>(src);
  char* output = reinterpret_cast<char*>(dst);
  jint chunk = MIN2(length, capacity);
  if (chunk < ConversionTail) {
    return 0;
  }
  jint complete = static_cast<jint>(simdutf::trim_partial_utf8(input, chunk));
  simdutf::result result = simdutf::convert_utf8_to_latin1_with_errors(input, complete, output);
  if (!within(result.count, complete)) {
    return 0;
  }
  if (result.error != simdutf::SUCCESS) {
    jint valid = static_cast<jint>(result.count);
    size_t written = simdutf::convert_utf8_to_latin1(input, valid, output);
    return written > 0 && within(written, valid) ? pack(valid, static_cast<jint>(written)) : 0;
  }
  return pack(complete, static_cast<jint>(result.count));
JRT_END

namespace {
// Copies the longest prefix of well-formed UTF-16 units that fits, from one byte order to
// the other when swap is set, and returns the units converted in both halves. A surrogate
// pair that the bound would cut, and a lone surrogate, end the prefix and are left to the
// caller. The units are validated where they are read, and then copied, so the count is
// of units that were valid when they were read. Only little-endian hosts convert.
jlong copy_utf16_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity,
                        bool input_big, bool swap) {
#ifdef VM_LITTLE_ENDIAN
  const char16_t* input = reinterpret_cast<const char16_t*>(src);
  char16_t* output = reinterpret_cast<char16_t*>(dst);
  jint chunk = MIN2(length, capacity);
  if (chunk < ConversionTail || !aligned(input, sizeof(char16_t)) || !aligned(output, sizeof(char16_t))) {
    return 0;
  }
  simdutf::result result = input_big ? simdutf::validate_utf16be_with_errors(input, chunk)
                                     : simdutf::validate_utf16le_with_errors(input, chunk);
  if (!within(result.count, chunk)) {
    return 0;
  }
  jint valid = result.error == simdutf::SUCCESS ? chunk : static_cast<jint>(result.count);
  if (valid == 0) {
    return 0;
  }
  if (swap) {
    simdutf::change_endianness_utf16(input, valid, output);
  } else {
    memcpy(output, input, static_cast<size_t>(valid) * sizeof(char16_t));
  }
  return pack(valid, valid);
#else
  return 0;
#endif
}
}

// UTF-16 bytes to chars. Bytes of either order are read as 16-bit units.
JRT_LEAF(jlong, SimdUTF::decode_utf16le_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  return copy_utf16_prefix(src, length, dst, capacity, false, false);
JRT_END

JRT_LEAF(jlong, SimdUTF::decode_utf16be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  return copy_utf16_prefix(src, length, dst, capacity, true, true);
JRT_END

// Chars to UTF-16 bytes. The chars are in the order of the host.
JRT_LEAF(jlong, SimdUTF::encode_utf16le_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  return copy_utf16_prefix(src, length, dst, capacity, false, false);
JRT_END

JRT_LEAF(jlong, SimdUTF::encode_utf16be_prefix(const jbyte* src, jint length, jbyte* dst, jint capacity))
  assert(length >= 0 && length <= 1024 * 1024 && capacity >= 0, "bounded conversion");
  return copy_utf16_prefix(src, length, dst, capacity, false, true);
JRT_END

namespace {
// The library call is not worth its dispatch below this many elements.
const jint ShortRange = 16;
}

// StringCoding.countPositives0: the index of the first negative byte, or the length.
// The range is bounds-checked by the Java caller; like the C2 stub, this leaf does not
// poll for safepoints inside the range.
JRT_LEAF(jint, SimdUTF::count_positives(const jbyte* src, jint length))
  if (length < ShortRange) {
    for (jint i = 0; i < length; i++) {
      if (src[i] < 0) {
        return i;
      }
    }
    return length;
  }
  // The scalar fallback of the library can report a position past the end of a range that
  // changed meanwhile; a count may be short of the first negative byte but not past the end
  simdutf::result result = simdutf::validate_ascii_with_errors(reinterpret_cast<const char*>(src), length);
  return within(result.count, length) ? static_cast<jint>(result.count) : length;
JRT_END

// StringLatin1.inflate0: Latin-1 bytes to UTF-16 units in native byte order, the order
// of both char[] and String's UTF-16 byte[].
JRT_LEAF(void, SimdUTF::inflate_latin1(const jbyte* src, jbyte* dst, jint length))
  if (length < ShortRange) {
    jchar* output = reinterpret_cast<jchar*>(dst);
    for (jint i = 0; i < length; i++) {
      output[i] = static_cast<jchar>(src[i] & 0xff);
    }
    return;
  }
  size_t written = simdutf::convert_latin1_to_utf16(reinterpret_cast<const char*>(src), length,
                                                    reinterpret_cast<char16_t*>(dst));
  assert(written == static_cast<size_t>(length), "every byte is converted");
  (void)written;
JRT_END

// StringUTF16.compress0 and the ISO-8859-1 encodeISOArray0, which have the same contract:
// copy the leading Latin-1 units and return their number. The callers keep the copied
// prefix, so it is written again after an error rather than relying on how much of the
// failing block the library stored.
JRT_LEAF(jint, SimdUTF::compress_utf16(const jbyte* src, jbyte* dst, jint length))
  const jchar* input = reinterpret_cast<const jchar*>(src);
  if (length < ShortRange) {
    for (jint i = 0; i < length; i++) {
      if (input[i] > 0xff) {
        return i;
      }
      dst[i] = static_cast<jbyte>(input[i]);
    }
    return length;
  }
  simdutf::result result = simdutf::convert_utf16_to_latin1_with_errors(
      reinterpret_cast<const char16_t*>(src), length, reinterpret_cast<char*>(dst));
  if (result.error == simdutf::SUCCESS) {
    return length;
  }
  jint valid = within(result.count, length) ? static_cast<jint>(result.count) : length;
  return static_cast<jint>(simdutf::convert_utf16_to_latin1(
      reinterpret_cast<const char16_t*>(src), valid, reinterpret_cast<char*>(dst)));
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
