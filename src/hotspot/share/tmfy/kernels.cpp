/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
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
 */
#include "kernels.h"
#include "simdutf.h"

#include <atomic>
#include <cstring>

// All available implementations are immutable process-lifetime objects.
static std::atomic<const simdutf::implementation*> implementation(nullptr);
static_assert(ATOMIC_POINTER_LOCK_FREE == 2, "leaf dispatch requires lock-free pointer loads");
static_assert(sizeof(char16_t) == 2, "UTF16 storage uses two-byte code units");
static_assert(TMFY_CHARSET_MAX_UNITS <= TMFY_CHARSET_UNITS_MASK,
              "CharsetEncoder consumed count must fit packed result");
static_assert(3 * TMFY_CHARSET_MAX_UNITS <= TMFY_CHARSET_BYTES_MASK,
              "CharsetEncoder output count must fit packed result");
static_assert(simdutf::SIMDUTF_VERSION_MAJOR == 9 &&
              simdutf::SIMDUTF_VERSION_MINOR == 2 &&
              simdutf::SIMDUTF_VERSION_REVISION == 1,
              "re-audit complete SIMD target groups before changing simdutf");

#define TMFY_CHECK_ISA(name) \
  static_assert(uint32_t(TMFY_ISA_##name) == uint32_t(simdutf::internal::name), \
                "pinned simdutf ISA ABI changed")
TMFY_CHECK_ISA(NEON);
TMFY_CHECK_ISA(AVX2);
TMFY_CHECK_ISA(SSE42);
TMFY_CHECK_ISA(PCLMULQDQ);
TMFY_CHECK_ISA(BMI1);
TMFY_CHECK_ISA(BMI2);
TMFY_CHECK_ISA(ALTIVEC);
TMFY_CHECK_ISA(AVX512F);
TMFY_CHECK_ISA(AVX512DQ);
TMFY_CHECK_ISA(AVX512IFMA);
TMFY_CHECK_ISA(AVX512PF);
TMFY_CHECK_ISA(AVX512ER);
TMFY_CHECK_ISA(AVX512CD);
TMFY_CHECK_ISA(AVX512BW);
TMFY_CHECK_ISA(AVX512VL);
TMFY_CHECK_ISA(AVX512VBMI2);
TMFY_CHECK_ISA(AVX512VPOPCNTDQ);
TMFY_CHECK_ISA(RVV);
TMFY_CHECK_ISA(ZVBB);
TMFY_CHECK_ISA(LSX);
TMFY_CHECK_ISA(LASX);
TMFY_CHECK_ISA(SVE);
TMFY_CHECK_ISA(SVE2);
#undef TMFY_CHECK_ISA

static bool admitted(const simdutf::implementation* selected, uint32_t mask) {
  return (selected->required_instruction_sets() & ~mask) == 0;
}

extern "C" int32_t tmfy_runtime_initialize_with_isa(uint32_t admitted_mask) {
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected != nullptr) {
    return admitted(selected, admitted_mask) ? 0 : TMFY_BAD_ARGUMENT;
  }
  // The upstream list is fastest first and excludes the unsupported sentinel.
  // This initializer trusts the VM's effective mask, not environment overrides.
  for (const simdutf::implementation* candidate : simdutf::get_available_implementations()) {
    if (admitted(candidate, admitted_mask)) {
      selected = candidate;
      break;
    }
  }
  if (selected == nullptr) {
    return TMFY_NOT_INITIALIZED;
  }
  const simdutf::implementation* expected = nullptr;
  if (!implementation.compare_exchange_strong(expected, selected,
                                               std::memory_order_release,
                                               std::memory_order_acquire)) {
    return admitted(expected, admitted_mask) ? 0 : TMFY_BAD_ARGUMENT;
  }
  return 0;
}

extern "C" int32_t tmfy_runtime_initialize(void) {
  return tmfy_runtime_initialize_with_isa(simdutf::internal::detect_supported_architectures());
}

extern "C" const char* tmfy_implementation_name(void) {
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  // In pinned 9.2.1, name() is a string_view over _name, a const char* set
  // from a static NUL-terminated literal in every implementation constructor.
  return selected == nullptr ? "uninitialized" : selected->name().data();
}

static bool valid_spans(const uint8_t* input, size_t length, uint8_t* output,
                        size_t capacity, size_t reserved) {
  if (input == nullptr || output == nullptr || capacity < reserved) {
    return false;
  }
  const uintptr_t source = reinterpret_cast<uintptr_t>(input);
  const uintptr_t target = reinterpret_cast<uintptr_t>(output);
  return length <= UINTPTR_MAX - source && reserved <= UINTPTR_MAX - target &&
      (source <= target ? target - source >= length : source - target >= reserved);
}

static bool aligned_utf16(const void* pointer) {
  return reinterpret_cast<uintptr_t>(pointer) % alignof(char16_t) == 0;
}

static uint16_t load_utf16(const uint8_t* input, size_t index) {
  uint16_t value;
  std::memcpy(&value, input + 2 * index, sizeof(value));
  return value;
}

static void store_utf16(uint8_t* output, size_t index, uint16_t value) {
  std::memcpy(output + 2 * index, &value, sizeof(value));
}

// Mirrors String.encodeUTF8_UTF16's replacement branch. The reservation of
// three bytes per input code unit bounds every store, including surrogate pairs.
static size_t encode_replacing(const uint8_t* input, size_t units, uint8_t* output) {
  size_t written = 0;
  for (size_t i = 0; i < units; ++i) {
    uint32_t c = load_utf16(input, i);
    if (c < 0x80) {
      output[written++] = uint8_t(c);
    } else if (c < 0x800) {
      output[written++] = uint8_t(0xc0 | (c >> 6));
      output[written++] = uint8_t(0x80 | (c & 0x3f));
    } else if (c >= 0xd800 && c <= 0xdfff) {
      if (c <= 0xdbff && i + 1 < units) {
        const uint16_t low = load_utf16(input, i + 1);
        if (low >= 0xdc00 && low <= 0xdfff) {
          c = 0x10000 + ((c - 0xd800) << 10) + low - 0xdc00;
          output[written++] = uint8_t(0xf0 | (c >> 18));
          output[written++] = uint8_t(0x80 | ((c >> 12) & 0x3f));
          output[written++] = uint8_t(0x80 | ((c >> 6) & 0x3f));
          output[written++] = uint8_t(0x80 | (c & 0x3f));
          ++i;
          continue;
        }
      }
      output[written++] = '?';
    } else {
      output[written++] = uint8_t(0xe0 | (c >> 12));
      output[written++] = uint8_t(0x80 | ((c >> 6) & 0x3f));
      output[written++] = uint8_t(0x80 | (c & 0x3f));
    }
  }
  return written;
}

static bool continuation(uint8_t byte) {
  return (byte & 0xc0) == 0x80;
}

// String.decodeUTF8_UTF16/malformed3/malformed4 are the consumption oracle.
// In particular ED A0 80 consumes all three bytes as ONE U+FFFD, while overlong
// E0 80 80 consumes one byte at a time. A truncated valid prefix consumes the
// complete prefix. Do not replace this with simdutf's different replacement API.
static size_t decode_replacing(const uint8_t* input, size_t length, uint8_t* output) {
  size_t written = 0;
  for (size_t i = 0; i < length;) {
    const uint8_t first = input[i];
    const size_t remaining = length - i;
    uint32_t code = 0xfffd;
    size_t consumed = 1;
    if (first < 0x80) {
      code = first;
    } else if (first >= 0xc2 && first <= 0xdf) {
      if (remaining >= 2 && continuation(input[i + 1])) {
        code = ((first & 0x1f) << 6) | (input[i + 1] & 0x3f);
        consumed = 2;
      }
    } else if (first >= 0xe0 && first <= 0xef) {
      if (remaining >= 2 && continuation(input[i + 1]) &&
          !(first == 0xe0 && input[i + 1] < 0xa0)) {
        consumed = 2;
        if (remaining >= 3 && continuation(input[i + 2])) {
          consumed = 3;
          code = ((first & 0x0f) << 12) | ((input[i + 1] & 0x3f) << 6) |
                 (input[i + 2] & 0x3f);
          if (code >= 0xd800 && code <= 0xdfff) code = 0xfffd;
        }
      }
    } else if (first >= 0xf0 && first <= 0xf4) {
      if (remaining >= 2 && continuation(input[i + 1]) &&
          !(first == 0xf0 && input[i + 1] < 0x90) &&
          !(first == 0xf4 && input[i + 1] >= 0x90)) {
        consumed = 2;
        if (remaining >= 3 && continuation(input[i + 2])) {
          consumed = 3;
          if (remaining >= 4 && continuation(input[i + 3])) {
            consumed = 4;
            code = ((first & 0x07) << 18) | ((input[i + 1] & 0x3f) << 12) |
                   ((input[i + 2] & 0x3f) << 6) | (input[i + 3] & 0x3f);
          }
        }
      }
    }
    if (code >= 0x10000) {
      store_utf16(output, written++, uint16_t(0xd800 + ((code - 0x10000) >> 10)));
      store_utf16(output, written++, uint16_t(0xdc00 + ((code - 0x10000) & 0x3ff)));
    } else {
      store_utf16(output, written++, uint16_t(code));
    }
    i += consumed;
  }
  return written;
}

extern "C" int32_t tmfy_encode_latin1_utf8(const uint8_t* input, size_t length,
                                         uint8_t* output, size_t capacity) {
  if (length > TMFY_CONVERT_MAX_BYTES) return TMFY_NEEDS_GENERAL;
  if (length == 0) return 0;
  const size_t reserved = 2 * length;
  if (!valid_spans(input, length, output, capacity, reserved)) return TMFY_BAD_ARGUMENT;
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) return TMFY_NOT_INITIALIZED;
  const size_t written = selected->convert_latin1_to_utf8(
      reinterpret_cast<const char*>(input), length, reinterpret_cast<char*>(output));
  return written >= length && written <= reserved ? int32_t(written) : TMFY_INTERNAL_ERROR;
}

extern "C" int32_t tmfy_encode_utf16_utf8(const uint8_t* input, size_t length,
                                        uint8_t* output, size_t capacity) {
  if (length > TMFY_CONVERT_MAX_BYTES) return TMFY_NEEDS_GENERAL;
  if (length == 0) return 0;
  if ((length & 1) != 0) return TMFY_BAD_ARGUMENT;
  const size_t units = length / 2;
  const size_t reserved = 3 * units;
  if (!valid_spans(input, length, output, capacity, reserved)) return TMFY_BAD_ARGUMENT;
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) return TMFY_NOT_INITIALIZED;
  const char16_t* source = reinterpret_cast<const char16_t*>(input);
  size_t written;
  // Validation is read-only. Never depend on a converter's partial-write prefix
  // after an error; malformed input finishes entirely in the native scalar path.
#if SIMDUTF_IS_BIG_ENDIAN
  if (aligned_utf16(input) && selected->validate_utf16be(source, units)) {
    written = selected->convert_valid_utf16be_to_utf8(source, units, reinterpret_cast<char*>(output));
#else
  if (aligned_utf16(input) && selected->validate_utf16le(source, units)) {
    written = selected->convert_valid_utf16le_to_utf8(source, units, reinterpret_cast<char*>(output));
#endif
  } else {
    written = encode_replacing(input, units, output);
  }
  return written > 0 && written <= reserved ? int32_t(written) : TMFY_INTERNAL_ERROR;
}

static simdutf::result validate_charset_snapshot(const simdutf::implementation* selected,
                                                 const char16_t* snapshot, size_t units) {
#if SIMDUTF_IS_BIG_ENDIAN
  return selected->validate_utf16be_with_errors(snapshot, units);
#else
  return selected->validate_utf16le_with_errors(snapshot, units);
#endif
}

static bool high_surrogate(char16_t value) {
  return value >= 0xd800 && value <= 0xdbff;
}

static bool low_surrogate(char16_t value) {
  return value >= 0xdc00 && value <= 0xdfff;
}

extern "C" int32_t tmfy_encode_utf16_array_utf8(const uint16_t* input, size_t units,
                                               uint8_t* output, size_t capacity) {
  if (units > TMFY_CHARSET_MAX_UNITS) return TMFY_NEEDS_GENERAL;
  if (units == 0) return 0;
  const size_t length = 2 * units;
  const size_t reserved = 3 * units;
  const uint8_t* source = reinterpret_cast<const uint8_t*>(input);
  if (!valid_spans(source, length, output, capacity, reserved)) return TMFY_BAD_ARGUMENT;
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) return TMFY_NOT_INITIALIZED;

  // Do not clear the whole buffer: early malformed input reads/copies only
  // 16 candidate code units plus a lookahead, at most 34 bytes. Mutable source
  // bytes already captured here must not be reloaded when taking the full path.
  alignas(64) char16_t snapshot[TMFY_CHARSET_MAX_UNITS];
  const size_t preview = units < TMFY_CHARSET_PREVIEW_UNITS ?
      units : TMFY_CHARSET_PREVIEW_UNITS;
  std::memcpy(snapshot, source, 2 * preview);
  simdutf::result checked = validate_charset_snapshot(selected, snapshot, preview);
  size_t captured = preview;
  // A final high surrogate is inconclusive only at an internal preview edge.
  // All other preview errors have enough immutable lookahead to finish now.
  const bool preview_high = checked.error == simdutf::SURROGATE &&
      checked.count == preview - 1 && high_surrogate(snapshot[preview - 1]);
  if (preview < units && (checked.error == simdutf::SUCCESS || preview_high)) {
    if (checked.error == simdutf::SUCCESS && checked.count != preview) {
      return TMFY_INTERNAL_ERROR;
    }
    std::memcpy(snapshot + preview, source + 2 * preview, 2 * (units - preview));
    captured = units;
    checked = validate_charset_snapshot(selected, snapshot, captured);
  }

  size_t consumed;
  uint32_t status;
  if (checked.error == simdutf::SUCCESS) {
    if (captured != units || checked.count != units) return TMFY_INTERNAL_ERROR;
    consumed = units;
    status = TMFY_CHARSET_COMPLETE;
  } else {
    if (checked.error != simdutf::SURROGATE || checked.count >= captured) {
      return TMFY_INTERNAL_ERROR;
    }
    consumed = checked.count;
    const char16_t bad = snapshot[consumed];
    if (high_surrogate(bad)) {
      if (consumed + 1 == units) {
        status = TMFY_CHARSET_INCOMPLETE_HIGH_AT_BLOCK_END;
      } else {
        if (consumed + 1 >= captured || low_surrogate(snapshot[consumed + 1])) {
          return TMFY_INTERNAL_ERROR;
        }
        status = TMFY_CHARSET_MALFORMED_1;
      }
    } else if (low_surrogate(bad)) {
      status = TMFY_CHARSET_MALFORMED_1;
    } else {
      return TMFY_INTERNAL_ERROR;
    }
  }

  // Error-position validation proves [0, consumed) valid. A converter's own
  // partial-write error result is never used, nor is a mutable input re-read.
  size_t written = 0;
  if (consumed != 0) {
#if SIMDUTF_IS_BIG_ENDIAN
    written = selected->convert_valid_utf16be_to_utf8(
        snapshot, consumed, reinterpret_cast<char*>(output));
#else
    written = selected->convert_valid_utf16le_to_utf8(
        snapshot, consumed, reinterpret_cast<char*>(output));
#endif
    if (written < consumed || written > 3 * consumed) return TMFY_INTERNAL_ERROR;
  }
  return int32_t(uint32_t(written) | (uint32_t(consumed) << TMFY_CHARSET_UNITS_SHIFT) |
                 (status << TMFY_CHARSET_STATUS_SHIFT));
}

extern "C" int32_t tmfy_decode_utf8_utf16(const uint8_t* input, size_t length,
                                        uint8_t* output, size_t capacity) {
  if (length > TMFY_CONVERT_MAX_BYTES) return TMFY_NEEDS_GENERAL;
  if (length == 0) return 0;
  const size_t reserved = 2 * length;
  if (!valid_spans(input, length, output, capacity, reserved)) return TMFY_BAD_ARGUMENT;
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) return TMFY_NOT_INITIALIZED;
  const char* source = reinterpret_cast<const char*>(input);
  size_t written;
  if (aligned_utf16(output) && selected->validate_utf8(source, length)) {
#if SIMDUTF_IS_BIG_ENDIAN
    written = selected->convert_valid_utf8_to_utf16be(source, length, reinterpret_cast<char16_t*>(output));
#else
    written = selected->convert_valid_utf8_to_utf16le(source, length, reinterpret_cast<char16_t*>(output));
#endif
  } else {
    written = decode_replacing(input, length, output);
  }
  return written > 0 && written <= length ? int32_t(written) : TMFY_INTERNAL_ERROR;
}
