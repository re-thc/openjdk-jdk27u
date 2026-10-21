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

#include "jvm.h"
#include "oops/typeArrayOop.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/globals_extension.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/simdutfSupport.hpp"
#include "runtime/vm_version.hpp"
#include "simdutf.h"

static const simdutf::implementation* simdutf_implementation = nullptr;

jint SimdUTF::base64_encoder_threshold(bool interpreted) {
  if (!UseSIMDUTFIntrinsics || SIMDUTFMinLength == 0) {
    return max_jint;
  }
  if (FLAG_IS_DEFAULT(SIMDUTFMinLength)) {
    if (interpreted) {
      return 12;
    }
#ifdef AARCH64
    return 24;
#endif
  }
  return checked_cast<jint>(SIMDUTFMinLength);
}

jint SimdUTF::utf16_copy_threshold() {
  if (!UseSIMDUTFIntrinsics || SIMDUTFMinLength == 0) {
    return max_jint;
  }
#ifdef AARCH64
  if (FLAG_IS_DEFAULT(SIMDUTFMinLength)) {
    return 32;
  }
#endif
  return checked_cast<jint>(SIMDUTFMinLength);
}

jint SimdUTF::initialize() {
  if (!UseSIMDUTFIntrinsics) {
    return -1;
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
    return -1;
  }
  simdutf_implementation = impl;
  simdutf::get_active_implementation() = impl;
  jint minimum = checked_cast<jint>(SIMDUTFMinLength);
  // Encode automatic policy in this private bootstrap return value. A pure
  // interpreter VM uses its lower tier-specific crossover.
  return FLAG_IS_DEFAULT(SIMDUTFMinLength) && UseCompiler ? -minimum - 1 : minimum;
}

// Check in the shared entry, rather than relying on Java-only preconditions:
// this also covers reflection, compiler transformations and the JNI fallback.
static bool simdutf_range(oop obj, bool utf16, jint off, jint len) {
  if (obj == nullptr || !obj->is_typeArray() || (off | len) < 0) {
    return false;
  }
  typeArrayOop array = typeArrayOop(obj);
  BasicType type = TypeArrayKlass::cast(array->klass())->element_type();
  if (type != T_BYTE && !(utf16 && type == T_CHAR)) {
    return false;
  }
  jint length = array->length();
  if (utf16 && type == T_BYTE) {
    length >>= 1;
  }
  return off <= length && len <= length - off;
}

static void* simdutf_base(oop obj, bool utf16, jint off) {
  typeArrayOop array = typeArrayOop(obj);
  BasicType type = TypeArrayKlass::cast(array->klass())->element_type();
  return reinterpret_cast<char*>(array->base(type)) + size_t(off) * (utf16 ? 2 : 1);
}

static char32_t simdutf_swap32(char32_t value) {
  return (value >> 24) | ((value >> 8) & 0xff00) |
         ((value << 8) & 0xff0000) | (value << 24);
}

// Java counts every isolated surrogate, and each adjacent high/low pair, as
// one code point. Such pairs cannot overlap, so this reduction handles both
// well-formed and malformed UTF-16 without validation and a second pass.
#if defined(__GNUC__) || defined(__clang__)
__attribute__((always_inline))
#endif
static inline jint simdutf_count_java_code_points_loop(const char16_t* input, jint len) {
  jint pairs = 0;
  for (jint i = 1; i < len; i++) {
    jint high = (input[i - 1] & 0xfc00) == 0xd800;
    jint low = (input[i] & 0xfc00) == 0xdc00;
    pairs += high & low;
  }
  return len - pairs;
}

#if defined(AMD64) && !defined(ZERO) && (defined(__GNUC__) || defined(__clang__))
// Compile this reduction for the selected ISA even in a baseline x64 build.
// The generic implementation remains available for older CPUs and UseAVX=0.
__attribute__((target("avx2")))
static jint simdutf_count_java_code_points_avx2(const char16_t* input, jint len) {
  return simdutf_count_java_code_points_loop(input, len);
}
#endif

static jint simdutf_count_java_code_points(const char16_t* input, jint len) {
#if defined(AMD64) && !defined(ZERO) && (defined(__GNUC__) || defined(__clang__))
  if (UseAVX >= 2 && VM_Version::supports_avx() && VM_Version::supports_avx2()) {
    return simdutf_count_java_code_points_avx2(input, len);
  }
#endif
  return simdutf_count_java_code_points_loop(input, len);
}

static jint simdutf_representable_prefix(const char16_t* input, jint len, char16_t maximum) {
  for (jint off = 0; off < len; off += 256) {
    jint end = MIN2(off + 256, len);
    char16_t bits = 0;
    for (jint i = off; i < end; i++) {
      bits |= input[i];
    }
    if (bits > maximum) {
      jint prefix = off;
      // Keep the scalar rescan bounded even if another thread changes input.
      while (prefix < end && input[prefix] <= maximum) {
        prefix++;
      }
      if (prefix < end) {
        return prefix;
      }
    }
  }
  return len;
}

static bool simdutf_utf8_is_latin1(const char* input, jint len) {
  char latin1[4096];
  for (jint off = 0; off < len;) {
    size_t size = MIN2(sizeof(latin1), size_t(len - off));
    if (off + size < size_t(len)) {
      size = simdutf::trim_partial_utf8(input + off, size);
    }
    if (size == 0 || simdutf::convert_utf8_to_latin1_with_errors(
        input + off, size, latin1).error != simdutf::SUCCESS) {
      return false;
    }
    off += checked_cast<jint>(size);
  }
  return true;
}

static jint simdutf_decode_latin1(const char* input, jint len, char* output, jint capacity) {
  // Reject other code points before writing, including for in-place callers.
  if (capacity < len || !simdutf_utf8_is_latin1(input, len)) {
    return -1;
  }
  char utf8[4096];
  char latin1[4096];
  jint written = 0;
  for (jint off = 0; off < len;) {
    size_t size = MIN2(sizeof(utf8), size_t(len - off));
    memcpy(utf8, input + off, size);
    if (off + size < size_t(len)) {
      size = simdutf::trim_partial_utf8(utf8, size);
    }
    if (size == 0) {
      return -1;
    }
    size_t count = simdutf::convert_utf8_to_latin1(utf8, size, latin1);
    if (count == 0 || count > size_t(capacity - written)) {
      return -1;
    }
    // Copy only the produced bytes. Input is staged before writing, so the
    // shrinking conversion is safe when output starts at/before input.
    memcpy(output + written, latin1, count);
    written += checked_cast<jint>(count);
    off += checked_cast<jint>(size);
  }
  return written;
}

// Snapshot mutable input before conversion. Use stack output when the
// destination lacks worst-case room, then copy only a result that fits.
static jint simdutf_decode_utf8_bounded(const char* input, jint len, char16_t* output, jint capacity) {
#ifdef AARCH64
  const size_t block_size = 4096;
#else
  const size_t block_size = 1024;
#endif
  char utf8[block_size];
  char16_t utf16[block_size];
  jint written = 0;
  for (jint off = 0; off < len;) {
    size_t size = MIN2(block_size, size_t(len - off));
    memcpy(utf8, input + off, size);
    if (off + size < size_t(len)) {
      size = simdutf::trim_partial_utf8(utf8, size);
    }
    if (size == 0) {
      return -off - 1;
    }
    char16_t* target = utf16;
#ifdef AARCH64
    simdutf::result validation = simdutf::validate_utf8_with_errors(utf8, size);
    if (validation.error != simdutf::SUCCESS) {
      return -checked_cast<jint>(size_t(off) + validation.count) - 1;
    }
    if (size <= size_t(capacity - written)) {
      target = output + written;
    }
    // The validated snapshot cannot change before the unchecked conversion.
    size_t count = simdutf::convert_valid_utf8_to_utf16(utf8, size, target);
#else
    size_t count = simdutf::convert_utf8_to_utf16(utf8, size, target);
    if (count == 0) {
      simdutf::result validation = simdutf::validate_utf8_with_errors(utf8, size);
      return -checked_cast<jint>(size_t(off) + validation.count) - 1;
    }
#endif
    if (count == 0 || count > size_t(capacity - written)) {
      return -1;
    }
    if (target != output + written) {
      memcpy(output + written, target, count * sizeof(char16_t));
    }
    written += checked_cast<jint>(count);
    off += checked_cast<jint>(size);
  }
  return written;
}

static jint simdutf_encode_utf32_tight(const char16_t* input, jint len, char* output,
                                     jint capacity, bool swap) {
  char16_t utf16[512];
  char32_t utf32[512];
  jint written = 0;
  for (jint off = 0; off < len;) {
    size_t size = MIN2(size_t(512), size_t(len - off));
    memcpy(utf16, input + off, size * sizeof(char16_t));
    if (off + size < size_t(len)) {
      size = simdutf::trim_partial_utf16(utf16, size);
    }
    if (size == 0) {
      return -1;
    }
    size_t count = simdutf::convert_utf16_to_utf32(utf16, size, utf32);
    size_t bytes = count * sizeof(char32_t);
    if (count == 0 || bytes > size_t(capacity - written)) {
      return -1;
    }
    if (swap) {
      for (size_t i = 0; i < count; i++) {
        utf32[i] = simdutf_swap32(utf32[i]);
      }
    }
    memcpy(output + written, utf32, bytes);
    written += checked_cast<jint>(bytes);
    off += checked_cast<jint>(size);
  }
  return written;
}

static jint simdutf_count_ascii(const char* input, jint len) {
  simdutf::result r = simdutf::validate_ascii_with_errors(input, len);
  return r.error == simdutf::SUCCESS ? len : checked_cast<jint>(r.count);
}

JRT_LEAF(jint, SimdUTF::count_positives(oopDesc* src_raw, jint sp, jint len))
  oop src = src_raw;
  if (len < 0 || len > 1024 * 1024 || !simdutf_range(src, false, sp, len)) {
    return -1;
  }
  const jbyte* input = reinterpret_cast<const jbyte*>(simdutf_base(src, false, sp));
  if (len > 0 && input[0] < 0) {
    return 0;
  }
  if (UseSIMDUTFIntrinsics && simdutf_implementation != nullptr && len >= SIMDUTFMinLength) {
    return simdutf_count_ascii(reinterpret_cast<const char*>(input), len);
  }
  jint count = 0;
  while (count < len && input[count] >= 0) {
    count++;
  }
  return count;
JRT_END

JRT_LEAF(jint, SimdUTF::process(oopDesc* src_raw, jint sp, jint len,
                               oopDesc* dst_raw, jint dp, jint capacity, jint operation))
  if (simdutf_implementation == nullptr || len <= 0 || len > 1024 * 1024 ||
      operation < COUNT_ASCII || operation > VALIDATE_UTF8_LATIN1) {
    return -1;
  }
  // Construct checked C++ oops only after entering through the raw-pointer ABI.
  oop src = src_raw;
  oop dst = dst_raw;
  bool src16 = (operation >= ENCODE_UTF16 && operation <= ENCODE_LATIN1_FROM_UTF16) ||
               (operation >= VALIDATE_UTF16 && operation <= ENCODED_LENGTH_UTF16) ||
               operation == ENCODE_UTF16_BE || operation == ENCODE_UTF16_LE ||
               operation == ENCODE_UTF32_BE || operation == ENCODE_UTF32_LE ||
               operation == COUNT_CODE_POINTS || operation == COPY_UTF16 ||
               operation == INDEX_OF_UTF16;
  bool dst16 = operation == DECODE_UTF8 ||
               operation == DECODE_UTF16_BE || operation == DECODE_UTF16_LE ||
               operation == INFLATE_LATIN1 ||
               operation == DECODE_UTF32_BE || operation == DECODE_UTF32_LE ||
               operation == COPY_UTF16;
  if (!simdutf_range(src, src16, sp, len)) {
    return -1;
  }
  const char* input = reinterpret_cast<const char*>(simdutf_base(src, src16, sp));
  if (operation == COUNT_ASCII) {
    return simdutf_count_ascii(input, len);
  }
  const char16_t* input16 = reinterpret_cast<const char16_t*>(input);
  switch (operation) {
    case VALIDATE_UTF8_LATIN1:
      return simdutf_utf8_is_latin1(input, len) ? 1 : 0;
    // Searches use dp as the character and return len when it is absent.
    case INDEX_OF_LATIN1:
      if (dp < 0 || dp > 0xff) {
        return -1;
      }
      return checked_cast<jint>(simdutf::find(input, input + len, char(dp)) - input);
    case INDEX_OF_UTF16:
      if (dp < 0 || dp > 0xffff) {
        return -1;
      }
      return checked_cast<jint>(simdutf::find(input16, input16 + len, char16_t(dp)) - input16);
    case VALIDATE_UTF16:
      return simdutf::validate_utf16(input16, len) ? 1 : 0;
    case COUNT_CODE_POINTS:
      return simdutf_count_java_code_points(input16, len);
    case VALIDATE_ASCII:
      return simdutf::validate_utf16_as_ascii(input16, len) ? 1 : 0;
    case VALIDATE_LATIN1:
      return simdutf_representable_prefix(input16, len, 0xff) == len ? 1 : 0;
    case ENCODED_LENGTH_UTF16: {
      if (!simdutf::validate_utf16(input16, len)) {
        return -1;
      }
      size_t bytes = simdutf::utf8_length_from_utf16(input16, len);
      return bytes > size_t(max_jint) ? -1 : checked_cast<jint>(bytes);
    }
    case ENCODED_LENGTH_LATIN1: {
      size_t bytes = simdutf::utf8_length_from_latin1(input, len);
      return bytes > size_t(max_jint) ? -1 : checked_cast<jint>(bytes);
    }
  }
  if ((src == dst && (operation != DECODE_LATIN1 || dp > sp)) || !simdutf_range(dst, dst16, dp, capacity)) {
    return -1;
  }
  char* output = reinterpret_cast<char*>(simdutf_base(dst, dst16, dp));
  size_t written = 0;
  switch (operation) {
    case COPY_UTF16:
      // String's raw copy operations preserve all UTF-16 code units, including
      // isolated surrogates. Both checked ranges use native-endian char units.
      if (capacity < len) {
        return -1;
      }
      memcpy(output, input, size_t(len) * 2);
      return len;
    case DECODE_LATIN1:
      return simdutf_decode_latin1(input, len, output, capacity);
    case ENCODE_UTF32_BE:
    case ENCODE_UTF32_LE: {
      if ((dp & 3) != 0 || simdutf::validate_utf16_with_errors(input16, len).error != simdutf::SUCCESS) {
        return -1;
      }
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == ENCODE_UTF32_BE;
#else
      bool swap = operation == ENCODE_UTF32_LE;
#endif
      if (size_t(capacity) < size_t(len) * 4) {
        if (simdutf::utf32_length_from_utf16(input16, len) > size_t(capacity) / 4) {
          return -1;
        }
        return simdutf_encode_utf32_tight(input16, len, output, capacity, swap);
      }
      char32_t* output32 = reinterpret_cast<char32_t*>(output);
      simdutf::result r = simdutf::convert_utf16_to_utf32_with_errors(input16, len, output32);
      if (r.error != simdutf::SUCCESS) {
        return -1;
      }
      size_t count = r.count;
      if (swap) {
        for (size_t i = 0; i < count; i++) {
          output32[i] = simdutf_swap32(output32[i]);
        }
      }
      written = count * 4;
      break;
    }
    case DECODE_UTF32_BE:
    case DECODE_UTF32_LE: {
      if ((sp & 3) != 0 || (len & 3) != 0 || capacity < len / 4) {
        return -1;
      }
      const char32_t* input32 = reinterpret_cast<const char32_t*>(input);
      char16_t* output16 = reinterpret_cast<char16_t*>(output);
      size_t count = size_t(len) / 4;
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == DECODE_UTF32_BE;
#else
      bool swap = operation == DECODE_UTF32_LE;
#endif
      if (!swap && capacity >= len / 2) {
        // Java also accepts UTF-32 surrogate code points. simdutf rejects them,
        // so let the existing decoder handle that dialect without any writes.
        if (simdutf::validate_utf32_with_errors(input32, count).error != simdutf::SUCCESS) {
          return -1;
        }
        simdutf::result r = simdutf::convert_utf32_to_utf16_with_errors(input32, count, output16);
        if (r.error != simdutf::SUCCESS) {
          return -1;
        }
        written = r.count;
      } else {
        // Bounded stack storage avoids allocation and accommodates either byte
        // order. Validate every chunk before changing the Java output array.
        char32_t chunk[256];
        size_t required = 0;
        for (size_t off = 0; off < count; off += 256) {
          size_t size = MIN2(size_t(256), count - off);
          for (size_t i = 0; i < size; i++) {
            chunk[i] = swap ? simdutf_swap32(input32[off + i]) : input32[off + i];
          }
          if (!simdutf::validate_utf32(chunk, size)) {
            return -1;
          }
          required += simdutf::utf16_length_from_utf32(chunk, size);
          if (required > size_t(capacity)) {
            return -1;
          }
        }
        for (size_t off = 0; off < count; off += 256) {
          size_t size = MIN2(size_t(256), count - off);
          for (size_t i = 0; i < size; i++) {
            chunk[i] = swap ? simdutf_swap32(input32[off + i]) : input32[off + i];
          }
          if (!simdutf::validate_utf32(chunk, size) ||
              simdutf::utf16_length_from_utf32(chunk, size) > size_t(capacity) - written) {
            return -1;
          }
          size_t n = simdutf::convert_utf32_to_utf16(chunk, size, output16 + written);
          if (n == 0) {
            return -1;
          }
          written += n;
        }
      }
      break;
    }
    case ENCODE_UTF16_BE:
    case ENCODE_UTF16_LE: {
      if ((dp & 1) != 0 || size_t(capacity) < size_t(len) * 2 ||
          simdutf::validate_utf16_with_errors(input16, len).error != simdutf::SUCCESS) {
        return -1;
      }
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == ENCODE_UTF16_BE;
#else
      bool swap = operation == ENCODE_UTF16_LE;
#endif
      if (swap) {
        simdutf::change_endianness_utf16(input16, len, reinterpret_cast<char16_t*>(output));
      } else {
        memcpy(output, input, size_t(len) * 2);
      }
      written = size_t(len) * 2;
      break;
    }
    case DECODE_UTF16_BE:
    case DECODE_UTF16_LE: {
      if ((sp & 1) != 0 || (len & 1) != 0 || capacity < len / 2) {
        return -1;
      }
      bool big = operation == DECODE_UTF16_BE;
      simdutf::result r = big ? simdutf::validate_utf16be_with_errors(input16, len / 2)
                             : simdutf::validate_utf16le_with_errors(input16, len / 2);
      if (r.error != simdutf::SUCCESS) {
        return -1;
      }
#ifdef VM_LITTLE_ENDIAN
      bool swap = big;
#else
      bool swap = !big;
#endif
      if (swap) {
        simdutf::change_endianness_utf16(input16, len / 2, reinterpret_cast<char16_t*>(output));
      } else {
        memcpy(output, input, len);
      }
      written = len / 2;
      break;
    }
    case DECODE_UTF8: {
      bool bounded = capacity < len;
#ifdef AARCH64
      bounded |= static_cast<unsigned char>(input[0]) >= 0x80;
#endif
      if (bounded) {
        return simdutf_decode_utf8_bounded(input, len, reinterpret_cast<char16_t*>(output), capacity);
      }
      simdutf::result validation = simdutf::validate_utf8_with_errors(input, len);
      if (validation.error != simdutf::SUCCESS) {
        return -checked_cast<jint>(validation.count) - 1;
      }
      simdutf::result r = simdutf::convert_utf8_to_utf16_with_errors(input, len, reinterpret_cast<char16_t*>(output));
      if (r.error != simdutf::SUCCESS) {
        return -1;
      }
      written = r.count;
      break;
    }
    case ENCODE_LATIN1:
      // Reserve the worst case so success always describes the entire input,
      // including when callers mutate it during conversion.
      if (size_t(capacity) < size_t(len) * 2) {
        return -1;
      }
      written = simdutf::convert_latin1_to_utf8(input, len, output);
      break;
    case ENCODE_UTF16: {
      if (simdutf::validate_utf16_with_errors(input16, len).error != simdutf::SUCCESS) {
        return -1;
      }
      if (size_t(capacity) >= size_t(len) * 3) {
        // A worst-case-sized output needs no capacity-bounded scalar tail.
        simdutf::result r = simdutf::convert_utf16_to_utf8_with_errors(input16, len, output);
        if (r.error != simdutf::SUCCESS) {
          return -1;
        }
        written = r.count;
      } else {
        if (simdutf::utf8_length_from_utf16(input16, len) > size_t(capacity)) {
          return -1;
        }
        simdutf::full_result r = simdutf::convert_utf16_to_utf8_safe_with_details(
            input16, len, output, capacity);
        // A mutable input can grow after the length check. Never report a
        // truncated prefix as if the entire charset input had been consumed.
        if (r.error != simdutf::SUCCESS || r.input_count != size_t(len)) {
          return -1;
        }
        written = r.output_count;
      }
      break;
    }
    case ENCODE_ASCII: {
      if (capacity < len) {
        return -1;
      }
      jint prefix = simdutf::validate_utf16_as_ascii(input16, len)
          ? len : simdutf_representable_prefix(input16, len, 0x7f);
      if (prefix == 0) {
        return 0;
      }
      written = simdutf::convert_utf16_to_latin1(input16, prefix, output);
      break;
    }
    case ENCODE_LATIN1_FROM_UTF16: {
      if (capacity < len) {
        return -1;
      }
      jint prefix = simdutf_representable_prefix(input16, len, 0xff);
      // Return precisely the representable prefix, as Java's narrowing helpers
      // do. Stop validation near the first error so repeated replacement cannot
      // turn a dense unmappable input into a quadratic scan.
      if (prefix == 0) {
        return 0;
      }
      written = simdutf::convert_utf16_to_latin1(input16, prefix, output);
      return written == 0 ? -1 : checked_cast<jint>(written);
    }
    case INFLATE_LATIN1:
      if (capacity < len) {
        return -1;
      }
      written = simdutf::convert_latin1_to_utf16(input, len, reinterpret_cast<char16_t*>(output));
      break;
    case ENCODE_BASE64:
    case ENCODE_BASE64_URL:
      if (len % 3 != 0 || size_t(capacity) < size_t(len) / 3 * 4) {
        return -1;
      }
      written = simdutf::binary_to_base64(input, len, output,
          operation == ENCODE_BASE64_URL ? simdutf::base64_url : simdutf::base64_default);
      break;
    case DECODE_BASE64:
    case DECODE_BASE64_URL: {
      if (len % 4 != 0 || size_t(capacity) < size_t(len) / 4 * 3) {
        return -1;
      }
      unsigned invalid = 0;
      bool url = operation == DECODE_BASE64_URL;
      for (jint i = 0; i < len; i++) {
        unsigned c = static_cast<unsigned char>(input[i]);
        invalid |= !((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') ||
                     (c >= '0' && c <= '9') || c == (url ? '-' : '+') || c == (url ? '_' : '/'));
      }
      if (invalid != 0) {
        return -1;
      }
      size_t outlen = capacity;
      simdutf::result r = simdutf::base64_to_binary_safe(input, len, output, outlen,
          operation == DECODE_BASE64_URL ? simdutf::base64_url : simdutf::base64_default,
          simdutf::only_full_chunks);
      // simdutf ignores ASCII whitespace. Java's block helper consumes only
      // alphabet bytes, so accept only an exact full-block conversion.
      if (r.error != simdutf::SUCCESS || r.count != size_t(len) || outlen != size_t(len) / 4 * 3) {
        return -1;
      }
      written = outlen;
      break;
    }
  }
  return written == 0 || written > size_t(max_jint) ? -1 : checked_cast<jint>(written);
JRT_END

JVM_ENTRY(jint, SimdUTF_process(JNIEnv* env, jclass cls, jobject src, jint sp,
                              jint len, jobject dst, jint dp, jint capacity, jint operation))
  return SimdUTF::process(JNIHandles::resolve(src), sp, len,
                         JNIHandles::resolve(dst), dp, capacity, operation);
JVM_END

JVM_ENTRY(jint, JVM_RegisterSimdUTFMethods(JNIEnv* env, jclass cls))
  JNINativeMethod methods[] = {
    {const_cast<char*>("process0"),
     const_cast<char*>("(Ljava/lang/Object;IILjava/lang/Object;III)I"),
     CAST_FROM_FN_PTR(void*, SimdUTF_process)}
  };
  {
    ThreadToNativeFromVM transition(thread);
    int result = env->RegisterNatives(cls, methods, 1);
    guarantee(result == 0, "register jdk.internal.util.SimdUTF natives");
  }
  return SimdUTF::initialize();
JVM_END
