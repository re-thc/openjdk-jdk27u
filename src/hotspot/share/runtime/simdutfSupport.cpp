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

#include "jvm.h"
#include "oops/typeArrayOop.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/simdutfSupport.hpp"
#include "runtime/vm_version.hpp"
#include "simdutf.h"

static const simdutf::implementation* simdutf_implementation = nullptr;

jint SimdUTF::initialize() {
  if (!UseSIMDUTFIntrinsics) {
    return -1;
  }
  const auto& implementations = simdutf::get_available_implementations();
  const simdutf::implementation* impl = nullptr;
#if defined(AMD64) && !defined(ZERO)
  // Respect HotSpot's user-selected ISA limits as well as OS register support.
  if (UseAVX >= 3 && VM_Version::supports_avx512_vbmi2()) {
    impl = implementations["icelake"];
  }
  if (impl == nullptr || !impl->supported_by_runtime_system()) {
    impl = UseAVX >= 2 ? implementations["haswell"] : nullptr;
  }
  if (impl == nullptr || !impl->supported_by_runtime_system()) {
    impl = UseSSE >= 4 ? implementations["westmere"] : nullptr;
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
  // interpreter VM can use the lower crossover measured for that tier.
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

static jint simdutf_representable_prefix(const char16_t* input, jint len, char16_t maximum) {
  for (jint off = 0; off < len; off += 256) {
    jint end = MIN2(off + 256, len);
    char16_t bits = 0;
    for (jint i = off; i < end; i++) bits |= input[i];
    if (bits > maximum) {
      jint prefix = off;
      // Keep the scalar rescan bounded even if another thread changes input.
      while (prefix < end && input[prefix] <= maximum) prefix++;
      if (prefix < end) return prefix;
    }
  }
  return len;
}

static jint simdutf_decode_latin1(const char* input, jint len, char* output, jint capacity) {
  if (capacity < len || !simdutf::validate_utf8(input, len)) return -1;
  uint8_t maximum = 0;
  for (jint i = 0; i < len; i++) maximum = MAX2(maximum, uint8_t(input[i]));
  // Valid UTF-8 represents Latin-1 exactly when every byte is below 0xc4.
  // Reject other code points before writing, including for in-place callers.
  if (maximum >= 0xc4) return -1;
  char utf8[256];
  char latin1[256];
  jint written = 0;
  for (jint off = 0; off < len;) {
    size_t size = MIN2(size_t(256), size_t(len - off));
    memcpy(utf8, input + off, size);
    if (off + size < size_t(len)) size = simdutf::trim_partial_utf8(utf8, size);
    if (size == 0) return -1;
    size_t count = simdutf::convert_utf8_to_latin1(utf8, size, latin1);
    if (count == 0 || count > size_t(capacity - written)) return -1;
    // Copy only the produced bytes. Input is staged before writing, so the
    // shrinking conversion is safe when output starts at/before input.
    memcpy(output + written, latin1, count);
    written += checked_cast<jint>(count);
    off += checked_cast<jint>(size);
  }
  return written;
}

JRT_LEAF(jint, SimdUTF::process(oop src, jint sp, jint len, oop dst, jint dp,
                               jint capacity, jint operation))
  if (simdutf_implementation == nullptr || len <= 0 || len > 1024 * 1024 || operation < 0 || operation > 26) {
    return -1;
  }
  bool src16 = (operation >= 3 && operation <= 5) ||
               (operation >= 10 && operation <= 13) || operation == 15 || operation == 16 ||
               operation == 20 || operation == 21 || operation == 25 || operation == 26;
  bool dst16 = operation == 1 || operation == 17 || operation == 18 || operation == 19 ||
               operation == 22 || operation == 23 || operation == 26;
  if (!simdutf_range(src, src16, sp, len)) {
    return -1;
  }
  const char* input = reinterpret_cast<const char*>(simdutf_base(src, src16, sp));
  if (operation == 0) {
    simdutf::result r = simdutf::validate_ascii_with_errors(input, len);
    return r.error == simdutf::SUCCESS ? len : checked_cast<jint>(r.count);
  }
  const char16_t* input16 = reinterpret_cast<const char16_t*>(input);
  switch (operation) {
    case 10: return simdutf::validate_utf16(input16, len) ? 1 : 0;
    case 25:
      // Java counts isolated surrogates as code points. Use its original loop
      // for that dialect; simdutf's count requires a valid scalar sequence.
      return simdutf::validate_utf16(input16, len)
          ? checked_cast<jint>(simdutf::count_utf16(input16, len)) : -1;
    case 11: return simdutf::validate_utf16_as_ascii(input16, len) ? 1 : 0;
    case 12: {
      return simdutf_representable_prefix(input16, len, 0xff) == len ? 1 : 0;
    }
    case 13: {
      if (!simdutf::validate_utf16(input16, len)) return -1;
      size_t bytes = simdutf::utf8_length_from_utf16(input16, len);
      return bytes > size_t(max_jint) ? -1 : checked_cast<jint>(bytes);
    }
    case 14: {
      size_t bytes = simdutf::utf8_length_from_latin1(input, len);
      return bytes > size_t(max_jint) ? -1 : checked_cast<jint>(bytes);
    }
  }
  if ((src == dst && (operation != 24 || dp > sp)) || !simdutf_range(dst, dst16, dp, capacity)) {
    return -1;
  }
  char* output = reinterpret_cast<char*>(simdutf_base(dst, dst16, dp));
  size_t written = 0;
  switch (operation) {
    case 26:
      // String's raw copy operations preserve all UTF-16 code units, including
      // isolated surrogates. Both checked ranges use native-endian char units.
      if (capacity < len) return -1;
      memcpy(output, input, size_t(len) * 2);
      return len;
    case 24:
      return simdutf_decode_latin1(input, len, output, capacity);
    case 20:
    case 21: {
      // Reserve the worst case before exposing arrays to an unchecked writer.
      if ((dp & 3) != 0 || size_t(capacity) < size_t(len) * 4 ||
          !simdutf::validate_utf16(input16, len)) return -1;
      char32_t* output32 = reinterpret_cast<char32_t*>(output);
      size_t count = simdutf::convert_utf16_to_utf32(input16, len, output32);
      if (count == 0) return -1;
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == 20;
#else
      bool swap = operation == 21;
#endif
      if (swap) {
        for (size_t i = 0; i < count; i++) output32[i] = simdutf_swap32(output32[i]);
      }
      written = count * 4;
      break;
    }
    case 22:
    case 23: {
      if ((sp & 3) != 0 || (len & 3) != 0 || capacity < len / 4) return -1;
      const char32_t* input32 = reinterpret_cast<const char32_t*>(input);
      char16_t* output16 = reinterpret_cast<char16_t*>(output);
      size_t count = size_t(len) / 4;
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == 22;
#else
      bool swap = operation == 23;
#endif
      if (!swap && capacity >= len / 2) {
        // Java also accepts UTF-32 surrogate code points. simdutf rejects them,
        // so let the existing decoder handle that dialect without any writes.
        if (!simdutf::validate_utf32(input32, count)) return -1;
        written = simdutf::convert_utf32_to_utf16(input32, count, output16);
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
          if (!simdutf::validate_utf32(chunk, size)) return -1;
          required += simdutf::utf16_length_from_utf32(chunk, size);
          if (required > size_t(capacity)) return -1;
        }
        for (size_t off = 0; off < count; off += 256) {
          size_t size = MIN2(size_t(256), count - off);
          for (size_t i = 0; i < size; i++) {
            chunk[i] = swap ? simdutf_swap32(input32[off + i]) : input32[off + i];
          }
          if (!simdutf::validate_utf32(chunk, size) ||
              simdutf::utf16_length_from_utf32(chunk, size) > size_t(capacity) - written) return -1;
          size_t n = simdutf::convert_utf32_to_utf16(chunk, size, output16 + written);
          if (n == 0) return -1;
          written += n;
        }
      }
      break;
    }
    case 15:
    case 16: {
      if ((dp & 1) != 0 || size_t(capacity) < size_t(len) * 2 ||
          !simdutf::validate_utf16(input16, len)) return -1;
#ifdef VM_LITTLE_ENDIAN
      bool swap = operation == 15;
#else
      bool swap = operation == 16;
#endif
      if (swap) {
        simdutf::change_endianness_utf16(input16, len, reinterpret_cast<char16_t*>(output));
      } else {
        memcpy(output, input, size_t(len) * 2);
      }
      written = size_t(len) * 2;
      break;
    }
    case 17:
    case 18: {
      if ((sp & 1) != 0 || (len & 1) != 0 || capacity < len / 2) return -1;
      bool big = operation == 17;
      if (!(big ? simdutf::validate_utf16be(input16, len / 2)
                : simdutf::validate_utf16le(input16, len / 2))) return -1;
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
    case 1:
      // Worst-case capacity remains safe even if a caller mutates its input.
      if (capacity < len || !simdutf::validate_utf8(input, len)) return -1;
      written = simdutf::convert_utf8_to_utf16(input, len, reinterpret_cast<char16_t*>(output));
      break;
    case 2:
      written = simdutf::convert_latin1_to_utf8_safe(input, len, output, capacity);
      break;
    case 3:
      if (!simdutf::validate_utf16(input16, len)) return -1;
      if (size_t(capacity) < size_t(len) * 3 &&
          simdutf::utf8_length_from_utf16(input16, len) > size_t(capacity)) return -1;
      written = simdutf::convert_utf16_to_utf8_safe(input16, len, output, capacity);
      break;
    case 4: {
      if (capacity < len) return -1;
      jint prefix = simdutf::validate_utf16_as_ascii(input16, len)
          ? len : simdutf_representable_prefix(input16, len, 0x7f);
      if (prefix == 0) return 0;
      written = simdutf::convert_utf16_to_latin1(input16, prefix, output);
      break;
    }
    case 5: {
      if (capacity < len) return -1;
      jint prefix = simdutf_representable_prefix(input16, len, 0xff);
      // Return precisely the representable prefix, as Java's narrowing helpers
      // do. Stop validation near the first error so repeated replacement cannot
      // turn a dense unmappable input into a quadratic scan.
      if (prefix == 0) return 0;
      written = simdutf::convert_utf16_to_latin1(input16, prefix, output);
      return written == 0 ? -1 : checked_cast<jint>(written);
    }
    case 19:
      if (capacity < len) return -1;
      written = simdutf::convert_latin1_to_utf16(input, len, reinterpret_cast<char16_t*>(output));
      break;
    case 6:
    case 7:
      if (len % 3 != 0 || size_t(capacity) < size_t(len) / 3 * 4) return -1;
      written = simdutf::binary_to_base64(input, len, output,
          operation == 7 ? simdutf::base64_url : simdutf::base64_default);
      break;
    case 8:
    case 9: {
      if (len % 4 != 0 || size_t(capacity) < size_t(len) / 4 * 3) return -1;
      unsigned invalid = 0;
      bool url = operation == 9;
      for (jint i = 0; i < len; i++) {
        unsigned c = static_cast<unsigned char>(input[i]);
        invalid |= !((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') ||
                     (c >= '0' && c <= '9') || c == (url ? '-' : '+') || c == (url ? '_' : '/'));
      }
      if (invalid != 0) return -1;
      size_t outlen = capacity;
      simdutf::result r = simdutf::base64_to_binary_safe(input, len, output, outlen,
          operation == 9 ? simdutf::base64_url : simdutf::base64_default,
          simdutf::only_full_chunks);
      // simdutf ignores ASCII whitespace. Java's block helper consumes only
      // alphabet bytes, so accept only an exact full-block conversion.
      if (r.error != simdutf::SUCCESS || r.count != size_t(len) || outlen != size_t(len) / 4 * 3) return -1;
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
